DROP TABLE appointmentFee;
DROP TABLE nurseAppointment;
DROP TABLE nurse;
DROP TABLE prescription;
DROP TABLE diagnosisRecord;
DROP TABLE medication;
DROP TABLE appointment;
DROP TABLE doctor;
DROP TABLE pet;
DROP TABLE petType;
DROP TABLE owner;

CREATE TABLE owner (
  ownerID NUMBER(10) PRIMARY KEY,
  name VARCHAR2(30) NOT NULL,
  address VARCHAR2(30) NOT NULL,
  birthday DATE
);
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0001, 'David', 'test road', '01-JAN-1991');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0002, 'Sam', 'test001 road', '02-FEB-1992');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0003, 'Craig', 'test002 road', '03-MAR-1993');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0004, 'George', 'test003 road', '04-APR-1993');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0005, 'Kylie', 'test004 road', '05-MAY-1993');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0006, 'Chabbu', 'test005 road', '05-JUN-1997');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0007, 'Sarah', 'test006 road', '05-JUL-1992');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0008, 'Gabby', 'test007 road', '05-AUG-1991');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0009, 'Chaima', 'Warrington', '28-OCT-1991');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0010, 'Claire', 'Kenyon Lane', '19-AUG-1991');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0011, 'Yassen', 'test007 road', '05-AUG-1999');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0012, 'Ahmed', 'test009 road', '05-AUG-2000');
INSERT INTO owner (ownerID, name, address, birthday) 
VALUES (0013, 'Ismail', 'test010 road', '05-AUG-2001');



CREATE TABLE petType (
  petTypeID NUMBER(10) PRIMARY KEY,
  name VARCHAR2(30) NOT NULL
);
INSERT INTO petType (petTypeID, name) VALUES (001, 'Alsation');
INSERT INTO petType (petTypeID, name) VALUES (002, 'Chiwawa');
INSERT INTO petType (petTypeID, name) VALUES (003, 'Bull dog');
INSERT INTO petType (petTypeID, name) VALUES (004, 'Terrier');
INSERT INTO petType (petTypeID, name) VALUES (005, 'Boxer');
INSERT INTO petType (petTypeID, name) VALUES (006, 'Dalmation');
INSERT INTO petType (petTypeID, name) VALUES (007, 'SheepWolf');
INSERT INTO petType (petTypeID, name) VALUES (008, 'Labrador');
INSERT INTO petType (petTypeID, name) VALUES (009, 'Shin Tzu');
INSERT INTO petType (petTypeID, name) VALUES (010, 'German Shepherd');
INSERT INTO petType (petTypeID, name) VALUES (011, 'Dachshund');
INSERT INTO petType (petTypeID, name) VALUES (012, 'Husky');
INSERT INTO petType (petTypeID, name) VALUES (013, 'Beagle');
INSERT INTO petType (petTypeID, name) VALUES (014, 'Poodle');


CREATE TABLE pet (
  petID NUMBER(4) GENERATED ALWAYS as IDENTITY(START with 1000 INCREMENT by 1) ,
  ownerID NUMBER(10) NOT NULL,
  petTypeID NUMBER(10) NOT NULL,
  name VARCHAR2(20) NOT NULL,
  gender CHAR(1) CHECK (gender IN ('M', 'F')),
  birthday DATE, -- we left the age validation to the application layer
  colour VARCHAR2(20),
  weight NUMBER(5,2),
  CONSTRAINT pk_pet PRIMARY KEY (petID),
  CONSTRAINT check_petID CHECK ( petID BETWEEN 1000 AND 3000),
  CONSTRAINT fk_pet_owner FOREIGN KEY (ownerID) REFERENCES owner (ownerID),
  CONSTRAINT fk_pet_type FOREIGN KEY (petTypeID) REFERENCES petType (petTypeID)
);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0001, 001, 'chappyDog', 'M', '05-MAY-2021', 'beige', 3);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0002, 002, 'chiwado', 'F', '05-MAR-2013', 'black', 1);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0003, 003, 'bullyTom', 'F', '05-MAY-2017', 'grey', 4.5);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0004, 004, 'terryToe', 'F', '05-SEP-2019', 'white', 1.2);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0005, 005, 'poody', 'M', '05-AUG-2015', 'black', 1);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0006, 006, 'dood', 'F', '05-AUG-2019', 'spotted', 7);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0007, 007, 'dood', 'M', '05-AUG-2012', 'brown', 10);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0005, 008, 'labbyDee', 'M', '05-DEC-2011', 'white', 11);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0005, 009, 'shiTzo', 'F', '05-DEC-2016', 'mixed brown', 1);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0008, 009, 'jake', 'M', '05-DEC-2020', 'geryish white', 4);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0005, 009, 'gotty', 'M', '05-DEC-2019', 'mixed brown', 1);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0009, 014, 'Nala', 'F', '05-DEC-2020', 'white and grey', 3);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0010, 008, 'Lala', 'F', '05-DEC-2018', 'golden', 5);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0011, 013, 'dodo', 'M', '05-OCT-2019', 'mixed brown', 3);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0012, 012, 'meow', 'F', '05-AUG-2020', 'brown', 3);
INSERT INTO pet (ownerID, petTypeID, name, gender, birthday, colour, weight)
VALUES (0013, 010, 'Woooe', 'M', '05-DEC-2020', 'white', 4);

