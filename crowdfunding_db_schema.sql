-------------------------------=-------------------------
-- Database: crowdfunding_db 

-- This is a database for crowdfunding campaigns
-- This sql will drop the tables if they exist,
-- create the tables, and query each empty table to 
-- verify that they were created with the proper fields
---------------------------------------------------------

--  The table drops must be done in this order because of the foreign key constraints

DROP TABLE IF exists campaign;
DROP TABLE IF exists contacts;
DROP TABLE IF exists subcategory;
DROP TABLE IF exists category;

-------------------------------
--  The table creates must be done in the reverse order as the drops, because of foreign key constraints

-- Defining a field as a foreign key automatically creates a constraint on the table.
-- The foreign key constraint ensures referential integrity; it ensures that the values in the foreign
-- key column match the values in the referenced primary key column of the referenced table
-------------------------------

CREATE TABLE category (
    category_id varchar(20)  NOT NULL PRIMARY KEY,
    category varchar(255)  NOT NULL
);

CREATE TABLE subcategory (
    subcategory_id varchar(20)  NOT NULL PRIMARY KEY,
    subcategory varchar(255)  NOT NULL  
);

CREATE TABLE contacts (
    contact_id varchar(10) NOT NULL PRIMARY KEY,
    first_name varchar(255)  NOT NULL,
    last_name varchar(255)  NOT NULL,
    email varchar (255)  NOT NULL
);

CREATE TABLE campaign (
    cf_id int NOT NULL PRIMARY KEY,
    contact_id varchar(10) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    company_name varchar(255)  NOT NULL,
    description varchar(400)  NOT NULL,
    goal decimal(12,2)  NOT NULL,
    pledged decimal(12,2)  NOT NULL,
    outcome varchar(20)  NOT NULL,
    backers_count int NOT NULL,
    country varchar(10) NOT NULL,
    currency varchar(10) NOT NULL,
    launched_date date NOT NULL,
    end_date date NOT NULL,
    category_id varchar(30) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    subcategory_id varchar(30) NOT NULL,
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-------------------------------
--  Check if the empty tables were created correctly
-------------------------------

select * from category;

select * from subcategory;

select * from contacts;

select * from campaign;



