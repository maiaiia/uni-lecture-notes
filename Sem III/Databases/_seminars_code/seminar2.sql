use sem_2025_2026
-- Create DB
CREATE TABLE Missions(
    -- mid, name, description, location, startDate, endDate, difficulty
    mid INTEGER PRIMARY KEY, 
    [name] VARCHAR(100),   
    [description] VARCHAR(100),
    [location] VARCHAR(100),
    startDate DATE,
    endDate DATE,
    difficulty INTEGER
)

CREATE TABLE Spies(
    -- id, realName, codeName, age, height, weight 
    id INTEGER PRIMARY KEY,
    realName VARCHAR(100),
    codeName VARCHAR(100),
    age INTEGER,
    height INTEGER,
    [weight] INTEGER
)

CREATE TABLE Tasks(
    -- spyId, mid, taskDesc, undercover, salary
    spyID INTEGER REFERENCES Spies(id),
    mid INTEGER REFERENCES Missions(mid),
    taskDesc VARCHAR(100),
    undercover bit,
    salary INTEGER
)

-- add entries

-- Insert Missions
INSERT INTO Missions (mid, [name], [description], [location], startDate, endDate, difficulty) VALUES
(100, 'Operation Nightfall', 'Infiltrate enemy base', 'Online', '2025-01-15', '2025-02-28', 8),
(101, 'Shadow Protocol', 'Gather intelligence', 'Moscow', '2025-03-01', '2025-04-15', 6),
(102, 'Silent Watch', 'Surveillance operation', 'Tokyo', '2025-02-10', '2025-03-20', 4),
(103, 'Dark Thunder', 'Extract asset', 'Berlin', '2025-04-01', '2025-05-30', 9),
(104, 'Blue Horizon', 'Decrypt documents', 'Online', '2025-01-20', '2025-02-15', 3),
(200, 'Crimson Dawn', 'Diplomatic escort', 'Paris', '2025-05-01', '2025-06-10', 5),
(201, 'Ghost Runner', 'Counter-espionage', 'London', '2025-03-15', '2025-04-30', 7),
(202, 'Iron Shield', 'Protect witness', 'New York', '2025-02-01', '2025-03-01', 6);

-- Insert Spies
INSERT INTO Spies (id, realName, codeName, age, height, [weight]) VALUES
(1, 'Sarah Mitchell', 'Shadow', 28, 170, 65),
(2, 'James Anderson', 'Phantom', 35, 180, 82),
(3, 'Emily Chen', 'Scarlet', 24, 165, 58),
(4, 'Alexander Kane', 'Alex', 30, 175, 75),
(5, 'Maria Rodriguez', 'Viper', 26, 168, 62),
(6, 'David Thompson', 'Storm', 32, 185, 88),
(7, 'Lisa Wong', 'Nighthawk', 29, 172, 67),
(8, 'Robert Hughes', 'Falcon', 18, 178, 73),
(9, 'Anna Petrov', 'Alex', 22, 160, 55),
(10, 'Michael Brooks', 'Striker', 40, 183, 90);

-- Insert Tasks
INSERT INTO Tasks (spyID, mid, taskDesc, undercover, salary) VALUES
(1, 100, 'Network penetration', 1, 50000),
(1, 101, 'Asset recruitment', 0, 45000),
(2, 100, 'Security bypass', 1, 55000),
(3, 102, 'Visual surveillance', 1, 40000),
(4, 103, 'Field extraction', 0, 60000),
(5, 104, 'Code breaking', 1, 48000),
(6, 201, 'Counter-surveillance', 0, 52000),
(7, 100, 'Data analysis', 1, 47000),
(8, 102, 'Communications intercept', 0, 43000),
(9, 103, 'Safe house management', 1, 41000),
(10, 201, 'Intelligence gathering', 0, 58000),
(2, 104, 'Document analysis', 0, 46000),
(4, 200, 'Protection detail', 0, 53000),
(6, 102, 'Equipment testing', 0, 44000);

-- Q1 Find the mission with a difficulty of above 5
SELECT *
FROM Missions 
WHERE difficulty > 5

-- Missions with difficulty between 3 and 7
-- Eliminate the duplicates
SELECT [name], [location]
FROM Missions 
WHERE difficulty BETWEEN 3 and 7

-- Q3. Find the spies (real name) who have undercover tasks
SELECT Spies.realName, Tasks.undercover
FROM Spies, Tasks 
WHERE Tasks.undercover = 1 AND Spies.id = Tasks.spyId

-- vs 
-- Range variables = aliases for a table
SELECT S.realName, T.undercover 
FROM Spies S, Tasks T 
WHERE T.undercover = 1 AND S.id = T.spyId


-- Arithmetic Expressions and the LIKE operator 

-- Q4. For all spies whose name start with S and have at least 
-- 3 letters (for the code name), compute the BMI

SELECT S.codeName, BMI = S.weight / (S.height * S.height) --BMI = gives the column a name
FROM Spies S 
WHERE S.codeName LIKE 'S_%' 

-- Like operator 
-- _ - any character (1 character)
-- % - 0 or more characters
-- [a-z] - range
-- [^aeiou] - to not have vowels (e.g.)
-- (so regex-like syntax)


