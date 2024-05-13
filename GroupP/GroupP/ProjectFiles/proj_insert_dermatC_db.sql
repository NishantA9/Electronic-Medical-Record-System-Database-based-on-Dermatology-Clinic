-- Group Members
-- Anushka Santosh Padyal – 801379909
-- Nishant Achrekar – 801363902
-- Shivangi Saxena – 801372350
-- Bulbul Roy – 801365911

-- Project 1   Electronic Medical Record System Database based on Dermatology Clinic.

-- *******************************************************************************************************************************************************
-- Use this database to get started.
use proj_dermatC_db;

-- *******************************************************************************************************************************************************
-- Insertion queries for entering data into the following tables:

-- Inserting data into the staff table.
insert into Staff values 
(	1,	10901,	'Nishant',	'Acharekar',	'nishanta@gmail.com',	'Specialist Doctor',	11400	),
(	2,	10902,	'Anushka',	'Padyal',	'anushkap@gmail.com',	'Specialist Doctor',	11500	),
(	3,	10903,	'Cherry',	'Patil',	'cherryp@gmail.com',	'Nurse',	'9000'	),
(	4,	10904,	'Pratik',	'Kadam',	'pratikk@gmail.com',	'Test specialist',	8500	),
(	5,	10905,	'Bulbul',	'Roy',	'bulbulr@gmail.com',	'Consutling Doctor',	12000	),
(	6,	10906,	'Shivangi',	'Saxena',	'shivangis@gmail.com',	'Consutling Doctor',	13000	),
(	7,	10907,	'Ritu',	'Kadkol',	'rituk@gmail.com',	'Medical Receptionist',	6000	),
(	8,	10908,	'Swarangee',	'Malhari',	'swarangeem@gmail.com',	'Medical Receptionist',	7500	),
(	9,	10909,	'Janhavi',	'Nehete',	'janhavin@gmail.com',	'Specialist Doctor',	11000	);

-- Inserting data into the insurance table.
insert into insurance values
('24699900', 'ISO', 'ISO Bronze plan'), 
('24699901','ISO', 'ISO Silver plan'),
('24699902', 'ISO', 'ISO Gold plan'),
('24699903', 'CVS', 'CVS health insurance plan'),
('24699904','Anthem','Anthem Healthcare'),
('24699905','SB','Student Blue from UNCC');

-- Inserting data into the patient table.
insert into patient values 
(11, 'John', 'Doe', 'M', '123 Main St Anytown 12345', '5551234567', 'johndoe@example.com', '1990-05-20', '24699900'),
(12, 'Jane', 'Smith', 'F', '456 Elm St Othertown 67890', '5559876543', 'janesmith@example.com', '1985-10-15', '24699902'),
(13, 'Michael', 'Johnson', 'M', '789 Oak St Anothertown 54321', '7849900322', 'michaeljohnson@example.com', '1993-03-25', '24699901'),
(14, 'Emily', 'Brown', 'F', '101 Pine St Smalltown 13579', '5553216549', 'emilybrown@example.com', '1998-08-10', '24699902'),
(15, 'David', 'Wilson', 'M', '246 Cedar St Largetown 97531', '7849900325', 'davidwilson@example.com', '1992-12-30', '24699905'),
(16, 'Sarah', 'Miller', 'F', '369 Maple St Bigtown 24680', '7849900329', 'sarahmiller@example.com', '1987-07-05', '24699905'),
(17, 'Christopher', 'Taylor', 'M', '789 Birch St Newtown 86420', '5551119999', 'christophertaylor@example.com', '1989-04-01', '24699900'),
(18, 'Amanda', 'Anderson', 'F', '963 Walnut St Oldtown 75390', '5559321888', 'amandaanderson@example.com', '1996-01-12', '24699904'),
(19, 'Matthew', 'Thomas', 'M', '852 Spruce St Littletown 36912', '5556856777', 'matthewthomas@example.com', '1991-09-28', '24699905'),
(20, 'Jessica', 'Martinez', 'F', '741 Oakwood St Hometown 85236', '5569335121', 'jessicamartinez@example.com', '1984-06-17', '24699902'),
(22, 'Daniel', 'Garcia', 'M', '258 Pinecrest St Foreigntown 14785', '7849900321', 'danielgarcia@example.com', '1997-11-03', '24699904');

-- Inserting data into the Appointment table.
INSERT INTO appointment VALUES 
('2000', '11', '8', '1', '2024-01-26 9:30:00', '2024-01-26 9:55:00'),
('2001', '12', '7', '2', '2024-01-26 10:00:00', '2024-01-26 10:30:00'),
('2002', '13', '8', '1', '2024-01-26 10:45:00', '2024-01-26 10:11:00'),
('2003', '14', '7', '5', '2024-01-27 11:00:00', '2024-01-27 11:30:00'),
('2004', '15', '8', '6', '2024-01-27 11:15:00', '2024-01-27 12:00:00'),
('2005', '16', '8', '6', '2024-01-27 12:15:00', '2024-01-27 12:45:00'),
('2006', '17', '8', '5', '2024-01-28 01:00:00', '2024-01-28 01:15:00'),
('2007', '18', '7', '9', '2024-01-28 01:30:00', '2024-01-28 02:10:00'),
('2008', '19', '7', '1', '2024-01-28 02:25:00', '2024-01-28 03:00:00'),
('2013', '22', '8', '5', '2024-02-12 01:00:00', '2024-02-12 01:30:00');


