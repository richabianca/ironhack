use sakila;

#1 How many copies of the film Hunchback Impossible exist in the inventory system?
select title, (select count(*) from inventory
where film.film_id = inventory.film_id) as 'count'
from film
where title = "Hunchback Impossible";

#2. List all films whose length is longer than the average of all the films.
select title, length from film
where length > (select avg(length) from film);

#3. Use subqueries to display all actors who appear in the film Alone Trip.
select concat(first_name,' ', last_name) as 'Name'
from actor
where actor_id in
(Select actor_id
from film_actor
where film_id in
(select film_id
from film
where title = 'Alone Trip'
));

#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films.
select title from film 
where film_id in
(select film_id from film_category
where category_id in
(select category_id from category
where name = "Family"
));

#5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select concat(c.first_name,' ',c.last_name) as 'Name', c.email as 'E-mail'
from customer as c
join address as a on c.address_id = a.address_id
join city as cy on a.city_id = cy.city_id
join country as ct on ct.country_id = cy.country_id
where ct.country = 'Canada';

#6. Which are films starred by the most prolific actor? 
#Most prolific actor is defined as the actor that has acted in the most number of films. 
#First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select count(film_actor.actor_id) as film_count, actor.first_name, actor.last_name 
from actor join film_actor on actor.actor_id = film_actor.actor_id
group by film_actor.actor_id order by film_count desc limit 1;

select title from film 
where film_id in
(select film_id from film_actor as fa
where actor_id in 
(select actor_id from actor
where concat (first_name,' ',last_name) = "Gina Degeneres"
));

#7. Films rented by most profitable customer. You can use the customer table and payment table 
#to find the most profitable customer ie the customer that has made the largest sum of payments
select customer_id, sum(amount) from payment group by customer_id order by sum(amount) desc;


#8. Customers who spent more than the average payments.
select customer_id, sum(amount) as payment
from sakila.customer
inner join payment using (customer_id)
group by customer_id
having sum(amount) > (
select avg(total_payment)
from (
select customer_id, sum(amount) total_payment
from payment
group by customer_id
) t
)
order by payment desc;