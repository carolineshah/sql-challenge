-- create departments tables
create table departments (
	dept_no varchar primary key,
	dept_name varchar);
	
-- import data into table and check its all there
select * from departments;

-- create titles table
create table titles (
	title_id varchar primary key,
	title varchar);
	
-- import + check data
select * from titles;

-- create employees table
create table employees (
	emp_no int primary key,
	emp_title_id varchar,
	foreign key(emp_title_id) references titles(title_id),
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date varchar);
	
-- import + check data
select * from employees;

-- create salaries table
create table salaries (
	emp_no int,
	foreign key(emp_no) references employees(emp_no),
	salary int);
	
-- import + check data
select * from salaries;

-- create junction table for dept and manager
create table dept_manager (
	dept_no varchar,
	foreign key(dept_no) references departments(dept_no),
	emp_no int,
	foreign key(emp_no) references employees(emp_no),
	primary key(dept_no, emp_no));
	
-- import + check data
select * from dept_manager;

-- create junction table for dept and employees
create table dept_emp (
	emp_no int,
	foreign key(emp_no) references employees(emp_no),
	dept_no varchar,
	foreign key(dept_no) references departments(dept_no),
	primary key(emp_no, dept_no));
	
-- import + check data
select * from dept_emp;