-- Inserting data into the patient_symptoms table.
INSERT INTO patient_symptoms VALUES 
(2000, 1, 1, 0, 0, 0, 0, 0, 0, 0),
(2001, 0, 0, 1, 1, 1, 0, 0, 0, 0),
(2002, 0, 1, 0, 0, 1, 1, 1, 0, 0),
(2003, 0, 0, 0, 1, 0, 0, 1, 1, 0),
(2004, 1, 1, 1, 0, 0, 0, 0, 0, 1),
(2005, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2006, 0, 0, 0, 1, 1, 1, 0, 0, 1),
(2007, 1, 0, 0, 1, 1, 0, 1, 1, 0),
(2008, 0, 0, 0, 0, 0, 1, 0, 1, 1);

 -- Inserting data into the patient_diagnosis table.
INSERT INTO patient_diagnosis VALUES 
(95111, 11, 'Prescribed antibiotic for Skin: erythromycin'),
(95112, 12, 'Prescribed antibiotic tetracycline'),
(95113, 13, 'Prescribed dicloxacillin for skin issues'),
(95114, 14, 'Suggested to take up laser therapy with additional supplements'),
(95115, 15, 'Prescribed medicated creams and ointments'),
(95116, 16, 'Prescribes to take antihistamines for issues'),
(95117, 17, 'Prescribed Adapalene gel'),
(95118, 18, 'Suggest to take up plastic surgery with vitamins and other supplements'),
(95119, 19, 'Suggest to take vitamin or steroid injections');

-- Inserting data into the Medicine_avail table.
insert into Medicine_avail values(100,'erythromycin', 'Glaxo smith Kline: erythromycin', '105.2'),
(200,'tetracycline','CVS tetracycline', '130.67' ),
(300, 'dicloxacillin', 'Publix dicloxacillin', '969.9'),
(400, 'Corticosteriod','Hindal','3283'),
(500, 'B12','Publix B12','625.10'),
(600, 'glucosamine','Hindal Glucose','85.99'),
(700, 'cyanocobalamin', 'walmart cyano', '769'),
(800, 'niacinamide','Glaxo kline nia', '45.99'),
(900, 'itraconazole', 'Walmart center', '65.9');

-- Inserting data into the medication table.
INSERT INTO medication VALUES 
(100, 95111, 2000, 1),
(200, 95112, 2001, 2),
(300, 95113, 2002, 3),
(400, 95114, 2003, 1),
(500, 95115, 2004, 3),
(600, 95116, 2005, 4),
(700, 95117, 2006, 2),
(800, 95118, 2007, 3),
(900, 95119, 2008, 5),
(900, 95118, 2013, 3);

-- Inserting data into the test_avail table.
insert into test_avail values (300001,'Patch Testing', 'patch tests are used to diagnose skin allergies','12695'),
(300002, 'Skin biopsy', 'Used to diagnose skin cancer or benign skin disorders','32658'),
(300003,'Culture','identification of the microorganism (bacteria, fungus, or virus) that is causing an infection','6858'),
(300004,'Dermoscopy','Used to better see the lesions on the skin','9544'),
(300005,'Plastic Surgery','Used to refine the look of the body or face','99525');

-- inserting data into the Patient_test table.

INSERT INTO Patient_test VALUES
(123, 2000, 300001, '2024-01-26 10:00:00', 1),
(234, 2001, 300001, '2024-01-26 11:00:00', 2),
(345, 2002, 300002, '2024-01-26 12:00:00', 1),
(456, 2003, 300003, '2024-01-27 09:00:00', 5),
(567, 2004, 300004, '2024-01-27 10:00:00', 6),
(678, 2005, 300005, '2024-01-27 11:00:00', 6),
(789, 2006, 300002, '2024-01-28 01:00:00', 5),
(890, 2007, 300003, '2024-01-28 02:00:00', 9),
(901, 2008, 300004, '2024-01-28 02:00:00', 1);

-- Inserting data into the patient_results.
insert into patient_results values(123, 'Very serious condition'),
(234,'mild condition identified'),
(345,'no serious conditiond found'),
(456,'mild condition identified'),
(567,'serious condition found'),
(678, 'no issues found'),
(789,'mild to serious condition found'),
(890, 'insignificant issues found'),
(901, 'acute issues identified');

-- *******************************************************************************************************************************************************
-- END