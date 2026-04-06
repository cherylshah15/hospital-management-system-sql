DROP DATABASE Hospital_Management;

CREATE DATABASE Hospital_Management;
use Hospital_Management;
 
 
 
 
 # Table 1 :- PATIENT Table

CREATE TABLE Patient (
    p_id INT PRIMARY KEY,
    p_first_name VARCHAR(50),
    p_last_name VARCHAR(50),
    p_dob DATE,
    p_gender CHAR(1),
    p_address VARCHAR(255),
    p_phone_number VARCHAR(15));
desc Patient;


INSERT INTO Patient VALUES
	(1, 'John', 'Doe', '1980-01-01', 'M', '123 Main St', '1234567890'),
	(2, 'Jane', 'Smith', '1990-02-02', 'F', '456 Elm St', '2345678901'),
	(3, 'Alice', 'Johnson', '1985-03-03', 'F', '789 Oak St', '3456789012'),
	(4, 'Bob', 'Brown', '1975-04-04', 'M', '101 Pine St', '4567890123'),
	(5, 'Clara', 'Davis', '1995-05-05', 'F', '202 Birch St', '5678901234'),
	(6, 'Ethan', 'Wilson', '1982-06-06', 'M', '303 Cedar St', '6789012345'),
	(7, 'Diana', 'Miller', '1970-07-07', 'F', '404 Spruce St', '7890123456'),
	(8, 'Frank', 'Taylor', '2000-08-08', 'M', '505 Maple St', '8901234567'),
	(9, 'Grace', 'Anderson', '1992-09-09', 'F', '606 Willow St', '9012345678'),
	(10, 'Henry', 'Thomas', '1985-10-10', 'M', '707 Cherry St', '0123456789');
select * from Patient; 





# Table 2 :- DOCTOR Table

CREATE TABLE Doctor (
    d_id INT PRIMARY KEY,
    d_first_name VARCHAR(50),
    d_last_name VARCHAR(50),
    d_specialization VARCHAR(100),
    d_phone_number VARCHAR(15));
 desc Doctor;
 
 
INSERT INTO Doctor VALUES
	(1, 'Sarah', 'Connor', 'Cardiology', '9876543210'),
	(2, 'Alan', 'Grant', 'Neurology', '8765432109'),
	(3, 'Ellie', 'Sattler', 'Pediatrics', '7654321098'),
	(4, 'Ian', 'Malcolm', 'Orthopedics', '6543210987'),
	(5, 'Jane', 'Porter', 'Dermatology', '5432109876'),
	(6, 'Bruce', 'Banner', 'Radiology', '4321098765'),
	(7, 'Tony', 'Stark', 'Surgery', '3210987654'),
	(8, 'Pepper', 'Potts', 'ENT', '2109876543'),
	(9, 'Stephen', 'Strange', 'Cardiology', '1098765432'),
	(10, 'Carol', 'Danvers', 'Oncology', '9988776655');
select * from Doctor; 
 
 
 
 
 

 
# Table 3 :- NURSE Table

CREATE TABLE Nurse (
    n_id INT PRIMARY KEY,
    n_first_name VARCHAR(100),
    n_last_name VARCHAR(100),
    n_shift VARCHAR(50),
    n_work_schedule VARCHAR(50)
);
desc Nurse;

    
INSERT INTO Nurse VALUES
	(1, 'Anna', 'Lee', 'Morning', 'Mon-Fri'),
	(2, 'Ben', 'White', 'Night', 'Mon-Thu'),
	(3, 'Cathy', 'Jones', 'Evening', 'Wed-Sun'),
	(4, 'David', 'Morris', 'Morning', 'Tue-Sat'),
	(5, 'Eva', 'Taylor', 'Night', 'Thu-Sun'),
	(6, 'Fred', 'Wright', 'Evening', 'Mon-Wed'),
	(7, 'Gina', 'Scott', 'Morning', 'Fri-Sun'),
	(8, 'Harry', 'Baker', 'Evening', 'Mon-Fri'),
	(9, 'Ivy', 'Moore', 'Night', 'Wed-Sat'),
	(10, 'Jake', 'Hill', 'Morning', 'Mon-Thu');
 select * from Nurse; 







# Table 4 :- ROOM Table

CREATE TABLE Room (
    r_number INT PRIMARY KEY,
    r_type VARCHAR(50),
    r_capacity INT,
    r_status VARCHAR(50),
    nurse_id INT,
    FOREIGN KEY (nurse_id) REFERENCES Nurse(n_id));
