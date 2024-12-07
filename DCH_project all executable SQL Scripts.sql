CREATE TABLE Guest (
    GuestNo   INTEGER      NOT NULL
                           PRIMARY KEY,
    Surname   VARCHAR (20) NOT NULL,
    GivenName VARCHAR (20) NOT NULL,
    Email     VARCHAR (40),
    Mobile    SMALLINT,
    City      VARCHAR (40) 
);

CREATE TABLE Employees (
    EmployeeID INTEGER      NOT NULL
                            PRIMARY KEY,
    L_name     VARCHAR (20) NOT NULL,
    F_name     VARCHAR (20) NOT NULL
);

CREATE TABLE Room (
    RoomNumber CHAR (3)     NOT NULL
                            PRIMARY KEY,
    RoomType   VARCHAR (20) NOT NULL
                            CONSTRAINT CC1 CHECK (RoomType IN ('King', 'Queen', 'DeluxeTwin', 'Family', 'Apartment') ) ,
    RoomRate  FLOAT (8,2)   NOT NULL
);

CREATE TABLE Reservation (
    ResNo       INTEGER      NOT NULL
                             PRIMARY KEY,
    ArrivalDate DATE         NOT NULL,
    DepartDate  DATE         NOT NULL,
    Nights      SMALLINT     NOT NULL,
    BkgSource   VARCHAR (20) NOT NULL
                             CONSTRAINT CC1 CHECK (BkgSource IN ('DCHwebsite', 'Booking.com', 'Expedia', 'Qantas') )
);

CREATE TABLE Payment (
    P_ID         INTEGER       NOT NULL
                               PRIMARY KEY,
    Payment_type VARCHAR (20),
    Amount       DOUBLE (8, 2) NOT NULL,
    P_GuestNo    INTEGER       NOT NULL,
    FOREIGN KEY (
        P_GuestNo
    )
    REFERENCES Guest (GuestNo) ON DELETE CASCADE
                               ON UPDATE CASCADE
);

CREATE TABLE Housekeeper (
    HSK_ID INTEGER NOT NULL
                 PRIMARY KEY,
    FOREIGN KEY (
        HSK_ID
    )
    REFERENCES Employees (EmployeeID) ON DELETE CASCADE
                                      ON UPDATE CASCADE
);

CREATE TABLE Receptionist (
    Rec_ID INTEGER NOT NULL
                 PRIMARY KEY,
    FOREIGN KEY (
        Rec_ID
    )
    REFERENCES Employees (EmployeeID) ON DELETE CASCADE
                                      ON UPDATE CASCADE
);



CREATE TABLE GroupRes (
    Grp_ResNo      INTEGER,
    Separate_ResNo INTEGER PRIMARY KEY
                           NOT NULL,
    FOREIGN KEY (
        Separate_ResNo
    )
    REFERENCES Reservation (ResNo) ON DELETE CASCADE
                                   ON UPDATE CASCADE
);

CREATE TABLE IndividualRes (
    Ind_ResNo INTEGER NOT NULL
                    PRIMARY KEY,
    FOREIGN KEY (
        Ind_ResNo
    )
    REFERENCES Reservation (ResNo) ON DELETE CASCADE
                                   ON UPDATE CASCADE
);



CREATE TABLE Paid_to (
    P_ID  INTEGER NOT NULL,
    ResNo INTEGER NOT NULL,
    PRIMARY KEY (
        P_ID,
        ResNo
    ),
    FOREIGN KEY (
        P_ID
    )
    REFERENCES Payment (P_ID) ON DELETE CASCADE
                              ON UPDATE CASCADE,
    FOREIGN KEY (
        ResNo
    )
    REFERENCES Reservation (ResNo) ON DELETE CASCADE
                                   ON UPDATE CASCADE
);



CREATE TABLE Occupy (
    GuestNo    INTEGER NOT NULL,
    RoomNumber INTEGER NOT NULL,
    PRIMARY KEY (
        GuestNo,
        RoomNumber
    ),
    FOREIGN KEY (
        GuestNo
    )
    REFERENCES Guest (GuestNo) ON DELETE CASCADE
                               ON UPDATE CASCADE,
    FOREIGN KEY (
        RoomNumber
    )
    REFERENCES Room (RoomNumber) ON DELETE CASCADE
                                 ON UPDATE CASCADE
);



