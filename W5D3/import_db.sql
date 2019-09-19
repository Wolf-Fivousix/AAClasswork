DROP TABLE cattoys;
DROP TABLE cats; 
DROP TABLE toys;
 

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    breed VARCHAR(255) /*NO TRAILING COMMAS!!*/
); /*REMEMBER THE SEMICOLON!!*/


CREATE TABLE toys(
    id SERIAL PRIMARY KEY,
    price INTEGER,
    color VARCHAR(255),
    name VARCHAR(255)
);


CREATE TABLE cattoys(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,

    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO cats(
  name, color, breed
) 
VALUES 
  ('Billy', 'green', 'chihuahua'),
  ('Wolf', 'blue', 'husky'),
  ('Mona', 'pink', 'samoy'),
  ('Lisa', 'antique white', 'pit bull'),
  ('Fang', 'red', 'bones'
  );

INSERT INTO toys(
  name, color, price
) 
VALUES 
  ('ball', 'green', 2),
  ('stick', 'blue', 5),
  ('switch', 'pink', 350),
  ('hula hoop', 'antique white', 10),
  ('laser', 'red', 100
  );

INSERT INTO cattoys(
  cat_id, toy_id
) 
VALUES 
  (
  (SELECT id 
  FROM cats
  WHERE name = 'Billy'),
  (SELECT id 
  FROM toys
  WHERE name = 'ball'))
,
  (
  (SELECT id 
  FROM cats
  WHERE name = 'Wolf'),
  (SELECT id 
  FROM toys
  WHERE name = 'laser'))
,
  (
  (SELECT id 
  FROM cats
  WHERE name = 'Mona'),
  (SELECT id 
  FROM toys
  WHERE name = 'stick'))
,
  (
  (SELECT id 
  FROM cats
  WHERE name = 'Lisa'),
  (SELECT id 
  FROM toys
  WHERE name = 'hula hoop'))
,
  (
  (SELECT id 
  FROM cats
  WHERE name = 'Fang'),
  (SELECT id 
  FROM toys
  WHERE name = 'switch'))
;
  