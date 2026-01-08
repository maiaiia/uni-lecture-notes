---
Class: "[[Databases]]"
date: 2025-12-10
type: Lecture
---
# Final Exam Problems

The final exam will consist of 2 parts: 
1. Multiple Choice (one or multiple correct answers)
2. Open Questions (one or two problems)

It will be 1h 30 min long.

## Multiple Choice
Choose the correct answer(s) for the following questions. Each question has at least one correct answer.

>[!Question]
>In a SELECT query:
>a) the SELECT clause can contain arithmetic expressions (true)
>b) according to the conceptual evaluation strategy, ORDER BY is evaluated before GROUP BY (false)
>c) HAVING can contain row-level qualification conditions (having - condition on the aggregate functions (MIN, MAX, COUNT)) (false)
>d) DISTINCT eliminates duplicates from the answer set (true)

SELECT statement - logical processing (FROM, WHERE,...)
row-level qualification conditions -> range conditions, 

you can regard HAVING as a sub-query of the GROUP BY 

>[!Important]
>For the finals, we need to know precisely what conditions are applied for each clause 

>[!Question]
>The natural join operator $R_1*R_2$ in the relational algebra:
>a) returns a relation whose schema contains only the attributes in $R_1$ that don't appear in $R_2$ (false
>b) 
>c)

>[!Question] 
>The ANSI-SPARC architecture (for a database system), a database can have
>a) exactly one symbolic structure (false)
>b) several conceptual structures (false - only one)
>c) several external structures (true)
>d) several physical structures (false)

conceptual structure - the database schema
external structure - queries 
physical structure - where the files are saved

>[!Question]
>Consider the relation S\[A, B, C, D, E, F, G, H]
>- {A, B, C} - primary key; no other candidate keys
>- functional dependencies that are known to hold over S: {F} --> {H}, {C} --> {E, G}
>- no repeating attributes
>a) S is 

functional dependencies need to be split to be able to have a normal form
BCNF -> every attribute is dependent on a super-key and can become a primary key

>[!Question]
>For the relation given below, consider the 3 possible projections on 3 attributes. How many extra records are there in the table AB \* BC \* AC

| A   | B   | C   |
| --- | --- | --- |
| a1  | b2  | c1  |
| a1  | b1  | c2  |
| a2  | b1  | c1  |

AB\[A, B]:

| A   | B   |
| --- | --- |
| a1  | b2  |
| a1  | b1  |
| a2  | b1  |

BC

| B   | C   |
| --- | --- |
| b2  | c1  |
| b1  | c2  |
| b1  | c1  |

AC

| A   | C   |
| --- | --- |
| a1  | c1  |
| a1  | c2  |
| a2  | c1  |


AB \* BC 

| A   | B   | C   |
| --- | --- | --- |
| a1  | b2  | c1  |
| a1  | b1  | c2  |
| a1  | b1  | c1  |
| a2  | b1  | c2  |
| a2  | b1  | c1  |

AB \* BC \* AC

| A   | B   | C   |
| --- | --- | --- |
| a1  | b2  | c1  |
| a1  | b1  | c1  |
| a1  | b1  | c2  |
| a2  | b1  | c1  |

--> one extra record
## Open-Ended Questions

>[!Question]
>Write the relational algebra expression below as a SQL query
>$$\pi_{\{A,B,C\}}((\pi_{\{A,B,ID\}}(\sigma_{M=70}(R)))) \otimes_{ID=IDT1}(\pi_{\{C.IDT1\}}(\sigma_{N>5}(S)))$$ 


```sql
SELECT A, B, C FROM
	(SELECT A, B, ID 
	FROM R 
	WHERE M = 70) R
INNER JOIN 
	(SELECT C, IDT1
	FROM S
	WHERE N > 5) S
ON R.ID = S.IDT1
```

>[!Question]
>What is the result set returned by the following query? Write the tuples' values and the names of the columns
>```sql
>SELECT r1.RID, r1.A + r2.A C2, r1.A * r2.A C3
>FROM R r1 LEFT JOIN R r2 ON r1.RID = r2.RID
>WHERE r1.A > ANY (
>	SELECT B
>	FROM R
>	WHERE C < 10
>)
>```

