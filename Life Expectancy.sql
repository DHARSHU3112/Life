-- Create the database (if it doesn't exist already)
CREATE DATABASE IF NOT EXISTS life;

-- Switch to the created database
USE life;

-- Create the table has_expectancy
CREATE TABLE has_expectancy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    disease VARCHAR(255),
    total_expenditure DECIMAL(15, 2),
    population BIGINT,
    gdp_percap DECIMAL(15, 2),
    life_expectancy DECIMAL(5, 2)
);

-- Insert 20 values into the has_expectancy table
INSERT INTO has_expectancy (country, status, disease, total_expenditure, population, gdp_percap, life_expectancy)
VALUES
    ('USA', 'Developed', 'Heart Disease', 300000000.00, 350000000, 60000.00, 78.6),
    ('USA', 'Developed', 'Cancer', 250000000.00, 350000000, 60000.00, 76.9),
    ('USA', 'Developed', 'Stroke', 200000000.00, 350000000, 60000.00, 76.0),
    ('USA', 'Developed', 'Diabetes', 180000000.00, 350000000, 60000.00, 75.5),
    ('China', 'Developing', 'Respiratory Diseases', 150000000.00, 1200000000, 10000.00, 76.8),
    ('China', 'Developing', 'Cancer', 140000000.00, 1200000000, 10000.00, 75.1),
    ('China', 'Developing', 'Stroke', 130000000.00, 1200000000, 10000.00, 74.3),
    ('China', 'Developing', 'Diabetes', 120000000.00, 1200000000, 10000.00, 73.5),
    ('India', 'Developing', 'Respiratory Diseases', 100000000.00, 1500000000, 8000.00, 69.5),
    ('India', 'Developing', 'Cancer', 90000000.00, 1500000000, 8000.00, 68.2),
    ('India', 'Developing', 'Stroke', 80000000.00, 1500000000, 8000.00, 67.8),
    ('India', 'Developing', 'Diabetes', 70000000.00, 1500000000, 8000.00, 66.4),
    ('Brazil', 'Developing', 'Respiratory Diseases', 60000000.00, 210000000, 15000.00, 75.2),
    ('Brazil', 'Developing', 'Cancer', 50000000.00, 210000000, 15000.00, 73.5),
    ('Brazil', 'Developing', 'Stroke', 40000000.00, 210000000, 15000.00, 72.7),
    ('Brazil', 'Developing', 'Diabetes', 30000000.00, 210000000, 15000.00, 71.8),
    ('Russia', 'Developed', 'Respiratory Diseases', 80000000.00, 145000000, 25000.00, 70.5),
    ('Russia', 'Developed', 'Cancer', 70000000.00, 145000000, 25000.00, 68.9),
    ('Russia', 'Developed', 'Stroke', 60000000.00, 145000000, 25000.00, 67.3),
    ('Russia', 'Developed', 'Diabetes', 50000000.00, 145000000, 25000.00, 65.8),
    ('Germany', 'Developed', 'Respiratory Diseases', 75000000.00, 83000000, 60000.00, 81.2),
    ('Germany', 'Developed', 'Cancer', 65000000.00, 83000000, 60000.00, 79.8);

-- Verify data has been inserted
SELECT * FROM has_expectancy;
-------------------------------------------------Limit---------------------------------------------------------------------------- 
select * from has_expectancy limit 3;
select * from has_expectancy where disease = "stroke" order by life_expectancy;
select * from has_expectancy where disease = "stroke" order by life_expectancy limit 2;
select * from has_expectancy where disease = "stroke" order by life_expectancy desc limit 2;
select * from has_expectancy where disease = "stroke" order by life_expectancy limit 3 offset 2;
-----------------------------------------------select--------------------------

select distinct(disease) from has_expectancy;
select * from has_expectancy where disease = "Diabetes" ;
select * from has_expectancy where country like"B%";
select country,disease,population,life_expectancy from has_expectancy order by life_expectancy;
select country,disease,population,life_expectancy from has_expectancy order by life_expectancy desc;
select country,disease,gdp_percap,life_expectancy from has_expectancy having life_expectancy >=70 order by gdp_percap desc;
-------------------------------------------------------------------------group by------------------------------
select  sum(total_expenditure),country from has_expectancy  group by country;
select  sum(total_expenditure),country from has_expectancy where status="Developed" group by country;
select  sum(total_expenditure) as sum_total_expenditure,country from has_expectancy where status="Developed" group by country order by sum_total_expenditure desc;
select  sum(total_expenditure) as sum_total_expenditure,country from has_expectancy where status="Developed" group by country having country ="USA" or "Germany"
order by sum_total_expenditure ;