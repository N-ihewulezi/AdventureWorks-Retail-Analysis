-- Update the orderquantity to show variance
UPDATE f
SET f.OrderQuantity = 
    CASE dpc.EnglishProductCategoryName  -- ← changed dp to dpc
        WHEN 'Accessories' THEN ABS(CHECKSUM(NEWID())) % 5 + 1   -- 1-5
        WHEN 'Clothing'    THEN ABS(CHECKSUM(NEWID())) % 3 + 1   -- 1-3
        WHEN 'Bikes'       THEN 1                                  -- always 1
        WHEN 'Components'  THEN ABS(CHECKSUM(NEWID())) % 4 + 1   -- 1-4
    END
FROM FactInternetSales f
JOIN DimProduct dp          ON f.ProductKey = dp.ProductKey
JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey;


-- Step 1: Verify current state
SELECT 
    COUNT(*) AS RowsStillWrong,
    SUM(ABS(SalesAmount - (UnitPrice * OrderQuantity))) AS TotalDiscrepancy
FROM FactInternetSales
WHERE OrderQuantity > 1

-- Step 2: Fix all affected columns
BEGIN TRANSACTION

UPDATE FactInternetSales
SET 
    SalesAmount         = OrderQuantity * UnitPrice,
    TotalProductCost    = OrderQuantity * ProductStandardCost,
    TaxAmt              = OrderQuantity * UnitPrice * 0.08,
    Freight             = OrderQuantity * UnitPrice * 0.02,
    ExtendedAmount      = OrderQuantity * UnitPrice

-- Step 3: Verify fix before committing
SELECT TOP 10
    OrderQuantity,
    UnitPrice,
    SalesAmount,
    UnitPrice * OrderQuantity       AS ExpectedSalesAmount,
    SalesAmount - 
    (UnitPrice * OrderQuantity)     AS Difference
FROM FactInternetSales
WHERE OrderQuantity > 1
ORDER BY OrderQuantity DESC

-- Step 4: If all Difference values = 0.00 then run COMMIT
COMMIT TRANSACTION
