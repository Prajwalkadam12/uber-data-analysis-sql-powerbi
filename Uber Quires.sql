-- Created DataBase With Name Ola 
create Database ola;

-- Using DataBase Ola
use ola;


-- Writing Schemas for the Data queries

-- 1.Retrive all successful bookings 
Create view Successful_Bookings as
select * 
from bookings
where booking_status ="Success";


-- 2.Find the average ride distance for each vehicle type
Create view Average_Distance_Ride as
Select Vehicle_Type , AVG(Ride_Distance) as avg_distance
from bookings
group by vehicle_Type;


-- 3.Get Total Number of cancled ride by customers;
-- When The Column for the canceled ride is Given
create View Canceled_Ride_By_Customer as
Select count(Canceled_Rides_by_Customer) as Ride_Canceled_By_Customers
From bookings;

-- when only status column is provided
create view Customer_Who_Canceled_Rides as
select count(*) 
from bookings
where Booking_Status ="Canceled by Customer";



-- 4.List the Top 5 customers who bookied the highest numbers of rides
Create View Top_Customers as
select Customer_Id , count(Booking_Id) as Top_Customers
from bookings
group by Customer_Id
Order by Top_Customers Desc limit 5;


-- 5.Get the Number of rides cancled by drivers due to personal and car_related issues.
Create View Canceled_Ride_by_Drivers_For_Personal_Reason as
select Count(*)
from bookings 
where Canceled_Rides_by_Driver ='Personal & Car related issue';


-- 6.Find Maximum and minimum driver ratings for Prime Sedan Bookings
Create View Max_Min_Drivers_Ratings as
Select max(Driver_Ratings) as max_driver_rating , min(Driver_Ratings) as min_driver_rating
from bookings
where vehicle_type="Prime Sedan";



-- 7.Retrive all rides where payment mode using upi
Create view Ride_Payment_with_upi as
select *
from bookings 
where payment_method ="UPI";



-- 8.Find the average customer rating per vehicle type
Create view Customer_Rating_PerType_Vehicle as
select avg(Customer_Rating), Vehicle_Type
from bookings
Group by Vehicle_Type;


-- 9.Calculate the total booking value of rides completed successfully
Create View Total_Successful_Rides_value as
select sum(Booking_Value) as total_successful_ride_value
from bookings
where booking_Status ='Success';


-- 10. List all the incomplete rides along with the reason
Create View Incomplete_Rides_With_Reason as
select Booking_id, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides ='Yes';



-- Created schemas for the query. Now running them to generate the output.
-- 1.
Select * from Successful_Bookings;

-- 2. 
Select * from Average_Distance_Ride;

-- 3(a).
select * from Canceled_Ride_By_Customer;
-- (b)
 select * from Customer_Who_Canceled_Rides;
 
-- 4.
select * from Top_Customers;

-- 5.
select * from Canceled_Ride_by_Drivers_For_Personal_Reason;

-- 6.
select * from Max_Min_Drivers_Ratings;

-- 7.
select * from Ride_Payment_with_upi ;

-- 8.
select * from Customer_Rating_PerType_Vehicle;

-- 9.
select * from Total_Successful_Rides_value;

-- 10.
select * from Incomplete_Rides_With_Reason;
