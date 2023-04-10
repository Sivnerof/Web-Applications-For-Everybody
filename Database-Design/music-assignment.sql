CREATE DATABASE Music DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE Artist (
  artist_id INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY(artist_id)
) ENGINE = InnoDB;

CREATE TABLE Album (
  album_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  artist_id INTEGER,

  PRIMARY KEY(album_id),
  INDEX USING BTREE (title),

  CONSTRAINT FOREIGN KEY (artist_id)
    REFERENCES Artist (artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Genre (
  genre_id INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY(genre_id)
) ENGINE = InnoDB;

CREATE TABLE Track (
  track_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  len INTEGER,
  rating INTEGER,
  `count` INTEGER,
  album_id INTEGER,
  genre_id INTEGER,

  PRIMARY KEY(track_id),
  INDEX USING BTREE (title),

  CONSTRAINT FOREIGN KEY (album_id) REFERENCES Album (album_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (genre_id) REFERENCES Genre (genre_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO Artist (`name`) VALUES ('The Beatles');
INSERT INTO Artist (`name`) VALUES ('The Rolling Stones');
INSERT INTO Artist (`name`) VALUES ('Joy Division');

INSERT INTO Genre (`name`) VALUES ('Rock');
INSERT INTO Genre (`name`) VALUES ('Metal');

INSERT INTO Album (title, artist_id) VALUES ("Sgt. Pepper's Lonely Hearts Club Band", 1);
INSERT INTO Album (title, artist_id) VALUES ('Yellow Submarine', 1);
INSERT INTO Album (title, artist_id) VALUES ('Abbey Road', 1);
INSERT INTO Album (title, artist_id) VALUES ('Sticky Fingers', 2);
INSERT INTO Album (title, artist_id) VALUES ('Unknown Pleasures', 3);

INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Lucy in the Sky with Diamonds', 4, 120, 0, 1, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Getting Better', 4, 145, 0, 1, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Yellow Submarine', 5, 143, 0, 2, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('All Together Now', 2, 126, 0, 2, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('All You Need Is Love', 3, 208, 0, 2, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Come Together', 5, 251, 0, 3, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Something', 1, 181, 0, 3, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ("Octopus's Garden", 3, 150, 0, 3, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Here Comes The Sun', 4, 183, 0, 3, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Her Majesty', 1, 23, 0, 3, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Brown Sugar', 5, 208, 0, 4, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ("Can't You Hear Me Knocking", 5, 428, 0, 4, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Wild Horses', 3, 325, 0, 4, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Sister Morphine', 2, 318, 0, 4, 1);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Shadowplay', 5, 212, 0, 5, 2);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Disorder', 3, 201, 0, 5, 2);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Day Of The Lords', 4, 268, 0, 5, 2);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('New Dawn Fades', 5, 268, 0, 5, 2);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('Wilderness', 2, 142, 0, 5, 2);
INSERT INTO Track (title, rating, len, `count`, album_id, genre_id)
    VALUES ('I Rememeber Nothing', 1, 331, 0, 5, 2);

SELECT
  Track.title,
  Artist.name,
  Album.title,
  Genre.name
FROM
  Track
  JOIN Genre
  JOIN Album
  JOIN Artist on Track.genre_id = Genre.genre_id
  AND Track.album_id = Album.album_id
  AND Album.artist_id = Artist.artist_id
ORDER BY
  Album.title ASC
;

SELECT DISTINCT
  Artist.name, Genre.name
FROM
  Track
  JOIN Genre
  JOIN Artist ON Track.album_id = Artist.artist_id
  AND Track.genre_id = Genre.genre_id
  WHERE Artist.name = 'Joy Division'
;