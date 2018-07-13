-- Assignment: SQL Select and Aggregations
-- Please use the tables in the flights database. Your deliverable should include the SQL queries that you write in
-- support of your conclusions.

-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
-- Show the SQL query(s) that support your conclusion.
select * from flights;

select dest, distance from flights group by dest order by distance desc;

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats? Show the SQL statement(s) that support your result.
select * from planes;

select distinct engines from planes order by engines;

select distinct engines, tailnum, max(seats) from planes group by engines order by engines desc; 

-- 3. Show the total number of flights.
select * from flights;

select count(*)from flights;

-- 4. Show the total number of flights by airline (carrier).

select carrier, count(*) from flights group by carrier;

-- 5. Show all of the airlines, ordered by number of flights in descending order.
select carrier, count(*) as number from flights group by carrier order by number desc;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
select count(*) as numbers, carrier from flights group by carrier order by numbers desc limit 5;
-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order.
select * from flights;
select count(*) as numbers, distance, carrier from flights where distance >=1000 group by carrier order by numbers desc limit 5;
-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question.


-- Question Show the average distance made by a particular airplane
select avg(distance) , tailnum from flights group by tailnum;