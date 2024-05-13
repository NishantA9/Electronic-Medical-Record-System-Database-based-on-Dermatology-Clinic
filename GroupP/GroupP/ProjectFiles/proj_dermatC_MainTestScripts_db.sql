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

-- This contains the Supporting Functionality Script Operations on the proj_dermatC_db

-- 1. Getting the information out of the staff table.
SELECT * FROM staff; -- returns 9 rows

-- 2. obtaining the patient's row where "Anderson" is their last name.
SELECT * FROM patient WHERE patient_lname = 'Anderson'; -- returns 1 row

-- 3. Taking out the row containing the consulting doctors' list.
SELECT * FROM staff WHERE designation = 'Consutling Doctor'; -- return 2 rows

-- 4. Retreving the information for the employees whose first names begin with "S".
SELECT * FROM staff WHERE staff_fname like 'S%'; -- return 2 rows

-- 5. Obtaining the patient's full name in the data -- provide 11 rows.
SELECT concat(p1.patient_fname," ",p2.patient_lname) as 'Patient full name'
FROM patient p1, patient p2
WHERE p1.patient_id=p2.patient_id;

-- 6. Obtaining a list of patients' names, IDs, and insurance information, with ISO as the insurance plan. 
SELECT p3.patient_id,p3.patient_fname,p3.patient_lname, i.Insurance_id, i.In_provider, i.In_plan_name
FROM patient p3, insurance i
WHERE p3.insurance_id= i.insurance_id 
and i.In_provider = 'ISO';

-- 7. Obtaining the patient's complete name, ID, and phone number for their January 28, 2024, visit to the doctor.
SELECT p1.patient_id, concat(patient_fname," ",patient_lname) as patient_Fullname,
p1.patient_phone, a1.appointment_id, a1.start_time
FROM appointment a1 join patient p1 
WHERE a1.patient_id=p1.patient_id
and a1.start_time like '2024-01-28%'; 

-- 8. Obtaining the information about how many appointments each doctor has. 
SELECT COUNT(a1.doc_id) as numberOfAppointments, concat(s1.staff_fname," ",s1.staff_lname) as doctor_name
FROM appointment a1, staff s1
WHERE a1.doc_id=s1.staff_id
GROUP BY doc_id, doctor_name 
ORDER BY COUNT(doc_id) asc;

-- 9. Obtaining patient data for those who have received a specific diagnosis and medication for that condition.
SELECT d1.diagnosis_id, d1.patient_id, concat(p1.patient_fname," ",p1.patient_lname) as patient_name,
d1.treatment as Diagnosis, m1.medicine_id
FROM patient_diagnosis d1 join patient p1 join medication m1
WHERE d1.patient_id = p1.patient_id
and d1.diagnosis_id = m1.diagnosis_id;

-- 10. Obtaining information on a patient receiving a test or procedure and the individual carrying out the treatment.
SELECT CONCAT(p1.patient_fname, " ", p1.patient_lname) as patient_name,t2.name as procedureName, 
t1.doc_id, concat(staff_fname," ",staff_lname) as performedBy
FROM patient p1
left JOIN appointment a1 ON p1.patient_id=a1.patient_id
left JOIN staff s1 ON a1.doc_id=s1.staff_id
left JOIN Patient_test t1 ON t1.appointment_id = a1.appointment_id
left JOIN test_avail t2 ON t2.test_id = t1.procedure_code
WHERE p1.patient_id = '13';
-- //

-- 11. Obtaining information on a patient receiving a certain test or procedure and the individual carrying out the treatment.
SELECT CONCAT(p1.patient_fname, " ", p1.patient_lname) as patient_name,t2.name as procedureName, 
t1.doc_id, concat(staff_fname," ",staff_lname) as performedBy
FROM patient p1
left JOIN appointment a1 ON p1.patient_id=a1.patient_id
left JOIN staff s1 ON a1.doc_id=s1.staff_id
left JOIN Patient_test t1 ON t1.appointment_id = a1.appointment_id
left JOIN test_avail t2 ON t2.test_id = t1.procedure_code
WHERE t2.test_id='300005';

-- 12. Retrieving the test findings from a patient who has had a certain surgery or test.
SELECT CONCAT(p1.patient_fname, " ", p1.patient_lname) as patient_name,t2.name as procedureName, 
t1.doc_id, concat(staff_fname," ",staff_lname) as performedBy, r1.test_result
FROM patient p1
left JOIN appointment a1 ON p1.patient_id=a1.patient_id
left JOIN staff s1 ON a1.doc_id=s1.staff_id
left JOIN Patient_test t1 ON t1.appointment_id = a1.appointment_id
left JOIN test_avail t2 ON t2.test_id = t1.procedure_code
left join patient_results r1 on r1.procedure_id=t1.procedure_id
WHERE t2.test_id='300001';

