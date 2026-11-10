


-- task 2.1 --
-- 1. PEOPLE 
INSERT INTO Person (pid, firstName, lastName, email, affiliation, startDate, endDate) VALUES
(1,  'amine', 'ouahid','amine.ouahid@um6p.ma','UM6P', '2018-09-01', NULL),
(2,  'hiba','Idrissi','hiba.idrissi@um6p.ma','UM6P', '2019-09-01', NULL),
(3,  'Salma','farissi','salma.farissi@um6p.ma','UM6P', '2020-02-01', NULL),
(4,  'Youssef','Amrani','youssef.amrani@uca.ac.ma','Universite Cadi Ayyad ', '2025-09-01', NULL),
(5,  'Leila','idrhou','leila.idrhou@um6p.ma','UM6P', '2021-01-15', NULL),
(6,  'Omar','sidki','omar.sidki@um6p.ma','UM6P', '2022-03-01', NULL),
(7,  'Imane','benali','imane.benali@um6p.ma','UM6P', '2023-09-01', NULL),
(8,  'fatima','Mansouri','fatima.mansouri@emi.ma','EMI', '2024-09-01', NULL),
(9,  'Anas','zwin', 'anas.zwin@um6p.ma','UM6P', '2023-09-01', '2026-06-30'),
(10, 'nour','demri','nour.demri@um6p.ma','UM6P', '2025-09-01', NULL);


INSERT INTO Student(pid,program) VALUES
(6,'computer science'),
(7,'SAP+D'),
(8,'EMINES'),
(9,'FMS'),
(10,'GUP+');

INSERT INTO  Employee(pid,phone,office,position,supervisorPid) VALUES
(1, '+212 655 574 119', 'Admin-001', 'Dean',NULL),
(2, '+212 685 040 002', 'R5-110','Faculty',1),
(3, '+212 621 444 003', 'R5-210','Faculty',1),
(4, '+212 622 050 004', 'R5-112','Postdoc',2),
(5, '+212 644 900 005', 'Admin-002','Secretary',1),
(6, '+212 697 222 006', 'R5-001','Technician', 3),
(7, '+212 666 100 007', 'R5-002','Technician', 2);

INSERT INTO Academic (pid) VALUES (1), (2), (3), (4);
INSERT INTO Faculty (pid) VALUES (2), (3);
INSERT INTO Administrative (pid) VALUES (5);
INSERT INTO Technical (pid) VALUES (6), (7);

INSERT INTO Advises (academicPid, studentPid) VALUES
(2, 8),
(4, 8),
(3, 9),
(2, 10);

-- 2.laboratories, projects,budgets

INSERT INTO Laboratory (labId, name, building, roomNumber, discipline, supervisorPid) VALUES
(1, 'Physics Laboratory','Riad5','R5-101', 'Physics', 2),
(2, 'Chemistry Laboratory','Riad2','R5-204', 'Chemistry',3),
(3, 'Computer Systems Lab','Riad10','R10-012', 'Computer Science', 2),
(4, 'Materials Laboratory', 'Riad8','R8-005', 'Chemistry',3);

INSERT INTO Attached (pid, labId) VALUES
(2, 1), (4, 1), (6, 1), (8, 1),
(3, 2), (7, 2), (9, 2),
(2, 3), (8, 3),
(3, 4), (10, 4);

INSERT INTO ResearchProject (code, title, startDate, endDate, status) VALUES
('RP-001', 'Quantum Optics Imaging','2026-01-01', '2027-12-31', 'Active'),
('RP-002', 'Green energy', '2026-03-01', '2027-02-28', 'Active'),
('RP-003', 'Machine Learning for Crop Disease Detection', '2025-09-01', '2026-08-31', 'Active'),
('RP-004', 'Algae Cultivation for Biofuel Production','2026-06-01', '2028-05-31', 'Active');

INSERT INTO Participates (pid, projectCode, role) VALUES
(2, 'RP-001', 'PI'),
(4, 'RP-001', 'Co-PI'),
(8, 'RP-001', 'Member'),
(3, 'RP-002', 'PI'),
(9, 'RP-002', 'Member'),
(6, 'RP-002', 'Member'),
(2, 'RP-003', 'PI'),
(8, 'RP-003', 'Member'),
(3, 'RP-004', 'PI'),
(7, 'RP-004', 'Member');

