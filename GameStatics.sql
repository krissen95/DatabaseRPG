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

INSERT INTO Feat
VALUES
    (1, 'Firebolt',        1, NULL, 'Learn to cast a bolt of fire.'),
    (2, 'Heroic Strike',   1, NULL, 'Learn deal a powerful blow.'),
    (3, 'Fireball',        5,    1, 'Learn to cast a huge ball of fire.'),
    (4, 'Medium armor proficiency',  6, NULL, 'Allows you to wear armor of medium weight.'),
    (5, 'Heavy armor proficiency',  10,    4, 'Allows you to wear armor of heavy weight.'),
    (6, 'Song of Inspiration',       1, NULL, 'Inspires your allies to give them more attack power.');

#Legger inn noen verdier her, initielt kunne ID vært AI, men tenker at å bare ha tall for items ikke er oversiktlig nok
#Da er det best å bruke f.eks. "W1M" før tallet (betyr da "Weapon 1-handed Main hand") og VARCHAR i stedet for INT
INSERT INTO Item
VALUES
    (1, 'Dagger', 'Longer than a butter knife, but not quite a proper sword.', FALSE, 'MeleeWeapon, 1-handed'),
    (2, 'Shield of The Ancients', 'Generic holy shield used in the War of The Ancients. Pretty rusty, so it would not do good in combat.', TRUE, 'Shield'),
    (3, 'Health potion', 'Heals for 50HP, 20 seconds cooldown', FALSE, 'Consumable'),
    (4, 'Iron Cuiras', 'Gives 20 armor', FALSE, 'Cuirass');

# Legger til en ny column i item for å kunne vite vekten til gjenstandene (her målt i kg)
# Dette er en "hotfix patch" til spillet
ALTER TABLE Item ADD Weight float AFTER ItemType;

INSERT INTO Item
VALUES
(5, 'Bane of Light', 'A blade emitting a strange light.', FALSE, 'MeleeWeapon, 2-handed', 80.4);