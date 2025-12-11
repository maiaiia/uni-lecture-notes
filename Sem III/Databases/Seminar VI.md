---
Class: "[[Databases]]"
date: 2025-12-11
type: Seminar
---
# Practical Exam Sample
## I
Let $R$ be a table in a SQL Server database with schema $R[FK1, FK2, C1, C2, C3, C4, C5]$. The primary key is $\{FK1, FK2\}$

| FK1 | FK2 | C1                                                                                            | C2                         | C3  | C4  | C5  |
| --- | --- | --------------------------------------------------------------------------------------------- | -------------------------- | --- | --- | --- |
| 1   | 1   | Pisica pe acoperisul fierbinte                                                                | Tennessee Williams         | 100 | 20  | AB  |
| 1   | 2   | Conul Leonida fata cu reactiunea                                                              | Ion Luca Caragiale         | 50  | 50  | CQ  |
| 1   | 3   | Concert pe muzica de Bach                                                                     | Hortensia Papadat-Bengescu | 50  | 10  | QC  |
| 2   | 1   | Fata babei si fata mosneagului                                                                | Ion Creanga                | 100 | 100 | QM  |
| 2   | 2   | Fumosii nebuni ai marilor orase                                                               | Fanus Neagu                | 10  | 10  | BA  |
| 2   | 3   | Frumoasa calatorie a ursilor panda povestita de un saxofonist care avea o iubita la Frankfurt | Matei Visnic               | 100 | 20  | MQ  |
| 3   | 1   | Mansarda la Paris cu vedere spre moarte                                                       | Matei Visnic               | 200 | 10  | PQ  |
| 3   | 2   | Richard al III-lea se interzice sau Scene din viata lui Meyerhold                             | Matei Visnic               | 100 | 50  | PQ  |
| 3   | 3   | Masinaria Cehov. Nina sau despre fragilitatea pescarusilor impaiati                           | Matei Visnic               | 100 | 100 | AZ  |
| 4   | 1   | Omul de zapada care voia sa intalneasca soarele                                               | Matei Visnic               | 100 | 100 | CP  |
| 4   | 2   | Extraterestrul care isi dorea ca amintire o pijama                                            | Matei Visnic               | 50  | 10  | CQ  |
| 4   | 3   | O femeie draguta cu o floare si ferestre spre nord                                            | Edvard Radzinski           | 10  | 100 | C{} |
| 4   | 4   | Trenul din zori nu mai opreste aici                                                           | Tennessee Williams         | 200 | 200 | MA  |
>[!Question]
>Consider query Q below
>```sql
>SELECT C2, SUM(C3) AS TotalC3, AGV(C3) AS AvgC3
>FROM R
>WHERE C3 >= 100 OR C1 LIKE '%Pisica%'
>GROUP BY C2
>HAVING SUM(C3) > 100
>```
>
>a) Q returns 3 records and value *Matei Visniec* is in its result set
>b) Q returns 3 records and value Matei Visniec is not in its result set 
>c) Q returns 2 records and value *Ion Creanga* is not in its result set 
>d) Q returns 2 records and value *Ion Creanga* is in its result set 
>e) None of the above answers is correct

>[!Question]
>How many records does the following query return?
>```sql
>SELECT *
>FROM 
>	(SELECT FK1, FK2, C3 + C4 AS TotalC3C4
>	FROM R
>	WHERE FK1 = FK2) R1
>		INNER JOIN
>	(SELECT FK1, FK2, C5
>	FROM R
>	WHERE C5 LIKE '%Q%') R2 
>		ON R1.RK1 = R2.FK1 AND R1.FK2 = R2.FK2
>```
>a) 2 
>b) 8 
>c) 0 
>d) 1 
>e) None of the above answers is correct

>[!Question]
> Table R has a single trigger defined on it 
> ```sql
> CREATE OR ALTER TRIGGER TrOnUpdate
> 	ON R
> 	FOR UPDATE 
> AS
> 	DECLARE @total INT = 0 
> 	SELECT @total = SUM(i.C3 - d.C3)
> 	FROM deleted d INNER JOIN inserted i ON d.FK1 = i.FK1 AND d.FK2 = i.FK2
> 	WHERE d.C3 < i.C3
> 	PRINT @total
> ```
> What's the value returned by the `PRINT` statement in the trigger when the `UPDATE` below is executed?
> ```sql
> UPDATE R
> SET C3 = 300
> WHERE FK1 < FK2
> ```
> a) 550
> b) 700
> c) 650
> d) 600
> e) None of the above answers is correct
## II
>[!Question]
>Create a database to manage train schedules. The database will store data about the routes of all the trains. The entities of interest to the problem domain are: *Trains*, *Train Types*, *Stations*, and *Routes*. Each train has a name and belongs to a type. A train type has a name and a description. Each station has a name. Station names are unique. Route names are unique. The arrival and departure times are represented as hour:minute pairs, e.g. train arives at 5 pm and leaves at 5:10 pm.


1. Write an SQL script that creates the corresponding relational data model
2. Implement a stored procedure that receives a route, a station, arrival and departure times, and adds the station to the route. If the station is already on the route, the departure and arrival times are updated.
3. Create a view that shows the names of the routes that pass through all the stations.
4. Implement a function that lists the names of the stations with more than $R$ routes, where $R$ is a function parameter


![[finex-diag]]
```sql
-- 1
CREATE TABLE TrainTypes(
	typeID INTEGER PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	description VARCHAR(200)
)

CREATE TABLE Trains(
	trainID INTEGER PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	type INT REFERENCES TrainTypes(typeID)
)

CREATE TABLE Routes(
	routeID INTEGER PRIMARY KEY IDENTITY(1,1)
	name VARCHAR(100) UNIQUE,
	train INTEGER REFERENCES Trains(trainID)
)

CREATE TABLE Stations(
	stationID INTEGER PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100) UNIQUE
)

CREATE TABLE RoutesStations(
	routeID INTEGER NOT NULL FOREIGN KEY REFERENCES Routes(routeID),
	stationID INTEGER NOT NULL FOREIGN KEY REFERENCES Stations(stationID),
	arrival TIME,
	departure TIME
	
	CONSTRAINT PK_route_station PRIMARY KEY (routeID, stationID)
)
```

```sql
-- 2
CREATE OR ALTER PROC AddStationToRoute (
	@routeID INTEGER,
	@stationID INTEGER,
	@arrival TIME,
	@departure TIME
) AS 
BEGIN
	IF ((SELECT COUNT(*) FROM RoutesStations WHERE routeID = @routeID AND stationID = @stationID) > 0)
		UPDATE RoutesStations
		SET arrival = @arrival, departure = @departure
		WHERE routeID = @routeID AND stationID = @stationID
	ELSE
		INSERT INTO RoutesStations(routeID, stationID, arrival, departure)
		VALUES (@routeID, @stationID, @arrival, @departure)
END

```

```sql 
-- 3
CREATE VIEW 
SELECT R.[name] 
FROM Routes R INNER JOIN (
	SELECT RS.routeID, COUNT(*) StationCount
	FROM RoutesStations RS
	GROUP BY routeID
	HAVING StationCount = (
		SELECT Count(*)
		FROM Stations
	)
) T ON T.routeID = R.routeID

```

```sql
-- 4.
CREATE FUNCTION stationNames (
	@R INTEGER 
)
	RETURNS TABLE 
AS RETURN
	SELECT S.name 
	FROM Stations S 
	WHERE S.stationID IN(
		SELECT RS.stationID
		FROM RouteStations RS
		GROUP BY RS.stationID
		HAVING COUNT(routeID > @R)
	)
GO
```


Write the indexes on Routes