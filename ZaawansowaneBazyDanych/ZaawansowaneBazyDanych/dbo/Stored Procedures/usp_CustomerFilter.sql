
CREATE PROCEDURE dbo.usp_CustomerFilter
    @CustomerID int = NULL,
    @FirstName dbo.Name = NULL,
    @LastName F6_surname.Surname = NULL,
    @EmailAddress nvarchar(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL nvarchar(max) =
    N'SELECT *
    FROM [221566].Customer
    WHERE 1=1';
    IF @CustomerID IS NOT NULL
        SET @SQL += N' AND CustomerID = @CustomerID';
    IF @FirstName IS NOT NULL
        SET @SQL += N' AND FirstName = @FirstName';
    IF @LastName IS NOT NULL
        SET @SQL += N' AND LastName = @LastName';
    IF @EmailAddress IS NOT NULL
        SET @SQL += N' AND EmailAddress = @EmailAddress';
    
    DECLARE @params nvarchar(max) = N'@CustomerID int, @FirstName dbo.Name, @LastName F6_surname.Surname, @EmailAddress nvarchar(50)';
    EXEC sp_executesql @SQL, 
        @params, 
        @CustomerID, @FirstName, @LastName, @EmailAddress;
END;
