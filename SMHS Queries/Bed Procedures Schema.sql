USE Smart_Hospital_Management_System;

GO
CREATE PROCEDURE dbo.AddBed
    @Ward NVARCHAR(100),
    @BedStatus NVARCHAR(20),
    @PatientID INT  -- Set to NULL when no patient is assigned
AS
BEGIN
    INSERT INTO dbo.beds (Ward, BedStatus, PatientID)
    VALUES (@Ward, @BedStatus, @PatientID);
END;
GO