| r1.RID | C2 = r1.A + r2.A | C3 = r1.A * r2.A |
| ------ | ---------------- | ---------------- |
| 2      | 202              | 10201            |
| 4      | 400              | 40000            |
| 5      | 400              | 40000            |
| 6      | 600              | 90000            |
Note that for the final exam it's okay to just write the correct values of the tuples (no explanations needed)

>[!Question]
>Evaluate the expressions below. $\pi$ doesn't eliminate duplicates. What's the cardinality of $T$?
>$S := \sigma_{F<13}(R)$
>$T := \pi_{\{S,RID,S.A\}}(S \otimes_{S,D=R,D}R)$

| RID | F   | D   |
| --- | --- | --- |
| 1   | 11  | 200 |
| 2   | 12  | 200 |
| 5   | 9   | 200 |
| 6   | 10  | 200 |
R - 6 records
all the T values are 200 
--> combine them with all those 6 records 

--> this will result in 6 records for each row in the table above

--> in total, there are 24 records.

>[!Question]
> What's the result set returned by the following query? Write the tuples' values and the names of the columns.

```sql
SELECT R.*
FROM
	(SELECT r1.RID, r2.A, r3.B
	FROM R r1 INNER JOIN R r2 ON r1.A = r2.B
	INNER JOIN R r3 ON r2.B > r3.D
	WHERE r1.F > 10) t
RIGHT JOIN R ON t.RID = R.RID
```

| r1.RID | r1.A | r2.B | r2.RID |
| ------ | ---- | ---- | ------ |
| 1      | 100  | 100  | 3      |
| 1      | 100  | 100  | 5      |
| 3      | 100  | 100  | 3      |
| 3      | 100  | 100  | 5      |
| 4      | 200  | 200  | 1      |
| 4      | 200  | 200  | 4      |

(before the 3rd join and applying the WHERE clause r.RID = 5 records removed)


after the 3rd join, all the records are removed
table t is empty
after the right join, we have 6 entries, (NULL, i) for i in range (1,6)


# Lab
### I 

### II Database Design
#### 1. Netflix Database
Create a database for Netflix. The entities of interest to the problem domain are: Accounts, Movies, Actors, Reviews, and Watchlists. Accounts have an email address, join date, and a flag indicating if the account is active. Email addresses must be unique. Actors have a name, nationality, and can play in multiple movies. A movi has a title and duration in minutes. Durations cannot be negative. Accounts can leave a review for a movie they have watched. The system stores the review date, rating (floating point number between 0 and 10) and a text. Watchlists contain the account, the movie, and the date the movie has been watched by the account.

1. Write an SQL script that creates the corresponding relational data model.
2. Implement a stored procedure that receives an account and a movie and adds the movie to the account's watchlist
3. Create a view that shows the names of the movies reviewed by at least 2 accounts having more than 3 movies watched
4. Implement a function that returns the number of movies watched by at least R accounts during a period of time S and E, where R, S and E are function parameters

```sql
CREATE TABLE Accounts(
    accId INTEGER PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(100) UNIQUE NOT NULL,
    joinDate DATE,
    active BIT
)
CREATE TABLE Actors(
    actId INTEGER PRIMARY KEY IDENTITY(1,1),
    actName VARCHAR(100),
    nationality VARCHAR(100)
)
CREATE TABLE Movies(
    movId INTEGER PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(100),
    duration INTEGER CHECK (duration > 0)
)
CREATE TABLE Played (
    actId INTEGER REFERENCES Actors(actId),
    movId INTEGER REFERENCES MOVIES(movId),
)
CREATE TABLE Reviews (
    accId INTEGER REFERENCES Accounts(accId),
    movId INTEGER REFERENCES Movies(movId),
    revDate DATE,
    rating FLOAT CHECK (0 <= rating AND rating <= 10),
    revText VARCHAR(1000)
)
CREATE TABLE WatchList (
    accId INTEGER REFERENCES Accounts(accId),
    movId INTEGER REFERENCES Movies(movId),
    wDate DATE
)
GO
```

