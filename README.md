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
|--------------------------|-------------------------|---------------------------------------|
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
| Ship_Mode          | Total Shipping Cost              |
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
```
| customer_name       | Product_Category    | Total_Sales_to_Customers |
|---------------------|---------------------|--------------------------|
| Emily Phan          | Technology          | 110481.965362549         |
| Deborah Brumfield   | Technology          | 76795.7947387695         |
| Dennis Kane         | Technology          | 60434.642868042          |
| Jasper Cacioppo     | Technology          | 57739.271484375          |
| Clytie Kelty        | Technology          | 54454.9494018555         |
```
The most valuable customers for **Kultra Mega Stores** are **Emily Phan**, **Deborah Brumfield**, **Dennis Kane**, **Jasper Cacioppo**, and **Clytie Kelty**, based on their significant total sales contributions.
Their purchasing patterns shows **Technology Dominance**. All 5 customers bought from the **Technology** Product Category
**Recommendations for Management:**
**Tailored Offers:** For these 5 Customers KMS should continue to push new technology products, accessories, and upgrades.

### 7. Which small business customer had the highest sales?
- **SQL Query:**
```
Select top 1 Customer_Segment, Customer_Name, SUM(Sales) as [Total Sales by Small Business Customer]
from [dbo].[KMS Sql Case Study]
Where Customer_Segment = 'Small Business'
Group by Customer_Segment, Customer_Name
Order by [Total Sales by Small Business Customer] desc
```
- **Results:**
```
| customer_Segment    | Customer_Name       | Total Sales by Small Business Customer |
|---------------------|---------------------|----------------------------------------|
| Small Business      | Dennis Kane         | 75967.5932159424                       |
```
**Dennis Kane** is identified as the small business customer with the highest sales, contributing **₦75,967.59** to KMS revenue. This customer is a key asset within the small business segment. **Management** could consider reaching out to **Dennis Kane** directly to understand their needs better, offer personalized bulk discounts, or explore opportunities for upselling/cross-selling to further solidify this valuable relationship and potentially use them as a case study for attracting similar high-value small business clients.

### 8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
- **SQL Query:**
```
Select top 1 Customer_Name,Customer_Segment, Count(Distinct[Order_ID]) as [Total Orders]
from [dbo].[KMS Sql Case Study]
where Customer_Segment = 'Corporate'
and Order_Date between '2009-01-01' and '2012-12-31'
Group By Customer_Name, Customer_Segment
Order by [Total Orders] desc
```
- **Results:**
```
| customer_Name       | Customer_Segment    | Total Orders |
|---------------------|---------------------|--------------|
| Adam Hart           | Corporate           | 18           |
```
**Adam Hart** is identified as the **Corporate Customer** who placed the highest number of orders **(18)** between 2009 and 2012. This indicates **Adam Hart** is a highly engaged and consistent corporate client for **KMS**. **Management should** recognize this customer as a key relationship and explore opportunities for deepened engagement.

### 9. Which consumer customer was the most profitable one?
- **SQL Query:**
```
Select top 1 Customer_Name, Customer_Segment, Sum(Profit) as [Total Profit]
from [dbo].[KMS Sql Case Study]
where Customer_Segment='Consumer'
Group by Customer_Name, Customer_Segment
Order by [Total Profit] desc
```
- **Results:**
```
| customer_Name       | Customer_Segment    | Total Proft      |
|---------------------|---------------------|------------------|
| Emily Phan          | Consumer            | 34005.4392166138 |
```
**Emily Phan** emerges as the most profitable consumer customer for KMS, generating a total profit of **₦34,005.44.** It's noteworthy that **Emily Phan** also appeared as one of the overall most valuable customers by sales (from Question 6), reinforcing her importance to the business. This indicates a customer who not only purchases frequently but also tends to buy items with higher profit margins. **KMS** should prioritize retaining and nurturing this relationship, potentially through exclusive offers on high-margin products or personalized communication, to maximize long-term profitability.

### 10. Which customer returned items, and what segment do they belong to?
- **SQL Query:**
```
Select k.[Customer_Name], k.[Customer_Segment]
from [dbo].[KMS Sql Case Study] as k
Join [dbo].[Order_Status] as o on k.[Order_ID] = o.[Order_ID]
where o.Status = 'Returned'
```
- **Results:**
```
| Customer_Name      | Customer_Segment   |
|-------------------|---------------------|
| Aaron Bergman      | Corporate          |
| Alejandro Grove    | Consumer           |
| Becky Pak          | Corporate          |  
| Barry Blumstein   | Small Business      |
| Amy Cox            | Home Office        |
```
**The query** returned **419 unique customers** who have returned items. These customers belong to various segments including:
**Home Office
Corporate
Small Business
Consumer**

