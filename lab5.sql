create database lab5_1;

create table customers(
  customer_id integer,
  cust_name varchar(50),
  city varchar(50),
  grade integer,
  salesman_id integer
);

create table orders(
  order_id serial,
  customer_id integer,
  description text,
  purch_amt integer,
  constraint p_key primary key(order_id)
);


select sum(purch_amt) as "Total purchase amount" from orders;

select avg(purch_amt) as "Average purchase amount" from orders;

select * from customers where cust_name like 'B%';

select min(purch_amt) as "Maximum purchase amount" from orders;

select * from customers ORDER BY ASC LIMIT 1;

select * from customers where grade > 100;

select * from customers where city = 'New York' and grade > 100;

select * from customers where city = 'New York' or grade > 100;


select * from orders where customer_id in (select customer_id from customers where city = 'New York');

select * from customers where customer_id in (select customer_id from orders group by customer_id having count(order_id) > 10);

select * from customers where cust_name is not null;

