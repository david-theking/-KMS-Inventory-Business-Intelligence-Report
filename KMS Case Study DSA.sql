Create Database KMS_DB_CaseStudy
Select * from [KMS Sql Case Study]

----- Question 1: Which product category had the highest sales?
select Product_Category, SUM(Sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Product_Category
Order by [Total Sales] desc
---- Technology is the Product Category with the highest Sales (5984248.18)

---- Question 2: What are the Top 3 and Bottom 3 regions in terms of sales?
--- Top 3 Regions
select top 3 Region, SUM(Sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Region
order by [Total Sales] desc
--- The top 3 Regions in terms of Sales are West (3597549.27), Ontario (3063212.48) and Prarie (2837304.61)

---- Bottom 3 Regions
select top 3 Region, SUM(Sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Region
Order by [Total Sales] asc
---- The bottom 3 Regions in terms of Sales are Nunavut(116376.48), Northwest Territories(800847.33) and Yukon(975867.38)

----- Question 3: What were the total sales of appliances in Ontario?
Select Region,Product_Sub_Category, SUM(Sales) as [Total Sales of Appliances in Ontario]
from [dbo].[KMS Sql Case Study]
where Product_Sub_Category = 'Appliances'
and Province = 'Ontario'
Group by Region, Product_Sub_Category
---- The total Sales of Appiances in Ontario were 202346.84

---- Question 4: Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
select top 10 Customer_Name, SUM(Sales) as [Total Sales of Bottom 10]
from [dbo].[KMS Sql Case Study]
group by Customer_Name
order by [Total Sales of Bottom 10] asc
---

---- Question 5: KMS incurred the most shipping cost using which shipping method?
Select top 1 Ship_Mode, SUM(Shipping_Cost) as [Total Shipping Cost]
from [dbo].[KMS Sql Case Study]
group by Ship_Mode
order by [Total Shipping Cost]desc

---- KMS incurred the most shipping cost using Delivery Truck Shipping Method (51971.94)

---- Question 6: Who are the most valuable customers, and what products or services do they typically purchase?
Select top 5 Customer_Name, Product_Category, SUM(Sales) as [Total_Sales_to_Customers]
from [dbo].[KMS Sql Case Study]
group by Customer_Name, Product_Category
order by [Total_Sales_to_Customers] desc
--- The top 5 most valuable Customers are: Emily Phan, Deborah Brumfield, Dennis Kane, Jasper Cacioppo and Clytie Kelty
--- They all purchased products from the Technology Category

----Question 7: Which small business customer had the highest sales?
Select top 1 Customer_Segment, Customer_Name, SUM(Sales) as [Total Sales by Small Business Customer]
from [dbo].[KMS Sql Case Study]
Where Customer_Segment = 'Small Business'
Group by Customer_Segment, Customer_Name
Order by [Total Sales by Small Business Customer] desc
---- The small business customer with the highest Sales is Dennis Kane(75967.59)

---- Question 8: Which Corporate Customer placed the most number of orders in 2009 – 2012?
Select top 1 Customer_Name,Customer_Segment, Count(Distinct[Order_ID]) as [Total Orders]
from [dbo].[KMS Sql Case Study]
where Customer_Segment = 'Corporate'
and Order_Date between '2009-01-01' and '2012-12-31'
Group By Customer_Name, Customer_Segment
Order by [Total Orders] desc

---- The Corporate Customer that placed the most number of orders in 2009 - 2012 is Adam Hart(18 orders)

---- Question 9: Which consumer customer was the most profitable one?
Select top 1 Customer_Name, Customer_Segment, Sum(Profit) as [Total Profit]
from [dbo].[KMS Sql Case Study]
where Customer_Segment='Consumer'
Group by Customer_Name, Customer_Segment
Order by [Total Profit] desc

---- The Most Profitable Consumer Customer is Emily Phan with a total profit of 34005.44

---- Question 10:Which customer returned items, and what segment do they belong to?
--- We would need the Order Status Dataset for this particular question
Select * from dbo.order_Status

Select Distinct k.[Customer_Name], k.[Customer_Segment]
from [dbo].[KMS Sql Case Study] as k
Join [dbo].[Order_Status] as o on k.[Order_ID] = o.[Order_ID]
where o.Status = 'Returned'

Select k.Customer_Name, k.Customer_Segment
From
[dbo].[KMS Sql Case Study] as k
Join
[dbo].[Order_Status] as o on k.Order_ID = o.Order_ID
Where
o.Status = 'Returned'

----- Question 11 If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the
------ most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority?

Select [Order_Priority], [Ship_Mode],
Count(Order_ID) as Order_Count,
Sum(Sales-Profit) as Estimated_Shipping_Cost,
AVG(DATEDIFF(DAY,[Order_Date], [Ship_Date])) as Avg_Ship_days
from [dbo].[KMS Sql Case Study]
group by [Order_Priority], [Ship_Mode]
Order by [Order_Priority], [Ship_Mode] desc