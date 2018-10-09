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
