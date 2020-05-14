CREATE DATABASE IF NOT EXISTS HOSPITAL_DATABASE;

USE HOSPITAL_DATABASE;

CREATE TABLE IF NOT EXISTS DOCTOR_DETAILS(
    Doctor_ID INT AUTO_INCREMENT,
    Name CHAR(20) NOT NULL ,
    DOB DATE NOT NULL ,
    PRIMARY KEY(Doctor_ID)
);
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Ravi Chopra', '1997-11-11');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Parav Chopra', '1975-10-09');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Khwahish', '1990-02-01');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Gurjot Singh','1980-05-30');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Vibhor Sharma', '1988-10-09');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Ravi Sharma', '1999-12-11');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Neeraj Bhatia', '2008-07-11');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Gagan Sakhuja', '1967-05-01');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Ghuman', '2001-03-09');
INSERT INTO DOCTOR_DETAILS(Name, DOB) VALUES ('Dr. Ravi Chopra', '2008-11-11');

CREATE TABLE IF NOT EXISTS NURSE_DETAILS(
    Nurse_ID INT AUTO_INCREMENT,
    Name CHAR(20) NOT NULL ,
    DOB DATE NOT NULL ,
    year_of_joining YEAR NOT NULL,
    PRIMARY KEY (Nurse_ID)
);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Anuradha', '2001-01-01', 2017);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Khwahish', '1999-07-06', 2016);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Monika', '1995-11-12', 2017);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Andrew', '1994-10-06', 2019);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Sansa', '1990-09-27', 2018);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Arya', '1993-08-22', 2020);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Cersie', '1994-05-18', 2019);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Dany', '2000-01-12', 2013);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Melisandre', '1988-04-11', 2014);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Queen', '1990-03-13', 2015);
INSERT INTO NURSE_DETAILS(Name, DOB, year_of_joining) VALUES ('Queen', '1990-03-13', 2015);

/*CREATE TABLE IF NOT EXISTS AGE_TABLE(
    DOB DATE NOT NULL,
    Age INT NOT NULL,
    PRIMARY KEY (DOB)
);*/
/*use the query to output age live*/

