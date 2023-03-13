#List each pair of actors that have worked together.
#For each film, list actor that has acted in more films.

use sakila;

SELECT CONCAT(a1.first_name, ' ', a1.last_name) AS actor1, 
       CONCAT(a2.first_name, ' ', a2.last_name) AS actor2,
       COUNT(*) AS num_worked_together
FROM actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film f1 ON fa1.film_id = f1.film_id
JOIN film_actor fa2 ON f1.film_id = fa2.film_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a1.actor_id < a2.actor_id
GROUP BY a1.actor_id, a2.actor_id
ORDER BY num_worked_together DESC;

SELECT count(film_actor.actor_id), actor.first_name, actor.last_name 
FROM actor INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY count(film_actor.actor_id) DESC;