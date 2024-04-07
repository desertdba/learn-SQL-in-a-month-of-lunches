/*
In chapter 15, we used this query with the COALESCE function to evaluate null values in the MiddleName column of the authors table.
*/
SELECT CONCAT(FirstName, ' ', COALESCE(MiddleName, ''), ' ', LastName) as AuthorName
FROM author;


/*
Use COALSECE to evaluate three different expressions, returning the first one that isn't NULL.
*/ 
SELECT COALESCE(NULL, NULL, 'I am not null!') AS CoalesceTest;


/*
Use COALSECE to evaluate two  different expressions, returning the first one that isn't NULL.
*/
SELECT IFNULL(NULL, 'I am not null!') AS IfNullTest;


/*
SELECT all titles and the total quantity sold for each title.
Titles that have not been sold will show as NULL instead of 0.
*/
SELECT
    t.TitleName,
    SUM(oi.Quantity) AS TotalQuantity
FROM title t
LEFT JOIN orderitem oi
    ON t.TitleID = oi.TitleID
LEFT JOIN orderheader oh
    ON oh.OrderID = oi.OrderID
GROUP BY t.TitleName
ORDER BY t.TitleName;


/*
SELECT all titles and the total quantity sold for each title, but using IFNULL.
Titles that have not been sold will show as 0 instead of NULL.
We could use COALESCE instead of IFNULL to get the same result.
*/
SELECT
    t.TitleName,
    IFNULL(SUM(oi.Quantity),0) AS TotalQuantity
FROM title t
LEFT JOIN orderitem oi
    ON t.TitleID = oi.TitleID
LEFT JOIN orderheader oh
    ON oh.OrderID = oi.OrderID
GROUP BY t.TitleName
ORDER BY t.TitleName;


/*
Use a simple CASE expression to return results based on whether or not the Price of a title is $7.95.
*/
SELECT
    TitleName,
    Price,
    CASE Price
        WHEN 7.95 THEN 'This title is $7.95.'
        ELSE 'This title is not $7.95.'
        END AS IsPrice795
FROM title;
 

/*
Use a simple CASE expression along with the ROUND function to return results based on whether or not the Price of a title is around $8.00.
*/
SELECT
    TitleName,
    Price,
    CASE ROUND(Price, 0)
        WHEN 8 THEN 'This title is around $8.'
        ELSE 'This title is not around $8.'
        END AS IsPriceAround8Dollars
FROM title;


/*
Use a searched CASE expression to evaluate if the Price of a title is less than, equal to, or more than $8.00.
*/
SELECT
    TitleName,
    Price,
    CASE
        WHEN Price < 8.00 THEN 'This title is less than $8.00.'
        WHEN Price = 8.00 THEN 'This title is $8.00.'
        WHEN Price > 8.00 THEN 'This title is more than $8.00.'
        END AS IsPriceAround8Dollars
FROM title;




/*

SELECT
    PromotionCode,
    LEFT(PromotionCode, 1) AS PromotionCodeLeft1,
    CASE LEFT(PromotionCode, 1)
        WHEN 1 THEN 'This promotion is for $1 off.'
        WHEN 2 THEN 'This promotion is for $2 off.'
        WHEN 3 THEN 'This promotion is for $3 off.'
        END AS PromotionDiscount
FROM promotion;


# You cannot evaluate with for equality with NULL, because NULL can never equal NULL 
SELECT
    FirstName,
    CASE MiddleName
        WHEN NULL THEN ''
        ELSE MiddleName
        END AS MiddleName,
    LastName
FROM author;

SELECT
    TitleName,
    Price,
    CASE
        WHEN Price < 9.95 THEN 'Affordable'
        WHEN Price = 9.95 THEN 'Moderately priced'
        WHEN Price > 9.95 THEN 'Expensive.'
        END AS PriceRating
FROM title;

*/



/* IF THEN ELSE END */


