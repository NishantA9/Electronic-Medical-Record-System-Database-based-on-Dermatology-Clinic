-- Group Members
-- Anushka Santosh Padyal – 801379909
-- Nishant Achrekar – 801363902
-- Shivangi Saxena – 801372350
-- Bulbul Roy – 801365911

-- Project 1   Electronic Medical Record System Database based on Dermatology Clinic

-- ********************************************************************************************************************************

-- Creating Database and Using it.
DROP DATABASE IF EXISTS proj_dermatC_db;
CREATE DATABASE proj_dermatC_db;

use proj_dermatC_db;

-- To explicitly clear SQL mode, set it to an empty string.
SET SESSION sql_mode = '';
set foreign_key_checks=0;

-- ********************************************************************************************************************************

-- Below are the Table Creation Queries:

-- Creating Patient Table:
CREATE TABLE Patient (
    patient_id INTEGER NOT NULL,
    patient_fname VARCHAR(50) NOT NULL,
    patient_lname VARCHAR(50) NOT NULL,
    patient_gender VARCHAR(1) NOT NULL,
    patient_address VARCHAR(100) NOT NULL,
    patient_phone VARCHAR(10) NOT NULL,
    patient_email_id VARCHAR(50) NOT NULL,
    patient_dob DATE NOT NULL,
	Insurance_id INTEGER NOT NULL,
    PRIMARY KEY (patient_id),
	CONSTRAINT fk_insurance_patient FOREIGN KEY (insurance_id)
        REFERENCES Insurance (Insurance_id)
);

-- Creating Staff Table:
CREATE TABLE Staff (
    Staff_id INTEGER NOT NULL PRIMARY KEY,
    personal_identification_number INTEGER NOT NULL,
    staff_fname VARCHAR(50) NOT NULL,
    staff_lname VARCHAR(50) NOT NULL,
    staff_email_id VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(9, 2 ) NOT NULL
);

-- Creating Insurance Table:
CREATE TABLE Insurance(
    Insurance_id INTEGER NOT NULL PRIMARY KEY,
    In_provider VARCHAR(255) NOT NULL,
    In_plan_name VARCHAR(255) NOT NULL
);

-- Creating Appointment table: 
CREATE TABLE Appointment (
     appointment_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
     patient_id INTEGER NOT NULL,
     registered_by_id INTEGER NOT NULL,
     doc_id INTEGER NOT NULL,
     start_time DATETIME NOT NULL,
     end_time DATETIME NOT NULL,
     CONSTRAINT fk_appointment_patient FOREIGN KEY (patient_id)
        REFERENCES Patient (patient_id),
     CONSTRAINT fk_appointment_doc FOREIGN KEY (doc_id)
        REFERENCES Staff (Staff_id),
     CONSTRAINT fk_appointment_register FOREIGN KEY (registered_by_id)
        REFERENCES Staff (Staff_id)
);

-- Creating Payment table:
CREATE TABLE Payment (
    payment_id INTEGER UNIQUE AUTO_INCREMENT,
    appointment_id INTEGER NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_total DECIMAL(9,2),
    CONSTRAINT fk_appointment_payment FOREIGN KEY (appointment_id)
        REFERENCES Appointment (appointment_id)
);
  
-- Creating Patient Symptoms table:
CREATE TABLE Patient_symptoms (
    appointment_id INTEGER NOT NULL UNIQUE,
    coldSores TINYINT NOT NULL,
    acne TINYINT NOT NULL,
    sunBurns TINYINT NOT NULL,
    hives TINYINT NOT NULL,
    rosacea TINYINT NOT NULL,
    psoriasis TINYINT NOT NULL,
    melanoma TINYINT NOT NULL,
    cosmeticRelated TINYINT NOT NULL,
    Dermatitis TINYINT NOT NULL,
    CONSTRAINT fk_appointment_symptoms FOREIGN KEY (appointment_id)
        REFERENCES Appointment (appointment_id)
);

-- Creating Patient diagnosis table:
CREATE TABLE Patient_diagnosis (
    diagnosis_id INTEGER NOT NULL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    Treatment VARCHAR(250) NOT NULL,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id)
        REFERENCES Patient (patient_id)
);

-- Creating Medication table -- And adding a new foreign key:
CREATE TABLE Medication ( 
	medicine_id VARCHAR(10) NOT NULL,
    diagnosis_id integer not null,
    appointment_id INTEGER NOT NULL,
    med_dose SMALLINT NOT NULL,
	PRIMARY KEY(appointment_id, medicine_id),
    CONSTRAINT fk_patient_appointment FOREIGN KEY (appointment_id)
        REFERENCES appointment (appointment_id),
	CONSTRAINT fk_prescrip_medicine FOREIGN KEY (medicine_id)
        REFERENCES Medicine_avail (medicine_id)
);

-- Removing the foreign key and creating a Medicine Availability Table:
CREATE TABLE Medicine_avail (
    medicine_id VARCHAR(10) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    price DECIMAL(9,2)
);

-- Creating Test/procedure availibility table:
CREATE TABLE test_avail (
    test_id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(200) NOT NULL,
    price INTEGER NOT NULL
);

