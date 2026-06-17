USE Smart_Hospital_Management_System

CREATE TRIGGER trg_UpdateBedStatus
ON beds
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Mark as Occupied when PatientID is NOT NULL
    UPDATE b
    SET BedStatus = 'Occupied'
    FROM beds b
    INNER JOIN inserted i ON b.BedID = i.BedID
    WHERE i.PatientID IS NOT NULL;

    -- Mark as Available when PatientID IS NULL
    UPDATE b
    SET BedStatus = 'Available'
    FROM beds b
    INNER JOIN inserted i ON b.BedID = i.BedID
    WHERE i.PatientID IS NULL;
END;
GO
