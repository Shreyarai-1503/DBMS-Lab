Consider the schema for Movie Database:
ACTOR (Act_id, Act_Name, Act_Gender)
DIRECTOR (Dir_id, Dir_Name, Dir_Phone)
MOVIES (Mov_id, Mov_Title, Mov_Year, Mov_Lang, Dir_id) 
MOVIE_CAST (Act_id, Mov_id, Role)
RATING (Mov_id, Rev_Stars) 

Write SQL queries to 

-- 1. List the titles of all movies directed by ‘Hitchcock’. 
SELECT Mov_Title FROM MOVIES WHERE Dir_id = (SELECT Dir_id FROM DIRECTOR WHERE Dir_Name = 'Hitchcock');

-- 2. Find the movie names where one or more actors acted in two or more movies. 
SELECT DISTINCT m.Mov_Title FROM MOVIES m
JOIN MOVIE_CAST mc ON m.Mov_id = mc.Mov_id
WHERE mc.Act_id IN (
    SELECT Act_id FROM MOVIE_CAST
    GROUP BY Act_id
    HAVING COUNT(DISTINCT Mov_id) >= 2
);

-- 3. List all actors who acted in a movie before 2000 and also in a movie after 2015 (use JOIN operation). 
SELECT DISTINCT a.Act_Name FROM ACTOR a
JOIN MOVIE_CAST mc1 ON a.Act_id = mc1.Act_id
JOIN MOVIES m1 ON mc1.Mov_id = m1.Mov_id
JOIN MOVIE_CAST mc2 ON a.Act_id = mc2.Act_id
JOIN MOVIES m2 ON mc2.Mov_id = m2.Mov_id
WHERE m1.Mov_Year < 2000 AND m2.Mov_Year > 2015;

-- 4. Find the title of movies and number of stars for each movie that has at least one rating. Sort the result by movie title.
SELECT Mov_Title, Rev_Stars FROM MOVIES m JOIN RATING r ON m.Mov_id = r.Mov_id ORDER BY Mov_Title;

-- 5. Update rating of all movies directed by ‘Steven Spielberg’ to 5.
UPDATE RATING SET Rev_Stars = 5 
WHERE Mov_id IN (
    SELECT Mov_id FROM MOVIES WHERE Dir_id = (SELECT Dir_id FROM DIRECTOR WHERE Dir_Name = 'Steven Spielberg')
);