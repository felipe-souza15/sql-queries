-- Calculates the total revenue per month
SELECT 
    YEAR(SaleDate) AS Year, 
    MONTH(SaleDate) AS Month, 
    SUM(TotalValue) AS TotalRevenue
FROM Sales
GROUP BY YEAR(SaleDate), MONTH(SaleDate)
ORDER BY Year DESC, Month DESC;