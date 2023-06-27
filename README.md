# Crowdfunding_ETL

Group Project 2

This group project is to build an ETL pipeline to extract and transform data from Excel files.  It has two parts.  The first part uses Python, jupypter notebook, and Pandas DataFrames to load two Excel files, save the data as Pandas DataFrames, transform the data into four new DataFrames, and then save each of those as .csv files.   The second part involves creating an ERD, and a Postgres database schema for each of the four transformed files, loading the .csv files into the database, and running queries to confirm the load was sucessful.

The jupyter notebook, the four sql script files, and two ERD diagrams are stored in the main project repository, "Crowdfunding_ETL".

The input .xlsx files, and the .csv files saved from the Pandas dataframes, are both in a "Resources" subfolder within the project folder.  The jupyter notebook should be run from the main project folder where the jupyter notebook is stored, so the "Resources" subfolder will be properly located.   

While they are not explicitly imported in the notebook, to read the Excel files, either "xlrd" or "openpyxl" must be installed.   The "xlrd" package is an older package that works with Python 2 and Python 3 and with both .xls and .xlsx files.  The newer "openpyxl" works with Python 3 and handles newer forms of .xlsx files.   The jupyter notebook uses list comprehensions and regular expressions, among other things, to transform the data.

The two input Excel files are "oontacts.xlsx" and "crowdfunding.xlsx".

The four .csv files created are category.csv", "subcategory.csv", "contacts.csv",  and "campaign.csv".

One ERD diagram, styled for executives, was created using OBDC, open db.  The other ERD diagram, which is more detailed and intended more for database and software developers, was created using pgAdmin4. 

 The four sql files to create the database, create the database schema, load the csv files, and display the output, are in the main project folder.  The database can also be created manually using the pgAdmin4 GUI, and the database schema script run thereafter to create the tables.  The database creation sql file has caveats about the dangers of trying to drop an existing database, and needing to remove all connections to it first.  The output of the postgres database queries is in .png files for screenprints of the table counts, and .csv files for the output rows of each data query, in a subfolder called "database_output."   
 
 A postgres database server and the admin tool pgAdmin4 must be installed on the machine and running as localhost before the sql files can be executed.  The data load sql uses dynamic sql.  The path variable at the beginning of the script must be set to the appropriate location of the "Resources" subfolder before that script is run.  The data also can be loaded using the pgAdmin4 GUI.  During the development of this project, the GUI was used to create the database, but all of the loads were done using the script.
 
The sql files can be imported into pgAdmin4 and run in their entirety, or, to see the output of each individual query, separate queries can be highlighted and run indivdually, because pgAdmin4 only displays the last results from multiple queries.  The output from each of the queries in the "crowdfunding_data_display.sql" is also saved in the database_output subfolder.   A script also could be written to call the sql in a shell and to pipe the output to a file.  That was outside the scope of this project.  