CREATE TABLE ManageReservation (
    Rec_ID INTEGER NOT NULL,
    ResNo  INTEGER NOT NULL,
    PRIMARY KEY (
        Rec_ID,
        ResNo
    ),
    FOREIGN KEY (
        Rec_ID
    )
    REFERENCES Receptionist (Rec_ID) ON DELETE CASCADE
                                     ON UPDATE CASCADE,
    FOREIGN KEY (
        ResNo
    )
    REFERENCES Reservation (ResNo) ON DELETE CASCADE
                                   ON UPDATE CASCADE
);


CREATE TABLE Reserved (
    RoomNumber CHAR (3) NOT NULL,
    ResNo      INTEGER  NOT NULL,
    PRIMARY KEY (
        ResNo
    ),
    FOREIGN KEY (
        RoomNumber
    )
    REFERENCES Room (RoomNumber) ON DELETE CASCADE
                                 ON UPDATE CASCADE,
    FOREIGN KEY (
        ResNo
    )
    REFERENCES Reservation (ResNo) ON DELETE CASCADE
                                   ON UPDATE CASCADE
);



CREATE TABLE RoomService (
    HSK_ID      INTEGER  NOT NULL,
    RoomNumber  CHAR (3) NOT NULL,
    ServiceDate DATE     NOT NULL,
    PRIMARY KEY (
        HSK_ID,
        RoomNumber,
        ServiceDate
    ),
    FOREIGN KEY (
        HSK_ID
    )
    REFERENCES Housekeeper (HSK_ID) ON DELETE CASCADE
                                    ON UPDATE CASCADE,
    FOREIGN KEY (
        RoomNumber
    )
    REFERENCES Room (RoomNumber) ON DELETE CASCADE
                                 ON UPDATE CASCADE
);


Drop TABLE Room;
CREATE TABLE Room (
    RoomNumber CHAR (3)     NOT NULL
                            PRIMARY KEY,
    RoomType   VARCHAR (20) NOT NULL
                            CONSTRAINT CC1 CHECK (RoomType IN ('King', 'Queen', 'DeluxeTwin', 'Family', 'Apartment') ) 
);



INSERT INTO Guest (GuestNo,Surname,GivenName,Email,Mobile,City)
VALUES ('10101','Jeffery','Steele','10234@gmail.com','61432977848','Sydney'),
('10114','Jeremy','Smith','smithluhnk@hotmial.com','61483837814','Wyong'),
('10116','Paul','Trujillo','Paulandrichard555@gmail.com','61497192574','Gold Coast '),
('10118','Lori','Hamilton','wouloxoijoxau-5518@yopmail.com','61449205040','Mildura'),
('10120','Kimberly','Garcia','69787jin@hotmail.com','61446874569','Perth'),
('10122','Tina','Cuevas','b00@hotmail.com','61456616223','Sydney'),
('10126','Austin','Green','green1223@gmail.com','61452478813','Canberra '),
('10127','Cheryl','Bell','cheeylbell1987@126.com','61425029125','Wollongong'),
('10136','Pamela','Smith','iebnnhwgmrq7010@yeah.net','61491228866','Perth'),
('10138','Christian','Patel','petel567890@gmail.com','61422661661','Perth'),
('10140','Jose','Crawford','joseyuou@gmail.com','61441655964','Orange'),
('10113','Jeffery','Murillo','loveJeffery90@gmail.com','61499871845','Wagga Wagga'),
('10115','Kelly','Tran','kellycnecnw@outlook.com','61483584491','Goulburn'),
('10117','Ambonner','Bennett','amenbenett45678@gmail.com','61498219870','Broome'),
('10119','Cie','Walker','byddew@gmail.com','61465967469','Wangaratta'),
('10121','Kenneth','Mooney','bujinqi@gmail.com','61458996507','Perth'),
('10134','Kathleen','Smith','v5smith@hotmail.com','61498127410','Melbourne'),
('10135','Christopher','Hardy','chris1988@gmail.com','61431396724','Brisbane'),
('10137','Sabrina','Smith','q8smith@yahoo.com','61485761178','Gold Coast'),
('10139','Christopher','Spencer','spencer689@gmail.com','61492568461','Mildura');

