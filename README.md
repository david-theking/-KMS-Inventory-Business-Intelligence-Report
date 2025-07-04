# KMS-Inventory-Business-Intelligence-Report
Business intelligence report for a KMS Inventory a Retail Supply Company company using SQL queries

# Project Overview
Kultra Mega Stores (KMS), headquartered in Lagos, specialises in offi ce supplies and furniture. Its customer base includes individual consumers, small businesses (retail), and large corporate clients (wholesale) across Lagos, Nigeria.
You have been engaged as a Business Intelligence Analyst to support the Abuja division of KMS. The Business Manager has shared an Excel fi le containing order data from 2009 to 2012 and has requested that you analyze the data and present your key insights and findings.

## Case Scenario I
### Question 1: Which product category had the highest sales?
- SQL Query

```
select 
Product_Category, SUM(Sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Product_Category
Order by [Total Sales] desc
```
