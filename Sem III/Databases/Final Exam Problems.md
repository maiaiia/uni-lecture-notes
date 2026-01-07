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

### II 

### III Database Design
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

#### 2. Airline Database 
Create a database to manage airline flight operations. The focus is on passenger by airplanes. The entities of interest to the problem domain are: Airlines, Airports, Flights,  Airplanes, and Pilots. An airline has a name, description, and operates several airplanes. An airplane has a name, belongs to an airline, and can be used on multiple flights. A flight has a departure time (date time), duration, ticket price, departure airport, destination airport, and an associated airplane. An airport has a name and a location. A pilot has a name and can operate multiple flights; for each flight, the pilot leaves a review (text and number of stars).

a) Write an SQL script that creates the corresponding relational data model (2 points)
b) Implement a stored procedure that receives as parameters a pilot, a flight, a string value, and an integer number (representing the text and number of stars for the review) and adds the corresponding review to the database (1 point)
c) Create a view that shows the names of the airplanes with the largest number of flights. E.g. if there are 3 airplanes: A1 with 15 flights, A2 with 15 flights, and A3 with 12 flights, then both A1 and A2 must be displayed (2 points)
d) Implement a function that returns the number of flights from airport X to airport Y, where X and Y are the function's parameters (airport names) (1 point)
