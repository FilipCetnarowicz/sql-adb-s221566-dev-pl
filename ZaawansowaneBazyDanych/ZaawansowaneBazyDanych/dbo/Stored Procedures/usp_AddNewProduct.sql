
CREATE PROCEDURE dbo.usp_AddNewProduct
    @ProductName nvarchar(100),
    @Category nvarchar(100),
    @UnitPrice money,
    @Quantity int
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; 
    
     IF @UnitPrice <= 0
        THROW 51000, 'UnitPrice must be greater than 0', 1;
     
     IF @UnitPrice > 50000
        THROW 51100, 'Too expensive', 1;
        
     IF @Quantity < 0
        THROW 52000, 'Quantity must be equal to or greater than 0', 1;
        
     IF @Quantity > 10000
        THROW 52100, 'Its impossible ammount, you made a mistake', 1;


    BEGIN TRY
        BEGIN TRAN
           INSERT INTO dbo.Product (ProductName, Category, UnitPrice)
           VALUES (@ProductName, @Category, @UnitPrice);

           DECLARE @ProductID int = SCOPE_IDENTITY();

           INSERT INTO dbo.ProductInventory (ProductID, Quantity)
           VALUES (@ProductID, @Quantity);
        COMMIT TRAN;
    END TRY
    
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;

        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrNum INT = ERROR_NUMBER();
        THROW @ErrNum, @ErrMsg, 1;
    END CATCH
END;
