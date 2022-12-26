/*
Select all records from the orderitem table
*/
SELECT *
FROM orderitem;


/*
Select title ID and title name from title for the title names of Pride and Predicates and The Join Luck Club
*/
SELECT
    TitleID,
    TitleName
FROM title
WHERE TitleName IN ('Pride and Predicates', 'The Join Luck Club')
ORDER BY TitleID;


/*
Select customer ID and name from customer where name is Chris Dixon or David Power
*/
SELECT
 CustomerID,
 FirstName,
 LastName
FROM customer
WHERE (FirstName = 'Chris' AND LastName = 'Dixon')
 OR (FirstName = 'David' AND LastName = 'Power')
ORDER BY CustomerID;


/*
Select customer ID and customer name for order 1001 by joining the orderheader and customer tables
*/
SELECT 
 orderheader.CustomerID,
 customer.FirstName,
 customer.LastName
FROM orderheader
JOIN customer ON orderheader.CustomerID = customer.CustomerID
WHERE orderheader.OrderID = 1001;


/*
Select customer ID, customer name, and item price for itmes ordered in order 1001 by joining the orderheader, customer, and orderitem tables
*/
SELECT 
 orderheader.CustomerID,
 customer.FirstName,
 customer.LastName,
 orderitem.ItemPrice
FROM orderheader
JOIN customer ON orderheader.CustomerID = customer.CustomerID
JOIN orderitem ON orderheader.OrderID = orderitem.OrderID
WHERE orderheader.OrderID = 1001;


/*
Select customer ID, customer name, item price, and title name for itmes ordered in order 1001 by joining the orderheader, customer, orderitem, and title tables
*/
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

/* 
Replace the table names of the previous query with aliases 
*/
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


/*
Using the same query as previous, but putting all the predicates in the WHERE clause
*/
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
 

 
 
 
 