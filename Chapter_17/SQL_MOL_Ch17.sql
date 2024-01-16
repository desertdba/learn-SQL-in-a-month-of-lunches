/*
Update the price to $8.95 for the title "Pride and Predicates".
*/
UPDATE title
SET Price = 8.95
WHERE TitleName = 'Pride and Predicates';


/*
Update the advance to $0.00 and the Royalty to 0% for the title "Pride and Predicates".
*/
UPDATE title
SET Advance = 0.00,
    Royalty = 10.00
WHERE TitleName = 'Pride and Predicates';


/*
Update the advance to $0.00 and the Royalty to 0% for the title "Pride and Predicates" using the TitleID instead of TitleName.
*/
UPDATE title
SET Advance = 0.00,
    Royalty = 10.00
WHERE TitleID = 101;


/*
Update the advance to $0.00 and the Royalty to 0% for the title "Pride and Predicates" using variables.
*/
SET 
    @TitleID = 101,
    @Price = 9.95,
    @Advance = 5000.00,
    @Royalty = 15.00;
    
UPDATE title
SET Price = @Price,
    Advance = @Advance,
    Royalty = @Royalty
WHERE TitleID = @TitleID;


/*
Update the middle name to NULL for the author with AuthorID of 1.
*/
UPDATE author
SET MiddleName = NULL
WHERE AuthorID = 1;


/*
Select the Price for any titles by the author with AuthorID of 12.
*/
SELECT title.Price
FROM title
INNER JOIN titleauthor
    ON title.TitleID = titleauthor.TitleID
INNER JOIN author
    ON titleauthor.AuthorID = author.AuthorID
WHERE author.AuthorID = 12;


/*
Select the Price for any titles by the author with AuthorID of 12 using table aliases.
*/
SELECT t.Price
FROM title t
INNER JOIN titleauthor ta
    ON t.TitleID = ta.TitleID
INNER JOIN author a
    ON ta.AuthorID = a.AuthorID
WHERE a.AuthorID = 12;


/*
Select the Price for any titles by the author with AuthorID of 12 using table aliases and removing the unnecessary join of the Author table.
*/
SELECT t.Price
FROM title t
INNER JOIN titleauthor ta
    ON t.TitleID = ta.TitleID
WHERE ta.AuthorID = 12;


/*
Select the Price to $8.95 for any titles by the author with AuthorID of 12.
*/
UPDATE title t
INNER JOIN titleauthor ta
    ON t.TitleID = ta.TitleID
SET t.Price = 8.95
WHERE ta.AuthorID = 12;


/*
Delete any rows from the title table where TitleID is 110.
*/
DELETE
FROM title
WHERE TitleID = 110;


/*
Delete any rows from the title table where TitleID is 110 using variables.
*/
SET @TitleID = 110;

DELETE
FROM title
WHERE TitleID = @TitleID;


/*
Delete any rows in the title table that relate to AuthorID of 12.
*/
DELETE t
FROM title t
INNER JOIN titleauthor ta
    ON t.TitleID = ta.TitleID
WHERE ta.AuthorID = 12;

/*
Delete all the rows in the myfirstquery table.
*/
DELETE
FROM myfirstquery;


/*
Delete all the rows in the myfirstquery table using TRUNCATE TABLE.
*/
TRUNCATE TABLE myfirstquery;


    
    