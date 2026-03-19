---
Class: "[[DBMS]]"
date: 2026-03-17
type: Seminar
---
# DBMSSem2

## ADO.NET Data Binding
![[DBMSSem2 2026-03-17 14.31.25.excalidraw]]
Structures suitable for data binding:
- DataColumn
- DataTable
- DataView
- DataSet
- DataViewManager

![[DBMSSem2 2026-03-17 14.34.42.excalidraw]]
![[DBMSSem2 2026-03-17 14.36.39.excalidraw]]

based on the row status, the sql data adapter can identify which command is executed

## Data Relation
GetParentRow(), GetChildRwos() --> on DataRow class
![[DBMSSem2 2026-03-17 14.40.48.excalidraw]]
## Constraints
There are 2 types of constraints
- ForeignKeyConstraint
- UniqueConstraint

DataSet/EnforceConstraints = true

## EntityFramework
- create classes
- queries can be created in the programming language and are afterwards translated into the query language 

## Code Examples

(double clicking on interactive objects in the gui automatically creates handlers for said objects)

```cs

```

```cs
private void btn1_Click(object sender, EventArgs e){
	SpiesAdapter = new SqlDataAdapter("SELECT * FROM Spies", connect);
	TasksAdapter = new SqlDataAdapter("SELECT * FROM Tasks", connect);
	SpiesAdapter.Fill(data, "Spies");
	TasksAdapter.Fill(data, "Tasks");
	DataRelation spiesTaskRelation = new DataRelation("FK_Spies_Tasks", data.Tables["Spies"].Columns["id"], data.Tables["Tasks"].Columns["spyId"]);
	data.Relations.Add(spiesTaskRelation);
	
	builderTasks = new SqlCommandBuilder(TasksAdapter);
	
	SpiesBinding.DataSource = data;
	SpiesBinding.DataMember = "Spies";
	
	TasksBinding.DataSource = SpiesBinding;
	TasksBinding.DataMember = "FK_Spies_Tasks";
	
	DGBspies.DataSource = SpiesBinding;
	DGBtasks.DataSource = TasksBinding;
	
	textBox_TaskDescription.DataBindings.Add("Text", TasksBinding, "taskDesc");
}
```

```cs
private void btnSave_Click(object sender, EventArgs e)
{
	try
	{
		TasksAdapter.Update(data, "Tasks");
	}
	catch(SqlException ex)
	{
		MessageBox.Show(ex.Message())
	}

}
```