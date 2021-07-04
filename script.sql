-- TABLAS

-- Crea la tabla Aeropuerto

CREATE TABLE Aeropuerto(

idAeropuerto INT,
nombre varchar(50),
ciudad varchar(50),
direccion varchar(50),
constraint pk_ae primary key (idAeropuerto)
);

-- Crea la tabla Avion

CREATE TABLE Avion(

idAvion INT,
modelo varchar(50),
capacidad INT,
fkEmpresa INT,
constraint pk_Av primary key (idAvion),
constraint fk_av foreign key(fkEmpresa) references Empresa(idEmpresa)
);

-- Crea la tabla Cliente

CREATE TABLE Cliente(

id INT,
nombre VARCHAR(50),
telefono VARCHAR(50),
email VARCHAR(50),
constraint pk_c primary key (id)

);

-- Crea la tabla Empresa

CREATE TABLE Empresa(

idEmpresa INT,
nombre varchar(50),
telefono INT,
paginaWeb varchar(50),
constraint pk_E primary key (idEmpresa)
);

-- Crea la tabla Empresa_Aeropuerto

CREATE TABLE Empresa_Aeropuerto(

idEmpresa_Aeropuerto INT,
fkAero INT,
fkEmpre INT,
constraint pk_t primary key (idEmpresa_Aeropuerto),
constraint fk_av foreign key(fkAero) references Empresa(idempresa),
constraint fk_av foreign key(fkEmpre) references Aeropuerto(idaeropuerto)
);

-- Crea la tabla Tiquetes

CREATE TABLE Tiquetes(

idTiquete INT,
valor VARCHAR(50),
silla VARCHAR(50),
clase VARCHAR(50),
equipaje VARCHAR(50),
fkCliente INT,
fkVuelo INT,
constraint pk_t primary key (idTiquete),
constraint fk_av foreign key(fkVuelo) references Vuelo(idVuelo),
constraint fk_av foreign key(fkCliente) references Cliente(id)
);

-- Crea la tabla Vuelo

CREATE TABLE Vuelo(

idVuelo INT,
fecha date,
capacidad INT,
hora varchar(50),
fkAeropuerto int,
fkEmpresa int,
constraint pk_t primary key (idVuelo),
constraint fk_ae foreign key(fkAeropuerto) references Aeropuerto(idAeropuerto),
constraint fk_epr foreign key(fkEmpresa) references Empresa(idEmpresa)

);
 
-- ACTUALIZAR FILAS

UPDATE Vuelo set capacidad=582 where idvuelo=147;

UPDATE Tiquetes set valor=4800 where idtiquete=963;

UPDATE Tiquetes set valor=3000 where idtiquete=147;

delete from Vuelo where  idTiquete=963;

 
-- Consultas
 
--Condicionales y Operadores

SELECT nombre,email from Cliente;

--Limite

SELECT * from Vuelo LIMIT 4;
SELECT * from Vuelo LIMIT 2,5;
SELECT modelo from Avion where capacidad>100;

--CONTADOR
Select count (idTiquete) AS Cantidad, clase from Tiquetes  group by clase;
Select count (idvuelo) AS TOTAL, capacidad from Vuelo WHERE capacidad>100 group by capacidad;

--MIN & MAX

Select MIN(capacidad) as capacidad_minima, MAX(capacidad) AS capacidad_minima from Vuelo;

--ORDENAR

Select * from tiquetes order by clase asc;
Select * from Vuelo order by idvuelo DESC;
Select * from Vuelo order by idvuelo DESC,capacidad ASC;

-- Consulta sobre valores que no sean nulos
Select * from Cliente where nombre is not null;

-- Consulta de valores entre dos rangos
Select * from Tiquetes where valor between 100000 and 300000;

-- Consulta like para buscar una cadena especifica 
Select * from Tiquetes where clase like 'alta';


Select * from Tiquetes, Vuelo where fkvuelo=idvuelo;

--Consultas con INNER JOIN Y LEFT JOIN ENTRE MULTIPLES TABLAS

Select * from Tiquetes as te INNER JOIN Vuelo as ve on te.fkvuelo=ve.idvuelo;

Select te.idtiquete, te.clase from Tiquetes as te INNER JOIN Vuelo as ve on te.fkvuelo=ve.idvuelo where ve.capacidad>100;

Select te.idtiquete, te.clase, ve.hora from Tiquetes as te LEFT JOIN Vuelo as ve on te.fkvuelo=ve.idvuelo;

SELECT cl.nombre, cl.email from Cliente as cl INNER JOIN Tiquetes as ti ON ti.fkCliente=cl.id INNER JOIN Vuelo as vu ON ti.fkVuelo=vu.idVuelo;

SELECT av.modelo, av.capacidad from Avion as av INNER JOIN Empresa as em ON av.fkEmpresa=em.idEmpresa INNER JOIN Vuelo as vu ON em.idEmpresa=vu.fkEmpresa;

--Consulta donde se unen dos consultas

select * from Avion union select * from Aeropuerto;

