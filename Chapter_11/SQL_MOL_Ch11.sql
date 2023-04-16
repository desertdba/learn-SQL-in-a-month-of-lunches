/*
Margaret Montoya placed one order. When was it?
*/
SELECT 
 oh.OrderID,
 oh.OrderDate
FROM orderheader oh
JOIN customer c
 ON oh.CustomerID = c.CustomerID
WHERE c.FirstName = 'Margaret'
 AND c.LastName = 'Montoya';
 
 
/*
How many orders came after that date?
*/
SELECT 
 OrderID,
 CustomerID,
 OrderDate
FROM orderheader
WHERE OrderDate > '2021-04-23';


/*
Combine these two previous queries into a subquery.
*/
SELECT 
 OrderID,
 CustomerID,
 OrderDate
FROM orderheader
WHERE OrderDate > (
	SELECT 
	 oh.OrderDate
	FROM orderheader oh
	JOIN customer c
	 ON oh.CustomerID = c.CustomerID
	WHERE c.FirstName = 'Margaret'
	 AND c.LastName = 'Montoya'
     );
    
    
/*
What were the books in OrderID 1034?
*/     
SELECT
 t.TitleName
FROM title t
JOIN orderitem oi
 ON oi.TitleID = t.TitleID
WHERE OrderID = 1034;
 
 
/*
The same data, but with a subquery - THIS QUERY FOR EQUALITY WON'T WORK!
*/ 
SELECT
 t.TitleName
FROM title t
WHERE TitleID = (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034
 );
 

/*
The same data, with a subquery using ANY logical operator.
*/ 
SELECT
 t.TitleName
FROM title t
WHERE TitleID = ANY (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034
 );

 
/*
The same data, with a subquery using SOME logical operator.
*/ 
SELECT
 t.TitleName
FROM title t
WHERE TitleID = SOME (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034
 );
 
 
 /*
The same data, but with a subquery using IN logical operator.
*/ 
SELECT
 t.TitleName
FROM title t
WHERE TitleID IN (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034
 );
 

/*
What titles were NOT in this order, with a subquery using NOT IN logical operator.
*/ 
SELECT
 t.TitleName
FROM title t
WHERE TitleID NOT IN (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034);


/*
This query with the ANY won't give you the answers we need.
*/
SELECT
 t.TitleName
FROM title t
WHERE TitleID <> ANY (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034
 );
 
 
 /*
 This query with the ALL operator will.
 */
 SELECT
 t.TitleName
FROM title t
WHERE TitleID <> ALL (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034
 );
 
 
 /*
Using EXISTS to find the titles included in order 1034.
 */
SELECT
    t.TitleName
FROM title t
WHERE EXISTS (
    SELECT TitleID
    FROM orderitem oi
    WHERE OrderID = 1034
    AND t.TitleID = oi.TitleID
    );

 
 /*
 The SELECT clause is not evaluated in a subquery that uses EXISTS, so we can use "1" instead of a column name.
 */
SELECT
 t.TitleName
FROM title t
WHERE EXISTS (
 SELECT 1
 FROM orderitem oi
 WHERE OrderID = 1034
  AND t.TitleID = oi.TitleID
 ); 

 
 /*
 We can also join the results of a subquery to a table.
 */
 SELECT
 t.TitleName
FROM title t
 JOIN (
 SELECT TitleID, OrderID
 FROM orderitem
 WHERE OrderID = 1034
 ) oisq
 ON t.TitleID = oisq.TitleID; 
 
 
 /*
We can also use a join in the FROM clause to find values that are not in the subquery, using the LEFT OUTER JOIN method we used in Chapter 9.
 */
SELECT
 t.TitleName
FROM title t
LEFT JOIN (
 SELECT TitleID
 FROM orderitem
 WHERE OrderID = 1034
 ) oisq
 ON t.TitleID = oisq.TitleID
WHERE oisq.TitleID IS NULL; 


/*
Although this isn't advised for this scenario, we can even use a subquery in the SELECT clause.
*/
SELECT 
 (SELECT TitleName from title t where t.TitleID = oi.TitleID) as TitleName
FROM orderitem oi
WHERE oi.OrderID = 1034;

 