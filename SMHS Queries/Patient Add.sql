EXEC AddPatient 
    @PName = N'SARIM',
    @Age = 20,
    @Gender = N'Male',
    @MedicalHistory = N'CUTE',
    @Username = N'CUTE123',
    @UserPassword = N'123CUTE123';


DELETE FROM patients
WHERE PatientID = 7; 