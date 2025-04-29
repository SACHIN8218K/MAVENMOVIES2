use mavenmovies;
-- 1. identify the primary keys and foreign key in mavenmovies db.discuss the difference.
-- a data point which can refer uniquely to the entry in the table is known as primary key  and foreign key is a primary key of an another table which is used as a 
-- reference in the 1st table--

SELECT * FROM information_schema.key_column_usage;
 -- 2. list of details of actors--
 select * from actor;

-- 3. list of all customers information from db--
select * from customer;

-- 4. list different countries --
select * from country;

-- 5. display all active customers--
select * from customer where active = 1;

-- 6. list of all rental ids for cutomers with id 1--
select rental_id ,inventory_id from rental where customer_id =1;

-- 7. display all the films whose rental duration is greater than 5--
select * from film;
select * from film where rental_duration >(5);
select title , RENTAL_DURATION from film where rental_duration > (5);

-- 8.LIST THE TOTAL NUMBER OF FILMS WHOSE REPLCEMENT_COST IS GREATOR THAN 15 AND LESS THAN 20--
SELECT * FROM FILM WHERE REPLACEMENT_COST  between 15 and 20 ; 

-- 9. display the count of unique  first names of actors--
select count(distinctfirst_names)from actor;

-- 10. display the first 10 records from customer table --
select * from customer limit 10;

-- 11. display the first 3 records from the customer table whose first names start with b--
select * from customer where first_name like ('b%') limit 3;

-- 12. display the names of the first 5 movies which are related as"g'--
select * from film where rating = 5 limit 5 ;

-- 13. find all customers whose first names starts with a--
select first_name,last_name from customer where first_name like ('a%') ;

-- 14. find all customer whose first names end with a --
select first_name,last_name from customer where first_name like ('%a');

-- 15. display the list of first 4 cities which start and end with a--
select * from city where city like ('a%a') limit 4 ;
use mavenmovies;
-- 16 . find  all customer whose firstname have ni any position--
 select first_name ,last_name from customer where first_name like ('%ni%');
 
 -- 17. find all customers whose first name have r in the second position--
 select first_name ,last_name from cutomer where first_name like ('_r');

-- 18. find all customer whose first name starts with a and are at least 5 characters in length. 
select first_name,last_name from customer where first_name like ('a___%');

-- 19. find all customers whose first name starts with a end with o--
select first_name,last_name from customer where first_name like ('a%o');

-- 20. get the film with pg and pg-13 rating in operator--
select title from film where rating in ('PG ,PG13');
select * from film;

-- 21. get the films with length between 50 to 200 using between operator--
select title from film where length between 50 and 100 ;

-- 22. get the top 50 actor using limit operator--
select * FROM ACTOR limit 50;

-- 23. get the distinct film ids from inventory table--
select DISTINCT (FILM_ID) FROM INVENTORY;

