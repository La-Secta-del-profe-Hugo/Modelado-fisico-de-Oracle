-- Base de Datos Sistema de registro de asistencia de clientes del gimnasio ‘Titanium’
-- La secta del profe Hugo
-- 27/02/2025
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLESPACE tbTitanium INCLUDING CONTENTS AND DATAFILES';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Crear tablespace
CREATE TABLESPACE tbTitanium
DATAFILE 'C:\Oracle\tbTitanium.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

-- Asegurar eliminación de tablas

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Asistencia CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Cliente CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE GrupoDisciplina CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Disciplina CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Crear Tabla Cliente
CREATE TABLE Cliente (
    idC NUMBER PRIMARY KEY,
    tipoDocumC VARCHAR2(50),
    nroDocumC VARCHAR2(50),
    nombresC VARCHAR2(100),
    paternoC VARCHAR2(50),
    maternoC VARCHAR2(50),
    generoC VARCHAR2(10),
    fechaNacimC DATE,
    enfermedadesC VARCHAR2(255),
    celularC VARCHAR2(20)
);

-- Crear Tabla Disciplina
CREATE TABLE Disciplina (
    idD NUMBER PRIMARY KEY,
    nombreD VARCHAR2(100),
    descripcionD VARCHAR2(255)
);

-- Crear Tabla GrupoDisciplina
CREATE TABLE GrupoDisciplina (
    idG NUMBER PRIMARY KEY,
    idD NUMBER,
    nombreG VARCHAR2(100),
    fechaInicioG DATE,
    fechaFinG DATE,
    CONSTRAINT fk_grupo_disciplina FOREIGN KEY (idD) REFERENCES Disciplina(idD)
);

-- Crear Tabla Asistencia
CREATE TABLE Asistencia (
    idA NUMBER PRIMARY KEY,
    idC NUMBER,
    fechaA DATE,
    diaA VARCHAR2(20),
    esFeriadoA VARCHAR2(10),
    asisteA VARCHAR2(10),
    horaEntradaA TIMESTAMP,
    CONSTRAINT fk_asistencia_cliente FOREIGN KEY (idC) REFERENCES Cliente(idC)
);

-- Insertar datos en Cliente (corregido)
INSERT INTO Cliente (idC, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, generoC, fechaNacimC, enfermedadesC, celularC)
VALUES (1, 'DNI', '12345678', 'Juan', 'Perez', 'Lopez', 'Masculino', TO_DATE('1995-06-15', 'YYYY-MM-DD'), 'Ninguna', '987654321');

INSERT INTO Cliente (idC, tipoDocumC, nroDocumC, nombresC, paternoC, maternoC, generoC, fechaNacimC, enfermedadesC, celularC)
VALUES (2, 'DNI', '87654321', 'María', 'Gonzalez', 'Diaz', 'Femenino', TO_DATE('1998-03-22', 'YYYY-MM-DD'), 'Asma', '912345678');

-- Insertar datos en Disciplina
INSERT INTO Disciplina VALUES (1, 'Yoga', 'Ejercicios de estiramiento y relajación');
INSERT INTO Disciplina VALUES (2, 'CrossFit', 'Entrenamiento de alta intensidad');

-- Insertar datos en GrupoDisciplina
INSERT INTO GrupoDisciplina VALUES (1, 1, 'Yoga Mañana', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'));
INSERT INTO GrupoDisciplina VALUES (2, 2, 'CrossFit Avanzado', TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'));

-- Insertar datos en Asistencia (solo si la tabla existe)
INSERT INTO Asistencia (idA, idC, fechaA, diaA, esFeriadoA, asisteA, horaEntradaA)
VALUES (1, 1, TO_DATE('2024-02-27', 'YYYY-MM-DD'), 'Martes', 'No', 'Si', TO_TIMESTAMP('2024-02-27 07:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Asistencia (idA, idC, fechaA, diaA, esFeriadoA, asisteA, horaEntradaA)
VALUES (2, 2, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'Miércoles', 'No', 'Si', TO_TIMESTAMP('2024-02-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

