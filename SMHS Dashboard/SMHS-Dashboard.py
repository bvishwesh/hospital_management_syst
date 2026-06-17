import streamlit as st
import pandas as pd
import pyodbc
# Uncomment these to debug drivers if needed
# print(pyodbc.drivers())
# print(pyodbc.dataSources())


# Database connection
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 18 for SQL Server};'
    'SERVER=KnuckleHead;'
    'DATABASE=Smart_Hospital_Management_System;'
    'Trusted_Connection=yes;'
    'TrustServerCertificate=yes;'
)

# App layout
st.set_page_config(page_title="Smart Hospital Dashboard", layout="wide")

st.markdown("<h1 style='text-align: center;'>🏥 Smart Hospital Realtime Dashboard</h1>", unsafe_allow_html=True)
st.markdown("---")

# Columns layout for bed and appointments
col1, col2 = st.columns(2)

with col1:
    st.subheader("🛏️ Available Beds")
    beds_df = pd.read_sql("SELECT * FROM vw_AvailableBeds", conn)
    st.dataframe(beds_df, use_container_width=True)

with col2:
    st.subheader("📅 Upcoming Appointments")
    appointments_df = pd.read_sql("SELECT * FROM vw_UpcomingAppointments", conn)
    st.dataframe(appointments_df, use_container_width=True)

# Full-width patient section
st.markdown("### 👥 Active Patients")
patients_df = pd.read_sql("SELECT PatientID, PatientName, Age, Gender FROM patients WHERE IsActive = 1", conn)
st.dataframe(patients_df, use_container_width=True)

# Full-width doctor section
st.markdown("### 🩺 Active Doctors")
doctors_df = pd.read_sql("SELECT DoctorID, DoctorName, Specialty, Availability FROM doctors WHERE IsActive = 1", conn)
st.dataframe(doctors_df, use_container_width=True)

# Close connection
conn.close()


#streamlit run "D:\sarim\University\Semester 8 ( Spring 2025 )\Database Management Systems\CCP\SMHS Dashboard\SMHS-Dashboard.py"
