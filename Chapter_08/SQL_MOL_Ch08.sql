/*
select * from orderitem order by orderid, orderitem;

Mistakes corrected:
-1013 has order item and quantity reversed
-1014 has order 2 rows with order item 1
-1016 has order item and quantity reversed
-1034 has the same title for item 1 and 2
*/
/*
# DROP TABLE OrderTable;

CREATE TABLE OrderTable (
	OrderDate datetime NOT NULL,
	TitleName varchar(50) NOT NULL,
	Price decimal (5,2) NOT NULL,
    CustomerFirstName varchar(50) NOT NULL,
    CustomerLastName varchar(50) NOT NULL
	);

INSERT INTO OrderTable(OrderDate, TitleName, Price, CustomerFirstName, CustomerLastName)
VALUES('2020-01-01', 'Pride and Predicates', 7.95, 'Leo', 'Khan'),
	('2020-01-01', 'TheJOIN Luck Club', 7.95, 'Leo', 'Khan'),
    ('2020-01-01', 'TheJOIN Luck Club', 7.95, 'Leo', 'Khan'),
    ('2020-02-02', 'Pride and Predicates', 9.95, 'Mia', 'Lee'),
    ('2020-02-02', 'TheJOIN Luck Club', 9.95, 'Mia', 'Lee');





select * from orderitem;

select * from customer;
*/
# DROP TABLE OrderTable;

CREATE TABLE OrderTable (
	OrderDate datetime NOT NULL,
	TitleName varchar(50) NOT NULL,
	Price decimal (5,2) NOT NULL,
    CustomerFirstName varchar(50) NOT NULL,
    CustomerLastName varchar(50) NOT NULL
	);

INSERT INTO OrderTable(OrderDate, TitleName, Price, CustomerFirstName, CustomerLastName)
/*
VALUES
	('2015-08-12', 'Pride and Predicates', 9.95, 'Chris', 'Dixon'),
	('2015-11-15', 'Pride and Predicates', 7.95, 'Cora', 'Daly'),
	('2015-11-15', 'Pride and Predicates', 7.95, 'Cora', 'Daly'),
    ('2019-02-24', 'The DateTime Machine', 7.95, 'Chris', 'Dixon'),
    ('2020-11-07', 'The DateTime Machine', 5.95, 'Cora', 'Daly');
    */
SELECT OrderDate, TitleName, Price, FirstName, LastName
FROM orderheader oh
JOIN orderitem oi ON oh.OrderID = oi.OrderID
JOIN customer c ON oh.CustomerID = c.CustomerID
JOIN title t ON oi.TitleID = t.TitleID
WHERE oh.orderid in (1001,1002, 1012, 1023)
ORDER BY OrderDate;

SELECT *
FROM OrderTable;

/*
SELECT * from OrderHeader where customerID in (1,2);

SELECT *
FROM OrderItem
WHERE orderid in (SELECT orderid from OrderHeader where customerID in (1,2));


SELECT * from OrderHeader where orderid in (1004, 1014);

SELECT *
FROM OrderItem
WHERE orderid in (1001,1002, 1012, 1023);



#WHERE TitleName = 'The DateTime Machine';
*/

SELECT
 TitleID,
 TitleName
FROM title
WHERE TitleName IN ('Pride and Predicates', 'TheJOIN Luck Club');

/* recreate OrderTable with TitleID instead of TitleName */
# DROP TABLE OrderTable;

CREATE TABLE OrderTable (
	OrderDate datetime NOT NULL,
	TitleID int NOT NULL,
	Price decimal (5,2) NOT NULL,
    CustomerFirstName varchar(50) NOT NULL,
    CustomerLastName varchar(50) NOT NULL
	);

INSERT INTO OrderTable(OrderDate, TitleID, Price, CustomerFirstName, CustomerLastName)
SELECT OrderDate, t.TitleID, Price, FirstName, LastName
FROM orderheader oh
JOIN orderitem oi ON oh.OrderID = oi.OrderID
JOIN customer c ON oh.CustomerID = c.CustomerID
JOIN title t ON oi.TitleID = t.TitleID
WHERE oh.orderid in (1001,1002, 1012, 1023)
ORDER BY OrderDate;

SELECT *
FROM OrderTable;

SELECT
 CustomerID,
 FirstName,
 LastName
FROM customer
WHERE (FirstName = 'Chris' AND LastName = 'Dixon')
 OR (FirstName = 'David' AND LastName = 'Power')
ORDER BY CustomerID;


# DROP TABLE OrderTable;