CREATE TABLE IF NOT EXISTS DOCTOR_PAY(
    DOCTOR_ID INT NOT NULL,
    Qualification CHAR(20) NOT NULL ,
    OPD_Timings CHAR(20) NOT NULL,/*TIMINGS MUST BE MENTIONED AS 2:00PM-4:00PM*/
    Pay_scale INT NOT NULL ,
    PRIMARY KEY (DOCTOR_ID),
    FOREIGN KEY (DOCTOR_ID) REFERENCES  DOCTOR_DETAILS(DOCTOR_ID)
);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (1,'M.B.B.S. Child', '2:00PM-4:00PM', 50000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (2, 'M.D. Heart', '1:00PM-3:00PM', 55000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (3, 'M.B.B.S. Eye', '4:00PM-6:00PM', 60000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (4, 'M.S. ENT',  '9:00AM-11:00AM', 80000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (5, 'M.B.B.S Child.', '2:00PM-4:00PM', 120000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (6, 'M.B.B.S. Eye ', '12:00PM-3:00PM', 124000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (7, 'B.M.B.S Psychiatrist', '4:00PM-5:00PM', 750000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (8, 'M.B.B.S. Skin', '2:00PM-4:00PM', 950000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (9, 'B.D.S. Dental', '2:00PM-4:00PM',100000);
INSERT INTO DOCTOR_PAY(DOCTOR_ID, Qualification, OPD_Timings, Pay_scale) VALUES (10, 'B.H.M.S. Homeopathy', '2:00PM-4:00PM', 130000);


CREATE TABLE IF NOT EXISTS PATIENT(
    Prescription_number INT NOT NULL AUTO_INCREMENT,
    Age INT NOT NULL,
    Address CHAR(40),
    Name CHAR(20) NOT NULL,
    Gender CHAR(1) NOT NULL, #M/F/O
    PRIMARY KEY (Prescription_number),
    COVID CHAR(1) NOT NULL DEFAULT 'N',/*Y if yes*/ 
    CHECK(Gender IN ('M','F','O'))
);
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (20, 'Batala, Gurdaspur, Punjab', 'vfjb', 'M','N');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (11, 'Amritsar, Punjab', 'fds', 'F','Y');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (25, 'Ambala, Haryana', 'fffs', 'O','N');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (40, 'Barielly, Uttar Pradesh', '4uynhvskbsil', 'M','N');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (11, 'Noida, Uttar Pradesh', 'xdf', 'F','N');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (20, 'Mumbai, Maharashtra', 'vsdfuba', 'F','N');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (15, 'Indore, Madhya Pradesh', 'vbuefkwb', 'M','N');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (45, 'Gwalior, Madhya Pradesh', 'svgyuqjegwq', 'F','Y');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (30, 'Ayodhya, Uttar Pradesh', 'bfub', 'M','Y');
INSERT INTO PATIENT(Age, Address, Name, Gender, COVID) VALUES (32, 'Ranchi, Jharkhand', 'dsaiuhule', 'M','N');
/*remember to use treats to assign doctor to a patient*/
CREATE TABLE IF NOT EXISTS TREATS(
    Doctor_ID INT NOT NULL,
    Prescription_number INT NOT NULL,
    UNIQUE (Prescription_number) ,
    PRIMARY KEY (Prescription_number),
    FOREIGN KEY (Prescription_number) REFERENCES PATIENT(Prescription_number),
    FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR_DETAILS(Doctor_ID)
);
INSERT INTO TREATS VALUES (1,10);
INSERT INTO TREATS VALUES (4,2);
INSERT INTO TREATS VALUES (1,5);
INSERT INTO TREATS VALUES (6,1);
INSERT INTO TREATS VALUES (4,4);
INSERT INTO TREATS VALUES (1,3);
INSERT INTO TREATS VALUES (10,7);
INSERT INTO TREATS VALUES (8,8);
INSERT INTO TREATS VALUES (4,9);
INSERT INTO TREATS VALUES (2,6);
/*remember to use nursing to assign nurse to a patient*/
CREATE TABLE IF NOT EXISTS NURSING(
    Nurse_ID INT NOT NULL ,
    Prescription_number INT NOT NULL ,
    PRIMARY KEY (Nurse_ID,Prescription_number) ,
    FOREIGN KEY (Nurse_ID) REFERENCES NURSE_DETAILS(Nurse_ID) ,
    FOREIGN KEY (Prescription_number) REFERENCES PATIENT(Prescription_number)
);
INSERT INTO NURSING VALUES (1,1);
INSERT INTO NURSING VALUES (2,1);
INSERT INTO NURSING VALUES (1,5);
INSERT INTO NURSING VALUES (3,6);
INSERT INTO NURSING VALUES (2,2);
INSERT INTO NURSING VALUES (4,2);
INSERT INTO NURSING VALUES (5,3);
INSERT INTO NURSING VALUES (6,4);
INSERT INTO NURSING VALUES (7,7);
INSERT INTO NURSING VALUES (8,8);
INSERT INTO NURSING VALUES (9,9);
INSERT INTO NURSING VALUES (10,10);
INSERT INTO NURSING VALUES (10,9);
INSERT INTO NURSING VALUES (9,2);
INSERT INTO NURSING VALUES (7,1);

CREATE TABLE IF NOT EXISTS DEPARTMENT(
    Department_name CHAR(30) NOT NULL,
    Location INT NOT NULL ,/*the int refers to the floor number of department*/
    PRIMARY KEY (Department_name)
);
INSERT INTO DEPARTMENT VALUES ('Dental',0);
INSERT INTO DEPARTMENT VALUES ('Cardiology',1);
INSERT INTO DEPARTMENT VALUES ('Eye',1);
INSERT INTO DEPARTMENT VALUES ('Homeopathy',2);
INSERT INTO DEPARTMENT VALUES ('Surgery',2);
INSERT INTO DEPARTMENT VALUES ('ENT',0);
/*remember to use belongs_to to assign department to doctor*/
CREATE TABLE IF NOT EXISTS BELONGS_TO(
    Doctor_ID INT NOT NULL,
    Department_name CHAR(30) NOT NULL ,
    PRIMARY KEY (Doctor_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR_DETAILS(Doctor_ID) ,
    FOREIGN KEY (Department_name) REFERENCES DEPARTMENT(Department_name)
);
INSERT INTO BELONGS_TO VALUES (1,'Dental');
INSERT INTO BELONGS_TO VALUES (2,'Cardiology');
INSERT INTO BELONGS_TO VALUES (3,'Eye');
INSERT INTO BELONGS_TO VALUES (4,'Homeopathy');
INSERT INTO BELONGS_TO VALUES (5,'Surgery');
INSERT INTO BELONGS_TO VALUES (6,'ENT');
INSERT INTO BELONGS_TO VALUES (7,'Dental');
INSERT INTO BELONGS_TO VALUES (8,'Cardiology');
INSERT INTO BELONGS_TO VALUES (9,'Eye');
INSERT INTO BELONGS_TO VALUES (10,'Surgery');
/*remember to use supervises to assign a doctor to a nurse*/
CREATE TABLE IF NOT EXISTS SUPERVISES(
    Nurse_ID INT NOT NULL,
    Doctor_ID INT NOT NULL ,
    PRIMARY KEY (Nurse_ID) ,
    FOREIGN KEY (Nurse_ID) REFERENCES NURSE_DETAILS(Nurse_ID) ,
    FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR_DETAILS(Doctor_ID)
);
INSERT INTO SUPERVISES VALUES (1,1);
INSERT INTO SUPERVISES VALUES (2,3);
INSERT INTO SUPERVISES VALUES (3,5);
INSERT INTO SUPERVISES VALUES (4,6);
INSERT INTO SUPERVISES VALUES (5,7);
INSERT INTO SUPERVISES VALUES (7,8);
INSERT INTO SUPERVISES VALUES (6,9);
INSERT INTO SUPERVISES VALUES (8,10);
INSERT INTO SUPERVISES VALUES (9,10);
INSERT INTO SUPERVISES VALUES (10,10);

CREATE TABLE IF NOT EXISTS HOD(
    HOD_ID INT NOT NULL,
    PRIMARY KEY (HOD_ID),
    FOREIGN KEY (HOD_ID) REFERENCES DOCTOR_DETAILS(Doctor_ID)
);
INSERT INTO HOD VALUES (1);
INSERT INTO HOD VALUES (2);
INSERT INTO HOD VALUES (3);
INSERT INTO HOD VALUES (4);
INSERT INTO HOD VALUES (5);
INSERT INTO HOD VALUES (6);
/*remember to use heads to assign a department to hod*/
CREATE TABLE IF NOT EXISTS HEADS(
    HOD_ID INT NOT NULL ,
    Department_name CHAR(30) NOT NULL ,
    PRIMARY KEY (HOD_ID) ,
    FOREIGN KEY (HOD_ID) REFERENCES HOD(HOD_ID) ,
    FOREIGN KEY (Department_name) REFERENCES DEPARTMENT(Department_name)
);
INSERT INTO HEADS VALUES (1,'Dental');
INSERT INTO HEADS VALUES (2,'Cardiology');
INSERT INTO HEADS VALUES (3,'Eye');
INSERT INTO HEADS VALUES (4,'Homeopathy');
INSERT INTO HEADS VALUES (5,'Surgery');
INSERT INTO HEADS VALUES (6,'ENT');

CREATE TABLE IF NOT EXISTS BOARD_OF_MEMBERS(
    Member_ID INT NOT NULL AUTO_INCREMENT ,
    Teams CHAR(30) NOT NULL ,/*can be multiple separated by commas, eg. Hiring, Finance*/
    PRIMARY KEY (Member_ID)
);
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Hiring');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Hiring');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Management');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Sanitisation');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Management');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Reception');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Reception');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Administration');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Sanitisation');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Pharmacy');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Laboratory');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Intensive Care Unit');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Pharmacy');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Laboratory');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Pharmacy');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Laboratory');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Intensive Care Unit');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Radiology');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Waste Management Team');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Radiology');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Waste Management Team');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Radiology');
INSERT INTO BOARD_OF_MEMBERS(Teams) VALUES ('Sterlising');

