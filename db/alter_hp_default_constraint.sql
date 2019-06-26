ALTER TABLE pokemon RENAME TO temp_pokemon;
 
CREATE TABLE pokemon
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
     name TEXT,
     type TEXT,
     hp INTEGER);

 
INSERT INTO pokemon
SELECT
 id, name, type, hp
FROM
 temp_pokemon;
 
DROP TABLE temp_pokemon;