INSERT INTO Budget (budgetLine, amountGranted, amountDisbursed, startDate, endDate, managerPid) VALUES
('B-2026-01', 500000.00,120000.00, '2026-01-01','2027-12-31', 2),
('B-2026-02', 300000.00,80000.00, '2026-03-01','2027-02-28', 3),
('B-2026-03', 150000.00,20000.00, '2026-01-01','2026-12-31', 1),
('B-2026-04', 200000.00,10000.00, '2026-06-01','2028-05-31', 4);


INSERT INTO FundsPrj (budgetLine, projectCode) VALUES
('B-2026-01', 'RP-001'),
('B-2026-03', 'RP-001'),
('B-2026-02', 'RP-002'),
('B-2026-03', 'RP-003'),
('B-2026-04', 'RP-004');

INSERT INTO FundsLab (budgetLine, labId) VALUES
('B-2026-01', 1),
('B-2026-02', 2),
('B-2026-03', 3),
('B-2026-01', 3),
('B-2026-04', 4);

-- 3) Equipment Unit/model + certifications:

INSERT INTO EquipmentModel (modelId, commercialName, manufacturer, category, requiredEnvironment, trainingMandatory) VALUES
(1, 'Olympus BX53','Olympus', 'Optical Microscope', 'Vibration-free table, clean room',TRUE),
(2, 'Zeiss Axio Imager', 'Zeiss','Optical Microscope', 'Temperature-controlled room',TRUE),
(3, 'Fluke 1524','Fluke', 'Thermometer''Standard laboratory',FALSE),
(4, 'Keysight DSOX1204G',  'Keysight', 'Oscilloscope', 'Standard laboratory',FALSE);


INSERT INTO EquipmentUnit (serialNo, acquisitionDate, purchaseCost, status, portable, modelId, labId) VALUES
('OLY-0001', '2024-02-15', 18500.00, 'Available',FALSE, 1, 1),
('OLY-0002', '2024-02-15', 18500.00, 'Available',FALSE, 1, 1),
('ZEI-0001', '2025-05-10', 32000.00, 'Available',FALSE, 2, 1),
('FLK-0001', '2023-11-20',   950.00, 'Available',TRUE,  3, 1);


INSERT INTO Certification (code, title, issuingAuthority, validityPeriod, safetyLevel) VALUES
('CERT-OPT',   'Optical Instrumentation Training', 'UM6P Safety Office',      24, 'Level 1'),
('CERT-LASER', 'Laser Safety','National Laser Institute', 36, 'Level 2'),
('CERT-CHEM',  'Chemical Handling','UM6P Safety Office', 12, 'Level 2');


INSERT INTO Requires (modelId, certCode) VALUES
(1, 'CERT-OPT'),
(1, 'CERT-LASER'),
(2, 'CERT-OPT');


INSERT INTO Holds (pid, certCode, issueDate, expirationDate, grade) VALUES
(2, 'CERT-OPT','2025-03-01', '2027-03-01', 'A'),
(2, 'CERT-LASER', '2025-04-10', '2028-04-10', 'B'),
(4, 'CERT-OPT','2025-06-15', '2027-06-15', NULL),
(8, 'CERT-OPT','2026-01-20', '2028-01-20', 'A'),
(8, 'CERT-LASER','2026-02-05', '2029-02-05', 'A'),
(3, 'CERT-CHEM', '2026-02-01', '2027-02-01', 'A');

-- 4. reservation

