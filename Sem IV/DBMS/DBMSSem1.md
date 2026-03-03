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
	
	while (sqlReaderSpies.Read()) {
		Console.WriteLine(readerSpies["realName"]);
	}
	if (readerSpies != null) {
		readerSpies.Close();
	}
	
	sqlCommand.CommandText = "SELECT COUNT(*) FROM Spies";
	Console.WriteLine(sqlCommand.ExecuteScalar());
	
	sqlCommand.CommandText = "INSERT INTO Spies(id, realName, codeName, age, height, weight) VALUES (5, 'Ana Maria', 'Red Bandit', 26, 1.75, 65)";
	//sqlCommand.ExecuteNonQuery();
	
	DataSet dataSet = new DataSet();
	SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM Spies", sqlConnection);
	sqlDataAdapter.Fill(dataSet, "Spies"); //table name may be different but that can be confusing 
	DataTable tableSpies = dataSet.Tables["Spies"];
	foreach(DataRow row in tableSpies.Rows) {
		Console.WriteLine(row["codeName"]);
	}
	
	sqlDataAdapter.DeleteCommand = new SqlCommand("DELETE FROM Spies WHERE id = @id", sqlConnection);
	sqlDataAdapter.DeleteCommand.Parameters.Add("@id", SqlDbType.Int, 5, "id");
	tableSpies.Rows[4].Delete();
	sqlDataAdapter.Update(dataSet, "Spies");
	
	DataRow newSpies = tableSpies.NewRow();
	newSpies[0] = 6;
	newSpies[1] = "Ion Tudor";
	newSpies[2] = "Agent IT";
	newSpies[3] = 67;
	newSpies[4] = 1.78;
	newSpies[5] = 70;
	
	SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(sqlDataAdapter);
	tableSpies.Rows.Add(newSpies);
	sqlDataAdapter.Update(dataSet, "Spies");
	
} catch (SqlException e) {
	Console.WriteLine(e.Message)
} finally {
	sqlConnection.Close()
}

```

