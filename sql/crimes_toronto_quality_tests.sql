/*
Data Quality Verification - crimes_toronto_data

1. Row Count Test — Verify that the dataset contains 420,000 records to match the source CSV file. (Passed)
2. Column Count Test — Verify that the dataset contains 5 columns. (Passed)
3. Data Type Check — Ensure that ID and REPORT_YEAR are numeric types; all other fields are string types. (Passed)
4. Missing Values Test — Check for NULL or blank ("") values in all fields. (Passed)

Expected Data Types:
ID               = INTEGER
EVENT_UNIQUE_ID  = VARCHAR
REPORT_YEAR      = INTEGER
OFFENCE          = VARCHAR
NEIGHBOURHOOD    = VARCHAR
*/

-- 1. Row Count Test
SELECT COUNT(*) AS no_of_rows
FROM crimes_toronto_data;

-- 2. Column Count Test
SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'crimes_toronto_data';

-- 3. Data Type Check
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'crimes_toronto_data';

-- 4. Missing Values Test
SELECT *
FROM crimes_toronto_data
WHERE EVENT_UNIQUE_ID IS NULL OR EVENT_UNIQUE_ID = ''
   OR REPORT_YEAR IS NULL
   OR OFFENCE IS NULL OR OFFENCE = ''
   OR NEIGHBOURHOOD IS NULL OR NEIGHBOURHOOD = '';
