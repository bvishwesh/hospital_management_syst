USE [Smart_Hospital_Management_System]
GO

ALTER PROCEDURE [dbo].[ReadActivePatients]
AS
BEGIN
    SET NOCOUNT ON;

    -- Open symmetric key for decryption
    OPEN SYMMETRIC KEY SymKey_Health
    DECRYPTION BY CERTIFICATE Cert_HealthData;

    SELECT 
        PatientID, 
        PName, 
        Age, 
        Gender, 
        CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(MedicalHistory)) AS MedicalHistory, 
        UserID
    FROM patients
    WHERE IsActive = 1;

    -- Close symmetric key after reading
    CLOSE SYMMETRIC KEY SymKey_Health;
END;
GO
