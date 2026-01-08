
CREATE   PROCEDURE dbo.usp_MinimalCustomerInsert
    @FirstName dbo.Name,
    @LastName F6_surname.Surname,
    @EmailAddress nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; 

    IF dbo.ufn_IsAlreadyAdded(@FirstName, @LastName, @EmailAddress) = 1 
        THROW 50003, 'already assigned', 1;

    INSERT INTO [221566].Customer (FirstName, LastName, EmailAddress, PasswordHash, PasswordSalt) VALUES
    (@FirstName,@LastName,@EmailAddress,'hash','salt');
END;
