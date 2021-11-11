#1. Which actor has appeared in the most films?
select count(film_actor.actor_id) as film_count, actor.first_name, actor.last_name 
from actor join film_actor on actor.actor_id = film_actor.actor_id
group by film_actor.actor_id order by film_count desc limit 1;

#2. Most active customer (the customer that has rented the most number of films)
select customer_id, count(*) as total_rentals
from rental
group by customer_id
order by total_rentals desc limit 1;

#3. List number of films per category.
select name as category_name, count(*) as num_films
from sakila.category
inner join sakila.film_category
using (category_id)
group by name
order by num_films desc;

#4. Display the first and last names, as well as the address, of each staff member.
select staff.first_name, staff.last_name, address.address
from sakila.address
inner join sakila.staff
on staff.address_id = address.address_id;

#5. Display the total amount rung up by each staff member in August of 2005.
select s.staff_id, concat(s.first_name,' ',s.last_name) as employee, sum(p.amount) as `total amount`
from sakila.staff as s
inner join sakila.payment as p
on s.staff_id = p.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.staff_id;

#6. List each film and the number of actors who are listed for that film.
select title as `film title`, count(actor_id) as `number of actors`
from sakila.film
inner join sakila.film_actor
on film.film_id = film_actor.film_id
group by film.film_id;

#7. Using the tables payment and customer and the JOIN command, 
#list the total paid by each customer. 
#List the customers alphabetically by last name. 
#Bonus: Which is the most rented film? 
# The answer is Bucket Brotherhood. 
#This query might require using more than one join statement. Give it a try.
select first_name, last_name, sum(amount) as "total amount paid"
from sakila.customer
inner join sakila.payment
on customer.customer_id = payment.customer_id
group by customer.customer_id
order by last_name;