```sql
CREATE PROC addToWatchlist(@accId INTEGER, @movId INTEGER)
AS 
BEGIN
    DECLARE @currDate DATE = GETDATE()
    INSERT INTO WatchList(accId, movId, wDate) VALUES 
    (@accId, @movId, @currDate)
END 
GO
```

```sql
CREATE VIEW ReviewedByCinephiles AS 
    SELECT M.title
    FROM Movies M
    JOIN Reviews R on M.movId = R.movId
    WHERE R.accId IN (
        -- select accounts that have watched more than 3 movies
        SELECT A.accId
        FROM Accounts A 
            JOIN WatchList W ON W.accId = A.accId 
        GROUP BY A.accId
        HAVING 3 < COUNT(*)
    )
    GROUP BY M.title
    HAVING COUNT(*) > 1
GO
```

```sql
CREATE OR ALTER FUNCTION UF_countGoodMovies (@R integer, @S date, @e date)
    RETURNS INTEGER
AS 
BEGIN
    DECLARE @result INT
    SELECT @result = COUNT(*) 
    FROM (
        SELECT W.movId
        FROM WatchList W
        WHERE '01-07-2026' <= W.wDate AND W.wDate <= '01-12-2026' --S <= DATE, E <= DATE
        GROUP BY W.movId
        HAVING COUNT(*) >= 2 --R
    ) M
    RETURN @result
END
GO

SELECT dbo.UF_countGoodMovies(2,'01-07-2026', '01-12-2026')
```

#### 2. Tourist Database
Create a database to manage the museum tours for the tourists that visit various exhibitions.
- The entities of interest to the problem domain are: *Museum*, *Exhibition*, *Tour*, and *Tourist*
- Each exhibition has a name, a description, and belongs to a museum 
- Each tour has a name, a date, a name for the tour guide, a ticket price, and belongs to a museum 
- A museum has a name, an opening year, a city in which it is, and its country 
- A tourist is characterised by name, surname, gender, and age 
- Due to every tour and every tourist involved, the system stores the number of bought tickets, and the rating provided after the visit (for each tourist)

1. Write an SQL script that creates the corresponding relational data model 
2. Implement a stored procedure that receives a tour, a tourist, a number of bought tickets, a rating provided after the visit, and adds the tourist to the tour. If it already exists, the number of tickets and the rating are updated
3. Create a view that shows the names of the exhibitions from the *National Museum of Art and Science*
4. Implement a function that lists the name of the tourists that have booked more than **m** tours, where m>=1 is a function parameter

