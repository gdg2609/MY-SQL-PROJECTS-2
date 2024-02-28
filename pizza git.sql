use newschema1;


#Retrieve all columns for the first 10 records in the dataset;
select * from pizza_sales orderby limit 10;

#Count the total number of records in the dataset;
select count(*) as total_records from pizza_sales;

#Display unique pizza sizes available in the dataset;
select distinct pizza_size from pizza_sales;


select sum(total_price) as total from pizza_sales;
select sum(total_price) as total from pizza_sales where pizza_name="The Mexicana Pizza";
#Find the total quantity of pizzas sold;
select sum(quantity) as total_quantitysold from pizza_sales;

#List distinct pizza categories.
select distinct pizza_category from pizza_sales;

#Calculate the average unit price of pizzas.
select round(avg(unit_price),2) as avg_price from pizza_sales;
select max(total_price)as highest from pizza_sales;
select *from pizza_sales where total_price= (select max(total_price)from pizza_sales);
#Retrieve orders made on a specific date.
select *from pizza_sales where order_date='01-01-2015';

#Show orders with a quantity greater than 2;
select *from pizza_sales where quantity>'2';

#Display the total price for each pizza in the dataset.
select total_price , pizza_name_id from pizza_sales;

#Find pizzas with a 'Large' size.
 select * from pizza_sales where pizza_size='L';
 
 
#Calculate the total revenue generated from pizza sales;
select round(sum(total_price),2)as revenue_generated from pizza_sales;

#Show the top 5 best-selling pizzas based on quantity.
SELECT pizza_name_id, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY total_sold DESC
LIMIT 5;

#Find the average quantity of pizzas per order.
select avg(quantity) as quantity_per_order from pizza_sales;
#Identify orders with a total price greater than 50.
select*from pizza_sales where total_price>50;
#Display pizzas ordered on a specific date and time. not done
select *from pizza_sales where order_date='01-01-2015'and order_time='11:38:36';
#List pizzas in the 'Vegetarian' category.
select*from pizza_sales where pizza_category="Veggie";
select sum(total_price)as total from pizza_sales where pizza_category="Veggie";
#Retrieve orders placed on weekends (Saturday and Sunday). not done
SELECT * FROM pizza_sales WHERE DAYOFWEEK(order_date) IN (01-01-2015, 07-01-2015);

#Calculate the total quantity sold for each pizza name,size.
select sum(quantity) as qsold  , pizza_name  from pizza_sales group by pizza_name;
#Show the pizza with the highest unit price.
SELECT * FROM pizza_sales ORDER BY unit_price DESC LIMIT 1;

#Find the order with the highest total price.
SELECT * FROM pizza_sales ORDER BY total_price DESC LIMIT 1;

#Calculate the percentage contribution of each pizza to total revenue.
Select pizza_name,round((select(total_price)/sum(total_price))*100,2) as percentagecontro from pizza_sales group by pizza_name,total_price;
SELECT pizza_name, (SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS percentage_contribution
FROM pizza_sales
GROUP BY pizza_name;


#Retrieve pizzas with more than five ingredients.
select pizza_name from pizza_sales where (pizza_ingredients)>5 group by pizza_name;
SELECT * FROM pizza_sales WHERE LENGTH(pizza_ingredients) - LENGTH(REPLACE(pizza_ingredients, ',', '')) >= 5;  #doubt

SELECT * FROM pizza_sales WHERE LENGTH(REPLACE(pizza_ingredients, ',', ''))>= 5;
