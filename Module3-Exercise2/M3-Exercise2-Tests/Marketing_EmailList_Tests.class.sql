EXEC tSQLt.NewTestClass 'Marketing_EmailList_Tests';
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test the view for Customers with optIn 1]
AS
BEGIN


Exec tsqlt.fakeTable 'Booking.Customers';

Insert into Booking.Customers (CustomerID, FirstName,LastName,Email,OptIn)
Values(2,'Supriya','Nair','supriya.anir@gmail.com',1);

select CustomerID,FirstName,LastName,Email,OptIn into Actual
From Marketing.EmailList;


Select 
2 As CustomerId,
'Supriya' As FirstName,
'Nair' As Lastname,
'supriya.anir@gmail.com' AS Email,
1 as OptIn
into Expected

Exec tsqlt.assertEqualstable Expected,Actual;
END
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test opted in with non opted in]
AS
BEGIN
	DECLARE @ActualNumbersOptendIn NUMERIC(2,0)
	SET @ActualNumbersOptendIn = (SELECT COUNT( CustomerId) FROM Marketing.EmailList WHERE OptIn =1 )
	EXEC tSQLt.AssertEquals @Expected =10, @Actual = @ActualNumbersOptendIn;

END
GO