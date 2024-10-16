-- 1
create database  lab5;

-- 2
create table salesman (
    salesman_id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    city VARCHAR(40),
    commission FLOAT
);


create table customers (
    customer_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(40),
    city VARCHAR(40),
    grade INTEGER,
    salesman_id integer,
    FOREIGN KEY (salesman_id) references salesman(salesman_id)
);

create table orders (
    ord_no SERIAL PRIMARY KEY,
    purch_amt FLOAT,
    ord_date DATE,
    customer_id INTEGER,
    salesman_id INTEGER,
    FOREIGN KEY (customer_id) references customers(customer_id),
    FOREIGN KEY (salesman_id) references  salesman(salesman_id)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', NULL, 5002);


INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);


-- 3
select sum(purch_amt) from orders;

-- 4
select AVG(purch_amt) from orders;

-- 5
select count(*) from customers where cust_name is not null;

-- 6
select min(purch_amt) from orders;

-- 7
select * from customers where cust_name LIKE '%b';

-- 8
select * from orders o join customers c on c.customer_id = o.customer_id
where c.city = 'New York';

-- 9
select * from customers c join orders o on c.customer_id = o.customer_id
where o.purch_amt > 10;

-- 10
select sum(grade) from customers;

-- 11
select * from customers where cust_name is not null;

-- 12
select max(grade) from customers;