query 1 for patients medical records and associated doctor

SELECT M.RecordID,M.PatientID,M.Diagnosis,D.DoctorName
FROM MedicalRecords as M
INNER JOIN Doctors as D ON M.DoctorID = D.DoctorID;


query 2 for total Appointments Per Doctor


SELECT D.DoctorID, D.DoctorName,COUNT(A.AppointmentID) AS TotalAppointments

FROM Doctors as D LEFT JOIN Appointments as A ON D.DoctorID = A.DoctorID

GROUP BY D.DoctorID, D.DoctorName;

query 3 for medicine count by doctor

select MedicationName,DoctorID,count(MedicationName)as cnt 
from Medications 
group by DoctorID,MedicationName 
order by DoctorID;


query 4 for total payments per payment method


SELECT P.PaymentMethod, SUM(P.Amount) AS TotalAmount
FROM Payments as P
GROUP BY P.PaymentMethod;



query 5 for list of patients and their all appointments


SELECT P.PatientID, P.PatientName, A.AppointmentID, A.AppointmentDate
FROM Patients as P
LEFT JOIN Appointments as A ON P.PatientID = A.PatientID;



query 6 for appointments and associated doctors

SELECT A.AppointmentID, A.AppointmentDate, D.DoctorID, D.DoctorName
FROM Appointments as A
right JOIN Doctors as D ON A.DoctorID = D.DoctorID;



query 7 for doctor details

SELECT DoctorID, DoctorName, Specialization
FROM Doctors;