```sql
CREATE TABLE Museum(
    mid INTEGER PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    openingYear INTEGER CHECK (openingYear > 1400),
    city VARCHAR(100),
    country VARCHAR(100)
)
CREATE TABLE Exhibition(
    eid INTEGER PRIMARY KEY IDENTITY(1,1),
    mid INTEGER REFERENCES Museum(mid),
    name VARCHAR(200),
    description VARCHAR(1000)
)
CREATE TABLE Tour(
    tourId INTEGER PRIMARY KEY IDENTITY(1,1),
    mid INTEGER REFERENCES Museum(mid),
    tdate DATETIME,
    guide VARCHAR(100),
    price INTEGER
)
CREATE TABLE Tourist(
    tid INTEGER PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    surname VARCHAR(100),
    gender VARCHAR,
    age INTEGER
)
CREATE TABLE Visit(
    tid INTEGER REFERENCES Tourist(tid),
    tourId INTEGER REFERENCES Tour(tourId),
    ticketCount INTEGER,
    rating INTEGER CHECK(0< rating AND rating <= 5)
)


INSERT INTO Museum([name], openingYear, city, country) VALUES 
('National Museum of Art and Science', 1825, 'London', 'United Kingdom'),
('National Museum of Culture', 1920, 'Iasi', 'Romania'),
('Museum of Modern Art', 1990, 'Vienna', 'Austria');

INSERT INTO Exhibition(mid, [name], [description]) VALUES 
(1, 'Groundbreaking Discoveries of the 18th Century', 'what the name says'),
(1, 'Science as an Art', 'why one cannot exist without the other'),
(1, 'The Disappearance of the ''Jack-of-All-Trades''', 'a history on how we started viewing arts and science as completely incompatible fields and why that''s bad for us'),
(2, 'The History of Traditional Romanian Attire', ''),
(3, 'Favorite Modern Artists of 2025', '');

INSERT INTO Tour(mid, tdate, guide, price) VALUES
(1, '2025-11-23 12:00:00', 'Marie', 12),
(1, '2025-11-24 9:00:00', 'Jonathan', 12),
(1, '2025-11-24 10:00:00', 'Jane', 16),
(2, '2025-11-24 11:00:00', 'Ana', 4),
(2, '2025-11-24 9:00:00', 'Andrei', 4),
(3, '2025-11-24 10:00:00', 'Kate', 20),
(3, '2025-11-24 11:00:00', 'Kate', 20),
(3, '2025-11-24 12:00:00', 'Kate', 20);

INSERT INTO Tourist(name, surname, gender, age) VALUES
('Steve', 'E', 'M', 18),
('Matt', 'G', 'M', 20),
('Lydia', 'W', 'F', 52),
('Susan', 'D', 'F', 55),
('Skyler', 'W', 'F', 34),
('Daisy', 'S', 'F', 14);

INSERT INTO Visit(tid, tourId, ticketCount, rating) VALUES
(1, 1, 10, 4),
(1,2,10,5),
(1,3,2,2),
(2,8,20,4),
(2,7,10,3),
(3,6,1,5),
(3,5,1,3);
GO

CREATE OR ALTER PROC addVisit(
    @tid INTEGER,
    @tourId INTEGER,
    @ticketCount INTEGER,
    @rating INTEGER
) AS 
BEGIN   
    DECLARE @exists INTEGER = (SELECT COUNT(*) FROM Visit WHERE tid = @tid AND tourId = @tourId);
    IF @exists = 0 
        INSERT INTO Visit(tid, tourId, ticketCount, rating) VALUES 
        (@tid, @tourId, @ticketCount, @rating);
    ELSE
        UPDATE Visit
        SET rating = @rating, ticketCount = ticketCount + @ticketCount
        WHERE tid = @tid and tourId = @tourId;
END 
GO

CREATE VIEW getNMoASExhibitions AS 
    SELECT E.[name]
    FROM Exhibition E 
        JOIN Museum M ON M.mid = E.mid
    WHERE M.name = 'National Museum of Art and Science'
GO


CREATE FUNCTION UF_getActiveTourists (
    @m INTEGER
) RETURNS TABLE 
AS 
    RETURN 
    SELECT CONCAT(name, ' ', surname) tourist_name
    FROM Tourist T
        JOIN Visit V ON T.tid = V.tid
    GROUP BY T.tid, T.name, T.surname
    HAVING COUNT(*) > @m
GO

SELECT * FROM dbo.UF_getActiveTourists(2)
```

#### 3. Coffee Database 
Create a database to manage the coffee delivered to various persons in a coffee shop.
- ﻿﻿The entities of interest to the problem domain are: Coffee Type, Coffee, Cake, and Person.
- ﻿﻿Each coffee is given by its name, weight, price and belongs to a type.
- ﻿﻿Each coffee type has besides its name also a description  
    A cake has name, weight and it is offered to each coffee
- ﻿﻿A person has a name, a surname and a date of birthday.
- ﻿﻿Corresponding to each coffee and each person, the system stores the quantity and the final price

1. Write an SQL script that creates the corresponding relational data model.
2. ﻿﻿﻿Implement a stored procedure that receives a coffee, a person, a quantity, a final price, and adds the coffee to the person. If already exists, the quantity and the final price are updated. 
3. ﻿﻿﻿Create a view that shows the names of the cakes served for the coffee called Latte Machiato. 
4. ﻿﻿﻿Implement a function that lists the name of the persons that have tasted all the coffees

