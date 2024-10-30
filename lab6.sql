-- 1
create database lab6;

-- 2
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);


INSERT INTO locations (street_address, postal_code, city, state_province) VALUES
('123 Main St', '11111', 'New York', 'NY'),
('456 Elm St', '22222', 'Los Angeles', 'CA'),
('789 Oak St', '33333', 'Chicago', 'IL'),
('101 Pine St', '44444', 'Houston', 'TX'),
('202 Maple St', '55555', 'Miami', 'FL');

INSERT INTO departments (department_name, budget, location_id) VALUES
('IT', 500000, 1),
('HR', 200000, 2),
('Sales', 300000, 3),
('Marketing', 250000, 4),
('Finance', 350000, 5);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 70000, 1),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 80000, 1),
('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', 60000, 2),
('Bob', 'Brown', 'bob.brown@example.com', '456-789-0123', 65000, 3),
('Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234', 72000, 4),
('Eve', 'Miller', 'eve.miller@example.com', '678-901-2345', 73000, 5),
('Frank', 'Wilson', 'frank.wilson@example.com', '789-012-3456', 67000, 3),
('Grace', 'Taylor', 'grace.taylor@example.com', '890-123-4567', 69000, 2),
('Henry', 'Anderson', 'henry.anderson@example.com', '901-234-5678', 75000, 4);

-- 3
select e.first_name, e.last_name, e.department_id, d.department_name from employees e join departments d on d.department_id = e.department_id;

-- 4
select e.first_name, e.last_name, e.department_id, d.department_name from employees e join departments d on d.department_id = e.department_id where d.department_id = 80 or d.department_id = 40;

-- 5
select e.first_name, e.last_name, d.department_name as departament, l.city, l.state_province from (employees e join departments d on d.department_id = e.department_id) join locations l on d.location_id = l.location_id;

-- 6
select d.department_id, d.department_name, e.first_name, e.last_name from departments d join employees e on d.department_id = e.department_id;

-- 7
select e.first_name, e.last_name, e.department_id, d.department_name from employees e left join departments d on d.department_id = e.department_id;