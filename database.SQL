CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40),
    passcode VARCHAR(40),
    email VARCHAR(40) UNIQUE,
    gender VARCHAR(1),
    job_title VARCHAR(40),
    years_with_comp INT,
    date_joined DATE
);

-- make sure to add in foreign key

CREATE TABLE employer (
    employer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40),
    passcode VARCHAR(40),
    email VARCHAR(40) UNIQUE,
    size INT,
    industry VARCHAR(40),
    form_freq INT,
    categories VARCHAR(255),
);

ALTER TABLE employee
ADD FOREIGN KEY(employer_id)
REFERENCES employer(employer_id)
ON DELETE SET NULL;

CREATE TABLE form (
    form_id INT PRIMARY KEY AUTO_INCREMENT,
    curr_date DATE,
    title VARCHAR(40),
    description VARCHAR(200),
    FOREIGN KEY (employer_id) REFERENCES employer(employer_id) ON DELETE CASCADE,
);

CREATE TABLE question (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (form_id) REFERENCES form(form_id) ON DELETE CASCADE,
    average DECIMAL,
    text VARCHAR(200),
    category VARCHAR(50),
    num_responses INT
);

CREATE TABLE response (
    response_id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (question_id) REFERENCES question(question_id) ON DELETE CASCADE,
    answer INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE SET NULL,
);