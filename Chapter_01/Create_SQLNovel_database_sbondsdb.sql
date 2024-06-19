USE sbondsdb;

/* Create SQL Novel tables */
CREATE TABLE Title (
   TitleID int NOT NULL,
   TitleName varchar(50) NOT NULL,
   Price decimal (5,2) NOT NULL,
   Advance decimal (8,2) NOT NULL,
   Royalty decimal (5,2) NULL,
   PublicationDate datetime NOT NULL
   );

CREATE TABLE Author (
	AuthorID int NOT NULL,
	FirstName varchar(30) NOT NULL,
	MiddleName varchar(30) NULL,
	LastName varchar(30) NOT NULL,
	PaymentMethod varchar(50) NOT NULL
);

CREATE TABLE TitleAuthor (
	TitleID int NOT NULL,
	AuthorID int NOT NULL,
	AuthorOrder int NOT NULL
	);

CREATE TABLE Customer (
	CustomerID int NOT NULL,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Address varchar(50) NULL,
	City varchar(50) NULL,
	State varchar(5) NULL,
	Zip varchar(10) NULL,
	Country varchar(50) NULL
	);

CREATE TABLE OrderHeader (
	OrderID int NOT NULL,
    CustomerID int NOT NULL,
    PromotionID int NULL,
	OrderDate datetime NOT NULL
    );

CREATE TABLE OrderItem (
	OrderID int NOT NULL,
    OrderItem int NOT NULL,
    TitleID int NOT NULL,
    Quantity int NOT NULL,
    ItemPrice decimal (5,2) NOT NULL
    );

CREATE TABLE Promotion (
	PromotionID int NOT NULL,
    PromotionCode varchar(10) NOT NULL,
    PromotionStartDate datetime NOT NULL,
    PromotionEndDate datetime NOT NULL
    );

CREATE TABLE MyFirstQuery (
	Outcome VARCHAR(20) NOT NULL
	);


/* Populate SQLNovel tables */
INSERT INTO Title (TitleID, TitleName, Price, Advance, Royalty, PublicationDate)
VALUES 
	(101, 'Pride and Predicates', 9.95, 5000, 15, '2015-04-30'),
	(102, 'The Join Luck Club', 9.95, 6000, 12, '2016-02-06'),
	(103, 'Catcher in the Try', 8.95, 5000, 10, '2017-04-03'),
	(104, 'Anne of Fact Tables', 12.95, 10000, 15, '2018-01-12'),
	(105, 'The DateTime Machine', 7.95, 5500, 15, '2019-02-04'),
	(106, 'The Great GroupBy', 10.95, 0, 20, '2019-12-23'),
	(107, 'The Call of the While', 8.95, 2500, 15, '2020-03-14'),
	(108, 'The Sum Also Rises', 7.95, 5000, 12, '2021-11-12');

INSERT INTO Author (AuthorID, FirstName, MiddleName, LastName, PaymentMethod)
VALUES 
	(1, 'Paul', 'K', 'Tripp', 'Cash'),
	(2, 'Doug', NULL, 'Li', 'Check'),
	(3, 'Jen', NULL, 'Strong', 'Check'),
	(4, 'Jorge', 'Armando', 'Guerra', 'Check'),
	(5, 'Robert', 'Grant', 'Davidson', 'Check'),
	(6, 'Gail', 'Anne', 'Shawn', 'Check'),
	(7, 'Rebecca', NULL, 'Miller', 'Check'),
	(8, 'Andy', NULL, 'Melkin', 'Direct Deposit'),
	(9, 'Buck', NULL, 'Fernandez', 'Cash'),
	(10, 'Chris', NULL, 'Walenski', 'Direct Deposit'),
	(11, 'Deepthi', NULL, 'Mahadevan', 'Direct Deposit');

INSERT INTO TitleAuthor (TitleID, AuthorID, AuthorOrder)
VALUES 
	(101, 2, 1),
	(102, 3, 1),
	(103, 4, 1),
	(104, 5, 1),
	(105, 6, 1),
	(106, 7, 1),
	(107, 11, 1),
	(107, 1, 2),
	(102, 8, 1),
	(102, 9, 2),
	(102, 10, 3);

