DROP TABLE IF EXISTS PLAYERREGISTRATION;
DROP TABLE IF EXISTS TEAMENTRY;
DROP TABLE IF EXISTS SEASON;
DROP TABLE IF EXISTS CLUB;
DROP TABLE IF EXISTS PLAYER;

create TABLE player(
    playerid INTEGER PRIMARY Key 
    , Pl_Fname NVARCHAR(30) NOT NUll
    , Pl_Lname NVARCHAR(30) NOT NULL
    , Pl_Phone INTEGER NULL
);

create TABLE CLUB(
    Clubname NVARCHAR(100) PRIMARY KEY
    , Cl_Contactname NVARCHAR(100)
    
);

create TABLE SEASON(
    Seasonyear INTEGER
    , Seasonname NVARCHAR(6)

    ,PRIMARY KEY (Seasonname, Seasonyear)

    ,CONSTRAINT Check_Seasonname CHECK (Seasonname IN ('Winter','Summer'))
);

create TABLE TEAMENTRY (
    En_Teamnumber INT
    , En_Agegroup NVARCHAR(3)
    , Seasonname NVARCHAR(6)
    , Seasonyear INT
    , Clubname NVARCHAR(100)
    ,PRIMARY KEY (En_Teamnumber, En_Agegroup, Seasonname, Seasonyear, Clubname)
    ,FOREIGN KEY (Seasonname,Seasonyear) REFERENCES SEASON
    ,FOREIGN KEY (Clubname) REFERENCES CLUB

);

create TABLE PLAYERREGISTRATION(
    Dateregistered DATE
    , Clubname NVARCHAR(100)
    , Seasonyear INT
    , Seasonname NVARCHAR(6)
    , En_Teamnumber INT
    , En_Agegroup NVARCHAR(3)
    , Playerid INT

    ,PRIMARY KEY (playerid,Clubname,Seasonname,Seasonyear,En_Teamnumber, En_Agegroup)
    ,FOREIGN KEY (En_Teamnumber, En_Agegroup,Seasonname,Seasonyear,Clubname) REFERENCES TEAMENTRY
    ,FOREIGN KEY (Playerid) REFERENCES PLAYER
);

DELETE FROM PLAYERREGISTRATION;
DELETE FROM TEAMENTRY;
DELETE FROM SEASON;
DELETE FROM CLUB;
DELETE FROM PLAYER;

INSERT INTO PLAYER(Playerid,Pl_Fname,Pl_Lname,Pl_Phone) VALUES (10002,'John','Howard', 5552345);
INSERT INTO PLAYER(Playerid,Pl_Fname,Pl_Lname,Pl_Phone) VALUES (10003,'Julia','Gillard', 5553456);
INSERT INTO PLAYER(Playerid,Pl_Fname,Pl_Lname,Pl_Phone) VALUES (10004,'Sam','Sammer', 5553457);
INSERT INTO PLAYER(Playerid,Pl_Fname,Pl_Lname,Pl_Phone) VALUES (10005,'Zac','Bob', 5553458);

INSERT INTO CLUB(Clubname,Cl_Contactname) VALUES ('Mt Martha Basketball Club', 'Bob Jane');
INSERT INTO CLUB(Clubname,Cl_Contactname) VALUES ('Pew Pew Shootem up Club', 'Beep Boop');
INSERT INTO CLUB(Clubname,Cl_Contactname) VALUES ('I Wanna Die Club', 'Moo Man');
INSERT INTO CLUB(Clubname,Cl_Contactname) VALUES ('Please Dont Join Club', 'How To');

INSERT INTO SEASON(Seasonyear, Seasonname) VALUES (2018, 'Winter');
INSERT INTO SEASON(Seasonyear, Seasonname) VALUES (2018, 'Summer');
INSERT INTO SEASON(Seasonyear, Seasonname) VALUES (2017, 'Summer');
INSERT INTO SEASON(Seasonyear, Seasonname) VALUES (2017, 'Winter');

INSERT INTO TEAMENTRY(En_Teamnumber,En_Agegroup,Seasonname,Seasonyear,Clubname) VALUES (1,'U14','Summer',2018,'Mt Martha Basketball Club');
INSERT INTO TEAMENTRY(En_Teamnumber,En_Agegroup,Seasonname,Seasonyear,Clubname) VALUES (2,'U14','Summer',2018,'Mt Martha Basketball Club');
INSERT INTO TEAMENTRY(En_Teamnumber,En_Agegroup,Seasonname,Seasonyear,Clubname) VALUES (4,'U14','Winter',2017,'I Wanna Die Club');
INSERT INTO TEAMENTRY(En_Teamnumber,En_Agegroup,Seasonname,Seasonyear,Clubname) VALUES (3,'U14','Summer',2017,'Please Dont Join Club');


INSERT INTO PLAYERREGISTRATION(Playerid,Clubname,Seasonyear,Seasonname,En_Agegroup,En_Teamnumber,Dateregistered) VALUES (10002,'Mt Martha Basketball Club',2018,'Summer','U14', 2,'01/01/2018');
INSERT INTO PLAYERREGISTRATION(Playerid,Clubname,Seasonyear,Seasonname,En_Agegroup,En_Teamnumber,Dateregistered) VALUES (10003,'Mt Martha Basketball Club',2018,'Summer','U14', 2,'01/01/2018');
INSERT INTO PLAYERREGISTRATION(Playerid,Clubname,Seasonyear,Seasonname,En_Agegroup,En_Teamnumber,Dateregistered) VALUES (10004,'I Wanna Die Club',2017,'Winter','U14', 4,'08/02/2017');
INSERT INTO PLAYERREGISTRATION(Playerid,Clubname,Seasonyear,Seasonname,En_Agegroup,En_Teamnumber,Dateregistered) VALUES (10005,'Please Dont Join Club',2017,'Summer','U14', 3,'03/02/2017');