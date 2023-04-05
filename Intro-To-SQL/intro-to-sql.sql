CREATE TABLE Ages (
  `name` VARCHAR(128),
  age INTEGER
);

DELETE FROM Ages;
INSERT INTO Ages (`name`, age) VALUES ('Nickhill', 38);
INSERT INTO Ages (`name`, age) VALUES ('Elysse', 20);
INSERT INTO Ages (`name`, age) VALUES ('Parisa', 23);
INSERT INTO Ages (`name`, age) VALUES ('Salymat', 34);
INSERT INTO Ages (`name`, age) VALUES ('Shanyse', 27);

SELECT sha1(CONCAT(`name`,age)) AS X FROM Ages ORDER BY X;
