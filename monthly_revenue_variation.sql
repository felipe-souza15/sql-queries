-- Calculates the monthly revenue variation compared to the previous month
WITH MonthlyRevenue AS (
    SELECT 
        YEAR(SaleDate) AS Year, 
        MONTH(SaleDate) AS Month, 
        SUM(TotalValue) AS Revenue
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
)
SELECT 
    Year, 
    Month, 
    Revenue,
    LAG(Revenue) OVER (ORDER BY Year, Month) AS PreviousMonthRevenue,
    ((Revenue - LAG(Revenue) OVER (ORDER BY Year, Month)) / NULLIF(LAG(Revenue) OVER (ORDER BY Year, Month), 0)) * 100 AS RevenueVariationPercentage
FROM MonthlyRevenue;