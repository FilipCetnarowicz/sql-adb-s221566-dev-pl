CREATE FUNCTION Student_6.ufn_ProductWithNewPriceOverview
(
    @ProductJson NVARCHAR(MAX)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductID,
        p.Name,
		JSON_VALUE(@ProductJson, '$.ListPrice') AS NewPriceForCustomers,
		p.StandardCost as WithoutMargin,
        Student_6.ufn_IsPriceHigherThanCurrent(@ProductJson) AS IsHigherThanBefore
    FROM SalesLT.Product as p
	WHERE p.ProductID = JSON_VALUE(@ProductJson, '$.ProductID')
);
