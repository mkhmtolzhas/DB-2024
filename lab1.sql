CREATE DATABASE lab1;

create table users(
	id SERIAL,
	firstname VARCHAR(50),
	lastname VARCHAR(50)
);

ALTER TABLE users ADD COLUMN isadmin SMALLINT;

ALTER TABLE users
ALTER COLUMN isadmin SET DATA TYPE boolean USING (isadmin = 1);;

ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD PRIMARY KEY(id);

create table tasks (
	id SERIAL,
	name VARCHAR(50),
	user_id INT
);

DROP TABLE tasks;

DROP DATABASE lab1;