
CREATE TABLE "departments" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(20)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "dept_manager" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(20)   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "emp_title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "emp_title_id"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("emp_title_id");

--ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
--REFERENCES "departments" ("dept_no");--

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


COPY departments(dept_no, dept_name)
FROM 'C:\data_csv\departments.csv'
DELIMITER ','
CSV HEADER;


COPY dept_emp(emp_no, dept_no)
FROM 'C:\data_csv\dept_emp.csv'
DELIMITER ','
CSV HEADER;


COPY dept_manager(dept_no, emp_no)
FROM 'C:\data_csv\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\data_csv\employees.csv'
DELIMITER ','
CSV HEADER;

COPY titles(emp_title_id, title)
FROM 'C:\data_csv\titles.csv'
DELIMITER ','
CSV HEADER;

COPY salaries(emp_no, salary)
FROM 'C:\data_csv\salaries.csv'
DELIMITER ','
CSV HEADER;
