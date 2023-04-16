/*
Using SUM to find the total quantity of titles ordered.
*/
SELECT SUM(Quantity)
FROM orderitem;


/*
Using a column alias with the previous query.
*/
SELECT SUM(Quantity) as TotalQuantity
FROM orderitem;


/*
Using COUNT to find the total number of orders.
*/
SELECT COUNT(OrderID) as TotalOrders
FROM orderheader;


/*
Using COUNT to find the total numbner of orders with a Promotion Code.
*/
SELECT COUNT(PromotionID) as TotalOrdersWithPromotionCode
FROM orderheader;


/*
Using COUNT(*) to find the total number of orders.
*/
SELECT COUNT(*) as TotalRows
FROM orderheader;


/*
Using MIN to find the minimum (lowest) price for any item.
*/
SELECT MIN(ItemPrice) as MinimumItemPrice
FROM orderitem;


/*
Using MAX to find the maximum (highest) price for any item.
*/
SELECT MAX(ItemPrice) as MaximumItemPrice
FROM orderitem;


/*
Using MAX to find the average (mean) price for all items.
*/
SELECT AVG(Price) as AveragePrice
FROM title;


/*
Using MAX to find the average (mean) price for all items placed after January 1st of 2019.
*/
SELECT AVG(Price) as AveragePrice
FROM title
WHERE PublicationDate > '2019-01-01';


/*
Find the minimum (first) order and the maximum (last) order in the saem query.
*/
SELECT
 MIN(OrderDate) as OrderDate,
 MAX(OrderDate) as LastOrder
FROM orderheader;


/*
Determine the total value of all orders.
*/
SELECT SUM(Quantity * ItemPrice) AS TotalOrderValue
FROM orderitem;


/*
Determine the total value of each order, sorted by OrderID.
*/
SELECT OrderID, SUM(Quantity * ItemPrice) as OrderTotal
FROM orderitem
GROUP BY OrderID
ORDER BY OrderID;


/*
Determine the total value of each order placed after January 1st of 2019, sorted by OrderID.
*/
SELECT oi.OrderID, SUM(oi.Quantity * oi.ItemPrice) as OrderTotal
FROM orderitem oi
INNER JOIN orderheader oh
ON oi.OrderID = oh.OrderID
WHERE oh.OrderDate > '2019-01-01'
GROUP BY oi.OrderID
ORDER BY oi.OrderID;


/*
Find the count of orders for all promotion codes, including orders with no promotion code.
*/
SELECT PromotionID, COUNT(*) as RowCount
FROM orderheader
GROUP BY PromotionID
ORDER BY PromotionID;


/*
Find the count of orders for all promotion codes, excluding orders with no promotion code.
*/
SELECT p.PromotionCode, COUNT(oh.PromotionID) as OrdersWithPromotionCode
FROM orderheader oh
INNER JOIN promotion p
ON oh.PromotionID = p.PromotionID
GROUP BY p.PromotionCode
ORDER BY p.PromotionCode;


/*
Find the count of orders for all promotion codes, including only promotion codes used for 3 or more orders.
*/
SELECT p.PromotionCode, COUNT(oh.PromotionID) as OrdersWithPromotionCode
FROM orderheader oh
INNER JOIN promotion p
ON oh.PromotionID = p.PromotionID
GROUP BY p.PromotionCode
HAVING COUNT(oh.PromotionID) >= 3
ORDER BY p.PromotionCode;


/*
Find the count of orders for all promotion codes, including only promotion codes used for 3 or more orders.
This time we are using an alias from the SELECT clause (OrdersWithPromotionCode) in the HAVING clause.
*/
SELECT p.PromotionCode as PromoCode, COUNT(oh.PromotionID) as OrdersWithPromotionCode
FROM orderheader oh
INNER JOIN promotion p
ON oh.PromotionID = p.PromotionID
GROUP BY p.PromotionCode
HAVING OrdersWithPromotionCode >= 3
ORDER BY p.PromotionCode;


/*
Using DISTINCT to remove duplicate rows from the results of the names of all titles included in orders.
*/
SELECT DISTINCT t.TitleName
FROM title t
INNER JOIN orderitem oi
ON t.TitleID = oi.TitleID
ORDER BY t.TitleName;


/*
Using GROUP BY to show the same results as DISTINCT.
*/
SELECT t.TitleName
FROM title t
INNER JOIN orderitem oi
ON t.TitleID = oi.TitleID
GROUP BY t.TitleName
ORDER BY t.TitleName;