desc Room;    
    
    
INSERT INTO Room VALUES
	(101, 'General', 2, 'OCCUPIED', 1),
	(102, 'ICU', 1, 'AVAILABLE', 2),
	(103, 'Private', 1, 'AVAILABLE', 3),
	(104, 'Semi-Private', 2, 'OCCUPIED', 4),
	(105, 'General', 4, 'AVAILABLE', 5),
	(106, 'ICU', 1, 'AVAILABLE', 6),
	(107, 'Private', 1, 'OCCUPIED', 7),
	(108, 'General', 3, 'OCCUPIED', 8),
	(109, 'Semi-Private', 2, 'AVAILABLE', 9),
	(110, 'General', 5, 'AVAILABLE', 10);
select * from Room;






# Table 5 :- APPOINTMENT Table

CREATE TABLE Appointment (
    appoint_id INT PRIMARY KEY,
    p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
	d_id INT,
	FOREIGN KEY (d_id) REFERENCES Doctor(d_id),
    appoint_date DATE,
    appoint_time TIME,
    appoint_status VARCHAR(50));
desc Appointment;
   
   
INSERT INTO Appointment VALUES
	(1, 1, 2, '2025-01-01', '09:00:00', 'Scheduled'),
	(2, 2, 5, '2025-01-02', '10:00:00', 'Completed'),
	(3, 3, 3, '2025-01-03', '11:00:00', 'Cancelled'),
	(4, 4, 1, '2025-01-04', '12:00:00', 'Scheduled'),
	(5, 5, 4, '2025-01-05', '13:00:00', 'Rescheduled'),
	(6, 6, 2, '2025-01-06', '14:00:00', 'Completed'),
	(7, 7, 6, '2025-01-07', '15:00:00', 'Scheduled'),
	(8, 8, 3, '2025-01-08', '16:00:00', 'No Show'),
	(9, 9, 1, '2025-01-09', '17:00:00', 'Completed'),
	(10, 10, 5, '2025-01-10', '18:00:00', 'Scheduled');
select * from Appointment;






   
   
 # Table 6 :- ADMISSION table
 
CREATE TABLE Admission (
    admission_id INT PRIMARY KEY,
    p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    r_number INT,
    FOREIGN KEY (r_number) REFERENCES Room(r_number),
    admission_date DATE,
    discharge_date DATE,
    admission_type VARCHAR(20));
desc Admission;

   
INSERT INTO Admission VALUES
  (1, 1, 102, '2025-01-01', '2025-01-05', 'Emergency'),
  (2, 2, 104, '2025-01-02', '2025-01-06', 'Urgent'),
  (3, 3, 101, '2025-01-03', '2025-01-07', 'Elective'),
  (4, 4, 103, '2025-01-04', '2025-01-08', 'Emergency'),
  (5, 5, 105, '2025-01-05', '2025-01-09', 'Elective'),
  (6, 6, 107, '2025-01-06', '2025-01-10', 'Urgent'),
  (7, 7, 106, '2025-01-07', '2025-01-11', 'Emergency'),
  (8, 8, 103, '2025-01-08', '2025-01-12', 'Elective'),
  (9, 9, 102, '2025-01-09', '2025-01-13', 'Urgent'),
  (10, 10, 104, '2025-01-10', '2025-01-14', 'Emergency');
select * from Admission;




   
   

# Table 7 :- MEDICAL_RECORD Table

CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY,
	p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    record_diagnosis VARCHAR(255),
    record_treatment TEXT,
    record_allergies TEXT,
    record_date DATE,
    record_blood_group VARCHAR(5));
desc Medical_Record;
 

INSERT INTO Medical_Record VALUES
  (1, 1, 'Flu', 'Rest and fluids', 'Penicillin', '2025-01-01', 'A+'),
  (2, 2, 'Asthma', 'Inhaler therapy', 'None', '2025-01-02', 'B-'),
  (3, 3, 'Diabetes', 'Insulin', 'Sulfa drugs', '2025-01-03', 'O+'),
  (4, 4, 'Fracture', 'Cast', 'Latex', '2025-01-04', 'AB+'),
  (5, 5, 'Allergy', 'Antihistamines', 'Peanuts', '2025-01-05', 'O-'),
  (6, 6, 'Hypertension', 'Beta-blockers', 'None', '2025-01-06', 'A-'),
  (7, 7, 'Migraine', 'Painkillers', 'None', '2025-01-07', 'B+'),
  (8, 8, 'Infection', 'Antibiotics', 'Aspirin', '2025-01-08', 'AB-'),
  (9, 9, 'Depression', 'Therapy', 'None', '2025-01-09', 'O+'),
  (10, 10, 'Burn', 'Ointment', 'Iodine', '2025-01-10', 'A+');
