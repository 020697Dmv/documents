-- TABLE
CREATE TABLE Aeropuerto(

idAeropuerto INT,
nombre varchar(50),
ciudad varchar(50),
direccion varchar(50),
constraint pk_ae primary key (idAeropuerto)
);
CREATE TABLE Avion(

idAvion INT,
modelo varchar(50),
capacidad INT,
fkEmpresa INT,
constraint pk_Av primary key (idAvion),
constraint fk_av foreign key(fkEmpresa) references Empresa(idEmpresa)
);
CREATE TABLE Cliente(

id INT,
nombre VARCHAR(50),
telefono VARCHAR(50),
email VARCHAR(50),
constraint pk_c primary key (id)

);
CREATE TABLE Empresa(

idEmpresa INT,
nombre varchar(50),
telefono INT,
paginaWeb varchar(50),
constraint pk_E primary key (idEmpresa)
);
CREATE TABLE Empresa_Aeropuerto(

idEmpresa_Aeropuerto INT,
fkAero INT,
fkEmpre INT,
constraint pk_t primary key (idEmpresa_Aeropuerto),
constraint fk_av foreign key(fkAero) references Empresa(idempresa),
constraint fk_av foreign key(fkEmpre) references Aeropuerto(idaeropuerto)
);
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
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
