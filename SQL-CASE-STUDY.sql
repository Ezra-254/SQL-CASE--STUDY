select * from artist -- Artist table. Provides information about different artists 
select * from canvas_size --Provides information about canva being used 
select * from image_link --Provides URL for all paintings
select * from museum -- provides name of the museum and country locate
select * from museum_hours -- Days when museums are open and the time they open and close
select * from subject --What the painting is about
select * from work --Has information of paintig, which museum the painting is displayed etc

--Problem to Solve
--1.Identify the museums which are open on both Sunday and monday. Display museum id, city. 
-- We find the information to solve this query on museum_hours table and museum table


SELECT m.name, m.city
FROM museum_hours mh
JOIN museum m ON mh.museum_id = m.museum_id
WHERE mh.day IN ('Sunday', 'Monday')
GROUP BY m.name, m.city
HAVING COUNT(DISTINCT mh.day) = 2;--having count ensures that the museum is open on both days

select name, city
from museum_hours
join museum on museum.museum_id =museum_hours.museum_id 
where day = 'Sunday'
and exists (select name ,city
            from museum_hours
             where museum.museum_id =museum_hours.museum_id 
             and museum_hours.day = 'Monday')

-- 2. Which museum is open for the longest during a day. Display museum name, state and hours open and which day.
-- You can the information to solve above problem from museum_hours table.
-- You realise time is text data type so we can minus direct. We need to convert data first
-- We use to_timestamp
select name, day,state,
    to_timestamp(open, 'HH:MI AM') AS open_time,
    to_timestamp(close, 'HH:MI PM') AS close_time,
    (to_timestamp(close, 'HH:MI PM') - to_timestamp(open, 'HH:MI AM')) AS duration
FROM museum_hours
join museum on museum.museum_id =museum_hours.museum_id
ORDER BY duration desc
limit 1 ;

--3.Display the country and the city with most number of museums. 
--Output 2 separate columns to mention city and country. 
--If there are multiple value, separate them with comma

--We solve them one by one. We start first with the country then state
--The table with required information to solve this is museum table

SELECT country, STRING_AGG(city, ', ') AS cities, COUNT(museum_id) AS museum_count
FROM museum
GROUP BY country
ORDER BY museum_count desc
limit 1;

--Which are the 3 most popular and 3 least popular painting style
--Information to solve this problem is in artist table
select style, count ( style) as style_count
from artist 
group by style
order by style_count desc
limit 3;--3 most popular paints

--3 least popular paints
select style, count (style) style_rank
from artist
group by style
order by style_rank asc
limit 3;
--alternatively you can use cte
WITH ranked_styles AS (
    SELECT style, 
           COUNT(*) AS style_count,
           RANK() OVER (ORDER BY COUNT(*) ASC) AS rank_asc -- Rank for least popular styles
    FROM artist
    GROUP BY style
)
SELECT style, style_count
FROM ranked_styles
WHERE rank_asc <= 3
ORDER BY rank_asc;

--Fetch all painting that are not displayed in museum
--The information to  solve this problem is work table
select name, museum_id
from work
where museum_id is null;







