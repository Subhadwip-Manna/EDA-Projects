use sakila;

-- Task 1
select concat(first_name," ",last_name) as "Name of actors" from actor;

-- Task 2
-- Task 2.i
select first_name, count(first_name) as "Repeated_times"  from actor
	   group by first_name order by Repeated_times desc;

-- Task 2.ii
select count(*) as "number of unique first name" from actor
       where  first_name in (select first_name from actor 
       group by first_name having count(first_name)= 1);
       
select distinct( first_name)from actor;

-- Task 3
-- Task 3.i
select last_name, count(last_name) as "Repeated_times"  from actor
       group by last_name order by Repeated_times desc;

-- Task 3.ii
select last_name, count(last_name) as "Repeated_times"  from actor
	group by last_name having Repeated_times=1;

-- Task 4
-- Task 4.i
select * from film where rating="R";

-- Task 4.ii
select * from film where rating <> "R";

-- Task 4.iii
select * from film where rating in ("PG-13","G");

-- Task 5
-- task 5.i
select * from film where replacement_cost <=11;

-- Task 5.ii
select * from film where replacement_cost between 11 and 20;

-- task 5.iii
select * from film order by replacement_cost desc;

-- Task 6
select a.title ,count(actor_id) as "Number_of_Actors" from film a
join film_actor b
on a.film_id=b.film_id 
group by a.film_id order by Number_of_Actors desc limit 3 ; 

-- Task 7
select * from film where title like "K%" or title like "Q%";

-- Task 8
select c.actor_id,concat(first_name," ",last_name) as "Actor's full name" ,a.title from film a
join film_actor b
join actor c
on a.film_id=b.film_id and b.actor_id=c.actor_id
where a.title like "Agent Truman";

-- Task 9
select * from film_category;
select * from category;
select a.title,c.name from film a
join film_category b
join category c
on a.film_id=b.film_id and b.category_id=c.category_id
where c.name like "Family";

-- task 10
-- task 10.i
select rating, max(rental_rate) as "Maximum rental rate",
min(rental_rate)as "Minimum rental rate",
avg(rental_rate) as "Average_rental_rate" 
from film group by rating
order by Average_rental_rate desc;

-- task 10.ii
select a.title,count(rental_id) as "Rental frequencies" from film a
join inventory b
join rental c
on a.film_id=b.film_id and b.inventory_id=c.inventory_id
group by a.title order by count(rental_id) desc ;

-- Task 11
select count(name) as "number of categories" from category where name in 
(select a.name
from category a
join film_category b
join film c
on a.category_id=b.category_id and b.film_id=c.film_id
group by a.name
having (avg(replacement_cost)-avg(rental_rate)) >15);


select a.name,avg(replacement_cost) as "avg replacement cost",avg(rental_rate) as "avg rental rate",
(avg(replacement_cost)-avg(rental_rate)) as "diff_bw_avg_replacement_and_avg_rental_rate" 
from category a
join film_category b
join film c
on a.category_id=b.category_id and b.film_id=c.film_id
group by a.name
having diff_bw_avg_replacement_and_avg_rental_rate >15;

-- task 12

select a.name,count(title) as "Number of Movies" from category a
join film_category b
join film c
on a.category_id=b.category_id and b.film_id=c.film_id
group by a.name
having count(title) >70;







