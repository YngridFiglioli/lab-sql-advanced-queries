#List each pair of actors that have worked together.
#For each film, list actor that has acted in more films.

use sakila;

select fa1.actor_id, fa2.actor_id, fa1.film_id
from sakila.film_actor fa1
join sakila.film_actor fa2
on fa1.actor_id < fa2.actor_id
and fa1.film_id = fa2.film_id;

with cte as (
select *,
row_number() over (partition by film_id order by total_films desc) as flag
from (
select film_id, actor_id, total_films
from (
select actor_id, count(film_id) as total_films 
from sakila.film_actor
group by actor_id
) sub1
join film_actor using(actor_id)
) sub2 
)
select film_id, actor_id, total_films from cte
where flag = 1;