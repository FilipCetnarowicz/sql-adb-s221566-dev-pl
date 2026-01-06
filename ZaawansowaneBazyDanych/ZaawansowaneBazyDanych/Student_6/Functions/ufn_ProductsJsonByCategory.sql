
-- jako dodatkowe parametry wybrałem cenę aktualną i standardową
CREATE FUNCTION Student_6.ufn_ProductsJsonByCategory
(
	@CategoryName NVARCHAR(50)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Result NVARCHAR(MAX);

	SELECT @Result = (
		SELECT pc.Name as CategoryName, p.ProductID, p.Name, p.ListPrice, p.StandardCost
		FROM SalesLT.ProductCategory AS pc JOIN SalesLT.Product as p
		ON pc.ProductCategoryID = p.ProductCategoryID
		WHERE pc.Name = @CategoryName
		FOR JSON PATH
	);

	RETURN @Result;
END;
