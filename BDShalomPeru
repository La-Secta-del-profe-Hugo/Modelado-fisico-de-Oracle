-- Crear la Base de Datos BDShalom (en Oracle, esto lo hace el DBA)
-- La secta del profe Hugo
-- 27/02/2025


-- Eliminar tablas si existen
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE DetalleDelComprobante CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Comprobante CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Paquete CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Cliente CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Crear tabla Cliente
CREATE TABLE Cliente (
    idCliente CHAR(9) PRIMARY KEY,
    tipoDocumC VARCHAR2(10) NOT NULL,
    nroDocumC CHAR(10) NOT NULL,
    nombresC VARCHAR2(50) NOT NULL,
    paternoC VARCHAR2(50) NOT NULL,
    maternoC VARCHAR2(50) NOT NULL,
    celularC CHAR(9) NOT NULL,
    idReflexivo CHAR(9) UNIQUE NULL,
    CONSTRAINT fk_cliente_ref FOREIGN KEY (idReflexivo) REFERENCES Cliente(idCliente)
);

-- Crear tabla Paquete
CREATE TABLE Paquete (
    idP NUMBER PRIMARY KEY,
    descripcionP NVARCHAR2(50),
    pesoP NUMBER(8,2)
);

-- Crear tabla Comprobante
CREATE TABLE Comprobante (
    idComp NUMBER PRIMARY KEY,
    fechaHoraComp DATE,
    totalComp NUMBER(8,2),
    OrigenComp VARCHAR2(50),
    DestinoComp VARCHAR2(50),
    idCliente CHAR(9),
    CONSTRAINT fk_comprobante_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Crear tabla DetalleDelComprobante
CREATE TABLE DetalleDelComprobante (
    idDet NUMBER PRIMARY KEY,
    precioPorKiloDet NUMBER(8,2),
    subtotalDet NUMBER(8,2),
    idComp NUMBER,
    idP NUMBER UNIQUE NULL,
    CONSTRAINT fk_detalle_comprobante FOREIGN KEY (idComp) REFERENCES Comprobante(idComp),
    CONSTRAINT fk_detalle_paquete FOREIGN KEY (idP) REFERENCES Paquete(idP)
);

INSERT INTO Cliente (idCliente, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, celularC, idReflexivo) 
VALUES ('C00000001', 'DNI', '1234567890', 'Juan', 'Pe?rez', 'Go?mez', '987654321', NULL);
INSERT INTO Cliente (idCliente, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, celularC, idReflexivo) 
VALUES ('C00000002', 'DNI', '0987654321', 'Mari?a', 'Lo?pez', 'Torres', '912345678', 'C00000001');
INSERT INTO Cliente (idCliente, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, celularC, idReflexivo) 
VALUES ('C00000003', 'DNI', '1122334455', 'Carlos', 'Rami?rez', 'Di?az', '956789123', NULL);
INSERT INTO Cliente (idCliente, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, celularC, idReflexivo) 
VALUES ('C00000004', 'DNI', '6677889900', 'Sofi?a', 'Ferna?ndez', 'Vargas', '923456789', 'C00000003');
INSERT INTO Cliente (idCliente, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, celularC, idReflexivo) 
VALUES ('C00000005', 'DNI', '2233445566', 'Diego', 'Castillo', 'Morales', '934567890', NULL);

INSERT INTO Paquete (idP, descripcionP, pesoP) VALUES (1, 'Ropa y accesorios', 5.50);
INSERT INTO Paquete (idP, descripcionP, pesoP) VALUES (2, 'Electrodome?sticos', 12.75);
INSERT INTO Paquete (idP, descripcionP, pesoP) VALUES (3, 'Juguetes para nin?os', 3.20);
INSERT INTO Paquete (idP, descripcionP, pesoP) VALUES (4, 'Material de oficina', 7.80);
INSERT INTO Paquete (idP, descripcionP, pesoP) VALUES (5, 'Libros y documentos', 4.35);

INSERT INTO Comprobante (idComp, fechaHoraComp, totalComp, OrigenComp, DestinoComp, idCliente) 
VALUES (101, TO_DATE('2025-02-19 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 120.50, 'Cusco', 'Lima', 'C00000001');
INSERT INTO Comprobante (idComp, fechaHoraComp, totalComp, OrigenComp, DestinoComp, idCliente) 
VALUES (102, TO_DATE('2025-02-20 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 75.90, 'Arequipa', 'Trujillo', 'C00000002');
INSERT INTO Comprobante (idComp, fechaHoraComp, totalComp, OrigenComp, DestinoComp, idCliente) 
VALUES (103, TO_DATE('2025-02-21 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 98.30, 'Lima', 'Iquitos', 'C00000003');
INSERT INTO Comprobante (idComp, fechaHoraComp, totalComp, OrigenComp, DestinoComp, idCliente) 
VALUES (104, TO_DATE('2025-02-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 85.75, 'Tacna', 'Piura', 'C00000004');
INSERT INTO Comprobante (idComp, fechaHoraComp, totalComp, OrigenComp, DestinoComp, idCliente) 
VALUES (105, TO_DATE('2025-02-23 18:20:00', 'YYYY-MM-DD HH24:MI:SS'), 150.60, 'Puno', 'Cusco', 'C00000005');

INSERT INTO DetalleDelComprobante (idDet, precioPorKiloDet, subtotalDet, idComp, idP) 
VALUES (201, 10.00, 55.00, 101, 1);
INSERT INTO DetalleDelComprobante (idDet, precioPorKiloDet, subtotalDet, idComp, idP) 
VALUES (202, 12.50, 159.38, 102, 2);
INSERT INTO DetalleDelComprobante (idDet, precioPorKiloDet, subtotalDet, idComp, idP) 
VALUES (203, 8.75, 28.00, 103, 3);
INSERT INTO DetalleDelComprobante (idDet, precioPorKiloDet, subtotalDet, idComp, idP) 
VALUES (204, 9.80, 76.44, 104, 4);
INSERT INTO DetalleDelComprobante (idDet, precioPorKiloDet, subtotalDet, idComp, idP) 
VALUES (205, 11.20, 48.72, 105, 5);

SELECT * FROM Cliente;
SELECT * FROM Paquete;
SELECT * FROM Comprobante;
SELECT * FROM DetalleDelComprobante;


SELECT a.table_name, a.column_name, a.constraint_name, c.r_constraint_name, c.table_name AS referenced_table
FROM user_cons_columns a
JOIN user_constraints c ON a.constraint_name = c.constraint_name
WHERE c.constraint_type = 'R';

