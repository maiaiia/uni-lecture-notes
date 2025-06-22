# Model-View Architecture
___
Class: [[OOP]]
Tags: #designPatterns 
___
## General - Model-View-Controller
![[Model-View Architecture 2025-06-21 13.26.53.excalidraw]]

| Info \ Component | Model                                                              | View                                                                            | Controller                                                                                                                                                                               |
| ---------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Description      | Application Object                                                 | Screen Presentation                                                             | Handler                                                                                                                                                                                  |
| Responsibility   | - Fetches the data needed by the view<br>- Writes back any changes | - Requests only the data needed for display<br>- Handles the aspect of the data | - Defines the way the UI reacts to the user input<br>- Interprets input and commands the model to change as appropriate<br>- Converts user actions into requests to navigate / Edit data |
## Model / View in Qt

### General
In Qt, display widgets have 2 ways of accessing data:
1. by using *internal containers* to store it 
	- intuitive approach
	- data is duplicated
	- may lead to *synchronisation issues*
2. via *model / view* programming
	- no internal containers
	- decoupling of viewers and data handlers
	- allows multiple views for the same model

>[!Tip]
>In Qt, the View and Controller objects are combined. A new type of component is introduced - the *delegate*
>- *Model*: Represents the data (interface to the data structure)
>- *View*: Displays the data
>- *Delegate*: Renders single data and assists data editing

User input is handled with *delegates*. The delegate is used to provide fine control over how items are rendered and edited.

Workflow:
- The model communicates with a source of data and provides an *interface* for the views
- The view obtains *model indexes* from the model - *references* to items of data
- The delegate renders the items of data and communicates with the model when the data is edited

### TableView&Model
A **QAbstractTableModel** *must* have the following methods:
- **rowCount** - number of rows displayed by the table
- **columnCount** 
- **data**
	- this function is called (by the view) whenever it (the view) is updated
	- a call is performed for each cell individually
	- multiple calls may target the same cell, but with different *roles*

>[!Warning]
>make sure to declare model as **Q_OBJECT**!!!!

Example:
```cpp
// mymodel.cpp
QVariant MyModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    int col = index.column();
    // generate a log message when this method gets called
    qDebug() << QString("row %1, col%2, role %3")
            .arg(row).arg(col).arg(role);

    switch (role) {
    case Qt::DisplayRole:
        if (row == 0 && col == 1) return QString("<--left");
        if (row == 1 && col == 1) return QString("right-->");

        return QString("Row%1, Column%2")
                .arg(row + 1)
                .arg(col +1);
    case Qt::FontRole:
        if (row == 0 && col == 0) { // change font only for cell(0,0)
            QFont boldFont;
            boldFont.setBold(true);
            return boldFont;
        }
        break;
    case Qt::BackgroundRole:
        if (row == 1 && col == 2)  // change background only for cell(1,2)
            return QBrush(Qt::red);
        break;
    case Qt::TextAlignmentRole:
        if (row == 1 && col == 1) // change text alignment only for cell(1,1)
            return int(Qt::AlignRight | Qt::AlignVCenter);
        break;
    case Qt::CheckStateRole:
        if (row == 1 && col == 0) // add a checkbox to cell(1,0)
            return Qt::Checked;
        break;
    }
    return QVariant(); //Don't forget this line of code!!!!!!!!
}
```



