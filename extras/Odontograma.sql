-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.17 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para odontograma
DROP DATABASE IF EXISTS `odontograma`;
CREATE DATABASE IF NOT EXISTS `odontograma` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `odontograma`;


-- Volcando estructura para tabla odontograma.diagnosticos
DROP TABLE IF EXISTS `diagnosticos`;
CREATE TABLE IF NOT EXISTS `diagnosticos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Diagnostico` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla odontograma.dientes
DROP TABLE IF EXISTS `dientes`;
CREATE TABLE IF NOT EXISTS `dientes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Position` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Dientes_posiciondents` (`Position`),
  CONSTRAINT `FK_Dientes_posiciondents` FOREIGN KEY (`Position`) REFERENCES `posiciondents` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla odontograma.pacientediagnosticos
DROP TABLE IF EXISTS `pacientediagnosticos`;
CREATE TABLE IF NOT EXISTS `pacientediagnosticos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Paciente` bigint(15) NOT NULL,
  `Diente` int(11) NOT NULL,
  `Diagnostico` int(11) NOT NULL,
  `Ubicacion` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PacienteDiagnosticos_paciente` (`Paciente`),
  KEY `FK_PacienteDiagnosticos_dientes` (`Diente`),
  KEY `FK_PacienteDiagnosticos_diagnosticos` (`Diagnostico`),
  KEY `FK_PacienteDiagnosticos_ubicaciones` (`Ubicacion`),
  CONSTRAINT `FK_PacienteDiagnosticos_paciente` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_dientes` FOREIGN KEY (`Diente`) REFERENCES `dientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_diagnosticos` FOREIGN KEY (`Diagnostico`) REFERENCES `diagnosticos` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_ubicaciones` FOREIGN KEY (`Ubicacion`) REFERENCES `ubicaciones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla odontograma.pacientes
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `Id` bigint(15) NOT NULL,
  `Tipoid` enum('CC','TI','RC','AN') COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` enum('F','M') COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `Celular` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla odontograma.posiciondents
DROP TABLE IF EXISTS `posiciondents`;
CREATE TABLE IF NOT EXISTS `posiciondents` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla odontograma.ubicaciones
DROP TABLE IF EXISTS `ubicaciones`;
CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ubicacion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
