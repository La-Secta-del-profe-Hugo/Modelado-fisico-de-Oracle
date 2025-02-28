-- Base de Datos Sistema de registro de asistencia de las enfermeras a la clinica Mac Salud
-- La secta del profe Hugo
-- 27/02/2025

drop table Enfermero;

CREATE TABLE Enfermero
(
    idE NUMBER PRIMARY KEY,
    tipoDocumE VARCHAR2(20),
    nroDocumE VARCHAR2(20) UNIQUE,
    nombresE VARCHAR2(50),
    paternoE VARCHAR2(50),
    maternoE VARCHAR2(50),
    fechaNacimientoE DATE,
    generoE VARCHAR2(10)
);

drop table Ambiente;
CREATE TABLE Ambiente
(
    idAmb NUMBER PRIMARY KEY,
    nroAmb VARCHAR2(10),
    ubicacionAmb VARCHAR2(100)
);

drop table Calendario;

CREATE TABLE Calendario
(
    idC NUMBER PRIMARY KEY,
    inicioC DATE,
    finC DATE,
    nombreC VARCHAR2(50)
);

drop table Asistencia;

CREATE TABLE Asistencia
(
    idA NUMBER PRIMARY KEY,
    fechaA DATE,
    diaA VARCHAR2(20),
    asistioA CHAR(1),
    tardoA CHAR(1),
    horaEntradaA TIMESTAMP,
    horaSalidaA TIMESTAMP,
    justificacionA VARCHAR2(200),
    esDescansoA CHAR(1),
    idE NUMBER,
    idAmb NUMBER,
    idC NUMBER,
    FOREIGN KEY (idE) REFERENCES Enfermero(idE),
    FOREIGN KEY (idAmb) REFERENCES Ambiente(idAmb),
    FOREIGN KEY (idC) REFERENCES Calendario(idC)
);

-- insertar datos en Enfermero
INSERT INTO Enfermero VALUES (1, 'DNI', '12345678', 'Juan', 'Pérez', 'Gómez', TO_DATE('1990-05-12', 'YYYY-MM-DD'), 'Masculino');
INSERT INTO Enfermero VALUES (2, 'DNI', '87654321', 'María', 'López', 'Díaz', TO_DATE('1985-08-24', 'YYYY-MM-DD'), 'Femenino');

-- insertar datos en Ambiente
INSERT INTO Ambiente VALUES (1, 'A101', 'Piso 1 - Urgencias');
INSERT INTO Ambiente VALUES (2, 'B202', 'Piso 2 - Pediatría');

-- insertar datos en Calendario
INSERT INTO Calendario VALUES (1, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 'Turno Mañana');
INSERT INTO Calendario VALUES (2, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 'Turno Noche');

-- insertar datos en Asistencia
INSERT INTO Asistencia VALUES (1, TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'Lunes', 'S', 'N', TO_TIMESTAMP('2025-02-28 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-02-28 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'N', 1, 1, 1);
INSERT INTO Asistencia VALUES (2, TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'Lunes', 'S', 'S', TO_TIMESTAMP('2025-02-28 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-02-28 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Retraso por tráfico', 'N', 2, 2, 2);

SELECT * FROM Enfermero;
SELECT * FROM Ambiente;
SELECT * FROM Calendario;
SELECT * FROM Asistencia;