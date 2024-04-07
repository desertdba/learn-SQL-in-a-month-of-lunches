/*
SELECT
   t.TitleName,
   a.FirstName,
   a.MiddleName,
   a.LastName
FROM title t
INNER JOIN titleauthor ta
    ON t.TitleID = ta.TitleID
INNER JOIN author a
    ON ta.AuthorID = a.AuthorID;
    
    
CREATE VIEW vw_TitleAuthor
AS 
SELECT
   t.TitleName,
   a.FirstName,
   a.MiddleName,
   a.LastName
FROM title t
INNER JOIN titleauthor ta
    ON t.TitleID = ta.TitleID
INNER JOIN author a
    ON ta.AuthorID = a.AuthorID;
    
SELECT *
FROM vw_TitleAuthor;
*/


/*
A SELECT that will be used in a view that shows the names titles and their category names.
*/
SELECT
    t.TitleName,
    c.CategoryName
 FROM title t
INNER JOIN category c
    ON t.CategoryID = c.CategoryID;
    

/*
Create the view vw_TitleCategory that shows the names titles and their category names.
*/
CREATE VIEW vw_TitleCategory
AS 
SELECT
    t.TitleName,
    c.CategoryName
 FROM title t
INNER JOIN category c
    ON t.CategoryID = c.CategoryID;
    
    
/*
SELECT all columns and rows from vw_TitleCategory.
*/    
SELECT *
FROM vw_TitleCategory;


/*
SELECT all columns from vw_TitleCategory where the category name is Mystery.
*/    
SELECT *
FROM vw_TitleCategory
WHERE CategoryName = 'Mystery';


/*
ALTER the view vw_TitleCategory to add the columns TitleID and CategoryID.
*/
ALTER VIEW vw_TitleCategory
AS 
SELECT
    t.TitleID,
    t.TitleName,
    c.CategoryID,
    c.CategoryName
 FROM title t
INNER JOIN category c
    ON t.CategoryID = c.CategoryID;
    

/*
Use vw_TitleCategory with the orderitem table to see how many titles were sold for each category.
*/
SELECT
    tc.CategoryName,
    SUM(oi.Quantity) AS TitlesOrdered
FROM vw_TitleCategory tc
LEFT OUTER JOIN orderitem oi
    ON tc.TitleID = oi.TitleID
GROUP BY tc.CategoryName;


/* 
CREATE a stored procedure named GetTitleCategory that does the returns the same results as vw_TitleCategory.
In MySQL, we need to change the delimter before and after so our stored procedure will be created.
*/
DELIMITER //

CREATE PROCEDURE GetTitleCategory()
BEGIN
SELECT
    t.TitleName,
    c.CategoryName
 FROM title t
INNER JOIN category c
    ON t.CategoryID = c.CategoryID;
END //

DELIMITER ;


/*
Execute our new GetTitleCategory stored procedure.
*/
CALL GetTitleCategory;


/*
Delete the GetTitleCategory stored procedure.
*/
DROP PROCEDURE GetTitleCategory;


/*
View the data types for the columns in the title table.
We do this so we can use the correct data type for the _TitleName parameter in the next step.
*/
SHOW COLUMNS FROM title;


/*
Re-create the GetTitleCategory stored procedure wtih an input parameter for TitleName.
*/
DELIMITER //

CREATE PROCEDURE GetTitleCategory(
	IN _TitleName varchar(50)
    )
BEGIN
SELECT
    t.TitleName,
    c.CategoryName
 FROM title t
INNER JOIN category c
    ON t.CategoryID = c.CategoryID
WHERE t.TitleName = _TitleName;
END //

DELIMITER ;


/*
Execute our stored procedure, passing the value of the variable @TitleName to the _TitelName parameter.
*/
SET @TitleName = 'The Sum Also Rises';
CALL GetTitleCategory (@TitleName);


/* 
DROP and then CREATE our GetTitleCategory stored procedure to allow for null values to select all results 
*/
DROP PROCEDURE GetTitleCategory;

DELIMITER //

CREATE PROCEDURE GetTitleCategory(
	IN _TitleName varchar(50)
    )
BEGIN
SELECT
    t.TitleName,
    c.CategoryName
 FROM title t
INNER JOIN category c
    ON t.CategoryID = c.CategoryID
WHERE t.TitleName = COALESCE(_TitleName, t.TitleName);
END //

DELIMITER ;


/*
Execute our stored procedure, passing the value of the variable @TitleName to the _TitelName parameter again.
*/
SET @TitleName = 'The Sum Also Rises';
CALL GetTitleCategory (@TitleName);


    