INSERT INTO Reservation (resId, submissionTS, plannedStart, plannedEnd, purpose, status, madeByPid, projectCode, approverPid) VALUES
(1, '2026-10-20 09:00:00', '2026-11-03 09:00:00', '2026-11-03 12:00:00', 'Optical imaging of thin films',    'Completed', 8, 'RP-001', 1),
(2,'2026-10-24 12:30:00', '2026-11-20 14:50:00' , 'Fluorescence microscopy session', 'Approved', 2, 'RP-001', 1),
(3, '2026-10-28 11:30:00', '2026-11-25 14:00:00', '2026-11-25 17:00:00', 'Temperature calibration runs',    'Approved',  3, 'RP-002', 1),
(4, '2026-10-30 08:15:00', '2026-11-10 10:00:00', '2026-11-10 13:00:00', 'Spectral imaging test',            'Rejected',  8, 'RP-001', NULL),
(5, '2026-11-05 16:00:00', '2026-12-02 09:00:00', '2026-12-02 12:00:00', 'Sensor characterisation',          'Pending',   2, 'RP-003', NULL),
(6, '2026-11-01 10:00:00', '2026-11-18 09:00:00', '2026-11-18 11:00:00', 'Catalyst temperature monitoring',  'Cancelled', 3, 'RP-002', NULL),
(7, '2026-05-02 09:00:00', '2026-05-12 09:00:00', '2026-05-12 13:00:00', 'Reaction temperature logging',     'Completed', 9, 'RP-002', 3);


INSERT INTO Reserves (resId, serialNo) VALUES
(1, 'OLY-0001'),
(1, 'FLK-0001'),
(2, 'ZEI-0001'),
(3, 'FLK-0003'),
(4, 'OLY-0002'),
(5, 'FLK-0001'),
(6, 'FLK-0003'),
(7, 'FLK-0001');


-- 5. Maintenance & calibration:

INSERT INTO Maintenance (serialNo, startTS, endTS, type, description, cost, outcome, technicalPid) VALUES
('OLY-0001', '2026-09-10 08:00:00', '2026-09-10 12:00:00', 'Preventive', 'Annual optics cleaning and alignment', 350.00,  'Success', 6),
('ZEI-0001', '2026-08-20 09:00:00', '2026-08-21 16:00:00', 'Corrective', 'Stage motor repair',1200.00, 'Success', 7),
('FLK-0002', '2026-11-01 09:00:00', '2026-11-12 17:00:00', 'Corrective', 'Sensor probe replacement', 120.00,  'Ongoing', 6);

INSERT INTO CalibrationRecord (serialNo, calibDate, calibrationType, result, nextDueDate, remarks) VALUES
('FLK-0001', '2026-03-01', 'Temperature', 'Pass', '2027-03-01', 'Within tolerance'),
('FLK-0002', '2026-02-15', 'Temperature', 'Fail', '2026-11-15', 'Drift of 0.4 C, recalibration required'),
('OLY-0001', '2026-04-12', 'Optical alignment', 'Pass', '2027-04-12', 'No deviation');

-- 6)Consumables, suppliers , stockes:

INSERT INTO Consumable (consId, name, unitOfMeasure, hazardLevel, reorderThreshold) VALUES
(1, 'Ethanol 96%','L',  'Flammable', 10.00),
(2, 'Immersion Oil','mL', 'Low',200.00),
(3, 'Liquid Nitrogen','L','Cryogenic', 50.00),
(4, 'Sulfuric Acid 98%', 'L','Corrosive', 5.00);

INSERT INTO Supplier (suppId, name, contactEmail, phone) VALUES
(1, 'ChemSupply Maroc', 'sales@chemsupply.ma','+212 522 000 101'),
(2, 'LabEquip Trading', 'contact@labequip.ma','+212 537 000 102'),
(3, 'CryoGas Africa','orders@cryogas.africa','+212 524 000 103');


INSERT INTO Supplies (suppId, consId, labId, unitPrice) VALUES
(1, 1, 1,  45.00),
(2, 1, 1,  42.50),
(1, 1, 2,  46.00),
(1, 4, 2, 120.00),
(1, 4, 4, 118.00),
(2, 2, 1,   0.80),
(3, 3, 3,  15.00);


INSERT INTO Stocks (labId, consId, quantityOnHand, lastRestockDate, storageCondition, technicalPid, monitoringSince) VALUES
(1, 1,  25.00, '2026-10-01', 'Flammables cabinet', 6, '2026-01-15'),
(1, 2, 150.00, '2026-09-15', 'Room temperature',   6, '2026-01-15'),
(2, 1,  40.00, '2026-10-10', 'Flammables cabinet', 7, '2026-02-01'),
(2, 4,  12.00, '2026-10-05', 'Acid cabinet',       7, '2026-02-01'),
(3, 3,  80.00, '2026-10-20', 'Dewar vessel',       6, '2026-03-10');


