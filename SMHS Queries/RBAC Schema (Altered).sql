USE [Smart_Hospital_Management_System]
GO
ALTER PROCEDURE [dbo].[GetActivePatientsByUserRole]
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserRole NVARCHAR(50);

    SELECT @UserRole = UserRole FROM users WHERE UserID = @UserID;

    IF @UserRole IN ('admin', 'doctor')
    BEGIN
        -- Open symmetric key before decryption
        OPEN SYMMETRIC KEY SymKey_Health
        DECRYPTION BY CERTIFICATE Cert_HealthData;

        SELECT 
            p.PatientID, 
            p.PName, 
            p.Age, 
            p.Gender, 
            CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(p.MedicalHistory)) AS MedicalHistory,
            p.IsActive
        FROM 
            patients p
        WHERE 
            p.IsActive = 1;

        -- Close key after use
        CLOSE SYMMETRIC KEY SymKey_Health;
    END
    ELSE
    BEGIN
        PRINT 'Access Denied: Insufficient permissions.';
    END
END;
GO