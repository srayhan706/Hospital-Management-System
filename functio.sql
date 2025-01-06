

function 1 for gettingpatientage

DELIMITER //

CREATE FUNCTION GetPatientAge(patID INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE age INT;
    
    SELECT YEAR(CURDATE()) - YEAR(PatientDOB) INTO age
    FROM Patients
    WHERE PatientID = patID;
    
    RETURN age;
END;

//

DELIMITER ;




fucntion 2 for getting totalapointnumbers of a doctor


DELIMITER //

CREATE FUNCTION GetTotAppForDoctOnDate(doctID INT, appDate DATE) RETURNS INT READS SQL DATA
BEGIN
    DECLARE totalAppointments INT;

    SELECT COUNT(*) INTO totalAppointments
    FROM Appointments
    WHERE DoctorID = doctID AND DATE(AppointmentDate) = DATE(appDate);

    RETURN totalAppointments;
END;

//

DELIMITER ;


function 3 for cnting doctor by specialziation


DELIMITER //

CREATE FUNCTION GetDoctorsCountBySpecialization(spec VARCHAR(50)) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE doctorsCount INT;

    SELECT COUNT(*) INTO doctorsCount
    FROM Doctors
    WHERE Specialization = spec;

    RETURN doctorsCount;
END;

//

DELIMITER ;




