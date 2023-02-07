CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    type_presta VARCHAR(50) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    client_id INT NOT NULL,
    nb_days INT NOT NULL,
    unit_price INT NOT NULL,
    total_exclude_tax INT NOT NULL,
    total_with_tax INT NOT NULL,
    state INT NOT NULL check (state >= 0 AND state <= 2)
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

INSERT INTO clients (company_name, first_name, last_name, email, phone, address, zip_code, city, country, state) VALUES ('Formation', 'Angular init', 2, 3, 1200, 3600, 4320, 0),
('Formation', 'React avancé', 2, 3, 1000, 3000, 3600, 2),
('Coaching','React Techlead',1,20,900,18000,21600,2),
('Coaching','Nest.js Techlead',1,50,800,40000,48000,1),
('Coaching','React Teachead',3,null,null,null,null,null),
('Coaching','Jakarta EE',3,null,null,null,null,null),
('Coaching','Angular Techlead',4,null,null,null,null,null);

