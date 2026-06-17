USE [Smart_Hospital_Management_System]
GO

/****** Object:  StoredProcedure [dbo].[ReadActivePatients]    Script Date: 5/28/2025 11:25:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stored Procedure: Read Active Patients
CREATE PROCEDURE [dbo].[ReadActivePatients]
AS
BEGIN
    SELECT PatientID, PName, Age, Gender, MedicalHistory, UserID
    FROM patients
    WHERE IsActive = 1;
END;

GO


