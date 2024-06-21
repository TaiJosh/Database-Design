CREATE DATABASE Bank; 

CREATE TABLE UserLogins
(
UserLoginID    smallint primary key,
Userlogin      char(15),
UserPassword   varchar(20)
)


CREATE TABLE Account
(
AccountID       int primary key,
CurrentBalance  int,
AccountTypeID   tinyint,
AccountStatusTypeID  tinyint,
InterestSavingsRateID    tinyint
)


CREATE TABLE UserSecurityQuestions
(
UserSecurityQuestionID      tinyint   primary key,
UserSecurityQuestion        varchar(50)
)

CREATE TABLE AccountType
(
AccountTypeID           tinyint     primary key,
AccountTypeDescription  varchar(30)
)


CREATE TABLE SavingsInterestRates
(
InterestSavingsRateID    tinyint   primary key,
InterestRateValue        numeric(9,9),
InterestRateDescription  varchar(20)
) 


CREATE TABLE TransactionType
( 
TransactionTypeID          tinyint  primary key,
TransactionTypeName        char(10),
TransactionTypeDescription varchar(50),
TransactionFeeAmount       DECIMAL(19,2)
)


CREATE TABLE AccountStatusType
(
AccountStatusTypeID   tinyint  primary key,
AccountStatusDescription   varchar(30)
)


CREATE TABLE Employee
 (
 EmployeeID            int primary key,
 EmployeeFirstName     varchar(25),
 EmployeeMiddleInitial char(1),
 EmployeeLastName      varchar(25),
 EmployeeIsManager     boolean
 )
 

CREATE TABLE LoginErrorLog
(
ErrorLogID              int  primary key,
ErrorTime               datetime,
FailedTransactionXML    varchar(50)
)

CREATE TABLE FailedTransactionErrorType
(
FailedTransactionErrorTypeID    tinyint  primary key,
FailedTransactionDescription    varchar(50)
)

CREATE TABLE  LoginAccount 
(
UserLoginID     smallint,
AccountID       int       NOT NULL
)

CREATE TABLE  UserSecurityAnswers
( 
UserLoginID           smallint,
UserSecurityAnswer    varchar(25),
UserSecurityQuestionID  tinyint
)


CREATE TABLE  OverdraftLog
(
AccountID       int,
OverDraftDate   datetime,
OverDraftAmount DECIMAL(19,2),
OverDraftTransactionXML  varchar(255)
)

CREATE TABLE  Customer
(
CustomerID  int primary key,
AccountID   int,
CustomerAddress1  varchar(30),
CustomerAddress2  varchar(30),
CustomerFirstName  varchar(30),
CustomerMiddleInitial char(1),
CustomerLastName  varchar(30),
City         varchar(20),
Stat char(2),
ZipCode  char(10),
EmailAddress      varchar(40),
HomePhone     char(10),
CellPhone     char(10),
WorkPhone     char(10),
SSN           char(9),
UserLoginID   smallint
)


CREATE TABLE  TransactionLog
(
TransactionID    int primary key,
TransactionDate  datetime,
TransactionTypeID tinyint,
TransactionAmount DECIMAL(19,2),
NewBalance        DECIMAL(19,2),
AccountID         int,
CustomerID        int,
EmployeeID        int,
UserLoginID       smallint
)

CREATE TABLE  FailedTransactionLog
 (
 FailedTransactionID           int  primary key,
 FailedTransactionErrorTypeID  tinyint,
 FailedTransactionErrorTime    datetime,
 FailedTransactionXML          varchar(255)
 ) 

CREATE TABLE  Customer_Account
 (
 AccountID           int,
 CustomerID  int
  ) 



ALTER TABLE  LoginAccount
ADD CONSTRAINT FK_UserLoginsLoginAccount
FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID);

ALTER TABLE  UserSecurityAnswers
ADD CONSTRAINT FK_UserLoginsUserSecurityAnswers
FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID);

