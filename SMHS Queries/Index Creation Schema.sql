USE Smart_Hospital_Management_System

-- Index for fast filtering by appointment time
CREATE NONCLUSTERED INDEX idx_AppointmentTime
ON appointments(AppointmentTime);
GO

-- Index for doctor lookups
CREATE NONCLUSTERED INDEX idx_DoctorID
ON appointments(DoctorID);
GO

-- Index for patient lookups
CREATE NONCLUSTERED INDEX idx_PatientID
ON appointments(PatientID);
GO

-- Index for soft delete check in patients
CREATE NONCLUSTERED INDEX idx_IsActive_Patients
ON patients(IsActive);
GO

-- Index for soft delete check in doctors
CREATE NONCLUSTERED INDEX idx_IsActive_Doctors
ON doctors(IsActive);
GO

-- Index for quick available bed checks
CREATE NONCLUSTERED INDEX idx_BedStatus
ON beds(BedStatus);
GO
