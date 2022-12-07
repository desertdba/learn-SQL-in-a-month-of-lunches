/* SELECT the title name and price from title where price IN ($10.95 and $12.95) */
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price IN (10.95, 12.95);


/* SELECT the title name and publication date from title where publication date IN ('2015-04-30', '2016-02-06') */
SELECT 
	TitleName, 
	PublicationDate
FROM title
WHERE PublicationDate IN ('2015-04-30', '2016-02-06');


/* 
SELECT the title name and price from title where price is greater than $9.95.
Results are ordered by price ascending.
*/
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price > 9.95
ORDER BY Price ASC;


/*
SELECT the title name and price from title where price is less than $9.95.
Results are ordered by price descending.
*/
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price < 9.95
ORDER BY Price DESC;


/* 
SELECT the title name and price from title where price is greater than or equal to $9.95.
Results are ordered by price ascending.
*/
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price >= 9.95
ORDER BY Price ASC;


/* 
SELECT the title name and price from title where price is greater than $8.95 and less than $10.95.
Results are ordered by price ascending.
*/
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price > 8.95
AND Price < 10.95
ORDER BY Price ASC; 


/* 
SELECT the title name and price from title where price is greater than or equal to $8.95 and less than or equal to $10.95.
Results are ordered by price ascending.
*/
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price > 8.95
AND Price < 10.95
ORDER BY Price ASC; 


/* The same query as the previous one, but using the BETWEEN operator. */
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price BETWEEN 8.95 AND 10.95
ORDER BY Price ASC;


/* 
SELECT the title name and price from title where price does not equal to $7.95.
Results are ordered by price ascending.
*/
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price <> 7.95
ORDER BY Price ASC;


/*
SELECT the title name and publication date from title where publication date does not equal to 2016-02-06.
Results are ordered by publication date ascending.
*/
SELECT 
	TitleName, 
	PublicationDate
FROM title
WHERE PublicationDate <> '2016-02-06'
ORDER BY PublicationDate ASC;


/* The same query as the previous one, but using the NOT operator */
SELECT 
	TitleName, 
	PublicationDate
FROM title
WHERE NOT PublicationDate = '2016-02-06'
ORDER BY PublicationDate ASC;


/* 
SELECT the title name and price from title where price NOT IN ($10.95 and $12.95) .
Results are ordered by price ascending.
*/
SELECT 
	TitleName, 
	Price
FROM title
WHERE Price NOT IN (10.95, 12.95);


/* SELECT the title name, advance and royalty from title where advance is greater than $5000 and royalty is not 12 percent. */
SELECT 
	TitleName, 
	Advance, 
	Royalty
FROM title
WHERE Advance > 5000
AND Royalty <> 12;


/*
SELECT the title name, advance, royalty, and publication date from title where one of the following is true:
	1.	An advance is greater than $5000 and royalty is not 12 percent.
	2.	A publication date greater than 2020-01-01. 
*/    
SELECT 
	TitleName, 
	Advance, 
	Royalty, 
	PublicationDate
FROM title
WHERE (Advance > 5000
AND Royalty <> 12)
OR (PublicationDate > '2020-01-01');