ALTER TABLE  UserSecurityAnswers
ADD CONSTRAINT FK_UserSecurityQuestionsUserSecurityAnswers
FOREIGN KEY (UserSecurityQuestionID) REFERENCES UserSecurityQuestions(UserSecurityQuestionID);

ALTER TABLE  Account
ADD CONSTRAINT FK_AccountTypeAccount
FOREIGN KEY (AccountTypeID) REFERENCES AccountType(AccountTypeID);

ALTER TABLE  Account
ADD CONSTRAINT FK_AccountStatusTypeAccount
FOREIGN KEY (AccountStatusTypeID) REFERENCES AccountStatusType(AccountStatusTypeID);

ALTER TABLE  Account
ADD CONSTRAINT FK_SavingsInterestRatesAccount
FOREIGN KEY (InterestSavingsRateID) REFERENCES SavingsInterestRates(InterestSavingsRateID);

ALTER TABLE  OverdraftLog
ADD CONSTRAINT FK_AccountOverdraftLog
FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE  Customer
ADD CONSTRAINT FK_AccountCustomer
FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE  Customer
ADD CONSTRAINT FK_UserLoginsCustomer
FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID);

ALTER TABLE  TransactionLog
ADD CONSTRAINT FK_TransactionTypeTransactionLog
FOREIGN KEY (TransactionTypeID) REFERENCES TransactionType(TransactionTypeID);

ALTER TABLE  TransactionLog
ADD CONSTRAINT FK_AccountTransactionLog
FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE  TransactionLog
ADD CONSTRAINT FK_CustomerTransactionLog
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

ALTER TABLE  TransactionLog
ADD CONSTRAINT FK_EmployeeTransactionLog
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE  TransactionLog
ADD CONSTRAINT FK_UserLoginsTransactionLog
FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID);

ALTER TABLE  FailedTransactionLog
ADD CONSTRAINT FK_FailedTransactionErrorTypeFailedTransactionLog
FOREIGN KEY (FailedTransactionErrorTypeID) REFERENCES FailedTransactionErrorType(FailedTransactionErrorTypeID);


ALTER TABLE  Customer_Account
ADD CONSTRAINT FK_AccountCustomer_Account
FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE  Customer_Account
ADD CONSTRAINT FK_CustomerCustomer_Account
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);


INSERT INTO  UserLogins
(UserLoginID,Userlogin,UserPassword)

VALUES  
  (15535, 'adesanyat', 'Toronto!'), 
  (15536, 'johnthomas', 'Samsung!'), 
  (15537, 'toluadex', 'Bayshore!'), 
  (15538, 'maryaddidas', 'Sagamu!'), 
  (15539, 'emmyjoe', 'Samsung123!'); 

  

 
  INSERT INTO UserSecurityQuestions
  (UserSecurityQuestionID, UserSecurityQuestion)
  
VALUES
  (121,'What is your mother maiden name?'),
  (122,'What is the name of your best friend?'),
  (123,'What is the nickname of your spouse?'),
  (124,'When is your wedding anniversarry?'),
  (125,'Where did you spend your honeymoon?');

 

 INSERT INTO AccountType

 VALUES
  (101,'Chequing Account'),
  (102,'Savings Deposit Account'),
  (103,'High interest savings Account'),
  (104,'Joint savings Accounts'),
  (105,'Student checking Accounts');

  INSERT INTO SavingsInterestRates
VALUES
(120,0.000000005,'Simple interest'),
(121,0.000000006,'Compound interest'),
(122,0.000000002,'Simple interest'),
(123,0.000000001,'Simple interest'),
(124,0.000000005,'Compound interest');

 INSERT INTO Employee
VALUES
(10,'Tom','S','Joe',0),
(11,'Tami','J','Flower',0),
(12,'Vivian','B','Brook',1),
(13,'Tom','Q','Trump',1),
(14,'Dave','S','Greek',0);



INSERT INTO TransactionType
VALUES
(100,'ATM','made withdrawal at a third party',55),
(101,'Charge','a purchase using a debit card',250),
(102,'Transfer','moved funds from chequing to savings',20),
(103,'Deposit','Added funds to chequing account',500),
(104,'POS','paid at grocery store through a point-of-sale',80);


