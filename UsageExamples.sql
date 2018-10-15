#------------------------- Static tables -------------------------#

INSERT INTO Race (RaceName, StrMod, IntMod, AgiMod, RaceInformation)
VALUES 
	('Human', 1, 1, 1, 'Something something'),
    ('Beastman', 1.5, 0.5, 0.5, 'Strong and stuff, no smart'),
    ('Elf', 0.85, 1.1, 1.25, 'They know parkour'),
    ('Moon Elf', 0.5, 1.5, 0.85, 'They do not know parkour');
    
INSERT INTO Class (ClassName, StrMod, IntMod, AgiMod, ClassInfo)
VALUES
	('Bard',    0.85,   1.1,    0.95,   'They play music'),
    ('Fighter', 1.5,    0.5,    1,      'Hit stuff with club'),
    ('Rogue',   0.85,   1.5,    0.9,    'Sneaky people'),
    ('Wizard',  0.5,    1.7,    0.75,   'Mystical magic users');

INSERT INTO ItemType (TypeName, EquipSlot)
VALUES
	('Helmet',  'Head'),
	('Cuirass',  'Torso'),
	('Grieves',  'Legs'),
	('Boots',  'Feet'),
	('One Handed Weapon',  'Weapon2H'),
	('Two Handed Weapon',  'Weapon1H'),
	('Whield',  'Shield'),
	('Consumable',  Null),
	('Ingredient',  Null),
	('Trash',  Null);
    

#------------------------- Inserts -------------------------#
    
INSERT INTO UserAccount
VALUES
	(1, 'JonesBonny', '12345', 'John.smith51@gmail.com', TRUE, 1),
    (2, 'ChristoffWilson', 'jgfks53jkkn51', 'xChrissyx420@hotmail.com', FALSE, 1);

INSERT INTO PlayerCharacter
VALUES
	(1, 'JonnyTheBard', 1, 1, 1, 1, 1, 1),
    (2, 'JamesWolfe', 2, 2, 15, 10, 6, 4);
    