select * from Medical_Record;

 
 
 
 
 # Table 8 :- LAB_TEST Table

CREATE TABLE Lab_Test (
    test_id INT PRIMARY KEY,
	p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    test_name VARCHAR(100),
    test_result TEXT,
    test_date DATE);
desc Lab_Test;  
    
   
INSERT INTO Lab_Test VALUES
	(1, 1, 'Blood Test', 'Normal', '2025-01-01'),
	(2, 2, 'X-ray', 'No fracture', '2025-01-02'),
	(3, 3, 'MRI', 'Minor swelling', '2025-01-03'),
	(4, 4, 'CT Scan', 'Clear', '2025-01-04'),
	(5, 5, 'Urine Test', 'Normal', '2025-01-05'),
	(6, 6, 'ECG', 'Irregular heartbeat', '2025-01-06'),
	(7, 7, 'Blood Sugar', 'High', '2025-01-07'),
	(8, 8, 'CBC', 'Normal', '2025-01-08'),
	(9, 9, 'Thyroid', 'Low', '2025-01-09'),
	(10, 10, 'COVID-19', 'Negative', '2025-01-10');
select * from Lab_Test; 
 
 
 
 
 
 
 

# Table 9 :- BILLING Table

CREATE TABLE Billing (
    b_id INT PRIMARY KEY,
	p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    b_amount DECIMAL(10, 2),
    b_date DATE,
    b_payment_method VARCHAR(50));
desc Billing;


INSERT INTO Billing VALUES
  (1, 1, 5000.00, '2025-01-01', 'Card'),
  (2, 2, 3000.00, '2025-01-02', 'Cash'),
  (3, 3, 7000.00, '2025-01-03', 'Card'),
  (4, 4, 900.00, '2025-01-04', 'Online'),
  (5, 5, 1000.00, '2025-01-05', 'Cash'),
  (6, 6, 4500.00, '2025-01-06', 'Card'),
  (7, 7, 800.00, '2025-01-07', 'Online'),
  (8, 8, 6000.00, '2025-01-08', 'Cash'),
  (9, 9, 7500.00, '2025-01-09', 'Card'),
  (10, 10, 5000.00, '2025-01-10', 'Online');
select * from Billing;


 
 
 
 
 
# Table 10:- INSURANCE Table

CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY,
	p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    insurance_company VARCHAR(100),
    insurance_policy_number VARCHAR(50),
    insurance_amount_covered DECIMAL(10, 2),
	b_id int,
    FOREIGN KEY (b_id) REFERENCES Billing(b_id));
desc Insurance;
  

INSERT INTO Insurance VALUES
	(1, 1, 'HealthCo', 'HC123', 400.00, 1),
	(2, 2, 'MediCare', 'MC234', 250.00, 2),
	(3, 3, 'Aetna', 'AE345', 500.00, 3),
	(4, 4, 'BlueShield', 'BS456', 600.00, 4),
	(5, 5, 'HealthPlus', 'HP567', 100.00, 5),
	(6, 6, 'United', 'UN678', 450.00, 6),
	(7, 7, 'MaxBupa', 'MB789', 700.00, 7),
	(8, 8, 'Cigna', 'CG890', 550.00, 8),
	(9, 9, 'Religare', 'RG901', 600.00, 9),
	(10, 10, 'StarHealth', 'SH012', 500.00, 10);
select * from Insurance; 
 
 
 
 
 
 
 
# Table 11:- INSURANCE_Claim Table 
 
CREATE TABLE Insurance_Claim (
    claim_id INT PRIMARY KEY,
    insurance_id INT,
	FOREIGN KEY (insurance_id) REFERENCES Insurance(insurance_id),
	p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    claim_amount DECIMAL(10,2),
    claim_date DATE,
    claim_status VARCHAR(50));