```sql
CREATE TABLE CoffeeType (
    ctid INTEGER PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    description VARCHAR(250)
)
CREATE TABLE Coffee (
    cid INTEGER PRIMARY KEY IDENTITY(1,1), 
    ctid INTEGER REFERENCES CoffeeType(ctid),
    name VARCHAR(100),
    weight INTEGER,
    price INTEGER
)
CREATE TABLE Cake (
    ckid INTEGER PRIMARY KEY IDENTITY(1,1),
    cid INTEGER REFERENCES Coffee(cid),
    name VARCHAR(100),
    weight INTEGER
)
CREATE TABLE Person (
    pid INTEGER PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    surname VARCHAR(100),
    bday DATE
)
CREATE TABLE Bought (
    pid INTEGER REFERENCES Person(pid),
    cid INTEGER REFERENCES Coffee(cid),
    quantity INTEGER,
    finalPrice INTEGER
)
INSERT INTO CoffeeType(name, [description]) VALUES
('americano', 'bitter'), ('espresso', 'strong'), ('latte', 'tasty');
INSERT INTO Coffee(ctid, name, weight, price) VALUES 
(1, 'Americano', 100, 10),
(2, 'One Shot Espresso', 50, 5),
(2, 'Double Shot Espresso', 100, 7),
(3, 'Latte', 250, 15),
(3, 'Pumpkin Spice Latte', 250, 28),
(3, 'Latte Machiato', 250, 20),
(3, 'Oat Milk Latte', 300, 25);
INSERT INTO Cake(cid, name, weight) VALUES 
(6,'Ice Cream Cake', 100),
(6, 'Vanilla Cake', 120),
(1, 'Chocolate Cake', 150),
(2, 'Red Velvet', 200),
(5, 'Carrot Cake', 300);
INSERT INTO Person(name, surname, bday) VALUES
('Andreea', 'T', '2000-10-12'),
('Tim', 'G', '2007-11-10'),
('Alex', 'I', '2005-10-10'),
('Erika', 'T', '2005-09-02');
INSERT INTO Bought(pid, cid, quantity, finalPrice) VALUES 
(1, 1, 1, 10), (1,2,1,5), (1,3,1,7),(1,4,1,15),(1,5,1,28),(1,6,1,20),(1,7,1,25),
(2,1,3,30), 
(3, 1, 1, 10), (3,2,1,5), (3,3,1,7),(3,4,2,30),(3,6,1,20),
(4,7,3,75);

GO 
CREATE VIEW LatteMachiatoCakes AS 
    SELECT Ck.name
    FROM Coffee C 
        INNER JOIN Cake Ck on C.cid = Ck.cid
    WHERE C.name LIKE 'Latte Machiato'
GO

CREATE PROC addCoffee (
    @cid INTEGER,
    @pid INTEGER,
    @quantity INTEGER,
    @finalPrice INTEGER
) AS 
BEGIN
    DECLARE @exists INTEGER = (SELECT COUNT(*) FROM Bought WHERE pid = @pid AND cid = @cid)
    IF @exists = 0  
        INSERT INTO Bought(pid, cid, quantity, finalPrice) VALUES
        (@pid, @cid, @quantity, @finalPrice)
    ELSE 
        UPDATE Bought
        SET quantity = quantity + @quantity, finalPrice = finalPrice + @finalPrice
        WHERE pid = @pid AND cid = @cid
END 
GO

EXEC addCoffee 5, 3, 2, 56
SELECT * FROM Bought

GO

CREATE OR ALTER FUNCTION UF_listCoffeeEnthusiasts ()
    RETURNS @result TABLE (full_name VARCHAR(250))
AS 
BEGIN
    DECLARE @totalCoffees INT = (SELECT COUNT(*) FROM Coffee);
    INSERT INTO @result 
        SELECT CONCAT(P.name, ' ', P.surname) full_name
        FROM Person P 
            JOIN Bought B on P.pid = B.pid
        GROUP BY P.pid, P.name, P.surname
        HAVING COUNT(*) = @totalCoffees
    RETURN;
END
GO 
SELECT * FROM dbo.UF_listCoffeeEnthusiasts()

```
#### 4. Fairy Tales Database
Create a database to manage the fairy tale books from different libraries.