INSERT INTO EMPLOYEES (EmployeeID, L_name, F_name)
VALUES ('10687','Xu','Alice'),('10377','Waston','Jay'),
('10487','Sneha','Lee'),('10234','Howard','Tylor'),
('10375','Johnson','Crestine'),('10376','Cooper','Monique'),
('10245','Luo','Mui'),('10467','Chu','Angela'),
('10385','Smith','Katrina'),('10287','Connie','Walker'),
('10395','Kimberly','Garcia'),('10421','Kenneth','Mooney'),
('10523','Tina','Cuevas'),('10388','Jeffrey','Boyd'),
('10497','Eric','Mccarthy');

INSERT INTO Housekeeper (HSK_ID)
VALUES 
('10234'),('10375'),('10376'),('10245');

INSERT INTO Receptionist(Rec_ID)
VALUES
('10687'),('10377'),('10487'),('10467'),('10385');

INSERT INTO Room(RoomNumber,RoomType)
VALUES 
('302','King'),('703','DeluxeTwin'),
('313','King'),('504','Apartment'),
('601','Family'),('314','King'),
('520','Apartment'),('320','King'),
('420','Queen'),('512','Apartment'),
('503','Apartment'),('315','King'),
('606','Family'),('510','Apartment'),
('316','King'),('414','Queen'),
('415','Queen'),('602','Family');

INSERT INTO Reservation(ResNo,ArrivalDate,DepartDate,Nights,BkgSource)
VALUES 
('66141','2021-06-21','2021-08-17','57','DCHwebsite'),
('87136','2019-11-19','2019-12-17','28','DCHwebsite'),
('55938','2021-06-09','2021-07-21','42','Booking.com'),
('46223','2019-11-19','2019-12-17','28','DCHwebsite'),
('89712','2020-06-09','2020-07-15','36','Booking.com'),
('54627','2019-11-19','2019-12-17','28','DCHwebsite'),
('25361','2020-06-09','2020-07-30','51','Booking.com'),
('12077','2021-07-24','2021-08-03','10','DCHwebsite'),
('89659','2020-02-17','2020-10-15','241','DCHwebsite'),
('28074','2020-06-04','2021-04-03','303','DCHwebsite'),
('31220','2020-01-13','2020-05-28','136','DCHwebsite'),
('12800','2020-09-11','2021-08-15','338','Qantas'),
('2410','2020-03-10','2021-06-22','104','Qantas'),
('51093','2021-03-18','2021-05-06','49','Expedia'),
('94012','2020-08-22','2020-09-03','12','Qantas'),
('90508','2020-11-12','2021-04-07','147','Qantas'),
('31565','2020-10-15','2020-10-26','11','Qantas'),
('54855','2020-03-02','2020-03-07','5','Expedia'),
('38040','2021-06-30','2021-08-21','52','Qantas'),
('83874','2020-03-02','2020-03-11','9','Expedia');

INSERT INTO GroupRes (Grp_ResNo,Separate_ResNo)
VALUES 
('','66141'),('52157','87136'),('32162','55938'),
('52157','46223'),('32162','89712'),('52157','54627'),
('32162','25361'),('','12077'),('','89659'),
('','28074'),('','31220'),('','12800'),
('','2410'),('','51093'),('','94012'),
('','90508'),('','31565'),('46721','54855'),
('','38040'),('46721','83874');

INSERT INTO IndividualRes(Ind_ResNo)
VALUES 
('66141'),('87136'),('55938'),('46223'),('89712'),('54627'),('25361'),
('12077'),('89659'),('28074'),('31220'),('12800'),('2410'),('51093'),
('94012'),('90508'),('31565'),('54855'),('38040'),('83874');

INSERT INTO Payment(P_ID,Payment_type,Amount,P_GuestNo)
VALUES 
('6395562381','POA','882.24','10101'),('7686044311','POA','250.85','10114'),
('2312373295','POA','260.09','10116'),('8876380992','VCC','452.18','10118'),
('3467674447','POA','830.95','10120'),('9731412115','VCC','832','10122'),
('3336293082','RTC','964.13','10126'),('8992072645','VCC','511.21','10127'),
('7485696408','RTC','447.95','10136'),('8481242645','VCC','565.11','10138'),
('6445574611','VCC','237.14','10140'),('9980018894','POA','380.8','10113'),
('3355943278','POA','941.28','10115'),('1155674380','VCC','482.72','10117'),
('2849089008','POA','382.82','10119'),('8476678943','POA','485.55','10121'),
('6353385554','RTC','290.28','10134'),('7512317560','RTC','282.87','10135'),
('7196210641','RTC','595.93','10137'),('7846572373','POA','925.7','10139');

