-- TOTAL REVENUE:
SELECT SUM(total_price) as Total_Revenue FROM pizza_sales;

-- AVERAGE ORDER VALUE:
SELECT SUM(total_price)/count(distinct order_id) as Average_Order_Value FROM pizza_sales;

-- TOTAL PIZZA SOLD:
SELECT SUM(quantity) as Total_Pizza_Sold FROM pizza_sales;

-- TOTAL ORDER:
SELECT count(distinct order_id) as Total_Order FROM pizza_sales;

-- AVERAGE PIZZAS PER ORDER:
SELECT round(round(sum(quantity), 2)/round(count(distinct order_id), 2),2) as Average_Pizzas_per_Order
FROM pizza_sales;
 
-- DAILY TREND FOR TOTAL ORDER:
SELECT dayname(order_date) as Order_Day, count(distinct order_id) as Total_Order
FROM pizza_sales
group by Order_Day;

-- MONTHLY TREND FOR ORDERS:
SELECT monthname(order_date) as Month_Name, count(distinct order_id) as Total_Orders 
FROM pizza_sales
group by Month_Name;

-- % OF SALES BY PIZZA CATEGORY:
SELECT pizza_category,round(sum(total_price), 2) as Total_Revenue,
round(sum(total_price)*100/(select sum(total_price) from pizza_sales), 2) as PCT
FROM pizza_sales
group by pizza_category;

-- % OF SALES BY PIZZA CATEGORY:
SELECT pizza_size,round(sum(total_price),2) as Total_Revenue,
round((sum(total_price)*100/(select sum(total_price) from pizza_sales)),2) as PCT
FROM pizza_sales
group by pizza_size;

-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY:
SELECT pizza_category, sum(quantity) as Total_Quantity_Sold FROM pizza_sales
where month(order_date)=2
group by pizza_category
order by Total_Quantity_Sold desc; 

-- TOP 5 PIZZAS BY REVENUE:
SELECT pizza_name, sum(total_price) as Total_Revenue FROM pizza_sales
group by pizza_name
order by Total_Revenue desc
limit 5;

-- BOTTOM 5 PIZZAS BY REVENUE:
SELECT pizza_name, round(sum(total_price), 2) as Total_Revenue FROM pizza_sales
group by pizza_name
order by Total_Revenue asc
limit 5;

-- TOP 5 PIZZAS BY QUANTITY:
SELECT pizza_name, sum(quantity) as Total_Pizza_Sold FROM pizza_sales
group by pizza_name
order by Total_Pizza_Sold desc
limit 5;

-- BOTTOM 5 PIZZAS BY QUANTITY:
SELECT pizza_name, sum(quantity) as Total_Pizza_Sold FROM pizza_sales
group by pizza_name
order by Total_Pizza_Sold asc
limit 5; 

-- TOP 5 PIZZAS BY TOTAL ORDERS:
SELECT pizza_name, COUNT( distinct order_id) as Total_Orders FROM pizza_sales
group by pizza_name
order by Total_Orders desc
limit 5;

-- BOTTOM 5 PIZZAS BY TOTAL ORDERS:
SELECT pizza_name, COUNT( distinct order_id) as Total_Orders FROM pizza_sales
group by pizza_name
order by Total_Orders asc
limit 5;

