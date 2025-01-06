-- Departments Table 100_
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Description VARCHAR(255) DEFAULT NULL
);

-- HospitalStaff Table 200_
CREATE TABLE HospitalStaff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    StaffDOB DATE NOT NULL,
    StaffContact VARCHAR(15),
    Address VARCHAR(255) DEFAULT NULL,
    JobTitle VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


-- Users Table 300_
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL, -- Hashed and salted password
    UserType VARCHAR(20) NOT NULL,
    EmployeeID INT, -- Foreign Key referencing HospitalStaff(StaffID)
    FOREIGN KEY (EmployeeID) REFERENCES HospitalStaff(StaffID)
);

-- Patients Table 400_
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    PatientDOB DATE NOT NULL,
    PatientContact VARCHAR(15) NOT NULL,
    Address VARCHAR(255) DEFAULT NULL,
    EmergencyContact VARCHAR(15)
);
-- Doctors Table 500_
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    DoctorContact VARCHAR(15) NOT NULL,
    Specialization VARCHAR(50) DEFAULT NULL,
    AvailableDays VARCHAR(50) NOT NULL,
    OfficeHours VARCHAR(50)
);

-- Appointments Table 600_
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    StartTime TIME,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- MedicalRecords Table  700_
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    UpdateDate DATE,
    Diagnosis VARCHAR(255),
    Prescription VARCHAR(255),
    TestResults VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Medications Table 800_
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(50),
    Dosage VARCHAR(20),
    Frequency VARCHAR(20),
    StartDate DATE,
    EndDate DATE,
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
-- Payments Table 900_
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);


-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName, Description) VALUES
    (1001, 'Emergency Medicine', 'Handles urgent and critical medical cases'),
    (1002, 'Cardiology', 'Specializes in heart-related issues'),
    (1003, 'Orthopedics', 'Deals with musculoskeletal system disorder'),
    (1004, 'Radiology', 'Uses medical imaging to diagnose and treat diseases'),
    (1005, 'Surgery', 'Performs surgical procedures for various conditions'),
    (1006, 'Obs and Gyno', 'Focuses on womens health and childbirth'),
    (1007, 'Pediatrics', 'Provides medical care for children'),
    (1008, 'IT', 'Manage All things of IT releated')
    ;


-- Inserting data into the HospitalStaff table
INSERT INTO HospitalStaff (StaffID, StaffName, Gender, StaffDOB, StaffContact, Address, JobTitle, DepartmentID)
VALUES
    (2001, 'John Smith', 'Male', '1980-05-15', '01234567890', '123 Main St, Cityville', 'Ward Boy', 1002),
    (2002, 'Alice Johnson', 'Female', '1985-10-22', '01987654321', '456 Oak St, Townsville', 'Nurse', 1003),
    (2003, 'Michael Davis', 'Male', '1990-03-08', '01122334455', '789 Pine St, Villagetown', 'Compounder', 1007),
    (2004, 'Emily White', 'Female', '1982-12-17', '01555099887', '101 Elm St, Hamletville', 'Junior Officer', 1001),
    (2005, 'Robert Miller', 'Male', '1988-07-03', '01449966330', '202 Cedar St, Boroughburg', 'Radiologist', 1004),
    (2006, 'Sarah Brown', 'Female', '1995-02-25', '01777888999', '303 Maple St, Villageburg', 'Surgery Assistant', 1005),
    (2007, 'Daniel Wilson', 'Male', '1987-09-14', '01666777888', '404 Birch St, Citytown', 'Surgery Assistant', 1005),
    (2008, 'Jessica Lee', 'Female', '1993-06-12', '01888999000', '505 Spruce St, Townberg', 'Record Keeper', 1007),
    (2009, 'Christopher Hall', 'Male', '1984-04-30', '01999888777', '606 Pine St, Hamlettown', 'Emergency Physician', 1001),
    (2010, 'Olivia Martinez', 'Female', '1991-11-10', '01222111333', '707 Oak St, Villagesburg', 'Administrator', 1006),
    (2011, 'Mustafizur Rahman', 'Male', '1981-11-10', '01547151333', 'Basabo,Dhaka-1215', 'Database Engineer', 1008),
    (2012, 'Olivia Martinez', 'Female', '1991-11-10', '01222568333', 'Kakrail,Dhaka-1230', 'Software Engineer', 1008),
    (2013, 'Olivia Martinez', 'Female', '1991-11-10', '01225811333', '', 'FrontEnd Developer', 1008);
    
    
    