-- SET operations
-- UNION [ALL] (all - duplicates are not eliminated), EXCEPT, INTERSECT 

-- Q5. Find the IDs of the spies who are older than 19
-- or have a task assigned for mission 100 

SELECT S.id
FROM Spies S 
WHERE S.age > 19 
UNION
SELECT T.spyID
FROM Tasks T 
WHERE T.mid = 100

-- Q6. Find the ids of the spies who have a task assigned 
-- in an online mission, but they do not have a task 
-- for an on-site mission

SELECT T.spyID 
FROM Tasks T, Missions M 
WHERE M.[location] = 'Online' AND T.mid = M.mid 
EXCEPT 
SELECT T.spyID 
FROM Tasks T, Missions M 
WHERE M.[location] <> 'Online' AND T.mid = M.mid 

-- Q7. Find the ids of the spies who have at least a task assigned 
-- in an online mission and at least a task 
-- for an on-site mission

SELECT T.spyID 
FROM Tasks T, Missions M 
WHERE M.[location] = 'Online' AND T.mid = M.mid 
INTERSECT 
SELECT T.spyID 
FROM Tasks T, Missions M 
WHERE M.[location] <> 'Online' AND T.mid = M.mid 


-- Nested Queries 
-- subqueries can appear in the FROM, WHERE or HAVING clause
-- Q8. Find the real names of the spies 
-- who have not been assigned a task for mission 200 
-- IN / EXISTS 

-- down -> top
SELECT S.realName 
FROM Spies S 
WHERE S.id NOT IN (
    SELECT T.spyId 
    FROM Tasks T 
    WHERE T.mid = 200 
)

-- top -> down 

SELECT S.realName 
FROM Spies S 
WHERE NOT EXISTS (
    SELECT T.spyId  
    FROM Tasks T 
    WHERE T.mid = 200 AND S.id = T.spyId 
)

-- Q9. Find all spies older than some spy named Alex (codename)

SELECT S.realName, S.age 
FROM Spies S 
WHERE S.age > ANY (
    SELECT S2.age  
    FROM Spies S2 
    WHERE S2.codeName = 'Alex'
)

-- Q10. Find all spies older than any spy named Alex (codename)
SELECT S.realName, S.age 
FROM Spies S 
WHERE S.age > ALL (
    SELECT S2.age  
    FROM Spies S2 
    WHERE S2.codeName = 'Alex'
)

-- JOIN Operators: INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN

SELECT S.codeName, M.name 
FROM Spies S 
INNER JOIN Tasks T ON S.id = T.spyId 
INNER JOIN Missions M ON T.mid = M.mid 

-- Q? compare 
SELECT * 
FROM Tasks T, Missions M 
WHERE T.mid = M.mid 
-- vs 
SELECT * 
FROM Tasks T INNER JOIN Missions M ON T.mid = M.mid 
-- the former does a cartesian product 
-- the latter is more efficient

-- aggregation operators
-- COUNT(*)
-- COUNT ([DISTINCT] col1)
-- SUM([DISTINCT] )
-- MIN(col)
-- MAX(col)

-- Q15. Count the missions 
SELECT COUNT(*) * 2 no_missions 
FROM Missions

-- Q16. Find the average and the minimum age for the spies
-- having a codename (codename not null)
SELECT AVG(S.age) AS avg_age, min_age = MIN(S.age), max_age = MAX(S.age)
FROM Spies S 
WHERE S.codeName IS NOT NULL 

-- Q17. Find the number of unique places where
-- missions took place with a difficulty score of 5

SELECT COUNT(DISTINCT M.[location])
FROM Missions M 
WHERE M.difficulty = 5 

-- Q18. Find the real name and the age of the tallest spy

SELECT S.realName, S.age
FROM Spies S 
WHERE S.height = (
    SELECT MAX(S2.height)
    FROM Spies S2
)

-- Q19. For each mission location find the number of 
-- associated tasks and the average salary (for the task)

SELECT M.[location], COUNT(*) AS task_count, avg_salary = AVG(T.salary)
FROM Tasks T INNER JOIN Missions M ON T.mid = M.mid 
GROUP BY M.[location]
-- HAVING COUNT(*) > 1 -- group condition

-- make sure that the where condition comes before
-- the group by 

-- note that in the select statement you can only use 
-- aggregation operators / whatever fields were included
-- in the group by part

SELECT M.[location], COUNT(*) AS task_count, avg_salary = AVG(T.salary)
FROM Tasks T, Missions M
WHERE  T.mid = M.mid 
GROUP BY M.[location]
--HAVING COUNT(*) > 1 -- group condition
ORDER BY task_count DESC 

-- HW: Upload sql script with queries that include
-- at least one join operator, an aggregation operator
-- and an 
go

CREATE PROCEDURE getSpyMissions(@spyid INT) AS
	SELECT DISTINCT T.mid 
	FROM Tasks T
	WHERE T.spyId = @spyid
GO
s
SELECT mid 
FROM EXEC getSpyMissions 2
WHERE mid NOT IN (
	EXEC getSpyMissions 1
)
