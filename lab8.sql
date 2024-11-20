-- 1
create database lab8;

-- 2
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);


INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'New York', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


INSERT INTO customers (customer_id, name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5005);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    order_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

-- Вставка данных в таблицу «orders»
INSERT INTO orders (order_id, amount, order_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3002, 5002),
(70009, 270.65, '2012-09-10', 3005, 5001),
(70002, 65.26, '2012-10-05', 3001, 5005),
(70004, 110.5, '2012-08-17', 3007, 5003),
(70007, 948.5, '2012-09-10', 3002, 5002),
(70005, 2400.6, '2012-07-27', 3004, 5006),
(70008, 5760, '2012-09-10', 3002, 5001);


-- 3
create role junior_dev login;

-- 4
create view new_york_salesman AS
    select * from salesman where city = 'New York';

-- 5
create view salesman_customer as
    select o.order_id, o.amount, s.name as salesman_name, c.name as customer_name from orders o join salesman s on s.salesman_id = o.salesman_id join customers c on s.salesman_id = c.salesman_id;

grant all privileges on salesman_customer, new_york_salesman to junior_dev;

-- 6
create view highest_grade as select * from customers order by grade desc limit 1;

grant select on highest_grade to junior_dev;

-- 7
create view number_of_customers as select c.city, count(*) from customers c group by c.city;


-- 8
create view salesman_with_multiple_customers as
select s.salesman_id, s.name
from salesman s
join customers c on s.salesman_id = c.customer_id
group by s.salesman_id, s.name
having count(c.customer_id) > 1;

-- 9
create role intern;
grant junior_dev to intern