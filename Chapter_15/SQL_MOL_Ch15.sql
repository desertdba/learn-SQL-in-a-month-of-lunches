/*
Use MySQL like a calculator.
*/SELECT 1 + 1;


/*
Adding character strings together doesn't work.
*/
SELECT 'I' + ' ' + 'love' + ' ' + 'books!';


/*
Combining (concatenating) character strings with the CONCAT function does work.
*/
SELECT CONCAT('I', ' ', 'love', ' ', 'books!');


/*
Concatenating the values of the title name column in the title table with a string variable to form a single column of output.
*/ 
SET @Review = ' is a great book!';

SELECT CONCAT(TitleName, @Review) as TitleReview
FROM title;

/*
Concatenating values of price and title name with a space to separate them, sorted in ascending order of the concatenated value.
*/
SELECT CONCAT(Price, ' ', TitleName) as PriceAndTitle
FROM title
ORDER BY PriceAndTitle ASC;


/*
Concatenating values of price and title name with a space to separate them, sorted in ascending order of price.
*/
SELECT CONCAT(Price, ' - ', TitleName) as PriceAndTitle
FROM title
ORDER BY Price;


/*
Selecting the first and last name of the author table, concatenated into a single value and separated by a space.
*/
SELECT CONCAT(FirstName, ' ', LastName) as AuthorName
FROM author;


/*
Selecting the first and last name of the author table, concatenated into a single value and separated by a space using CONCAT_WS.
*/
SELECT CONCAT_WS(' ', FirstName, LastName) as AuthorName
FROM author;


/*
Using CONCAT_WS to concatenate the first, middle, and last name of all rows in the author table.
*/
SELECT CONCAT_WS(' ', FirstName, MiddleName, LastName) as AuthorName
FROM author;


/*
Using CONCAT to concatenate the first, middle, and last name of all rows in the author table. 
The rows with null results are caused by null values in the middle name.
*/
SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName) as AuthorName
FROM author;


/*
Using CONCAT to concatenate the first, middle, and last name of all rows in the author table. 
The COALESCE function has replaced the null values for middle name with empty strings.
*/
SELECT CONCAT(FirstName, ' ', COALESCE(MiddleName, ''), ' ', LastName) as AuthorName
FROM author;


/*
Replacing the ck in the string check with que to convert the word from the American English spelling to British English.
*/
SELECT REPLACE('check', 'ck', 'que');



/*
Concatenating author names, replacing the null values with an empty string using COALESCE, and the resulting double spaces with a single space using REPLACE.
*/
SELECT REPLACE(
	CONCAT(FirstName, ' ', COALESCE(MiddleName, ''), ' ', LastName)
    , '  ', ' ') as AuthorName
FROM author;


/*
Selecting the publication date from the title table, and the publication date converted to remove the time portion of the value uinsg CONVERT.
*/
SELECT
 PublicationDate,
 CONVERT(PublicationDate, DATE) AS PublicationDateNoTime
FROM title;


/*
Selecting the publication date from the title table, and the publication date converted to remove the time portion of the value uinsg CAST.
*/
SELECT
 PublicationDate,
 CAST(PublicationDate AS DATE) AS PublicationDateNoTime
FROM title;


/*
Selecting the total value of all sales in dollars and cents, along with the same value rounded to an integer using ROUND.
*/
SELECT
    SUM(Quantity * ItemPrice) AS TotalOrderValue,
    ROUND(SUM(Quantity * ItemPrice)) AS TotalOrderValueRounded
FROM orderitem;


/*
Using ROUND to round 573.49 from two decimal places to one, which rounds the value slightly higher.
*/
SELECT
    9.95 * .05 AS CalculatedTax,
    ROUND(9.95 * .05, 2) AS CalculatedTaxRounded;


