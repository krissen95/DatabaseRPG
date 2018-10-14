-- -------------------------------------- Inserts

INSERT INTO Race (RaceName, StrMod, IntMod, AgiMod, RaceInformation)
VALUES 
	('Human', 1, 1, 1, 'Something something'),
    ('Beastman', 1.5, 0.5, 0.5, 'Strong and stuff, no smart'),
    ('Elf', 0.85, 1.1, 1.25, 'They know parkour'),
    ('Moon Elf', 0.5, 1.5, 0.85, 'They do not know parkour');
    
INSERT INTO class (className, strMod, intMod, agiMod, classInfo)
VALUES
	('Bard', 0.85, 1.1, 0.95, 'They play music'),
    ('Fighter', 1.5, 0.5, 1, 'Hit stuff with club');
    
INSERT INTO UserAccount
VALUES
	(1, 'JonesBonny', '12345', 'John.smith51@gmail.com', TRUE, 1),
    (2, 'ChristoffWilson', 'jgfks53jkkn51', 'xChrissyx420@hotmail.com', FALSE, 1);

INSERT INTO PlayerCharacter
VALUES
	(1, 'JonnyTheBard', 1, 1, 1, 1, 1, 1),
    (2, 'JamesWolfe', 2, 2, 15, 10, 6, 4);
    
