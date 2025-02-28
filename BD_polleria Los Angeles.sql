-- Base de Datos Sistema de facturación electrónica de la polleria Los Angeles
-- La secta del profe Hugo
-- 27/02/2025
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLESPACE tbAngeles INCLUDING CONTENTS AND DATAFILES';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Crear tablespace
CREATE TABLESPACE tbAngeles
DATAFILE 'C:\Oracle\tbAngeles.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

-- Eliminar tablas si existen
DROP TABLE Detalle CASCADE CONSTRAINTS;
DROP TABLE Producto CASCADE CONSTRAINTS;
DROP TABLE Categoria CASCADE CONSTRAINTS;
DROP TABLE Comprobante CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;

-- Tabla Cliente
CREATE TABLE Cliente (
    idC INT PRIMARY KEY,
    tipoDocumC VARCHAR2(50),
    nroDocumC VARCHAR2(50) UNIQUE,
    nombresC VARCHAR2(100),
    paternoC VARCHAR2(50),
    maternoC VARCHAR2(50),
    celularC VARCHAR2(20)
);

-- Tabla Comprobante
CREATE TABLE Comprobante (
    idComp INT PRIMARY KEY,
    idC INT,
    fechaHoraComp TIMESTAMP,
    totalComp DECIMAL(10,2),
    CONSTRAINT fk_comprobante_cliente FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- Tabla Categoria
CREATE TABLE Categoria (
    idCat INT PRIMARY KEY,
    nombreCat VARCHAR2(100),
    descripcionCat VARCHAR2(255)
);

-- Tabla Producto
CREATE TABLE Producto (
    idP INT PRIMARY KEY,
    idCat INT,
    nombreP VARCHAR2(100),
    descripcionP VARCHAR2(255),
    precioReferencialP DECIMAL(10,2),
    CONSTRAINT fk_producto_categoria FOREIGN KEY (idCat) REFERENCES Categoria(idCat)
);

-- Tabla Detalle
CREATE TABLE Detalle (
    idDet INT PRIMARY KEY,
    idComp INT,
    idP INT,
    cantidadDet INT,
    precioRealUnitarioDet DECIMAL(10,2),
    subtotalDet DECIMAL(10,2),
    CONSTRAINT fk_detalle_comprobante FOREIGN KEY (idComp) REFERENCES Comprobante(idComp),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (idP) REFERENCES Producto(idP)
);

-- Insertar datos en Cliente
INSERT INTO Cliente VALUES (1, 'DNI', '12345678', 'Carlos', 'Fernandez', 'Gomez', '987654321');
INSERT INTO Cliente VALUES (2, 'DNI', '87654321', 'Ana', 'Lopez', 'Martinez', '912345678');

-- Insertar datos en Categoria
INSERT INTO Categoria VALUES (1, 'Pollo', 'Platos a base de pollo');
INSERT INTO Categoria VALUES (2, 'Bebidas', 'Refrescos y bebidas');

-- Insertar datos en Producto
INSERT INTO Producto VALUES (1, 1, 'Pollo a la brasa', 'Pollo entero con papas y ensalada', 55.00);
INSERT INTO Producto VALUES (2, 2, 'Chicha Morada', 'Jarra de chicha morada', 10.00);

-- Insertar datos en Comprobante
INSERT INTO Comprobante VALUES (1, 1, TO_DATE('2024-02-27', 'YYYY-MM-DD HH24:MI:SS'), 65.00);
INSERT INTO Comprobante VALUES (2, 2, TO_DATE('2024-02-28', 'YYYY-MM-DD HH24:MI:SS'), 10.00);

-- Insertar datos en Detalle
INSERT INTO Detalle VALUES (1, 1, 1, 1, 55.00, 55.00);
INSERT INTO Detalle VALUES (2, 2, 2, 1, 10.00, 10.00);

