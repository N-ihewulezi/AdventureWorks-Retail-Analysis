# Data Dictionary - AdventureWorks Retail Analysis
This document defines the key fields and business logic used in the dataset and dashboards
Tables and Fields
1. FactSales (Sales Transactions Table)
| Column Name   | Description                                  |
| ------------- | -------------------------------------------- |
| SalesOrderID  | Unique identifier for each sales transaction |
| OrderDate     | Date the order was placed                    |
| CustomerID    | Unique ID of the customer                    |
| ProductID     | Unique ID of the product sold                |
| OrderQuantity | Number of units sold per transaction         |
| UnitPrice     | Selling price per unit                       |
| TotalRevenue  | Total sales value (Quantity × Unit Price)    |
| TotalCOGS     | Total cost of goods sold                     |
| Profit        | Revenue minus COGS                           |
| ProfitMargin  | Profit as a percentage of revenue            |

2. DimProduct (Product Dimension Table)
| Column Name     | Description                             |
| --------------- | --------------------------------------- |
| ProductID       | Unique identifier for each product      |
| ProductName     | Name of the product                     |
| ProductCategory | Category (Accessories, Bikes, Clothing) |
| Color           | Product color                           |
| StandardCost    | Cost price of product                   |
| ListPrice       | Retail selling price                    |

3. DimCustomer (Customer Dimension Table)
| Column Name  | Description                            |
| ------------ | -------------------------------------- |
| CustomerID   | Unique customer identifier             |
| CustomerName | Full name of customer                  |
| Gender       | Customer gender                        |
| Age          | Age of customer                        |
| AgeGroup     | Grouped age segment (e.g., 40–44, 50+) |
| Country      | Customer country                       |

4. DimDate (Date Dimension Table)
| Column Name | Description                       |
| ----------- | --------------------------------- |
| Date        | Calendar date                     |
| Year        | Year of transaction               |
| Month       | Month name                        |
| MonthNumber | Numeric month value               |
| Quarter     | Fiscal quarter (Q1–Q4)            |
| Weekday     | Day of the week                   |
| WeekType    | Weekday or Weekend classification |


Derived Measures (Calculated Fields)
| Measure              | Description                                     |
|  |
| Total Revenue        | Sum of all sales revenue                        |
| Total Profit         | Total Revenue minus Total COGS                  |
| Profit Margin %      | Profit divided by Revenue                       |
| Transaction Count    | Number of sales orders                          |
| Top 5 Contribution % | Share of top products/customers in total profit |

Your DAX measures look great! They are mathematically sound and follow Power BI best practices—specifically using DISTINCTCOUNT for customers and DIVIDE to prevent errors.
To keep your documentation consistent, you should add these technical formulas to a new section in your Data_Dictionary.md or a separate Measures.md file.
Here is the formatted table for your GitHub:
## DAX Measures & Calculations

| Measure              | Description           | DAX Formula                                   |
|----------------------|-----------------------------------------------------------------------|
| #Customers           | Unique customer count | DISTINCTCOUNT(FactInternetSales[CustomerKey]) |
| #Transaction         | Total number of sales | COUNTROWS(FactInternetSales)                  |
| % Profit Margin      | Efficiency of sales   | DIVIDE([Total Profit], [Total Revenue], 0)    |
| All Products         | Total inventory count | COUNTROWS(DimProduct)                         |
| Average Customer Age | Demographic insight   | AVERAGE(DimCustomer[Customer Age])            |
| COGS                 | Cost of Goods Sold    | SUM(FactInternetSales[ProductCost])           |
| Sold Products        | Unique products sold  | DISTINCTCOUNT(FactInternetSales[ProductKey])  |
| Total Profit         | Final financial surplus SUM(FactInternetSales[Profit])                |
| Total Revenue        | Top-line sales        | SUM(FactInternetSales[Revenue])               |
| Unsold               | Stock not moved       | [All Products] - [Sold Products]              |

------------------------------
📌 Notes
Data was sourced from Microsoft SQL Server
Transformed using Excel Power Query
Used for interactive dashboard analysis (KPIs, trends, segmentation)
