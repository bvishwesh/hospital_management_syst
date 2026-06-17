USE Smart_Hospital_Management_System

CREATE PROCEDURE GetActivePatientsByUserRole
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserRole NVARCHAR(50);

    SELECT @UserRole = UserRole FROM users WHERE UserID = @UserID;

    IF @UserRole IN ('admin', 'doctor')
    BEGIN
        SELECT 
            p.PatientID, 
            p.PName, 
            p.Age, 
            p.Gender, 
            p.IsActive
        FROM 
            patients p
        WHERE 
            p.IsActive = 1;
    END
    ELSE
    BEGIN
        PRINT 'Access Denied: Insufficient permissions.';
    END
END;
GO
