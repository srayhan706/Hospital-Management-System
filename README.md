  Hospital Management System
Submitted To :
Dr. Md. Mustafizur Rahman
Dr. Muhammad Ibrahim
Submitted By : Shariful Islam Rayhan(Roll : 41)
Department of Computer Science Engineering University of Dhaka

 Project Title : Healthcare Management System Project Area Major : Health
Project Area Minor :Hospital Management Brief Description of the Database :
The database is designed to facilitate the management of a healthcare system, encompassing various entities such as departments, staff, patients, doctors, appointments, medical records, medications, and payments. It aims to streamline operations, ensure accurate patient records, and facilitate efficient scheduling and treatment processes within a medical facility.
Detailed Description of the Database
The database comprehensively covers:
1. Departments: Captures different functional units within the hospital.
2. Hospital Staff: Manages staff details, including roles, contact
information, and affiliations with departments.
3. Users: Tracks system users, their access levels, and links them to
staff records for authentication.
4. Patients: Stores patient information, including contact details and
emergency contacts.
5. Doctors: Details about doctors, their specialties, availability, and
contact information.
6. Appointments: Manages scheduled appointments between patients
and doctors.
7. Medical Records: Records diagnoses, prescriptions, test results,
and updates made by doctors for patients.
8. Medications: Tracks prescribed medications, dosages, frequencies,
and duration for patients.

 9. Payments: Handles financial transactions linked to patient billing and payments.
The database establishes relationships between these entities, ensuring data integrity and facilitating efficient querying for tasks like scheduling appointments, accessing patient history, managing medications, and handling payments. The system caters to administrative, clinical, and financial aspects of healthcare management, enhancing overall operational efficiency and patient care.
Expected Query Results
1.Patient Medical Records and Associated Doctors SELECT M.RecordID,M.PatientID,M.Diagnosis,D.DoctorName FROM MedicalRecords as M
INNER JOIN Doctors as D ON M.DoctorID = D.DoctorID;
 
 2.Total Appointments per Doctor (with Doctor details)
SELECT D.DoctorID, D.DoctorName,
COUNT(A.AppointmentID) AS TotalAppointments
FROM Doctors as D LEFT JOIN Appointments as A ON D.DoctorID = A.DoctorID GROUP BY D.DoctorID, D.DoctorName;
3.Total Payments per Payment Method
SELECT P.PaymentMethod, SUM(P.Amount) AS TotalAmount FROM Payments as P
GROUP BY P.PaymentMethod;
 
  4.List of Patients and Their Appointments
SELECT P.PatientID, P.PatientName, A.AppointmentID, A.AppointmentDate FROM Patients as P
LEFT JOIN Appointments as A ON P.PatientID = A.PatientID;
 
 5.Appointments and Associated Doctors
SELECT A.AppointmentID, A.AppointmentDate, D.DoctorID, D.DoctorName FROM Appointments as A
LEFT JOIN Doctors as D ON A.DoctorID = D.DoctorID;
 
 6.Doctor Details and Their Specializations:
SELECT DoctorID, DoctorName, Specialization FROM Doctors;
 
 List Of Tables With Schema:
1. Departments (DepartmentID,DepartName,Description )
2. HospitalStaff (StaffID,StaffName,Gender,StaffDOB,StaffContact,Address,JobTitle, DepartmentID)
3. Users (UserID,UserName,Password,UserType,EmployeeID)
4. Patients(PatientID,PatientName,Gender,PatientDOB,PatientContact,
Address,EmergencyContact )
5. Doctors(DoctorID,DoctorName,Gender,DoctorContact,Specialization, AvailableDays,OfficeHours)
6. Appointments (AppointmentID,PatientID,DoctorID,AppointmentDate,StartTime, Status)
7. MedicalRecords(RecordID,PatientID,DoctorID,UpdateDate,Diagnosis, Prescription,TestResults)
8. Medications (MedicationID,MedicationName,Dosage,Frequency,StartDate,EndDat e,PatientID,DoctorID)
9. Payments (PaymentID,PatientID,Amount,PaymentDate,PaymentMethod)

 ER Diagram:
 
 Table Schema: 1. Departments
      Attribute Name
