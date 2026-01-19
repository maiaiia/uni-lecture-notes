USE sem_2025_2026
GO 

--a
CREATE OR ALTER FUNCTION UF_averageAge(@stringWildcard VARCHAR(50))
    RETURNS FLOAT 
    AS 
    BEGIN  
        DECLARE @average FLOAT = 0
        SELECT @average = AVG(age)
        FROM Spies
        WHERE realName
        LIKE @stringWildcard 
        RETURN @average
    END 
GO  

PRINT dbo.UF_averageAge('A%')
GO

--b
CREATE OR ALTER FUNCTION UF_missionsByLocation(@location VARCHAR(50))
    RETURNS TABLE 
    AS 
    RETURN 
    SELECT [name] 
    FROM Missions
    WHERE [location] = @location
GO 

SELECT * FROM dbo.UF_missionsByLocation('Online') 
GO 

--c 
CREATE OR ALTER FUNCTION UF_missionByLocation(@location VARCHAR(50))
    RETURNS @result_table TABLE (
        mid INT,
        [name] VARCHAR(50)
    )
    AS 
    BEGIN 
        INSERT INTO @result_table 
            SELECT M.mid, M.[name]
            FROM Missions M 
            WHERE [location] = @location

        IF ((SELECT COUNT(*) FROM @result_table) = 0)
            INSERT INTO @result_table VALUES(0, 'no missions found')

        RETURN 
    END 
GO 

--SELECT * FROM dbo.UF_missionByLocation('aljkfd') 
SELECT * FROM dbo.UF_missionByLocation('Online') 
GO 

--------- VIEWS --------
-- Views are virtual tables stored in memory as a select statement + the schema of the result 
-- Views can be executed when they are included in a select statement
-- The result of a select statement is not stored in memory

-- USAGE: increase code readability, reduce code duplicates, and sometimes even security reasons (only make some data available to users while hiding the fields of the original table)

-- d 
CREATE OR ALTER VIEW missionSpy AS 
    SELECT mission_name = M.name, spy_name = S.codeName
    FROM Missions M INNER JOIN 
        Tasks T ON M.mid = T.mid INNER JOIN 
        Spies S ON S.id = T.spyID
GO 

SELECT * FROM missionSpy
GO 

----------- SYSTEM CATALOG -----------
-- Maintained by the system, helpful for queries
-- e.g. sys.indexes, 
--      sys.parameters, 
--      sys.sql_modules, 
--      sys.objects 
--          - a_type -- >
--              'P' for procedures 
--              'PK', 
--              'FK', 
--              'C', 
--              'IF', 
--              'FN', 
--              'TF'

--e.g.
SELECT *
FROM sys.objects o 
INNER JOIN sys.parameters p ON o.object_id = p.object_id

-------- TRIGGERS ----------
-- DDL - create, alter, drop
-- DML - insert, delete, update 
-- FOR, AFTER / INSTEAD OF 

-- inside triggers we are able to access two special internally managed tables that 
-- store the old and new values of changed rows: INSERTED and DELETED

-- every time a change is made on the 'Books' table
GO 
CREATE OR ALTER TRIGGER triggerInsert
ON Books FOR INSERT AS 
BEGIN 
    SET NOCOUNT ON -- mutes update messages from trigger
    INSERT INTO BooksBoughtLog
    SELECT I.title, GETDATE(), I.quantity 
    FROM INSERTED I
END 
GO 

INSERT INTO Books(bid, title, authors, noPages, quantity) VALUES
(3, 'My Brilliant Friend', 'Elena Ferrante', 345, 46)
SELECT * FROM BooksBoughtLog
GO   

CREATE TRIGGER triggerUpdate 
ON Books FOR UPDATE AS 
BEGIN 
    SET NOCOUNT ON
    INSERT INTO BooksSoldLog
        SELECT I.title, GETDATE(), D.quantity - I.quantity 
        FROM INSERTED I, DELETED D 
        WHERE I.bid = D.bid AND D.quantity > I.quantity

    INSERT INTO BooksBoughtLog 
        SELECT I.title, GETDATE(), I.quantity - D.quantity
        FROM INSERTED I INNER JOIN DELETED D ON I.bid = D.bid
        WHERE D.quantity < I.quantity
