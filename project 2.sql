use mavenmovies;                                  
-- 1. retrieve the total number of rentals made in the sakila database--
select * from rental;
select count(rental_id) FROM PAYMENT;

-- 2. find the average rentAL DURATION in days of movies rented from the sakila database--
select avg(rental_duration) from film;

-- 3. display the firstname and last name of customers in uppercase--
select upper(first_name),upper(last_name) from customer;

-- 4. extract the month from the rental date and display it alongside the rental id--
select month(rental_date) ,rental_id ,rental_date from rental;

-- 5. retrieve the count of rentals for each customer-
select rental_id,count(rental_id) from payment group by rental_id;

-- 6. find the total revenue generated from each store--
select * from payment;
select staff_id, amount,sum(amount), staff_id from payment group by amount;

-- 7. display the title of the movie, customer's first name and last name who rented it--
SELECT 
    film.title AS movie_title,
    customer.first_name,
    customer.last_name
FROM
    rental
        JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
        JOIN
    film ON inventory.film_id = film.film_id
        JOIN
    customer ON rental.customer_id = customer.customer_id; 
    
    -- 8 . retrieve the names of all actors who have appeared in the film " GONE WITH THE WIND"--
SELECT 
    *
FROM
    FILM
        INNER JOIN
    FILM_ACTOR ON FILM.FILM_ID = FILM_ACTOR.FILM_ID
        INNER JOIN
    ACTOR ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
WHERE
    TITLE = 'GONE WITH THE WILD';

SELECT 
    actor.first_name,
    actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'GONE WITH THE WIND';


-- 9 . determine the total number of rentals for each category of movies --
SELECT 
     *
FROM
    category
        JOIN
    film_category ON category.category_id = film_category.category_id
        JOIN
    film ON film_category.film_id = film.film_id
        JOIN
    inventory ON film.film_id = inventory.film_id
        JOIN
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY category
ORDER BY total_rentals;

SELECT 
    c.name AS category,
    COUNT(r.rental_id) AS total_rentals
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    c.name
ORDER BY 
    total_rentals DESC;
    
    
    -- 10 -- find the average rental rate of movies  in each language--
    select name as language ,aVG(RENTAL_RATE) FROM FILM INNER JOIN language on film.language_id=language.language_id group by name;
    
    -- 11 --retrieve the customer names along with the total amount they have spent on rentals--
    
select first_name,last_name,sum(amount)  from customer join payment on customer.customer_id=payment.customer_id join rental 
on rental.customer_id=customer.customer_id group by first_name,last_name;

-- 12- use the titles of movies rented by each customer in  a particular city(london)--
SELECT 
    c.first_name, c.last_name, ci.city, f.title
FROM
    customer c
        JOIN
    address a ON c.address_id = a.address_id
        JOIN
    city ci ON a.city_id = ci.city_id
        JOIN
    rental r ON c.customer_id = r.customer_id
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film f ON i.film_id = f.film_id
WHERE
    ci.city = 'london'
ORDER BY c.last_name , c.first_name , f.title;
