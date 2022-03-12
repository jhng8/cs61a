CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name, b.size 
  from dogs as a, sizes as b 
  where a.height > b.min and a.height <= b.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT b.name 
  from parents as a, dogs as b, dogs as c 
  where b.name = a.child and c.name = a.parent 
  order by c.height desc;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT b.child as name, b.parent as parent, c.size as size
  from dogs as a, parents as b, size_of_dogs as c 
  where a.name = b.child and a.name = c.name 
  order by c.size asc;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 'The two siblings, '||a.name||' plus '||b.name||' have the same size: '||a.size 
  from siblings as a, siblings as b
  where a.size = b.size and a.name < b.name and a.parent = b.parent;

-- Ways to stack 4 dogs to a height of at least 175, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height, n);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper(dogs, stack_height, last_height, n) 
  SELECT d1.name||', '||d2.name||', '||d3.name||', '||d4.name, d1.height + d2.height + d3.height + d4.height, 31, 4
  from dogs as d1, dogs as d2, dogs as d3, dogs as d4
  where d1.height < d2.height and d2.height < d3.height and d3.height < d4.height;

CREATE TABLE stacks AS
  select dogs, stack_height
  from stacks_helper
  where stack_height > 175
  order by stack_height;

-- Total size for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


-- Heights and names of dogs that are above average in height among
-- dogs whose height has the same first digit.
CREATE TABLE above_average AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


-- non_parents is an optional, but recommended question
-- All non-parent relations ordered by height difference
CREATE TABLE non_parents as
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