INSERT INTO Customer (CustomerID, FirstName, LastName, Address, City, State, Zip, Country)
VALUES
	(1, 'Chris', 'Dixon', '212 N Rose St', 'Lakewood', 'CO', '80215', 'USA'),
	(2, 'David', 'Power', '44 Wiley St', 'Henderson', 'NV', '89002', 'USA'),
   	(3, 'Arnold', 'Hinchcliffe', '7333 E Levine St', 'Atlanta', 'GA', '30303', 'USA'),
	(4, 'Keanu', 'O''Ward', '415 N Hinson St', 'Madison', 'WI', '53703', 'USA'),
   	(5, 'Lisa', 'Rosenqvist', '56 S Burnett St', 'Reston', 'VA', '20190', 'USA'),
	(6, 'Maggie', 'Ilott', '111 Fuson St', 'Flagstaff', 'AZ', '86015', 'USA'),
	(7, 'Cora', 'Daly', '55 S Brandt St', 'Anaheim', 'CA', '92802', 'USA'),
	(8, 'Dan', 'Wilson', '29 W Pousson St', 'Seattle', 'WA', '98104', 'USA'),
	(9, 'Kelly', 'Wheldon', '300 Dewsnup St', 'Boise', 'ID', '83703', 'USA'),
	(10, 'Bhaskar', 'Palou', '3443 E Ramella St', 'Evansville', 'IN', '47702', 'USA'),
	(11, 'Kevin', 'Daly', '123 Terry St', 'Rochester', 'NY', '02345', 'USA'),
	(12, 'Jordan', 'Ericsson', '187 E Boich St', 'Gilbert', 'AZ', '85296', 'USA'),
	(13, 'Ming', 'Zhou', '42 S Walsh St', 'Portsmouth', 'NH', '03801', 'USA'),
	(14, 'Jack', 'Sato', '242 S Corbett St', 'Burlington', 'VT', '05401', 'USA'),
	(15, 'Joe', 'Pagenaud', '59 E Fleming St', 'Detroit', 'MI', '48202', 'USA'),
	(16, 'Tara', 'Di Silvestro', '789 N Kizer St', 'San Diego', 'CA', '92101', 'USA'),
	(17, 'Sandra', 'Calderon', '5 W Delany St', 'Denver', 'CO', '80014', 'USA'),
    (18, 'Margaret', 'Montoya', '48 Clark St', 'Monterey', 'CA', '93940', 'USA'),
    (19, 'Monica', 'Newgarden', '99 Lynn St', 'Clayton', 'MO', '63105', 'USA'),
	(20, 'Mia', 'Rossi', '276 N Morrison St', 'Orlando', 'FL', '32801', 'USA');

INSERT INTO OrderHeader (OrderID, CustomerID, PromotionID, OrderDate)
VALUES
	(1001, 1, NULL, '2015-06-01'),
	(1002, 2, NULL, '2015-06-15'),
	(1003, 3, NULL, '2015-07-03'),
	(1004, 4, NULL, '2015-08-12'),
	(1005, 5, NULL, '2015-09-05'),
	(1006, 6, 1, '2015-11-02'),
	(1007, 7, 1, '2015-11-15'),
	(1008, 8, 1, '2015-11-22'),
    
	(1009, 9, NULL, '2016-02-12'),
	(1010, 3, NULL, '2016-03-01'),
	(1011, 10, NULL, '2016-06-30'),
	(1012, 1, NULL, '2016-09-02'),
	(1013, 6, 2, '2016-11-03'),
 	(1014, 11, 2, '2016-11-12'),
	(1015, 5, 2, '2016-11-14'),
	(1016, 7, 2, '2016-11-23'),
	(1017, 12, NULL, '2016-12-08'),
    
	(1018, 13, NULL, '2017-01-31'),
	(1019, 3, NULL, '2017-04-05'),
	(1020, 8, NULL, '2017-07-22'),
	(1021, 14, NULL, '2017-10-16'),
	(1022, 13, 3, '2017-11-01'),
 	(1023, 2, 3, '2017-11-14'),
	(1024, 14, 3, '2017-11-20'),
    
 	(1025, 4, NULL, '2018-01-23'),
 	(1026, 5, NULL, '2018-05-25'),
 	(1027, 12, 4, '2018-06-14'),
 	(1028, 11, 5, '2018-11-01'),
 	(1029, 10, 5, '2018-11-11'),
    
   	(1030, 4, NULL, '2019-02-24'),
   	(1031, 15, 6, '2019-06-07'),
   	(1032, 16, NULL, '2019-08-11'),
   	(1033, 9, 7, '2019-11-04'),
   	(1034, 10, 7, '2019-11-14'),
   	(1035, 4, NULL, '2019-12-29'),
    
	(1036, 3, NULL, '2020-01-18'),
 	(1037, 4, NULL, '2020-03-15'),
	(1038, 17, NULL, '2020-05-22'),
	(1039, 10, NULL, '2020-09-13'),
	(1040, 7, 9, '2020-11-07'),
	(1041, 8, 9, '2020-11-21'),
    
	(1042, 6, NULL, '2021-01-29'),
	(1043, 18, NULL, '2021-04-23'),
	(1044, 19, NULL, '2021-06-06'),
	(1045, 11, NULL, '2021-10-01'),
	(1046, 4, NULL, '2021-11-13'),
	(1047, 19, NULL, '2021-11-28'),

	(1048, 16, NULL, '2021-01-15'),
	(1049, 20, 12, '2021-03-05'),
    (1050, 1, 12, '2022-03-10');

