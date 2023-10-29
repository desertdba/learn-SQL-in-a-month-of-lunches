/*
The first and last names from the customer table UNION with the first and last names from the author table
*/
SELECT FirstName, LastName, 'customer' TableName
FROM customer
UNION
SELECT FirstName, LastName, 'author'
FROM author
ORDER BY LastName, FirstName;

/*
The first and last names from the customer table where the last name starts with a D,
 UNION with the first and last names from the author table where the first name starts with a C.
A third TableName column has been added to show where there rows have been selected.
*/
SELECT FirstName, LastName, 'customer' TableName
FROM customer
WHERE LastName LIKE 'D%'
UNION
SELECT FirstName, LastName, 'author'
FROM author
WHERE FirstName LIKE 'C%'
ORDER BY LastName, FirstName;

/*
The first names from the customer table where the last name starts with a D,
 UNION with the first names from the author table where the first name starts with a C.
Notice that the duplicate rows for Chris have been removed automatically with UNION.
*/
SELECT FirstName
FROM customer
WHERE LastName LIKE 'D%'
UNION
SELECT FirstName
FROM author
WHERE FirstName LIKE 'C%'
ORDER BY FirstName;

/*
The first names from the customer table where the last name starts with a D,
 UNION ALL with the first names from the author table where the first name starts with a C.
Notice that the duplicate rows for Chris remain with UNION ALL.
*/
SELECT FirstName
FROM customer
WHERE LastName LIKE 'D%'
UNION ALL
SELECT FirstName
FROM author
WHERE FirstName LIKE 'C%'
ORDER BY FirstName;

/*
These queries both return the same results. 
One uses a UNION ALL with separate predicates, and the other combines the filtering in the WHERE clause.
*/
SELECT LastName
FROM customer
WHERE LastName = 'Daly'
UNION ALL
SELECT LastName
FROM customer
WHERE LastName = 'Dixon'
ORDER BY LastName;

SELECT LastName
FROM customer
WHERE LastName = 'Daly'
 OR LastName = 'Dixon'
ORDER BY LastName;

/*
An example of a FULL OUTER JOIN, which is not supported in MySQL.

SELECT
    p.PromotionCode,
    oh.OrderID
FROM orderheader oh 
FULL OUTER JOIN promotion p
    ON oh.PromotionID = p.PromotionID
*/

/*
An example of how to emulate the full outer join in the previous query in MySQL.
*/
SELECT
    p.PromotionCode,
    oh.OrderID
FROM orderheader oh 
LEFT JOIN promotion p
    ON oh.PromotionID = p.PromotionID
UNION ALL
SELECT
    p.PromotionCode,
    oh.OrderID
FROM orderheader oh 
RIGHT JOIN promotion p
    ON oh.PromotionID = p.PromotionID
WHERE oh.PromotionID IS NULL;  

/*
Find the PromotionID values that exist in both the orderheader and promotion tables using INNER JOIN.
*/
SELECT
    oh.PromotionID
FROM orderheader oh
INNER JOIN promotion p
    ON oh.PromotionID = p.PromotionID;

/*
Find the PromotionID values that exist in both the orderheader and promotion tables using INTERSECT.
*** This is not supported in MySQL prior to version 8.0.31. ***
*/

SELECT
    PromotionID
FROM orderheader
INTERSECT
SELECT
    PromotionID
FROM promotion;


/*
Find all the promotion ID values in the promotion table that were not used in any orders in the orderheader table, using a LEFT JOIN. 
*/
SELECT
    p.PromotionID
FROM promotion p
LEFT JOIN orderheader oh
    ON p.PromotionID = oh.PromotionID
WHERE oh.PromotionID IS NULL;

/*
Find all the promotion ID values in the promotion table that were not used in any orders in the orderheader table, using EXCEPT. 
*** This is not supported in MySQL prior to version 8.0.31. ***
*/

SELECT
    PromotionID
FROM promotion
EXCEPT
SELECT
    PromotionID
FROM orderheader;