desc Insurance_Claim;
 
 
INSERT INTO Insurance_Claim VALUES
	(1, 1, 1, 300.00, '2024-03-10', 'Approved'),
	(2, 2, 2, 500.00, '2024-04-12', 'Pending'),
	(3, 3, 3, 400.00, '2024-01-08', 'Rejected'),
	(4, 4, 4, 350.00, '2023-12-22', 'Approved'),
	(5, 5, 5, 600.00, '2024-02-11', 'Approved'),
	(6, 6, 6, 420.00, '2024-01-30', 'Pending'),
	(7, 7, 7, 550.00, '2024-03-05', 'Approved'),
	(8, 8, 8, 280.00, '2024-02-20', 'Rejected'),
	(9, 9, 9, 330.00, '2024-03-25', 'Approved'),
	(10, 10, 10, 310.00, '2024-04-01', 'Pending');
select * from Insurance_Claim; 








# Table 12 :- SURGERY Table

CREATE TABLE Surgery (
    surgery_id INT PRIMARY KEY,
    p_id INT,
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
	d_id INT,
	FOREIGN KEY (d_id) REFERENCES Doctor(d_id),
	r_number INT,
    FOREIGN KEY (r_number) REFERENCES Room(r_number),
    surgery_type VARCHAR(100),
    surgery_date DATE);
desc Surgery; 


INSERT INTO Surgery VALUES
  (1, 1, 3, 101, 'Appendectomy', '2025-02-01'),
  (2, 2, 5, 102, 'Knee Replacement', '2025-02-02'),
  (3, 3, 2, 103, 'Heart Bypass', '2025-02-03'),
  (4, 4, 1, 104, 'Gallbladder Removal', '2025-02-04'),
  (5, 5, 4, 105, 'Tonsillectomy', '2025-02-05'),
  (6, 6, 6, 106, 'Eye Surgery', '2025-02-06'),
  (7, 7, 7, 107, 'Spinal Surgery', '2025-02-07'),
  (8, 8, 8, 108, 'Cataract Removal', '2025-02-08'),
  (9, 9, 9, 109, 'Hernia Repair', '2025-02-09'),
  (10, 10, 10, 110, 'Hip Replacement', '2025-02-10');
select * from Surgery;









# Table 13 :- Emergency_Contact Table

CREATE TABLE Emergency_Contact (
    econtact_id INT PRIMARY KEY,
    p_id INT,
	FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    econtact_first_name VARCHAR(100),
    econtact_last_name VARCHAR(100),
    econtact_relation VARCHAR(50),
    econtact_phone_number VARCHAR(15));
desc Emergency_Contact;


INSERT INTO Emergency_Contact VALUES
	(1, 1, 'Paul', 'Doe', 'Brother', '9111111111'),
	(2, 2, 'Rachel', 'Smith', 'Mother', '9222222222'),
	(3, 3, 'George', 'Johnson', 'Father', '9333333333'),
	(4, 4, 'Linda', 'Brown', 'Wife', '9444444444'),
	(5, 5, 'Nancy', 'Davis', 'Sister', '9555555555'),
	(6, 6, 'Tom', 'Wilson', 'Husband', '9666666666'),
	(7, 7, 'Sophia', 'Miller', 'Daughter', '9777777777'),
	(8, 8, 'Leo', 'Taylor', 'Son', '9888888888'),
	(9, 9, 'Ella', 'Anderson', 'Mother', '9999999999'),
	(10, 10, 'Oscar', 'Thomas', 'Uncle', '9000000000');
select * from Emergency_Contact; 
      
      









# Table 14:-  OTHER_STAFF Table

CREATE TABLE Other_Staff (
    s_id INT PRIMARY KEY,
    s_first_name VARCHAR(100),
	s_last_name VARCHAR(100),
    s_role VARCHAR(100),
    s_department VARCHAR(100),
    s_phone_number VARCHAR(15));
desc Other_Staff;

INSERT INTO Other_Staff VALUES
	(1, 'Paul', 'Adams', 'Receptionist', 'Front Desk', '1111111111'),
	(2, 'Sara', 'Baker', 'Security', 'Facility', '2222222222'),
	(3, 'Tom', 'Carter', 'Janitor', 'Maintenance', '3333333333'),
	(4, 'Nina', 'Dale', 'Clerk', 'Records', '4444444444'),
	(5, 'Leo', 'Evans', 'Accountant', 'Finance', '5555555555'),
	(6, 'Olga', 'Frost', 'HR Executive', 'Human Resource', '6666666666'),
	(7, 'Matt', 'Green', 'IT Support', 'IT', '7777777777'),
	(8, 'Tina', 'Hughes', 'Librarian', 'Library', '8888888888'),
	(9, 'Ron', 'Irwin', 'Canteen Manager', 'Cafeteria', '9999999999'),
	(10, 'Lilly', 'Jones', 'Driver', 'Transport', '0000000000');
