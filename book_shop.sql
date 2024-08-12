CREATE DATABASE Book_Shop;
use Book_Shop;

CREATE TABLE RCT
(
    RID             VarCHAR(10)      NOT NULL,
    ADDRESS         VarCHAR(30)      NOT NULL,
    FULLNAME        VarCHAR(20)      NOT NULL,
    RPassword       VarCHAR(12)      NOT NULL,
    PRIMARY KEY (RID),
    CHECK (8 = RPassword)
);

CREATE TABLE BOOK
(
     ISBN           INTEGER(10)    NOT NULL ,
     Title          VarCHAR(20)    NOT NULL ,
     Price          INTEGER(20)    NOT NULL ,
     Review         CHAR(200),
     Year           INTEGER(4)     NOT NULL ,
     Inventory      INTEGER(10)    NOT NULL ,
     Author         VarCHAR(15)    NOT NULL ,
     Publisher      VarCHAR(10)    NOT NULL ,
     Genre          VarCHAR(10)    NOT NULL ,
     PRIMARY KEY (ISBN) ,
     CHECK (4 = Year)
);

CREATE TABLE SBT
(
    SHID            VarCHAR(10)    NOT NULL,
    PRIMARY KEY (SHID)
);

CREATE TABLE NCT
(
    NID             VarCHAR(10)    NOT NULL,
    PRIMARY KEY (NID)
);

CREATE TABLE DBMT
(
    DBMID           VarCHAR(10)    NOT NULL,
    PRIMARY KEY (DBMID)
);

CREATE TABLE ACT
(
    AID               VarCHAR(10)    NOT NULL,
    fk_DBMID          VarCHAR(10)    NOT NULL,
    APassword         VarCHAR(8)     NOT NULL,
    Firing_Date       DATE           NOT NULL,
    Registered_Orders VarCHAR(200),
    FOREIGN KEY (fk_DBMID) REFERENCES DBMT(DBMID),
    PRIMARY KEY (AID , fk_DBMID)
);

CREATE TABLE CREDIT
(
    CreditCard_Num       INTEGER(16)      NOT NULL ,
    Type                 VarCHAR(10)      NOT NULL ,
    EXP_Date             DATE             NOT NULL ,
    PRIMARY KEY (CreditCard_Num)
);

CREATE TABLE R_ADD
(
    RA_SHID              VarCHAR(10)      NOT NULL ,
    RA_RID               VarCHAR(10)      NOT NULL ,
    RA_ISBN              INTEGER          NOT NULL ,
    Quantity             INTEGER          NOT NULL ,
    PRIMARY KEY (RA_RID , RA_SHID , RA_ISBN) ,
    FOREIGN KEY (RA_RID) REFERENCES RCT (RID) ,
    FOREIGN KEY (RA_SHID) REFERENCES SBT (SHID) ,
    FOREIGN KEY (RA_ISBN) REFERENCES BOOK (ISBN) );

CREATE TABLE R_BUY
(
    RB_SHID              VarCHAR(10)     NOT NULL ,
    RB_RID               VarCHAR(10)     NOT NULL ,
    Date                 DATE            NOT NULL ,
    RB_CreditCard_Num    INTEGER         NOT NULL ,
    PRIMARY KEY (RB_RID, RB_SHID , RB_CreditCard_Num) ,
    FOREIGN KEY (RB_RID) REFERENCES RCT (RID) ,
    FOREIGN KEY (RB_SHID) REFERENCES SBT (SHID) ,
    FOREIGN KEY (RB_CreditCard_Num) REFERENCES CREDIT (CreditCard_Num),
    CHECK (16 = RB_CreditCard_Num)
);

CREATE TABLE R_Remove
(
    RR_SHID              VarCHAR(10)      NOT NULL ,
    RR_RID                  VarCHAR(10)      NOT NULL ,
    RR_ISBN                 INTEGER          NOT NULL ,
    PRIMARY KEY (RR_RID , RR_SHID , RR_ISBN) ,
    FOREIGN KEY (RR_RID) REFERENCES RCT (RID) ,
    FOREIGN KEY (RR_SHID) REFERENCES SBT (SHID) ,
    FOREIGN KEY (RR_ISBN) REFERENCES BOOK (ISBN)
);

