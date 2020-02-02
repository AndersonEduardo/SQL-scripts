CREATE TABLE IF NOT EXISTS employees(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee_audiths(
	id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    last_name VARCHAR(50) NOT NULL,
    changed_on TIMESTAMP
);

CREATE TRIGGER log_last_name_changes 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audits
 SET employee_id = OLD.id,
	 last_name = NEW.last_name,
     changed_on = NOW();


INSERT INTO employees(first_name, last_name) 
VALUES ('Fulano', 'Silva'),
	   ('Beltrano', 'Beltrão'),
       ('Trofano', 'Magalhães')