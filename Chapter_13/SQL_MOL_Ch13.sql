/* 
Set a variable to a string value and SELECT it.
*/
SET @TitleName = 'The Sum Also Rises';

SELECT @TitleName;


/*
SELECT the title ID, title name, and publication date from the title table for the title that matches the variable.
*/
SELECT
 TitleID,
 TitleName,
 PublicationDate
FROM title
WHERE TitleName = @TitleName;


/*
Change the variable and SELECT the title ID, title name, and publication date from the title table for the title that matches the variable again.
*/
SET @TitleName = 'Pride and Predicates';
SELECT @TitleName;

SELECT
 TitleID,
 TitleName,
 PublicationDate
FROM title
WHERE TitleName = @TitleName;


/*
Change the variable and use JOINs to find the dates the title was ordered
*/
SET @TitleName = 'The Sum Also Rises';

SELECT 
 oh.OrderDate
FROM orderheader oh
INNER JOIN orderitem oi
 ON oh.OrderID = oi.OrderID
INNER JOIN title t
 ON oi.TitleID = t.TitleID
WHERE t.TitleName = @TitleName;


/*
SET variables for start and end dates, then find the customer names and order dates for all orders in the range of dates by filtering in the WHERE clause.
*/
SET @DateStart = '2021-11-01',
    @DateEnd = '2021-11.30';

SELECT 
 c.FirstName,
 c.LastName,
 oh.OrderDate
FROM customer c
INNER JOIN orderheader oh
 ON c.CustomerID = oh.CustomerID
WHERE oh.OrderDate BETWEEN @DateStart and @DateEnd; 


/*
SET variables for start and end dates, then find the customer names and order dates for all orders in the range of dates by fitering in the FROM clause.
*/
SET 
 @DateStart = '2021-11-01',
 @DateEnd = '2021-11-30';

SELECT 
 c.FirstName,
 c.LastName,
 oh.OrderDate
FROM customer c
INNER JOIN orderheader oh
 ON c.CustomerID = oh.CustomerID
 AND oh.OrderDate BETWEEN @DateStart and @DateEnd; 


/*
SET a variable for minimum quantity sold, then using GROUP BY and HAVING deterimine the titles that have sold at least as many quantity as the variable.
*/
SET @MinimumQuantitySold = 10;

SELECT
 t.TitleName,
 SUM(oi.Quantity) as TotalQuantitySold 
FROM orderitem oi
INNER JOIN title t
 ON oi.TitleID = t.TitleID
GROUP BY t.TitleName
HAVING SUM(oi.Quantity) >= @MinimumQuantitySold;



/* 
Re-visit first query from 13.2 
*/
SET @TitleName = 'The Sum Also Rises';

SELECT 
 oh.OrderDate
FROM orderheader oh
INNER JOIN orderitem oi
 ON oh.OrderID = oi.OrderID
INNER JOIN title t
 ON oi.TitleID = t.TitleID
WHERE t.TitleName = @TitleName;


/*
Find the title ID for the variable.
*/
SET @TitleName = 'The Sum Also Rises';

SELECT TitleID
FROM title
WHERE TitleName = @TitleName;


/*
Set a variable for the title, then set variable for the title ID, then find the order dates for the title ID.
*/
SET @TitleName = 'The Sum Also Rises';

SELECT @TitleID := TitleID
FROM title
WHERE TitleName = @TitleName;

SELECT 
 oh.OrderDate
FROM orderheader oh
INNER JOIN orderitem oi
 ON oh.OrderID = oi.OrderID
WHERE oi.TitleID = @TitleID;
 

/* 
Find first order date of 2021, the first way with a sub query */
SET @FirstOrderDate = (
 SELECT MIN(OrderDate)
 FROM orderheader
 WHERE OrderDate BETWEEN '2021-01-01' AND '2021-12-31');

SELECT @FirstOrderDate as FirstOrderDate;

/* 
Find the first order date of 2021 without a sub query. 
In this case, you must use the := assignment operator because, within the SELECT statement, MySQL treats the = operator as an equality evaluation. 
Remember, we want to assign a value to @FirstOrderHeader. We can't evaluate it for equality because it doesn't have a value yet.
*/
SELECT @FirstOrderDate := MIN(OrderDate)
FROM orderheader
WHERE OrderDate BETWEEN '2021-01-01' AND '2021-12-31';

SELECT @FirstOrderDate as FirstOrderDate;


/*
Using logic from the previous query, find the first order of 2021, to select the title, quantity, and price of the order placed on that day.
*/
SELECT @FirstOrderDate := MIN(OrderDate)
FROM orderheader
WHERE OrderDate BETWEEN '2021-01-01' AND '2021-12-31';

SELECT
 t.TitleName,
 oi.Quantity, 
 oi.ItemPrice
FROM orderheader oh
INNER JOIN orderitem oi
 ON oh.OrderID = oi.OrderID
INNER JOIN title t
 ON oi.TitleID = t.TitleID
WHERE oh.OrderDate = @FirstOrderDate;


/*
Assign a value of null to a variable.
*/
SET @NullVariableWithSET = null;

SELECT @NullVariableWithSELECT;


/*
Change the data type of a variable by changing the value.
*/
SET @SomeVariable = 1;

SELECT @SomeVariable as FirstValue;

SET @SomeVariable = 'The Sum Also Rises';

SELECT @SomeVariable as SecondValue;