CREATE TABLE doctor (
  doctorID NUMBER(10) PRIMARY KEY,
  name VARCHAR2(30) NOT NULL,
  officeNumber VARCHAR2(10),
  telephoneNumber VARCHAR2(11) NOT NULL,
  email VARCHAR2(30) NOT NULL,
  isFulltime CHAR(1) CHECK (isFulltime IN ('Y', 'N')),
  CONSTRAINT doctor_email UNIQUE (email)
);
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2200, 'Cleverly', '12', '07123456789', 'dr.c@noahs.com', 'N');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2201, 'Mike', '34', '07123456788', 'dr.m@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2202, 'Farraday', '34', '07123456787', 'dr.fn@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2203, 'Fred', '41', '07123456786', 'dr.fred@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2204, 'Watson', '1', '07123456785', 'dr.w@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2205, 'Freeman', '2', '07123456784', 'dr.free@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2206, 'Crowley', '10', '07123456783', 'dr.crow@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2207, 'Rahib', '16', '07123456782', 'dr.r@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2208, 'Smith', '16', '07123456792', 'dr.s@noahs.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2209, 'John Doe', '20', '07123456793', 'john.doe@example.com', 'N');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2210, 'Jane Smith', '18', '07123456794', 'jane.smith@example.com', 'Y');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2211, 'Alice Brown', '19', '07123456795', 'alice.brown@example.com', 'N');
INSERT INTO doctor (doctorID, name, officeNumber, telephoneNumber, email, isFulltime) 
VALUES (2212, 'Bob Johnson', '20', '07123456796', 'bob.johnson@example.com', 'Y');


CREATE TABLE appointment (
  appointmentID NUMBER(10) PRIMARY KEY,
  petID NUMBER(10) NOT NULL,
  doctorID NUMBER(10) NOT NULL,
  appointmentDate DATE, -- we left the date validation to the application layer
  appointmentTime NUMBER (5),
  isAttend CHAR(1) CHECK (isAttend IN ('Y', 'N')),
  appointmentFee NUMBER(2) CHECK (appointmentFee IN (10, 15, 20)),
  cancellationFee NUMBER(1) CHECK (cancellationFee IN (0, 5)),
  deferralNote VARCHAR2(100),
  isCancel CHAR(1) CHECK (isCancel IN ('Y', 'N')),
  CONSTRAINT fk_pet_appointment FOREIGN KEY (petID) REFERENCES pet (petID),
  CONSTRAINT fk_doctor_appointment FOREIGN KEY (doctorID) REFERENCES doctor (doctorID)
);
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0001, 1000, 2201, '04-SEP-2023', 13, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0002, 1003, 2200, '08-SEP-2023', 10, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0003, 1004, 2201, '18-SEP-2023', 15, 'Y', 15, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0004, 1001, 2202, '29-SEP-2023', 11, 'Y', 15, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0005, 1006, 2204, '21-AUG-2023', 12, 'Y', 20, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0006, 1002, 2203, '25-AUG-2023', 09, 'Y', 15, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0007, 1005, 2204, '25-AUG-2023', 16, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0008, 1008, 2202, '22-SEP-2023', 14, 'Y', 15, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0009, 1006, 2204, '9-OCT-2023', 08, 'Y', 20, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0010, 1007, 2203, '23-OCT-2023', 13, 'Y', 20, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0011, 1003, 2202, '25-SEP-2023', 12, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0012, 1010, 2207, '17-JUL-2023', 10, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0013, 1013, 2211, '27-OCT-2023', 16, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0014, 1011, 2211, '05-OCT-2023', 12, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0015, 1013, 2211, '30-OCT-2023', 10, 'Y', 10, 0, 'N/A', 'N');
INSERT INTO appointment (appointmentID, petID, doctorID, appointmentDate, appointmentTime, isAttend, appointmentFee, cancellationFee, deferralNote, isCancel)
VALUES (0016, 1015, 2211, '06-OCT-2023', 16, 'Y', 10, 0, 'N/A', 'N');