INSERT INTO AccountStatusType
VALUES
(200,'active'),
(201,'inactive'),
(202,'active'),
(203,'active'),
(204,'inactive');




INSERT INTO LoginErrorLog(ErrorLogID,ErrorTime,FailedTransactionXML)
VALUES

(1,'1753-01-03 02:15:01','incorrect password'),
(2,'1754-03-03 02:15:01','no username found'),
(3,'2018-07-03 03:30:02','try again later'),
(4,'1753-01-27 01:15:03','cannot connect to server'),
(5,'1753-02-03 04:25:02','incorrect password');


INSERT INTO FailedTransactionErrorType(FailedTransactionErrorTypeID,FailedTransactionDescription)
VALUES
(101,'unable to withdraw'),
(102,'no sufficient amount'),
(103,'incorrect password entered'),
(104,'ATM expired'),
(105,'no sufficient amount');


INSERT INTO LoginAccount(UserLoginID,AccountID )
VALUES
(15535,30),
(15536,31),
(15537,32),
(15538,33),
(15539,34);

INSERT INTO UserSecurityAnswers(UserLoginID,UserSecurityAnswer,UserSecurityQuestionID)
VALUES
(15535,'Adetu',131),
(15536,'Slessor',132),
(15537,'Joshua',133),
(15538,'Jones',134),
(15539,'Stone',135);

INSERT INTO Account(AccountID,CurrentBalance,AccountTypeID,AccountStatusTypeID,InterestSavingsRateID)
VALUES
(30,120,140,200,120),
(31,200,141,201,121),
(32,500,142,202,122),
(33,450,143,203,123),
(34,650,144,204,124);



INSERT INTO Customer
VALUES
(181,30,'2111 Keele Street','APT 213','John','T','Thomas','North York','ON','M6N 2Z2','john@gmail.com','null','6477856432','null','123456789',15535),
(182,31,'2111 Eglinton East Avenue','APT 221','James','H','Kessigton','Toronto','ON','E2N 2Y3','james@gmail.com','4165254423','6478224312','null','123478789',15536),
(183,32,'2223 Keele street','APT 203','Jemmy','N','Henry','Edmonton','AB','M6N 3Z6','jemmy@gmail.com','4165264423','6477956432','null','123486789',15537),
(184,33,'1011 Victoria Park','APT 413','Mary','S','Button','Calgary','AB','C6C 3Z2','marys@gmail.com','null','6477856432','7168653643','123476789',15538),
(185,34,'38 Comay Road','null','Diva','J','Desmond','Toronto','ON','M6N 2M6','diva@gmail.com','null','6477856432','null','123496789',15539);


INSERT INTO TransactionLog
VALUES
(186,'1954-03-03 02:15:01',100, 250, 3000,31,182,10,15535),
(187,'2004-04-01 02:15:01',101, 550, 3200,33,181,11,15536),
(188,'1984-03-03 01:30:01',102, 680, 6000,32,183,12,15537),
(189,'1954-07-05 03:15:01',103, 700, 7500,30,184,13,15539),
(190,'1990-09-03 05:20:01',104, 200, 5500,34,185,14,15538);

INSERT INTO FailedTransactionLog
VALUES
(115,101, '2004-04-01 02:15:02','D'),
(116,103, '2005-05-07 02:50:01','W'),
(117,102, '2002-04-01 05:22:03','D'),
(118,104, '2010-09-22 01:00:01','W'),
(119,105, '2008-02-01 01:15:02','D');

INSERT INTO OverdraftLog
VALUES
(30,'2004-04-01 02:15:02',120,'W'),
(31,'2005-04-01 03:15:02',100,'W'),
(32,'2008-07-01 02:45:02',50,'W'),
(33,'2004-06-08 04:30:02',80,'W'),
(34,'1994-04-01 01:20:02',120,'W');





