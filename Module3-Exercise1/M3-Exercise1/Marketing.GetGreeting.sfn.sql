CREATE FUNCTION Marketing.GetGreeting(@FirstName VARCHAR(MAX), @LastName VARCHAR(MAX))
RETURNS Varchar(100)
AS
BEGIN
	RETURN 'Dear ' + LEFT(TRIM(@FirstName),1) + '. ' + TRIM(@LastName);
END