CREATE TABLE IF NOT EXISTS Oversees(
    Department_name CHAR(20) NOT NULL ,
    Member_ID INT NOT NULL ,
    PRIMARY KEY (Member_ID) ,
    FOREIGN KEY (Member_ID) REFERENCES BOARD_OF_MEMBERS(Member_ID) ,
    FOREIGN KEY (Department_name) REFERENCES DEPARTMENT(Department_name)
);
INSERT INTO Oversees VALUES ('Dental',1);
INSERT INTO Oversees VALUES ('Cardiology',2);
INSERT INTO Oversees VALUES ('Eye',3);
INSERT INTO Oversees VALUES ('Homeopathy',4);
INSERT INTO Oversees VALUES ('Surgery',5);
INSERT INTO Oversees VALUES ('ENT',6);
INSERT INTO Oversees VALUES ('Cardiology',7);
INSERT INTO Oversees VALUES ('ENT',8);
INSERT INTO Oversees VALUES ('Dental',9);
INSERT INTO Oversees VALUES ('Eye',10);
INSERT INTO Oversees VALUES ('ENT',11);
INSERT INTO Oversees VALUES ('Homeopathy',12);
INSERT INTO Oversees VALUES ('Surgery',13);
INSERT INTO Oversees VALUES ('Dental',14);
INSERT INTO Oversees VALUES ('Cardiology',15);
INSERT INTO Oversees VALUES ('Eye',16);
INSERT INTO Oversees VALUES ('Homeopathy',17);
INSERT INTO Oversees VALUES ('Surgery',18);
INSERT INTO Oversees VALUES ('ENT',19);
INSERT INTO Oversees VALUES ('Cardiology',20);
INSERT INTO Oversees VALUES ('ENT',21);
INSERT INTO Oversees VALUES ('Dental',22);
INSERT INTO Oversees VALUES ('Eye',23);

