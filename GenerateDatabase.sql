CREATE SCHEMA DatabaseRPG;


CREATE TABLE UserAccount  # 'user' and 'account' is reserved in MySQL
(
    UserID       	INTEGER NOT NULL,
    UserName     	VARCHAR(50),
    UserPassword 	VARCHAR(50),  # 'password' is reserved is MySQL
    Email        	VARCHAR(50),
    Trial        	BOOL,
    Karma			INTEGER,
    CONSTRAINT UserAccountPK PRIMARY KEY (UserID)
);

CREATE TABLE Sessions  # 'session' is reserved in MySQL
(
	LoginTime		TIMESTAMP,
    LogoutTime 		TIMESTAMP,
    UserID			INTEGER NOT NULL,
    SessionStatus 	INTEGER,
    CONSTRAINT SessionsPK PRIMARY KEY (LoginTime),
    CONSTRAINT SessionsUserAccountFK FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);

CREATE TABLE SubscriptionDeal
(
	DealID		INTEGER NOT NULL,
    Duration	INTEGER NOT NULL,  # number of days
    Price		DECIMAL(8, 2),
    Renewable	BOOL,  # whether or not this deal will renew itself (running subscription)
    CONSTRAINT SubscriptionDealPK PRIMARY KEY (DealID)
);

CREATE TABLE Orders  # 'order' is reserved in MySQL
(
	OrderID			INTEGER NOT NULL,
    StartTime		DATETIME,
    UserID			INTEGER NOT NULL,
    DealID			INTEGER NOT NULL,
	CONSTRAINT OrdersPK PRIMARY KEY (OrderID),
    CONSTRAINT OrdersUserAccountFK FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    CONSTRAINT OrdersSubscriptionDealFK FOREIGN KEY (DealID) REFERENCES SubscriptionDeal(DealID)
);

CREATE TABLE Race 
(
	RaceID			INT auto_increment,
	RaceName		VARCHAR(20),
    StrMod			FLOAT(3,2),
    IntMod			FLOAT(3,2),
    AgiMod			FLOAT(3,2),
	RaceInformation	VARCHAR(100),
    CONSTRAINT RaceNamePK PRIMARY KEY(RaceID)
);

CREATE TABLE class
(
	classID			INT auto_increment,
	className		VARCHAR(20),
    strMod			FLOAT(3,2),
    intMod			FLOAT(3,2),
    agiMod			FLOAT(3,2),
	classInfo		VARCHAR(100),
    CONSTRAINT classNamePK PRIMARY KEY(classID)
);

CREATE TABLE PlayerCharacter  # 'Character' is reserved by MySQL
(
	Player			INTEGER,
	CharName		VARCHAR(20),
    CharClass		INTEGER,
    CharRace		INTEGER,
	CharLevel		INTEGER,
    Strength		INTEGER,
    Inteligence		INTEGER,
    Agility			INTEGER,
    CONSTRAINT PlayerCharacterPK PRIMARY KEY(CharName),
    CONSTRAINT CharacterOwnerFK FOREIGN KEY (Player) REFERENCES UserAccount(UserID),
    CONSTRAINT PlayerRaceFK FOREIGN KEY(CharRace) REFERENCES Race(RaceID),
    CONSTRAINT PlayerClassFK FOREIGN KEY(CharClass) REFERENCES class(classID)
);

CREATE TABLE RaceFeatDependency
(
	Dependency		BOOL,
    Race			INTEGER,
    FeatName		INTEGER,
	CONSTRAINT DependencyFK PRIMARY KEY (Dependency),
    FOREIGN KEY(Race) REFERENCES Race(RaceID)
	#FOREIGN KEY(FeatName) REFERENCES Feat(FeatName)  !Did not manage to get this assigned, perhaps a logic flaw..
);

CREATE TABLE Feat
(
	FeatName		INTEGER,
	LevelReq		INTEGER,
	FeatInformation	VARCHAR(100),
	Dependency		BOOL,
	CONSTRAINT FeatNamePK PRIMARY KEY (FeatName)
	#CONSTRAINT DependencyFeatFK FOREIGN KEY(Dependency) REFERENCES RaceFeatDependency(Dependency) !Did not manage to get this assigned, perhaps a logic flaw..
);

CREATE TABLE CharFeats
(
	CharName	VARCHAR(20),
    Feat		INTEGER
	#CONSTRAINT CharNameFK FOREIGN KEY(CharName) REFERENCES PlayerCharacter(CharName), -- Insisterer på at den ikkje kan lages
    #CONSTRAINT FeatFK FOREIGN KEY(Feat) REFERENCES Feat(FeatID)
);

CREATE TABLE chatLog
(
	messageTime		TIMESTAMP,
    senderName		VARCHAR(20) NOT NULL,
    recieverName	VARCHAR(20),
    messageContent	VARCHAR(60),
    CONSTRAINT chatLogPK PRIMARY KEY (messageTime),
    CONSTRAINT chatLogSenderFK FOREIGN KEY (senderName) REFERENCES PlayerCharacter(CharName),
    CONSTRAINT chatLogRecieverFK FOREIGN KEY (recieverName) REFERENCES PlayerCharacter(CharName)
);

CREATE TABLE item_type
(
    typeName        VARCHAR(50) NOT NULL,
    equip_slot        VARCHAR(50),
    CONSTRAINT item_typePK PRIMARY KEY (typeName)
);

CREATE TABLE item 
(
    item_ID     INT NOT NULL,
    item_Name     VARCHAR(45) NOT NULL,
    description VARCHAR(255) NOT NULL,
    quest_item     VARCHAR(255) NULL,
    item_type    VARCHAR(50) NOT NULL,
    CONSTRAINT item_IDPK PRIMARY KEY (item_ID),
    FOREIGN KEY(item_type) REFERENCES item_type(typeName)
);

CREATE TABLE PlayerInventory
(
    owningCharacter    VARCHAR(20) NOT NULL,
    item_ID            INT NOT NULL,
    quantity         SMALLINT(4),
    CONSTRAINT owningCharacterFK FOREIGN KEY (owningCharacter) REFERENCES PlayerCharacter(CharName),
    CONSTRAINT item_IDFK FOREIGN KEY (item_ID) REFERENCES item(item_ID)
);
