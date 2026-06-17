# 🏥 Smart Hospital Management System

A robust and secure hospital database system designed to enhance healthcare efficiency through automation, encryption, and real-time monitoring. This project simplifies the management of patients, doctors, appointments, and hospital beds while ensuring strict data privacy and operational integrity.

---

## 📖 Overview

The **Smart Hospital Management System** is a comprehensive solution built using **Microsoft SQL Server** for database operations and **Python Streamlit** for real-time dashboard visualization. It addresses key hospital management needs with features such as:

- 🔐 **Data Encryption** to protect sensitive patient medical histories.
- 🔑 **Role-Based Access Control (RBAC)** to restrict data access based on user roles.
- 🛏️ **Automated Bed Allocation and Status Tracking** using SQL triggers.
- 📊 **Live Dashboard** for doctors, appointments, and resource monitoring.
- 🛠️ **Stored Procedures and Indexes** to optimize CRUD operations and performance.

---

## 🚀 Features

- **Secure Database Design** with enforced entity relationships and data integrity.
- **Symmetric Key Encryption** to protect medical data.
- **RBAC** using stored procedures for secure role-specific access.
- **Triggers** to auto-update bed statuses based on assignments.
- **Soft Deletion** using `IsActive` flags for audit trail and historical data.
- **Streamlit Dashboard** providing interactive real-time visuals of appointments, patients, and bed availability.
- **Efficient Querying** using indexes on critical columns.

---

## 🛠️ Technologies Used

| Component             | Technology                |
|----------------------|---------------------------|
| Database Management  | Microsoft SQL Server      |
| Scripting Language   | T-SQL (Stored Procedures) |
| Frontend Dashboard   | Python + Streamlit        |
| Database Connector   | pyodbc                    |
| Security             | SQL Server Encryption     |

---

## ⚙️ System Architecture

- ERD includes core entities: **Users**, **Patients**, **Doctors**, **Appointments**, and **Beds**
- All relationships are managed via **foreign keys** with enforced constraints
- Logic handled through **stored procedures** to encapsulate and protect CRUD operations

---

## 🔐 Security Implementation

- **Symmetric key encryption** protects sensitive fields like medical history
- **RBAC** implemented via stored procedures and user roles in the `Users` table
- **Certificates and Keys** created and managed directly within SQL Server

---

## 📈 Performance Optimization

- Non-clustered indexes on:
  - `AppointmentTime`
  - `DoctorID`, `PatientID`
  - `IsActive`, `BedStatus`

---

## 🧠 Lessons Learned

- Encryption and key handling in SQL Server requires deep control and planning
- RBAC adds significant security but requires careful role management logic
- Real-time data access and visuals boost decision-making in hospital settings

---

## 📌 Limitations & Future Work

- Passwords are currently stored in plaintext — hashing needs to be implemented
- Lacks features like billing, prescription management, or patient portal
- Scalability for large hospital environments can be improved

---

## 📄 License

This project is for academic purposes. Contact the author for reuse permissions.

---

## 👤 Author

**Abdul Sarim Khan**  
Database & Management Systems – CCP  
Iqra University  