/*statements to insert values have already been written*/

/*Queries to update values*/

/*1. To update Patient's address given name*/

/*UPDATE PATIENT SET Address='new_address' WHERE Name='given_name';*/

/*2. To update patient's doctor in case a doctor refers another doctor given patient's prescription number*/

/*UPDATE TREATS SET Doctor_ID=new_id WHERE Prescription_number=given_number;*/

/*3. To update supervises relationship between doctor and nurse given nurse id*/

/*UPDATE SUPERVISES SET Doctor_ID=new_id WHERE Nurse_ID=given;*/

/*4. To update oversees relationship between department and board of members given member id*/

/*UPDATE Oversees SET Department_name='new_department' WHERE  Member_ID=given;*/

/*Queries to retrieve information*/

/*From point of view of doctor given doctor_id*/

/*To get his/her patients details*/

SELECT Name, Age, Gender, PATIENT.Prescription_number, COVID
FROM PATIENT,TREATS
WHERE TREATS.Doctor_ID=5
AND PATIENT.Prescription_number=TREATS.Prescription_number;

/*To get details of nurses working under him*/

SELECT Name, (YEAR(CURDATE())-year_of_joining) AS Work_Experience
FROM NURSE_DETAILS, SUPERVISES
WHERE SUPERVISES.Doctor_ID=5
AND SUPERVISES.Nurse_ID=NURSE_DETAILS.Nurse_ID;

/*To get location of his/her department*/

SELECT Location AS Floor_Number
FROM DEPARTMENT, BELONGS_TO
WHERE BELONGS_TO.Doctor_ID=5
AND DEPARTMENT.Department_name=BELONGS_TO.Department_name;

/*To get HOD's name of his department*/

SELECT Name FROM DOCTOR_DETAILS,BELONGS_TO, HEADS
WHERE BELONGS_TO.Doctor_ID=5
AND BELONGS_TO.Department_name=HEADS.Department_name
AND DOCTOR_DETAILS.Doctor_ID=HEADS.HOD_ID;

/*From point of view of patient given prescription number*/

/*To get his doctor's details*/

