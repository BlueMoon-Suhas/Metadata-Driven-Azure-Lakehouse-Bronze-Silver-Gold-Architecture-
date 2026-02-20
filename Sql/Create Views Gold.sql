-- create view calenderr

create view gold.calendar
as 
(select * from OPENROWSET(bulk 'https://awprojectstorageaccount.blob.core.windows.net/silver/AdventureWorks_Calendar/', 
format = 'parquet')as quer1) 

-- customers view 
create view gold.Customers
as 
(select * from OPENROWSET(bulk 'https://awprojectstorageaccount.blob.core.windows.net/silver/AdventureWorks_Customers/', 
format = 'parquet')as quer1) 

--product view 
create view gold.Product
as 
(select * from OPENROWSET(bulk 'https://awprojectstorageaccount.blob.core.windows.net/silver/AdventureWorks_Product/', 
format = 'parquet')as quer1) 



-- return view
create view gold.AWReturn
as 
(select * from OPENROWSET(bulk 'https://awprojectstorageaccount.blob.core.windows.net/silver/AdventureWorks_Return/', 
format = 'parquet')as quer1) 
-- sales view 
create view gold.Sales
as 
(select * from OPENROWSET(bulk 'https://awprojectstorageaccount.blob.core.windows.net/silver/AdventureWorks_Sales/', 
format = 'parquet')as quer1) 


-- sub cat view 

create view gold.Subcategory
as 
(select * from OPENROWSET(bulk 'https://awprojectstorageaccount.blob.core.windows.net/silver/AdventureWorks_Subcategory/', 
format = 'parquet')as quer1) 



-- territory view 
create view gold.Territories
as 
(select * from OPENROWSET(bulk 'https://awprojectstorageaccount.blob.core.windows.net/silver/AdventureWorks_Territories/', 
format = 'parquet')as quer1) 