- ﻿﻿The entities of interest to the problem domain are: Books, Fairy Tales, Libraries and Cities.
- ﻿﻿Each fairy tale has a title, an author name, the written year, a number of pages, and belongs to a book.
- ﻿﻿A book is characterised by title, publisher and year.
- ﻿﻿A library has name, date year and it is in a city. Each city has name, county and country.
- ﻿﻿For the books stored in the libraries, the systems keep the number of copies and the register date.

1. Write an SQL script that creates the corresponding relational data model.
2. ﻿﻿Implement a stored procedure that receives a book, a library, a number of copies, a register date, and adds the book to the library. If an entry for the provided book and library already exists, the number of copies and the register date are updated.
3. book to tia view that shows the tiles rite aline books that ear be found in the book called *Eternal Fairy Tales*
4. ﻿﻿﻿Create a function that lists the name of the books that can be found in al the libraries from Cluj-Napoca.

```sql
CREATE TABLE Books(
    bid INTEGER PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(200),
    publisher VARCHAR(200),
    yr INTEGER
)
CREATE TABLE FairyTales(
    fid INTEGER PRIMARY KEY IDENTITY(1,1),
    bid INTEGER REFERENCES Books(bid),
    title VARCHAR(200),
    author VARCHAR(200),
    yr INTEGER,
    pageCount INTEGER
)
CREATE TABLE Cities (
    cid INTEGER PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    country VARCHAR(100),
    county VARCHAR(150)
)
CREATE TABLE Libraries (
    lid INTEGER PRIMARY KEY IDENTITY(1,1),
    cid INTEGER REFERENCES Cities(cid),
    name VARCHAR(100),
    yr INTEGER
)
CREATE TABLE Copies (
    bid INTEGER REFERENCES Books(bid),
    lid INTEGER REFERENCES Libraries(lid),
    copies INTEGER CHECK (copies >= 0),
    dateReg DATE

    CONSTRAINT CopyPK PRIMARY KEY(bid, lid)
)
INSERT INTO Books(title, publisher, yr) VALUES 
('Eternal Fairy Tales', 'p1', 2012),
('The Most Enchanting Fairy Tales', 'p2', 2006),
('Spooky Fairy Tales', 'p1', 2020);

INSERT INTO FairyTales(bid, title, author, yr, pageCount) VALUES 
(1, 'Enchanting Tale', 'author1', 1990, 50),
(1, 'Tale As Old As Time', 'author2', 1800, 100),
(2, 'Zana Zorilor', 'popor', 1820, 20),
(3, 'Fairies in the Scandinavian Forest', 'unknown', 1600, 10),
(1, 'The Elder Fairy', 'unknown', 1730, 20);

INSERT INTO Cities(name, country, county) VALUES
('Cluj-Napoca', 'Romania', 'Cluj'),
('Botosani', 'Romania', 'Botosani'),
('Iasi', 'Romania', 'Iasi');

INSERT INTO Libraries(cid, name, yr) VALUES 
(1, 'BCU', 1870),
(1, 'Filiala BCU', 2003),
(1, 'Biblioteca Centrala', 2000),
(2, 'Biblioteca Judeteana', 1960),
(3, 'Biblioteca Palatul Culturii', 2010);
GO

CREATE PROC AddBooksToLibrary(
    @bid INTEGER,
    @lid INTEGER,
    @copies INTEGER,
    @regDate DATE
) AS 
BEGIN
    DECLARE @exists INT;
    SELECT @exists = COUNT(*)
        FROM Copies
        WHERE bid = @bid AND lid = @lid;
    IF @exists = 0 
        INSERT INTO Copies(bid, lid, copies, dateReg) VALUES 
        (@bid, @lid, @copies, @regDate)
    ELSE 
        UPDATE Copies
        SET copies = copies + @copies, dateReg = @regDate
END
GO
EXEC AddBooksToLibrary 1, 4, 20, '2020-01-01'
GO
CREATE VIEW TalesInEternalFairyTales AS 
    SELECT F.title
    FROM FairyTales F 
        JOIN Books B ON F.bid = B.bid
    WHERE B.title LIKE 'Eternal Fairy Tales'
GO 

CREATE OR ALTER FUNCTION UF_getBooksInCluj ()
    RETURNS @ret TABLE(
        title VARCHAR(100)
    )
AS
BEGIN
    DECLARE @librariesInCJ INT;
    SELECT @librariesInCJ = COUNT(*)
        FROM Libraries L
        JOIN Cities C ON C.cid = L.cid
        WHERE C.name = 'Cluj-Napoca'

    INSERT INTO @ret 
        SELECT B.title
        FROM Books B
            JOIN Copies C ON B.bid = C.bid 
            JOIN Libraries L ON C.lid = L.lid
            JOIN Cities Ct on Ct.cid = L.cid
        WHERE Ct.name LIKE 'Cluj-Napoca'
        GROUP BY B.title
        HAVING COUNT(*) = @librariesInCJ
    RETURN
END
GO

SELECT * FROM dbo.UF_getBooksInCluj()

SELECT * FROM Copies

EXEC AddBooksToLibrary 3, 5, 10, '2020-06-10'
```
#### 5. Taxes Database 
Create a database to manage services offered by a Tax management company. The database will store data about all the intermediaries involved. The entities of interest to the problem domain are: *TaxCompany*, *Clients*, *Assets* and *SRLs*(companies opened by the Tax company for their clients).
- A tax company has a name, number of clients and number of opened SRLs (each client has a number of companies(SRLs) opened in his name).
- A tax company can have multiple clients, a client can work only with one tax company. 
- A client has an ID, identification number and the amount of money sent to the tax company(money at his disposal). Furthermore, a client can have multiple assets and multiple SRLs opened. 
- Assets have a name, number of assets for each client and a location (the location of the SRL to which the assets were added). 
- SRLs have a name, an activity and a location (place where the company is established).

