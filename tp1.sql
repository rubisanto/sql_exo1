CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    type_presta VARCHAR(50) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    client_id INT NOT NULL,
    nb_days INT NOT NULL,
    unit_price INT NOT NULL,
    total_exclude_tax INT NOT NULL,
    total_with_tax INT NOT NULL,
    state INT NOT NULL check (state >= 0 AND state <= 2),
    FOREIGN KEY (client_id) REFERENCES clients (id)
)



CREATE TABLE IF NOT EXISTS clients (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	address VARCHAR(255) NOT NULL,
	zip_code VARCHAR(10) NOT NULL,
	city VARCHAR(100) NOT NULL,
	country VARCHAR(50) NOT NULL,
	state INT NOT NULL check (state >= 0 AND state <= 1)

)



INSERT INTO orders (type_presta, designation, client_id, nb_days, unit_price, total_exclude_tax, total_with_tax, state)
VALUES ('Formation', 'Angular init', 2, 3, 1200, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)),  0),
('Formation', 'React avancé', 2, 3, 1200, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)), 2),
('Coaching','React Techlead',1,20,900,(nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)) ,2),
('Coaching','Nest.js Techlead',1,50,800, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)),1),
('Coaching','Angular Techlead',2,20,900, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)),2),
('Coaching','Angular Techlead',2,50,800, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)),1),
('Coaching','Jakarta EE',1,20,900, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)),2),
('Coaching','Angular Techlead',3,50,800, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)),1);
('Coaching','Angular Techlead',4,50,800, (nb_days*unit_price), (total_exclude_tax + (total_exclude_tax * 20 / 100)),1);



-- HT + (HT x TVA / 100)

INSERT INTO clients(company_name,first_name,last_name,email,phone,address,zip_code,city,country,state)
VALUES
	('Sopra','Fabrice','Martin','martin@mail.com','06 56 85 84 33','abc','xyz','Nantes','France',0),
	('M2I Formation','Julien','Lamard','lamard@mail.com','06 11 22 33 44','abc','xyz','Paris','France',1),
	('ATOS','Jean','Dupont','jeandupont@gmail.com','06 11 22 33 44','abc','xyz','Paris','France',1),
	('SOPRA STERIA','Pierre', 'Martin','pierremartin@gmail.com', '06 11 22 33 44','abc','xyz','Paris','France',1),
    


-- Afficher toutes les formations sollicités par le client M2i formation M2u information
SELECT * FROM clients WHERE company_name = 'M2I Formation';

--  Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching
SELECT last_name,first_name, email, phone FROM clients INNER JOIN orders ON clients.id = orders.client_id WHERE type_presta = 'Coaching';

--  Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching pour les accompagnements React.js
SELECT last_name, first_name, email, phone FROM clients INNER JOIN orders ON  clients.id = orders.clients_id WHERE type_presta = 'Coaching' AND designation LIKE 'React%';

-- Pour chacune des demandes de formation, afficher le prix UHT et prix TTC en se basant sur le unité Price(TJM) et le nombre de jours de prestation tout en sachant que la TVA est de 20%.

-- Lister toutes les prestations qui sont confirmés et qui vont rapporter plus 30.000€
SELECT * FROM orders WHERE state = 2 AND total_with_tax > 30000;