SELECT Name, OPD_TIMINGS
FROM DOCTOR_DETAILS, DOCTOR_PAY, TREATS
WHERE TREATS.Prescription_number=2
AND TREATS.Doctor_ID=DOCTOR_DETAILS.Doctor_ID
AND DOCTOR_PAY.DOCTOR_ID=DOCTOR_DETAILS.Doctor_ID;

/*To get his department's location*/

SELECT Location FROM DEPARTMENT, TREATS, BELONGS_TO
WHERE TREATS.Prescription_number=2
AND TREATS.Doctor_ID=BELONGS_TO.Doctor_ID
AND BELONGS_TO.Department_name=DEPARTMENT.Department_name;

/*From point of view of a nurse given nurse ID*/

/*To get Patients' details that a nurse nurses*/

SELECT Name, PATIENT.Prescription_number, Age
FROM PATIENT, NURSING
WHERE NURSING.Nurse_ID=2
AND PATIENT.Prescription_number=NURSING.Prescription_number;

/*To get the details of doctor under which the nurse is working*/

SELECT Name, Department_name, OPD_Timings
FROM DOCTOR_DETAILS, DOCTOR_PAY, BELONGS_TO, SUPERVISES
WHERE SUPERVISES.Nurse_ID=3
AND DOCTOR_DETAILS.Doctor_ID=SUPERVISES.Doctor_ID
AND BELONGS_TO.Doctor_ID=SUPERVISES.Doctor_ID
AND DOCTOR_PAY.DOCTOR_ID=SUPERVISES.Doctor_ID;

/*From point of view of Board of Members*/

/*To get id of members of a particular team*/

SELECT Member_ID FROM BOARD_OF_MEMBERS WHERE Teams='Hiring';

/*To get list of departments*/

SELECT * FROM DEPARTMENT;

/*To get list of HODs of all departments*/

SELECT Department_name, Name FROM HEADS, DOCTOR_DETAILS WHERE HEADS.HOD_ID=DOCTOR_DETAILS.Doctor_ID;

/*To get list of all doctors*/

SELECT *
FROM (DOCTOR_DETAILS INNER JOIN DOCTOR_PAY ON DOCTOR_DETAILS.Doctor_ID = DOCTOR_PAY.DOCTOR_ID)
INNER JOIN BELONGS_TO ON BELONGS_TO.Doctor_ID=DOCTOR_DETAILS.Doctor_ID;

/*Other queries*/

/*To get ages of doctors*/

SELECT YEAR(CURDATE())-YEAR(DOB) AS Age, Name FROM DOCTOR_DETAILS;

/*To get ages of all nurses*/

SELECT YEAR(CURDATE())-YEAR(DOB) AS Age, Name FROM NURSE_DETAILS;

/*To get number of doctors in the hospital*/

SELECT COUNT(*) FROM DOCTOR_DETAILS;

/*To get number of nurses in the hospital*/

SELECT COUNT(*) FROM NURSE_DETAILS;

/*To get number of patients in the hospital*/

SELECT COUNT(*) FROM PATIENT;

/*To get list of all nurses*/

SELECT * FROM NURSE_DETAILS;

/*To get list of covid-19 patients in hospital*/

SELECT * FROM PATIENT WHERE COVID='Y';

/*To get list of doctors treating COVID patients. We assume only ENT doctors treat COVID patients*/

SELECT * FROM DOCTOR_DETAILS, BELONGS_TO
WHERE BELONGS_TO.Department_name='ENT'
AND BELONGS_TO.Doctor_ID=DOCTOR_DETAILS.Doctor_ID;

/*To get list of COVID Patients state wise*/

SELECT CASE
            WHEN LOWER(Address) LIKE '%punjab%' THEN 'Punjab'
            WHEN LOWER(Address) LIKE '%uttar%' THEN 'Uttar Pradesh'
            WHEN LOWER(Address) LIKE '%haryana%' THEN 'Haryana'
            WHEN LOWER(Address) LIKE '%madhya%' THEN 'Madhya Pradesh'/*other states can be added similarly*/
       END AS State , COUNT(*) FROM PATIENT WHERE COVID='Y' GROUP BY State;

