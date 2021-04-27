Create Function HandlingCosts.Calculatehandling
(
@rewards int)
returns int
As
Begin
If @rewards > 10000
return 0
return 37
end
Go