select * from Other_Staff; 











#Table 15 :- LIGAND Table

CREATE TABLE Ligand (
    ligand_id INT PRIMARY KEY,
    ligand_name VARCHAR(50),
    ligand_chemical_group VARCHAR(50),
    ligand_receptor_type VARCHAR(50),
	record_id INT,
    FOREIGN KEY (record_id) REFERENCES Medical_Record(record_id));
desc Ligand;


INSERT INTO Ligand VALUES
	(1, 'Dopamine', 'Catecholamine', 'D1',1),
	(2, 'Serotonin', 'Indoleamine', '5HT2A',2),
	(3, 'Acetylcholine', 'Ester', 'Muscarinic',3),
	(4, 'GABA', 'Amino acid', 'GABA-A',4),
	(5, 'Histamine', 'Amine', 'H1',5),
	(6, 'Glutamate', 'Amino acid', 'NMDA',6),
	(7, 'Epinephrine', 'Catecholamine', 'Alpha',7),
	(8, 'Norepinephrine', 'Catecholamine', 'Beta',8),
	(9, 'Endorphin', 'Peptide', 'Mu',9),
	(10, 'Substance P', 'Neuropeptide', 'NK1',10);
select * from Ligand; 




#1. List all patients who have had an appointment with a cardiologist.
SELECT DISTINCT p.p_first_name, p.p_last_name
FROM Patient p
JOIN Appointment a ON p.p_id = a.p_id
JOIN Doctor d ON a.d_id = d.d_id
WHERE d.d_specialization = 'Cardiology';



#2. Find the total billing amount for each patient.
SELECT p.p_first_name, p.p_last_name, SUM(b.b_amount) AS total_billed
FROM Patient p
JOIN Billing b ON p.p_id = b.p_id
GROUP BY p.p_id;


#3. Show patients who have undergone surgery in an ICU room.
SELECT p.p_first_name, p.p_last_name, r.r_type
FROM Surgery s
JOIN Patient p ON s.p_id = p.p_id
JOIN Room r ON s.r_number = r.r_number
WHERE r.r_type = 'ICU';


#4. List all available rooms with the nurse assigned.
SELECT r.r_number, r.r_type, r.r_status, n.n_first_name, n.n_last_name
FROM Room r
JOIN Nurse n ON r.nurse_id = n.n_id
WHERE r.r_status = 'AVAILABLE';


#5. Find all patients who have an allergy to Penicillin.
SELECT p.p_first_name, p.p_last_name
FROM Patient p
JOIN Medical_Record m ON p.p_id = m.p_id
WHERE m.record_allergies LIKE '%Penicillin%';


#6. Show all patients with insurance coverage over ₹500.
SELECT p.p_first_name, p.p_last_name, i.insurance_company, i.insurance_amount_covered
FROM Patient p
JOIN Insurance i ON p.p_id = i.p_id
WHERE i.insurance_amount_covered > 500;




#7. List the names of doctors who performed surgeries in February 2025.
SELECT DISTINCT d.d_first_name, d.d_last_name
FROM Doctor d
JOIN Surgery s ON d.d_id = s.d_id
WHERE s.surgery_date BETWEEN '2025-02-01' AND '2025-02-28';



#8. Find the number of appointments scheduled per doctor.
 
SELECT d.d_first_name, d.d_last_name, COUNT(*) AS num_appointments
FROM Doctor d
JOIN Appointment a ON d.d_id = a.d_id
GROUP BY d.d_id;




#9. Show patients who have had more than one lab test.
SELECT p.p_first_name, p.p_last_name, COUNT(*) AS test_count
FROM Patient p
JOIN Lab_Test l ON p.p_id = l.p_id
GROUP BY p.p_id
HAVING COUNT(*) > 1;



#10. Get emergency contact details for all male patients.
SELECT ec.econtact_first_name, ec.econtact_last_name, ec.econtact_relation, ec.econtact_phone_number
FROM Emergency_Contact ec
JOIN Patient p ON ec.p_id = p.p_id
WHERE p.p_gender = 'M';


#11. Retrieve all patients who were admitted and discharged in January 2025.
SELECT p.p_first_name, p.p_last_name, a.admission_date, a.discharge_date
FROM Patient p
JOIN Admission a ON p.p_id = a.p_id
WHERE a.admission_date BETWEEN '2025-01-01' AND '2025-01-31'
  AND a.discharge_date BETWEEN '2025-01-01' AND '2025-01-31';
  
  
  
  
