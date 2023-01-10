SET GLOBAL local_infile = 1;

LOAD DATA INFILE '/var/lib/mysql-files/name-basics.tsv'
INTO TABLE name_basics
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

LOAD DATA INFILE '/var/lib/mysql-files/title-principals.tsv'
INTO TABLE title_principals
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

LOAD DATA INFILE '/var/lib/mysql-files/title-ratings.tsv'
INTO TABLE title_ratings
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

LOAD DATA INFILE '/var/lib/mysql-files/title-basics.tsv'
INTO TABLE title_basics
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;








