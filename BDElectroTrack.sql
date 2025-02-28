-- Base de Datos Sistema de registro de entrada y salida de electrodomesticos "Electro Track"
-- La secta del profe Hugo
-- 27/02/2025

drop table Proveedor;

create table Proveedor
(
    idP number primary key,
    razonSocialP varchar2(100),
    direccionP varchar2(200)
);

drop table OrdenDeCompra;

create table OrdenDeCompra
(
    idOrden number primary key,
    fechaHoraOrden timestamp default systimestamp,
    totalOrden number(10,2),
    idP number,
    foreign key (idP) references Proveedor(idP)
);

drop table Cliente;

create table Cliente
(
    idC number primary key,
    tipoDocumC varchar2(20),
    nroDocumC varchar2(20) unique,
    nombresC varchar2(50),
    paternoC varchar2(50),
    maternoC varchar2(50),
    celularC char(9)
);

drop table Comprobante;

create table Comprobante
(
    idComp number primary key,
    tipoComp varchar2(20),
    fechaHoraComp timestamp default systimestamp,
    totalComp number(10,2),
    idC number,
    foreign key (idC) references Cliente(idC)
);

drop table Electrodomestico;
create table Electrodomestico
(
    idE number primary key,
    nombreE varchar2(50),
    marcaE varchar2(50),
    modeloE varchar2(50),
    precioVentaE number(10,2),
    precioCompraE number(10,2)
);

drop table detalleDelIngresoSalida;
create table detalleDelIngresoSalida
(
    idDet number primary key,
    tipoDet varchar2(20),
    subtotalDet number(10,2),
    cantidadDet number,
    idOrden number,
    idComp number,
    idE number,
    foreign key (idOrden) references OrdenDeCompra(idOrden),
    foreign key (idComp) references Comprobante(idComp),
    foreign key (idE) references Electrodomestico(idE)
);

-- insertar datos en Proveedor
insert into Proveedor values (1, 'Electro Mayorista', 'Av. Las Industrias 123');
insert into Proveedor values (2, 'Tecnología Avanzada', 'Jr. Computación 456');

-- insertar datos en OrdenDeCompra
insert into OrdenDeCompra values (1, systimestamp, 1500.00, 1);
insert into OrdenDeCompra values (2, systimestamp, 2000.00, 2);

-- insertar datos en Cliente
insert into Cliente values (1, 'DNI', '12345678', 'Juan', 'Perez', 'Gomez', '987654321');
insert into Cliente values (2, 'DNI', '87654321', 'Maria', 'Lopez', 'Diaz', '987654322');

-- insertar datos en Comprobante
insert into Comprobante values (1, 'Boleta', systimestamp, 750.00, 1);
insert into Comprobante values (2, 'Factura', systimestamp, 1250.00, 2);

-- insertar datos en Electrodomestico
insert into Electrodomestico values (1, 'Refrigeradora', 'LG', 'GR-349SQ', 1200.00, 900.00);
insert into Electrodomestico values (2, 'Televisor', 'Samsung', 'QLED 50"', 2000.00, 1500.00);

-- insertar datos en detalleDelIngresoSalida
insert into detalleDelIngresoSalida values (1, 'Ingreso', 900.00, 2, 1, null, 1);
insert into detalleDelIngresoSalida values (2, 'Venta', 1200.00, 1, null, 1, 1);

select * from Proveedor;
select * from OrdenDeCompra;
select * from Cliente;
select * from Comprobante;
select * from Electrodomestico;
select * from detalleDelIngresoSalida;