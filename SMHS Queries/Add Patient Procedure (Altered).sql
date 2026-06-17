USE [Smart_Hospital_Management_System]
GO

ALTER PROCEDURE [dbo].[AddPatient]
    @PName NVARCHAR(100),
    @Age INT,
    @Gender NVARCHAR(10),
    @MedicalHistory NVARCHAR(MAX),
    @Username NVARCHAR(100),
    @UserPassword NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- Insert user
    INSERT INTO users (UserRole, Username, UserPassword)
    VALUES ('patient', @Username, @UserPassword);

    SET @UserID = SCOPE_IDENTITY();

    -- Open encryption key before inserting encrypted data
    OPEN SYMMETRIC KEY SymKey_Health
    DECRYPTION BY CERTIFICATE Cert_HealthData;

    -- Insert encrypted medical history
    INSERT INTO patients (PName, Age, Gender, MedicalHistory, UserID)
    VALUES (
        @PName,
        @Age,
        @Gender,
        ENCRYPTBYKEY(KEY_GUID('SymKey_Health'), CONVERT(VARBINARY(MAX), @MedicalHistory)),
        @UserID
    );

    -- Close the symmetric key
    CLOSE SYMMETRIC KEY SymKey_Health;
END;
GO
