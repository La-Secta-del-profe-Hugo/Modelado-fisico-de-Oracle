-- Base de Datos Sistema de registro de asistencia del personal del INPE
-- La secta del profe Hugo
-- 27/02/2025

-- Eliminar la base de datos si existe (Oracle no permite DROP DATABASE, solo eliminaci�n de tablas)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Cuenta CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Operacion CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Banco CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Empleado CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Cliente CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Asistencia CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Turno CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE A�o CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Crear tabla A�o
CREATE TABLE A�o (
    idA�o CHAR(9) PRIMARY KEY,
    inicioA�o DATE NOT NULL,
    finA�o DATE NOT NULL
);

-- Crear tabla Turno
CREATE TABLE Turno (
    idT CHAR(9) PRIMARY KEY,
    nombreT VARCHAR2(50) NOT NULL,
    inicioT TIMESTAMP NOT NULL,
    finT TIMESTAMP NOT NULL,
    idA�o CHAR(9) NOT NULL,
    CONSTRAINT fk_turno_a�o FOREIGN KEY (idA�o) REFERENCES A�o(idA�o)
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
    idE CHAR(9) PRIMARY KEY,
    tipoDocumE CHAR(10) NOT NULL,
    nroDocumE CHAR(9) NOT NULL,
    nombresE VARCHAR2(50) NOT NULL,
    paternoE VARCHAR2(50) NOT NULL,
    maternoE VARCHAR2(50) NOT NULL,
    celularE CHAR(9) NOT NULL,
    idSupervisor CHAR(9) NULL,
    CONSTRAINT fk_empleado_supervisor FOREIGN KEY (idSupervisor) REFERENCES Empleado(idE)
);

-- Crear tabla Asistencia
CREATE TABLE Asistencia (
    idA CHAR(9) PRIMARY KEY,
    fechaA DATE NOT NULL,
    diaA DATE NOT NULL,
    esFeriadoA DATE NOT NULL,
    asistioA BOOLEAN NOT NULL,
    tardoA BOOLEAN NOT NULL,
    horaEntradaA TIMESTAMP NOT NULL,
    horaSalidaA TIMESTAMP NOT NULL,
    idT CHAR(9) NOT NULL,
    idE CHAR(9) NOT NULL,
    CONSTRAINT fk_asistencia_turno FOREIGN KEY (idT) REFERENCES Turno(idT),
    CONSTRAINT fk_asistencia_empleado FOREIGN KEY (idE) REFERENCES Empleado(idE)
);

-- Insertar ejemplos en A�o
INSERT INTO A�o VALUES ('A00000001', DATE '2025-01-01', DATE '2025-12-31');
INSERT INTO A�o VALUES ('A00000002', DATE '2026-01-01', DATE '2026-12-31');
INSERT INTO A�o VALUES ('A00000003', DATE '2027-01-01', DATE '2027-12-31');
INSERT INTO A�o VALUES ('A00000004', DATE '2028-01-01', DATE '2028-12-31');
INSERT INTO A�o VALUES ('A00000005', DATE '2029-01-01', DATE '2029-12-31');

-- Insertar ejemplos en Turno
INSERT INTO Turno VALUES ('T00000001', 'Ma�ana', TIMESTAMP '08:00:00', TIMESTAMP '14:00:00', 'A00000001');
INSERT INTO Turno VALUES ('T00000002', 'Tarde', TIMESTAMP '14:00:00', TIMESTAMP '20:00:00', 'A00000001');
INSERT INTO Turno VALUES ('T00000003', 'Noche', TIMESTAMP '20:00:00', TIMESTAMP '02:00:00', 'A00000001');
INSERT INTO Turno VALUES ('T00000004', 'Madrugada', TIMESTAMP '02:00:00', TIMESTAMP '08:00:00', 'A00000001');
INSERT INTO Turno VALUES ('T00000005', 'Mixto', TIMESTAMP '10:00:00', TIMESTAMP '18:00:00', 'A00000002');

-- Insertar ejemplos en Empleado
INSERT INTO Empleado VALUES ('E00000001', 'DNI', '123456789', 'Juan', 'P�rez', 'G�mez', '987654321', NULL);
INSERT INTO Empleado VALUES ('E00000002', 'DNI', '987654321', 'Mar�a', 'L�pez', 'Fern�ndez', '923456789', 'E00000001');
INSERT INTO Empleado VALUES ('E00000003', 'DNI', '111223344', 'Carlos', 'Ram�rez', 'D�az', '912345678', NULL);
INSERT INTO Empleado VALUES ('E00000004', 'DNI', '444555666', 'Ana', 'Mart�nez', 'S�nchez', '934567890', 'E00000001');
INSERT INTO Empleado VALUES ('E00000005', 'DNI', '777888999', 'Luis', 'Torres', 'Mendoza', '956789012', NULL);

-- Insertar ejemplos en Asistencia
INSERT INTO Asistencia VALUES ('A00000001', DATE '2025-01-01', DATE '2025-01-01', DATE '2025-01-01', TRUE, FALSE, TIMESTAMP '08:05:00', TIMESTAMP '14:00:00', 'T00000001', 'E00000001');
INSERT INTO Asistencia VALUES ('A00000002', DATE '2025-01-02', DATE '2025-01-02', DATE '2025-01-02', TRUE, TRUE, TIMESTAMP '08:15:00', TIMESTAMP '14:10:00', 'T00000001', 'E00000002');
INSERT INTO Asistencia VALUES ('A00000003', DATE '2025-01-03', DATE '2025-01-03', DATE '2025-01-03', FALSE, FALSE, NULL, NULL, 'T00000002', 'E00000003');
INSERT INTO Asistencia VALUES ('A00000004', DATE '2025-01-04', DATE '2025-01-04', DATE '2025-01-04', TRUE, FALSE, TIMESTAMP '14:00:00', TIMESTAMP '20:00:00', 'T00000002', 'E00000004');
INSERT INTO Asistencia VALUES ('A00000005', DATE '2025-01-05', DATE '2025-01-05', DATE '2025-01-05', TRUE, TRUE, TIMESTAMP '20:10:00', TIMESTAMP '02:00:00', 'T00000003', 'E00000005');

SELECT * FROM A�o;
SELECT * FROM Turno;
SELECT * FROM Empleado;
SELECT * FROM Asistencia;

