-- Base de Datos Sistema de registro de ventas de platillos y bebidas en la polleria "Don Gallino"
-- La secta del profe Hugo
-- 27/02/2025

drop table Cliente;
CREATE TABLE Cliente
(
    idC NUMBER PRIMARY KEY,
    tipoDocumC VARCHAR2(20),
    nroDocumC VARCHAR2(20) UNIQUE,
    nombresC VARCHAR2(50),
    paternoC VARCHAR2(50),
    maternoC VARCHAR2(50),
    celularC CHAR(9)
);

drop table Comprobante;

CREATE TABLE Comprobante
(
    idComp NUMBER PRIMARY KEY,
    fechaHoraComp TIMESTAMP DEFAULT SYSTIMESTAMP,
    totalComp NUMBER(10,2),
    idC NUMBER,
    FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

drop table Categoria;

CREATE TABLE Categoría
(
    idCat NUMBER PRIMARY KEY,
    nombreCat VARCHAR2(50),
    descripcionCat VARCHAR2(100)
);

drop table Producto;

CREATE TABLE Producto
(
    idP NUMBER PRIMARY KEY,
    nombreP VARCHAR2(50),
    decripcionP VARCHAR2(100),
    precioReferencialP NUMBER(10,2),
    idCat NUMBER,
    FOREIGN KEY (idCat) REFERENCES Categoría(idCat)
);

drop table Detalle;
CREATE TABLE Detalle
(
    idDet NUMBER PRIMARY KEY,
    cantidadDet NUMBER,
    precioRealUnitarioDet NUMBER(10,2),
    subtotalDet NUMBER(10,2),
    idComp NUMBER,
    idP NUMBER,
    FOREIGN KEY (idComp) REFERENCES Comprobante(idComp),
    FOREIGN KEY (idP) REFERENCES Producto(idP)
);

-- Insertar datos de prueba en Cliente
INSERT INTO Cliente VALUES (1, 'DNI', '12345678', 'Juan', 'Perez', 'Gomez', '987654321');
INSERT INTO Cliente VALUES (2, 'DNI', '87654321', 'Maria', 'Lopez', 'Diaz', '987654322');


-- Insertar datos de prueba en Comprobante
INSERT INTO Comprobante VALUES (1, SYSTIMESTAMP, 50.00, 1);
INSERT INTO Comprobante VALUES (2, SYSTIMESTAMP, 75.50, 2);

-- Insertar datos de prueba en Categoría
INSERT INTO Categoría VALUES (1, 'Bebidas', 'Refrescos y gaseosas');
INSERT INTO Categoría VALUES (2, 'Platos', 'Comidas preparadas');

-- Insertar datos de prueba en Producto
INSERT INTO Producto VALUES (1, 'Pollo a la brasa', 'Con papas y ensalada', 35.00, 2);
INSERT INTO Producto VALUES (2, 'Inca Kola', 'Botella de 1 litro', 5.50, 1);

-- Insertar datos de prueba en Detalle
INSERT INTO Detalle VALUES (1, 1, 35.00, 35.00, 1, 1);
INSERT INTO Detalle VALUES (2, 2, 5.50, 11.00, 1, 2);

SELECT * FROM Cliente;
SELECT * FROM Comprobante;
SELECT * FROM Categoría;
SELECT * FROM Producto;
SELECT * FROM Detalle;