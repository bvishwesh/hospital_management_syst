USE Smart_Hospital_Management_System


-- Stored Procedure: Add Appointment
GO
CREATE PROCEDURE AddAppointment
    @PatientID INT,
    @DoctorID INT,
    @AppointmentTime DATETIME
AS
BEGIN
    INSERT INTO appointments (PatientID, DoctorID, AppointmentTime)
    VALUES (@PatientID, @DoctorID, @AppointmentTime);
END;
GO

-- Stored Procedure: View Upcoming Appointments (next 24 hours)
CREATE PROCEDURE ViewUpcomingAppointments
AS
BEGIN
    SELECT 
        a.AppointmentID,
        p.PName AS PatientName,
        d.DoctorName,
        a.AppointmentTime
    FROM appointments a
    JOIN patients p ON a.PatientID = p.PatientID
    JOIN doctors d ON a.DoctorID = d.DoctorID
    WHERE a.AppointmentTime BETWEEN GETDATE() AND DATEADD(HOUR, 24, GETDATE())
    ORDER BY a.AppointmentTime ASC;
END;
GO

-- Stored Procedure: Cancel Appointment
CREATE PROCEDURE CancelAppointment
    @AppointmentID INT
AS
BEGIN
    DELETE FROM appointments
    WHERE AppointmentID = @AppointmentID;
END;
GO

GO
CREATE PROCEDURE dbo.UpdateAppointment
    @AppointmentID INT,
    @AppointmentTime DATETIME
AS
BEGIN
    UPDATE dbo.appointments
    SET AppointmentTime = @AppointmentTime
    WHERE AppointmentID = @AppointmentID;
END;
GO
