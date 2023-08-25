/*
Find the first and last names of all customers in California, first as they exist in the customer table and then in all uppercase using the UPPER function.
*/
SELECT 
 FirstName,
 LastName,
 UPPER(FirstName),
 UPPER(LastName)
FROM customer
WHERE State = 'CA';


/*
Find the first and last names of all customers in California, first as they exist in the customer table and then in all uppercase using the UPPER functionn with defined column names.
*/
SELECT
 FirstName,
 LastName,
 UPPER(FirstName) as UpperFirstName,
 UPPER(LastName) as UpperLastName
FROM customer
WHERE State = 'CA';


/*
Find the first and last names of all customers in California, first as they exist in the customer table and then in all lowercase using the LOWER functionn with defined column names.
*/
SELECT
 FirstName,
 LastName,
 LOWER(FirstName) as LowerFirstName,
 LOWER(LastName) as LowerLastName
FROM customer
WHERE State = 'CA';


/*
Selecting the character string “   word  ”, which has three leading spaces and two trailing spaces, with the three trim-related functions. 
LTRIM removes the left leading spaces, RTRIM removes the right trailing spaces, and TRIM removes both leading and trailing spaces.
*/
SET @Word = '   word  ';
SELECT
	@Word as WordAsEntered,
	LTRIM(@Word) as WordLTRIM,
	RTRIM(@Word) as WordRTRIM,
	TRIM(@Word) as WordTRIM;

    
/*
Find the length of the strings with the LENGTH function, after applying different trim functions to the string “   word  “. 
Since the removal of leading and trailing spaces can be difficult to see, we can use LENGTH to validate the results of using the trim functions.
*/
SET @Word = '   word  ';
SELECT
	LENGTH(@Word) as WordAsEnteredLength,
	LENGTH(LTRIM(@Word)) as WordLTRIMLength,
	LENGTH(RTRIM(@Word)) as WordRTRIMLength,
	LENGTH(TRIM(@Word)) as WordTRIMLength;


/*
Find all order id and order dates from orders placed in 2015 by using the YEAR function.
*/    
SELECT 
 OrderID,
 OrderDate
FROM orderheader
WHERE YEAR(OrderDate) = 2015;


/*
Find all the date and time parts from the order date of the first order in the orderheader table.
*/ 
SELECT 
 OrderDate,
 YEAR(OrderDate),
 MONTH(OrderDate),
 DAY(OrderDate),
 HOUR(OrderDate),
 MINUTE(OrderDate),
 SECOND(OrderDate)
FROM orderheader
WHERE OrderID = 1001;


/*
Find the MONTHNAME and DAYNAME to determine the names of the month and day of the first order in the orderheader table.
*/
SELECT 
 OrderDate,
 YEAR(OrderDate),
 MONTHNAME(OrderDate),
 DAY(OrderDate),
 DAYNAME(OrderDate)
FROM orderheader
WHERE OrderID = 1001;


/*
Find the current date and current time.
*/
SELECT 
 CURRENT_DATE() AS CurrentDate,
 CURRENT_TIME() as CurrentTime;


/*
Find the current date and time using CURRENT_TIMESTAMP and NOW functions.
*/
SELECT 
 CURRENT_TIMESTAMP() AS RightNow,
 NOW() AS AlsoRightNow;


/*
Find the current day of the week.
*/
SELECT DAYNAME(NOW()) AS CurrentDayOfWeek;


/*
Find the current database used by the connection.
*/
SELECT DATABASE();


/*
Find the current username used by the connection.
*/
SELECT CURRENT_USER();


/*
Find the current version of MySQL used by the MySQL Server engine.
*/
SELECT VERSION();
