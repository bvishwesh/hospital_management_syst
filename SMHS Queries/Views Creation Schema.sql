USE Smart_Hospital_Management_System

-- View: Active Patients List
GO
CREATE VIEW vw_ActivePatients AS
SELECT PatientID, PName, Age, Gender, MedicalHistory
FROM patients
WHERE IsActive = 1;
GO

-- View: Available Beds
CREATE VIEW vw_AvailableBeds AS
SELECT BedID, Ward
FROM beds
WHERE BedStatus = 'Available';
GO

-- View: Upcoming Appointments (next 24 hrs)
CREATE VIEW vw_UpcomingAppointments AS
SELECT 
    a.AppointmentID,
    p.PName AS PatientName,
    d.DoctorName,
    a.AppointmentTime
FROM appointments a
JOIN patients p ON a.PatientID = p.PatientID
JOIN doctors d ON a.DoctorID = d.DoctorID
WHERE a.AppointmentTime BETWEEN GETDATE() AND DATEADD(HOUR, 24, GETDATE());
GO
