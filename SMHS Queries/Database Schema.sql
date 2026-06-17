CREATE DATABASE Smart_Hospital_Management_System;

USE Smart_Hospital_Management_System;

CREATE TABLE users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserRole NVARCHAR(50) NOT NULL,
    Username NVARCHAR(100) UNIQUE NOT NULL,
    UserPassword NVARCHAR(255) NOT NULL
	ADD CONSTRAINT chk_UserRole CHECK (UserRole IN ('admin', 'doctor', 'patient'));
);

CREATE TABLE patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    PName NVARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    MedicalHistory NVARCHAR(MAX),
    IsActive BIT NOT NULL DEFAULT 1,
    UserID INT UNIQUE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

CREATE TABLE doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    DoctorName NVARCHAR(100) NOT NULL,
    Specialty NVARCHAR(100) NOT NULL,
    Availability NVARCHAR(50) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    UserID INT UNIQUE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

CREATE TABLE departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL,
    HeadDoctorID INT NOT NULL,
    FOREIGN KEY (HeadDoctorID) REFERENCES doctors(DoctorID)
);

CREATE TABLE beds (
    BedID INT IDENTITY(1,1) PRIMARY KEY,
    Ward NVARCHAR(100) NOT NULL,
    BedStatus NVARCHAR(20) NOT NULL DEFAULT 'Available',  -- e.g., 'Available', 'Occupied'
    PatientID INT UNIQUE,
    FOREIGN KEY (PatientID) REFERENCES patients(PatientID)
);

CREATE TABLE appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentTime DATETIME NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES doctors(DoctorID)
);
