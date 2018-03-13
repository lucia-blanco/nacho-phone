CREATE DATABASE `NACHOPHONE`;
USE `NACHOPHONE`
;
/****** Object:  Table `GASTO`    Script Date: 07/03/2018 14:20:10 ******/


CREATE TABLE IF NOT EXISTS`GASTO`(
	`idGasto` int AUTO_INCREMENT NOT NULL,
	`usuario` int NULL,
	`tarifa` int NULL,
	`telefono` varchar(13) NOT NULL,
	`mbConsumidos` int NULL,
	`minConsumidos` int NULL,
PRIMARY KEY 
(
	`idGasto` ASC
)
)
;
/****** Object:  Table `PERFIL`    Script Date: 07/03/2018 14:20:11 ******/


CREATE TABLE IF NOT EXISTS `PERFIL`(
	`idRol` int AUTO_INCREMENT NOT NULL,
	`rol` varchar(8) NOT NULL,
	`usuario` int NOT NULL,
PRIMARY KEY 
(
	`idRol` ASC
)
)
;
/****** Object:  Table `TARIFA`    Script Date: 07/03/2018 14:20:11 ******/


CREATE TABLE IF NOT EXISTS `TARIFA`(
	`idTarifa` int AUTO_INCREMENT NOT NULL,
	`nomTarifa` varchar(20) NULL,
	`precio` double NULL,
	`mbTarifa` int NOT NULL,
	`minTarifa` int NOT NULL,
PRIMARY KEY 
(
	`idTarifa` ASC
)
)
;
/****** Object:  Table `USUARIO`    Script Date: 07/03/2018 14:20:11 ******/


CREATE TABLE IF NOT EXISTS `USUARIO`(
	`idUsuario` int AUTO_INCREMENT NOT NULL,
	`nombre` varchar(50) NOT NULL,
	`apellido` varchar(50) NOT NULL,
	`passw` varchar(20) NOT NULL,
	`dni` varchar(9) NOT NULL,
	`tlfUsuario` varchar(13) NOT NULL,
	`email` varchar(50) NOT NULL,
PRIMARY KEY 
(
	`idUsuario` ASC
)
)
;

INSERT INTO `GASTO` (`idGasto`, `usuario`, `tarifa`, `telefono`, `mbConsumidos`, `minConsumidos`) VALUES (1, 1, 1, N'111111111', 100, 15)
, (2, 2, 2, N'222222222', 150, 20)
,(3, 2, 1, N'222222220', 100, 5)
,(4, 3, 3, N'333333333', 500, 100)
,(5, 4, 1, N'444444444', 50, 5)
,(6, 4, 3, N'444444440', 1500, 800)
,(7, 5, 2, N'555555555', 250, 10)
;
INSERT INTO`PERFIL` (`idRol`, `rol`, `usuario`) VALUES (1, N'admin', 1)
,(2, N'admin', 2)
,(3, N'usuario', 3)
,(4, N'usuario', 4)
,(5, N'usuario', 5)
;
INSERT INTO `TARIFA` (`idTarifa`, `nomTarifa`, `precio`, `mbTarifa`, `minTarifa`) VALUES (1, N'Pato', 5.95, 500, 40)
,(2, N'Ganso', 12.84, 1000, 300)
,(3, N'Cisne', 21.49, 6000, 1000)
;
INSERT INTO `USUARIO` (`idUsuario`, `nombre`, `apellido`, `passw`, `dni`, `tlfUsuario`, `email`) VALUES (1, N'Aa', N'Aaa', N'Aa_1', N'11111111A', N'111111111', N'aa@aa.a')
,(2, N'Bb', N'Bbb', N'Bb_2', N'22222222B', N'222222222', N'bb@bb.b')
,(3, N'Cc', N'Ccc', N'Cc_3', N'33333333C', N'333333333', N'cc@cc.c')
,(4, N'Dd', N'Ddd', N'Dd_4', N'44444444D', N'444444444', N'dd@dd.d')
,(5, N'Ee', N'Eee', N'Ee_5', N'55555555E', N'555555555', N'ee@ee.e')
;
