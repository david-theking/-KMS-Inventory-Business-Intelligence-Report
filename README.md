# KMS-Inventory-Business-Intelligence-Report
Business intelligence report for a KMS Inventory a Retail Supply Company company using SQL queries

# Project Overview
Kultra Mega Stores (KMS), headquartered in Lagos, specialises in offi ce supplies and furniture. Its customer base includes individual consumers, small businesses (retail), and large corporate clients (wholesale) across Lagos, Nigeria.
You have been engaged as a Business Intelligence Analyst to support the Abuja division of KMS. The Business Manager has shared an Excel fi le containing order data from 2009 to 2012 and has requested that you analyze the data and present your key insights and findings.

## Case Scenario I
### Question 1: Which product category had the highest sales?
- **SQL Query**

```
select 
Product_Category, SUM(Sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Product_Category
Order by [Total Sales] desc
```
- **Result:**
```
| Product_Category  | Total_Sales                       |
|-------------------|-----------------------------------|
| Technology	      | 5984248.18                        |
```

The analysis reveals that "Technology" is the leading product category in terms of sales, generating a significant total revenue of ₦5,984,248.18

### Question 2: What are the Top 3 and Bottom 3 regions in terms of sales?
- **SQL Query: Top 3 Regions**
```
select top 3 Region, SUM(Sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Region
order by [Total Sales] desc
```
- **Result: (Top 3 Regions)**
```
| Region            | Total Sales               |
|-------------------|---------------------------|
| West              | 3597549.269871            |
| Ontario           | 3063212.47638369          |
| Prarie            | 2837304.60503292          |
```

- **SQL Query: Bottom 3 Regions**
```
select top 3 Region, SUM(Sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Region
Order by [Total Sales] asc
```
- **Result: (Bottom 3 Regions)**:
```
| Region                   | Total Sales              |
|-------------------------|---------------------------|
| Nunavut                 | 116376.48383522           |
| Northwest Territories   | 800847.330903053          |
| Yukon                   | 975867.375723362          |
```
The sales analysis by region highlights significant disparities in revenue generation across different geographical areas. The "West," "Ontario," and "Prarie" regions are clearly the top performers, contributing the most to overall sales. This suggests strong market presence and customer base in these areas.

Conversely, "Nunavut," "Northwest Territories," and "Yukon" represent the bottom three regions in terms of sales. Their significantly lower sales figures indicate either a weaker market penetration, lower population density, or specific logistical/economic challenges.
