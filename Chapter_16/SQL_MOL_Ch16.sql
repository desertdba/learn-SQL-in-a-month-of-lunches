/*
Select all the rows and columns from the title table.
*/
SELECT * 
FROM title;


/*
Insert a new row in the title table for the title "David Emptyfield".
*/
INSERT INTO title (
    TitleID, 
    TitleName, 
    Price, 
    Advance, 
    Royalty, 
    PublicationDate
    )
VALUES (    
    109, 
    'David Emptyfield', 
    9.95, 
    0.00, 
    10.00, 
    '2022-01-16'
    );
    
    
/*
Insert a new row in the title table for the title "David Emptyfield".
Like the previous query, but with a different column order specified.

INSERT INTO title (
    PublicationDate,
    Royalty,     
    Advance, 
    Price, 
    TitleName, 
    TitleID 
    )
VALUES (    
    '2022-01-16',
    10.00, 
    0.00, 
    9.95, 
    'David Emptyfield', 
    109 
    );
*/    

    
/*
Insert new rows in the title table for the titles "Red Badge of Cursors" and "Of Mice and Metadata".
*/    
INSERT INTO title (
    TitleID, 
    TitleName, 
    Price, 
    Advance, 
    Royalty, 
    PublicationDate
    )
VALUES (    
    110, 
    'Red Badge of Cursors', 
    7.95, 
    0.00, 
    15.00, 
    '2022-03-29'
    ),
    (    
    111, 
    'Of Mice and Metadata', 
    8.95, 
    0.00, 
    12.00, 
    '2022-05-17'
    );


/*
Select all rows and columns from the author table.
*/
SELECT *
FROM author;


/*
Insert a new row in the author table for "Whitney Miller" with a value of NULL implicityly (automatically) entered for the MiddleName.
*/
INSERT INTO author (
    AuthorID,
    FirstName,
    LastName,
    PaymentMethod
    )
VALUES (
    12,
    'Whitney',
    'Miller',
    'Cash'
    );
    
    
 /*
Insert a new row in the author table for "Whitney Miller" with a value of NULL explicitly entered for the MiddleName.

INSERT INTO author (
    FirstName,
    MiddleName,
    LastName,
    PaymentMethod
    )
VALUES (
    'Whitney',
    NULL,
    'Miller',
    'Cash'
    );
 */
 

/*
Select all rows and columns from the titleauthor table.
*/   
SELECT *
FROM titleauthor;


/*
Select the TitleID and AuthorID for "David Emptyfield" and "Whitney Miller" respectively.
*/
SELECT
    (SELECT TitleID FROM title WHERE TitleName = 'David Emptyfield') AS TitleID,
    (SELECT AuthorID FROM author WHERE FirstName = 'Whitney' AND LastName = 'Miller') AS AuthorID;
    
    
/*
Insert a new row in titleauthor showing the relationship between the title "David Emptyfield" and the author "Whitney Miller".
*/
INSERT INTO titleauthor (
    TitleID,
    AuthorID,
    AuthorOrder
    )
SELECT
    (SELECT TitleID FROM title WHERE TitleName = 'David Emptyfield') AS TitleID,
    (SELECT AuthorID FROM author WHERE FirstName = 'Whitney' AND LastName = 'Miller') AS AuthorID,
    1 AS AuthorOrder;
    

/*
Insert a new row in the title table for the title "A Table of Two Cities" using variables.
*/
SET 
    @TitleID = 112,
    @TitleName = 'A Table of Two Cities',
    @Price = 9.95,
    @Advance = 0.00,
    @Royalty = 15.00,
    @PublicationDate = '2022-08-07';
    
INSERT INTO title (
    TitleID, 
    TitleName, 
    Price, 
    Advance, 
    Royalty, 
    PublicationDate
    )
VALUES (    
    @TitleID, 
    @TitleName, 
    @Price, 
    @Advance, 
    @Royalty, 
    @PublicationDate
    );
