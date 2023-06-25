------------------------------------------------------------------------------------------------
-- Querying the crowdfunding_db, per requirements of challenge, to see that all loaded correctlt.
-- An additional query was added after querying each table individually, to join all four tables
------------------------------------------------------------------------------------------------

-- First get the counts for each table

select count(category_id) from category;
select count(subcategory_id) from subcategory;
select count(contact_id) from contacts;
select count(cf_id) from campaign;

------------------------------------------
--	List the category_id and category for each item in the category table, ordered by category_id
------------------------------------------

SELECT category_id, category
FROM category
ORDER BY category_id;


------------------------------------------
--	List the subcategory_id and subcategory for each item in the sub_category table,
-- ordered by subcategory_id
------------------------------------------

SELECT subcategory_id, subcategory
FROM subcategory
ORDER BY subcategory_id;


------------------------------------------
--	List last name, first name, contact_id, and email for all of the contacts,
--  ordered by last_name, first_name, contact_id
------------------------------------------

SELECT last_name, first_name, contact_id, email
FROM contacts
ORDER BY last_name, first_name, contact_id;

------------------------------------------
--	List all of the fields in the campaign table, ordered by campaign id , contact id, and campaign name
------------------------------------------

SELECT  * from campaign
ORDER BY cf_id, contact_id, company_name;

-----------------------------------------
--	List the category, subcategory, company name, campaign id, contact first name, and contact last name
--  for all of the campaigns, ordered by category, subcategory, company name, contact last_name, contact first_name
------------------------------------------

SELECT  cat.category, scat.subcategory,  cf.company_name, cf.cf_id, cnts.last_name, cnts.first_name 
FROM campaign cf
inner join category cat on 
    cf.category_id = cat.category_id
inner join subcategory scat on 
    cf.subcategory_id = scat.subcategory_id
inner join contacts cnts on
    cf.contact_id = cnts.contact_id
ORDER BY cat.category, scat.subcategory, cf.company_name, cnts.last_name, cnts.first_name;
