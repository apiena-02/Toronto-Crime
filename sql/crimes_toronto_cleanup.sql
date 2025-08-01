USE crime_toronto;

-- Preview the first 10 rows
SELECT * FROM crimes_toronto_data LIMIT 0, 10;

-- Rename columns for clarity
ALTER TABLE crimes_toronto_data
RENAME COLUMN NEIGHBOURHOOD_158 TO NEIGHBOURHOOD,
RENAME COLUMN MCI_CATEGORY TO OFFENCE,
RENAME COLUMN _id to ID;

-- Show primary keys
SHOW KEYS FROM crimes_toronto_data WHERE Key_name = 'PRIMARY';

-- Set _id as the primary key
ALTER TABLE crimes_toronto_data
ADD PRIMARY KEY (ID);

-- Clean up the NEIGHBOURHOOD column (remove numbers in brackets)
UPDATE crimes_toronto_data
SET NEIGHBOURHOOD = TRIM(SUBSTRING_INDEX(NEIGHBOURHOOD, '(', 1))
WHERE NEIGHBOURHOOD LIKE '%(%' AND ID > 0;


 