Data Type
Constraints
Comments
DepartmentID
INT
PRIMARY KEY
DepartmentName
VARCHAR(50)
NOT NULL
Description
VARCHAR(255)
DEFAULT NULL
    1. Stores information about different departments within the hospital. 2. Used for categorizing staff, managing department-specific details,
and organizing the workforce.
2.HospitalStaff
      Attribute Name
Data Type
Constraints
Comments
StaffID
INT
PRIMARY KEY
StaffName
VARCHAR(50)
NOT NULL
Gender
VARCHAR(50)
NOT NULL
StaffDOB
DATE
NOT NULL
StaffContact
VARCHAR(15)
Address
VARCHAR(255)
DEFAULT NULL
JobTitle
VARCHAR(50)
NOT NULL
DepartmentID
INT
FOREIGN KEY
REFERENCES HospitalStaff(StaffID)
         1. Stores details of hospital staff including doctors, nurses, administrators, etc.
2. Used for managing staff information, job titles, departments they work in, and contact details.

 3.Users
 Attribute Name
Data Type
Constraints
Comments
UserID
INT
PRIMARY KEY
UserName
VARCHAR(50)
NOT NULL
Password
VARCHAR(255)
NOT NULL
UserType
VARCHAR(20)
NOT NULL
EmployeeID
INT
FOREIGN KEY
REFERENCES HospitalStaff(StaffID)
           1. Stores user credentials for accessing the system.
2. Used for authentication and authorization purposes, linking user
accounts to corresponding staff members.
4.Patients
      Attribute Name
Data Type
Constraints
Comments
PatientID
INT
PRIMARY KEY
PatientName
VARCHAR(50)
NOT NULL
Gender
VARCHAR(10)
NOT NULL
PatientDOB
DATE
NOT NULL
PatientContact
VARCHAR(15)
NOT NULL
Address
VARCHAR(255)
DEFAULT NULL
EmergencyContact
VARCHAR(15)
        1. Stores information about patients admitted to the hospital. 2. Used for managing patient data, including personal details,
contacts, and emergency information.

 5.Doctors
 Attribute Name
Data Type
Constraints
Comments
DoctorID
INT
PRIMARY KEY
DoctorName
VARCHAR(50)
NOT NULL
Gender
VARCHAR(255)
DoctorContact
VARCHAR(15)
NOT NULL
Specialization
VARCHAR(50)
DEFAULT NULL
AvailableDays
VARCHAR(50)
NOT NULL
OfficeHours
VARCHAR(50)
             1. Stores information specifically related to doctors.
2. Used for managing doctor details, including specialization, contact
information, availability, and office hours.
6.Appointments
      Attribute Name
Data Type
Constraints
Comments
AppointID
INT
PRIMARY KEY
PatientID
INT
FOREIGN KEY
REFERENCES Patients(PatientID)
DoctorID
INT
FOREIGN KEY
REFERENCES Doctors(DoctorID)
AppointmentDate
DATE
StartTime
TIME
Status
VARCHAR(20)
       1. Stores scheduled appointments between patients and doctors.
2. Used for tracking appointments, including date, time, patient, doctor,
and appointment status.

 7.MedicalRecords
 Attribute Name
Data Type
Constraints
Comments
RecordID
INT
PRIMARY KEY
PatientID
INT
FOREIGN KEY
REFERENCES Patients(PatientID)
DoctorID
INT
FOREIGN KEY
REFERENCES Doctors(DoctorID)
UpdateDate
DATE
Diagnosis
VARCHAR(255)
Prescription
VARCHAR(255)
TestResults
VARCHAR(255)
             1. Stores medical records of patients including diagnoses, prescriptions, and test results.
2. Used for maintaining a history of medical interactions between patients and doctors.
8.Medications
      Attribute Name
Data Type
Constraints
Comments
MedicationID
INT
PRIMARY KEY
MedicationName
VARCHAR(50)
Dosage
VARCHAR(50)
Frequency
VARCHAR(50)
StartDate
DATE
EndDate
DATE
PatientID
INT
FOREIGN KEY
REFERENCES Patients(PatientID)
DoctorID
INT
FOREIGN KEY
REFERENCES Doctors(DoctorID)
         
 1. Stores medical records of patients including diagnoses, prescriptions, and test results.
