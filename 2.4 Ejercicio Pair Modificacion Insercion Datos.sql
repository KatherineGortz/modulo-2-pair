-- Crear la base de datos
CREATE SCHEMA `tienda_zapatillas`;

-- Seleccionar la base de datos para usarla
USE `tienda_zapatillas`;

-- Tabla Zapatillas
CREATE TABLE Zapatillas (
    id_zapatilla INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL
);

-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL
);

-- Tabla Empleados
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL
);

-- Tabla Facturas
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    -- Definir las claves foráneas
    CONSTRAINT fk_facturas_zapatillas FOREIGN KEY (id_zapatilla) REFERENCES Zapatillas(id_zapatilla),
    CONSTRAINT fk_facturas_empleados FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

USE tienda_zapatillas;

ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL;

ALTER TABLE zapatillas
ADD COLUMN talla INT NOT NULL;

ALTER TABLE empleados
MODIFY COLUMN salario DECIMAL (10,2) NOT NULL;

ALTER TABLE clientes
DROP COLUMN pais;

ALTER TABLE facturas
ADD COLUMN total DECIMAL(10,2) NOT NULL;

INSERT INTO zapatillas (modelo, color, marca, talla)
VALUES ('XQYUN', 'Negro', 'Nike', 42),
('UOPMN', 'Rosas', 'Nike', 39),
('OPNYT', 'Verdes', 'Adidas', 35);

INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Laura', 'Alcobendas', 25987, "2010-09-03"),
('Maria', 'Sevilla', DEFAULT, "2001-04-11"),
('Ester', 'Oviedo', 30165.98, "2000-11-29");


INSERT INTO clientes (nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES ('Monica', 1234567289, 'monica@email.com', 'Calle Felicidad','Móstoles', 'Madrid', 28176),
('Lorena', 289345678,'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', 12346),
('Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', 2345);

INSERT INTO facturas (numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)
VALUES (123, '2001-12-11', 1, 2, 1 , 54.98),
(1234, '2005-05-23', 1, 1, 3 , 89.91),
(12345, '2018-09-18', 2,3,3 , 76.23);

UPDATE zapatillas
SET color = 'amarillo'
WHERE color = 'Rosas';

UPDATE empleados
SET tienda = 'A Coruna'
WHERE nombre = 'Laura';

UPDATE clientes
SET numero_telefono = 123456728
WHERE nombre = 'Monica';

UPDATE facturas
SET total = 89.91
WHERE id_factura = 2;


