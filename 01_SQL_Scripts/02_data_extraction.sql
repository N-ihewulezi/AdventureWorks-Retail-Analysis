
--- extract data from Dimfactinternetsales / convert to USD
SELECT 
    f.OrderDateKey,
    f.CustomerKey,
    f.ProductKey,
    f.SalesTerritoryKey,
    f.CurrencyKey,
    f.OrderQuantity,
    f.UnitPrice,
    f.ProductStandardCost,
    f.TotalProductCost,
    f.SalesAmount,
    f.OrderDate,
    cr.AverageRate,
    ROUND(f.UnitPrice        / cr.AverageRate, 2) AS UnitPriceUSD,
    ROUND(f.SalesAmount       / cr.AverageRate, 2) AS SalesAmountUSD,
    ROUND(f.TotalProductCost  / cr.AverageRate, 2) AS TotalProductCostUSD,
    ROUND(f.ProductStandardCost / cr.AverageRate, 2) AS ProductStandardCostUSD,
    DATEDIFF(DAY, f.OrderDate, f.ShipDate)         AS DaysToShip,
    DATEDIFF(DAY, f.OrderDate, f.DueDate)          AS DaysToDue
FROM FactInternetSales f
JOIN DimCurrency dc 
    ON f.CurrencyKey = dc.CurrencyKey
JOIN FactCurrencyRate cr 
    ON f.CurrencyKey = cr.CurrencyKey 
    AND f.OrderDateKey = cr.DateKey
WHERE f.OrderDate >= '2011-01-01' AND f.OrderDate <= '2013-12-31';

--- combine DimCategory, DimSubcategory and DimProduct and extract as One Product table

SELECT 
    dp.ProductKey,
    dp.EnglishProductName       AS ProductName,
    dp.Color,
    dps.EnglishProductSubcategoryName AS Subcategory,
    dpc.EnglishProductCategoryName    AS Category
FROM DimProduct dp
JOIN DimProductSubcategory dps 
    ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
JOIN DimProductCategory dpc 
    ON dps.ProductCategoryKey = dpc.ProductCategoryKey


-- this was connected directly
Select * from DimGeography

-- this was connected directly
Select
[SalesTerritoryKey],
[SalesTerritoryAlternateKey],
[SalesTerritoryRegion],
[SalesTerritoryCountry],
[SalesTerritoryGroup] 

from 

DimSalesTerritory;

Select * from [dbo].[DimDate]