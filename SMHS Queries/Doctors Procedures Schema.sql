USE Smart_Hospital_Management_System


-- Stored Procedure: Add Doctor
GO
CREATE PROCEDURE AddDoctor
    @DoctorName NVARCHAR(100),
    @Specialty NVARCHAR(100),
    @Availability NVARCHAR(50),
    @Username NVARCHAR(100),
    @UserPassword NVARCHAR(255)
AS
BEGIN
    DECLARE @UserID INT;

    INSERT INTO users (UserRole, Username, UserPassword)
    VALUES ('doctor', @Username, @UserPassword);

    SET @UserID = SCOPE_IDENTITY();

    INSERT INTO doctors (DoctorName, Specialty, Availability, UserID)
    VALUES (@DoctorName, @Specialty, @Availability, @UserID);
END;
GO

-- Stored Procedure: Read Active Doctors
CREATE PROCEDURE ReadActiveDoctors
AS
BEGIN
    SELECT DoctorID, DoctorName, Specialty, Availability, UserID
    FROM doctors
    WHERE IsActive = 1;
END;
GO

-- Stored Procedure: Update Doctor
CREATE PROCEDURE UpdateDoctor
    @DoctorID INT,
    @DoctorName NVARCHAR(100),
    @Specialty NVARCHAR(100),
    @Availability NVARCHAR(50)
AS
BEGIN
    UPDATE doctors
    SET DoctorName = @DoctorName,
        Specialty = @Specialty,
        Availability = @Availability
    WHERE DoctorID = @DoctorID;
END;
GO

-- Stored Procedure: Soft Delete Doctor
CREATE PROCEDURE SoftDeleteDoctor
    @DoctorID INT
AS
BEGIN
    UPDATE doctors
    SET IsActive = 0
    WHERE DoctorID = @DoctorID;
END;
GO
