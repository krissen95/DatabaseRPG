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
    ('MeleeWeapon, 1-handed',  1),
    ('MeleeWeapon, 2-handed',  1),
    ('RangedWeapon, 1-handed', 1),
    ('RangedWeapon, 2-handed', 1),
    ('Shield',                 2),
    ('Helmet',      3),
	('Cuirass',     4),
	('Grieves',     5),
	('Boots',       6),
	('Consumable',  Null),
	('Ingredient',  Null),
	('Trash',       Null);
    ('Consumable',  NULL);
    

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

#Legger inn noen verdier her, initielt kunne ID vært AI, men tenker at å bare ha tall for items ikke er oversiktlig nok
#Da er det best å bruke f.eks. "W1M" før tallet (betyr da "Weapon 1-handed Main hand") og VARCHAR i stedet for INT
INSERT INTO Item
VALUES
(1, 'Dagger', 'Longer than a butter knife, but not quite a proper sword.', FALSE, 'Melee Weapon, 1-handed'),
(2, 'Shield of The Ancients', 'Generic holy shield used in the War of The Ancients. Pretty rusty, so it would not do good in combat.', TRUE, 'Shield'),
(3, 'Health potion', 'Heals for 50HP, 20 seconds cooldown', FALSE, 'Consumable'),
(4, 'Iron Cuiras', 'Gives 20 armor', FALSE, 'Cuirass');


#Legger til en ny column i item for å kunne vite vekten til gjenstandene (her målt i kg)
ALTER TABLE Item ADD Weight float AFTER ItemType;

INSERT INTO Item
VALUES
(4, 'Bane of Light', 'A blade emitting a strange light.', FALSE, 'MeleeWeapon, 2-handed', 80.4);

INSERT INTO chatLog
VALUES
	('2018-10-15 18:20:51', 'JonnyTheBard', NULL, 'I got hacked'),
    ('2018-10-15 18:20:59', 'JamesWolfe', 'JonnyTheBard', 'Shut up you spoony bard'),
    ('2018-10-15 18:21:03', 'JonnyTheBard', 'JamesWolfe', 'Why are you so mean?'),
    ('2018-10-15 18:21:30', 'JamesWolfe', NULL, 'Selling lobbies 10 gold'),
    ('2018-10-15 18:21:33', 'JamesWolfe', 'JonnyTheBard', 'STFU scrub'),
    ('2018-10-15 18:22:01', 'JonnyTheBard', NULL, 'I am quitting this game'),
    ('2018-10-15 18:22:06', 'JonnyTheBard', NULL, 'So many mean people');