# average-imdb-scores-by-actors-actresses

* I created a table with 112.332 actors/actresses and average [IMDB](https://www.imdb.com/) ratings of movies they had a role in it by using some of the [datasets](https://datasets.imdbws.com/) that [IMDB](https://www.imdb.com/) shares.

* I used:
  1. name.basics.tsv.gz
  2. title.basics.tsv.gz
  3. title.principals.tsv.gz
  4. title.ratings.tsv.gz

* Here are the filters I applied:
  - From name.basics,
  
    1. I deleted all the rows which 'primaryProfession' column does NOT include keywords actor or actress (primary professions soundtrack, writer, composer, producer, director etc. are excluded for the table).
    2. I deleted all the people whose birthYear is null, which indicates that there is no sufficent data about them.
  - From title.principals,
  
    1. I deleted all the rows which 'characters' column is NULL, which indicates that person is not had a acting role in the title (writers, directors, composers etc.)
    2. I deleted all the rows which 'category' column is [self](https://help.imdb.com/article/contribution/filmography-credits/why-do-some-acting-credits-show-up-in-a-separate-list-under-a-category-called-self-even-if-those-people-didn-t-actually-appear-as-themselves/G5H28P735WRDPSKN?ref_=helpart_nav_53#).
  - From title.basics
  
    1. I deleted all the rows which ['titleType'](https://developer.imdb.com/documentation/bulk-data-documentation/data-dictionary/titles#titletype) column is NOT 'movie', namely, I excluded all the titleTypes titshort, tvSeries, tvShort, tvMovie, tvEpisode, tvMiniSeries, tvSpecial, video, videoGame, and tvPilot.

* Note: I did not take into consideration column 'numVotes' from title.ratings. This situation resulted in unexpected standard deviation of ratings, e.g. title [Romeo + Julia](https://www.imdb.com/title/tt4130224/?ref_=nm_ov_bio_lk) has IMDB point 10 with just 14 votes! Therefore, actress [Barbara Kratz](https://www.imdb.com/name/nm6853501/) has an average IMDB rating 10 since only title she had a role in is [Romeo + Julia](https://www.imdb.com/title/tt4130224/?ref_=nm_ov_bio_lk) in IMDB datasets.

  
