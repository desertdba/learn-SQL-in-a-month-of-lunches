/* Example of filtrering on a numeric value */
SELECT 
	TitleName, 
	Advance
FROM title
WHERE Advance = 10000.00;


/* Example of filtering on a string value" */
SELECT Advance
FROM title
WHERE TitleName = 'Anne of Fact Tables';


/* Example of filtering on a date value */
SELECT 
	TitleName, 
	PublicationDate
FROM title
WHERE PublicationDate = '2020-03-14 00:00:00';


/* SELECT the title name, advance, royalty, and publication date from title where the advance is 5000 dollars AND the royalty is 15 percent */
SELECT 
	TitleName, 
	Advance, 
	Royalty
FROM title
WHERE Advance = 5000
AND Royalty = 15;


/* SELECT the title name, advance, royalty, and publication date from title where the advance is 5000 dollars OR the royalty is 15 percent */
SELECT 
	TitleName, 
	Advance, 
	Royalty
FROM title
WHERE Advance = 5000
OR Royalty = 15;


/* 
SELECT the title name, advance, royalty, and publication date from title where one of the following is true:
	1.	A Price of $9.95 and a Publication Date of February 6th, 2016.
	2.	A Price of $9.95 and an Advance of 5000 dollars. 
*/
SELECT 
	TitleName, 
	Price, 
	PublicationDate, 
	Advance
FROM title
WHERE Price = 9.95
AND (PublicationDate = '2016-02-06'
OR Advance = 5000);


/* 
SELECT the title name, advance, royalty, and publication date from title where one of the following is true:
	1.	A Price of $9.95 and a Publication Date of February 6th, 2016.
	2.	A Price of $9.95 and an Advance of 5000 dollars. 
Results are ordered by title name.    
*/
SELECT 
	TitleName, 
	Price, 
	PublicationDate, 
	Advance
FROM title
WHERE Price = 9.95
AND PublicationDate = '2016-02-06'
OR Advance = 5000
ORDER BY TitleName;

