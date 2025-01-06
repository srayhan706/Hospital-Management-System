Procedure 1 for payments

DELIMITER //

CREATE PROCEDURE CalculateTotalPayments(IN patientID INT)
BEGIN
    SELECT SUM(Amount)
    FROM Payments
    WHERE PatientID = patientID;
END //

DELIMITER ;


Procedure 2 for who has appointment available doctor by date


DELIMITER //

CREATE PROCEDURE GetAvailableDoctors(IN appointmentDate DATE)
BEGIN
    SELECT *
    FROM Doctors
    WHERE DoctorID NOT IN (
        SELECT DoctorID
        FROM Appointments
        WHERE AppointmentDate = appointmentDate AND Status = 'Scheduled'
    );
END //

DELIMITER ;


Procedure 3 for appointment of Patient

DELIMITER //

CREATE PROCEDURE GetAppofPatID(IN in_PatientID INT)
BEGIN
    SELECT P.PatientID, P.PatientName, A.AppointmentID, A.AppointmentDate
    FROM Patients AS P
    LEFT JOIN Appointments AS A ON P.PatientID = A.PatientID
    WHERE P.PatientID = in_PatientID;
END //

DELIMITER ;


Procedure 4 for totappointmentofalldoctor by date

DELIMITER //

CREATE PROCEDURE GetDocttotAppbydate(IN in_AppointmentDate DATE)
BEGIN
    SELECT Doctors.DoctorID, Doctors.DoctorName,
           COUNT(Appointments.AppointmentID) AS TotalAppointmentsForDate
    FROM Doctors
    LEFT JOIN Appointments ON Doctors.DoctorID = Appointments.DoctorID
    WHERE DATE(Appointments.AppointmentDate) = in_AppointmentDate
    GROUP BY Doctors.DoctorID, Doctors.DoctorName;
END //

DELIMITER ;


DELIMITER //


Procedure 5 for medical reports


DELIMITER //

CREATE PROCEDURE GetMedicalRecordsWithDoctorsProcedure()
BEGIN
    SELECT M.RecordID, M.PatientID, M.Diagnosis, D.DoctorName
    FROM MedicalRecords AS M
    INNER JOIN Doctors AS D ON M.DoctorID = D.DoctorID;
END //

DELIMITER ;