A substantial number of customers, totaling **419 individuals/entities,** have returned items to KMS. These returns are not isolated to a single customer segment but are observed across **Home Office, Corporate, Small Business, and Consumer segments.** This indicates a widespread issue or characteristic behavior rather than a segment-specific problem.

**Recommendations for Management:**
- **Investigate Root Causes:** KMS should delve deeper into the reasons for these returns. Is it due to product quality issues, incorrect orders, late deliveries, product not meeting expectations, or complex return policies?
- **Return Policy Review:** Evaluate the existing return policy to ensure it is clear, fair, and not inadvertently encouraging returns.
- **Feedback Loop:** Implement a system to capture feedback from customers during the return process to continuously improve products, services, and fulfillment.

### 11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer

- **SQL Query:**
```
Select [Order_Priority], [Ship_Mode],
Count(Order_ID) as Order_Count,
Sum(Sales-Profit) as Estimated_Shipping_Cost,
AVG(DATEDIFF(DAY,[Order_Date], [Ship_Date])) as Avg_Ship_days
from [dbo].[KMS Sql Case Study]
group by [Order_Priority], [Ship_Mode]
Order by [Order_Priority], [Ship_Mode] desc
```
- **Results:**
```
| order_priority  | ship_mode      | Order_count | Estimated_Shipping_Cost | Avg_Ship_Days |
-----------------|----------------+----------------------------------+----------------------
| Critical       | Regular Air    | 1180         | 1118847.32336611        | 1              |
| Critical       | Express Air    | 200          | 197985.038040757        | 1              |
| Critical       | Delivery Truck | 228          | 1218333.84630966        | 1              |
| High           | Regular Air    | 1308         | 1306958.06368603        | 1              |
| High           | Express Air    | 212          | 201587.179233134        | 1              |
| High           | Delivery Truck | 248          | 1338507.98574829        | 1              |
| Low            | Regular Air    | 1280         | 1360358.0190005         | 4              |
| Low            | Express Air    | 190          | 190542.17304574         | 4              |
| Low            | Delivery Truck | 250          | 1313686.1846962         | 3              |
| Medium         | Regular Air    | 1225         | 1260247.41572989        | 1              |
| Medium         | Express Air    | 201          | 244815.386566758        | 1              |
| Medium         | Delivery Truck | 205          | 969386.532740116        | 1              |
| Not Specified  | Regular Air    | 1277         | 1257789.80428584        | 1              |
| Not Specified  | Express Air    | 180          | 194378.255207673        | 1              |
| Not Specified  | Delivery Truck | 215          | 1080831.58942413        | 1              |
```
Based on the analysis, it appears that **KMS** is **NOT optimally** or appropriately spending **shipping costs** based on **Order Priority,** particularly for high-priority orders.
- **Key Observations:**
    **- Mismatch for High and Critical Priorities:**  For both "Critical" and "High" priority orders, the **Delivery Truck (described as the slowest and most economical method)** consistently **incurs the highest total shipping cost.** This is counter-intuitive for urgent orders, where **speed should theoretically outweigh cost-per-shipment considerations.**
    - **The fastest and most expensive method, Express Air,** consistently has the **lowest total shipping cost and the lowest number of orders** across all priority levels, including "Critical" and "High". This strongly suggests it is being underutilized for urgent shipments, where its speed would be most beneficial, despite its higher individual cost.

**Conclusion and Recommendations:** The current spending pattern indicates a potential disconnect between stated order priority and the chosen shipping method. KMS might be sacrificing delivery speed for urgent orders to save on per-shipment costs, which could negatively impact customer satisfaction for critical deliveries.
Management Should:
  Management should:
    - **Review Shipping Policies:** Establish clearer guidelines for selecting shipping methods based on Order Priority, ensuring that "Critical" and "High" priority orders are      
        consistently routed via faster (even if individually more expensive) options like "Express Air."
    - **Cost-Benefit Analysis for Urgency:** Conduct a detailed cost-benefit analysis comparing the increased shipping cost of "Express Air" for critical orders against the potential 
      loss of customer satisfaction, repeat business, or contractual penalties due to slow delivery.
    - **Optimize Delivery Truck Use:** While economical, if "Delivery Truck" has the highest total cost for urgent orders, it may indicate inefficiencies in routing, capacity 
      utilization, or a need to shift some of these urgent orders to faster, irrespective of the pricing modes.
