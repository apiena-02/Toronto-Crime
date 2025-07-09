/*
Data Quality Tests

1. The data needs to be 420,000 records to match the CSV file (row count test) --- (passed)
2. The data needs 5 fields (column count test) --- (passed)
3. The ID and year must be numerical data types, all others must be string format (data type check) --- (passed)
4. Check for Missing (Null/Blank) Values --- (passed)

Expected Data Types:
ID = INTEGER  
EVENT_UNIQUE_ID = VARCHAR  
REPORT_YEAR = INTEGER  
OFFENCE = VARCHAR  
NEIGHBOURHOOD = VARCHAR  
*/

USE crime_toronto;

-- Row Count Test: Check if number of rows matches original CSV 
SELECT COUNT(*) AS no_of_rows
FROM crimes_toronto_data;

-- Column Info: See all column names and their metadata
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'crimes_toronto_data';

-- Column Count Test: Confirm number of columns is correct
SELECT COUNT(*) AS column_count 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'crimes_toronto_data';

-- Data Type Check: Confirm each column is the correct type 
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'crimes_toronto_data';

-- Missing Values Test: Check for any NULL or blank ("") values in key fields
SELECT * FROM crimes_toronto_data
WHERE EVENT_UNIQUE_ID IS NULL OR EVENT_UNIQUE_ID = ''
   OR REPORT_YEAR IS NULL OR REPORT_YEAR = ''
   OR OFFENCE IS NULL OR OFFENCE = ''
   OR NEIGHBOURHOOD IS NULL OR NEIGHBOURHOOD = '';
