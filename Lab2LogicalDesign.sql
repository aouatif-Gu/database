CREATE DATABASE IF NOT EXISTS labManagement;
USE labManagement;

CREATE TABLE person (
    p_id VARCHAR(20),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(20),
    affiliation VARCHAR(100),
    startDate DATE,
    endDate DATE,
    PRIMARY KEY (p_id)
);

CREATE TABLE researchProject (
    codeRP VARCHAR(20),
    title VARCHAR(100),
    startDate DATE,
    endDate DATE,
    status VARCHAR(20),
    PRIMARY KEY (codeRP)
);

CREATE TABLE equipModel (
    model_id VARCHAR(20),
    commercialName VARCHAR(50),
    manufacturer VARCHAR(50),
    category VARCHAR(50),
    requiredEnvironment VARCHAR(100),
    trainingMandatory BOOLEAN,
    PRIMARY KEY (model_id)
);

CREATE TABLE certification (
    codeC VARCHAR(20),
    title VARCHAR(100),
    issuingAuthority VARCHAR(100),
    validityPeriod INT,
    safetyLevel VARCHAR(20),
    PRIMARY KEY (codeC)
);

CREATE TABLE supplier (
    supp_id VARCHAR(20),
    name VARCHAR(100),
    contactEmail VARCHAR(100),
    phone VARCHAR(30),
    PRIMARY KEY (supp_id)
);

CREATE TABLE consumable (
    cons_id VARCHAR(20),
    name VARCHAR(100),
    unitOfMeasure VARCHAR(20),
    hazardLevel VARCHAR(20),
    reorderThreshold INT,
    PRIMARY KEY (cons_id)
);

CREATE TABLE employee (
    e_id VARCHAR(20),
    supervisor_id VARCHAR(20),
    phone VARCHAR(30),
    office VARCHAR(50),
    PRIMARY KEY (e_id),
    FOREIGN KEY (e_id) REFERENCES person(p_id) ON DELETE CASCADE,
    FOREIGN KEY (supervisor_id) REFERENCES employee(e_id)
);

CREATE TABLE student (
    s_id VARCHAR(20),
    program VARCHAR(20),
    PRIMARY KEY (s_id),
    FOREIGN KEY (s_id) REFERENCES person(p_id) ON DELETE CASCADE
);

CREATE TABLE academic (
    a_id VARCHAR(20),
    PRIMARY KEY (a_id),
    FOREIGN KEY (a_id) REFERENCES employee(e_id) ON DELETE CASCADE
);

CREATE TABLE non_academic (
    n_id VARCHAR(20),
    PRIMARY KEY (n_id),
    FOREIGN KEY (n_id) REFERENCES employee(e_id) ON DELETE CASCADE
);

CREATE TABLE administrative (
    admin_id VARCHAR(20),
    position VARCHAR(50),
    PRIMARY KEY (admin_id),
    FOREIGN KEY (admin_id) REFERENCES non_academic(n_id) ON DELETE CASCADE
);

CREATE TABLE technical (
    t_id VARCHAR(20),
    position VARCHAR(50),
    PRIMARY KEY (t_id),
    FOREIGN KEY (t_id) REFERENCES non_academic(n_id) ON DELETE CASCADE
);

CREATE TABLE faculty (
    f_id VARCHAR(20),
    position VARCHAR(50),
    PRIMARY KEY (f_id),
    FOREIGN KEY (f_id) REFERENCES academic(a_id) ON DELETE CASCADE
);

CREATE TABLE budget (
    budgetLine VARCHAR(20),
    a_manage_id VARCHAR(20) NOT NULL,
    amountGranted DECIMAL(12,2),
    amountDisbursed DECIMAL(12,2),
    startDate DATE,
    endDate DATE,
    PRIMARY KEY (budgetLine),
    FOREIGN KEY (a_manage_id) REFERENCES academic(a_id) 
);

CREATE TABLE laboratory (
    lab_id VARCHAR(20),
    f_id VARCHAR(20) NOT NULL,
    name VARCHAR(100),
    building VARCHAR(50),
    roomNumber VARCHAR(20),
    discipline VARCHAR(50),
    PRIMARY KEY (lab_id),
    FOREIGN KEY (f_id) REFERENCES faculty(f_id)
);

CREATE TABLE advises (
    a_id VARCHAR(20) not null,
    s_id VARCHAR(20),
    PRIMARY KEY (a_id, s_id),
    FOREIGN KEY (a_id) REFERENCES academic(a_id),
    FOREIGN KEY (s_id) REFERENCES student(s_id)
);

CREATE TABLE attached (
    p_id VARCHAR(20),
    lab_id VARCHAR(20),
    PRIMARY KEY (p_id, lab_id),
    FOREIGN KEY (p_id) REFERENCES person(p_id),
    FOREIGN KEY (lab_id) REFERENCES laboratory(lab_id)
);

CREATE TABLE participate (
    p_id VARCHAR(20),
    codeRP VARCHAR(20),
    roleRP VARCHAR(20),
    PRIMARY KEY (p_id, codeRP),
    FOREIGN KEY (p_id) REFERENCES person(p_id),
    FOREIGN KEY (codeRP) REFERENCES researchProject(codeRP)
);

CREATE TABLE fundslab (
    budgetLine VARCHAR(20),
    lab_id VARCHAR(20),
    PRIMARY KEY (budgetLine, lab_id),
    FOREIGN KEY (budgetLine) REFERENCES budget(budgetLine),
    FOREIGN KEY (lab_id) REFERENCES laboratory(lab_id)
);

