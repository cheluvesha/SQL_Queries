https://www.w3schools.com/sql/sql_intro.asp


SQL is a structured query language used for storing, manipulating and retrieving data in databases.

1]Retrive Queries.
	
SELECT * FROM Customers;

SELECT COL1,COL2
FROM Customers;

SELECT DISTINCT COL1,COL2
FROM Customers

SELECT COL1,COL2
FROM Customers
WHERE COL1 = "Max";

SELECT * FROM Customers
ORDER BY Country;

SELECT * FROM Customers
ORDER BY Country DESC;

2] Null Operator

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT  NULL;



SELECT * FROM Customers
LIMIT 3;


SELECT MIN(Price) AS SmallestPrice
FROM Products;

SELECT MAX(Price) AS SmallestPrice
FROM Products;

SELECT COUNT(ProductID)
FROM Products;

SELECT SUM(Quantity)
FROM OrderDetails;

SELECT AVG(Price)
FROM Products;

3] Like and WildCards

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers
WHERE CustomerName LIKE '_%a';

SELECT * FROM Customers
WHERE City LIKE '[bsp]%';

SELECT * FROM Customers
WHERE City LIKE '[a-c]%';

SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';

SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';

4] IN 

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

5] BETWEEN 

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

SELECT * FROM Products
WHERE ProductName BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"
ORDER BY ProductName;

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;



5] ALIASES

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;


SELECT CustomerID, CustomerName AS Customer
FROM Customers AS 'Customers one";


SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;

6] Joins

The INNER JOIN keyword selects records that have matching values in both tables.

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

The LEFT JOIN keyword returns all records from the left table (table1), and the matched records from the right table (table2). The result is NULL from the right side, if there is no match.

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


The RIGHT JOIN keyword returns all records from the right table (table2), and the matched records from the left table (table1). The result is NULL from the left side, when there is no match.

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

A self JOIN is a regular join, but the table is joined with itself.

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;


DELETE customers 
FROM customers
        LEFT JOIN
    orders ON customers.customerNumber = orders.customerNumber 
WHERE
    orderNumber IS NULL;


UPDATE employees
        LEFT JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * 0.015
WHERE
    merits.percentage IS NULL;

INSERT INTO  authorinfo 
SELECT book_mast.aut_id,book_mast.book_name,author.aut_name,author.country 
FROM book_mast 
LEFT JOIN author
ON book_mast.aut_id=author.aut_id;

DELETE t1,t2 FROM t1
        INNER JOIN
    t2 ON t2.ref = t1.id 
WHERE
    t1.id = 1;


6] GROUP BY - used with aggregate functions

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName

7] HAVING

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;


8] SET

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;


SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;


SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

SELECT City, Country FROM Customers
WHERE City = 'Poland'
INTERSECT
SELECT City FROM Orders
ORDEr BY City;

 
SELECT City, Country FROM Customers
WHERE City = 'Poland'
MINUS
SELECT City FROM Orders
ORDEr BY City;

9] DDL  DML  DQL

DML :

INSERT INTO Customers(FirstName,LastName,City)
Values ('CHELUVESHA','B','Bangalore')

INSERT INTO Customers
Values ('SHIVA','RAJU','Bangalore','India')


UPDATE Customers
SET LastName = 'VESHA'
WHERE FirstName = 'CHELUVESHA' AND City = 'Bangalore';


UPDATE Students
SET USN = 007, Department = 'ECE"
WHERE USN = 009;

DELETE FROM Students 
WHERE USN = 007;

DELETE FROM Students
WHERE USN IN (007,008,009);

DDL:

CREATE Table StudentsCOPY
AS
SELECT * FROM Students;


CREATE Table Students1COPY
AS
SELECT * FROM Students
WHERE USN = 007;

ALTER Table Students1COPY
DROP COLUMN USN;

RENAME Students1COPY to CHELUVESHA;

ALTER Table CHELUVESHA
ADD (Phone Number(10) UNIQUE,
	Email VARCHAR(34) UNIQUE);

DROP Table CHELUVESHA;


DQL :

SELECT FirstName 
FROM CHELUVESHA;


10] SubQuery

SELECT Salary 
FROM (SELECT Distinct Salary
	FROM EMPLOYEES
	ORDER BY Salary DESC)
WHERE LIMIT 2;

SELECT MIN(Salary)
FROM (SELECT DISTINCT Salary
	FROM EMPLOYEES
	ORDER BY Salary DESC)
WHERE LIMIT 4
UNION
SELECT MIN(Salary)
FROM (SELECT DISTINCT Salary
	FROM EMPLOYEES
	ORDER BY Salary DESC)
WHERE LIMIT 8;


11] VIews 

CREATE VIEW DEPARTMENT
AS
SELECT * FROM Students
WHERE DEPART_ID = 'ECE';


DROP VIEW DEPARTMENT


12] CASE

SELECT OrderID, Quantity,
CASE WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

13] Stored Procedure

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

EXEC SelectAllCustomers;


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

EXEC SelectAllCustomers @City = 'London';


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';


14] Comments

--Select all:
SELECT * FROM Customers;

15] INDEX 

CREATE INDEX idx_lastname
ON Persons (LastName);

CREATE INDEX idx_pname
ON Persons (LastName, FirstName); 


16] Loops

DECLARE 
   i number(1); 
   j number(1); 
BEGIN 
   << outer_loop >> 
   FOR i IN 1..3 LOOP 
      << inner_loop >> 
      FOR j IN 1..3 LOOP 
         dbms_output.put_line('i is: '|| i || ' and j is: ' || j); 
      END loop inner_loop; 
   END loop outer_loop; 
END; 

DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 10)
BEGIN
    PRINT 'The counter value is = ' + CONVERT(VARCHAR,@Counter)
    SET @Counter  = @Counter  + 1
END


17] Cursors

DECLARE  
   total_rows number(2); 
BEGIN 
   UPDATE customers 
   SET salary = salary + 500; 
   IF sql%notfound THEN 
      dbms_output.put_line('no customers selected'); 
   ELSIF sql%found THEN 
      total_rows := sql%rowcount;
      dbms_output.put_line( total_rows || ' customers selected '); 
   END IF;  
END; 

Explicit Cursors


DECLARE 
   c_id customers.id%type; 
   c_name customer.name%type; 
   c_addr customers.address%type; 
   CURSOR c_customers is 
      SELECT id, name, address FROM customers; 
BEGIN 
   OPEN c_customers; 
   LOOP 
   FETCH c_customers into c_id, c_name, c_addr; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
   END LOOP; 
   CLOSE c_customers; 
END; 


18] TRIGGERS

create trigger stud_marks 
before INSERT 
on 
Student 
for each row 
set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100;


19] DATE

SELECT DATE_ADD('1998-01-02', INTERVAL 31 DAY);

SELECT ADDDATE('1998-01-02', 31);


SELECT CURDATE();


SELECT DATEDIFF('1997-12-31 23:59:59','1997-12-30');