INSERT INTO Consumes (resId, labId, consId, quantityUsed) VALUES
(1, 1, 1, 2.00),
(1, 1, 2, 5.00),
(3, 2, 4, 0.50),
(7, 1, 1, 1.50);






-- task 2.2


-- 1.
INSERT INTO Person (pid, firstName, lastName, email, affiliation, startDate, endDate)
VALUES (11, 'Yassine', 'Alaoui', 'yassine.alaoui@um6p.ma', 'UM6P', '2026-11-8', NULL);

INSERT INTO Student(pid,program) VALUES (11,'computer science');
-- Each tudent must hav at least one adviser
INSERT INTO Advises (academicPid, studentPid)
VALUES (2, 11);

-- 2.
INSERT INTO EquipmentUnit (serialNo, acquisitionDate, purchaseCost, status, portable, modelId, labId) VALUES
('OLY-0003', '2024-02-15', 19500.00, 'Available',FALSE, 1, 1);

-- 3.
INSERT INTO Reservation (resId, submissionTS, plannedStart, plannedEnd, purpose, status, madeByPid, projectCode, approverPid)
VALUES (8, '2026-10-30 08:15:00', '2026-11-20 09:00:00', '2026-11-20 12:00:00','Imaging of new samples', 'Pending', 8, 'RP-001', NULL);

INSERT INTO Reserves (resId, serialNo)
VALUES (8, 'OLY-0003');

-- 4.
UPDATE Reservation
SET status = 'Approved',
    approverPid = 1
WHERE resId = 8
  AND status = 'Pending';

-- 5.
UPDATE Stocks
SET quantityOnHand = 35.00
WHERE labId = 2
  AND consId = 1;

-- 6.
INSERT INTO Consumes (resId, labId, consId, quantityUsed)
VALUES (2, 1, 2, 10.00);

-- 7.
UPDATE Reservation
SET status = 'Cancelled'
WHERE status = 'Pending'
  AND projectCode IN (SELECT code
                      FROM ResearchProject
                      WHERE status = 'Cancelled');

-- 8.
INSERT INTO Person (pid, firstName, lastName, email, affiliation, startDate, endDate)
VALUES (999, 'Test', 'User', 'test.user@um6p.ma', 'UM6P','2026-10-10', NULL);

DELETE FROM Person WHERE pid = 999;





-- Task 3 :

-- A.Simple queries:
-- 1.
SELECT pid,firstName,lastName,email
FROM Person
ORDER By lastName,firstName;

-- 2.
SELECT DISTINCT discipline
FROM Laboratory;

-- 3.
SELECT *
FROM Person
WHERE email LIKE "%_@um6p.ma";

-- 4.
SELECT *
FROM Person
WHERE endDate IS NULL;

-- 5.
SELECT *
FROM Reservation
WHERE startDate>="2026-11-01" AND startDate<="2026-11-30";


-- B.quieries using JOINS:

-- 6 
SELECT p.firstName,p.lastName, resprj.title, par.role
FROM Participates par JOIN Person p 
On par.pid=p.pid 
JOIN ReaserchProject resprj 
ON par.projectCode=resprj.code ;

-- 7
SELECT b.budgetLine, p.firstName, p.lastName
From Budget B JOIN person p 
ON b.managerPid=p.pid;

-- 8
SELECT r.resId, p.firstName,p.lastName,resprj.title
FROM Reservationr JOIN Person p 
ON r.madeBYPid=p.pid
JOIN ResearchProject resprj 
ON resprj.code=r.projectCode;

-- 9
SELECT r.resID,r.serialNo,em.commercialName,lab.name
FROM Reserves r JOIN EquipmentUnit eu 
ON r.serailNo = eu.serialNo
JOIN EquipmentModel 
ON eu.modelId=em.modelId
JOIN Laboratory lab ON eu.labId = lab.labId;

-- 10
SELECT r.resId, p.firstName,p.lastName
FROM Reservation r JOIN Person p
ON r.approverPid=p.pid
WHERE r.status='approved';

