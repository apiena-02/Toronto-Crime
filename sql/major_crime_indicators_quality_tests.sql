/*
Data Quality Verification - major_crime_indicators

1. Row Count Test — Verify that the dataset contains 420,000 records to match the source CSV file. (Passed)
2. Column Count Test — Verify that the dataset contains 7 columns. (Passed)
3. Data Type Check — Ensure that ID, REPORT_YEAR, REPORT_DAY, and REPORT_HOUR are numeric types; all other fields are string types. (Passed)
4. Missing Values Test — Check for NULL or blank ("") values in all fields. (Passed)

Expected Data Types:
ID               = INTEGER
REPORT_YEAR      = INTEGER
REPORT_MONTH     = VARCHAR
REPORT_DAY       = INTEGER
REPORT_DOW       = VARCHAR
REPORT_HOUR      = INTEGER
PREMISES_TYPE    = VARCHAR
*/

-- 1. Row Count Test
SELECT COUNT(*) AS no_of_rows
FROM major_crime_indicators;

-- 2. Column Count Test
SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'major_crime_indicators';

-- 3. Data Type Check
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'major_crime_indicators';

-- 4. Missing Values Test
SELECT *
FROM major_crime_indicators
WHERE id IS NULL
   OR report_year IS NULL
   OR report_month IS NULL OR report_month = ''
   OR report_day IS NULL
   OR report_dow IS NULL OR report_dow = ''
   OR report_hour IS NULL
   OR premises_type IS NULL OR premises_type = '';
