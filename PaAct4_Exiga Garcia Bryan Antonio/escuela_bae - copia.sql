-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 02:53:38
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela.bae`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('1234', 'Calculo', 5, 20),
('bsds', 'Base de datos', 6, 20),
('cans', 'Contruye aplicaciones', 6, 20),
('cloo', 'Calculo', 5, 20),
('ctsv', 'CTSV', 4, 10),
('fsca', 'Fisica', 6, 21),
('igle', 'Ingles', 7, 30),
('ttri', 'Tutoria', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Bryan', 'Mixto', 'Isac'),
('contabilidad', 'Diurno', 'CRIS'),
('electricidad', 'Diurno', 'Manuel'),
('Logistica', 'Vespertino', 'Diego'),
('mecanica', 'Diurno', 'Gerardo'),
('Programacion', 'Mixto', 'Angel'),
('recursos humanos', 'Diurno', 'PEPE'),
('soporte', 'diurno', 'MASTACHE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `telefono` varchar(10) NOT NULL,
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` int(4) NOT NULL,
  `domicilio` text NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`telefono`, `num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `grupo`) VALUES
('123456789', '2468101214', 'Dani Snchez', 'Garcia Barcenas', 17, 'Zacaria Barron num 12', '5AM'),
('2362366797', '2468101215', 'Omar Avalos', 'Rey Garcia', 17, 'Alvaro Obregon #9', '5LV'),
('1234567811', '2468101216', 'Cristofer Eduardo', 'Garcia Barcenas', 17, 'Col Centro #16', '5AV'),
('123456711', '369111528', 'Josue Marin', 'Sanches Godines', 18, 'Lomas del parque#12', '5AM'),
('2389234978', '93746283740', 'Jesus Angel', 'Quintero Martines', 17, 'Lidios#2', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`) VALUES
('2468101214', 'bsds', '2022-10-12', 1, 10),
('369111528', 'cans', '2022-10-04', 1, 10),
('93746283740', 'fsca', '2022-10-21', 1, 10),
('93746283740', 'igle', '2022-10-14', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `tutor` varchar(40) NOT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5AM', 'Matutino', 'Gabriel Campos', 'Alma Mastache', 'Recursos humanos'),
('5AV', 'Vespertino', 'Ildefonso Melian', 'Ignacia Meseguer', 'Recursos humanos'),
('5CM', 'Matutino', 'Josue BB', 'Yazmin Sanchez', 'Contabilidad'),
('5CV', 'vespertino', 'Damaris San Martin', 'Joaquin Gonzales', 'contabilidad'),
('5E', 'Matutino', 'Cristofer Eduardo', 'Jose Luis ', 'Electricidad'),
('5LM', 'Matutino', 'Cristofer Gonzales', 'Encarnacion Frances', 'Logistica'),
('5LV', 'Vespertino', 'Raquel Bernal', 'Marina Almeida', 'Logistica'),
('5M', 'Matutino', 'Adrian Eduado', 'Camila Carrillo Mastache', 'Mecanica'),
('5PM', 'Matutino', 'Yazmin Alejandra', 'Jesus Angel ', 'Programacion'),
('5PV', 'Vespertino', 'Dulce Alejandra', 'Silvia Carrillo Mastache', 'Programación'),
('5SM', 'Matutino', 'Francisco Montilla', 'Debora Díaz', 'Soporte'),
('5SV', 'Vespertino', 'Patricia Balaguer', 'Gabriela Jiménez', 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
