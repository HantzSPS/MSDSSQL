-- Assignment – SQL One to Many Relationships
/*
In this assignment, we’ll practice working with one-to-many relationships in SQL. Suppose you are tasked with keeping
track of a database that contain the best “how-to” videos on MySQL.
*/

-- You may want to first create a new database (schema) for this assignment.
/*
1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
other publicly available resources.
*/
create table videos
(ID int primary key,
 title varchar(50),
 length int,
 url varchar(200)
 );
 
 insert into videos(ID, title, length, url) 
 values (1, 'sql basics', 10, 'http://sqlbasics.com');
 
 insert into videos(ID, title, length, url)
 values (2, 'SQL for beginners', 20, 'https://sqlforbeginners.com');
 
 insert into videos(ID, title, length, url)
 values(3,'Learn sql in 1 hour', 59, 'https://sqlonehour.com');
 
 select * from videos;

/*
2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
at least two of the videos. These should be imaginary reviews that include columns for the user’s name
(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
(“Loved it!”). There should be a column that links back to the ID column in the table of videos.
*/

create table reviewers
(
review_id int primary key,
user varchar(50),
rating int,
review varchar(20),
videos_id int null references videos);

 insert into reviewers(review_id, user, rating, review, videos_id)
 values (1, 'jb', 2, 'don''t really like it', 1);
 
 insert into reviewers(review_id, user, rating, review, videos_id)
 values (2, 'jb', 3, 'like it', 1);
 
 insert into reviewers(review_id, user, rating, review, videos_id)
 values (3, 'jb', 4, 'love it', 2);
 
 insert into reviewers(review_id, user, rating, review, videos_id)
 values (4, 'jb', 1, 'could be better', 2);


select * from reviewers;

-- 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.

select v.title, r.rating from videos v
join reviewers r on v.ID = r.videos_id
where rating >=2; 