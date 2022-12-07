/* 
SELECT the first and last names from author where the last name starts with an "S", using > and <.
*/
SELECT 
	FirstName,
	LastName
FROM author
WHERE LastName >= 'S' 
AND LastName < 'T';


/* 
SELECT the first and last names from author where the last name starts with an "S", using a wildcard.
*/
SELECT 
	FirstName,
	LastName
FROM author
WHERE LastName LIKE 'S%';


/* 
SELECT the first and last names from author where the last name ends with an N.
*/
SELECT 
	FirstName,
	LastName
FROM author
WHERE LastName LIKE '%N';


/* 
SELECT the first and last names from author where the last name starts with M and ends with N.
*/
SELECT 
	FirstName,
	LastName
FROM author
WHERE LastName LIKE 'M%N';


/* 
SELECT the first and last names from author where the last name contains "DE".
*/
SELECT 
	FirstName,
	LastName
FROM author
WHERE LastName LIKE '%DE%';


/* 
SELECT the first and last names from author where the first name has the first character of R and third character of b.
*/
SELECT 
	FirstName,
	LastName
FROM author
WHERE FirstName LIKE 'R_b%';


/* 
SELECT the first and last names from author where the first name has the third character of u.
*/
SELECT 
	FirstName,
	LastName
FROM author
WHERE FirstName LIKE '__u%';


/*
Review all columns in the author table
*/
SELECT *
FROM author;


/* 
SELECT the full names from author where the middle name is null.
*/
SELECT 
	FirstName,
    MiddleName,
	LastName
FROM author
WHERE MiddleName IS NULL;


/* 
SELECT the full names from author where the middle name is not K (does not return null values).
*/
SELECT 
	FirstName,
    MiddleName,
	LastName
FROM author
WHERE MiddleName <> 'K';


/* 
SELECT the full names from author where the middle name is not K (does return null values).
*/
SELECT 
	FirstName,
    MiddleName,
	LastName
FROM author
WHERE MiddleName <> 'K'
OR MiddleName IS NULL;


/* 
SELECT the full names from author where the middle name is not null.
*/
SELECT 
	FirstName,
    MiddleName,
	LastName
FROM author
WHERE MiddleName IS NOT NULL;


/* 
Another way to SELECT the full names from author where the middle name is not null.
*/
SELECT 
	FirstName,
    MiddleName,
	LastName
FROM author
WHERE MiddleName LIKE '%';


