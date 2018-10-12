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
	RaceName		INTEGER,
    StrMod			INTEGER,
    IntMod			INTEGER,
    AgiMod			INTEGER,
	RaceInformation	VARCHAR(100),
    CONSTRAINT RaceNamePK PRIMARY KEY(RaceName)
);

CREATE TABLE PlayerCharacter  # 'Character' is reserved by MySQL
(
	CharName		INTEGER,
	CharLevel		INTEGER,
    Strength		INTEGER,
    Inteligence		INTEGER,
    Agility			INTEGER,
	RaceName		INTEGER,
    CONSTRAINT PlayerCharacterPK PRIMARY KEY(CharName),
    CONSTRAINT PlayerRaceFK FOREIGN KEY(RaceName) REFERENCES Race(RaceName)
);

CREATE TABLE RaceFeatDependency
(
	Dependency		BOOL,
    RaceName		INTEGER,
    FeatName		INTEGER,
	CONSTRAINT DependencyFK PRIMARY KEY (Dependency),
    FOREIGN KEY(RaceName) REFERENCES Race(RaceName)
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
	CharName	INTEGER,
    FeatName	INTEGER,
	FOREIGN KEY(CharName) REFERENCES PlayerCharacter(CharName),
    FOREIGN KEY(FeatName) REFERENCES Feat(FeatName)
);
