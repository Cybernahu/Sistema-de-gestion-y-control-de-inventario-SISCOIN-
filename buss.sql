-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-09-2021 a las 10:00:25
-- Versión del servidor: 5.7.33-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `buss`
--
CREATE DATABASE IF NOT EXISTS `buss` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `buss`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asigna`
--

CREATE TABLE IF NOT EXISTS `asigna` (
  `fkNumeroInventario` int(6) NOT NULL,
  `fkNumeroLocal` int(4) NOT NULL,
  `fkNumeroOficina` int(4) NOT NULL,
  `fechaAsigna` date NOT NULL,
  PRIMARY KEY (`fkNumeroInventario`,`fkNumeroLocal`,`fkNumeroOficina`,`fechaAsigna`),
  KEY `fkNumeroLocal` (`fkNumeroLocal`),
  KEY `fkNumeroOficina` (`fkNumeroOficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambia`
--

CREATE TABLE IF NOT EXISTS `cambia` (
  `fkNumeroInventarioEquipo` int(6) NOT NULL,
  `fkNumeroInventarioInsumo` int(6) NOT NULL,
  `fechaCambio` date NOT NULL,
  PRIMARY KEY (`fkNumeroInventarioEquipo`,`fkNumeroInventarioInsumo`,`fechaCambio`),
  KEY `fkNumeroInventarioInsumo` (`fkNumeroInventarioInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `fkNumeroInventario` int(6) NOT NULL,
  `fkNumeroArticulo` int(3) NOT NULL,
  `fkRut` int(12) NOT NULL,
  `tipoCompra` enum('Directa','Licitacion') NOT NULL,
  `monto` int(6) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `estadoCompra` enum('Pendiente','Completada') NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fkNumeroInventario` (`fkNumeroInventario`),
  KEY `fkNumeroArticulo` (`fkNumeroArticulo`),
  KEY `fkRut` (`fkRut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corresponde_revision`
--

CREATE TABLE IF NOT EXISTS `corresponde_revision` (
  `idRevision` int(11) NOT NULL AUTO_INCREMENT,
  `fkNumeroRevision` int(3) NOT NULL,
  `fkNumeroInventario` int(6) NOT NULL,
  `fkNumeroFalla` int(2) NOT NULL,
  `fechaRevision` date NOT NULL,
  `detalle` varchar(200) NOT NULL,
  PRIMARY KEY (`idRevision`),
  KEY `fkNumeroRevision` (`fkNumeroRevision`),
  KEY `fkNumeroInventario` (`fkNumeroInventario`),
  KEY `fkNumeroFalla` (`fkNumeroFalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamiento`
--

CREATE TABLE IF NOT EXISTS `equipamiento` (
  `numeroInventario` int(6) NOT NULL,
  `fkNumeroArticulo` int(4) NOT NULL,
  `garantia` date NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tipoArticulo` enum('Equipo','Insumo','Componente de red') NOT NULL,
  PRIMARY KEY (`numeroInventario`),
  KEY `fkNumeroArticulo` (`fkNumeroArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `numeroEstado` enum('0','1','2','3','4','5') NOT NULL,
  `estadoSucesor` enum('1','2','3','4','5') NOT NULL,
  `nombreEstado` enum('Pre-Stock','Stock','Taller','Instalado','Desaparecido','Desguazado') NOT NULL,
  PRIMARY KEY (`numeroEstado`,`estadoSucesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`numeroEstado`, `estadoSucesor`, `nombreEstado`) VALUES
