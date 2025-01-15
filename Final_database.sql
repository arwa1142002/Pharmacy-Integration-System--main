create database BMD_project;

CREATE TABLE Customers (
  id int identity(1,1) primary key,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  address VARCHAR(100),
  phone_number VARCHAR(15),
  password VARCHAR(50),
  medicine_history TEXT
);


CREATE TABLE MedicineHistory (
    HistoryID INT identity(1,1) PRIMARY KEY,
    CustomerID INT,
    MedicineName VARCHAR(100),
    Price DECIMAL(10, 2),
    PurchaseDate DATE,
    Quantity INT,
	Totall_prices DECIMAL(10, 2),
	Status VARCHAR(100) DEFAULT 'pending', 
    FOREIGN KEY (CustomerID) REFERENCES Customers(id)
);


CREATE TABLE MedicineCompany (
    CompanyID INT IDENTITY(1,1) ,
    CompanyName VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(200),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100),
	Fax Varchar(100)
);
CREATE TABLE Medicine (
  id int identity(1,1) primary key,
  mid INT,
  mName VARCHAR(100),
  mNumber VARCHAR(20),
  mDate DATE,
  eDate DATE,
  quantity INT,
  priceperUnit DECIMAL(10, 2),
  CompanyName varchar (100),
  Catergory varchar (100),
  offer DECIMAL(10, 2) DEFAULT 0,

  FOREIGN KEY (companyName) REFERENCES MedicineCompany(CompanyName)
);

ALTER TABLE Medicine
ADD PriceAfterOffer AS CAST((priceperUnit - (priceperUnit * offer / 100)) AS DECIMAL(10, 2)) PERSISTED;






create Table hold_Table3 (
	HistoryID INT identity(1,1) PRIMARY KEY,
	CustomerID INT,
	mName VARCHAR(100),
	priceperUnit VARCHAR(100),
	mDate VARCHAR(100),
	Quantity VARCHAR(100),
	total_price VARCHAR(100),
	FOREIGN KEY (CustomerID) REFERENCES Customers(id)
	);






CREATE TABLE Clinic (
    ID INT  PRIMARY KEY,
	DoctorName VARCHAR(100),
    Number VARCHAR(20),
    Location VARCHAR(200),
    Email VARCHAR(100)
);


INSERT INTO Clinic (ID,DoctorName, Number, Location, Email)
VALUES
    (123,'Dr. John Doe', '1234567890', '123 Main Street', 'john.doe@example.com'),
    (1234,'Dr. Jane Smith', '9876543210', '456 Elm Avenue', 'jane.smith@example.com');



CREATE TABLE p_info (
  IDss INT identity(1,1),
  p_id INT PRIMARY KEY,
  P_name VARCHAR(50),
  p_age VARCHAR(50),
  blood_p VARCHAR(50),
  blood_s VARCHAR(50),
  p_gender VARCHAR(10),
  p_diagnosis VARCHAR(100),
  phone_num VARCHAR(50) ,
  p_height VARCHAR(50),
  P_weight VARCHAR(50),
  p_Date DATE
);

Create table prescriptionhistory(
	clinic_id int DEFAULT 123,
  id int identity(1,1) primary key,
	p_id INT,
	P_name Varchar(100),
	MED_Name VARCHAR(100),
  Signature VARCHAR(100),
  Dispensing VARCHAR (100),
  Number_of_refills VARCHAR (100),
  Status VARCHAR(100) DEFAULT 'pending', 
  req_date Date,
  FOREIGN KEY (p_id) REFERENCES p_info(p_id)
);


