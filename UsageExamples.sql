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
    

INSERT INTO SubscriptionDeal
VALUES
    ( 0,  30,  99.00, FALSE),
    ( 1,  30,  99.00, TRUE),
    ( 2,  90, 279.00, FALSE),
    ( 3,  90, 279.00, TRUE),
    ( 4, 180, 499.00, FALSE),
    ( 5, 180, 499.00, TRUE),
    ( 6, 365, 899.00, FALSE),
    ( 7, 365, 899.00, TRUE);


#------------------------- Inserts -------------------------#
    
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
    (2, 'JamesWolfe', 2, 2, 15, 10, 6, 4);
    
#Legger inn basis-typer, kunne lagt inn mange flere her 
INSERT INTO item_type
VALUES
('Melee Weapon, 1-handed', 1),
('Tower Shield, 1-handed', 2),
('Melee Weapon, 2-handed', 5),
('Ranged Weapon, 1-handed', 4),
('Ranged Weapon, 2-handed', 5),
('Quest Item', NULL),
('Consumable', NULL);

#Legger inn noen verdier her, initielt kunne ID vært AI, men tenker at å bare ha tall for items ikke er oversiktlig nok
#Da er det best å bruke f.eks. "W1M" før tallet (betyr da "Weapon 1-handed Main hand") og VARCHAR i stedet for INT
INSERT INTO item
VALUES
(1, 'Dagger', 'Longer than a butter knife, but not quite a proper sword.', NULL, 'Melee Weapon, 1-handed'),
(2, 'Shield of The Ancients', 'Generic holy shield used in the War of The Ancients. Pretty rusty, so it would not do good in combat.', 'The Quest For The Holy Grail', 'Melee Weapon, 1-handed'),
(3, 'Health potion', 'Heals for 50HP, 20 seconds cooldown', NULL, 'Consumable');


#Legger til en ny column i item for å kunne vite vekten til gjenstandene (her målt i kg)
ALTER TABLE item ADD weight float AFTER item_type;    

INSERT INTO item
VALUES
(4, 'Bane of Light', 'A blade emitting a strange light.', NULL, 'Melee Weapon, 2-handed', 80.4);