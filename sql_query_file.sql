#TOTAL REVENUE
SELECT SUM(total_price) AS Total_Revenue FROM pizza_dataset;
# Total revenue is 817860.05083847

#AVERAGE ORDER VALUES
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_dataset;
#Avg_order_Value is 38.12067271352984

#TOTAL PIZZA SOLD
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_dataset;
#Total 49574 pizza's sold 

#TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_dataset;
#Total orders are 21350

#AVERAGE PIZZAS PER ORDER
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_dataset;

#DAILY TREND FOR TOTAL ORDERS
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_dataset
GROUP BY DATENAME(DW, order_date);

#HOURLY TREND FOR ORDERS
SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_dataset
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time);

#PERCENTAGE OF SALES BY PIZAA CATEGORY
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_dataset
GROUP BY pizza_category;

#PERCENTAGE OF SALES BY PIZAA SIZE
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_dataset
GROUP BY pizza_size
ORDER BY pizza_size;

#TOTAL PIZZA SOLD BY PIZZA CATEGORY
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_dataset
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

#TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT pizza_name, SUM(quantity) AS Total_pizza_Sold FROM pizza_dataset
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;

#BOTTOM 5 WORST SELLERS BY TOTAL PIZZAS SOLD
SELECT pizza_name, SUM(quantity) AS Total_pizza_Sold FROM pizza_dataset
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
LIMIT 5;

