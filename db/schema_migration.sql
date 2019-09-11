-- Write your sql commands to create your db schema here.
-- It should create a table in a new table in the db/ directory.

CREATE TABLE pokemon (
  id INTEGER PRIMARY KEY,         --In other words, this is an autoincrementing id column
  name TEXT,
  type TEXT
);