INSERT INTO Users (UserID, UserName, Password, UserType, EmployeeID) VALUES
    (3001, 'mmr420', '42069', 'Admin', 2011),
    (3002, 'olive69', 'olive69', 'Soft. Eng.', 2012),
    (3003, 'martin', 'martin420', 'Fro. End Dev.', 2013);

    
-- Inserting data into the Patients table
INSERT INTO Patients (PatientID, PatientName, Gender, PatientDOB, PatientContact, Address, EmergencyContact)
VALUES
    (4001, 'Mary Johnson', 'Female', '1992-08-20', '01555123456', '123 Main St, Cityville', '01555767890'),
    (4002, 'David Smith', 'Male', '1980-04-12', '01888765432', '456 Oak St, Townsville', '01888990123'),
    (4003, 'Emma Davis', 'Female', '1995-12-05', '01666123456', '789 Pine St, Villagetown', '01666234567'),
    (4004, 'Ryan Miller', 'Male', '1987-02-18', '01777234567', '101 Elm St, Hamletville', '01777345678'),
    (4005, 'Sophia Wilson', 'Female', '1998-06-30', '01999345678', '202 Cedar St, Boroughburg', '01999456789'),
    (4006, 'Liam Brown', 'Male', '1984-10-15', '01222445678', '303 Maple St, Villageburg', '01222556789'),
    (4007, 'Ava Lee', 'Female', '1991-03-28', '01444123456', '404 Birch St, Citytown', '01444234567'),
    (4008, 'Ethan Hall', 'Male', '1989-09-10', '01666234567', '505 Spruce St, Townberg', '01666345678'),
    (4009, 'Olivia White', 'Female', '1993-11-25', '01888990123', '606 Pine St, Hamlettown', '01888101112'),
    (4010, 'Noah Martinez', 'Male', '1982-07-08', '01555767890', '707 Oak St, Villagesburg', '01555878901');
   
INSERT INTO Doctors (DoctorID, DoctorName, Gender, DoctorContact, Specialization, AvailableDays, OfficeHours) VALUES
    (5001, 'Dr. Rahman', 'Male', '01711223344', 'Cardiology', 'Monday, Wednesday, Friday', '9:00 AM - 5:00 PM'),
    (5002, 'Dr. Akhtar', 'Female', '01822334455', 'Orthopedics', 'Tuesday, Thursday', '8:00 AM - 4:00 PM'),
    (5003, 'Dr. Islam', 'Male', '01933445566', 'Emergency Medicine', 'Monday, Wednesday, Saturday', '10:00 AM - 6:00 PM'),
    (5004, 'Dr. Ali', 'Female', '01644556677', 'Pediatrics', 'Monday, Tuesday, Thursday', '9:00 AM - 3:00 PM'),
    (5005, 'Dr. Hussain', 'Male', '01755667788', 'Radiology', 'Wednesday, Friday', '8:00 AM - 2:00 PM'),
    (5006, 'Dr. Ahmed', 'Female', '01866778899', 'Surgery', 'Tuesday, Friday, Sunday', '10:00 AM - 6:00 PM'),
    (5007, 'Dr. Yasmin', 'Male', '01977889900', 'Obs and Gyno', 'Monday, Wednesday, Thursday', '9:00 AM - 5:00 PM'),
    (5008, 'Dr. Khan', 'Female', '01688990011', 'Cardiology', 'Tuesday, Thursday, Saturday', '8:00 AM - 4:00 PM'),
    (5009, 'Dr. Farooq', 'Male', '01799001122', 'Orthopedics', 'Monday, Wednesday, Friday', '10:00 AM - 6:00 PM'),
    (5010, 'Dr. Jahan', 'Female', '01800112233', 'Emergency Medicine', 'Monday, Tuesday, Thursday', '9:00 AM - 3:00 PM'),
    (5011, 'Dr. Chowdhury', 'Male', '01711223344', 'Radiology', 'Wednesday, Friday', '8:00 AM - 2:00 PM'),
    (5012, 'Dr. Nasreen', 'Female', '01822334455', 'Surgery', 'Tuesday, Friday, Sunday', '10:00 AM - 6:00 PM'),
    (5013, 'Dr. Ahmed', 'Male', '01933445566', 'Obs and Gyno', 'Monday, Wednesday, Thursday', '9:00 AM - 5:00 PM'),
    (5014, 'Dr. Karim', 'Female', '01644556677', 'Pediatrics', 'Monday, Tuesday, Thursday', '9:00 AM - 3:00 PM'),
    (5015, 'Dr. Rizvi', 'Male', '01755667788', 'Cardiology', 'Tuesday, Thursday, Saturday', '8:00 AM - 4:00 PM'),
    (5016, 'Dr. Haque', 'Female', '01866778899', 'Orthopedics', 'Monday, Wednesday, Friday', '10:00 AM - 6:00 PM'),
    (5017, 'Dr. Khan', 'Male', '01977889900', 'Emergency Medicine', 'Monday, Tuesday, Thursday', '9:00 AM - 3:00 PM'),
    (5018, 'Dr. Rahman', 'Female', '01688990011', 'Radiology', 'Wednesday, Friday', '8:00 AM - 2:00 PM'),
    (5019, 'Dr. Ahmed', 'Male', '01799001122', 'Surgery', 'Tuesday, Friday, Sunday', '10:00 AM - 6:00 PM'),
    (5020, 'Dr. Ali', 'Female', '01800112233', 'Obs and Gyno', 'Monday, Wednesday, Thursday', '9:00 AM - 5:00 PM');
    
    
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, StartTime, Status) VALUES
    (6001, 4001, 5003, '2023-11-15', '09:30:00', 'Scheduled'),
    (6002, 4002, 5002, '2023-11-16', '10:00:00', 'Scheduled'),
    (6003, 4003, 5003, '2023-11-17', '11:30:00', 'Scheduled'),
    (6004, 4004, 5009, '2023-11-18', '14:00:00', 'Scheduled'),
    (6005, 4005, 5005, '2023-11-19', '15:30:00', 'Scheduled'),
    (6006, 4006, 5006, '2023-11-20', '08:00:00', 'Scheduled'),
    (6007, 4007, 5007, '2023-11-21', '09:00:00', 'Scheduled'),
    (6008, 4008, 5008, '2023-11-22', '10:30:00', 'Scheduled'),
    (6009, 4009, 5009, '2023-11-23', '13:00:00', 'Scheduled'),
    (6010, 4010, 5005, '2023-11-24', '14:30:00', 'Scheduled'),
    (6011, 4001, 5003, '2023-11-25', '11:00:00', 'Scheduled'),
    (6012, 4002, 5012, '2023-11-26', '08:30:00', 'Scheduled'),
    (6013, 4003, 5015, '2023-11-27', '12:30:00', 'Scheduled'),
    (6014, 4004, 5015, '2023-11-28', '13:30:00', 'Scheduled'),
    (6015, 4005, 5015, '2023-11-29', '15:00:00', 'Scheduled'),
    (6016, 4006, 5018, '2023-11-30', '08:30:00', 'Scheduled'),
    (6017, 4007, 5017, '2023-12-01', '09:30:00', 'Scheduled'),
    (6018, 4008, 5018, '2023-12-02', '10:00:00', 'Scheduled'),
    (6019, 4009, 5019, '2023-12-03', '12:00:00', 'Scheduled'),
    (6020, 4010, 5020, '2023-12-04', '14:00:00', 'Scheduled');
    
