CREATE DATABASE roster;

DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Course;

CREATE TABLE `User` (
    user_id     INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(128) UNIQUE,
    PRIMARY KEY(user_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Course (
    course_id     INTEGER NOT NULL AUTO_INCREMENT,
    title         VARCHAR(128) UNIQUE,
    PRIMARY KEY(course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Member (
    user_id       INTEGER,
    course_id     INTEGER,
    role          INTEGER,

    CONSTRAINT FOREIGN KEY (user_id) REFERENCES `User` (user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
       ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (user_id, course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

/*
Ossian, si106, Instructor
Afton, si106, Learner
Ayooluwa, si106, Learner
Jay, si106, Learner
Kyra, si106, Learner
Lowena, si110, Instructor
Aaran, si110, Learner
Calley, si110, Learner
Courtny, si110, Learner
Rowan, si110, Learner
Mariella, si206, Instructor
Abrar, si206, Learner
Aili, si206, Learner
Ambreen, si206, Learner
Kynan, si206, Learner
*/

INSERT INTO `User` (name) VALUES ('Ossian');
INSERT INTO `User` (name) VALUES ('Afton');
INSERT INTO `User` (name) VALUES ('Ayooluwa');
INSERT INTO `User` (name) VALUES ('Jay');
INSERT INTO `User` (name) VALUES ('Kyra');
INSERT INTO `User` (name) VALUES ('Lowena');
INSERT INTO `User` (name) VALUES ('Aaran');
INSERT INTO `User` (name) VALUES ('Calley');
INSERT INTO `User` (name) VALUES ('Courtny');
INSERT INTO `User` (name) VALUES ('Rowan');
INSERT INTO `User` (name) VALUES ('Mariella');
INSERT INTO `User` (name) VALUES ('Abrar');
INSERT INTO `User` (name) VALUES ('Aili');
INSERT INTO `User` (name) VALUES ('Ambreen');
INSERT INTO `User` (name) VALUES ('Kynan');

INSERT INTO Course (title) VALUES ('si106');
INSERT INTO Course (title) VALUES ('si110');
INSERT INTO Course (title) VALUES ('si206');

INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Ossian'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si106'), 1);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Afton'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si106'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Ayooluwa'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si106'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Jay'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si106'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Kyra'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si106'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Lowena'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si110'), 1);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Aaran'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si110'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Calley'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si110'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Courtny'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si110'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Rowan'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si110'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Mariella'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si206'), 1);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Abrar'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si206'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Aili'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si206'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Ambreen'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si206'), 0);
INSERT INTO Member (user_id, course_id, role) VALUES ((SELECT User.user_id FROM User WHERE User.name = 'Kynan'), (SELECT Course.course_id FROM Course WHERE Course.title = 'si206'), 0);

SELECT `User`.name, Course.title, Member.role
    FROM `User` JOIN Member JOIN Course
    ON `User`.user_id = Member.user_id AND Member.course_id = Course.course_id
    ORDER BY Course.title, Member.role DESC, `User`.name
;