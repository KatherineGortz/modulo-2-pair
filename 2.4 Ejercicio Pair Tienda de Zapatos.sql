 CREATE SCHEMA `tienda_zapatillas`;
 USE `tienda_zapatillas`;
 
CREATE TABLE zapatillas (
	id_zapatilla INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR (45) NOT NULL
    );

CREATE TABLE clientes (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL,
	numero_telefono INT NOT NULL,
	email VARCHAR(45) NOT NULL,
	direccion VARCHAR(45) NOT NULL,
	ciudad VARCHAR (45),
	provincia VARCHAR (45) NOT NULL,
	pais VARCHAR (45) NOT NULL, 
	codigo_postal VARCHAR (45) NOT NULL
    );
    
CREATE TABLE Empleados (
	id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL,
	tienda VARCHAR(45) NOT NULL,
	salario INT,
	fecha_incorporacion DATE NOT NULL
    );

CREATE TABLE facturas (
	id_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	numero_factura VARCHAR(45) NOT NULL ,
	fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT foreign_zapatillas
    FOREIGN KEY (id_zapatilla) REFERENCES zapatillas(id_zapatilla)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleado)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
	);
    
    