USE Smart_Hospital_Management_System

-- Stored Procedure: Add Patient
GO
CREATE PROCEDURE AddPatient
    @PName NVARCHAR(100),
    @Age INT,
    @Gender NVARCHAR(10),
    @MedicalHistory NVARCHAR(MAX),
    @Username NVARCHAR(100),
    @UserPassword NVARCHAR(255)
AS
BEGIN
    DECLARE @UserID INT;

    INSERT INTO users (UserRole, Username, UserPassword)
    VALUES ('patient', @Username, @UserPassword);

    SET @UserID = SCOPE_IDENTITY();

    INSERT INTO patients (PName, Age, Gender, MedicalHistory, UserID)
    VALUES (@PName, @Age, @Gender, @MedicalHistory, @UserID);
END;
GO

-- Stored Procedure: Read Active Patients
CREATE PROCEDURE ReadActivePatients
AS
BEGIN
    SELECT PatientID, PName, Age, Gender, MedicalHistory, UserID
    FROM patients
    WHERE IsActive = 1;
END;
GO

-- Stored Procedure: Update Patient
CREATE PROCEDURE UpdatePatient
    @PatientID INT,
    @PName NVARCHAR(100),
    @Age INT,
    @Gender NVARCHAR(10),
    @MedicalHistory NVARCHAR(MAX)
AS
BEGIN
    UPDATE patients
    SET PName = @PName,
        Age = @Age,
        Gender = @Gender,
        MedicalHistory = @MedicalHistory
    WHERE PatientID = @PatientID;
END;
GO

-- Stored Procedure: Soft Delete Patient
CREATE PROCEDURE SoftDeletePatient
    @PatientID INT
AS
BEGIN
    UPDATE patients
    SET IsActive = 0
    WHERE PatientID = @PatientID;
END;
GO
