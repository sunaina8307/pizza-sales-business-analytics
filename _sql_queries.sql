select * from [pizza_sales (1)]
--q1 total revenue
select sum(a.total_price) as total_revenue from [pizza_sales (1)] as a
--q2 average order value
select sum(a.total_price) /count(distinct a.order_id) as average_order_value from [pizza_sales (1)] as a
--q3 total pizza sold
select sum(a.quantity) as total_pizza_sold from [pizza_sales (1)] as a
--q4 total orders
select count(distinct a.order_id) as total_order from [pizza_sales (1)] as a
--q5 average oizza per order
select cast( CAST( sum(a.quantity) as decimal(10,2)) /cast(count(distinct a.order_id)as decimal(10,2)) as decimal(10,2)) as avg_pizza_per_order from [pizza_sales (1)] as a
--q5 daily trends for total orders
select DATENAME(DW,A.order_date) as order_day,count(distinct a.order_id) as total_orders from [pizza_sales (1)] as a
GROUP by DATENAME(DW,A.order_date)
--q6 monthly trends for total orders
select datename(month,a.order_date) asmonth_name,count(distinct a.order_id) as total_orders   from [pizza_sales (1)] as a
group by datename(month,order_date)
order  by total_orders desc
--q7 percentage of pizzas sold by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [pizza_sales (1)])  AS DECIMAL(10,2)) AS PCT
FROM [pizza_sales (1)]
GROUP BY pizza_category

--q7 percentage of sales by pizza sales
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [pizza_sales (1)]) AS DECIMAL(10,2)) AS PCT
FROM [pizza_sales (1)]
GROUP BY pizza_size
ORDER BY pizza_size

--q8 Top 5 Best Sellers by Total Pizzas Sold
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

--q9Bottom 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC





