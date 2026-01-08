
CREATE PROCEDURE dbo.usp_MinimalCustomerUpdate
    @CustomerID int,
    @FirstName dbo.Name,
    @LastName F6_surname.Surname,
    @EmailAddress nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; 

    BEGIN TRY
        BEGIN TRAN
            IF NOT EXISTS (
                SELECT *
                FROM [221566].Customer
                WHERE CustomerID = @CustomerID
            ) THROW 50004, 'record with such CustomerID dont exist', 1;

            UPDATE [221566].Customer
            SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress
            WHERE CustomerID = @CustomerID;
            
        COMMIT TRAN;
    END TRY
    
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;

        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrNum INT = ERROR_NUMBER();
        THROW @ErrNum, @ErrMsg, 1;
    END CATCH
END;
