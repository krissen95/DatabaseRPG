INSERT INTO UserAccount
VALUES
	(1, 'JonesBonny', '12345', 'John.smith51@gmail.com', TRUE, 1),
    (2, 'ChristoffWilson', 'jgfks53jkkn51', 'xChrissyx420@hotmail.com', FALSE, 1);

INSERT INTO Orders
VALUES
    (1000, '2018-09-10 12:00:00',  1, 1),
    (1001, '2018-10-02 12:00:00',  2, 2),
    (1002, '2018-10-10 12:00:00',  1, 1);

INSERT INTO PlayerCharacter
VALUES
	(1, 'JonnyTheBard', 1, 1, 1, 1, 1, 1),
    (2, 'JamesWolfe', 2, 2, 15, 10, 6, 4),
    (3, 'Gandalf',    3, 1,  8, 6, 10, 3);

INSERT INTO CharFeats
VALUES
    ('JonnyTheBard', 2),  # JonnyTheBard knows Heroic Strike
    ('JonnyTheBard', 6),  # and Song of Inspiration
    ('JamesWolfe', 2),
    ('JamesWolfe', 4),
    ('JamesWolfe', 5),
    ('Gandalf', 1),
    ('Gandalf', 3);

INSERT INTO chatLog
VALUES
	('2018-10-15 18:20:51', 'JonnyTheBard', NULL, 'I got hacked'),
    ('2018-10-15 18:20:59', 'JamesWolfe', 'JonnyTheBard', 'Shut up you spoony bard'),
    ('2018-10-15 18:21:03', 'JonnyTheBard', 'JamesWolfe', 'Why are you so mean?'),
    ('2018-10-15 18:21:30', 'JamesWolfe', NULL, 'Selling lobbies 10 gold'),
    ('2018-10-15 18:21:33', 'JamesWolfe', 'JonnyTheBard', 'STFU scrub'),
    ('2018-10-15 18:22:01', 'JonnyTheBard', NULL, 'I am quitting this game'),
    ('2018-10-15 18:22:06', 'JonnyTheBard', NULL, 'So many mean people');