END  
GO  

UPDATE Books
    SET quantity = quantity - 5 
SELECT * FROM BooksBoughtLog
SELECT * FROM BooksSoldLog
GO  

------- MERGE STATEMENT --------
CREATE TABLE Grades(
    gid SMALLINT,
    course VARCHAR(150),
    student VARCHAR(150),
    examRoom VARCHAR(50),
    grade FLOAT,
    gradedAt DATE
)
INSERT INTO Grades(gid, course, student, examRoom, grade, gradedAt) VALUES
    (1, 'Databases', 'George Bacovia', 'A321', NULL, NULL),
    (2, 'Databases', 'George Bacovia', NULL, 9.56, NULL),
    (3, 'Databases', 'George Bacovia', NULL, NULL, '1901-10-11'),
    (4, 'Computer Networks', 'George Bacovia', 'L304', NULL, NULL),
    (5, 'Computer Networks', 'George Bacovia', NULL, 8.37, NULL),
    (6, 'Computer Networks', 'George Bacovia', NULL, NULL, '1901-11-27'),
    (7, 'Databases', 'Lucian Blaga', 'A311', NULL, NULL),
    (8, 'Databases', 'Lucian Blaga', NULL, 9.07, NULL),
    (9, 'Databases', 'Lucian Blaga', NULL, NULL, '1901-12-10')

MERGE Grades G USING (
    SELECT MAX(gid), course, student, MAX(examRoom), MAX(grade), MAX(gradedAt)
    FROM Grades 
    GROUP BY course, student
) G2(gid, course, student, examRoom, grade, gradedAt) ON G.gid = G2.gid
WHEN MATCHED THEN UPDATE SET 
    G.course = G2.course,
    G.student = G2.student,
    G.examRoom = G2.examRoom,
    G.grade = G2.grade,
    G.gradedAt = G2.gradedAt
WHEN NOT MATCHED BY SOURCE THEN DELETE;

SELECT * FROM Grades
GO  

-- merge rewritten without merge
UPDATE G 
SET 
    G.course = G2.course,
    G.student = G2.student,
    G.examRoom = G2.examRoom,
    G.grade = G2.grade,
    G.gradedAt = G2.gradedAt
FROM Grades G
JOIN (
    SELECT 
        MAX(gid) AS gid,
        course,
        student,
        MAX(examRoom) AS examRoom,
        MAX(grade) AS grade,
        MAX(gradedAt) as gradedAt
    FROM Grades 
    GROUP BY course, student
) G2 ON G.gid = G2.gid

DELETE G 
FROM Grades G 
WHERE G.gid NOT IN (
    SELECT MAX(gid)
    FROM Grades
    GROUP BY course, student
)
GO
-- additional insert example
CREATE TABLE NewGrades(
    gid SMALLINT,
    course VARCHAR(150),
    student VARCHAR(150),
    examRoom VARCHAR(50),
    grade FLOAT,
    gradedAt DATE
)
INSERT INTO NewGrades VALUES(10, 'Computer Networks', 'Ion Barbu', 'A321', 7, '1901-12-12')

MERGE INTO Grades AS G
USING NewGrades NG
    ON G.gid = NG.gid
WHEN NOT MATCHED BY TARGET THEN 
    INSERT(gid, course, student, examRoom, grade, gradedAt)
    VALUES(NG.gid, NG.course, NG.student, NG.examRoom, NG.grade, NG.gradedAt);

-- equivalent

INSERT INTO Grades(gid, course, student, examRoom, grade, gradedAt)
SELECT NG.gid, NG.course, NG.student, NG.examRoom, NG.grade, NG.gradedAt 
FROM NewGrades NG 
WHERE NOT EXISTS (
    SELECT * 
    FROM Grades G 
    WHERE G.gid = NG.gid
)

SELECT * FROM Grades
GO
-- write a stored procedure which will count all the tasks with a salary between 1000 and 1500

CREATE OR ALTER PROCEDURE select_in_salary_range AS 
    SELECT COUNT(*) 
    FROM Tasks T 
    WHERE T.salary BETWEEN 40000 AND 50000
GO 


SELECT * From Tasks

select_in_salary_range
GO 

