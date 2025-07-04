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

### 3. What were the total sales of appliances in Ontario?
- **SQL Query:**
```
Select Region,Product_Sub_Category, SUM(Sales) as [Total Sales of Appliances in Ontario]
from [dbo].[KMS Sql Case Study]
where Product_Sub_Category = 'Appliances'
and Province = 'Ontario'
Group by Region, Product_Sub_Category
```
- **Result**
```
| Region                   | Product_Sub_Category    | Total Sales of Appliances in Ontario |
|--------------------------|-------------------------|----------------------|
| Ontario                  | Appliances               | 202346.839630127
```

### 4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
- **SQL Query:**
```
select top 10 Customer_Name, SUM(Sales) as [Total Sales of Bottom 10]
from [dbo].[KMS Sql Case Study]
group by Customer_Name
order by [Total Sales of Bottom 10] asc
```
**Result:**
```
| Customer_Name      | Total Sales of Bottom 10    |
|-------------------|------------------------------|
| Jeremy Farry      | 85.7200021743774             |
| Natalie DeCherney | 125.900001525879             |
| Nicole Fjeld      | 153.030006408691             |  
| Katrina Edelman   | 180.760005950928             |
| Dorothy Dickinson | 198.080001831055             |
| Christine Kargatis| 293.2200050354               |
| Eric Murdock      | 343.32799911499              |
| Chris McAfee      | 350.180004119873             |
| Rick Huthwaite    | 415.819980621338             |
| Mark Hamilton     | 450.990005493164             |
```
- **Advice to Management**
- Customer Segmentation Review:
Analyze their segment (Consumer, Corporate, or Small Business).
Tailor communication and offerings accordingly.
- Targeted Promotions:
Offer personalized discounts or bundles on products they've purchased before.
- Customer Engagement Campaigns:
Use email/SMS campaigns to highlight new product arrivals, loyalty programs, or benefits of ordering more frequently.
- Feedback Collection:
Reach out for feedback to understand why their spending is low — it could reveal issues like dissatisfaction, poor delivery, or limited awareness.
- Improve Service Experience:
Ensure these customers have faster delivery, better support, or exclusive access to high-demand items.

### 5. KMS incurred the most shipping cost using which shipping method?
- **SQL Query:**
```
Select top 1 Ship_Mode, SUM(Shipping_Cost) as [Total Shipping Cost]
from [dbo].[KMS Sql Case Study]
group by Ship_Mode
order by [Total Shipping Cost]desc
```
- **Result**
```
| Hip_Mode          | Total Shipping Cost              |
|-------------------|-----------------------------------|
| Delivery Truck    | 51971.9397373199                  |
```
The analysis shows that "Delivery Truck" is the shipping method with the highest total incurred cost for KMS, amounting to ₦51,971.94. This is an important finding, especially when considering operational efficiency and profitability. While delivery trucks might be preferred for certain types of goods or routes, their cumulative cost suggests they are a significant expense. Management should further investigate the factors contributing to this high cost.

### Case Scenario II
### 6. Who are the most valuable customers, and what products or services do they typically purchase?
- **SQL Query:**
```
Select top 5 Customer_Name, Product_Category, SUM(Sales) as [Total_Sales_to_Customers]
from [dbo].[KMS Sql Case Study]
group by Customer_Name, Product_Category
order by [Total_Sales_to_Customers] desc
```
- **Result**

