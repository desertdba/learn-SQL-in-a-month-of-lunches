/* 
Create stored procedure GetTitleTotalQuantitySoldListPrice.
This will use a cursor to evaluate if titles were purchased at list price.
*/
DELIMITER //

CREATE PROCEDURE GetTitleTotalQuantitySoldListPrice(
    OUT _TotalQuantitySold int
    )
BEGIN

DECLARE _Done boolean DEFAULT FALSE;

DECLARE _OrderID int;

DECLARE AllOrders CURSOR FOR 
SELECT OrderID
FROM orderheader;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET _Done = TRUE;

SET _TotalQuantitySold = 0;

OPEN AllOrders;

GetOrders: LOOP

    FETCH AllOrders INTO _OrderID;

    SET _TotalQuantitySold = _TotalQuantitySold + 
        (SELECT COALESCE(SUM(Quantity),0)
        FROM title t
        INNER JOIN orderitem oi
		     ON t.TitleID = oi.TitleID
             AND t.Price = oi.ItemPrice	
        WHERE oi.OrderID = _OrderID
        );

		IF _Done = TRUE THEN 
            LEAVE GetOrders;
		END IF;
        
    END LOOP GetOrders;
    
    CLOSE AllOrders;

END //

DELIMITER ;


/*
Execute GetTitleTotalQuantitySoldListPrice to get the value of the output parameter @TotalQuantitySold.
Then, SELECT @TotalQuantitySold to see the value of the parameter.  
*/
CALL GetTitleTotalQuantitySoldListPrice(@TotalQuantitySold);
SELECT @TotalQuantitySold AS TotalQuantitySold;


/*
DROP and recreate the stored procedure GetTitleTotalQuantitySoldListPrice.
Instead of a cursor, this will use a WHILE loop to evaluate if titles were purchased at list price.
*/
DROP PROCEDURE GetTitleTotalQuantitySoldListPrice;

DELIMITER //

CREATE PROCEDURE GetTitleTotalQuantitySoldListPrice(
    OUT _TotalQuantitySold int
    )
BEGIN
DECLARE _OrderID int;

SET _TotalQuantitySold = 0;

SET _OrderID = (SELECT MIN(OrderID) FROM orderheader);

WHILE _OrderID IS NOT NULL DO
    SET _TotalQuantitySold = _TotalQuantitySold + 
        (SELECT COALESCE(SUM(Quantity),0)
        FROM title t
        INNER JOIN orderitem oi
		     ON t.TitleID = oi.TitleID
             AND t.Price = oi.ItemPrice	
        WHERE oi.OrderID = _OrderID
        );
        
	SET _OrderID = (SELECT MIN(OrderID) FROM orderheader WHERE OrderID > _OrderID);
    
    END WHILE;
END //

DELIMITER ;
    
/*
Execute GetTitleTotalQuantitySoldListPrice again to get the value of the output parameter @TotalQuantitySold.
Then, SELECT @TotalQuantitySold to see the value of the parameter.  
*/
CALL GetTitleTotalQuantitySoldListPrice(@TotalQuantitySold);
SELECT @TotalQuantitySold AS TotalQuantitySold;




/*
DROP and recreate the stored procedure GetTitleTotalQuantitySoldListPrice.
Instead of selecting OrderID values from the orderheader table, this will use a temporary table to avoid possible blocking.
This will still use a WHILE loop to evaluate if titles were purchased at list price.
 */
DROP PROCEDURE GetTitleTotalQuantitySoldListPrice;

DELIMITER //

CREATE PROCEDURE GetTitleTotalQuantitySoldListPrice(
    OUT _TotalQuantitySold int
    )
BEGIN
DECLARE _OrderID int;

SET _TotalQuantitySold = 0;

CREATE TEMPORARY TABLE orderheadertemp (OrderID int);

INSERT orderheadertemp (OrderID)
SELECT OrderID
FROM orderheader;

SET _OrderID = (SELECT MIN(OrderID) FROM orderheadertemp);

WHILE _OrderID IS NOT NULL DO
    SET _TotalQuantitySold = _TotalQuantitySold + 
        (SELECT COALESCE(SUM(Quantity),0)
        FROM title t
        INNER JOIN orderitem oi
		     ON t.TitleID = oi.TitleID
             AND t.Price = oi.ItemPrice	
        WHERE oi.OrderID = _OrderID
        );
        
	SET _OrderID = (SELECT MIN(OrderID) FROM orderheadertemp WHERE OrderID > _OrderID);
    
    END WHILE;
END //

DELIMITER ;
    
/*
Execute GetTitleTotalQuantitySoldListPrice again to get the value of the output parameter @TotalQuantitySold.
Then, SELECT @TotalQuantitySold to see the value of the parameter.  
*/
CALL GetTitleTotalQuantitySoldListPrice(@TotalQuantitySold);
SELECT @TotalQuantitySold AS TotalQuantitySold;




/* 
Use a SELECT with a GROUP BY to determine the same result as the previous stored procedures
*/
SELECT COALESCE(SUM(Quantity),0) AS TotalQuantitySold
FROM title t
INNER JOIN orderitem oi
    ON t.TitleID = oi.TitleID
    AND t.Price = oi.ItemPrice;