CREATE TABLE medication (
  medicationRequired VARCHAR2(30) PRIMARY KEY
);
INSERT INTO medication (medicationRequired) VALUES ('antibiotic');
INSERT INTO medication (medicationRequired) VALUES ('antipyretic');
INSERT INTO medication (medicationRequired) VALUES ('cough syrup');
INSERT INTO medication (medicationRequired) VALUES ('painkiller');
INSERT INTO medication (medicationRequired) VALUES ('steroid');

CREATE TABLE diagnosisRecord (
  diagnosisRecordID NUMBER(10) PRIMARY KEY,
  appointmentID NUMBER(10) NOT NULL,
  diagnosisDate DATE NOT NULL,
  diagnosis VARCHAR2(100),
  referralNote VARCHAR2(100),
  CONSTRAINT fk_diagnosisRecord_appointment FOREIGN KEY (appointmentID) REFERENCES appointment (appointmentID)
);
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105078, 0001, '06-SEP-2023', 'Needs socialisation treats', 'N/A');
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105091, 0011, '26-SEP-2023', 'Ultrasonic dental scaling in two weeks', 'N/A');
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105187, 0006, '01-SEP-2023', 'Needs socialisation treats & worming treatment', 'N/A');
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105235, 0009, '10-OCT-2023', 'Overgrown skin', 'N/A');

INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105100, 0012, '20-JUL-2023', 'Needs socialisation treats', 'N/A');
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105093, 0013, '29-OCT-2023', 'Ultrasonic dental scaling in two weeks', 'N/A');
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105179, 0014, '09-OCT-2023', 'Needs socialisation treats & worming treatment', 'N/A');
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105236, 0015, '01-NOV-2023', 'Overgrown skin', 'N/A');
INSERT INTO diagnosisRecord (diagnosisRecordID, appointmentID, diagnosisDate, diagnosis, referralNote)
VALUES (105176, 0016, '07-OCT-2023', 'Overgrown skin', 'N/A');


CREATE TABLE prescription (
  diagnosisRecordID NUMBER(10),
  medicationRequired VARCHAR2(30),
  prescriptionDate DATE,
  CONSTRAINT fk_prescription_medication FOREIGN KEY (medicationRequired) REFERENCES medication (medicationRequired),
  CONSTRAINT fk_prescription_diagnosisRecord FOREIGN KEY (diagnosisRecordID) REFERENCES diagnosisRecord (diagnosisRecordID),
  CONSTRAINT pk_prescription PRIMARY KEY (diagnosisRecordID, medicationRequired, prescriptionDate)
);
INSERT INTO prescription (diagnosisRecordID, medicationRequired, prescriptionDate)
VALUES (105078, 'antibiotic', '06-SEP-2023');
INSERT INTO prescription (diagnosisRecordID, medicationRequired, prescriptionDate)
VALUES (105091, 'antipyretic', '26-SEP-2023');
INSERT INTO prescription (diagnosisRecordID, medicationRequired, prescriptionDate)
VALUES (105187, 'painkiller', '01-SEP-2023');
INSERT INTO prescription (diagnosisRecordID, medicationRequired, prescriptionDate)
VALUES (105235, 'steroid', '10-OCT-2023');
INSERT INTO prescription (diagnosisRecordID, medicationRequired, prescriptionDate)
VALUES (105078, 'painkiller', '06-SEP-2023');

CREATE TABLE nurse (
  nurseID NUMBER(10) PRIMARY KEY,
  name VARCHAR2(30) NOT NULL
);
INSERT INTO nurse (nurseID, name) VALUES (0001, 'John');
INSERT INTO nurse (nurseID, name) VALUES (0002, 'Gabby');
INSERT INTO nurse (nurseID, name) VALUES (0003, 'Chabbu');
INSERT INTO nurse (nurseID, name) VALUES (0004, 'Sarah');
INSERT INTO nurse (nurseID, name) VALUES (0005, 'Kylie');

