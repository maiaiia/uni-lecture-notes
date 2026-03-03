---
Class: "[[DBMS]]"
date: 2026-03-03
type:
---
# ADO.NET

## 1. The Data Cycle
![[ADO-NET-data-cycle]]
1. Connect to the data
2. Prepare the app to receive the data
3. Fetch the data 
4. Display the data to the user 
5. Edit the data
6. Validate the data
7. Save (Update the data)
## 2. ADO.NET

![[ado-net]]
### Data Set
- local (in memory) cache
- relational structure
- can still be accessed even if the connection to the database is closed 
- props:
	- Tables
	- Relations 
	- Methods: Clear(), HasChanges()

### Data Table
- props:
	- Rows
	- Columns
	- Child / Parent Relations

### SqlConnection
- props:
	- ConnectionString 
	- ConnectionTimeout (used when the server is not responsive)

### SqlException
- SQL Server ERRORS: 0-25 levels of severity
- 20 - 25 -> fatal error + db connection closed 

### SqlCommand
- props:
	- CommandText
	- CommandTimeout
- methods:
	- ExecuteScalar(), ExecuteNonQuery(), ExecuteReader() 

### SqlDataReader
- return by an ExecuteReader command
- works like an iterator over a query

### SqlDataAdapter
- works like a bridge between the database and the data reader
- props:
	- SelectCommand
	- DeleteCommand
	- UpdateCommand
	- InsertCommand
- methods:
	- Fill()
	- Update()

![[DBMSSem1 2026-03-03 14.42.50.excalidraw]]

```c#
using SqlConnection;

SqlConnection sqlConnection = new SqlConnection();
String connectionString = "Data Source=servername;Initial Catalog=dbname;Integrated Security=true;Trust Server Certificate=true";
sqlConnection.ConnectionString = connectionString;
try {
	sqlConnection.Open();
	SqlCommand sqlCommand = new SqlCommand();
	sqlCommand.CommandText = "SELECT * FROM Spies";
	sqlCommand.Connection = sqlConnection;
	SqlDataReader sqlReaderSpies = sqlCommand.ExecuteReader();
	
	while (sqlReaderSpies.Read)
	
} catch (SqlException e) {
	Console.WriteLine(e.Message)
} finally {
	sqlConnection.Close()
}

```

