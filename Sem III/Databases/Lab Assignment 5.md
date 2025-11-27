Tables:
tests
- testId
- name
- test description
tables (where the tests will be run)
- tableID
- name
testTables (junction table for many to many tests and tables)
views 
- viewID
- name

testViews (junction table for tests and views)
- testID
- viewID

testRuns (log table)
- runID
- testID
- runDate
- duration 

testRunTables 
- testRunTableID
- testRunID
- tableID
- insertDuration
- rowsToInsert
testRunViews
- testRunViewID
- testRunID
- viewID
- Query duration



