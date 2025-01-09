CREATE database TousEnProcedures;
use TousEnProcedures;
-- Créons deux tables : employees pour stocker les informations sur les employés et departments pour stocker les informations sur les départements.
CREATE TABLE departments (
    dep_id INT AUTO_INCREMENT PRIMARY KEY,
    dep_name VARCHAR(100),
    manager_email VARCHAR(100)
);
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_email VARCHAR(100),
    dep_id INT,
    FOREIGN KEY (dep_id) REFERENCES departments(dep_id)
);
-- Insertion de valeurs dans la table des employés
INSERT INTO employees (emp_name, emp_email, dep_id) VALUES 
('John Doe', 'john@example.com', 1), 
('Jane Smith', 'jane@example.com', 2);
INSERT INTO departments (dep_name, manager_email) VALUES 
('Développement', 'manager_dev@example.com'),
('Ventes', 'manager_sales@example.com');

-- Écrivons une procédure stockée pour ajouter un nouvel employé et envoyer un e-mail au manager du département.
DELIMITER // 
create procedure AjoutNouvelEmp(
  in emp_name varchar(30),
  in emp_email varchar(50),
  in dep_id int
)
begin
   declare manager_email varchar(200);
   select manager_email into manager_email from departmets where dep_id = dep_id;
   INSERT INTO employees (emp_name, emp_email, dep_id) VALUES (emp_name, emp_email, dep_id);
   insert into outbox_email(to_email, subject_email, body_email) 
   values (manager_email,  'Nouvel employé ajouté', concat('Un nouvel employé a été ajouté : ', emp_name));
end //
DELIMITER $$
-- Créons un déclencheur qui sera activé chaque fois qu'un nouvel employé est ajouté à la table employees.

CREATE TRIGGER NouvelEmployeTrigger AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    -- Appel de la procédure AjouterEmploye avec les paramètres appropriés
    CALL AjouterEmploye(NEW.emp_id, NEW.emp_email, NEW.dep_id);
END;

INSERT INTO departments (dep_name, manager_email) VALUES 
('Finance', 'manager_fin@example.com');
INSERT INTO employees (emp_name, emp_email, dep_id) VALUES 
('Firdaous Bakkali', 'firdaousbakkali6@example.com', 1);