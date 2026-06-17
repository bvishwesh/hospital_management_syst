USE Smart_Hospital_Management_System

-- Replace 'YourStrongPassword' with the password used when the master key was created
OPEN MASTER KEY DECRYPTION BY PASSWORD = 'Strong@MasterKey2025';

OPEN SYMMETRIC KEY SymKey_Health
DECRYPTION BY CERTIFICATE Cert_HealthData;

CLOSE SYMMETRIC KEY SymKey_Health;
