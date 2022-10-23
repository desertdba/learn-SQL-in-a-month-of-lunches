/* SELECT the title name and price for all titles */
SELECT
    TitleName,
    Price
FROM title;


/* SELECT the title name and price for all titles, ordered by title name */
SELECT
    TitleName,
    Price
FROM title
ORDER BY
    TitleName;


/* SELECT the title name and price for all titles, ordered by and alias */
SELECT
    TitleName AS NameOfTheBook,
    Price
FROM title
ORDER BY
    NameOfTheBook;


/* SELECT the title name, advance, and royalty for all titles, ordered by multiple columns */
SELECT
    TitleName,
    Advance,
    Royalty
FROM title
ORDER BY
    Advance,
    Royalty;

/* SELECT the title name, advance, and royalty for all titles, ordered by Advance descending and Royalty ascending (non-explicit) */
SELECT
    TitleName,
    Advance,
    Royalty
FROM title
ORDER BY
    Advance DESC,
	Royalty;


/* SELECT the title name, advance, and royalty for all titles, ordered by advance descending and royalty ascending (explicit) */
SELECT
    TitleName,
    Advance,
	Royalty
FROM title
ORDER BY
    Advance DESC,
    Royalty ASC;


/* SELECT the title names for all titles, ordered by hidden columns */
SELECT
    TitleName
FROM title
ORDER BY
    Advance DESC,
    Royalty ASC;


/* SELECT the title name, advance, and royalty for all titles, ordered by position */
SELECT
    TitleName,
    Advance,
    Royalty
FROM title
ORDER BY
    2 DESC,
    3 ASC;


/* SELECT the title name and publication date for all titles, but limiting the results to 3 rows */
SELECT
    TitleName,
    PublicationDate
FROM title
LIMIT 3; 


/* SELECT the title name and publication date for all titles, but limiting the results to 3 rows,
 ordered by publication date descending  */
SELECT
    TitleName,
    PublicationDate
FROM title
ORDER BY PublicationDate DESC
LIMIT 3;


/* SELECT the title name and publication date for all titles, but limiting the results to 3 rows,
 ordered by publication date descending and skipping the first record with OFFSET */
SELECT
    TitleName,
    PublicationDate
FROM title
ORDER BY PublicationDate DESC
LIMIT 3 OFFSET 1;


/* Using -- for asingle line comment */
-- This query returns three random records
SELECT
    TitleName,
    PublicationDate
FROM title
LIMIT 3;


/* Using # for a single line comment */
# This query returns the 3 records with the most recent PublicationDate
SELECT
    TitleName,
    PublicationDate
FROM title
ORDER BY PublicationDate DESC
LIMIT 3;


/* Using multi-line comments */
/* This query returns 3 TitleNames
...with the most recent PublicationDate 
...excluding the single most recent TitleName */
SELECT
    TitleName,
    PublicationDate
FROM title
ORDER BY PublicationDate DESC
LIMIT 3 OFFSET 1;


/* Combining different types of comments */
/*
# This query returns 3 random titles, but it wasn’t what we needed
SELECT
    TitleName,
    PublicationDate
FROM title
LIMIT 3;*/

-- This is the updated query, now ordered by most recent PublicationDate
SELECT
    TitleName,
    PublicationDate
FROM title
ORDER BY PublicationDate DESC
LIMIT 3;
