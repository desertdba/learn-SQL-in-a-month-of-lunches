
/*
The way someone else created the authorpayment table.
*/
CREATE TABLE authorpayment (
    ID int,
    Author int,
    Title varchar(50),
    PaymentYear char(4),
    PaymentAmount decimal(7,2)
    );

/*
A better way to create the authorpayment table.
This script uses data types that match data types for similar columns in the database.
The script also creates an automatically incrementing column AuthorPaymentID that will serve as the Primary Key.
The script also uses foreign key, check, and NOT NULL constrainsts to insure data integrity.
*/
CREATE TABLE authorpayment (
    AuthorPaymentID int NOT NULL AUTO_INCREMENT,
    AuthorID int NOT NULL,
    TitleID int NOT NULL,
    PaymentYear int NOT NULL CHECK (PaymentYear BETWEEN 2000 AND 2100),
    PaymentAmount decimal(7,2) NOT NULL CHECK (PaymentAmount BETWEEN 0.00 AND 99999.99),
    CONSTRAINT PK_AuthorPayment PRIMARY KEY (AuthorPaymentID),
    CONSTRAINT FK_authorpayment_author FOREIGN KEY (AuthorID) REFERENCES author(AuthorID),
    CONSTRAINT FK_authorpayment_title FOREIGN KEY (TitleID) REFERENCES title(TitleID)
);




/*
The way someone else inserted rows into the authorpayment table, using the InsertAnnualPayment stored procedure.
*/
DELIMITER //

CREATE PROCEDURE InsertAnnualPayment(
    IN _PaymentYear int
    )
BEGIN

DECLARE _Done boolean DEFAULT FALSE;
DECLARE _TitleID int;
DECLARE _AuthorID int;
DECLARE _Royalty decimal(5,2);
DECLARE _AuthorCount int;
DECLARE _TotalSales decimal(7,2);
DECLARE _PaymentAmount decimal(7,2);

DECLARE AllTitles CURSOR FOR 
SELECT TitleID, AuthorID
FROM titleauthor
ORDER BY
    TitleID,
    AuthorOrder;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET _Done = TRUE;

OPEN AllTitles;

GetTitles: LOOP

    FETCH AllTitles INTO _TitleID, _AuthorID;

    SET _Royalty = (
        SELECT Royalty
        FROM title
	    WHERE TitleID = _TitleID
        );
    
    SET _AuthorCount = (
        SELECT COUNT(AuthorID)
        FROM titleauthor
        WHERE TitleID = _TitleID
        );
    
    SET _TotalSales = (
        SELECT SUM(orderitem.Quantity * orderitem.ItemPrice)
        FROM orderheader
        INNER JOIN orderitem
            ON orderheader.OrderID = orderitem.OrderID
		WHERE orderitem.TitleID = _TitleID
            AND YEAR(orderheader.OrderDate) = _PaymentYear
        );
        
    SET _PaymentAmount = COALESCE(CONVERT(((_TotalSales * (_Royalty/100))/_AuthorCount), decimal(7,2)), 0.00);

    IF _PaymentAmount > 0.00 THEN
        INSERT authorpayment (
            AuthorID,
            TitleID,
            PaymentYear,
            PaymentAmount
            )
        SELECT
            _AuthorID,
            _TitleID,
            _PaymentYear,
            _PaymentAmount;
        END IF;

		IF _Done = TRUE THEN 
            LEAVE GetTitles;
		END IF;
        
    END LOOP GetTitles;
    
    CLOSE AllTitles;

END //

DELIMITER ;



/* 
A better way to insert rows into the authorpayment table, using the InsertAnnualPayment stored procedure.
In the updated script, the cursor and all unnecessary variables have been removed to reduce complexity.
The script also has less queries, as well as comments to help others understand the intent of the queries in the stored procedure.
*/
DELIMITER //

CREATE PROCEDURE InsertAnnualPayment(
    IN _PaymentYear int
    )
BEGIN

INSERT authorpayment (
	AuthorID,
	TitleID,
	PaymentYear,
	PaymentAmount
	)
/* Calculate the total royalty per author */
SELECT
    ta.AuthorID,
    ta.TitleID,
    _PaymentYear,
    CONVERT(((sales.TotalSales * (royalty.Royalty/100))/royalty.AuthorCount), decimal(7,2)) AS RoyaltyPerAuthor
FROM titleauthor ta
INNER JOIN (
    /* Determine annual sales by title */  
    SELECT
        oi.TitleID,
        SUM(oi.Quantity * oi.ItemPrice) AS TotalSales
    FROM orderheader oh
    INNER JOIN orderitem oi
        ON oh.OrderID = oi.OrderID
    WHERE oh.OrderDate >= MAKEDATE(@Year, 1)
        AND oh.OrderDate < DATE_ADD(MAKEDATE(@Year, 1), INTERVAL 1 YEAR)
    GROUP BY
        oi.TitleID
    ) sales
    ON ta.TitleID = sales.TitleID
INNER JOIN (
    /* Determine the royalty and count of authors */
    SELECT
        t.TitleID,
        t.Royalty,
        COUNT(ta2.AuthorID) AS AuthorCount
    FROM title t
    INNER JOIN titleauthor ta2
        ON t.TitleID = ta2.TitleID
    GROUP BY 
        t.TitleID,
        t.Royalty
        ) royalty
    ON ta.TitleID = royalty.TitleID;
    
END //

DELIMITER ;



    
 /*
 We could replace the InsertAnnualPayment stored procedure with a view that uses the query below.
 Using a view would reduce redundant data in our database.
 To create the view, we would need to add "CREATE VIEW [ViewName} AS..." before the query.
 */
 SELECT
    ta.AuthorID,
    ta.TitleID,
    oh.OrderID,
    CONVERT(((SUM(oi.Quantity * oi.ItemPrice) * (t.Royalty/100))/ac.AuthorCount), decimal(7,2)) AS RoyaltyPerAuthor
FROM title t
INNER JOIN titleauthor ta
    ON t.TitleID = ta.TitleID
INNER JOIN orderitem oi
    ON ta.TitleID = oi.TitleID
INNER JOIN orderheader oh
    ON oi.OrderID = oh.OrderID
INNER JOIN (
    /* Determine the royalty and count of authors */
    SELECT
        TitleID,
        COUNT(AuthorID) AS AuthorCount
    FROM titleauthor 
    GROUP BY
        TitleID
        ) ac
    ON ta.TitleID = ac.TitleID
 GROUP BY
    ta.AuthorID,
    ta.TitleID,
    oh.OrderID
 