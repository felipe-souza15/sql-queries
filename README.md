# 📊 SQL Queries for Data Analysis & Business Intelligence

## 🚀 About this Repository
This repository contains SQL scripts used in **data extraction, transformation, and analysis**, specifically designed for **business intelligence and Power BI dashboards**.  
These queries are optimized for **large-scale datasets** and structured to **automate financial reporting, revenue tracking, and operational insights**.  

Each query in this repository serves a specific business need, ranging from **billing analysis** to **product revenue tracking**.  

---

## 📂 Available SQL Scripts  
### 🔹 **1. Billing Data Extraction (`billing_extraction.sql`)**  
- **Retrieves monthly billing data** dynamically from multiple tables (`PRE_FAT..fatYYYYMM`).  
- **Uses a `WHILE` loop** to iterate over different months, automating historical data extraction.  
- **Designed for Power BI dashboards**, providing financial insights for company directors.  
- ✅ **Key Features:** Dynamic SQL, optimized filtering, scalable for large datasets.  

### 🔹 **2. Product Revenue Analysis (`product_revenue_extraction.sql`)**  
- **Combines multiple data sources (`mcfYYYYMM` and `ut_DetalheConsumoMinimoYYYYMM`)** to calculate total revenue per product.  
- **Handles pricing complexities** where unit price (`mcfpun`) is zero due to minimum package consumption.  
- **Uses `sp_executesql`** to dynamically generate queries, ensuring efficiency and security.  
- ✅ **Key Features:** Prevents duplicate transactions, improves financial reporting accuracy.  

More queries will be added as new use cases arise.

---

## 🔍 Why These Queries?  
- **Automate repetitive data extraction tasks**, reducing manual adjustments.  
- **Optimize performance using best SQL practices** (indexing, filtering, and execution plans).  
- **Ensure accuracy in financial reporting** by preventing duplicate or missing transactions.  
- **Facilitate seamless Power BI integration** by structuring data in an analytical format.  

---

## 📈 Future Improvements  
🔹 **Performance Optimization:** Indexing strategies, partitioning suggestions.  
🔹 **Cloud Integration:** Adapting queries for cloud-based databases (AWS RDS, Azure SQL).  
🔹 **Data Modeling Enhancements:** Improving database structure for analytics.  

---

## 👨‍💻 About Me  
Felipe De Souza Lopes  
📍 **Data Analyst | Power BI | SQL | Python**  
🔗 [LinkedIn](www.linkedin.com/in/felipesouzalopes15) | ✉ [Email](felipe1souza.lopes@gmail.com)  


