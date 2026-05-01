# AdventureWorks-Retail-Analysis
End-to-end Retail Analysis of 3 years of AdventureWorks sales data. Features custom SQL data engineering (ETL), Power Query transformations, and interactive Excel/Power BI dashboards for profitability and marketing insights.

1. Project Overview
This project delivers an end-to-end business intelligence solution analysing 3 years of AdventureWorks sales data ($39.8M Revenue).
I transformed a static database into an interactive strategic tool using SQL Server for complex data engineering and Excel/Power BI for high-level dashboarding.
The final analysis highlights key profit drivers and seasonal trends to help Marketing, Finance, and Sales make data-driven decisions.

2. The Challenge:
Data Enhancement (ETL)Upon initial inspection, the raw dataset contained a uniform OrderQuantity of 1.
To create a realistic retail scenario, I performed Synthetic Data Enhancement directly in the SQL database:
Logic-Based Simulation: Used CASE statements and NEWID() to generate category-specific order quantities (e.g., 1-5 for Accessories,
 1-for Clothing).
Data Integrity: Recalculated dependent financial columns (SalesAmount, TotalProductCost, Tax, and Freight) within a BEGIN TRANSACTION block.
Validation: Verified calculated fields against raw inputs using a QA query before committing changes to ensure a 100% accurate data foundation.
  
3. Technical Toolkit
SQL Server:
Database updates, complex joins, and USD currency normalisation.
Microsoft Excel: Power Query transformations, Pivot Modelling, and KPI design.
DAX measures, star-schema modelling, and interactive visualisation.

4. Key Business Insights:
Operational Efficiency:
Identified that 72.2% of total profit is generated on weekdays, suggesting opportunities for optimised mid-week staffing and logistics.
Seasonality: Pinpointed a 30% profit surge in Q4 ($5.01M), providing a roadmap for inventory stockpiling and seasonal promotional timing.
High-Value Demographics: Discovered that the 50+ age group contributes over 83% of total profit, allowing Marketing Directors to refine customer segmentation and improve ad spend ROI.
Profitability Analysis: Maintained a granular view of a 41.9% overall profit margin across 397 available products.

5. Advanced Business Logic (DAX)I authored custom DAX measures to extract deeper business meaning from the dataset:
 -- Dynamic Profit Margin %
Profit Margin % = DIVIDE([Total Sales] - [Total Cost], [Total Sales], 0)

-- Weekpart Classification
Day Type = IF(WEEKDAY(Sales[OrderDate], 2) > 5, "Weekend", "Weekday")

-- Customer Segmentation Share
% of Total Profit = DIVIDE([Total Profit], CALCULATE([Total Profit], ALL(ProductCategory)))

6. Repository Structure
📂 01_SQL_Scripts: SQL code for data cleaning and OrderQuantity updates.
📂 02_Data_Model_&_Dashboards: The final Excel Workbook file dashboard screenshots.
📂 03_Documentation: Detailed Data Dictionary and Measure definitions.

About the Author 
Nkechi Ihewulezi 
Data Analyst | Microsoft Certified: Power BI Data Analyst Associate
I am looking for an internship or entry-level role to apply my technical skills to real-world business challenges.
🔗 Connect with me on LinkedIn:https://www.linkedin.com/in/nkechi-ihewulezi/