-- Creating Patient test table:
CREATE TABLE Patient_test (
	procedure_id INTEGER NOT NULL UNIQUE,
    appointment_id INTEGER NOT NULL,
    procedure_code INTEGER NOT NULL,
    performed_on DATETIME NOT NULL,
    doc_id INTEGER NOT NULL,
    PRIMARY KEY (appointment_id, procedure_code),
	CONSTRAINT fk_test_avail FOREIGN KEY (procedure_code)
        REFERENCES test_avail (test_id),
    CONSTRAINT fk_appointment FOREIGN KEY (appointment_id)
        REFERENCES Appointment (appointment_id),
    CONSTRAINT fk_doc_id FOREIGN KEY (doc_id)
        REFERENCES Staff (Staff_id)
);

-- Creating Patient Results table:
CREATE TABLE patient_results (
     procedure_id INTEGER NOT NULL,
	 test_result VARCHAR(100) NOT NULL,
	 CONSTRAINT fk_procedure_results FOREIGN KEY (procedure_id)
        REFERENCES Patient_test (procedure_id)
);

-- Creating Audit Tables:

CREATE TABLE audit_appointment(patient_id int not null,
                           start_time datetime not null,
                           end_time datetime not null,
                           action_type varchar(50) not null,
						   action_date datetime not null);

CREATE TABLE audit_patient (
    patient_id	INTEGER NOT NULL,
    patient_fname VARCHAR(50) NOT NULL,
    patient_lname VARCHAR(50) NOT NULL,
    patient_gender VARCHAR(1) NOT NULL,
    patient_address VARCHAR(100) NOT NULL,
    patient_phone VARCHAR(10) NOT NULL,
	patient_email_id VARCHAR(50) NOT NULL,
    patient_dob DATE NOT NULL,
    Insurance_id INTEGER NOT NULL,
	Action_Performed Varchar(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

CREATE TABLE audit_staff (
    Staff_id INTEGER NOT NULL,
    personal_identification_number INTEGER NOT NULL,
    staff_fname VARCHAR(50) NOT NULL,
    staff_lname VARCHAR(50) NOT NULL,
    staff_email_id VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(9, 2 ) NOT NULL,
	Action_Performed Varchar(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);


CREATE TABLE audit_medicine_avail (
    medicine_id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    price DECIMAL(9,2),
    Action_Performed Varchar(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

CREATE TABLE audit_medication ( 
	medicine_id VARCHAR(10) NOT NULL,
    diagnosis_id integer not null,
    appointment_id INTEGER NOT NULL,
    med_dose SMALLINT NOT NULL,
	Action_Performed Varchar(50) NOT NULL,
    Action_Time DATETIME NOT NULL
);

-- ********************************************************************************************************************************

-- Creating INDEXES

-- Index to identify patients based on their first names.
CREATE INDEX patient_information ON patient(patient_id DESC);

-- Index for identifying patients on patient insurance IDs
CREATE INDEX patient_insurance_info ON patient(insurance_id DESC);

-- Index for identifying physicians by name.
CREATE INDEX Doctor_info ON staff(staff_fname DESC);

-- Index for identifying physicians based on designation.
CREATE INDEX Doctor_designation_info ON staff(designation DESC);

-- Index for identifying physicians based on unique identification numbers.
CREATE INDEX Doctor_PIN_info ON staff(Personal_Identification_number DESC);

-- Index for medicine availability by name
CREATE INDEX medicine_avail_info ON medicine_avail(name DESC);

-- Index to get test availability information by name
CREATE INDEX test_avail_info ON test_avail(name DESC);

-- Index to obtain payment information based on payment ID
CREATE INDEX patient_payment_info ON Payment(payment_id DESC);

-- ********************************************************************************************************************************

-- Creating VIEWS

-- View for appointment time information.
Create view appointmentTimeInfo as select appointment_id, patient_id,doc_id, start_time, end_time
from appointment;
-- select * from appointmentTimeInfo; --- testing purposes

-- View basic staff information.
Create view staffBasicInfo as select Staff_id, Personal_identification_number, staff_fname, staff_lname, staff_email_id from staff;
-- select * from staffBasicInfo; -- testing purposes

-- View patient contact information.
Create view patientContactInfo as select patient_id, patient_fname, patient_lname, patient_address, patient_phone,  patient_email_id from patient;
-- select * from patientContactInfo; -- testing purposes

-- View for payment sum-to-date information. 
Create view paymentSumInfo as select sum(payment_total) as 'Total sum of amounts till date' from payment;
-- select * from paymentSumInfo; -- testing purposes

-- View for data on patients who have received specific diagnoses and medications for a certain diagnosis.
Create view patientDiagnosisInfo as select  d1.diagnosis_id, d1.patient_id, concat(p1.patient_fname," ",p1.patient_lname) as patient_name,
d1.treatment as Diagnosis, m1.medicine_id
from patient_diagnosis d1 join patient p1 join medication m1
where d1.patient_id = p1.patient_id
and d1.diagnosis_id = m1.diagnosis_id;
-- select * from patientDiagnosisInfo;-- testing purposes

-- ********************************************************************************************************************************
-- END