-- Group Members
-- Anushka Santosh Padyal – 801379909
-- Nishant Achrekar – 801363902
-- Shivangi Saxena – 801372350
-- Bulbul Roy – 801365911

-- Project 1   Electronic Medical Record System Database based on Dermatology Clinic

-- ********************************************************************************************************************************
-- Use this database to get started.
use proj_dermatC_db;

-- *******************************************************************************************************************************************************

Flush privileges;
select * from staff;

-- drop the following users if it already exists.
drop user 'doctor_staff'@'localhost';
drop user 'admin_staff'@'localhost';
drop user 'receptionist_staff'@'localhost';
drop user 'nursing_staff'@'localhost';
drop user 'test&technical_staff'@'localhost';

-- generating new users which are as follows.
create user 'doctor_staff'@'localhost' identified by 'doctor_staff';
create user 'receptionist_staff'@'localhost' identified by 'receptionist_staff';
create user 'nursing_staff'@'localhost' identified by 'nursing_staff';
create user 'admin_staff'@'localhost' identified by 'admin_staff';
create user 'test&technical_staff'@'localhost' identified by 'test&technical_stafff';

-- All grants are supplied to administrative staff to ensure that the application is running properly.
GRANT ALL PRIVILEGES ON *.* TO 'admin_staff'@'localhost' WITH GRANT OPTION;

-- Grants for Receptionist Staff. 
grant all privileges on proj_dermatC_db.patient to 'receptionist_staff'@'localhost';
grant all privileges on proj_dermatC_db.Appointment to 'receptionist_staff'@'localhost';
grant select on proj_dermatC_db.Patient_Symptoms to 'receptionist_staff'@'localhost';
grant select on proj_dermatC_db.staff to 'receptionist_staff'@'localhost';
grant update,select on proj_dermatC_db.payment to 'receptionist_staff'@'localhost';
grant select on proj_dermatC_db.Audit_Patient to 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.StaffUpdate TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.StaffInsert TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.paymentInfo TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.pid_match_testing TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.patientName TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.patientInsert TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.patientUpdate TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.delete_StaffInformation TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.delete_patientInfo TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.delete_Appointment TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.AppointmentUpdate TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.AppointmentInsert TO 'receptionist_staff'@'localhost';
GRANT execute ON PROCEDURE proj_dermatC_db.getAllPatientNames TO 'receptionist_staff'@'localhost';

-- Grants for Test and Technical staff 
grant select on proj_dermatC_db.patient to 'test&technical_staff'@'localhost';
grant select on proj_dermatC_db.audit_patient to 'test&technical_staff'@'localhost';
grant select  on proj_dermatC_db.audit_Appointment to 'test&technical_staff'@'localhost';
grant all privileges on proj_dermatC_db.patient_results to 'test&technical_staff'@'localhost';
grant all privileges on proj_dermatC_db.patient_test to 'test&technical_staff'@'localhost';
grant all privileges on proj_dermatC_db.test_avail to 'test&technical_staff'@'localhost';
grant select on proj_dermatC_db.medication to 'test&technical_staff'@'localhost';
grant execute on procedure proj_dermatC_db.delete_testAvail TO 'test&technical_staff'@'localhost';
grant execute on procedure proj_dermatC_db.TestAvailInsert TO 'test&technical_staff'@'localhost';
grant execute on procedure proj_dermatC_db.TestAvailUpdate TO 'test&technical_staff'@'localhost';

-- Grants for Nursing staff.
grant all privileges on proj_dermatC_db.Patient_Symptoms to 'nursing_staff'@'localhost'; 
grant select on proj_dermatC_db.patient to 'nursing_staff'@'localhost';
grant select on proj_dermatC_db.audit_patient to 'nursing_staff'@'localhost';
grant update, select on proj_dermatC_db.medication to 'nursing_staff'@'localhost';
grant select on proj_dermatC_db.audit_medication to 'nursing_staff'@'localhost';
grant select on proj_dermatC_db.Patient_test to 'nursing_staff'@'localhost';
grant select on proj_dermatC_db.medicine_Avail to 'nursing_staff'@'localhost';
grant select on proj_dermatC_db.audit_medicine_Avail to 'nursing_staff'@'localhost';
grant select on proj_dermatC_db.patient_diagnosis to 'nursing_staff'@'localhost';
grant execute on procedure proj_dermatC_db.update_PatientSymptoms TO 'nursing_staff'@'localhost';
grant execute on procedure proj_dermatC_db.patientSymptoms TO 'nursing_staff'@'localhost';
grant execute on procedure proj_dermatC_db.insert_medicaiton TO 'nursing_staff'@'localhost';
grant execute on procedure proj_dermatC_db.delete_medciation TO 'nursing_staff'@'localhost';
grant execute on procedure proj_dermatC_db.update_medication TO 'nursing_staff'@'localhost';

-- Grants for Specialist and Consultant doctors. 	
grant all privileges on proj_dermatC_db.Patient_test to 'doctor_staff'@'localhost';
grant select on proj_dermatC_db.patient to 'doctor_staff'@'localhost';
grant select on proj_dermatC_db.audit_patient to 'doctor_staff'@'localhost';
grant select on proj_dermatC_db.Patient_diagnosis to 'doctor_staff'@'localhost';
grant all privileges on proj_dermatC_db.medication to 'doctor_staff'@'localhost';
grant all privileges on proj_dermatC_db.audit_medication to 'doctor_staff'@'localhost';
grant select on proj_dermatC_db.Patient_results to 'doctor_staff'@'localhost';
grant execute on procedure proj_dermatC_db.update_PatientSymptoms TO 'doctor_staff'@'localhost';
grant execute on procedure proj_dermatC_db.patientSymptoms TO 'doctor_staff'@'localhost';
grant execute on procedure proj_dermatC_db.insert_medicaiton TO 'doctor_staff'@'localhost';
grant execute on procedure proj_dermatC_db.delete_medciation TO 'doctor_staff'@'localhost';
grant execute on procedure proj_dermatC_db.update_medication TO 'doctor_staff'@'localhost';


-- ********************************************************************************************************************************
-- END