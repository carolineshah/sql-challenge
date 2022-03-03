-- create departments tables
drop table if exists departments cascade;
create table departments (
	dept_no varchar primary key,
	dept_name varchar);
	
-- import data into table and check its all there
select * from departments;

-- create titles table
drop table if exists titles cascade;
create table titles (
	title_id varchar primary key,
	title varchar);
	
-- import + check data
select * from titles;

-- create employees table
drop table if exists employees cascade;
create table employees (
	emp_no int primary key,
	emp_title_id varchar,
	foreign key(emp_title_id) references titles(title_id),
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date);
	
-- import + check data
select * from employees;

-- create salaries table
drop table if exists salaries cascade;
create table salaries (
	emp_no int,
	foreign key(emp_no) references employees(emp_no),
	salary int);
	
-- import + check data
select * from salaries;

-- create junction table for dept and manager
drop table if exists dept_manager cascade;
create table dept_manager (
	dept_no varchar,
	foreign key(dept_no) references departments(dept_no),
	emp_no int,
	foreign key(emp_no) references employees(emp_no),
	primary key(dept_no, emp_no));
	
-- import + check data
select * from dept_manager;

-- create junction table for dept and employees
drop table if exists dept_emp cascade;
create table dept_emp (
	emp_no int,
	foreign key(emp_no) references employees(emp_no),
	dept_no varchar,
	foreign key(dept_no) references departments(dept_no),
	primary key(emp_no, dept_no));
	
-- import + check data
select * from dept_emp;