-- 13. Retrieving the information for a patient's diagnostic and the medication that his physician has prescribed.
SELECT p1.diagnosis_id, p1.patient_id, p1.Treatment as 'DiagnosisDone', 
m1.medicine_id,m2.name as 'Medicine prescirbed', 
m1.med_dose as 'TakenNoOfDays' 
FROM patient_diagnosis p1 left join medication m1 on p1.diagnosis_id = m1.diagnosis_id
left join medicine_avail m2 on m2.medicine_id=m1.medicine_id
WHERE patient_id = '16';

-- 14. Obtaining the information for a patient's diagnosis and the medication that the treating physician and other physicians have prescribed.
SELECT p1.diagnosis_id, p1.patient_id, p1.Treatment as 'DiagnosisDone', 
m1.medicine_id,m2.name as 'Medicine prescirbed',concat(s1.staff_fname," ",s1.staff_lname) as 'DoctorName',
m1.med_dose as 'TakenNoOfDays' 
FROM patient_diagnosis p1 left join medication m1 on p1.diagnosis_id = m1.diagnosis_id
left join medicine_avail m2 on m2.medicine_id=m1.medicine_id
left join appointment a1 on a1.appointment_id=m1.appointment_id
left join staff s1 on s1.staff_id=a1.doc_id
WHERE p1.patient_id = '19';

-- 15. Obtaining the patient's data who made at least two clinic visits.
SELECT CONCAT(p1.patient_fname, " ", p1.patient_lname) as patient_name, count(a1.patient_id) "NumberofAppointments"
FROM appointment a1
JOIN patient p1 ON p1.patient_id = a1.patient_id
GROUP BY p1.patient_fname,  p1.patient_lname
HAVING count(a1.doc_id)>=2;


-- 16. Using its name, one can determine whether a specific medication is listed in the medication inventory.
SELECT EXISTS(SELECT * FROM medicine_avail WHERE name like '%steriod%') as '0 if medNotAvail/ 1 if medAvail'; -- Present in the inventory
SELECT EXISTS(SELECT * FROM medicine_avail WHERE name like '%paracetamol%') as '0 if medNotAvail/ 1 if medAvail'; -- not present in the inventory

-- 17. Obtaining the patient's information who is experiencing a range of symptoms related to his condition.
SELECT  concat(p1.patient_fname," ",p1.patient_lname)as 'patientName',s1.* FROM patient_symptoms s1 join appointment a1 on s1.appointment_id=a1.appointment_id
join patient p1 on p1.patient_id=a1.patient_id
WHERE p1.patient_id = '12';

/*
-- 18. Obtaining the patient list's details who have paid their clinic bills with insurance
SELECT a1.appointment_id,p2.patient_id,p1.payment_id,p1.payment_method,p1.payment_total,p1.payment_date FROM appointment a1 join payment p1 on a1.appointment_id=p1.appointment_id
join patient p2 on p2.patient_id=a1.patient_id
WHERE payment_method = '';
*/

-- 19. Update the drug statement to reflect the most recent dosage.
update medication
set med_dose= 7
WHERE medicine_id = '100';

-- 20. Update the payment table's update statement to reflect the updated payment amount and method.
update payment
set payment_method = 'Cash', payment_total='550'
WHERE Payment_id = '10999943' ;

-- 21. The patient_symptoms delete statement.
delete FROM patient_symptoms WHERE appointment_id = '1008';

-- 22. Developing a function that uses the patient's date of birth to retrieve their age.
DROP FUNCTION IF EXISTS ageInYears
DELIMITER //
CREATE FUNCTION ageInYears(date1 date) RETURNS int DETERMINISTIC
BEGIN
 DECLARE date2 DATE;
  SELECT current_date()into date2;
  RETURN year(date2)-year(date1);
END //
DELIMITER ;
-- testing the information using the query below 
SELECT patient_id, patient_fname, patient_lname, ageInYears(patient_dob) as 'Age' FROM patient;

-- 23. Using the with clause to get the information for the workers who are 'Medical Receptionist' designated personnel.
WITH employees AS (  
    SELECT * FROM staff WHERE designation = 'Medical Receptionist'   
    )   
    SELECT staff_id, staff_fname,designation FROM employees  
    ORDER BY staff_id; 

-- 24. Obtaining the number of particular treatments that the clinic has finished.
SELECT COUNT(tp.test_id) as 'Test id', tp.name as 'Test name'
FROM patient p
JOIN appointment a ON p.patient_id=a.patient_id
JOIN staff e ON a.doc_id=e.staff_id
JOIN Patient_test pp ON pp.appointment_id = a.appointment_id
JOIN Test_avail tp ON tp.test_id = pp.procedure_code group by tp.name;

-- 25. to evaluate the role-based access and user profiles for doctor_staff:
update patient set patient_fname = 'John' WHERE patient_id = '11'; -- fail as no access given
SELECT * FROM test_Avail; -- fail as no access given
call patientSymptoms(11); -- success as the access is given










