EXEC tSQLt.NewTestClass 'LostAndFound_CalculateShipping_Tests';
GO

CREATE PROCEDURE LostAndFound_CalculateShipping_Tests.[test hotel and shipping state equal]
AS
BEGIN
	DECLARE @ExpectedShippingCost INT;
	DECLARE @ActualShippingCost INT;

	SELECT @ActualShippingCost = (LostAndFound.CalculateShipping('AL','AL'));

	SET @ExpectedShippingCost = 10;

	EXEC tSQLt.AssertEquals @ExpectedShippingCost, @ActualShippingCost;
END
GO

CREATE PROCEDURE LostAndFound_CalculateShipping_Tests.[test hotel and shipping state different]
AS
BEGIN
	DECLARE @ExpectedShippingCost INT;
	DECLARE @ActualShippingCost INT;

	SELECT @ActualShippingCost = (LostAndFound.CalculateShipping('AL','LA'));

	SET @ExpectedShippingCost = 25;

	EXEC tSQLt.AssertEquals @ExpectedShippingCost, @ActualShippingCost;
END
GO