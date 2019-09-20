DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

PRAGMA foreign_keys = ON;




CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(225) NOT NULL,
  lname VARCHAR(225) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(225) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  quest_id INTEGER NOT NULL,
  parent_reply INTEGER,
  body TEXT NOT NULL,
  her_id INTEGER NOT NULL,

  FOREIGN KEY (parent_reply) REFERENCES replies(id),
  FOREIGN KEY (her_id) REFERENCES users(id),
  FOREIGN KEY (quest_id) REFERENCES questions(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  quest_id INTEGER NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(quest_id) REFERENCES questions(id)
);

INSERT INTO 
  users(fname,lname)
VALUES
  ('Claudius','Solomon'),
  ('Wolf','Bueno'),
  ('Randy', 'Moss'),
  ('Birdie','Cutie'),
  ('Bartholemew','Johnson');

INSERT INTO 
  questions (title, body, user_id)
VALUES
  ('Adition', 'What is 2 + 2?', (SELECT id FROM users WHERE users.lname = 'Solomon')),
  ('Subtraction', 'What is 4 - 2?', (SELECT id FROM users WHERE users.lname = 'Bueno')),
  ('Multiplication', 'What is 2 * 2?', (SELECT id FROM users WHERE users.lname = 'Cutie')),
  ('Division', 'What is 4 / 2?', (SELECT id FROM users WHERE users.lname = 'Cutie')),
  ('Factorial', 'What is 5! ?', (SELECT id FROM users WHERE users.lname = 'Solomon'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (3, 2),
  (4, 1),
  (4, 4),
  (5, 3),
  (3, 4),
  (5, 1);

INSERT INTO
  replies (quest_id, parent_reply, body, her_id)
VALUES
  (1, NULL, 'Great question!', 1),
  (3, NUll, 'I dont know!', 2),
  (1, 1, 'Let me check.', 2),
  (5, NUll, '120',1),
  (5, 4, 'Are you sure?', 5),
  (1, 3, 'Zero', 2);

INSERT INTO 
  question_likes(user_id,quest_id)
VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (5,1),
  (2,2),
  (5,2),
  (1,5);
