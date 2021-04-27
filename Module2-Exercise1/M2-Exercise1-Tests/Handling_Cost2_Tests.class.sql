Exec tsqlt.NewTestclass 'handlingcosts_tests'
Go


Create procedure handlingcosts_tests.[test if the value has more than 10000]
as
Begin
Declare @expectedhandlingcost Int;
Declare @actualHandlingCost int;

select @actualHandlingCost = (select HandlingCosts.Calculatehandling(25000));
set @expectedhandlingcost = 0
Exec tsqlt.assertequals @expectedhandlingcost, @actualHandlingCost
end
Go

Create procedure Handlingcosts_tests.[test customer who has less than 10000]
as 
begin
	Declare @expectedhandlingCost int
	Declare @actualHandlingCost int;

select @actualHandlingCost = (select HandlingCosts.Calculatehandling(500));
set @expectedhandlingcost = 0
Exec tsqlt.assertequals @expectedhandlingcost, @actualHandlingCost;
end
Go