INSERT INTO OrderItem (OrderID, OrderItem, TitleID, Quantity, ItemPrice)
VALUES
	(1001, 1, 101, 1, 9.95),
	(1002, 1, 101, 1, 9.95),
	(1003, 1, 101, 1, 9.95),
	(1004, 1, 101, 1, 9.95),
	(1005, 1, 101, 1, 9.95),
	(1006, 1, 101, 1, 7.95),
	(1007, 1, 101, 2, 7.95),
	(1008, 1, 101, 1, 7.95),
    
	(1009, 1, 101, 1, 9.95),
    (1010, 1, 102, 1, 9.95),
    (1011, 1, 102, 1, 9.95),
    (1011, 2, 101, 1, 9.95),
    (1012, 1, 101, 1, 9.95),
    (1012, 2, 102, 1, 9.95),    
    (1013, 1, 101, 3, 7.95),
	(1014, 1, 101, 1, 7.95),
	(1014, 2, 102, 1, 7.95),
    (1015, 1, 102, 1, 7.95),
    (1016, 1, 101, 2, 7.95),
    (1017, 1, 102, 1, 9.95),
    
    (1018, 1, 102, 1, 9.95),
    (1019, 1, 103, 1, 8.95),
    (1020, 1, 103, 1, 8.95),
    (1021, 1, 101, 1, 7.95),
    (1021, 2, 102, 1, 7.95),
    (1021, 3, 103, 1, 6.95),
    (1022, 1, 101, 1, 7.95),
    (1022, 1, 103, 1, 6.95),
    (1023, 1, 102, 1, 7.95),
    (1024, 1, 101, 1, 7.95),

	(1025, 1, 104, 1, 12.95),
    (1026, 1, 103, 1, 7.95),
    (1027, 1, 101, 1, 8.95),
    (1028, 1, 102, 1, 7.95),
    (1028, 2, 103, 1, 6.95),
    (1029, 1, 103, 1, 6.95),
    
    (1030, 1, 105, 1, 7.95),
    (1031, 1, 105, 1, 6.95),
    (1032, 1, 105, 1, 7.95),
    (1033, 1, 102, 1, 7.95),
    (1033, 2, 103, 1, 6.95),
    (1034, 1, 102, 1, 7.95),
    (1034, 2, 103, 1, 6.95),
    (1034, 3, 104, 1, 10.95),
    (1034, 4, 105, 1, 5.95),
    (1035, 1, 106, 1, 10.95),
    
    (1036, 1, 105, 1, 7.95),
    (1037, 1, 107, 1, 8.95),
    (1038, 1, 101, 1, 9.95),
    (1039, 1, 105, 1, 7.95),
    (1040, 1, 105, 1, 5.95),
    (1041, 1, 105, 1, 5.95),
    (1041, 2, 107, 1, 6.95),
    
    (1042, 1, 105, 1, 7.95),
    (1043, 1, 105, 1, 7.95),
    (1044, 1, 105, 1, 6.95),
    (1044, 2, 103, 1, 7.95),
    (1045, 1, 105, 1, 7.95),
    (1046, 1, 108, 1, 5.95),
    (1047, 1, 108, 1, 5.95),
    (1047, 2, 101, 1, 7.95),
    
    (1048, 1, 105, 1, 7.95),
    (1049, 1, 101, 1, 6.95),
    (1049, 2, 102, 1, 6.95),
    (1049, 3, 103, 1, 5.95),
	(1050 , 1, 108, 1, 4.95);

INSERT INTO Promotion (PromotionID, PromotionCode, PromotionStartDate, PromotionEndDate)
VALUES
	(1, '2OFF2015', '2011-11-01', '2011-11-30'),
	(2, '2OFF2016', '2012-11-01', '2012-11-30'),
	(3, '2OFF2017', '2013-11-01', '2013-11-30'),
	(4, '1OFF2018', '2014-06-01', '2014-06-30'),
	(5, '2OFF2018', '2014-11-01', '2014-11-30'),
	(6, '1OFF2019', '2015-06-01', '2015-06-30'), 
	(7, '2OFF2019', '2015-11-01', '2015-11-30'),
	(8, '1OFF2020', '2016-06-01', '2016-06-30'),
	(9, '2OFF2020', '2016-11-01', '2016-11-30'),
	(10, '1OFF2021', '2017-06-01', '2017-06-30'),
	(11, '2OFF2021', '2017-11-01', '2017-11-30'),  
    (12, '3OFF2022', '2018-03-04', '2018-03-11');

INSERT INTO MyFirstQuery (Outcome)
VALUES ('Hello, World!');





