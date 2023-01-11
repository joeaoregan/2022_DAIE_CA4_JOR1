-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-11 15:34:12.036

-- tables
-- Table: Asset
CREATE TABLE Asset (
    Id integer NOT NULL CONSTRAINT Asset_pk PRIMARY KEY AUTOINCREMENT,
    Name varchar(50) NOT NULL,
    Type varchar(50),
    Format varchar(50),
    Created_By integer NOT NULL,
    Date_Created date NOT NULL,
    CONSTRAINT Asset_Team_Member FOREIGN KEY (Created_By)
    REFERENCES Team_Member (Id)
);

-- Table: Asset_Work_Items
CREATE TABLE Asset_Work_Items (
    Work_Item_Id integer NOT NULL,
    Asset_Id integer NOT NULL,
    CONSTRAINT Asset_Work_Items_pk PRIMARY KEY (Work_Item_Id,Asset_Id),
    CONSTRAINT Asset_Work_Item_Work_Item FOREIGN KEY (Work_Item_Id)
    REFERENCES Work_Item (Id),
    CONSTRAINT Asset_Work_Items_Asset FOREIGN KEY (Asset_Id)
    REFERENCES Asset (Id)
);

-- Table: Collection
CREATE TABLE Collection (
    Library_Id integer NOT NULL,
    Asset_Id integer NOT NULL,
    CONSTRAINT Collection_Id PRIMARY KEY (Library_Id,Asset_Id),
    CONSTRAINT Collection_Asset FOREIGN KEY (Asset_Id)
    REFERENCES Asset (Id),
    CONSTRAINT Collection_Library FOREIGN KEY (Library_Id)
    REFERENCES Library (Id)
);

-- Table: Library
CREATE TABLE Library (
    Id integer NOT NULL CONSTRAINT Library_pk PRIMARY KEY AUTOINCREMENT,
    Name varchar(50) NOT NULL
);

-- Table: Project
CREATE TABLE Project (
    Id integer NOT NULL CONSTRAINT Project_pk PRIMARY KEY AUTOINCREMENT,
    Name varchar(128) NOT NULL,
    Delivery_Date date NOT NULL
);

-- Table: Project_Team
CREATE TABLE Project_Team (
    Team_Member_Id integer NOT NULL,
    Project_Id integer NOT NULL,
    CONSTRAINT Project_Team_Id PRIMARY KEY (Project_Id,Team_Member_Id),
    CONSTRAINT Team_Team_Member FOREIGN KEY (Team_Member_Id)
    REFERENCES Team_Member (Id),
    CONSTRAINT Team_Project FOREIGN KEY (Project_Id)
    REFERENCES Project (Id)
);

-- Table: Role
CREATE TABLE Role (
    Id integer NOT NULL CONSTRAINT Role_pk PRIMARY KEY AUTOINCREMENT,
    Name varchar(50) NOT NULL
);

-- Table: Status
CREATE TABLE Status (
    Id integer NOT NULL CONSTRAINT Status_pk PRIMARY KEY AUTOINCREMENT,
    Name varchar(50) NOT NULL
);

-- Table: Team_Member
CREATE TABLE Team_Member (
    Id integer NOT NULL CONSTRAINT Team_Member_pk PRIMARY KEY AUTOINCREMENT,
    First_Name varchar(50) NOT NULL,
    Last_Name varchar(50) NOT NULL,
    Email varchar(128) NOT NULL,
    Role_Id integer NOT NULL,
    CONSTRAINT Team_Member_Email_AK UNIQUE (Email),
    CONSTRAINT Team_Member_Role FOREIGN KEY (Role_Id)
    REFERENCES Role (Id)
);

-- Table: Work_Item
CREATE TABLE Work_Item (
    Id integer NOT NULL CONSTRAINT Work_Item_pk PRIMARY KEY AUTOINCREMENT,
    Name varchar(50) NOT NULL,
    Status_Id integer NOT NULL,
    Assigned_To integer,
    CONSTRAINT Work_Item_Statuses FOREIGN KEY (Status_Id)
    REFERENCES Status (Id),
    CONSTRAINT Work_Item_Team_Member FOREIGN KEY (Assigned_To)
    REFERENCES Team_Member (Id)
);

-- End of file.

