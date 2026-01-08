
CREATE FUNCTION dbo.ufn_IsAlreadyAdded
(
    @FirstName dbo.Name,
    @LastName F6_surname.Surname,
    @EmailAddress nvarchar(50)
)
RETURNS BIT 
AS
BEGIN
    DECLARE @Result BIT = 0;
    IF EXISTS (
        SELECT *
        FROM [221566].Customer
        WHERE FirstName = @FirstName and LastName = @LastName and EmailAddress = @EmailAddress
    )
    SET @Result = 1;
    
    RETURN @Result;
END;