#12. List the nurses who work in the night shift.
SELECT n_first_name, n_last_name
FROM Nurse
WHERE n_shift = 'Night';




#13. Show patients whose insurance claims were rejected.
SELECT p.p_first_name, p.p_last_name, ic.claim_status
FROM Insurance_Claim ic
JOIN Patient p ON ic.p_id = p.p_id
WHERE ic.claim_status = 'Rejected';



#14. Find the ligand names in the Catecholamine group.
SELECT ligand_name
FROM Ligand
WHERE ligand_chemical_group = 'Catecholamine';



#15. List other staff working in the IT department.
SELECT s_first_name, s_last_name, s_role
FROM Other_Staff
WHERE s_department = 'IT';


#Q16. Patients treated with GABA-related ligands
SELECT p.p_first_name, p.p_last_name, l.ligand_name
FROM Patient p
JOIN Medical_Record m ON p.p_id = m.p_id
JOIN Ligand l ON m.record_id = l.record_id
WHERE l.ligand_name = 'GABA';


-- #17. Find the minimum room capacity. (MIN)
SELECT MIN(r_capacity) AS min_capacity
FROM Room;

-- #18. Show the average insurance amount covered. (AVG)
SELECT AVG(insurance_amount_covered) AS avg_coverage
FROM Insurance;

-- #19. List patients who have the highest bill. (MAX with subquery)
SELECT p.p_first_name, p.p_last_name, b.b_amount
FROM Billing b
JOIN Patient p ON p.p_id = b.p_id
WHERE b.b_amount = (SELECT MAX(b_amount) FROM Billing);

-- #20. Find doctors who have not performed any surgery. (Subquery with NOT IN)
SELECT d_first_name, d_last_name
FROM Doctor
WHERE d_id NOT IN (SELECT d_id FROM Surgery);

-- #21. Show patients who had more than 1 appointment. (Subquery with HAVING)
SELECT p_id
FROM Appointment
GROUP BY p_id
HAVING COUNT(*) > 1;

-- #22. List patients whose billing is above the average billing amount. (Subquery with AVG)
SELECT p.p_first_name, p.p_last_name, b.b_amount
FROM Patient p
JOIN Billing b ON p.p_id = b.p_id
WHERE b.b_amount > (SELECT AVG(b_amount) FROM Billing);

-- #23. List patients who have both an appointment and a surgery. (INTERSECT)
SELECT p_id FROM Appointment
INTERSECT
SELECT p_id FROM Surgery;

-- #24. Show all unique patients who had either a medical record or a lab test. (UNION)
SELECT p_id FROM Medical_Record
UNION
SELECT p_id FROM Lab_Test;

-- #25. Show names of patients who have made insurance claims that were rejected. (Subquery + filter)
SELECT p.p_first_name, p.p_last_name
FROM Patient p
JOIN Insurance_Claim ic ON p.p_id = ic.p_id
WHERE ic.claim_status = 'Rejected';

-- #26. Find doctors with more than 2 appointments. (Subquery with COUNT and HAVING)
SELECT d_id
FROM Appointment
GROUP BY d_id
HAVING COUNT(*) > 2;

-- #27. Find the room with the maximum capacity. (MAX)
SELECT r_number, r_capacity
FROM Room
WHERE r_capacity = (SELECT MAX(r_capacity) FROM Room);

-- #28. Show patients whose claim amount is less than their insurance coverage. (Subquery with JOIN)
SELECT p.p_first_name, p.p_last_name, ic.claim_amount, i.insurance_amount_covered
FROM Patient p
JOIN Insurance_Claim ic ON p.p_id = ic.p_id
JOIN Insurance i ON ic.insurance_id = i.insurance_id
WHERE ic.claim_amount < i.insurance_amount_covered;

-- #29. List names of patients whose billing payment method is 'Card' or 'Online'. (IN)
SELECT p_first_name, p_last_name
FROM Patient
WHERE p_id IN (
    SELECT p_id FROM Billing
    WHERE b_payment_method IN ('Card', 'Online')
);

-- #30. Show patients who had surgery but no appointment. (EXCEPT or NOT IN)
SELECT p.p_first_name, p.p_last_name
FROM Patient p
WHERE p.p_id IN (SELECT p_id FROM Surgery)
  AND p.p_id NOT IN (SELECT p_id FROM Appointment);