2. Used for tracking medication details such as name, dosage, frequency, start/end dates, patient, and doctor.
9.Payments
      Attribute Name
Data Type
Constraints
Comments
PaymentID
INT
PRIMARY KEY
PatientID
INT
FOREIGN KEY
REFERENCES Patients(PatientID)
Amount
DECIMAL(10,2)
PaymentDate
DATE
PaymentMethod
VARCHAR(50)
      1. Stores payment details for patient transactions.
2. Used for managing and tracking payments made by patients,
including the amount, date, and payment method

 Functional Dependencies:
1. Patient Table (Patients):
○ PatientID->PatientName, Gender, PatientDOB,
         PatientContact, Address, EmergencyContact
○ PatientName->PatientID
○ PatientContact->PatientID, PatientName
2. Doctor Table (Doctors):
○ DoctorID->DoctorName, Gender, DoctorContact,
         Specialization, AvailableDays, OfficeHours
○ DoctorName->DoctorID
○ DoctorContact->DoctorID, DoctorName
3. HospitalStaff Table (HospitalStaff):
○ StaffID->StaffName, Gender, StaffDOB,
         StaffContact, Address, JobTitle, DepartmentID
○ StaffName->StaffID
○ StaffContact->StaffID, StaffName
4. Appointments Table (Appointments):
○ AppointmentID->PatientID, DoctorID,
         AppointmentDate, StartTime, Status
○ PatientID, AppointmentDate->AppointmentID
○ DoctorID, AppointmentDate->AppointmentID

 5. MedicalRecords Table (MedicalRecords):
○ RecordID->PatientID, DoctorID, UpdateDate,
      Diagnosis, Prescription, TestResults
○ PatientID, UpdateDate->RecordID
○ DoctorID, UpdateDate->RecordID
6. Medications Table (Medications):
○ MedicationID->MedicationName, Dosage,
      Frequency, StartDate, EndDate, PatientID,
DoctorID
○ PatientID, StartDate->MedicationID
○ DoctorID, StartDate->MedicationID
7. Payments Table (Payments):
○ PaymentID->PatientID, Amount, PaymentDate,
      PaymentMethod
○ PatientID, PaymentDate->PaymentID

 SQLs to implement the project:
1.
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50) NOT NULL, Description VARCHAR(255) DEFAULT NULL
);
2.
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

 3.
CREATE TABLE Users (
UserID INT PRIMARY KEY,
UserName VARCHAR(50) NOT NULL,
Password VARCHAR(255) NOT NULL, -- Hashed and salted password UserType VARCHAR(20) NOT NULL,
EmployeeID INT, -- Foreign Key referencing HospitalStaff(StaffID) FOREIGN KEY (EmployeeID) REFERENCES HospitalStaff(StaffID)
);
4.
CREATE TABLE Patients (
PatientID INT PRIMARY KEY, PatientName VARCHAR(50) NOT NULL, Gender VARCHAR(10),
PatientDOB DATE NOT NULL, PatientContact VARCHAR(15) NOT NULL, Address VARCHAR(255) DEFAULT NULL, EmergencyContact VARCHAR(15)
);

 5.
CREATE TABLE Doctors (
DoctorID INT PRIMARY KEY,
DoctorName VARCHAR(50) NOT NULL, Gender VARCHAR(10),
DoctorContact VARCHAR(15) NOT NULL, Specialization VARCHAR(50) DEFAULT NULL, AvailableDays VARCHAR(50) NOT NULL, OfficeHours VARCHAR(50)
);
6.
CREATE TABLE Appointments (
AppointmentID INT PRIMARY KEY, PatientID INT,
DoctorID INT,
AppointmentDate DATE,
StartTime TIME,
Status VARCHAR(20),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

 7.
CREATE TABLE MedicalRecords ( RecordID INT PRIMARY KEY, PatientID INT,
DoctorID INT,
UpdateDate DATE,
Diagnosis VARCHAR(255),
Prescription VARCHAR(255),
TestResults VARCHAR(255),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
8.
CREATE TABLE Medications ( MedicationID INT PRIMARY KEY, MedicationName VARCHAR(50), Dosage VARCHAR(20), Frequency VARCHAR(20), StartDate DATE,
EndDate DATE,
PatientID INT,
DoctorID INT,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),

 FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) );
