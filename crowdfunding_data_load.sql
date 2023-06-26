
-- Data import script for the crowdfunding-db


-- Use dynamic sql to set up the variable names for the files to load.
-- The path should be set to the proper one for the user's environment.
-- The dynamic sql method is a combination of different Stack Overflow
-- answers and various responses from ChatGpt.  

-- First empty data if there is any so it can be reloaded.  The order of deleting the data is 
-- critical, becauase of foreign key constraints in the campaigns and contacts tables.

delete from campaign;
delete from contacts;
delete from subcategory;
delete from category;

DO $$
DECLARE
   path_name text := 'C:/CWRU_Bootcamp/Git/crowdfunding_ETL/Resources/';

   categories_file text := CONCAT (path_name, 'category.csv');
   subcategories_file text := CONCAT (path_name, 'subcategory.csv');
   contacts_file text := CONCAT (path_name, 'contacts.csv');
   campaigns_file text := CONCAT (path_name, 'campaign.csv');

   sql_statement text;

BEGIN

-- The loads of categories and subcategoris have to be first because of foreign key constraints.
-- The order of loading between those two files does not matter, but they have to be before contacts. 
-- Because of multiples foreign keys in campaigns, The load of contacts has to come before campaigns.
	 
   -- Construct the SQL statement  for categories and execute the dynamic SQL
   sql_statement := 'COPY category FROM ''' || categories_file || ''' DELIMITER '','' CSV HEADER';
   EXECUTE sql_statement;
   
   -- Construct the SQL statement for subcategories and execute the dynamic SQL
   sql_statement := 'COPY subcategory FROM ''' || subcategories_file || ''' DELIMITER '','' CSV HEADER';
   EXECUTE sql_statement;

   -- Construct the SQL statement for contacts and execute the dynamic SQL
   sql_statement := 'COPY contacts FROM ''' || contacts_file || ''' DELIMITER '','' CSV HEADER';
   EXECUTE sql_statement;

-- Construct the SQL statement for the campaigns and execute the dynamic SQL
   sql_statement := 'COPY campaign FROM ''' || campaigns_file || ''' DELIMITER '','' CSV HEADER';
   EXECUTE sql_statement;


END $$;