CREATE TABLE fundsprj (
    budgetLine VARCHAR(20),
    codeRP VARCHAR(20),
    PRIMARY KEY (budgetLine, codeRP),
    FOREIGN KEY (budgetLine) REFERENCES budget(budgetLine),
    FOREIGN KEY (codeRP) REFERENCES researchProject(codeRP)
);

CREATE TABLE equipUnit (
    serialNo VARCHAR(20),
    model_instanceOf_id VARCHAR(20) NOT NULL,
    lab_id VARCHAR(20) NOT NULL,
    acquisitionDate DATE,
    purchaseCost DECIMAL,
    status VARCHAR(20),
    portable BOOLEAN,
    PRIMARY KEY (serialNo),
    FOREIGN KEY (model_instanceOf_id) REFERENCES equipModel(model_id),
    FOREIGN KEY (lab_id) REFERENCES laboratory(lab_id)
);

CREATE TABLE holds (
    p_id VARCHAR(20),
    codeC VARCHAR(20),
    issueDate DATE,
    expirationDate DATE,
    grade VARCHAR(20),
    PRIMARY KEY (p_id, codeC),
    FOREIGN KEY (p_id) REFERENCES person(p_id),
    FOREIGN KEY (codeC) REFERENCES certification(codeC)
);

CREATE TABLE requires (
    model_id VARCHAR(20),
    codeC VARCHAR(20),
    PRIMARY KEY (model_id, codeC),
    FOREIGN KEY (model_id) REFERENCES equipModel(model_id),
    FOREIGN KEY (codeC) REFERENCES certification(codeC)
);

CREATE TABLE reservation (
    res_id VARCHAR(20),
    p_id VARCHAR(20) NOT NULL,
    codeRP VARCHAR(20) NOT NULL,
    approver_id VARCHAR(20),
    submissionTS DATE,
    plannedStart DATE,
    plannedEnd DATE,
    purpose varchar(50),
    status VARCHAR(20),
    PRIMARY KEY (res_id),
    FOREIGN KEY (p_id) REFERENCES person(p_id),
    FOREIGN KEY (codeRP) REFERENCES researchProject(codeRP),
    FOREIGN KEY (approver_id) REFERENCES person(p_id)
);

CREATE TABLE reserves (
    res_id VARCHAR(20),
    serialNo VARCHAR(20) NOT NULL,
    PRIMARY KEY (res_id, serialNo),
    FOREIGN KEY (res_id) REFERENCES reservation(res_id),
    FOREIGN KEY (serialNo) REFERENCES equipUnit(serialNo)
);

CREATE TABLE dep_hasMaint (
    serialNo VARCHAR(20),
    startTS DATE,
    endTS DATE,
    typeD VARCHAR(20),
    descriptionD VARCHAR(20),
    cost DECIMAL,
    outcome VARCHAR(20),
    t_id VARCHAR(20),
    PRIMARY KEY (serialNo, startTS),
    FOREIGN KEY (serialNo) REFERENCES equipUnit(serialNo) ON DELETE CASCADE,
    FOREIGN KEY (t_id) REFERENCES technical(t_id)
);

CREATE TABLE dep_hasCalib (
    serialNo VARCHAR(20),
    calibDate DATE,
    calibrationType VARCHAR(50),
    result VARCHAR(20),
    nextDueDate DATE,
    remarks VARCHAR(100),
    PRIMARY KEY (serialNo, calibDate),
    FOREIGN KEY (serialNo) REFERENCES equipUnit(serialNo) ON DELETE CASCADE
);

CREATE TABLE supplies (
    supp_id VARCHAR(20),
    cons_id VARCHAR(20),
    lab_id VARCHAR(20),
    unitPrice DECIMAL NOT NULL default 0,
    PRIMARY KEY (supp_id, cons_id, lab_id),
    FOREIGN KEY (supp_id) REFERENCES supplier(supp_id),
    FOREIGN KEY (cons_id) REFERENCES consumable(cons_id),
    FOREIGN KEY (lab_id) REFERENCES laboratory(lab_id)
);

CREATE TABLE stocks (
    lab_id VARCHAR(20),
    cons_id VARCHAR(20),
    quantityOnHand INT NOT NULL DEFAULT 0,
    lastRestockDate DATE,
    storageCondition VARCHAR(100),
    PRIMARY KEY (lab_id, cons_id),
    FOREIGN KEY (lab_id) REFERENCES laboratory(lab_id),
    FOREIGN KEY (cons_id) REFERENCES consumable(cons_id)
);

CREATE TABLE monitors (
    lab_id VARCHAR(20),
    cons_id VARCHAR(20),
    t_id VARCHAR(20) NOT NULL,
    monitoringSince DATE,
    PRIMARY KEY (lab_id, cons_id),
    FOREIGN KEY (lab_id, cons_id) REFERENCES stocks(lab_id, cons_id) ON DELETE CASCADE,
    foreign key(t_id) references technical(t_id)
);

CREATE TABLE consumes (
    res_id VARCHAR(20),
    lab_id VARCHAR(20),
    cons_id VARCHAR(20),
    quantityUsed INT NOT NULL,
    PRIMARY KEY (res_id, lab_id, cons_id),
    FOREIGN KEY (res_id) REFERENCES reservation(res_id),
    FOREIGN KEY (lab_id, cons_id) REFERENCES stocks(lab_id, cons_id)
);