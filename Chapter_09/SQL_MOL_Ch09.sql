/*
The join we learned in Chapter 8, showing all orders that used a promotional code.
*/
SELECT
 oh.OrderID,
 p.PromotionCode
FROM orderheader oh
JOIN promotion p
 ON oh.PromotionID = p.PromotionID;


/*
The join showing all orders that used a promotional code, explicitly using using INNER JOIN.
*/
SELECT
 oh.OrderID,
 p.PromotionCode
FROM orderheader oh
INNER JOIN promotion p
 ON oh.PromotionID = p.PromotionID;



/*
Using a LEFT OUTER JOIN to show all orders, and a promotion code if used.
*/
SELECT
 oh.OrderID,
 p.PromotionCode
FROM orderheader oh
LEFT OUTER JOIN promotion p
 ON oh.PromotionID = p.PromotionID;
 
 
/*
Using a LEFT OUTER JOIN to show the first 8 orders, and a promotion code if used.
*/
SELECT
 oh.OrderID,
 p.PromotionCode
FROM orderheader oh
LEFT OUTER JOIN promotion p
 ON oh.PromotionID = p.PromotionID
WHERE oh.OrderID <= 1008;


/*
Using a LEFT OUTER JOIN to show all orders, but filtering on a column in the right joined table (promotion) in the WHERE clause.
Doing this restricts null values in the PromotionCode column from being returned, which effectively changes our join to an INNER JOIN.
*/ 
SELECT
 oh.OrderID,
 p.PromotionCode
FROM orderheader oh
LEFT OUTER JOIN promotion p
 ON oh.PromotionID = p.PromotionID
WHERE p.PromotionCode = '2OFF2015';
 
 
/*
Using a LEFT OUTER JOIN to show all orders, but filtering on a column in the right joined table (promotion) in the join.
Doing this still allows null values in the PromotionCode column to being returned, which results in all order IDs being represented in the results.
*/ 
SELECT
 oh.OrderID,
 p.PromotionCode
FROM orderheader oh
LEFT OUTER JOIN promotion p
 ON oh.PromotionID = p.PromotionID
 AND p.PromotionCode = '2OFF2015';
 

/*
Using a RIGHT OUTER JOIN to show all promotion codes and any order IDs where the promotion code was used.
Several promotion codes are used for more than one order, and some were not used for any orders.
*/
SELECT
 p.PromotionCode,
 oh.OrderID
FROM orderheader oh
RIGHT OUTER JOIN promotion p
 ON oh.PromotionID = p.PromotionID; 


/*
Using a RIGHT OUTER JOIN to show all promotion codes not used in any order.
We can do this in a RIGHT OUTER JOIN by filtering for only the null values in the left table.
*/
SELECT
 p.PromotionCode,
 oh.OrderID
FROM orderheader oh
RIGHT OUTER JOIN promotion p
 ON oh.PromotionID = p.PromotionID
WHERE oh.PromotionID IS NULL;


/*
Using a LEFT OUTER JOIN to show all promotion codes not used in any order.
We can do this in a LEFT OUTER JOIN by filtering for only the null values in the right table.
*/
SELECT
 p.PromotionCode,
 oh.OrderID
FROM promotion p
LEFT OUTER JOIN orderheader oh
 ON p.PromotionID = oh.PromotionID
WHERE oh.PromotionID IS NULL; 


/*
The same query as the previous one, except we have shortened the LEFT OUTER JOIN to LEFT JOIN.
*/
SELECT
 p.PromotionCode,
 oh.OrderID
FROM promotion p
LEFT JOIN orderheader oh
 ON p.PromotionID = oh.PromotionID
WHERE oh.PromotionID IS NULL;  


/*
The same query as the previous one, except we are using the USING keyword instead of ON.
*/
 SELECT
 p.PromotionCode,
 oh.OrderID
FROM promotion p
LEFT JOIN orderheader oh
 USING (PromotionID)
WHERE oh.PromotionID IS NULL;  


/*
The same query as the previous one, except we have changed the join to a NATURAL join.
*/
SELECT
 p.PromotionCode,
 oh.OrderID
FROM promotion p
NATURAL LEFT JOIN orderheader oh
WHERE oh.PromotionID IS NULL;  


/*
Using a CROSS JOIN (Cartesian join) to show all possible combinations of promotion codes and order IDs.
*/ 
SELECT
 p.PromotionCode,
 oh.OrderID
FROM promotion p
CROSS JOIN orderheader oh;
 
SELECT
 p.PromotionCode,
 oh.OrderID
FROM promotion p
JOIN orderheader oh; 
 
 /*
 There is no FULL JOIN or FULL OUTER JOIN in MySQL
 */
 
 /*
 Self join
 select * from customer;
 */
 SELECT
	c1.FirstName FirstName1,
    c1.LastName LastName1,
    c2.FirstName FirstName2,
    c2.LastName LastName2,
    c1.State
FROM customer c1
JOIN customer c2
 ON c1.State = c2.State
WHERE c1.State = 'AZ';
 
 SELECT
	c1.FirstName FirstName1,
    c1.LastName LastName1,
    c2.FirstName FirstName2,
    c2.LastName LastName2,
    c1.State
FROM customer c1
JOIN customer c2
 ON c1.State = c2.State
WHERE c1.State = 'AZ'
 AND c1.LastName <> c2.LastName; 
 
 /*
 Lab:
 For example, you may be asked:
 to review a list of orders for a given year to see if they included a particular product, or 
 to find the names of all customers who didn’t place an order in 2021, or 
 to find a list of all products that were ordered along with some other product.
 
 1. Write a query to find all the order ID of any order that does not have a promotional code
 
 2. Write a query to show all customers who have not placed an order in the last year
 
 SELECT c.*, oh.OrderDate
 FROM customer c
 LEFT JOIN orderheader oh
  ON c.CustomerID = oh.CustomerID
WHERE oh.OrderDate > '2021-01-01';

SELECT * from customer;

1. Write a query that shows the order ID and order date of all orders from 2020, and also the title and price for any order containing title “Pride and Predicates”.
2. Write a query to show the first and last names of all customers who did not place an order in 2021.
3. Write a query to show the first and last names of all customers in California (where the value for State is CA) and if they placed and order in 2021.
/*
4. This wasn’t mentioned at the beginning of the chapter, but use a cross join to generate a list of all possible customer first and last names.
*/

SELECT
 oh.OrderID,
 p.PromotionCode
FROM orderheader oh
LEFT JOIN promotion p
 ON oh.PromotionID = p.PromotionID
WHERE oh.OrderDate >= '2019-01-01'
 AND oh.OrderDate < '2020-01-01';

SELECT
 c.FirstName,
 c.LastName
FROM customer c
LEFT JOIN orderheader oh
 ON c.CustomerID = oh.CustomerID
 AND oh.OrderDate >= '2020-01-01'
 AND oh.OrderDate < '2021-01-01'
WHERE oh.CustomerID IS  NULL;

SELECT
 c.FirstName,
 c.LastName,
 oh.OrderID,
 oh.OrderDate
FROM customer c
LEFT JOIN orderheader oh
 ON c.CustomerID = oh.CustomerID
 AND oh.OrderDate >= '2021-01-01'
 AND oh.OrderDate < '2022-01-01'
WHERE c.State = 'CA';

SELECT
 c.FirstName,
 a.LastName
FROM customer c
CROSS JOIN author a;