1. ﻿﻿﻿Write a SQL script that creates the corresponding relational data model.
2. ﻿﻿﻿Implement a stored procedure that receives a client and returns the number of assets owned and the number of SRLs opened in his name.
3. ﻿﻿﻿Create a view that shows client's identification number and amount of money owned, also the name and activity of all the SRLs opened in his name.
4. ﻿﻿﻿Implement a function that lists the identification numbers of the clients and the location of all the SRLs opened in his name and in addition the number of assets for each SRL.


#### 6. Airline Database 
Create a database to manage airline flight operations. The focus is on passenger by airplanes. The entities of interest to the problem domain are: *Airlines*, *Airports*, *Flights*,  *Airplanes*, and *Pilots*. 
- An airline has a name, description, and operates several airplanes. 
- An airplane has a name, belongs to an airline, and can be used on multiple flights. 
- A flight has a departure time (date time), duration, ticket price, departure airport, destination airport, and an associated airplane. 
- An airport has a name and a location. 
- A pilot has a name and can operate multiple flights; for each flight, the pilot leaves a review (text and number of stars).

a) Write an SQL script that creates the corresponding relational data model (2 points)
b) Implement a stored procedure that receives as parameters a pilot, a flight, a string value, and an integer number (representing the text and number of stars for the review) and adds the corresponding review to the database (1 point)
c) Create a view that shows the names of the airplanes with the largest number of flights. E.g. if there are 3 airplanes: A1 with 15 flights, A2 with 15 flights, and A3 with 12 flights, then both A1 and A2 must be displayed (2 points)
d) Implement a function that returns the number of flights from airport X to airport Y, where X and Y are the function's parameters (airport names) (1 point)