('0', '1', 'Pre-Stock'),
('1', '3', 'Stock'),
('1', '5', 'Stock'),
('2', '1', 'Taller'),
('2', '3', 'Taller'),
('2', '4', 'Taller'),
('2', '5', 'Taller'),
('3', '2', 'Instalado'),
('3', '5', 'Instalado'),
('4', '1', 'Desguazado'),
('5', '5', 'Desaparecido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `falla`
--

CREATE TABLE IF NOT EXISTS `falla` (
  `numeroFalla` int(2) NOT NULL,
  `nombreFalla` varchar(100) NOT NULL,
  PRIMARY KEY (`numeroFalla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `falla`
--

INSERT INTO `falla` (`numeroFalla`, `nombreFalla`) VALUES
(1, 'Fallo monitor'),
(2, 'Fallo teclado'),
(3, 'Fallo mouse'),
(4, 'Fallo impresora'),
(5, 'Fallo CPU'),
(6, 'Fallo tarjeta de red'),
(7, 'Fallo disco duro'),
(8, 'Fallo lectora'),
(9, 'Fallo memoria'),
(10, 'Fallo tarjeta de video');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE IF NOT EXISTS `historial` (
  `fechaIngreso` date NOT NULL,
  `fechaEgreso` date NOT NULL,
  `fkNumeroInventario` int(6) NOT NULL,
  `fkEstado` enum('0','1','2','3','4','5') NOT NULL,
  `fkEstadoSucesor` enum('1','2','3','4') NOT NULL,
  PRIMARY KEY (`fechaIngreso`,`fkNumeroInventario`,`fkEstado`),
  KEY `fkNumeroInventario` (`fkNumeroInventario`),
  KEY `fkEstado` (`fkEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

CREATE TABLE IF NOT EXISTS `local` (
  `numeroLocal` int(4) NOT NULL,
  `departamento` enum('Artigas','Canelones','Cerro Largo','Colonia','Durazno','Flores','Florida','Lavalleja','Maldonado','Montevideo','Paysandu','Rio Negro','Rivera','Rocha','Salto','San Jose','Soriano','Tacuarembo','Treinta y Tres') NOT NULL,
  `calle` varchar(30) NOT NULL,
  `esquina` varchar(30) NOT NULL,
  PRIMARY KEY (`numeroLocal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficina`
--

CREATE TABLE IF NOT EXISTS `oficina` (
  `numeroOficina` int(4) NOT NULL,
  `capacidadRed` int(3) NOT NULL,
  `fkNumeroLocal` int(4) NOT NULL,
  PRIMARY KEY (`numeroOficina`,`fkNumeroLocal`),
  KEY `fkNumeroLocal` (`fkNumeroLocal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficina_lotes`
--

CREATE TABLE IF NOT EXISTS `oficina_lotes` (
  `fkNumeroOficina` int(4) NOT NULL,
  `lote` int(3) NOT NULL,
  PRIMARY KEY (`fkNumeroOficina`,`lote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pertenece_usuario`
--

CREATE TABLE IF NOT EXISTS `pertenece_usuario` (
  `fkNumeroOficina` int(4) NOT NULL,
  `fkNumeroLocal` int(4) NOT NULL,
  `fkClave` varchar(32) NOT NULL,
  PRIMARY KEY (`fkNumeroOficina`,`fkNumeroLocal`,`fkClave`),
  KEY `fkNumeroLocal` (`fkNumeroLocal`),
  KEY `fkClave` (`fkClave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presenta_falla`
--

CREATE TABLE IF NOT EXISTS `presenta_falla` (
  `fkNumeroInventario` int(6) NOT NULL,
  `fkNumeroFalla` int(2) NOT NULL,
  `fechaFalla` datetime NOT NULL,
  `detalleFalla` varchar(30) NOT NULL,
  PRIMARY KEY (`fkNumeroInventario`,`fkNumeroFalla`,`fechaFalla`),
  KEY `fkNumeroFalla` (`fkNumeroFalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provee`
--

CREATE TABLE IF NOT EXISTS `provee` (
  `fkRut` int(12) NOT NULL,
  `fkNumeroArticulo` int(3) NOT NULL,
  PRIMARY KEY (`fkRut`,`fkNumeroArticulo`),
  KEY `fkNumeroArticulo` (`fkNumeroArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `rut` int(12) NOT NULL,
  `nombreProveedor` varchar(30) NOT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision`
--

CREATE TABLE IF NOT EXISTS `revision` (
  `numeroRevision` int(3) NOT NULL,
  `nombreRevision` varchar(200) NOT NULL,
  PRIMARY KEY (`numeroRevision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE IF NOT EXISTS `solicitud` (
  `idSolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `fkNumeroLocal` int(4) NOT NULL,
  `fkNumeroOficina` int(4) NOT NULL,
  `fkNumeroArticulo` int(3) NOT NULL,
  `motivo` enum('Falla','Ampliación','Relleno') NOT NULL,
  `cantidad` int(2) NOT NULL,
  `fechaSolicitud` datetime NOT NULL,
  `estado` enum('Denegada','Aprobada','Completada','Pendiente','Compra') NOT NULL,
  PRIMARY KEY (`idSolicitud`),
  KEY `solicitud_ibfk_1` (`fkNumeroLocal`),
  KEY `solicitud_ibfk_2` (`fkNumeroOficina`),
  KEY `solicitud_ibfk_3` (`fkNumeroArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_articulo`
--

CREATE TABLE IF NOT EXISTS `tipo_articulo` (
  `nombreArticulo` varchar(30) NOT NULL,
  `numeroArticulo` int(3) NOT NULL,
  PRIMARY KEY (`numeroArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `clave` varchar(32) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `tipoUsuario` enum('administrador','director','sub_a','sub_b','gerente','auditoria','informatica','compras') NOT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`clave`, `nombre`, `tipoUsuario`) VALUES
('0e54be11fe61899193181780f8c1ebf7', 'oficina01', 'gerente'),
('15f840d40c3e202aa7ccbfec1f20c46e', 'auditoria', 'auditoria'),
('5e1c66999ced5b1aa2efa99a3dabd460', 'compras', 'compras'),
('7975b6106eb18d88edfe1576287d19e3', 'informatica', 'informatica'),
('c4977d697f57bb45d6ae755dd5f866cd', 'subdireccionA', 'sub_a'),
('d027d0871d9393a554840e6c5a2f0775', 'director', 'director'),
('d0807e0e41c5667f4ec09bb9a6add4e1', 'subdireccionb', 'sub_b');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asigna`
--
ALTER TABLE `asigna`
  ADD CONSTRAINT `asigna_ibfk_1` FOREIGN KEY (`fkNumeroInventario`) REFERENCES `equipamiento` (`numeroInventario`),
  ADD CONSTRAINT `asigna_ibfk_2` FOREIGN KEY (`fkNumeroLocal`) REFERENCES `oficina` (`fkNumeroLocal`),
  ADD CONSTRAINT `asigna_ibfk_3` FOREIGN KEY (`fkNumeroOficina`) REFERENCES `oficina` (`numeroOficina`);

--
-- Filtros para la tabla `cambia`
--
ALTER TABLE `cambia`
  ADD CONSTRAINT `cambia_ibfk_1` FOREIGN KEY (`fkNumeroInventarioEquipo`) REFERENCES `equipamiento` (`numeroInventario`),
  ADD CONSTRAINT `cambia_ibfk_2` FOREIGN KEY (`fkNumeroInventarioInsumo`) REFERENCES `equipamiento` (`numeroInventario`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`fkNumeroInventario`) REFERENCES `equipamiento` (`numeroInventario`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`fkNumeroArticulo`) REFERENCES `tipo_articulo` (`numeroArticulo`),
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`fkRut`) REFERENCES `proveedor` (`rut`);

--
-- Filtros para la tabla `corresponde_revision`
--
ALTER TABLE `corresponde_revision`
  ADD CONSTRAINT `corresponde_revision_ibfk_1` FOREIGN KEY (`fkNumeroRevision`) REFERENCES `revision` (`numeroRevision`),
  ADD CONSTRAINT `corresponde_revision_ibfk_2` FOREIGN KEY (`fkNumeroInventario`) REFERENCES `presenta_falla` (`fkNumeroInventario`),
  ADD CONSTRAINT `corresponde_revision_ibfk_3` FOREIGN KEY (`fkNumeroFalla`) REFERENCES `presenta_falla` (`fkNumeroFalla`);

--
-- Filtros para la tabla `equipamiento`
--
ALTER TABLE `equipamiento`
  ADD CONSTRAINT `equipamiento_ibfk_1` FOREIGN KEY (`fkNumeroArticulo`) REFERENCES `tipo_articulo` (`numeroArticulo`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`fkNumeroInventario`) REFERENCES `equipamiento` (`numeroInventario`),
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`fkEstado`) REFERENCES `estado` (`numeroEstado`);

--
-- Filtros para la tabla `oficina`
--
ALTER TABLE `oficina`
  ADD CONSTRAINT `oficina_ibfk_1` FOREIGN KEY (`fkNumeroLocal`) REFERENCES `local` (`numeroLocal`);

--
-- Filtros para la tabla `oficina_lotes`
--
ALTER TABLE `oficina_lotes`
  ADD CONSTRAINT `oficinaLotes_ibfk_1` FOREIGN KEY (`fkNumeroOficina`) REFERENCES `oficina` (`numeroOficina`),
  ADD CONSTRAINT `oficina_lotes_ibfk_1` FOREIGN KEY (`fkNumeroOficina`) REFERENCES `oficina` (`numeroOficina`);

--
-- Filtros para la tabla `pertenece_usuario`
--
ALTER TABLE `pertenece_usuario`
  ADD CONSTRAINT `pertenece_usuario_ibfk_1` FOREIGN KEY (`fkNumeroOficina`) REFERENCES `oficina` (`numeroOficina`),
  ADD CONSTRAINT `pertenece_usuario_ibfk_2` FOREIGN KEY (`fkNumeroLocal`) REFERENCES `oficina` (`fkNumeroLocal`),
  ADD CONSTRAINT `pertenece_usuario_ibfk_3` FOREIGN KEY (`fkClave`) REFERENCES `usuario` (`clave`);

--
-- Filtros para la tabla `presenta_falla`
--
ALTER TABLE `presenta_falla`
  ADD CONSTRAINT `presenta_falla_ibfk_1` FOREIGN KEY (`fkNumeroInventario`) REFERENCES `equipamiento` (`numeroInventario`),
  ADD CONSTRAINT `presenta_falla_ibfk_2` FOREIGN KEY (`fkNumeroFalla`) REFERENCES `falla` (`numeroFalla`);

--
-- Filtros para la tabla `provee`
--
ALTER TABLE `provee`
  ADD CONSTRAINT `provee_ibfk_1` FOREIGN KEY (`fkRut`) REFERENCES `proveedor` (`rut`),
  ADD CONSTRAINT `provee_ibfk_2` FOREIGN KEY (`fkNumeroArticulo`) REFERENCES `tipo_articulo` (`numeroArticulo`);

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`fkNumeroLocal`) REFERENCES `oficina` (`fkNumeroLocal`),
  ADD CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`fkNumeroOficina`) REFERENCES `oficina` (`numeroOficina`),
  ADD CONSTRAINT `solicitud_ibfk_3` FOREIGN KEY (`fkNumeroArticulo`) REFERENCES `tipo_articulo` (`numeroArticulo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
