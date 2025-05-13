-- 1. Ranking customers by how much they spent (total rental amount)
SELECT 
    customer_id,
    SUM(amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS rank
FROM payment
GROUP BY customer_id
ORDER BY rank;



-- 2. cumulative revenue per film over time (based on rental date)
SELECT 
    f.film_id,
    f.title,
    r.rental_date,
    SUM(p.amount) OVER (
        PARTITION BY f.film_id 
        ORDER BY r.rental_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cum_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.film_id, r.rental_date;



-- 3. average rental rate for each film and compare with others (based on similar rates??)
SELECT 
    title, 
    rental_rate,
    AVG(rental_rate) OVER() as avg_rate,
    RANK() OVER(ORDER BY rental_rate ASC) as rank_by_rate
FROM film;



-- 4. Get top 3 films in each category by number of rentals
SELECT 
    category,
    title,
    rental_count,
    rank
FROM (
    SELECT 
        c.name AS category,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        RANK() OVER (
            PARTITION BY c.name
            ORDER BY COUNT(r.rental_id) DESC
        ) AS rank
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.name, f.title
) AS ranked_films
WHERE rank <= 3;
