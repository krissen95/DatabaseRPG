-- -------------------------------------- Inserts

INSERT INTO Race (RaceName, StrMod, IntMod, AgiMod, RaceInformation)
VALUES 
	('Human', 1, 1, 1, 'Something something'),
    ('Beastman', 1.5, 0.5, 0.5, 'Strong and stuff, no smart'),
    ('Elf', 0.85, 1.1, 1.25, 'They know parkour'),
    ('Moon Elf', 0.5, 1.5, 0.85, 'They do not know parkour');
    
INSERT INTO Class (ClassName, StrMod, IntMod, AgiMod, ClassInfo)
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