CREATE TABLE OrderTable (
	OrderDate datetime NOT NULL,
	TitleID int NOT NULL,
	Price decimal (5,2) NOT NULL,
    CustomerID int NOT NULL
	);

INSERT INTO OrderTable(OrderDate, TitleID, Price, CustomerID)
SELECT OrderDate, t.TitleID, Price, c.CustomerID
FROM orderheader oh
JOIN orderitem oi ON oh.OrderID = oi.OrderID
JOIN customer c ON oh.CustomerID = c.CustomerID
JOIN title t ON oi.TitleID = t.TitleID
WHERE oh.orderid in (1001,1002, 1012, 1023)
ORDER BY OrderDate;

SELECT *
FROM OrderTable
ORDER BY OrderDate;

SELECT CustomerID
FROM orderheader
WHERE OrderID = 1001;

SELECT 
 orderheader.CustomerID,
 customer.FirstName,
 customer.LastName
FROM orderheader
JOIN customer ON orderheader.CustomerID = customer.CustomerID
WHERE orderheader.OrderID = 1001;

SELECT 
 orderheader.CustomerID,
 customer.FirstName,
 customer.LastName,
 orderitem.ItemPrice
FROM orderheader
JOIN customer ON orderheader.CustomerID = customer.CustomerID
JOIN orderitem ON orderheader.OrderID = orderitem.OrderID
WHERE orderheader.OrderID = 1001;

SELECT 
 orderheader.CustomerID,
 customer.FirstName,
 customer.LastName,
 orderitem.ItemPrice,
 title.TitleName
FROM orderheader
JOIN customer ON orderheader.CustomerID = customer.CustomerID
JOIN orderitem ON orderheader.OrderID = orderitem.OrderID
JOIN title ON orderitem.TitleID = title.TitleID
WHERE orderheader.OrderID = 1001;

/* replace the table names with aliases */
SELECT 
 oh.CustomerID,
 c.FirstName,
 c.LastName,
 oi.ItemPrice,
 t.TitleName
FROM orderheader oh
JOIN customer c ON oh.CustomerID = c.CustomerID
JOIN orderitem oi ON oh.OrderID = oi.OrderID
JOIN title t ON oi.TitleID = t.TitleID
WHERE oh.OrderID = 1001;

SELECT 
 oh.CustomerID,
 c.FirstName,
 c.LastName,
 oi.ItemPrice,
 t.TitleName
FROM orderheader oh, customer c, orderitem oi, title t
WHERE oh.OrderID = 1001
 AND oh.CustomerID = c.CustomerID
 AND oh.OrderID = oi.OrderID
 AND oi.TitleID = t.TitleID;
 
 
 /* Lab 
 What is the difference between switching tables used in the WHERE 
 Find all the 
 Add aliases to a query
 Fix a query withJOINs in the WHERE clause
 */
 #1
 SELECT
  t.TitleName
FROM orderheader oh
JOIN customer c ON oh.CustomerID = c.CustomerID
JOIN orderitem oi ON oh.OrderID = oi.OrderID
JOIN title t ON oi.TitleID = t.TitleID
WHERE oh.OrderID = 1001;

 SELECT
 t.TitleName
FROM orderheader oh
JOIN customer c ON oh.CustomerID = c.CustomerID
JOIN orderitem oi ON oh.OrderID = oi.OrderID
JOIN title t ON oi.TitleID = t.TitleID
WHERE oi.OrderID = 1001;
 
  #2
 SELECT
  oh.OrderID
FROM orderheader oh
JOIN customer c ON oh.CustomerID = c.CustomerID
WHERE c.FirstName = 'Chris' 
AND c.LastName = 'Dixon';
 
#3 
SELECT
 c.FirstName,
 c.LastName,
 oh.OrderDate
FROM orderheader oh
JOIN customer c ON oh.CustomerID = c.CustomerID
WHERE oh.OrderDate >= '2015-01-01 00:00:00' 
AND oh.OrderDate < '2016-01-01 00:00:00';
 
 select * from orderheader;
 
 SELECT 
 customer.FirstName,
 customer.LastName
FROM title, orderheader, customer, orderitem
WHERE title.TitleName = 'The Sum Also Rises'
 AND orderheader.OrderID = orderitem.OrderID
 AND orderitem.TitleID = title.TitleID
 AND orderheader.CustomerID = customer.CustomerID; 
 
 SELECT 
 c.FirstName,
 c.LastName
FROM orderheader oh
JOIN customer c ON oh.CustomerID = c.CustomerID
JOIN orderitem oi ON oh.OrderID = oi.OrderID
JOIN title t ON oi.TitleID = t.TitleID
WHERE t.TitleName = 'The Sum Also Rises';
 
 
 
 