CREATE TABLE N_Remove
(
    NR_SHID                VarCHAR(10)        NOT NULL ,
    NR_NID                 VarCHAR(10)        NOT NULL ,
    NR_ISBN                INTEGER            NOT NULL ,
    PRIMARY KEY (NR_NID , NR_SHID , NR_ISBN) ,
    FOREIGN KEY (NR_NID) REFERENCES NCT (NID) ,
    FOREIGN KEY (NR_SHID) REFERENCES SBT (SHID) ,
    FOREIGN KEY (NR_ISBN) REFERENCES BOOK (ISBN)
);

CREATE TABLE N_ADD
(
    NA_SHID                VarCHAR(10)        NOT NULL ,
    NA_NID                 VarCHAR(10)        NOT NULL ,
    NA_ISBN                INTEGER            NOT NULL ,
    Quantity               INTEGER            NOT NULL ,
    PRIMARY KEY (NA_NID , NA_SHID , NA_ISBN) ,
    FOREIGN KEY (NA_NID) REFERENCES NCT (NID) ,
    FOREIGN KEY (NA_SHID) REFERENCES SBT (SHID) ,
    FOREIGN KEY (NA_ISBN) REFERENCES BOOK (ISBN)
);

CREATE TABLE ADBOOKUP
(
     AU_ISBN                  INTEGER            NOT NULL ,
     AU_AID                   VarCHAR(10)        NOT NULL ,
     Register                 VarCHAR(20)        NOT NULL ,
     Flag                     BIT(1)             NOT NULL ,
     QTY                      INTEGER            NOT NULL ,
     FOREIGN KEY (AU_ISBN) REFERENCES BOOK (ISBN) ,
     FOREIGN KEY (AU_AID) REFERENCES ACT (AID)
);

CREATE TABLE OST
(
    OID                       VarCHAR(10)        NOT NULL ,
    fk_AID                    VarCHAR(10)        NOT NULL ,
    PRIMARY KEY (OID) ,
    FOREIGN KEY (fk_AID) REFERENCES ACT (AID)
);

CREATE TABLE ORDERT
(
    OR_ID                    VARCHAR(10)        NOT NULL,
    OR_AID                   VARCHAR(10)        NOT NULL,
    OR_OID                   VARCHAR(10)        NOT NULL,
    OR_ISBN                  INTEGER            NOT NULL,
    O_DATE                   DATE               NOT NULL,
    O_QTY                    INTEGER            NOT NULL,
    PRIMARY KEY (OR_ID),
    FOREIGN KEY (OR_ISBN) REFERENCES BOOK(ISBN),
    FOREIGN KEY (OR_OID) REFERENCES OST(OID),
    FOREIGN KEY (OR_AID) REFERENCES ACT(AID)
);




ALTER TABLE RCT
    ADD fk_SHID VARCHAR(10),
    ADD CONSTRAINT fk_shid
        FOREIGN KEY (fk_SHID) REFERENCES SBT(SHID);

ALTER TABLE SBT
    ADD fk_RID VARCHAR(10) NOT NULL,
    ADD CONSTRAINT fk_rid
        FOREIGN KEY (fk_RID) REFERENCES RCT(RID);

ALTER TABLE SBT
    ADD fk_NID VARCHAR(10) NOT NULL,
    ADD CONSTRAINT fk_NID
        FOREIGN KEY (fk_NID) REFERENCES NCT(NID);

ALTER TABLE SBT
    ADD SH_AID VARCHAR(10) NOT NULL,
    ADD CONSTRAINT SH_AID
        FOREIGN KEY (SH_AID) REFERENCES ACT(AID);

ALTER TABLE NCT
    ADD NR_SHID VARCHAR(10) NOT NULL,
    ADD CONSTRAINT NR_SHID
        FOREIGN KEY (NR_SHID) REFERENCES SBT(SHID);

ALTER TABLE DBMT
    ADD fk_AID VARCHAR(10) NOT NULL,
    ADD CONSTRAINT fk_AID
        FOREIGN KEY (fk_AID) REFERENCES ACT(AID),
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (DBMID , fk_AID);

ALTER TABLE OST
    ADD fk_OR_ID VARCHAR(10),
    ADD CONSTRAINT fk_OR_ID
        FOREIGN KEY (fk_OR_ID) REFERENCES ORDERT(OR_ID);

ALTER TABLE OST
    ADD Site_Title VARCHAR(10);
