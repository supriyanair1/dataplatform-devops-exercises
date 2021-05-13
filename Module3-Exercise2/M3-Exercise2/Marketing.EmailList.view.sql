Create view Marketing.EmailList as
select
Customerid,
FirstName,
LastName,
Email,
OptIn 
from Booking.Customers where OptIn = 1