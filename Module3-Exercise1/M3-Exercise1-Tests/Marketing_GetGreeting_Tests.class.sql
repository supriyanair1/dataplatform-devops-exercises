EXEC tSQLt.NewTestClass 'Marketing_GetGreeting_Tests';
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test salutation for a simple first and last name]
AS
BEGIN

Declare @expectedSalutation VARCHAR(100);
Declare @actualSalutation Varchar(100);

Select @actualSalutation = (Marketing.GetGreeting('Supriya','Nair'));
Set @expectedSalutation = 'Dear S. Nair'

  EXEC tSQLt.AssertEquals @expectedSalutation ,@actualSalutation;
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test salutation for spaces in first name at the end]
AS
BEGIN

Declare @expectedSalutation VARCHAR(100);
Declare @actualSalutation Varchar(100);

Select @actualSalutation = (Marketing.GetGreeting(' Paul','Kardash'));
Set @expectedSalutation = 'Dear P. Kardash'

  EXEC tSQLt.AssertEquals @expectedSalutation ,@actualSalutation;
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test salutation for spaces everywhere]
AS
BEGIN

Declare @expectedSalutation VARCHAR(100);
Declare @actualSalutation Varchar(100);

Select @actualSalutation = (Marketing.GetGreeting(' Paul    ','     Kardash   '));
Set @expectedSalutation = 'Dear P. Kardash'

  EXEC tSQLt.AssertEquals @expectedSalutation ,@actualSalutation;
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test salutation for spaces everywhere and no Fisrt name]
AS
BEGIN

Declare @expectedSalutation VARCHAR(100);
Declare @actualSalutation Varchar(100);

Select @actualSalutation = (Marketing.GetGreeting('   ','     Kardash   '));
Set @expectedSalutation = 'Dear . Kardash'

  EXEC tSQLt.AssertEquals @expectedSalutation ,@actualSalutation;
END
GO