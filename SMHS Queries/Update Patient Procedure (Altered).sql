USE [Smart_Hospital_Management_System]
GO

ALTER PROCEDURE [dbo].[UpdatePatient]
    @PatientID INT,
    @PName NVARCHAR(100),
    @Age INT,
    @Gender NVARCHAR(10),
    @MedicalHistory NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Open symmetric key to perform encryption
    OPEN SYMMETRIC KEY SymKey_Health
    DECRYPTION BY CERTIFICATE Cert_HealthData;

    -- Update with encrypted medical history
    UPDATE patients
    SET 
        PName = @PName,
        Age = @Age,
        Gender = @Gender,
        MedicalHistory = ENCRYPTBYKEY(KEY_GUID('SymKey_Health'), CONVERT(VARBINARY(MAX), @MedicalHistory))
    WHERE PatientID = @PatientID;

    -- Close the key
    CLOSE SYMMETRIC KEY SymKey_Health;
END;
GO
