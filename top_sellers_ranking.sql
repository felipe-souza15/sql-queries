-- Ranks sellers based on total revenue per month
SELECT 
    s.SellerID, 
    s.Name, 
    SUM(s.TotalValue) AS TotalRevenue,
    RANK() OVER (PARTITION BY YEAR(s.SaleDate), MONTH(s.SaleDate) ORDER BY SUM(s.TotalValue) DESC) AS MonthlyRanking
FROM Sales s
GROUP BY s.SellerID, s.Name, YEAR(s.SaleDate), MONTH(s.SaleDate);