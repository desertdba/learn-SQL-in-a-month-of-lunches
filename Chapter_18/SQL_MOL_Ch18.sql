/*
Create the category table.
*/
CREATE TABLE category (
    CategoryID int,
    CategoryName varchar(20)
    );


/*
Populate the category table.
*/  
INSERT INTO category (CategoryID, CategoryName)
VALUES 
    (1, 'Romance'),
    (2, 'Humor'),
    (3, 'Mystery'),
    (4, 'Fantasy'),
    (5, 'Science Fiction');


/*
Verify the new values added to the category table.
*/  
 SELECT
    CategoryID,
    CategoryName
 FROM category;
 

/*
Add the CategorID column to the title table
*/
ALTER TABLE title 
ADD CategoryID int;
 
 
 /*
 Verify the new CategoryID column exists in the title table.
 */
SELECT *
FROM title;
 
 
 /*
 Update the CategoryID in the title table for all rows
 */
 /* Romance */
 UPDATE title
 SET CategoryID = 1
 WHERE TitleID IN (101, 104);
 
 /* Humor */
 UPDATE title
 SET CategoryID = 2
 WHERE TitleID IN (106, 109);
 
 /* Mystery */
 UPDATE title
 SET CategoryID = 3
 WHERE TitleID IN (102, 103, 110);

 /* Fantasy */
 UPDATE title
 SET CategoryID = 4
 WHERE TitleID IN (107, 112); 
 
 /* Science Fiction */
 UPDATE title
 SET CategoryID = 5
 WHERE TitleID IN (105, 108, 111); 
 
 
 /*
Verify all the rows in the title table now have a value for CategoryID.
*/
SELECT *
 FROM title;
 
 
/*
SELECT the TitleID, TitleName, and CategoryName for every title.
*/ 
SELECT
  t.TitleID,
  t.TitleName,
  c.CategoryName
FROM title t
INNER JOIN category c
    ON t.CategoryID = c.CategoryID
ORDER BY t.TitleID;


/*
Define the primary key to category table.
*/
ALTER TABLE category 
ADD CONSTRAINT PK_category PRIMARY KEY (CategoryID);


/*
Alternative method for defining the primary key of the category table.
*/
ALTER TABLE category
ADD CONSTRAINT PK_category PRIMARY KEY (CategoryID);


/*
Alternative method for creating the catefory table, with the primary key defined.
*/
CREATE TABLE category (
    CategoryID int,
    CategoryName varchar(20),
    CONSTRAINT PRIMARY KEY (CategoryID)
    );


/*
Add foreign key
*/
ALTER TABLE orderitem 
ADD CONSTRAINT PK_orderitem PRIMARY KEY (OrderID, OrderItem);


/*
Add a foreign key constraint to the CategoryID column of the title table.
*/
ALTER TABLE title
ADD CONSTRAINT FK_title_category
FOREIGN KEY (CategoryID) REFERENCES category(CategoryID);


 /*
 Drop the FK_title_category foreign key constraint from the title table;
 */
 ALTER TABLE title
DROP FOREIGN KEY FK_title_category;


/*
Drop the primary key constraint from the category table.
*/
ALTER TABLE category
DROP CONSTRAINT PK_category;


/*
Alternative method to drop the primary key constraint from the category table.
*/
ALTER TABLE category
DROP PRIMARY KEY;


/*
Drop the CategoryID column from the title table.
*/
ALTER TABLE title
DROP COLUMN CategoryID;


/*
Drop the category table
*/
 DROP TABLE category;
 
 
 
/* Lab work */
ALTER TABLE author ADD CONSTRAINT PK_author PRIMARY KEY (AuthorID);
ALTER TABLE customer ADD CONSTRAINT PK_customer PRIMARY KEY (CustomerID);
ALTER TABLE orderheader ADD CONSTRAINT PK_orderheader PRIMARY KEY (OrderID);
ALTER TABLE orderitem ADD CONSTRAINT PK_orderitem PRIMARY KEY (OrderID, ItemID);
ALTER TABLE promotion ADD CONSTRAINT PK_promotion PRIMARY KEY (PromotionID);
ALTER TABLE title ADD CONSTRAINT PK_title PRIMARY KEY (TitleID);
ALTER TABLE titleauthor ADD CONSTRAINT PK_titleauthor PRIMARY KEY (TitleID, AuthorID);

 
ALTER TABLE orderheader ADD CONSTRAINT FK_orderheader_customer FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID);
ALTER TABLE orderheader ADD CONSTRAINT FK_orderheader_promotion FOREIGN KEY (PromotionID) REFERENCES promotion(PromotionID);
ALTER TABLE orderitem ADD CONSTRAINT FK_orderitem_orderheader FOREIGN KEY (OrderID) REFERENCES orderheader(OrderID);
ALTER TABLE orderitem ADD CONSTRAINT FK_orderitem_title FOREIGN KEY (TitleID) REFERENCES title(TitleID);
ALTER TABLE titleauthor ADD CONSTRAINT FK_titleauthor_title FOREIGN KEY (TitleID) REFERENCES title(TitleID);
ALTER TABLE titleauthor ADD CONSTRAINT FK_titleauthor_author FOREIGN KEY (AuthorID) REFERENCES author(AuthorID);