INSERT INTO MedicalRecords (RecordID, PatientID, DoctorID, UpdateDate, Diagnosis, Prescription, TestResults) VALUES
    (7001, 4001, 5001, '2023-11-15', 'Hypertension', 'Medication A, Lifestyle changes', 'Blood pressure test normal'),
    (7002, 4006, 5002, '2023-11-16', 'Fractured Arm', 'Painkillers, Rest, Follow-up X-ray', 'X-ray shows healing progress'),
    (7003, 4003, 5003, '2023-11-17', 'Common Cold', 'Rest, Fluids, Cold medication', 'Recovered from cold symptoms'),
    (7004, 4004, 5020, '2023-11-18', 'Stomach Flu', 'Hydration, Anti-nausea medication', 'Recovered from stomach flu'),
    (7005, 4003, 5015, '2023-11-19', 'Allergic Reaction', 'Antihistamines, Avoid allergen', 'Allergic reaction resolved'),
    (7006, 4006, 5006, '2023-11-20', 'Appendicitis', 'Emergency surgery, Antibiotics', 'Successful appendix removal'),
    (7007, 4007, 5007, '2023-11-21', 'Pregnancy Checkup', 'Prenatal vitamins, Lifestyle advice', 'Healthy pregnancy progress'),
    (7008, 4008, 5008, '2023-11-22', 'High Cholesterol', 'Cholesterol-lowering medication, Diet changes', 'Improvement in cholesterol levels'),
    (7009, 4009, 5009, '2023-11-23', 'Sprained Ankle', 'Rest, Ice, Compression, Elevation (RICE)', 'Ankle healing well'),
    (7010, 4010, 5005, '2023-11-24', 'Migraine', 'Pain relievers, Stress management', 'Relief from migraine symptoms'),
    (7011, 4005, 5011, '2023-11-25', 'Lung Infection', 'Antibiotics, Respiratory therapy', 'Improvement in lung function'),
    (7012, 4002, 5012, '2023-11-26', 'Knee Injury', 'Physical therapy, Pain management', 'Gradual improvement in knee function'),
    (7013, 4003, 5015, '2023-11-27', 'Diabetes Management', 'Insulin, Blood sugar monitoring', 'Stable blood sugar levels'),
    (7014, 4004, 5014, '2023-11-28', 'Ear Infection', 'Antibiotic ear drops, Pain relief', 'Resolution of ear infection'),
    (7015, 4009, 5015, '2023-11-29', 'Asthma Control', 'Inhalers, Allergen avoidance', 'Improved asthma symptoms'),
    (7016, 4006, 5012, '2023-11-30', 'Gastric Ulcer', 'Antacids, Medication for stomach lining', 'Ulcer healing progress'),
    (7017, 4007, 5017, '2023-12-01', 'Pediatric Checkup', 'Vaccinations, Growth monitoring', 'Healthy child development'),
    (7018, 4008, 5019, '2023-12-02', 'Back Pain', 'Physical therapy, Pain management', 'Reduced back pain symptoms'),
    (7019, 4007, 5018, '2023-12-03', 'Anxiety', 'Therapy, Medication', 'Improved mental health'),
    (7020, 4010, 5001, '2023-12-04', 'Pneumonia Recovery', 'Antibiotics, Rest', 'Complete recovery from pneumonia');