/*
DELIMITER //


CREATE PROCEDURE GetItemPriceDescription (
    IN _OrderID int,
    IN _OrderItem int
 )
 
SELECT @ItemPrice := ItemPrice
FROM orderitem
WHERE OrderID = _OrderID
    AND OrderItem = _OrderItem;

#SELECT @ItemPrice;
 
BEGIN 
 IF @ItemPrice < 9.95 THEN
    SELECT 'This title is affordable.' AS ItemPriceDescription;
 ELSE SELECT 'XXX' AS ItemPriceDescription
  END IF;  
END;  
    
 IF @ItemPrice = 9.95 BEGIN
    SELECT 'This title is moderately priced.' AS ItemPriceDescription;
    END
ELSE BEGIN
    SELECT 'This title is expensive.' AS ItemPriceDescription
    END;
*/



/*
### IF THEN ELSE ###

From Chapter 16
INSERT INTO promotion (
    PromotionID,
    PromotionCode,
    PromotionStartDate,
    PromotionEndDate 
    ) 
VALUES (
    13,
    '2OFF2022',
    '2022-05-01 00:00:00',
    '2022-05-15 00:00:00'
    );

From Chapter 18
ALTER TABLE promotion ADD CONSTRAINT PK_promotion PRIMARY KEY (PromotionID);

*/

/* 
SHOW COLUMNS FROM promotion;


*/

/*
DROP PROCEDURE AddPromotion;

DELIMITER //

CREATE PROCEDURE AddPromotion (
    IN _PromotionCode varchar(10),
    IN _PromotionStartDate datetime,
    IN _PromotionEndDate datetime
 )
 BEGIN
 
SELECT @ExistingPromtionCode := PromotionCode
FROM promotion
WHERE PromotionCode = _PromotionCode;

IF @ExistingPromtionCode IS NULL THEN
    INSERT INTO promotion (
    PromotionCode, 
    PromotionStartDate, 
    PromotionEndDate
    )
    SELECT (    
        _PromotionCode,
        _PromotionStartDate,
        _PromotionEndDate
        );
END IF;

END //
    
DELIMITER ;
*/
/*
DROP PROCEDURE AddPromotion;
*/


/*
Create a stored procedure named AddPromotion to add rows to the promotion table.
We include an IF...THEN... check to only insert if the value for _PromotionCode is not NULL.
*/
DELIMITER //

CREATE PROCEDURE AddPromotion (
    IN _PromotionID int,
    IN _PromotionCode varchar(10),
    IN _PromotionStartDate datetime,
    IN _PromotionEndDate datetime
 )
 BEGIN

IF _PromotionCode IS NOT NULL THEN
    INSERT INTO promotion (
    PromotionID,
    PromotionCode, 
    PromotionStartDate, 
    PromotionEndDate
    )
    SELECT
        _PromotionID,
        _PromotionCode,
        _PromotionStartDate,
        _PromotionEndDate
        ;
END IF;

END //
    
DELIMITER ;

/*
Add a new row to the promotion table using our AddPromotion stored procedure.
This execution should be successful since there is a value provided for _PromotionCode.
*/
CALL AddPromotion (14, '2OFF2023', '2023-01-04', '2023-02-11');


/*
Validate the execution was successful, and there is a row for PromotionID 14.
*/
SELECT *
FROM promotion
WHERE PromotionID = 14;


/*
Attempt to a new row to the promotion table using our AddPromotion stored procedure.
This execution should not be successful since there is no value provided for _PromotionCode.
*/
CALL AddPromotion (15, NULL, '2023-07-04', '2023-07-11');


/*
Validate the execution was not successful, and there is no row for PromotionID 15.
*/
SELECT *
FROM promotion
WHERE PromotionID = 15;


/*
DROP and re-create the AddPromotion stored procedure.
We will add IF...THEN...ELSE... to return a message if _PromotionCode is NULL.
*/
DROP PROCEDURE AddPromotion;

DELIMITER //

CREATE PROCEDURE AddPromotion (
    IN _PromotionID int,
    IN _PromotionCode varchar(10),
    IN _PromotionStartDate datetime,
    IN _PromotionEndDate datetime
 )
 BEGIN

IF _PromotionCode IS NOT NULL THEN
    INSERT INTO promotion (
    PromotionID,
    PromotionCode, 
    PromotionStartDate, 
    PromotionEndDate
    )
    SELECT
        _PromotionID,
        _PromotionCode,
        _PromotionStartDate,
        _PromotionEndDate
        ;
ELSE 
	SELECT 'No PromotionCode, INSERT skipped.' AS Message;
END IF;

END //
    
DELIMITER ;

