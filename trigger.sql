Trigger for 1 Maxpayment by cash


DELIMITER //

CREATE TRIGGER Payments_MaxAmount
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.PaymentMethod = 'Cash' AND NEW.Amount > 50000.00 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cash payment amount exceeds maximum allowed amount of 50,000.';
    END IF;
END //

DELIMITER ;



Trigger 2 For  AppointmentStatus


DELIMITER //

CREATE TRIGGER Appointments_SetStatus
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
    IF NEW.AppointmentDate < CURDATE() THEN
        SET NEW.Status = 'Ended';
    ELSE
        SET NEW.Status = 'Scheduled';
    END IF;
END;

//

DELIMITER ;


Trigger 3 for patients emgcont

DELIMITER //

CREATE TRIGGER PatDeftEmgcon
BEFORE INSERT ON Patients
FOR EACH ROW
BEGIN
    IF NEW.EmergencyContact IS NULL OR NEW.EmergencyContact = '' THEN
        SET NEW.EmergencyContact = 'Not Provided';
    END IF;
END;

//

DELIMITER ;



Trigger 4 for Medication Tables

DELIMITER //

CREATE TRIGGER Medications_SetEndDate
BEFORE INSERT ON Medications
FOR EACH ROW
BEGIN
    IF NEW.EndDate IS NULL AND NEW.StartDate IS NOT NULL THEN
        SET NEW.EndDate = DATE_ADD(NEW.StartDate, INTERVAL 30 DAY);
    END IF;
END;

//

DELIMITER ;



Trigger 5 For Hospital Staff

DELIMITER //

CREATE TRIGGER StaffAgeCal
BEFORE INSERT ON HospitalStaff
FOR EACH ROW
BEGIN
    DECLARE age INT;

    IF NEW.StaffDOB IS NOT NULL THEN
        SET age = YEAR(CURDATE()) - YEAR(NEW.StaffDOB);
        SET NEW.Age = age;
    END IF;
END;

//

DELIMITER ;



Trigger 6 for MedicalRecords

DELIMITER //

CREATE TRIGGER UpdtoToday
BEFORE INSERT ON MedicalRecords
FOR EACH ROW
SET NEW.UpdateDate = NOW();

//

DELIMITER ;









