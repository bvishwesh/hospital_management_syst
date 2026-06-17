
--BED PROCEDURES

-- Insert a new bed (assumes the status is 'Available' by default)
EXEC dbo.AddBed 
    @Ward = N'ICU', 
    @BedStatus = N'Available', 
    @PatientID = NULL;  -- Assign NULL initially to indicate no patient is assigned


--PROCEDURES PROCEDURES

-- Insert a new patient
EXEC dbo.AddPatient 
    @PatientName = N'John Doe', 
    @Age = 28, 
    @Gender = N'Male', 
    @MedicalHistory = N'None', 
    @Username = N'john.doe123', 
    @UserPassword = N'password123';


-- Update the details of an existing patient
EXEC dbo.UpdatePatient 
    @PatientID = 8, 
    @PatientName = N'Shahbaz', 
    @Age = 29, 
    @Gender = N'Male', 
    @MedicalHistory = N'Updated History';


-- To soft delete a patient (mark as inactive)
EXEC dbo.SoftDeletePatient @PatientID = 3;  -- Replace with actual PatientID


--APPOINTMENT PROCEDURES

-- Insert a new appointment
EXEC dbo.AddAppointment 
    @PatientID = 2,  -- Replace with actual PatientID
    @DoctorID = 1,   -- Replace with actual DoctorID
    @AppointmentTime = '2025-05-30 10:00:00';


-- Update an existing appointment's time
EXEC dbo.UpdateAppointment 
    @AppointmentID = 10,  -- Replace with actual AppointmentID
    @AppointmentTime = '2025-05-30 14:00:00';


-- Cancel an appointment by ID
EXEC dbo.CancelAppointment @AppointmentID = 10;  -- Replace with actual AppointmentID


--DOCTOR PROCEDURES

-- Insert a new doctor
EXEC dbo.AddDoctor
    @DoctorName = N'Dr. Smith', 
    @Specialty = N'Cardiology', 
    @Availability = N'Morning',
	@Username = N'Doctor-1',
	@UserPassword = N'Doctor-1';


-- Update an existing doctor's details
EXEC dbo.UpdateDoctor 
    @DoctorID = 2,  -- Replace with actual DoctorID
    @DoctorName = N'Dr. John Smith', 
    @Specialty = N'Neurology', 
    @Availability = N'Afternoon';


-- Soft delete a doctor (mark as inactive)
EXEC dbo.SoftDeleteDoctor @DoctorID = 2;  -- Replace with actual DoctorID
