.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students as a, students as b WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time;


CREATE TABLE sevens AS
  SELECT a.seven FROM students as a, numbers as b WHERE a.number = 7 AND b.'7' = 'True' AND a.time = b.time;


CREATE TABLE favpets AS
  SELECT pet, COUNT(pet) AS count FROM students GROUP BY pet ORDER BY count DESC LIMIT 10;


CREATE TABLE dog AS
  SELECT pet, COUNT(pet) AS count FROM students WHERE pet = 'dog';


CREATE TABLE bluedog_agg AS
  SELECT song, COUNT(song) AS count from bluedog_songs GROUP BY song ORDER BY count DESC;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, COUNT(seven) from students WHERE seven = '7' GROUP BY instructor;


CREATE TABLE smallest_int_having AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE smallest_int_count AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

