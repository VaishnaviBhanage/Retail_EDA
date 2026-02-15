USE Retail_EDA;
GO

-- Exploratory Data Analysis : E-commerce Sales
SELECT TOP 5 * FROM Superstore_raw;


-- Step 1: Dataset Overview
WITH Dataset_summary AS ( 
SELECT COUNT(*) AS Total_records, 
COUNT(DISTINCT Customer_ID) AS Unique_customers,
COUNT(DISTINCT Product_ID) AS Unique_products,
MIN(Order_Date) AS First_order,
MAX(Order_Date) AS Last_order,
SUM (Sales) AS Total_revenue FROM Superstore_raw) 
SELECT * FROM Dataset_summary;

-- Step 2: Sales by Category 
SELECT Category, COUNT(*) AS Order_count,
ROUND(SUM(Sales),2) AS Total_revenue,
ROUND(AVG(Sales), 2) AS Avg_order_value,
ROUND(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER (),2) AS Revenue_percentage
FROM Superstore_raw
GROUP BY Category
ORDER BY Total_revenue DESC;

--Step 3 : Monthly sales trends
SELECT DATENAME(MONTH, Order_date) AS Month,
COUNT(*) AS Orders,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(AVG(Sales),2) AS Avg_order_value,
COUNT(DISTINCT Customer_ID) AS Active_Customers
FROM Superstore_raw
GROUP BY DATENAME(MONTH, Order_date)
ORDER BY Month;

-- Step 4: Customer Segmentation (RFM Analysis)
WITH Customer_metrics AS (
    SELECT 
        Customer_ID, 
DATEDIFF(
    DAY,
    MAX(Order_Date),
    (SELECT MAX(Order_Date) FROM Superstore_raw)
) AS Recency_days,
        COUNT(*) AS Frequency,
        SUM(Sales) AS Monetary_value
    FROM Superstore_raw
    GROUP BY Customer_ID
),
Segmented AS (
    SELECT *,
        CASE 
            WHEN Recency_days <= 30 AND Frequency >= 5 THEN 'VIP'
            WHEN Recency_days <= 60 AND Frequency >= 5 THEN 'Loyal'
            WHEN Recency_days <= 90 THEN 'Active'
            ELSE 'At Risk'
        END AS Customer_segment
    FROM Customer_metrics
)

SELECT 
    Customer_segment,
    COUNT(*) AS Customer_count,
    ROUND(AVG(Monetary_value), 2) AS Avg_lifetime_value
FROM Segmented
GROUP BY Customer_segment
ORDER BY Customer_count DESC; 


--Step 5: Top Products Analysis--
SELECT TOP 10
Product_ID, Product_Name,
COUNT(*) AS Units_sold,
SUM(Sales) AS Total_revenue,
ROUND(AVG(Sales), 2) AS Avg_price,
RANK() OVER (ORDER BY SUM(Sales) DESC) AS Revenue_rank
FROM Superstore_raw
GROUP BY Product_ID, Product_Name
ORDER BY Total_revenue DESC


--Step 6: Geographic Analysis--
SELECT Region,
COUNT(DISTINCT Customer_ID) AS Customers,
COUNT(*) AS Orders,
SUM(Sales) AS Revenue,
ROUND(AVG(Sales),2) AS Avg_order_value,
ROUND(SUM(Sales)*100.0/SUM(SUM(Sales)) OVER (), 2) AS Market_share
FROM Superstore_raw
GROUP BY Region
ORDER BY Revenue DESC;


--Step 7:Profit Analysis--
SELECT 
    Category,
    SUM(Sales) AS Revenue,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)*100.0/SUM(Sales),2) AS Profit_Margin
FROM Superstore_raw
GROUP BY Category
ORDER BY Total_Profit DESC;







