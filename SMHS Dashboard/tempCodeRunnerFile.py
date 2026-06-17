# ✅ FIXED Connection String for ODBC Driver 18
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 18 for SQL Server};'
    'SERVER=KnuckleHead;'
    'DATABASE=Smart_Hospital_Management_System;'
    'Trusted_Connection=yes;'
    'TrustServerCertificate=yes;'
)
