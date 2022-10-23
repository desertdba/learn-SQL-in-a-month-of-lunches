/* SELECT book title names from title */
SELECT TitleName
FROM title;


/* SELECT book title names and prices from title */
SELECT
    TitleName,
    Price
FROM title;


/* SELECT book title names and prices from title in a different column order*/
SELECT
    Price,
    TitleName
FROM title;


/* SELECT book title names (twice) and prices from title*/
SELECT
    TitleName,
    TitleName,
    Price
FROM title;


/* SELECT book title names aliased as BookName and prices from title*/
SELECT
    TitleName AS BookName
FROM title;


/* SELECT book title names (aliased twice) and prices from title*/
SELECT
    TitleName AS BookName,
    TitleName AS AlsoBookName,
    Price
FROM title;


/* SELECT book title names (aliased twice) and prices from title without the AS keyword*/
SELECT
    TitleName BookName,
    TitleName AlsoBookName,
    Price
FROM title;


/* SELECT all columns from title */
SELECT
    *
FROM title;
