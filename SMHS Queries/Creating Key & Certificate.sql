-- Ensure you are in the correct database
USE Smart_Hospital_Management_System;
GO

-- Step 1: Create Master Key (only once)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Strong@MasterKey2025';
GO

-- Step 2: Create Certificate
CREATE CERTIFICATE Cert_HealthData
WITH SUBJECT = 'Health Data Encryption Certificate';
GO

-- Step 3: Create Symmetric Key
CREATE SYMMETRIC KEY SymKey_Health
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE Cert_HealthData;
GO
