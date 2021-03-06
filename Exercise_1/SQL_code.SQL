CREATE TABLE REGIONS (
  region_id int NOT_NULLPRIMARY KEY,
  region_name varchar(255)
);

CREATE TABLE COUNTRIES (
  country_id int NOT NULL PRIMARY KEY,
  country_name varchar(255),
  region_id int,
  FOREIGN KEY (region_id) REFERENCES REGIONS(region_id)
);

CREATE TABLE LOCATIONS (
  location_id int NOT NULL PRIMARY KEY,
  street_address varchar(255),
  postal_code varchar(255),
  city varchar(255),
  state_province varchar(255),
  country_id int,
  FOREIGN KEY (country_id) REFERENCES COUNTRIES(country_id)
);

CREATE TABLE JOBS (
    job_id int NOT NULL PRIMARY KEY,
    job_title varchar(255),
    min_salary float,
    max_salary float,
    CONSTRAINT check_min_salary
    CHECK (min_salary <= max_salary - 2000)
);

CREATE TABLE DEPARTMENTS (
  department_id int NOT NULL PRIMARY KEY,
  department_name varCHAR(20),
  location_id int,
  FOREIGN KEY (location_id) REFERENCES LOCATIONS(location_id)
);

CREATE TABLE EMPLOYEES (
    employee_id int NOT NULL PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
    email varchar(255),
    phone_number varchar(255),
    hire_date date,
    job_id int,
    salary float,
    commision_pct varchar(255),
    manager_id int,
    department_id int,
    FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(employee_id),
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id),
    FOREIGN KEY (job_id) REFERENCES JOBS(job_id)
);

ALTER TABLE DEPARTMENTS
ADD manager_id int REFERENCES EMPLOYEES(employee_id);

CREATE TABLE JOB_HISTORY (
  employee_id int NOT NULL,
  start_date date NOT NULL,
  end_date int,
  job_id int,
  department_id int,
  PRIMARY KEY (employee_id, start_date),
  FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id),
  FOREIGN KEY (job_id) REFERENCES JOBS(job_id),
  FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id)
);
