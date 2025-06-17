create database ecom;
use ecom;

--create tables
--customers table
create table customers(
	customer_id int identity(1,1) primary key,
	name varchar(100) not null,
	email varchar(100) not null unique,
	password varchar(100) not null
);

--products table
create table products(
	product_id int identity(1,1) primary key,
	name varchar(100) not null,
	price decimal(10,2) not null,
	description varchar(max),
	stockquantity int not null
);

--cart table
create table cart(
	cart_id int identity(1,1) primary key,
	customer_id int not null,
	product_id int not null,
	quantity int not null,

	foreign key(customer_id) references customers(customer_id),
	foreign key(product_id) references products(product_id)
);

--orders table
create table orders(
	order_id int identity(1,1) primary key,
	customer_id int not null,
	order_date datetime default getdate(),
	total_price decimal(10,2) not null,
	shipping_address varchar(500) not null,

	foreign key(customer_id) references customers(customer_id)
);

--order_items table
create table order_items(
	order_item_id int identity(1,1) primary key,
	order_id int not null,
	product_id int null,
	quantity int not null,

	foreign key(order_id) references orders(order_id),
	foreign key(product_id) references products(product_id)
);

--insert values into tables
--customers table
insert into customers(name, email, password)
values
('John Doe', 'johndoe@example.com', 'john123'),
('Jane Smith', 'janesmith@example.com', 'jane123'),
('Robert Johnson', 'robert@example.com', 'pass123'),
('Sarah Brown', 'sarah@example.com', 'pass123'),
('David Lee', 'david@example.com', 'david123'),
('Laura Hall', 'laura@example.com', 'laura123'),
('Michael Davis', 'michael@example.com', 'michael123'),
('Emma Wilson', 'emma@example.com', 'emma123'),
('William Taylor', 'william@example.com', 'william123'),
('Olivia Adams', 'olivia@example.com', 'olivia123');

--products table
insert into products(name, price, description, stockquantity)
values
('Laptop', 800.00, 'high performance', 10),
('Smartphone', 600.00, 'Latest smartphone', 15),
('Tablet', 300.00, 'Portable tablet', 20),
('Headphones', 150.00, 'Noise-canceling', 30),
('TV', 900.00, '4K Smart TV', 5),
('Coffee Maker', 50.00, 'Automatic coffee maker', 25),
('Refrigerator', 700.00, 'Energy-efficient', 10),
('Microwave Oven', 80.00, 'Countertop microwave', 15),
('Blender', 70.00, 'High-speed blender', 20),
('Vacuum Cleaner', 120.00, 'Bagless vacuum cleaner', 10);

--cart table
insert into cart(customer_id, product_id, quantity)
values
(1,1,2),
(1, 3, 1),
(2, 2, 3),
(3, 4, 4),
(3, 5, 2),
(4, 6, 1),
(5, 1, 1),
(6, 10, 2),
(6, 9, 3),
(7, 7, 2);

--orders table
insert into orders(customer_id, order_date, total_price, shipping_address)
values
(1, '2023-01-05', 1200.00, '123 Main St, City'),
(2, '2023-02-10', 900.00, '456 Elm St, Town'),
(3, '2023-03-15', 300.00, '789 Oak St, Village'),
(4, '2023-04-20', 150.00, '101 Pine St, Suburb'),
(5, '2023-05-25', 1800.00, '234 Cedar St, District'),
(6, '2023-06-30', 400.00, '567 Birch St, County'),
(7, '2023-07-05', 700.00, '890 Maple St, State'),
(8, '2023-08-10', 160.00, '321 Redwood St, Country'),
(9, '2023-09-15', 140.00, '432 Spruce St, Province'),
(10, '2023-10-20', 1400.00, '765 Fir St, Territory');

--order_items table
insert into order_items(order_id, product_id, quantity)
values
(1,1,2),
(1, 3, 1),
(2, 2, 3),
(3, 5, 2),
(4, 4, 4),
(4, 6, 1),
(5, 1, 1),
(5, 2, 2),
(6, 10, 2),
(6, 9, 3);

--tasks
--1.Update refrigerator product price to 800
update products
set price = 800
where name = 'Refrigerator';

--2.Remove all cart items for a specific customer
delete from cart
where customer_id=5;

--3.Retrieve Products Priced Below $100
select * from products
where price<100

--4.Find Products with Stock Quantity Greater Than 5
select * from products
where stockquantity>5;

--5.Retrieve Orders with Total Amount Between $500 and $1000
select * from orders
where total_price between 500 and 1000;

--6.Find Products which name end with letter �r�
select * from products
where name like '%r';

--7.Retrieve Cart Items for Customer 5
select * from cart
where customer_id=5;

--8.Find Customers Who Placed Orders in 2023
select distinct c.* from customers c
join orders o on c.customer_id=o.customer_id
where year(o.order_date)=2023;

--9.Determine the Minimum Stock Quantity for Each Product Category
select name, min(stockquantity) as min_stock
from products
group by name;

--10.Calculate the Total Amount Spent by Each Customer
select o.customer_id, c.name, sum(o.total_price) as total
from orders o
inner join customers c on c.customer_id=o.customer_id
group by o.customer_id, c.name;

--10.Calculate the Total Amount Spent by Each Customer
select customer_id, sum(total_price) as total
from orders
group by customer_id;

--11.Find the Average Order Amount for Each Customer
select customer_id, format(avg(total_price),'n2') as average
from orders
group by customer_id;

--12.Count the Number of Orders Placed by Each Customer
select customer_id, count(*) as order_count
from orders
group by customer_id;

--13.Find the Maximum Order Amount for Each Customer
select customer_id, max(total_price) as max_order
from orders
group by customer_id;

--14.Get Customers Who Placed Orders Totaling Over $1000
select c.customer_id, c.name, sum(total_price) as total
from customers c
inner join orders o on c.customer_id=o.customer_id
group by c.customer_id, c.name
having sum(total_price)>1000;

--15.Subquery to Find Products Not in the Cart
select * from products
where product_id not in(
	select distinct product_id from cart
);

--16.Subquery to Find Customers Who Haven't Placed Orders
select * from customers
where customer_id not in (
	select distinct customer_id from orders
);

--17.Subquery to Calculate the Percentage of Total Revenue for a Product
--(Product's Total Revenue / All Products' Revenue) � 100
select p.product_id, p.name, sum(oi.quantity*p.price) as product_revenue,
round(
	100.0*sum(oi.quantity*p.price)/
	(select sum(oi2.quantity*p2.price)
	from order_items oi2
	inner join products p2 on oi2.product_id=p2.product_id),2
) as revenue_percent
from order_items oi
join products p on oi.product_id=p.product_id
group by p.product_id, p.name;

--18.Subquery to Find Products with Low Stock
select * from products
where stockquantity =(
	select min(stockquantity)
	from products
);

--19.Subquery to Find Customers Who Placed High-Value Orders
select * from customers
where customer_id in (
	select customer_id
	from orders
	where total_price=(
		select max(total_price)
		from orders
	)
);


select * from customers;
select * from products;
select * from cart;
select * from orders;
select * from order_items;