9.
CREATE TABLE Payments (
PaymentID INT PRIMARY KEY,
PatientID INT,
Amount DECIMAL(10, 2),
PaymentDate DATE,
PaymentMethod VARCHAR(50),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
Table level and project level constraints
Table-Level Constraints:
1. PrimaryKeyConstraint:
○ Enforced on fields like ID columns in various tables (Patients,
Doctors, etc.) to ensure unique identification of records within those
tables.
2. ForeignKeyConstraint:
○ Used to maintain referential integrity between tables (e.g., DoctorID in
Appointments refers to DoctorID in Doctors). 3. NOTNULLConstraint:
○ Applied to fields that should not contain NULL values, such as PatientName and PatientDOB in the Patients table.
4. UniqueConstraint:
○ Imposed on fields that should have unique values, like UserName in the
Users table to ensure each username is distinct.

 5. CheckConstraint:
○ Utilized to enforce specific conditions on data entered into a table (e.g., ensuring a certain range of values, format, etc.).
Project-Level Constraints:
1. DataValidationRules:
○ Define standardized formats for data entry across the project (e.g., phone number format, date formats) to maintain consistency.
2. SecurityandAccessControl:
○ Enforce access privileges at different user levels (e.g., administrators, doctors, staff, patients) to control who can view, modify, or delete data.
3. DataEncryption:
○ Implement encryption methods, especially for sensitive data like passwords, medical records, and personal information to protect against unauthorized access.
4. AuditTrails:
○ Maintain logs of all transactions or modifications made in the system, ensuring accountability and traceability in case of data changes.
5. BackupandRecoveryPolicies:
○ Establish regular data backup procedures to prevent data loss and ensure the system's recoverability in case of failures or disasters.
6. ScalabilityandPerformanceGuidelines:
○ Define best practices to optimize database performance, accommodate growth in data volume, and ensure system scalability.
Normal Form :
The process of normalization in database design aims to minimize redundancy and dependency by organizing tables to meet certain normal forms. The Hospital Management System database comprises several tables that store information about departments, staff, patients, doctors, appointments, medical records, medications, payments, and user accounts.
1. First Normal Form (1NF):

 All tables in the database have met the requirements of 1NF by ensuring atomicity and eliminating repeating groups within columns. Each cell contains a single, indivisible value, and there are no composite or multivalued attributes.
2. Second Normal Form (2NF):
The tables have also satisfied the conditions of 2NF by meeting 1NF criteria and eliminating partial dependencies. All non-prime attributes are fully functionally dependent on the primary key, and there are no partial dependencies within the tables.
3. Third Normal Form (3NF):
The database tables have achieved 3NF by meeting 2NF criteria and ensuring the absence of transitive dependencies. No non-prime attribute depends on another non-prime attribute, and all columns are functionally dependent solely on the primary key.
Future Plan:
1. PerformanceOptimization:
○ Enhance database performance by indexing frequently queried columns,
optimizing queries, and potentially considering denormalization in specific
scenarios for performance gains. 2. DataSecurityEnhancement:
○ Implement advanced encryption techniques to secure sensitive patient and user data stored in the database, ensuring compliance with evolving data privacy regulations.
3. IntegratingAdditionalFunctionalities:
○ Expand the database to accommodate additional functionalities, such as
incorporating a billing system or integrating telemedicine features,
necessitating new tables or modifications to existing structures. 4. UserInterfaceDevelopment:
○ Develop a user-friendly interface for managing and interacting with the database, enabling seamless data entry, retrieval, and manipulation for hospital staff, doctors, and administrators.

 5. DataAnalysisandReporting:
○ Implement tools for data analysis and reporting to derive insights from
patient records, appointment trends, and financial data, aiding in decision-making processes.
Conclusion:
In conclusion, the Hospital Management System's database has been structured to ensure data is organized, accurate, and easy to manage. By following normalization principles, the tables are well-designed, reducing redundancy and errors. While the current setup meets essential requirements, future improvements could focus on performance, security, and expanding functionalities. Overall, the database serves as a strong foundation for efficient hospital operations and can be further enhanced for better performance and usability.

 
