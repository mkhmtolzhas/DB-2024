-- 1
create database lab4;

-- 2
create table warehouses (
    code SERIAL PRIMARY KEY,
    location VARCHAR(30),
    capacity integer
);


drop table boxes;

create table boxes (
    code char(4) primary key,
    contents VARCHAR(30),
    value real,
    warehouse INTEGER,
    foreign key (warehouse) references warehouses(code)
);


-- 3
INSERT INTO warehouses (code, location, capacity) VALUES
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 2),
(5, 'San Francisco', 8);


INSERT INTO boxes (code, contents, value, warehouse) VALUES
('OMN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 120, 5),
('P2T6', 'Scissors', 150, 2),
('TU55', 'Papers', 90, 5);


-- 4
select * from warehouses;

-- 5
select * from boxes where value > 150;

-- 6
select distinct on(contents) * from boxes;

-- 7
select warehouse, count(code) as num_of_boxes from boxes group by warehouse;

-- 8
select warehouse, count(code) as num_of_boxes from boxes group by warehouse having count(code) > 2;

-- 9
INSERT INTO warehouses (code, location, capacity) values (6, 'New York', 3);

-- 10
INSERT INTO boxes (code, contents, value, warehouse) values ('H5RT', 'Papers', 200, 2);

-- 11
UPDATE boxes
SET value = value * 0.85
where code = (
    SELECT code from boxes order by value desc
                           limit 1 offset 2
);

-- 12
DELETE FROM boxes WHERE value > 150 RETURNING *;

-- 13
DELETE FROM boxes where warehouse in (SELECT code from warehouses where location = 'New York') returning *;

