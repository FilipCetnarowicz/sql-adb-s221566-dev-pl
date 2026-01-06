
CREATE FUNCTION Student_6.ufn_IsPriceHigherThanCurrent
(
    @ProductJson NVARCHAR(MAX)
)
RETURNS NVARCHAR(5)
AS
BEGIN
    DECLARE @ProductID INT = JSON_VALUE(@ProductJson, '$.ProductID');
	DECLARE @PriceToCompare MONEY = JSON_VALUE(@ProductJson, '$.ListPrice');
	DECLARE @CurrentPrice MONEY;
	
	SELECT @CurrentPrice = ListPrice
    FROM SalesLT.Product
    WHERE ProductID = @ProductID;

    RETURN
        CASE
            WHEN @PriceToCompare > @CurrentPrice THEN N'true'
            ELSE N'false'
        END;
END;
