#1.  Consider a database with two tables: "Orders" and "Customers."
# Write an SQL query to retrieve the top 5 customers who have made the most orders, along with the total count of their orders.
# Display the results in descending order of the order count and ascending order of customer names

SELECT
    c.CustomerName,
    COUNT(o.OrderID) AS OrderCount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerName
ORDER BY
    OrderCount DESC, c.CustomerName ASC
LIMIT 5;
#20.  Consider a database schema that represents an online bookstore with two tables: books and orders. 
#The books table has columns: book_id, title, author, price, and stock_quantity. The orders table has columns: order_id, book_id, quantity, and order_date.Write an SQL query to find the top 3 bestselling products in 
#terms of total quantity sold, along with their names and total quantities sold. Note: Add "GitHub" link for the solution if required  
SELECT
    b.title AS ProductName,
    SUM(o.quantity) AS TotalQuantitySold
FROM
    books b
JOIN
    orders o ON b.book_id = o.book_id
GROUP BY
    b.title
ORDER BY
    TotalQuantitySold DESC
LIMIT 3;
#17.  Write a SQL to get the cumulative sum of an employee’s salary over a period of 3 month but exclude the most recent month? 
#The result should be display by id ascending and then by month decending ? Note: Add "GitHub" link for the solution if required

WITH RankedSalaries AS (
    SELECT
        employee_id,
        salary,
        EXTRACT(MONTH FROM salary_date) AS salary_month,
        ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY salary_date DESC) AS row_num
    FROM
        salaries
)
SELECT
    rs.employee_id,
    rs.salary_month,
    SUM(rs.salary) OVER (PARTITION BY rs.employee_id ORDER BY rs.salary_month DESC ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) AS cumulative_sum
FROM
    RankedSalaries rs
WHERE
    rs.row_num = 1
ORDER BY
    rs.employee_id ASC,
    rs.salary_month DESC;
#16.  Write a SQL query to find the median salary of each company.? Note: Add "GitHub" link for the solution if required  
SELECT
    company_id,
    AVG(salary) AS median_salary
FROM (
    SELECT
        company_id,
        salary,
        ROW_NUMBER() OVER (PARTITION BY company_id ORDER BY salary) AS row_asc,
        ROW_NUMBER() OVER (PARTITION BY company_id ORDER BY salary DESC) AS row_desc
    FROM
        employees
) ranked
WHERE
    row_asc = row_desc
    OR row_asc + 1 = row_desc
    OR row_asc = row_desc + 1
GROUP BY
    company_id
ORDER BY
    company_id;
#15.  SQL Quary to get the nth highest salary from Employee table Note: Add "GitHub" link for the solution if required  
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 4, 1;

#14.  Write an SQL query to
# fetch the second highest number from the "student" table.? Note: Add "GitHub" link for the solution if required 


select * from (
select row_number() over(partition by student_id order by numbers desc ) t1
from strudent) t2
 where t1 =2;
 
 #13.  Write an SQL query to retrieve the names and addresses 
 #of all persons from the "Person" table along with their corresponding addresses from the "Address" table.
 
 select t1.firstnames,t2.address
 from persons t1
 join addresses t2
 on t1.person_id=t2.persons_id;
 #12.  Write an SQL query to find the youngest student in the "student" table ? Note: Add "GitHub" link for the solution if required  
 
 SELECT *
FROM student
ORDER BY birthdate DESC
LIMIT 1;
#11. Create Student Table with ID as Primary Key and NOT NULL ,
# Name as 20 Characters ,Age as Int value both are NOT NULL and Address have  25 charter And Insert Any 5 Records?
CREATE TABLE Student (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(25)
);

INSERT INTO Student (ID, Name, Age, Address)
VALUES
    (1, 'John Doe', 20, '123 Main St'),
    (2, 'Jane Smith', 22, '456 Elm St'),
    (3, 'Michael Johnson', 19, '789 Oak Ave'),
    (4, 'Emily Williams', 21, '567 Pine Rd'),
    (5, 'David Brown', 20, '890 Maple Ave');
    
  #18.  Write the Query to find the Shortest Distance in Plane Note: Add "GitHub" link for the solution if required   
    SELECT
    x,
    y,
    SQRT((x - (-1))^2 + (y - (-1))^2) AS distance_to_point1,
    SQRT((x - 0)^2 + (y - 0)^2) AS distance_to_point2
FROM
    temp_table; 