INSERT INTO Paid_to(P_ID,ResNo)
VALUES 
('6395562381','66141'),('7686044311','87136'),('2312373295','55938'),
('8876380992','46223'),('3467674447','89712'),('9731412115','54627'),
('3336293082','25361'),('8992072645','12077'),('7485696408','89659'),
('8481242645','28074'),('6445574611','31220'),('9980018894','12800'),
('3355943278','2410'),('1155674380','51093'),('2849089008','94012'),
('8476678943','90508'),('6353385554','31565'),('7512317560','54855'),
('7196210641','38040'),('7846572373','83874');

INSERT INTO Occupy(GuestNo,RoomNumber)
VALUES 	
('10101','302'),('10114','703'),('10116','313'),('10118','504'),('10120','601'),
('10122','314'),('10126','313'),('10127','520'),('10136','320'),('10138','420'),
('10140','512'),('10113','503'),('10115','315'),('10117','606'),('10119','510'),
('10121','316'),('10134','414'),('10135','415'),('10137','601'),('10139','602');

INSERT INTO ManageReservation(Rec_ID,ResNo)
VALUES
('10687','66141'),('10385','87136'),('10687','55938'),('10385','46223'),('10687','89712'),
('10385','54627'),('10687','25361'),('10687','12077'),('10487','89659'),('10467','28074'),
('10377','31220'),('10385','12800'),('10487','2410'),('10467','51093'),('10377','94012'),
('10687','90508'),('10385','31565'),('10385','54855'),('10687','38040'),('10385','83874');

INSERT INTO Reserved (RoomNumber,ResNo)
VALUES 
('302','66141'),('703','87136'),('313','55938'),('504','46223'),('601','89712'),('314','54627'),
('313','25361'),('520','12077'),('320','89659'),('420','28074'),('512','31220'),('503','12800'),
('315','2410'),('606','51093'),('510','94012'),('316','90508'),('414','31565'),('415','54855'),
('601','38040'),('602','83874');

INSERT INTO RoomService (HSK_ID, RoomNumber, ServiceDate)
VALUES 
('10234','302','2021-08-07'), ('10375','703','2019-12-13'),('10245','313','2021-07-06'),
('10375','504','2019-11-25'),('10245','601','2020-06-12'),('10375','314','2019-12-10'),
('10234','313','2020-06-22'),('10375','520','2021-08-01'),('10376','320','2020-06-27'),
('10234','420','2020-08-19'),('10376','512','2020-03-23'),('10234','503','2021-07-16'),
('10376','315','2021-05-08'),('10234','606','2021-04-13'),('10376','510','2020-08-26'),
('10234','316','2020-12-24'),('10234','414','2020-10-15'),('10375','415','2020-03-03'),
('10245','601','2021-07-08'),('10375','602','2020-03-07');

Alter TABLE Reservation ADD RoomRate FLOAT(8,2);

Update Reservation set RoomRate = 179 where ResNo=66141;
Update Reservation set RoomRate = 155 where ResNo=87136;
Update Reservation set RoomRate = 110 where ResNo=55938;
Update Reservation set RoomRate = 234 where ResNo=46223;
Update Reservation set RoomRate = 167.5 where ResNo=89712;
Update Reservation set RoomRate = 189.03 where ResNo=54627;
Update Reservation set RoomRate = 134.08 where ResNo=25361;
Update Reservation set RoomRate = 145.04 where ResNo=12077;
Update Reservation set RoomRate = 214.05 where ResNo=89659;
Update Reservation set RoomRate = 268 where ResNo=28074;
Update Reservation set RoomRate = 211 where ResNo=31220;
Update Reservation set RoomRate = 145  where ResNo=12800;
Update Reservation set RoomRate = 112 where ResNo=2410;
Update Reservation set RoomRate = 110.9 where ResNo=51093;
Update Reservation set RoomRate = 179 where ResNo=94012;
Update Reservation set RoomRate = 128.09 where ResNo=90508;
Update Reservation set RoomRate = 216.03 where ResNo=31565;
Update Reservation set RoomRate = 229 where ResNo=54855;
Update Reservation set RoomRate = 267 where ResNo=38040;
Update Reservation set RoomRate = 290 where ResNo=83874;