CREATE TABLE nurseAppointment (
  appointmentID NUMBER(10),
  nurseID NUMBER(10),
  CONSTRAINT pk_nurseAppointment PRIMARY KEY (appointmentID, nurseID),
  CONSTRAINT fk_nurseAppointment_appointment FOREIGN KEY (appointmentID) REFERENCES appointment(appointmentID),
  CONSTRAINT fk_nurseAppointment_nurse FOREIGN KEY (nurseID) REFERENCES nurse(nurseID)
);
INSERT INTO nurseAppointment (appointmentID, nurseID) VALUES (0001, 0002);
INSERT INTO nurseAppointment (appointmentID, nurseID) VALUES (0002, 0001);
INSERT INTO nurseAppointment (appointmentID, nurseID) VALUES (0003, 0003);
INSERT INTO nurseAppointment (appointmentID, nurseID) VALUES (0004, 0005);
INSERT INTO nurseAppointment (appointmentID, nurseID) VALUES (0005, 0003);

CREATE TABLE appointmentFee (
  appointmentFeeID NUMBER(10) PRIMARY KEY,
  age NUMBER(5) CHECK (age IN (5, 10, 12)),
  price NUMBER(2) CHECK (price IN (10, 15, 20))
);
INSERT INTO appointmentFee (appointmentFeeID, age, price) VALUES (001, 5, 10); 
INSERT INTO appointmentFee (appointmentFeeID, age, price) VALUES (002, 10, 15);
INSERT INTO appointmentFee (appointmentFeeID, age, price) VALUES (003, 12, 20);

-- Select statements from all tables
SELECT * FROM owner;
SELECT * FROM petType;
SELECT * FROM pet;
SELECT * FROM doctor;
SELECT * FROM appointment;
SELECT * FROM medication;
SELECT * FROM diagnosisRecord;
SELECT * FROM prescription;
SELECT * FROM nurse;
SELECT * FROM nurseAppointment;
SELECT * FROM appointmentFee;

-- Query 1
SELECT petID AS ID, name AS Name, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM birthday) AS Age FROM pet
WHERE UPPER(SUBSTR(name, 1, 1)) BETWEEN 'A' AND 'M'
ORDER BY petID DESC;

-- Query 2
SELECT doctor.doctorID, doctor.name, doctor.officeNumber, COUNT(appointmentID) as appointmentCount
FROM doctor
JOIN appointment ON doctor.doctorID = appointment.doctorID
WHERE doctor.isFulltime = 'N'
GROUP BY doctor.doctorID, doctor.name, doctor.officeNumber
HAVING COUNT(appointment.appointmentID) > 3;


-- Query 3
SELECT pet.petID, pet.name, COUNT(appointment.appointmentID) AS appointmentCount
FROM pet
JOIN appointment ON pet.petID = appointment.petID
WHERE appointment.appointmentDate BETWEEN '02-JAN-2023' AND '26-SEP-2023'
GROUP BY pet.petID, pet.name;

-- Query 4
SELECT pet.petID, pet.name, appointmentFee
FROM pet
JOIN appointment ON pet.petID = appointment.petID
WHERE appointment.appointmentFee < (SELECT AVG(appointmentFee) FROM appointment);

-- Query 5
SELECT doctor.doctorID, COUNT(appointment.appointmentID), pet.petID, pet.name, appointment.appointmentDate, diagnosisRecord.diagnosis
FROM doctor
JOIN appointment ON doctor.doctorID = appointment.doctorID
JOIN pet ON appointment.petID = pet.petID
JOIN diagnosisRecord ON appointment.appointmentID = diagnosisRecord.appointmentID
WHERE (diagnosisRecord.diagnosis LIKE '%socialisation%' OR diagnosisRecord.diagnosis LIKE '%dental%') AND appointment.appointmentDate <= ADD_MONTHS(SYSDATE, -1)
GROUP BY doctor.doctorID, pet.petID, pet.name, appointment.appointmentDate, diagnosisRecord.diagnosis;

-- Query 6
SELECT pet.petID
FROM pet
LEFT JOIN appointment ON pet.petID = appointment.petID
LEFT JOIN diagnosisRecord ON appointment.appointmentID = diagnosisRecord.appointmentID
WHERE appointment.appointmentID IS NULL
AND diagnosisRecord.diagnosisRecordID IS NULL;