-- 11
SELECT Lab.name, c.name, s.quantityOnHand, p.firstName,p.lastName
FROM Stocks s JOIN Laboratory lab 
ON s.labId= lab.labId
JOIN Consumable c 
ON s.consId=c.consId
JOIN Person p 
ON s.technicalPid = p.pid;



-- C. Aggregation QUeries

-- 12
Select 
   l.labId,
   l.name AS lab_name,
   COUNt(e.serialNo) AS total_equipement_units
From Laboratory
LEFT JOIN EquipmentUnit e ON l.labId=e.labId
GROUP BY l.labId,l.name;  
-- 13
SELECT 
    c.consId,
    c.name AS consumable_name,
    COALESCE(SUM(cn.quantityUsed), 0) AS total_quantity_used -- COALESCE(..., 0): Converts NULL result into 0
FROM Consumable c
LEFT JOIN Consumes cn ON c.consId = cn.consId
GROUP BY c.consId, c.name;  




-- D. Queries Combining Joins and Aggregation

-- 14
SELECT 
    l.name AS laboratory_name,
    COUNT(e.serialNo) AS equipment_unit_count
FROM Laboratory l
JOIN EquipmentUnit e ON l.labId = e.labId
GROUP BY l.labId, l.name
HAVING COUNT(e.serialNo) > 3;


-- 15
SELECT 
    rp.title AS project_title,
    SUM(b.amountGranted) AS total_amount_granted
FROM ResearchProject rp
JOIN FundsPrj fp ON rp.code = fp.projectCode
JOIN Budget b ON fp.budgetLine = b.budgetLine
GROUP BY rp.code, rp.title;


-- 16
SELECT 
    l.name AS laboratory_name,
    em.category AS equipment_category,
    COUNT(eu.serialNo) AS unit_count,
    AVG(eu.purchaseCost) AS avg_purchase_cost
FROM Laboratory l
JOIN EquipmentUnit eu ON l.labId = eu.labId
JOIN EquipmentModel em ON eu.modelId = em.modelId
GROUP BY l.labId, l.name, em.category;


-- 17
SELECT 
    s.name AS supplier_name,
    COUNT(DISTINCT sp.consId) AS distinct_consumables_count
FROM Supplier s
JOIN Supplies sp ON s.suppId = sp.suppId
GROUP BY s.suppId, s.name;


-- 18
SELECT labName, consName, MIN(unitPrice)
FROM Supplies 
GROUP BY labName;



-- 19
SELECT 
    r.resId AS reservation_id,
    CONCAT(p.firstName, ' ', p.lastName) AS made_by_name,
    SUM(cn.quantityUsed) AS total_quantity_used
FROM Reservation r
JOIN Person p ON r.madeByPid = p.pid
JOIN Consumes cn ON r.resId = cn.resId
GROUP BY r.resId, p.firstName, p.lastName;




-- E-Set Operations and Nested Queries

-- 20.

SELECT pid, firstName, lastName
FROM Person
WHERE pid IN (
SELECT supervisorPid FROM Laboratory
INTERSECT 
SELECT ManagerPid FROM Budget) ;


-- 21-

SELECT *
FROM Person 
WHERE pid NOT IN (
SELECT madeByPid
FROM Reservation) ;

-- 22-

SELECT *
FROM EquipmentUnit E
WHERE NOT EXISTS (
SELECT R.serialNo
FROM Reserves R
WHERE R.serialNo= E.serialNo) ;

-- 23-

SELECT *
FROM EquipmentUnit 
WHERE purchaseCost >= ALL (
SELECT purchaseCost
FROM EquipmentUnit) ;



-- F-Division Queries

-- Rather than taking the negative clause to do a division, I found it easier to do a counting method
SELECT p.pid, p.firstName, p.lastName, req.modelId
FROM Person p
JOIN Holds h ON p.pid = h.pid 
JOIN Requires req ON h.certCode = req.certCode
GROUP BY p.pid, p.firstName, p.lastName, req.modelId
HAVING COUNT(DISTINCT h.certCode) = (
    SELECT COUNT(*) 
    FROM Requires r 
    WHERE r.modelId = req.modelId);