INSERT INTO Medications (MedicationID, MedicationName, Dosage, Frequency, StartDate, EndDate, PatientID, DoctorID) VALUES
    (8001, 'Aspirin', '75mg', 'Once a day', '2023-11-15', '2023-12-15', 4001, 5007),
    (8002, 'Ibuprofen', '200mg', 'Twice a day', '2023-11-16', '2023-11-30', 4003, 5012),
    (8003, 'Amoxicillin', '500mg', 'Three times a day', '2023-11-17', '2023-11-25', 4003, 5013),
    (8004, 'Omeprazole', '20mg', 'Once a day', '2023-11-18', '2023-12-05', 4004, 5016),
    (8005, 'Loratadine', '10mg', 'Once a day', '2023-11-19', '2023-12-01', 4002, 5005),
    (8006, 'Acetaminophen', '500mg', 'As needed', '2023-11-20', '2023-11-30', 4006, 5012),
    (8007, 'Metformin', '850mg', 'Twice a day', '2023-11-21', '2023-12-10', 4004, 5007),
    (8008, 'Simvastatin', '40mg', 'Once a day', '2023-11-22', '2023-12-03', 4008, 5011),
    (8009, 'Prednisone', '5mg', 'Once a day', '2023-11-23', '2023-12-20', 4005, 5009),
    (8010, 'Sumatriptan', '50mg', 'As needed', '2023-11-24', '2023-12-05', 4007, 5006),
    (8011, 'Ventolin', '100mcg', 'As needed', '2023-11-25', '2023-12-08', 4010, 5003),
    (8012, 'Naproxen', '250mg', 'Twice a day', '2023-11-26', '2023-12-01', 4002, 5013),
    (8013, 'Insulin', '10 units', 'Twice a day', '2023-11-27', '2023-12-15', 4003, 5013),
    (8014, 'Ear Drops', '5 drops', 'Twice a day', '2023-11-28', '2023-12-05', 4004, 5014),
    (8015, 'Albuterol', '90mcg', 'As needed', '2023-11-29', '2023-12-10', 4005, 5015),
    (8016, 'Antacid', '1 tablet', 'Twice a day', '2023-11-30', '2023-12-08', 4009, 5016),
    (8017, 'Vitamin D', '1000 IU', 'Once a day', '2023-12-01', '2023-12-20', 4007, 5017),
    (8018, 'Muscle Relaxant', '10mg', 'As needed', '2023-12-02', '2023-12-15', 4005, 5018),
    (8019, 'Anti-anxiety Medication', '5mg', 'Once a day', '2023-12-03', '2023-12-25', 4009, 5002),
    (8020, 'Antibiotic Cream', 'Apply as needed', 'As needed', '2023-12-04', '2023-12-10', 4001, 5016);
    
INSERT INTO Payments (PaymentID, PatientID, Amount, PaymentDate, PaymentMethod) VALUES
    (9001, 4005, 25000.00, '2023-11-15', 'Credit Card'),
    (9002, 4002, 35000.00, '2023-11-16', 'Cash'),
    (9003, 4006, 30000.00, '2023-11-17', 'Bank Transfer'),
    (9004, 4007, 28000.00, '2023-11-18', 'Mobile Payment'),
    (9005, 4005, 40000.00, '2023-11-19', 'Online Payment');









   
    






