CREATE SCHEMA DatabaseRPG;

USE DatabaseRPG;

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

CREATE TABLE Class
(
	ClassID			INT auto_increment,
	ClassName		VARCHAR(20),
    StrMod			FLOAT(3,2),
    IntMod			FLOAT(3,2),
    AgiMod			FLOAT(3,2),
	ClassInfo		VARCHAR(100),
    CONSTRAINT ClassNamePK PRIMARY KEY(ClassID)
);

CREATE TABLE PlayerCharacter  # 'Character' is reserved by MySQL
(
	UserID			INTEGER,
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
    CONSTRAINT PlayerClassFK FOREIGN KEY(CharClass) REFERENCES Class(ClassID)
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
	FeatID		    INTEGER NOT NULL,
	FeatName		VARCHAR(30),
	LevelReq		INTEGER,
    Dependency		INTEGER,  # If the feat requires another feat first
    FeatInformation	VARCHAR(100),
	CONSTRAINT FeatPK PRIMARY KEY (FeatID)
);

CREATE TABLE CharFeats
(
	CharName	VARCHAR(20),
    FeatID      INTEGER
	#CONSTRAINT CharNameFK FOREIGN KEY(CharName) REFERENCES PlayerCharacter(CharName), -- Insisterer på at den ikkje kan lages
    #CONSTRAINT FeatFK FOREIGN KEY(Feat) REFERENCES Feat(FeatID)
);

CREATE TABLE ChatLog
(
	MessageTime		TIMESTAMP,
    SenderName		VARCHAR(20) NOT NULL,
    RecieverName	VARCHAR(20),
    MessageContent	VARCHAR(60),
    CONSTRAINT ChatLogPK PRIMARY KEY (MessageTime),
    CONSTRAINT ChatLogSenderFK FOREIGN KEY (SenderName) REFERENCES PlayerCharacter(CharName),
    CONSTRAINT ChatLogRecieverFK FOREIGN KEY (RecieverName) REFERENCES PlayerCharacter(CharName)
);

CREATE TABLE ItemType
(
    TypeName        VARCHAR(50) NOT NULL,
    EquipSlot       INT,
    CONSTRAINT ItemTypePK PRIMARY KEY (TypeName)
);

CREATE TABLE Item 
(
    ItemID          INT NOT NULL,
    ItemName        VARCHAR(45) NOT NULL,
    Description     VARCHAR(255) NOT NULL,
    QuestItem       VARCHAR(255) NULL,
    ItemType        VARCHAR(50) NOT NULL,
    CONSTRAINT ItemIDPK PRIMARY KEY (ItemID),
    FOREIGN KEY(ItemType) REFERENCES ItemType(TypeName)
);

CREATE TABLE PlayerInventory
(
    OwningCharacter VARCHAR(20) NOT NULL,
    ItemID          INT NOT NULL,
    Quantity        SMALLINT(4),
    FOREIGN KEY (OwningCharacter) REFERENCES PlayerCharacter(CharName),
	FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);
