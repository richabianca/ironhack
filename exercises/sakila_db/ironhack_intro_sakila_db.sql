# 1. Review the tables in the database.
select * from sakila.actor;
select * from sakila.address;
select * from sakila.category;
select * from sakila.city;
select * from sakila.country;
select * from sakila.customer;
select * from sakila.film;
select * from sakila.film_actor;
select * from sakila.film_category;
select * from sakila.film_text;
select * from sakila.inventory;
select * from sakila.language;
select * from sakila.payment;
select * from sakila.rental;
select * from sakila.staff;
select * from sakila.store;

# 2. Explore tables by selecting all columns from each table or using the in built 
#review features for your client.

# 3. Select one column from a table. Get film titles.
select title from sakila.film;

# 4.Select one column from a table and alias it. Get unique list of film languages under the alias language. 
#Note that we are not asking you to obtain the language per each film, 
#but this is a good time to think about how you might get that information in the future.
SELECT distinct name from sakila.language;

# 5.1 Find out how many stores does the company have?
select count(store_id) from sakila.store; 

# 5.2 Find out how many employees staff does the company have?
select count(staff_id) from sakila.staff; 

# 5.3 Return a list of employee first names only?
select distinct(first_name) from sakila.staff;