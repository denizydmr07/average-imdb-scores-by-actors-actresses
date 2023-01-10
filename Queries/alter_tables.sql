-- Deleting knownForTitles column to reduce the size of the table
ALTER TABLE name_basics
DROP COLUMN knownForTitles;

-- Deleting people from name-basics who have very little data about them (11,631,363 rows)
DELETE FROM name_basics
WHERE birthYear IS NULL;

-- Deleting people who is not an actor or an actress (226,814 rows)
DELETE FROM name_basics
WHERE NOT (primaryProfession LIKE '%actor%' OR primaryProfession LIKE '%actress%');

-- After filtering table, we just need the nconst and primaryName columns
ALTER TABLE name_basics
DROP COLUMN birthYear;

ALTER TABLE name_basics
DROP COLUMN deathYear;

ALTER TABLE name_basics
DROP COLUMN primaryProfession;

-- Deleting the isAdult column to reduce the size of the table
ALTER TABLE title_basics
DROP COLUMN isAdult;

-- Deleting the startYear column to reduce the size of the table
ALTER TABLE title_basics
DROP COLUMN startYear;

-- Deleting the endYear column to reduce the size of the table
ALTER TABLE title_basics
DROP COLUMN endYear;

-- Deleting the runtimeMinutes column to reduce the size of the table
ALTER TABLE title_basics
DROP COLUMN runtimeMinutes;

-- Deleting the genres column to reduce the size of the table
ALTER TABLE title_basics
DROP COLUMN genres;

-- Deleting from title_principals table where characters is null, which indicates that actor or actress have no role
-- in the movie or person is not even an actor or an actress (27,668,316 rows)
DELETE FROM title_principals
WHERE characters IS NULL;

-- Deleting from title_principals table where category is self (9,345,396 rows)
DELETE FROM title_principals
WHERE category LIKE '%self%';

-- Deleting the job column to reduce the size of the table
ALTER TABLE title_principals
DROP COLUMN job;

-- Deleting the ordering column to reduce the size of the table
ALTER TABLE title_principals
DROP COLUMN ordering;

-- Deleting the numVotes column to reduce the size of the table
ALTER TABLE title_ratings
DROP COLUMN numVotes;

-- I decided to remove everything which is not a movie (1,054,936 rows)
DELETE FROM title_basics
WHERE NOT (titleType = 'movie');

-- We have only one titleType now, so we can delete it
ALTER TABLE title_basics
DROP COLUMN titleType;

-- Deleting the originalTitle column to reduce the size of the table
ALTER TABLE title_basics
DROP COLUMN originalTitle;

-- Deleting the characters and category columns from title-principals table since we do not need them anymore
ALTER TABLE title_principals
DROP COLUMN characters;

ALTER TABLE title_principals
DROP COLUMN category;

-- Creating avg_imdb table with 112.332 actors and actresses

CREATE TABLE IF NOT EXISTS general_table AS (
    SELECT title_basics.primaryTitle AS 'title', title_ratings.averageRating  AS 'Avg_Rating', title_principals.nconst AS 'nconst' FROM title_basics
    JOIN title_principals ON title_principals.tconst = title_basics.tconst
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
);

CREATE TABLE IF NOT EXISTS avg_imdb AS (
    SELECT nb.primaryName, ROUND(AVG(Avg_Rating), 3) AS 'averageRating' FROM general_table gt
    JOIN name_basics nb on gt.nconst = nb.nconst
    GROUP BY nb.primaryName
);