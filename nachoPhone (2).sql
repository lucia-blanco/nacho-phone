-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-03-2018 a las 10:43:56
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nachoPhone`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ADMIN`
--

CREATE TABLE `ADMIN` (
  `IDADMIN` int(10) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSW` varchar(30) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(50) NOT NULL,
  `TLFADMIN` varchar(50) NOT NULL,
  `FECHALT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ADMIN`
--

INSERT INTO `ADMIN` (`IDADMIN`, `DNI`, `EMAIL`, `PASSW`, `NOMBRE`, `APELLIDO`, `TLFADMIN`, `FECHALT`) VALUES
(1, '10101010P', 'leon@nachophone.com', 'admin', 'Paco', 'Leon', '666233241', '2018-03-15 12:09:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GASTO`
--

CREATE TABLE `GASTO` (
  `IDGASTO` int(10) NOT NULL,
  `USUARIO` int(10) DEFAULT NULL,
  `TARIFA` int(10) DEFAULT NULL,
  `TELEFONO` varchar(13) DEFAULT NULL,
  `MINCONSUMIDOS` int(11) DEFAULT NULL,
  `MBCONSUMIDOS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GASTO`
--

INSERT INTO `GASTO` (`IDGASTO`, `USUARIO`, `TARIFA`, `TELEFONO`, `MINCONSUMIDOS`, `MBCONSUMIDOS`) VALUES
(1, 1, 1, '623093671', 10, 300),
(2, 1, 2, '684021600', 100, 600),
(3, 2, 2, '667093674', 20, 1000),
(4, 3, 3, '655093771', 500, 2000),
(5, 4, 3, '777093683', 237, 1800),
(6, 5, 2, '611008422', 150, 500),
(7, 5, 1, '611008433', 50, 800),
(8, 6, 3, '623093888', 400, 3000),
(9, 7, 1, '648190671', 23, 10),
(10, 8, 3, '774055621', 100, 2000),
(11, 8, 2, '622055333', 100, 600),
(12, 9, 1, '688550322', 20, 200),
(13, 10, 1, '600111671', 10, 100),
(14, 10, 2, '600111672', 200, 600),
(15, 10, 3, '600111673', 500, 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TARIFA`
--

CREATE TABLE `TARIFA` (
  `IDTARIFA` int(10) NOT NULL,
  `NOMTARIFA` varchar(30) NOT NULL,
  `PRECIO` decimal(5,2) NOT NULL,
  `MINTARIFA` int(11) NOT NULL,
  `MBTARIFA` int(11) NOT NULL,
  `FECHALT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TARIFA`
--

INSERT INTO `TARIFA` (`IDTARIFA`, `NOMTARIFA`, `PRECIO`, `MINTARIFA`, `MBTARIFA`, `FECHALT`) VALUES
(1, 'Nachito', '6.50', 60, 1000, '2018-03-15 11:49:54'),
(2, 'Nachete', '15.00', 300, 3000, '2018-03-15 11:49:54'),
(3, 'Nachon', '30.00', 3000, 30000, '2018-03-19 13:32:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `IDUSUARIO` int(10) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSW` varchar(30) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDO` varchar(50) NOT NULL,
  `TLFUSUARIO` varchar(50) NOT NULL,
  `FECHALT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`IDUSUARIO`, `DNI`, `EMAIL`, `PASSW`, `NOMBRE`, `APELLIDO`, `TLFUSUARIO`, `FECHALT`) VALUES
(1, '11111111H', 'perez@gmail.com', 'user', 'Juan', 'Perez', '623093671', '2018-03-19 11:32:22'),
(2, '22222222J', 'ruiz@gmail.com', 'user', 'Ana', 'Ruiz', '667093674', '2018-03-19 11:32:22'),
(3, '33333333P', 'rueda@gmail.com', 'user', 'Belen', 'Rueda', '655093771', '2018-03-19 11:32:22'),
(4, '44444444A', 'ortega@gmail.com', 'user', 'Amancio', 'Ortega', '777093683', '2018-03-19 11:32:22'),
(5, '55555555K', 'rodriguez@gmail.com', 'user', 'Jose', 'Rodriguez', '611008422', '2018-03-19 11:32:22'),
(6, '66666666Q', 'andreual@gmail.com', 'user', 'Paco', 'Alonso', '623093888', '2018-03-21 08:17:17'),
(7, '77777777B', 'amartin@gmail.com', 'user', 'Antonio', 'Martin', '648190671', '2018-03-21 08:20:05'),
(8, '88888888Y', 'martinez@gmail.com', 'user', 'Alejandra', 'Martinez', '774055621', '2018-03-19 11:32:22'),
(9, '99999999R', 'zamora@gmail.com', 'user', 'Lucia', 'Zamora', '688550322', '2018-03-19 11:32:22'),
(10, '12345678Z', 'martinez1@gmail.com', 'user', 'Eva', 'Martinez', '600111671', '2018-03-21 09:05:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ADMIN`
--
ALTER TABLE `ADMIN`
  ADD PRIMARY KEY (`IDADMIN`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- Indices de la tabla `GASTO`
--
ALTER TABLE `GASTO`
  ADD PRIMARY KEY (`IDGASTO`),
  ADD KEY `FK_USUARIO` (`USUARIO`),
  ADD KEY `FK_TARIFA` (`TARIFA`);

--
-- Indices de la tabla `TARIFA`
--
ALTER TABLE `TARIFA`
  ADD PRIMARY KEY (`IDTARIFA`),
  ADD UNIQUE KEY `NOMTARIFA` (`NOMTARIFA`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ADMIN`
--
ALTER TABLE `ADMIN`
  MODIFY `IDADMIN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `GASTO`
--
ALTER TABLE `GASTO`
  MODIFY `IDGASTO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `TARIFA`
--
ALTER TABLE `TARIFA`
  MODIFY `IDTARIFA` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `IDUSUARIO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `GASTO`
--
ALTER TABLE `GASTO`
  ADD CONSTRAINT `FK_TARIFA` FOREIGN KEY (`TARIFA`) REFERENCES `TARIFA` (`IDTARIFA`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`USUARIO`) REFERENCES `USUARIO` (`IDUSUARIO`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
