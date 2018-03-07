CREATE DATABASE NACHOPHONE
USE NACHOPHONE

CREATE TABLE TARIFA
	(idTarifa int IDENTITY PRIMARY KEY,
	nomTarifa varchar(20) UNIQUE,
	precio float,
	mbTarifa int NOT NULL,
	minTarifa int NOT NULL
	)

CREATE TABLE USUARIO
	(idUsuario int IDENTITY PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	apellido varchar(50) NOT NULL,
	passw varchar(20) NOT NULL,
	dni  varchar(9) NOT NULL UNIQUE CHECK (dni LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'),
	tlfUsuario varchar(13) NOT NULL,
	email varchar(50) NOT NULL,
	)

CREATE TABLE PERFIL
	(idRol int IDENTITY PRIMARY KEY,
	rol varchar(8) NOT NULL CHECK (ROL IN ('admin', 'usuario')),
	usuario int NOT NULL,
	FOREIGN KEY (usuario) references USUARIO (idUsuario)
	)

CREATE TABLE GASTO
	(idGasto int IDENTITY PRIMARY KEY,
	usuario int,
	tarifa int,
	telefono varchar(13) NOT NULL UNIQUE ,
	mbConsumidos int,
	minConsumidos int,
	FOREIGN KEY (tarifa) references TARIFA (idTarifa),
	FOREIGN KEY (usuario) references USUARIO (idUsuario)
	)