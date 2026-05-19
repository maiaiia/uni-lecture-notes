---
Class: "[[DBMS]]"
date: 2026-05-19
type:
---
# Lab Exam Sample Subject

## 1. Multiple-choice
Customers is a table in an SQL Server database with schema Customers\[*CustomerID*, FirstName, LastName, City, DateOfBirth]. The PK is CustomerID. 

CustomerID is the search key of the clustered index on Customers. The table doesn't have any other indexes.

Consider the interleaved execution below. There are no concurrent transactions. The value of City for the customer with CustomerID 2 is Timisoara when T1 begins exection.


| T1                                                                    | T2                                                                               |
| --------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| BEGIN TRAN<br>SELECT City <br>FROM Customers <br>WHERE CustomerID = 2 |                                                                                  |
|                                                                       | BEGIN TRAN<br>UPDATE Customers<br>SET City='Cluj-Napoca'<br>WHERE CustomerID = 2 |
| UPDATE Customers<br>SET City = 'Bucuresti'<br>WHERE CustomerID = 2    |                                                                                  |
|                                                                       | ROLLBACK TRAN                                                                    |
| COMMIT TRAN                                                           |                                                                                  |

-  T1 and T2 run under READ UNCOMMITTED. After the COMMIT TRAN Sstatement in T1, the City value for the customer with CustomerID2 is:
	- Timisoara
	- Cluj-Napoca
	- **Bucuresti**
	- Null
- T1 runs under READ COMMITTED and T2 under REPEATABLE READ. After COMMIT TRAN statement in T1, the City value for the customer with CustomerID 2 is:
	- Timisoara
	- Cluj-Napoca
	- **Bucuresti**
	- Null
- T1 runs under REPEATABLE READ and T2 runs under READ COMMITTED. Then:
	- T1 doesn't acquire a shared lock for its SELECT statement
	- **T1 acquires a shared lock for its SELECT statement**
	- **T2 needs an exclusive lock for its UPDATE statement**
	- **T1 needs an exclusive lock for its UPDATE statement**


## 2. Database design and ADO.NET stuff
Create a database for a MiniFacebook system. The entities of interest to the problem domain are: Users, Pages, Likes, Categories, Posts, and Comments. Each user has a name, current city and date of birth. A user can like multiple pages. The system stores the date of each like. A page has a name and a category, e.g. sports, movies, music, etc. A category also has a category description. Users write posts and comment on existing posts. A user's post has a date, text, and number of shares. A comment is anonymous, has a text, a date, and a flag indicating whether it's a top comment for the corresponding post.

 
 - Write an SQL script that creates the corresponding relational data model
![[LabExamPractice]]

```sql
CREATE TABLE Users (
	uid INTEGER PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	city VARCHAR(100),
	dob DATE
)

CREATE TABLE Categories (
	cid INTEGER PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	desc VARCHAR(100)
)

CREATE TABLE Pages (
	pid INTEGER PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	cid INTEGER FOREIGN KEY REFERENCES Categories(cid)
)

CREATE TABLE Likes (
	uid INTEGER FOREIGN KEY REFERENCES Users(uid),
	pid INTEGER FOREIGN KEY REFERENCES Pages(pid),
	
	PRIMARY KEY (uid, pid)
)

CREATE TABLE Posts (
	pid INTEGER PRIMARY KEY IDENTITY(1,1),
	uid INTEGER FOREIGN KEY REFERENCES Users(uid),
	[date] DATE,
	[text] VARCHAR(100),
	shares INTEGER
)

CREATE TABLE Comments (
	coid INTEGER PRIMARY KEY IDENTITY(1,1),
	pid INTEGER FOREIGN KEY REFERENCES Posts(pid),
	[date] DATE,
	[text] VARCHAR(100),
	isTop BIT
)

-- bla bla bla inserting stuff 
```

- Create a Master/Detail Form that allows one to display the posts for a given user, to carry out CRUD operations on the posts of a given user. The form should have a DataGridView named dgvUsers to display the users, a DataGridView named dgvPosts to display the posts of the selected user, and a button for ssavind added / deleted / modified posts. You must use the following classes: DataSet, SqlDataAdapter, BindingSource.

- Create a scenario that reproduces the non-repeatable read concurrency issue on this database. Explain why the non-repeatable read occurs, and describe a solution to prevent this concurrency issue. Don't use stored procedures.

Non-repeatable reads are concurrency 