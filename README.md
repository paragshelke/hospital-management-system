Hospital Management System - SQL Project

Overview
--------
The Hospital Management System is a relational database project built using MySQL. 
It is designed to manage and track hospital operations efficiently. 
This system handles patient records, doctor information, encounters, prescriptions, diagnostic tests, procedures, and medical history while maintaining data integrity through proper relational design.

Features
--------
- Manage patient information, including personal details and medical history
- Maintain doctor profiles and specializations
- Track patient encounters with doctors, including visit type and date
- Record prescriptions, diagnostic tests, and procedures associated with each encounter
- Use foreign key relationships to enforce data consistency
- Sample data included for testing queries and database functionality

Database Structure
------------------
The system includes the following main tables:

- patient – Stores patient details such as name, contact number, date of birth, gender, insurance, and address
- doctor – Stores doctor details, specialization, and contact information
- encounter – Connects patients and doctors for each hospital visit and records visit type and date
- medicalhistory – Stores patient diagnosis, allergies, and medications
- prescription – Stores prescribed medicines for each encounter
- diagnostictest – Stores diagnostic tests and results for each encounter
- proceduree – Stores procedures performed during encounters and their outcomes

Relationships:
- Each patient can have multiple encounters with one or more doctors
- Each doctor can handle multiple patient encounters
- Prescriptions, diagnostic tests, and procedures are linked to encounters using foreign keys
- Foreign key constraints ensure that related data is always consistent

ER-Diagram
-----------------------
<img width="1564" height="1122" alt="toolsnak-er-diagram" src="https://github.com/user-attachments/assets/c264637b-29f9-4f00-b6e9-0b158295e518" />



How to Run the Project
----------------------
1. Install MySQL
   Ensure MySQL Server (version 8.0 or above) is installed. You can use MySQL Workbench or the command line.

2. Open MySQL Workbench or Command Line
   Connect to your MySQL server with proper credentials.

3. Import the SQL File
   If your SQL dump file is named hospital_management.sql, run the following command:
   
   SOURCE path/to/hospital_management.sql;

   This will automatically create all tables and insert the sample data.

4. Verify Tables
   Check that all tables have been created:
   
   SHOW TABLES;

   Expected tables: patient, doctor, encounter, medicalhistory, prescription, diagnostictest, proceduree

5. Test Queries

   Get all patient encounters with doctor details:
   SELECT p.name AS patient_name,
          d.name AS doctor_name,
          e.encounter_date,
          e.encounter_type
   FROM encounter e
   JOIN patient p ON e.patient_id = p.patient_id
   JOIN doctor d ON e.doctor_id = d.doctor_id;

   Get complete encounter details including prescriptions and tests:
   SELECT p.name AS patient_name,
          d.name AS doctor_name,
          e.encounter_date,
          pr.medicine_name,
          dt.test_type
   FROM encounter e
   JOIN patient p ON e.patient_id = p.patient_id
   JOIN doctor d ON e.doctor_id = d.doctor_id
   LEFT JOIN prescription pr ON e.encounter_id = pr.encounter_id
   LEFT JOIN diagnostictest dt ON e.encounter_id = dt.encounter_id;

6. Additional Queries
   You can join multiple tables to fetch complete patient visit histories, doctor workloads, or prescription records for analysis.

Benefits
--------
- Demonstrates SQL skills with multi-table relationships and JOIN queries
- Provides hands-on experience with relational database design
- Helps understand normalization, primary keys, foreign keys, and constraints
- Ready-to-use sample data for immediate testing

Author
------
Parag Shelke
GitHub: https://github.com/paragshelke
