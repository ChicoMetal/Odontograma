-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para odontograma1
CREATE DATABASE IF NOT EXISTS `odontograma1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `odontograma1`;


-- Volcando estructura para tabla odontograma1.admisiones
CREATE TABLE IF NOT EXISTS `admisiones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` bigint(50) NOT NULL,
  `Cita` int(11) NOT NULL,
  `Usuario` bigint(15) NOT NULL,
  `Historia` int(11) DEFAULT NULL,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Atendida` bit(1) NOT NULL DEFAULT b'0' COMMENT '0: sin antender, 1: Atendida',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Codigo` (`Codigo`),
  UNIQUE KEY `Cita` (`Cita`),
  KEY `FK_Admisiones_historias` (`Historia`),
  KEY `FK_admisiones_usuarios` (`Usuario`),
  CONSTRAINT `FK_Admisiones_historias` FOREIGN KEY (`Historia`) REFERENCES `historias` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_admisiones_citas` FOREIGN KEY (`Cita`) REFERENCES `citas` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_admisiones_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.admisiones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admisiones` DISABLE KEYS */;
INSERT INTO `admisiones` (`Id`, `Codigo`, `Cita`, `Usuario`, `Historia`, `Fecha`, `Atendida`) VALUES
	(10, 4203889689, 75, 92654, NULL, '2016-08-18 17:45:39', b'0'),
	(11, 8447890540, 76, 92654, NULL, '2016-08-23 15:01:34', b'0'),
	(12, 5977413746, 77, 92654, NULL, '2016-08-24 10:17:16', b'0');
/*!40000 ALTER TABLE `admisiones` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.antecedentes
CREATE TABLE IF NOT EXISTS `antecedentes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `Antecedente` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Grupo` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_antecedentes_tipoantecedentes` (`Grupo`),
  CONSTRAINT `FK_antecedentes_tipoantecedentes` FOREIGN KEY (`Grupo`) REFERENCES `tipoantecedentes` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Items de antecedentes odontologicos y medicos generales';

-- Volcando datos para la tabla odontograma1.antecedentes: ~42 rows (aproximadamente)
/*!40000 ALTER TABLE `antecedentes` DISABLE KEYS */;
INSERT INTO `antecedentes` (`Id`, `Codigo`, `Antecedente`, `Grupo`) VALUES
	(1, 'A1', 'Familiares', 4),
	(2, 'A2', 'Alergias', 1),
	(3, 'A3', 'Discrasias sanguíneas', 1),
	(4, 'A4', 'Cardiopatías', 1),
	(5, 'A5', 'Embarazo', 1),
	(6, 'A6', 'Alterasiones presíon arterial', 1),
	(7, 'A7', 'Toma de medicamentos', 1),
	(8, 'A8', 'Tratamiento médico actual', 1),
	(9, 'A9', 'Hepatitis', 1),
	(10, 'A10', 'Diabetes', 1),
	(11, 'A11', 'Fiebre reumática', 1),
	(12, 'A12', 'HIV - SIDA', 1),
	(13, 'A13', 'Inmunosupresión', 1),
	(14, 'A14', 'Patologías renales', 1),
	(15, 'A15', 'Patologias respiratorias', 1),
	(16, 'A16', 'Trastornos gástricos', 1),
	(17, 'A17', 'Trastornos emocionales', 1),
	(18, 'A18', 'Sinusitis', 1),
	(19, 'A19', 'Cirugías ( incluso orales )', 1),
	(20, 'A20', 'Exodoncias', 1),
	(21, 'A21', 'Enfermedades orales', 1),
	(22, 'A22', 'Uso de protesis o aparatologia oral', 1),
	(23, 'A23', 'Hábitos y otras patologías o antecedentes odontológicos o médicos', 1),
	(24, 'A24', 'Labio inferior', 2),
	(25, 'A25', 'Labio superior', 2),
	(26, 'A26', 'Comisuras', 2),
	(27, 'A27', 'Mucosa oral', 2),
	(28, 'A28', 'Surcos yugales', 2),
	(29, 'A29', 'Frenillos', 2),
	(30, 'A30', 'Orofaringe', 2),
	(31, 'A31', 'Paladar', 2),
	(32, 'A32', 'Glándulas salivales', 2),
	(33, 'A33', 'Piso de boca', 2),
	(34, 'A34', 'Dorso de lengua', 2),
	(35, 'A35', 'Vientre de lengua', 2),
	(36, 'A36', 'Ruidos', 3),
	(37, 'A37', 'Desviación', 3),
	(38, 'A38', 'Cambio de volumen', 3),
	(39, 'A39', 'Bloqueo mandibular', 3),
	(40, 'A40', 'Limitación de apertura', 3),
	(41, 'A41', 'Dolor articular', 3),
	(42, 'A42', 'Dolor muscular', 3);
/*!40000 ALTER TABLE `antecedentes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente` bigint(15) NOT NULL,
  `Medico` bigint(15) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `FechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaCambio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estado` int(1) NOT NULL DEFAULT '1' COMMENT '1:Pendiente, 0:cancelada, 2:Admitida, 3: Atendida',
  `Usuario` bigint(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Medico_Fecha_Hora` (`Medico`,`Fecha`,`Hora`),
  KEY `FK_citas_pacientes` (`Paciente`),
  KEY `FK_citas_usuarios` (`Usuario`),
  CONSTRAINT `FK_citas_medicos` FOREIGN KEY (`Medico`) REFERENCES `medicos` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_citas_pacientes` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_citas_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='almacena las citas programadas';

-- Volcando datos para la tabla odontograma1.citas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` (`Id`, `Paciente`, `Medico`, `Fecha`, `Hora`, `FechaRegistro`, `FechaCambio`, `Estado`, `Usuario`) VALUES
	(75, 1104379214, 11044, '2016-08-18', '18:00:00', '2016-08-18 17:45:36', '2016-08-18 17:46:52', 3, 92654),
	(76, 789, 11043, '2016-08-23', '21:30:00', '2016-08-23 15:01:24', '2016-08-23 15:02:32', 3, 92654),
	(77, 1104379214, 11044, '2016-08-24', '11:00:00', '2016-08-24 10:17:08', '2016-08-24 10:17:51', 3, 92654),
	(78, 789, 11043, '2016-09-06', '16:30:00', '2016-09-06 16:16:42', '2016-09-06 16:16:42', 1, 92654);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.dientes
CREATE TABLE IF NOT EXISTS `dientes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Position` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Dientes_posiciondents` (`Position`),
  KEY `Numero` (`Numero`),
  CONSTRAINT `FK_Dientes_posiciondents` FOREIGN KEY (`Position`) REFERENCES `posiciondents` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.dientes: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `dientes` DISABLE KEYS */;
INSERT INTO `dientes` (`Id`, `Numero`, `Nombre`, `Position`) VALUES
	(3, 11, 'Incisivo frontal superior derecho adulto', 9),
	(5, 12, 'Incisivo lateral superior derecho adulto', 9),
	(6, 13, 'Canino superior derecho adulto', 9),
	(7, 14, 'Primer premolar superior derecho adulto', 9),
	(8, 15, 'Segundo premolar superior derecho adulto', 9),
	(10, 16, 'Primer molar superior derecho adulto', 9),
	(11, 17, 'Segundo molar superior derecho adulto', 9),
	(13, 18, 'Tercer molar superior derecho adulto', 9),
	(14, 21, 'Incisivo frontal superior izquierdo adulto', 7),
	(15, 22, 'Incisivo lateral superior izquierdo adulto', 7),
	(16, 23, 'Canino superior izquierdo adulto', 7),
	(18, 24, 'Primer premolar superior izquierdo adulto', 7),
	(20, 25, 'Segundo premolar superior izquierdo adulto', 7),
	(21, 26, 'Primer molar superior izquierdo adulto', 7),
	(22, 27, 'Segundo molar superior izquierdo adulto', 7),
	(23, 28, 'Tercer molar superior izquierdo adulto', 7),
	(24, 41, 'Incisivo frontal inferior derecho adulto', 13),
	(25, 42, 'Incisivo lateral inferior derecho adulto', 13),
	(26, 43, 'Canino inferior derecho adulto', 13),
	(27, 44, 'Primer premolar inferior derecho adulto', 13),
	(28, 45, 'Segundo premolar inferior derecho adulto', 13),
	(29, 46, 'Primer molar inferior derecho adulto', 13),
	(30, 47, 'Segundo molar inferior derecho adulto', 13),
	(31, 48, 'Tercer molar inferior derecho adulto', 13),
	(33, 31, 'Incisivo frontal inferior izquierdo adulto', 11),
	(34, 32, 'Incisivo lateral inferior izquierdo adulto', 11),
	(35, 33, 'Canino inferior izquierdo adulto', 11),
	(36, 34, 'Primer premolar inferior izquierdo adulto', 11),
	(37, 35, 'Segundo premolar inferior izquierdo adulto', 11),
	(38, 36, 'Primer molar inferior izquierdo adulto', 11),
	(39, 37, 'Segundo molar inferior izquierdo adulto', 11),
	(40, 38, 'Tercer molar inferior izquierdo adulto', 11),
	(41, 51, 'Incisivo frontal superior derecho niño', 10),
	(42, 52, 'Incisivo lateral superior derecho niño', 10),
	(43, 53, 'Canino superior derecho niño', 10),
	(44, 54, 'Primer premolar superior derecho niño', 10),
	(45, 55, 'Segundo premolar superior derecho niño', 10),
	(46, 61, 'Incisivo frontal superior izquierdo niño', 8),
	(47, 62, 'Incisivo lateral superior izquierdo niño', 8),
	(48, 63, 'Canino superior izquierdo niño', 8),
	(49, 64, 'Primer premolar superior izquierdo niño', 8),
	(50, 65, 'Segundo premolar superior izquierdo niño', 8),
	(51, 81, 'Incisivo frontal inferior derecho niño', 14),
	(52, 82, 'Incisivo lateral inferior derecho niño', 14),
	(53, 83, 'Canino inferior derecho niño', 14),
	(54, 84, 'Primer premolar inferior derecho niño', 14),
	(55, 85, 'Segundo premolar inferior derecho niño', 14),
	(56, 71, 'Incisivo frontal inferior izquierdo niño', 12),
	(57, 72, 'Incisivo lateral inferior izquierdo niño', 12),
	(58, 73, 'Canino inferior izquierdo niño', 12),
	(59, 74, 'Primer premolar inferior izquierdo niño', 12),
	(60, 75, 'Segundo premolar inferior izquierdo niño', 12);
/*!40000 ALTER TABLE `dientes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.eps
CREATE TABLE IF NOT EXISTS `eps` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Almacenar las ips';

-- Volcando datos para la tabla odontograma1.eps: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `eps` DISABLE KEYS */;
INSERT INTO `eps` (`Id`, `Nombre`, `Estado`) VALUES
	(1, 'Nueva eps', b'1');
/*!40000 ALTER TABLE `eps` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.evoluciones
CREATE TABLE IF NOT EXISTS `evoluciones` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Diagnostico` int(11) NOT NULL,
  `Tratamiento` int(11) NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Finish` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Codigo`),
  KEY `FK__pacienteprocedures` (`Diagnostico`),
  KEY `FK__pacienteprocedures_2` (`Tratamiento`),
  CONSTRAINT `FK__pacienteprocedures` FOREIGN KEY (`Diagnostico`) REFERENCES `pacienteprocedures` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK__pacienteprocedures_2` FOREIGN KEY (`Tratamiento`) REFERENCES `pacienteprocedures` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Almacena las evoluciones que se le den a los diagnosticos del paciente';

-- Volcando datos para la tabla odontograma1.evoluciones: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `evoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `evoluciones` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.groupitemsdent
CREATE TABLE IF NOT EXISTS `groupitemsdent` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Tipe` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `FK_groupitemsdent_tipeitems` (`Tipe`),
  CONSTRAINT `FK_groupitemsdent_tipeitems` FOREIGN KEY (`Tipe`) REFERENCES `tipeitems` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.groupitemsdent: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `groupitemsdent` DISABLE KEYS */;
INSERT INTO `groupitemsdent` (`Id`, `Nombre`, `Descripcion`, `Tipe`) VALUES
	(1, ' Anomalias Del Tamaño Y Erupcion Dentaria', '--', 1),
	(2, ' Caries', '--', 1),
	(3, ' Trastornos De Los Tejidos Dentarios Duros', '--', 1),
	(4, ' Afecciones De Los Tejidos De La Pulpa Dental', '--', 1),
	(5, ' Afecciones De Los Tejidos De Sosten', '--', 1),
	(6, ' Anomalias Dentofaciales\r\n', '--', 1),
	(7, ' Afecciones De Los Dientes Y Estructuras De Sosten', '--', 1),
	(8, ' Quistes Bucales', '--', 1),
	(9, ' Trastornos Del Desarrollo De Los Maxilares\r\n', '--', 1),
	(10, ' Enfermedades De Glandulas Salivales\r\n', '--', 1),
	(11, ' Alteraciones De Labios Y Mejillas', '--', 1),
	(12, ' Patologias De La Lengua', '--', 1),
	(13, ' Actividades De Promoción Y Prevención', '--', 1),
	(14, ' Diente Ausente', '--', 1),
	(15, ' Fijación A La Estructura Dentaria', '--', 1),
	(16, 'Prevencion', '--', 2),
	(17, 'Radiologia', '--', 2),
	(18, 'Exodoncia Y Cx.', '--', 2),
	(19, 'Operatoria', '--', 2),
	(20, 'Endodoncia', '--', 2),
	(21, 'Protesis', '--', 2),
	(22, 'Periodoncia', '--', 2),
	(23, 'Ortodoncia', '--', 2),
	(24, 'Biopsias', '--', 2),
	(25, 'Uvula Y Paladar', '--', 2),
	(26, 'Labio', '--', 2),
	(27, 'Mucosa Oral', '--', 2),
	(28, 'Quistes Y Lesiones', '--', 2),
	(29, 'Tumores', '--', 2),
	(30, 'Otras Cirugias', '--', 2);
/*!40000 ALTER TABLE `groupitemsdent` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.historias
CREATE TABLE IF NOT EXISTS `historias` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente` bigint(15) NOT NULL,
  `Medico` bigint(15) NOT NULL,
  `FechaApertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado` bit(1) NOT NULL DEFAULT b'1' COMMENT '0: inactiva, 1:activa',
  `Padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FK__pacientes` (`Paciente`),
  KEY `FK_historias_medicos` (`Medico`),
  KEY `FK_historias_historias` (`Padre`),
  CONSTRAINT `FK__pacientes` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_historias_historias` FOREIGN KEY (`Padre`) REFERENCES `historias` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_historias_medicos` FOREIGN KEY (`Medico`) REFERENCES `medicos` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Almacena las diferentes historias odontologicas que se abren a los pacientes';

-- Volcando datos para la tabla odontograma1.historias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historias` DISABLE KEYS */;
INSERT INTO `historias` (`Codigo`, `Paciente`, `Medico`, `FechaApertura`, `Estado`, `Padre`) VALUES
	(12, 1104379214, 11044, '2016-08-18 17:46:52', b'0', NULL),
	(13, 789, 11043, '2016-08-23 15:02:32', b'0', NULL),
	(14, 1104379214, 11044, '2016-08-24 10:17:51', b'0', 12);
/*!40000 ALTER TABLE `historias` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.ips
CREATE TABLE IF NOT EXISTS `ips` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Almacenar todas las ips';

-- Volcando datos para la tabla odontograma1.ips: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
INSERT INTO `ips` (`Id`, `Nombre`, `Estado`) VALUES
	(1, 'Salud a tu lado', b'1');
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.items
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `resource` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Representacion` int(11) NOT NULL,
  `GroupParent` int(11) NOT NULL,
  `Zone` int(11) DEFAULT NULL COMMENT 'en este campo se usara para verificar cuales necesitan escogerce una zona y cuales ya tienen una predeterminada',
  PRIMARY KEY (`Id`),
  KEY `FK_items_representaciom` (`Representacion`),
  KEY `FK_items_groupitemsdent` (`GroupParent`),
  KEY `FK_items_zones` (`Zone`),
  CONSTRAINT `FK_items_groupitemsdent` FOREIGN KEY (`GroupParent`) REFERENCES `groupitemsdent` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_items_representacion` FOREIGN KEY (`Representacion`) REFERENCES `representacion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_items_zones` FOREIGN KEY (`Zone`) REFERENCES `zones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.items: ~347 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`Id`, `Codigo`, `Nombre`, `Descripcion`, `resource`, `Representacion`, `GroupParent`, `Zone`) VALUES
	(1, 'K000', 'Anodoncia', '--', NULL, 2, 1, 8),
	(2, 'K001', 'Dientes Supernumerarios', '--', NULL, 2, 1, 9),
	(3, 'K002', 'Anomalias Del Tamaño Y De La Forma Del Diente', '--', NULL, 2, 1, 11),
	(4, 'K003', 'Dientes Moteados', '--', NULL, 2, 1, 11),
	(5, 'K004', 'Alteraciones En La Formacion Dentaria', '--', NULL, 2, 1, 11),
	(6, 'K005', 'Alteraciones Hereditarias De La Estructura Dentaria No Clasificadas En Otra Parte', '--', NULL, 2, 1, NULL),
	(7, 'K006', 'Alteraciones En La Erupcion Dentaria', '--', NULL, 2, 1, 8),
	(8, 'K007', 'Sindrome De La Erupcion Dentaria', '--', NULL, 2, 1, 8),
	(9, 'K008', 'Otros Trastornos Del Desarrollo De Los Dientes', '--', NULL, 2, 1, 10),
	(10, 'K009', 'Trastorno Del Desarrollo De Los Dientes No Especificado', '--', NULL, 2, 1, 8),
	(11, 'K010', 'Dientes Incluidos', '--', NULL, 2, 1, 8),
	(12, 'K011', 'Dientes Impactados', '--', NULL, 2, 1, 8),
	(13, 'K020', 'Caries Limitada Al Esmalte', '--', 'FF0000', 1, 2, NULL),
	(14, 'K021', 'Caries De La Dentina', '--', 'FF0000', 1, 2, NULL),
	(15, 'K022', 'Caries Del Cemento', '--', 'FF0000', 1, 2, NULL),
	(16, 'K023', 'Caries Dentaria Detenida', '--', 'D17A00', 1, 2, NULL),
	(17, 'K024', 'Odontoclasia Melanodoncia Infantil Melanodontoclasia', '--', '63B982', 1, 2, NULL),
	(18, 'K028', 'Otras Caries Dentales Especificadas', '--', 'FF9900', 1, 2, NULL),
	(19, 'K029', 'Caries Dental No Especificada', '--', 'FF9900', 1, 2, NULL),
	(20, 'K030', 'Atricion Excesiva De Los Dientes', '--', NULL, 2, 3, 8),
	(21, 'K031', 'Abrasion De Los Dientes', '--', NULL, 2, 3, 8),
	(22, 'K032', 'Erosion De Los Dientes', '--', NULL, 2, 3, 8),
	(23, 'K033', 'Reabsorcion Patologica De Los Dientes', '--', NULL, 2, 3, 8),
	(24, 'K034', 'Hipercementosis', '--', NULL, 2, 3, 8),
	(25, 'K035', 'Anquilosis Dental', '--', NULL, 2, 3, 8),
	(26, 'K036', 'Depositos [acreciones] En Los Dientes', '--', NULL, 2, 3, 8),
	(27, 'K037', 'Cambios Posteruptivos Del Color De Los Tejidos Dentales Duros', '--', NULL, 2, 3, 8),
	(28, 'K038', 'Otras Enfermedades Especificadas De Los Tejidos Duros De Los Dientes', '--', NULL, 2, 3, 8),
	(29, 'K039', 'Enfermedad No Especificada De Los Tejidos Dentales Duros', '--', NULL, 2, 3, 8),
	(30, 'S025', 'Fractura De Los Dientes', '--', NULL, 2, 3, 8),
	(31, 'S032', 'Luxacion De Diente', '--', NULL, 2, 3, 8),
	(32, 'K040', 'Pulpitis', '--', NULL, 2, 4, 8),
	(33, 'K041', 'Necrosis De La Pulpa Gangrena De La Pulpa', '--', NULL, 2, 4, 8),
	(34, 'K042', 'Degeneracion De La Pulpa Calcificaciones De La Pulpa Denticulos Piedras De La Pulpa', '--', NULL, 2, 4, 8),
	(35, 'K043', 'Formacion Anormal De Tejido Duro En La Pulpa Dentina Secundaria O Irregular', '--', NULL, 2, 4, 8),
	(36, 'K044', 'Periodontitis Apical Aguda Originada En La Pulpa Periodontitis Apical Aguda Sai', '--', NULL, 2, 4, 8),
	(37, 'K045', 'Periodontitis Apical Cronica Granuloma Apical', '--', NULL, 2, 4, 8),
	(38, 'K046', 'Absceso Periapical Con Fistula', '--', NULL, 2, 4, 8),
	(39, 'K047', 'Absceso Periapical Sin Fistula Dental Dentoalveolar Sin Fistula', '--', NULL, 2, 4, 8),
	(40, 'K048', 'Quiste Radicular', '--', NULL, 2, 4, 8),
	(41, 'K049', 'Otras Enfermedades Y Las No Especificadas De La Pulpa Y Del Tejido Periapical', '--', NULL, 2, 4, 8),
	(42, 'K050', 'Gingivitis Aguda', '--', NULL, 2, 5, 8),
	(43, 'K051', 'Gingivitis Cronica', '--', NULL, 2, 5, 8),
	(44, 'K052', 'Periodontitis Aguda', '--', NULL, 2, 5, 8),
	(45, 'K053', 'Periodontitis Cronica', '--', NULL, 2, 5, 8),
	(46, 'K054', 'Periodontosis Juvenil', '--', NULL, 2, 5, 8),
	(47, 'K055', 'Otras Enfermedades Periodontales', '--', NULL, 2, 5, 8),
	(48, 'K056', 'Enfermedad Del Periodonto No Especificada', '--', NULL, 2, 5, 8),
	(49, 'K060', 'Retraccion Gingival', '--', NULL, 2, 5, 8),
	(50, 'K061', 'Hiperplasia Gingival', '--', NULL, 2, 5, 8),
	(51, 'K062', 'Lesiones De La Encia Y De La Zona Edentula Asociadas Con Traumatismo', '--', NULL, 2, 5, 8),
	(52, 'K068', 'Otros Trastornos Especificados De La Encia Y De La Zona Edentula', '--', NULL, 2, 5, 8),
	(53, 'K069', 'Trastorno No Especificado De La Encia Y De La Zona Edentula', '--', NULL, 2, 5, 8),
	(54, 'K070', 'Anomalias Evidentes Del Tamaño De Los Maxilares', '--', NULL, 2, 6, 8),
	(55, 'K071', 'Anomalias De La Relacion Maxilobasilar', '--', NULL, 2, 6, 8),
	(56, 'K072', 'Anomalias De La Relacion Entre Los Arcos Dentarios', '--', NULL, 2, 6, 8),
	(57, 'K073', 'Anomalias De La Posicion Del Diente', '--', NULL, 2, 6, 8),
	(58, 'K074', 'Maloclusion De Tipo No Especificado', '--', NULL, 2, 6, 8),
	(59, 'K075', 'Anomalias Dentofaciales Funcionales', '--', NULL, 2, 6, 8),
	(60, 'K076', 'Trastornos De La Articulacion Temporomaxilar', '--', NULL, 2, 6, 8),
	(61, 'K078', 'Otras Anomalias Dentofaciales', '--', NULL, 2, 6, 8),
	(62, 'K079', 'Anomalia Dentofacial No Especificada', '--', NULL, 2, 6, 8),
	(63, 'K080', 'Exfoliacion De Los Dientes Debida A Causas Sistemicas', '--', NULL, 2, 7, 8),
	(64, 'K081', 'Perdida De Dientes Debida A Accidente Extraccion O Enfermedad Periodontal Local', '--', NULL, 2, 7, 8),
	(65, 'K082', 'Atrofia Del Reborde Alveolar Desdentado', '--', NULL, 2, 7, 8),
	(66, 'K083', 'Raiz Dental Retenida', '--', NULL, 2, 7, 8),
	(67, 'K088', 'Otras Afecciones Especificadas De Los Dientes Y De Sus Estructuras De Sosten', '--', NULL, 2, 7, 8),
	(68, 'K089', 'Trastorno De Los Dientes Y De Sus Estructuras De Sosten No Especificado', '--', NULL, 2, 7, 8),
	(69, 'K090', 'Quistes Originados Por El Desarrollo De Los Dientes', '--', NULL, 2, 8, 8),
	(70, 'K091', 'Quistes De Las Fisuras (no Odontogenicos)', '--', NULL, 2, 8, 8),
	(71, 'K092', 'Otros Quistes De Los Maxilares', '--', NULL, 2, 8, 8),
	(72, 'K098', 'Otros Quistes De La Region Bucal No Clasificados En Otra Parte', '--', NULL, 2, 8, 8),
	(73, 'K099', 'Quiste De La Region Bucal Sin Otra Especificacion', '--', NULL, 2, 8, 8),
	(74, 'K100', 'Trastornos Del Desarrollo De Los Maxilares', '--', NULL, 2, 9, 8),
	(75, 'K101', 'Granuloma Central De Celulas Gigantes', '--', NULL, 2, 9, 8),
	(76, 'K102', 'Afecciones Inflamatorias De Los Maxilares', '--', NULL, 2, 9, 8),
	(77, 'K103', 'Alveolitis Del Maxilar', '--', NULL, 2, 9, 8),
	(78, 'K108', 'Otras Enfermedades Especificadas De Los Maxilares', '--', NULL, 2, 9, 8),
	(79, 'K109', 'Enfermedad De Los Maxilares No Especificada', '--', NULL, 2, 9, 8),
	(80, 'K110', 'Atrofia De Glandula Salival', '--', NULL, 2, 10, 8),
	(81, 'K111', 'Hipertrofia De Glandula Salival', '--', NULL, 2, 10, 8),
	(82, 'K112', 'Sialadenitis', '--', NULL, 2, 10, 8),
	(83, 'K113', 'Absceso De Glandula Salival', '--', NULL, 2, 10, 8),
	(84, 'K114', 'Fistula De Glandula Salival', '--', NULL, 2, 10, 8),
	(85, 'K115', 'Sialolitiasis', '--', NULL, 2, 10, 8),
	(86, 'K116', 'Mucocele De Glandula Salival', '--', NULL, 2, 10, 8),
	(87, 'K117', 'Alteraciones De La Secrecion Salival', '--', NULL, 2, 10, 8),
	(88, 'K118', 'Otras Enfermedades De Las Glandulas Salivales', '--', NULL, 2, 10, 8),
	(89, 'K119', 'Enfermedad De Glandula Salival No Especificada', '--', NULL, 2, 10, 8),
	(90, 'K120', 'Estomatitis Aftosa Recurrente', '--', NULL, 2, 11, 8),
	(91, 'K121', 'Otras Formas De Estomatitis', '--', NULL, 2, 11, 8),
	(92, 'K122', 'Celulitis Y Abceso De Boca', '--', NULL, 2, 11, 8),
	(93, 'K130', 'Enfermedades De Los Labios', '--', NULL, 2, 11, 8),
	(94, 'K131', 'Mordedura Del Labio Y De La Mejilla', '--', NULL, 2, 11, 8),
	(95, 'K132', 'Leucoplasia Y Otras Alteraciones Del Epitelio Bucal Incluyendo La Lengua', '--', NULL, 2, 11, 8),
	(96, 'K133', 'Leucoplasia Pilosa', '--', NULL, 2, 11, 8),
	(97, 'K134', 'Granuloma Y Lesiones Semejantes De La Mucosa Bucal', '--', NULL, 2, 11, 8),
	(98, 'K135', 'Fibrosis De La Submucosa Bucal', '--', NULL, 2, 11, 8),
	(99, 'K136', 'Hiperplasia Irrritativa De La Mucosa Bucal', '--', NULL, 2, 11, 8),
	(100, 'K137', 'Otras Lesiones Y Las No Especificadas De La Mucosa Bucal', '--', NULL, 2, 11, 8),
	(101, 'K140', 'Glositis', '--', NULL, 2, 12, 8),
	(102, 'K141', 'Lengua Geografica', '--', NULL, 2, 12, 8),
	(103, 'K142', 'Glositis Romboidea Mediana', '--', NULL, 2, 12, 8),
	(104, 'K143', 'Hipertrofia De Las Papilas Linguales', '--', NULL, 2, 12, 8),
	(105, 'K144', 'Atrofia De Las Papilas Linguales', '--', NULL, 2, 12, 8),
	(106, 'K145', 'Lengua Plegada', '--', NULL, 2, 12, 8),
	(107, 'K146', 'Glosodinia', '--', NULL, 2, 12, 8),
	(108, 'K148', 'Otras Enfermedades De La Lengua', '--', NULL, 2, 12, 8),
	(109, 'K149', 'Enfermedad De La Lengua No Especificada', '--', NULL, 2, 12, 8),
	(110, 'GP00', 'Examen Odontologico', '--', NULL, 2, 13, 8),
	(111, 'GP02', 'Superficie Sana', '--', '000000', 1, 13, NULL),
	(112, 'GP03', 'Actividades De Promocion Y Prevencion', '--', NULL, 2, 13, 8),
	(113, 'GP01', 'Diente Ausente', '--', NULL, 2, 14, 8),
	(114, 'GP04', 'Corona En Mal Estado', '--', NULL, 2, 15, 8),
	(115, 'GP05', 'Provisional En Mal Estado', '--', NULL, 2, 15, 8),
	(116, 'GP06', 'Resina Desadaptada', '--', '32FF12', 1, 15, NULL),
	(117, 'GP07', 'Amlagama Desadaptada', '--', '2A12FF', 1, 15, NULL),
	(118, 'GP08', 'Ionomero Desadaptado', '--', 'E5FC1C', 1, 15, NULL),
	(119, 'GP09', 'Provisional En Buen Estado', '--', NULL, 2, 15, 8),
	(121, '990203', 'Educacion Individual En Salud, Por Odontologia', '--', NULL, 2, 16, NULL),
	(122, '990212', 'Educacion Individual En Salud, Por Higiene Oral', '--', NULL, 2, 16, 8),
	(123, '997101', 'Aplicacion De Sellantes De Autocurado', '--', NULL, 2, 16, 9),
	(124, '997102', 'Aplicacion De Sellantes De Fotocurado', '--', NULL, 2, 16, 11),
	(125, '997103', 'Topicacion De Fluor En Gel', '--', NULL, 2, 16, 10),
	(127, '997104', 'Topicacion De Fluor En Solucion', '--', NULL, 2, 16, 8),
	(128, '997106', 'Topificacion Barniz De Fluor', '--', NULL, 2, 16, 8),
	(129, '997300', 'Detartraje Supragingival Sod +', '--', NULL, 2, 16, 8),
	(130, '997310', 'Control De Placa Dental Ncoc', '--', NULL, 2, 16, 8),
	(131, 'C00015', 'Topificacion De Fluor En Barniz', '--', NULL, 2, 16, 8),
	(132, '870101', 'Radiografia De Cara (perfilograma) +', '--', NULL, 2, 17, 8),
	(133, '870102', 'Radiografia De Orbitas', '--', NULL, 2, 17, 8),
	(134, '870103', 'Radiografia De Agujeros Opticos', '--', NULL, 2, 17, 8),
	(135, '870104', 'Radiografia De Malar', '--', NULL, 2, 17, 8),
	(136, '870105', 'Radiografia De Arco Cigomatico', '--', NULL, 2, 17, 8),
	(137, '870107', 'Radiografia De Huesos Nasales', '--', NULL, 2, 17, 8),
	(138, '870108', 'Radiografia De Senos Paranasales', '--', NULL, 2, 17, 8),
	(139, '870112', 'Radiografia De Maxilar Superior', '--', NULL, 2, 17, 8),
	(140, '870113', 'Radiografia De Maxilar Inferior', '--', NULL, 2, 17, 8),
	(141, '870114', 'Radiografia Panoramica De Maxilares, Superior E Inferior (ortopantomografia)', '--', NULL, 2, 17, 8),
	(142, '870131', 'Radiografia De Articulacion Temporomaxilar (atm)', '--', NULL, 2, 17, 8),
	(143, '870440', 'Radiografias Intraorales Oclusales', '--', NULL, 2, 17, 8),
	(144, '870450', 'Radiografias Intraorales Periapicales Milimetradas', '--', NULL, 2, 17, 8),
	(145, '870451', 'Radiografias Intraorales Periapicales Dientes Anteriores Superiores', '--', NULL, 2, 17, 8),
	(146, '870452', 'Radiografias Intraorales Periapicales Dientes Anteriores Inferiores', '--', NULL, 2, 17, 8),
	(147, '870453', 'Radiografias Intraorales Periapicales Zona De Caninos', '--', NULL, 2, 17, 8),
	(148, '870454', 'Radiografias Intraorales Periapicales Premolares', '--', NULL, 2, 17, 8),
	(149, '870455', 'Radiografias Intraorales Periapicales Molares', '--', NULL, 2, 17, 8),
	(150, '870456', 'Radiografias Intraorales Periapicales Juego Completo', '--', NULL, 2, 17, 8),
	(151, '870460', 'Radiografias Intraorales Coronales', '--', NULL, 2, 17, 8),
	(152, '230100', 'Exodoncia De Dientes Permanentes Sod', '--', NULL, 2, 18, 8),
	(153, '230101', 'Exodoncia De Diente Permanente Unirradicular +', '--', NULL, 2, 18, 8),
	(154, '230102', 'Exodoncia De Diente Permanente Multirradicular +', '--', NULL, 2, 18, 8),
	(155, '230200', 'Exodoncia De Dientes Temporales Sod', '--', NULL, 2, 18, 8),
	(156, '230201', 'Exodoncia De Diente Temporal Unirradicular +', '--', NULL, 2, 18, 8),
	(157, '230202', 'Exodoncia De Diente Temporal Multirradicular +', '--', NULL, 2, 18, 8),
	(158, '231100', 'Exodoncia Quirurgica Unirradicular Sod', '--', NULL, 2, 18, 8),
	(159, '231200', 'Exodoncia Quirurgica Multirradicular Sod', '--', NULL, 2, 18, 8),
	(160, '231300', 'Exodoncia De Diente Incluido Sod +', '--', NULL, 2, 18, 8),
	(161, '231301', 'Exodoncia De Incluido En Posicion Ectopica Con Abordaje Intraoral +', '--', NULL, 2, 18, 8),
	(162, '231302', 'Exodoncia De Incluido En Posicion Ectopica Con Abordaje Extraoral +', '--', NULL, 2, 18, 8),
	(163, '231400', 'Exodoncias Multiples Con Alveoloplastia, Por Cuadrante Sod', '--', NULL, 2, 18, 8),
	(164, '231500', 'Colgajo Desplazado Para Abordaje De Diente Retenido (ventana Quirurgica) Sod', '--', NULL, 2, 18, 8),
	(165, '237502', 'Procedimientos Correctivos En Fracturas Radiculares', '--', NULL, 2, 18, 8),
	(166, '237600', 'Fistulizacion Endodontica Sod', '--', NULL, 2, 18, 8),
	(167, '237601', 'Fistulizacion Endodontica Por Trepanacion Y Drenaje +', '--', NULL, 2, 18, 8),
	(168, '237602', 'Fistulizacion Endodontica Por Incision +', '--', NULL, 2, 18, 8),
	(169, '237700', 'Radectomia (amputacion Radicular) Sod', '--', NULL, 2, 18, 8),
	(170, '237701', 'Radectomia (amputacion Radicular) Unica', '--', NULL, 2, 18, 8),
	(171, '237702', 'Radectomia (amputacion Radicular) Multiple', '--', NULL, 2, 18, 8),
	(172, '237800', 'Hemiseccion Del Diente Sod', '--', NULL, 2, 18, 8),
	(173, '242202', 'Cirugia A Colgajo Con Reseccion Radicular (amputacion, Hemiseccion)', '--', NULL, 2, 18, 8),
	(174, '245200', 'Alveolectomia Sod +', '--', NULL, 2, 18, 8),
	(175, '249100', 'Control De Hemorragia Dental Pos Quirurgica Sod +', '--', NULL, 2, 18, 8),
	(176, '270100', 'Incision Y Drenaje En Cavidad Bucal Sod', '--', NULL, 2, 18, 8),
	(177, '270101', 'Incision Y Drenaje Intraoral En Cavidad Bucal', '--', NULL, 2, 18, 8),
	(178, '270102', 'Incision Y Drenaje Extraoral En Cavidad Bucal', '--', NULL, 2, 18, 8),
	(179, '271100', 'Drenaje De Coleccion De Paladar Sod', '--', NULL, 2, 18, 8),
	(180, '274100', 'Frenillectomia Labial Sod +', '--', NULL, 2, 18, 8),
	(182, '232101', 'Obturacion Dental Con Amalgama +', '--', '2A12FF ', 1, 19, NULL),
	(183, '232102', 'Obturacion Dental Con Resina De Fotocurado +', '--', '63B982', 1, 19, NULL),
	(184, '232103', 'Obturacion Dental Con Ionomero De Vidrio +', '--', 'E5FC1C', 1, 19, NULL),
	(185, '232200', 'Obturacion Temporal Por Diente Sod', '--', NULL, 2, 19, 8),
	(186, '232401', 'Reconstruccion De Angulo Incisal, Con Resina De Fotocurado', '--', NULL, 2, 19, 8),
	(187, '232402', 'Reconstruccion Tercio Incisal, Con Resina De Fotocurado', '--', NULL, 2, 19, 8),
	(188, '237901', 'Blanqueamiento De Diente [intrinseco] Por Causas Endo-donticas +', '--', NULL, 2, 19, 8),
	(189, '248100', 'Cierre De Diastema (alveolar, Dental) Sod', '--', NULL, 2, 19, 8),
	(190, '997105', 'Aplicacion De Resina Preventiva', '--', '32FF12', 1, 19, NULL),
	(191, '235200', 'Trasplante De Diente (intencional) Sod', '--', NULL, 2, 20, 8),
	(192, '237100', 'Pulpotomia Sod +', '--', NULL, 2, 20, 8),
	(193, '237101', 'Pulpotomia Con Pulpectomia +', '--', NULL, 2, 20, 8),
	(194, '237200', 'Apexificacion (induccion De Apexogenesis) Sod +', '--', NULL, 2, 20, 8),
	(195, '237300', 'Terapia De Conducto Radicular Sod', '--', NULL, 2, 20, 8),
	(196, '237301', 'Terapia De Conducto Radicular En Diente Unirradicular +', '--', NULL, 2, 20, 8),
	(197, '237302', 'Terap Ia De Conducto Radicular En Diente Birradicular +', '--', NULL, 2, 20, 8),
	(198, '237303', 'Terapia De Conducto Radicular En Diente Multirradicular +', '--', NULL, 2, 20, 8),
	(199, '237304', 'Terapia De Conducto Radicular En Diente Temporal Unirra-dicular +', '--', NULL, 2, 20, 8),
	(200, '237305', 'Terapia De Conducto Radicular En Diente Temporal Multi-rradicular +', '--', NULL, 2, 20, 8),
	(201, '237501', 'Procedimiento Correctivo En Resorcion Radicular (interna Y Externa)', '--', NULL, 2, 20, 8),
	(202, '232300', 'Colocacion De Pin Milimetrico Sod', '--', NULL, 2, 21, 8),
	(203, '233100', 'Restauracion De Dientes Mediante Incrustacion Metalica Sod', '--', NULL, 2, 21, 8),
	(204, '233200', 'Restauracion De Dientes Mediante Incrustacion No Metalica Sod', '--', NULL, 2, 21, 8),
	(205, '234100', 'Colocacion O Aplicacion De Corona Sod', '--', NULL, 2, 21, 8),
	(206, '234101', 'Colocacion O Aplicacion De Corona En Acero Inoxidable (para Dientes Temporales)', '--', NULL, 2, 21, 8),
	(207, '234102', 'Colocacion O Aplicacion De Corona En Policarboxilato (para Dientes Temporales)', '--', NULL, 2, 21, 8),
	(208, '234103', 'Colocacion O Aplicacion De Corona En Forma Plastica', '--', NULL, 2, 21, 8),
	(209, '234104', 'Colocacion O Aplicacion De Corona Acrilica Termocurada', '--', NULL, 2, 21, 8),
	(210, '234201', 'Colocacion O Insercion De Protesis Fija Cada Unidad (pilar Y Ponticos)', '--', NULL, 2, 21, 8),
	(211, '234201*', 'Colocacion O Insercion De Protesis Fija Cada Unidad (ponticos)', '--', NULL, 2, 21, 8),
	(212, '234202', 'Reconstruccion De Muñones', '--', NULL, 2, 21, 8),
	(213, '234203', 'Patron De Nucleo', '--', NULL, 2, 21, 8),
	(214, '234204', 'Re Paracion De Protesis Fija', '--', NULL, 2, 21, 8),
	(215, '234301', 'Colocacion O Insercion De Protesis Removible (superior O Inferior) Mucosoportada', '--', NULL, 2, 21, 8),
	(216, '234302', 'Colocacion O Insercion De Protesis Removible (superior O Inferior) Dentomucosoportada', '--', NULL, 2, 21, 8),
	(217, '234303', 'Reparacion De Protesis Removible', '--', NULL, 2, 21, 8),
	(218, '234401', 'Colocacion O Insercion De Protesis Total Medio Caso (superior O Inferior)', '--', NULL, 2, 21, 8),
	(219, '234402', 'Colocacion O Insercion De Protesis Total (superior E Inferior)', '--', NULL, 2, 21, 8),
	(220, '248200', 'Ajustamiento Oclusal Sod', '--', NULL, 2, 21, 8),
	(221, '248400', 'Reparacion De Aparatologia Fija O Removible Sod', '--', NULL, 2, 21, 8),
	(222, '235100', 'Reimplante De Diente Sod', '--', NULL, 2, 22, 8),
	(223, '236100', 'Implante Aloplastico Ceramico Sod', '--', NULL, 2, 22, 8),
	(224, '236200', 'Implante Aloplastico Metalico Sod', '--', NULL, 2, 22, 8),
	(225, '236300', 'Implante Dental Aloplastico (oseointegracion) Sod', '--', NULL, 2, 22, 8),
	(226, '237401', 'Curetaje Apical Con Apicectomia Y Obturacion Retrogada [cirugia Perirradicular]', '--', NULL, 2, 22, 8),
	(227, '240200', 'Detartraje Subgingival Sod +', '--', NULL, 2, 22, 8),
	(228, '240300', 'Alisado Radicular, Campo Cerrado Sod +', '--', NULL, 2, 22, 8),
	(229, '240400', 'Drenaje De Coleccion Periodontal (cerrado Con Alisado Radicular) Sod+', '--', NULL, 2, 22, 8),
	(230, '242100', 'Plastia Mucogingival Sod', '--', NULL, 2, 22, 8),
	(231, '242101', 'Plastia Mucogingival Con Injertos Pediculados (colgajos Pediculados)', '--', NULL, 2, 22, 8),
	(232, '242102', 'Plastia Mucogingival Con Injerto Gingival Libre +', '--', NULL, 2, 22, 8),
	(233, '242201', 'Curetaje A Campo Abierto +', '--', NULL, 2, 22, 8),
	(234, '242300', 'Plastias Preprotesicas (aumento De Corona Clinica) Sod', '--', NULL, 2, 22, 8),
	(235, '242400', 'Reparacion O Plastia Periodontal Regenerativa (injertos, Membranas) Sod', '--', NULL, 2, 22, 8),
	(236, '243400', 'Gingivectomia Sod', '--', NULL, 2, 22, 8),
	(237, '243500', 'Operculectomia Ncoc +', '--', NULL, 2, 22, 8),
	(238, '245100', 'Regularizacion De Rebordes Sod +', '--', NULL, 2, 22, 8),
	(239, '247100', 'Colocacion De Aparatologia Fija Para Ortodoncia (arcada) Sod', '--', NULL, 2, 23, 8),
	(240, '247201', 'Colocacion De Aparatologia Removible Intraoral Para Ortodoncia (arcada)', '--', NULL, 2, 23, 8),
	(241, '247202', 'Colocacion De Aparatologia Removible Extraoral Para Ortodoncia (arcada)', '--', NULL, 2, 23, 8),
	(242, '247300', 'Colocacion De Aparatos De Retencion Sod', '--', NULL, 2, 23, 8),
	(243, '241100', 'Biopsia De Encia Sod', '--', NULL, 2, 24, 8),
	(244, '241101', 'Biopsia Incisional De Encia', '--', NULL, 2, 24, 8),
	(245, '241102', 'Biopsia Escisional De Encia Con Cierre Primario', '--', NULL, 2, 24, 8),
	(246, '241103', 'Biopsia Escisional De Encia Y Recubrimiento Con Colgajo O Injerto', '--', NULL, 2, 24, 8),
	(247, '241200', 'Biopsia De Pared Alveolar Sod +', '--', NULL, 2, 24, 8),
	(248, '272101', 'Biopsia De Uvula', '--', NULL, 2, 24, 8),
	(249, '272102', 'Biopsia Incisional De Paladar', '--', NULL, 2, 24, 8),
	(250, '272103', 'Biopsia Escisional De Paladar', '--', NULL, 2, 24, 8),
	(251, '272300', 'Biopsia De Labio Sod', '--', NULL, 2, 24, 8),
	(252, '272301', 'Biopsia Incisional De Labio', '--', NULL, 2, 24, 8),
	(253, '272302', 'Biopsia Escisional De Labio', '--', NULL, 2, 24, 8),
	(254, '272400', 'Biopsia De Pared De Cavidad Bucal Sod +', '--', NULL, 2, 24, 8),
	(255, '272401', 'Biopsia Por Aspiracion Con Aguja Fina En Cavidad Oral', '--', NULL, 2, 24, 8),
	(256, '273100', 'Escision Local De Lesion En Paladar Oseo Sod', '--', NULL, 2, 25, 8),
	(257, '273101', 'Escision De Lesion Superficial De Paladar', '--', NULL, 2, 25, 8),
	(258, '273102', 'Reseccion Local Del Paladar Por Cauterizacion O Crio-', '--', NULL, 2, 25, 8),
	(259, '273103', 'Reseccion Local Del Paladar Por Quimioterapia', '--', NULL, 2, 25, 8),
	(260, '273200', 'Escision Amplia De Lesion En Paladar Oseo Sod', '--', NULL, 2, 25, 8),
	(261, '273201', 'Escision De Lesion Profunda De Paladar', '--', NULL, 2, 25, 8),
	(262, '273202', 'Reseccion En Bloque De Apofisis Alveolar Y Paladar', '--', NULL, 2, 25, 8),
	(263, '273203', 'Palatectomia Parcial Ncoc +', '--', NULL, 2, 25, 8),
	(264, '273204', 'Palatectomia Total', '--', NULL, 2, 25, 8),
	(265, '276100', 'Sutura De Laceracion De Paladar Sod', '--', NULL, 2, 25, 8),
	(266, '276101', 'Palatorrafia En Z (furlow)', '--', NULL, 2, 25, 8),
	(267, '276200', 'Correccion De Paladar Fisurado (estafilorrafia) Sod', '--', NULL, 2, 25, 8),
	(268, '276201', 'Correccion De Hendidura Alveolopalatina', '--', NULL, 2, 25, 8),
	(269, '276202', 'Cierre De Hendidura Alveolar Con Injerto', '--', NULL, 2, 25, 8),
	(270, '276203', 'Cierre De Hendidura Alveolar Sin Injerto', '--', NULL, 2, 25, 8),
	(271, '276204', 'Reconstruccion De Boveda Palatina Mediante Colgajos Pediculados', '--', NULL, 2, 25, 8),
	(272, '276205', 'Correccion De Fisura Palatina, Con Colgajo Vomeriano', '--', NULL, 2, 25, 8),
	(273, '276206', 'Injerto Oseo De Paladar', '--', NULL, 2, 25, 8),
	(274, '276207', 'Uvulo-palato-faringoplastia', '--', NULL, 2, 25, 8),
	(275, '276208', 'Uvulo-palato-faringoplastia Con Laser', '--', NULL, 2, 25, 8),
	(276, '276300', 'Revision De Reparacion De Paladar Fisurado Sod +', '--', NULL, 2, 25, 8),
	(277, '277100', 'Incision De Uvula Sod +', '--', NULL, 2, 25, 8),
	(278, '277201', 'Reseccion Parcial De Uvula', '--', NULL, 2, 25, 8),
	(279, '277301', 'Uvulorrafia', '--', NULL, 2, 25, 8),
	(280, '278200', 'Incision De Cavidad Bucal, Estructura No Especificada Sod', '--', NULL, 2, 25, 8),
	(281, '278301', 'Cierre Velofaringeo Con Colgajo Faringeo', '--', NULL, 2, 25, 8),
	(282, '278400', 'Correccion De Macro O Microstoma Sod +', '--', NULL, 2, 25, 8),
	(283, '274200', 'Escision De Lesion De Labio Sod', '--', NULL, 2, 26, 8),
	(284, '274201', 'Reseccion Parcial De Labio Por Tumor Maligno +', '--', NULL, 2, 26, 8),
	(285, '274202', 'Reseccion Parcial De Labio Por Tumor Maligno, Con Rotacion De Colgajo', '--', NULL, 2, 26, 8),
	(286, '274203', 'Reseccion Total De Labio Por Tumor Maligno', '--', NULL, 2, 26, 8),
	(287, '274400', 'Reseccion De Fosetas Labiales Sod +', '--', NULL, 2, 26, 8),
	(288, '275100', 'Sutura De Laceracion En Labios Sod', '--', NULL, 2, 26, 8),
	(289, '275101', 'Sutura O Reparacion De Laceracion (herida) En Labios Hasta De Cinco Centimetros +', '--', NULL, 2, 26, 8),
	(290, '275102', 'Sutura O Reparacion De Laceracion (herida) En Labios De Mas De Cinco Centimetros +', '--', NULL, 2, 26, 8),
	(291, '275400', 'Reparacion De Labio Fisurado [queiloplastia] Sod', '--', NULL, 2, 26, 8),
	(292, '275401', 'Correccion Parcial De Labio Fisurado Por Adhesion', '--', NULL, 2, 26, 8),
	(293, '275402', 'Correccion Primaria De Labio Fisurado Unilateral', '--', NULL, 2, 26, 8),
	(294, '275403', 'Correccion Secundaria De Labio Fisurado Unilateral', '--', NULL, 2, 26, 8),
	(295, '275404', 'Correccion De Labio Fisurado Bilateral Ncoc +', '--', NULL, 2, 26, 8),
	(296, '243200', 'Sutura De Laceracion De Encia Sod', '--', NULL, 2, 27, 8),
	(297, '243201', 'Sutura De Laceracion De Encia, Menor De Tres Centimetros', '--', NULL, 2, 27, 8),
	(298, '243202', 'Sutura De Laceracion De Encia, Mayor De Tres Centimetros', '--', NULL, 2, 27, 8),
	(299, '274300', 'Escision De Lesion En Mucosa Oral Sod', '--', NULL, 2, 27, 8),
	(300, '274301', 'Reseccion De Lesion Benigna De La Mucosa Oral, Hasta De Dos Centimetros De Diametro', '--', NULL, 2, 27, 8),
	(301, '274302', 'Reseccion De Lesion Benigna De La Mucosa Oral, Mayor De Dos Centimetros De Diametro', '--', NULL, 2, 27, 8),
	(302, '274303', 'Reseccion De Tumor Maligno De Mucosa Oral +', '--', NULL, 2, 27, 8),
	(303, '274304', 'Reseccion De Tumor Maligno De Mucosa Oral, Con Colgajo Local O A Distancia', '--', NULL, 2, 27, 8),
	(304, '274901', 'Remocion De Cuerpo Extraño En Tejidos Blandos De La Boca', '--', NULL, 2, 27, 8),
	(305, '274902', 'Reseccion De Bridas Intraorales', '--', NULL, 2, 27, 8),
	(306, '275103', 'Sutura Y/o Plastia En Avulsion De Labios', '--', NULL, 2, 27, 8),
	(307, '275200', 'Sutura De Laceracion De Otra Parte De La Boca Sod', '--', NULL, 2, 27, 8),
	(308, '275201', 'Estomatorrafia (sutura De Herida En Mucosa Oral) De Menos De Cinco Centimetros', '--', NULL, 2, 27, 8),
	(309, '275202', 'Estomatorrafia (sutura De Herida En Mucosa Oral) De Masde Cinco Centimetros', '--', NULL, 2, 27, 8),
	(310, '243100', 'Escision De Lesion De Encia Sod', '--', NULL, 2, 28, 8),
	(311, '243101', 'Escision De Lesion Benigna Encapsulada En Encia Hasta De Tres Centimetros', '--', NULL, 2, 28, 8),
	(312, '243102', 'Escision De Lesion Benigna Encapsulada En Encia De Mas De Tres Centimetros', '--', NULL, 2, 28, 8),
	(313, '243103', 'Escision De Lesion Benigna No Encapsulada En Encia Hasta De Tres Centimetros', '--', NULL, 2, 28, 8),
	(314, '243104', 'Escision De Lesion Benigna No Encapsulada En Encia De Mas De Tres Cen', '--', NULL, 2, 28, 8),
	(315, '243105', 'Escision De Lesion Maligna De Encia Sin Vaciamiento Ganglionar Ni Reseccion De Estructuras Vecinas U', '--', NULL, 2, 28, 8),
	(316, '243106', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Piso De Boca Y/o Lengua Con Cierre P', '--', NULL, 2, 28, 8),
	(317, '243107', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Piso De Boca Y/o Lengua Y Reconstruc', '--', NULL, 2, 28, 8),
	(318, '243108', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Reseccion Osea Y Reconstruccion Con ', '--', NULL, 2, 28, 8),
	(319, '243109', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Reseccion Osea Y Reconstruccion Con ', '--', NULL, 2, 28, 8),
	(320, '243300', 'Enucleacion De Quiste Epidermoide Sod', '--', NULL, 2, 28, 8),
	(321, '243301', 'Enucleacion De Quiste Epidermoide, Via Intraoral', '--', NULL, 2, 28, 8),
	(322, '243302', 'Enucleacion De Quiste Epidermoide, Via Extraoral', '--', NULL, 2, 28, 8),
	(323, '244100', 'Escision De Lesion Odontogenica Sod', '--', NULL, 2, 28, 8),
	(324, '244101', 'Enucleacion De Quiste Odontogenico Hasta De Tres Centimetros De Diametro+', '--', NULL, 2, 28, 8),
	(325, '244102', 'Enucleacion De Quiste Odontogenico De Mas De Tres Centimetros De Diametro', '--', NULL, 2, 28, 8),
	(326, '244108', 'Marsupializacion De Quiste Odontogenico +', '--', NULL, 2, 28, 8),
	(327, '244103', 'Reseccion De Tumor Benigno O Maligno Odontogenico', '--', NULL, 2, 29, 8),
	(328, '244104', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Inmediata Con Injerto Oseo Libre', '--', NULL, 2, 29, 8),
	(329, '244105', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Colgajo Oseo Pediculado', '--', NULL, 2, 29, 8),
	(330, '244106', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Colgajo Oseo Libre', '--', NULL, 2, 29, 8),
	(331, '244107', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Placa', '--', NULL, 2, 29, 8),
	(332, '237902', 'Exploracion Y Movilizacion De Nervio Dentario Inferior', '--', NULL, 2, 30, 8),
	(333, '242204', 'Aumento De Reborde Parcialmente Edentulo (sin Material)', '--', NULL, 2, 30, 8),
	(334, '242205', 'Aumento De Reborde Parcialmente Edentulo (con Material)', '--', NULL, 2, 30, 8),
	(335, '247400', 'Ferulizacion Sod', '--', NULL, 2, 30, 8),
	(336, '247401', 'Ferulizacion Rigida (superior Y/o Inferior)', '--', NULL, 2, 30, 8),
	(337, '247402', 'Ferulizacion Semirrigida (superior Y/o Inferior)', '--', NULL, 2, 30, 8),
	(338, '275301', 'Reseccion Intraoral De Fistula De Boca', '--', NULL, 2, 30, 8),
	(339, '275302', 'Reseccion Extraoral De Fistula De Boca', '--', NULL, 2, 30, 8),
	(340, '275303', 'Cierre De Fistula Orosinusal U Oronasal, Con Colgajo Palatino, Lingual O Bucal', '--', NULL, 2, 30, 8),
	(341, '275304', 'Cierre De Fistula Orosinusal Con Sinusotomia, Con O Sin Remocion De Cuerpo Extraño O Colgajo Palatin', '--', NULL, 2, 30, 8),
	(342, '275305', 'Alargamiento De Paladar Con Colgajo En Isla', '--', NULL, 2, 30, 8),
	(343, '275500', 'Injerto De Piel De Grosor Total Aplicado Al Labio Y Cavidad Bucal Sod', '--', NULL, 2, 30, 8),
	(344, '275601', 'Lipoinjerto En Cara', '--', NULL, 2, 30, 8),
	(345, '275701', 'Injerto De Piel En Labios Con Adhesion De Colgajo Pediculado', '--', NULL, 2, 30, 8),
	(346, '275800', 'Profundizacion De Piso De Boca Sod', '--', NULL, 2, 30, 8),
	(347, '275801', 'Profundizacion O Descenso De Piso De Boca Con Desinsercion De Milohiodeo Y/o Genihiodeo', '--', NULL, 2, 30, 8),
	(348, '275900', 'Profundizacion De Surco Vestibular Sod', '--', NULL, 2, 30, 8),
	(349, '275901', 'Profundizacion De Surco Vestibular Con Injerto Mucoso', '--', NULL, 2, 30, 8),
	(350, '275902', 'Profundizacion De Surco Vestibular Con Injerto Cutaneo', '--', NULL, 2, 30, 8);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.logfails
CREATE TABLE IF NOT EXISTS `logfails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Se guardan los datos de los inicios de sesion fallidos';

-- Volcando datos para la tabla odontograma1.logfails: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `logfails` DISABLE KEYS */;
INSERT INTO `logfails` (`Id`, `Usuario`, `Password`, `Fecha`) VALUES
	(1, 'ana', '123', '2016-08-09 17:07:14'),
	(2, 'ana', '123', '2016-08-09 18:38:32'),
	(3, 'krlos', 'KRLOS19915991', '2016-08-23 15:02:08');
/*!40000 ALTER TABLE `logfails` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `Ingreso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Salida` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla odontograma1.logs: ~61 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `usuario`, `token`, `Ingreso`, `Salida`, `estado`) VALUES
	(10, 'ana', '56d79c8376c41feba8e31af0bab2bf42', '2016-08-09 18:38:50', '2016-08-09 18:39:29', b'0'),
	(11, 'ana', '84696bf1a14e61851737a4b602a7287b', '2016-08-09 18:53:19', '2016-08-09 18:54:44', b'0'),
	(12, 'ana', '5a228e4a4e262e386efae02e0cfa6755', '2016-08-09 18:54:46', '2016-08-09 18:54:52', b'0'),
	(13, 'ana', '84250172a07ce76f94bd8937a85319db', '2016-08-10 16:10:00', '2016-08-10 17:19:21', b'0'),
	(14, 'ana', '085bf236ef2332d2a553fdb5e2536c7c', '2016-08-10 17:19:28', NULL, b'1'),
	(15, 'ana', '55fc7b9cc3c8c900543ca90d7180bcf8', '2016-08-11 14:35:34', '2016-08-11 15:19:02', b'0'),
	(16, '', 'f700827908a66d2b0c6d5faf58b588ea', '2016-08-11 15:19:07', NULL, b'1'),
	(17, 'ana', '9fdb9dd4e30c264b07cdba070c007c92', '2016-08-11 15:20:57', '2016-08-11 16:01:19', b'0'),
	(18, 'ana', '482a393e015b79ab2d9b8ce5df2586b7', '2016-08-11 16:01:29', '2016-08-11 16:10:22', b'0'),
	(19, 'ana', '86ff99b5335f8a8b5e7e8aea4538c821', '2016-08-11 16:11:57', '2016-08-11 16:12:00', b'0'),
	(20, 'ana', 'e064777d759d9c6966b6bcf2fefea4c4', '2016-08-11 16:12:18', '2016-08-11 16:12:21', b'0'),
	(21, 'ana', '4fc5fe58289218d04ac5f4d1855b8eea', '2016-08-11 16:13:36', '2016-08-11 16:23:20', b'0'),
	(22, 'andres', '41e07655b1927ada442c059556e9e486', '2016-08-11 16:23:27', NULL, b'1'),
	(23, 'andres', '506fa6576cda3354bdafd17cb68c368b', '2016-08-11 16:24:26', NULL, b'1'),
	(24, 'andres', '1cf5e97fac76db5bcb6dadf105a8accf', '2016-08-11 16:24:44', NULL, b'1'),
	(25, 'andres', 'e0e301e5d1463e92b1c5ed7baa054d98', '2016-08-11 16:27:05', NULL, b'1'),
	(26, 'ana', '225fc6a5deff73e66443a68f3ceadd57', '2016-08-11 16:27:33', '2016-08-11 16:29:36', b'0'),
	(27, 'ana', '533d3df0cf12ba3a2588797e2df2a015', '2016-08-11 16:29:49', '2016-08-11 16:33:28', b'0'),
	(28, 'maria', 'b05801208666e4dd9908cc3a63081aec', '2016-08-11 16:33:48', NULL, b'1'),
	(29, 'maria', '5e1ab0ca8a3c966a17d169b239300f3d', '2016-08-11 16:34:41', NULL, b'1'),
	(30, 'maria', '04fb23eabfd8540f37d53d0a3b9c4d91', '2016-08-11 16:36:12', NULL, b'1'),
	(31, 'maria', 'c811a45b07ff9ad0df23ccbf55fdc42c', '2016-08-11 16:36:35', NULL, b'1'),
	(32, 'maria', '70c7e5f9e57896278bc71edeb3595ef1', '2016-08-11 16:37:26', '2016-08-11 17:08:12', b'0'),
	(33, 'maria', '93dfe1abea2daad6060b5fd53725be86', '2016-08-11 16:37:38', NULL, b'1'),
	(34, 'maria', '7b97a193dbe804ac411e8f85775a5252', '2016-08-11 16:37:56', NULL, b'1'),
	(35, 'maria', '9fe4d6e886d56c4f88c083d444f10788', '2016-08-11 16:38:30', NULL, b'1'),
	(36, 'maria', '653435333f47fac5d8f7cc6d6615cf4c', '2016-08-11 16:38:37', NULL, b'1'),
	(37, 'maria', 'd5c4ade90501aaf09a186b3fe2e255a4', '2016-08-11 16:38:54', NULL, b'1'),
	(38, 'maria', 'c3750cc62c77ad5227dfc0803a9da4cf', '2016-08-11 16:39:22', NULL, b'1'),
	(39, 'maria', '9fe4d6e886d56c4f88c083d444f10788', '2016-08-11 16:40:30', NULL, b'1'),
	(40, 'maria', '7b97a193dbe804ac411e8f85775a5252', '2016-08-11 16:40:56', NULL, b'1'),
	(41, 'maria', 'a2728a1d4d34b23f54f47a1128c0f3ea', '2016-08-11 16:41:23', '2016-08-11 16:42:07', b'0'),
	(42, 'andres', '93be50e3737246a6d3a82750a7d84e3d', '2016-08-11 16:42:13', '2016-08-11 16:42:22', b'0'),
	(43, 'ana', '0b3f57e09049bf38b7b043b257355ec8', '2016-08-11 16:42:30', '2016-08-11 16:43:34', b'0'),
	(44, 'maria', '0a993c6f473006af843c45b5ef87ebe9', '2016-08-11 16:43:57', '2016-08-11 16:44:05', b'0'),
	(45, 'ana', '62a0664c7fc1b7926354fff7ab9cbabc', '2016-08-11 16:44:07', '2016-08-11 16:44:19', b'0'),
	(46, 'maria', '70c7e5f9e57896278bc71edeb3595ef1', '2016-08-11 16:44:26', '2016-08-11 17:08:12', b'0'),
	(47, 'ana', '1c3e78c1b7a9d26d9293b24c3c3a2216', '2016-08-11 17:08:15', '2016-08-11 17:08:23', b'0'),
	(48, 'ana', '8b1a0e8713359e482451259b708f9e2a', '2016-08-12 22:00:06', '2016-08-12 22:27:16', b'0'),
	(49, 'ana', 'da8dc26c1d37c666469041c27f81d22d', '2016-08-12 22:27:18', NULL, b'1'),
	(50, 'ana', '75959f08754bfe56c91e30b9e9b9871d', '2016-08-16 15:21:14', '2016-08-16 15:35:53', b'0'),
	(51, 'ana', '9e30c540e6d5dfa44db3d8ef60bfacfa', '2016-08-16 15:37:54', '2016-08-16 15:39:09', b'0'),
	(52, 'ana', '1aee02db745ec81083bb6c93bb454a2a', '2016-08-16 15:39:11', '2016-08-16 15:39:53', b'0'),
	(53, 'maria', 'b9d71b8c06fec6a101f35179a2705525', '2016-08-16 15:40:07', NULL, b'1'),
	(54, 'ana', '8e5183fad46cd5eb68aed330362e90ca', '2016-08-17 21:11:05', '2016-08-17 16:18:27', b'0'),
	(55, 'maria', 'baa0315a669047b4915882a1557ed711', '2016-08-17 16:18:33', NULL, b'1'),
	(56, 'ana', '41479630a33732e0502cc9ea0e352c3a', '2016-08-18 15:36:39', '2016-08-18 15:37:09', b'0'),
	(57, 'maria', 'd4275552db6ca6d93af966cc5ae26906', '2016-08-18 15:37:21', '2016-08-18 17:27:47', b'0'),
	(58, 'ana', '46e5af1dbffe245f2533c37e638e77e8', '2016-08-18 17:27:48', '2016-08-18 17:28:11', b'0'),
	(59, 'maria', '6711b5700398017beea58097869a245f', '2016-08-18 17:28:17', '2016-08-18 17:32:57', b'0'),
	(60, 'ana', '71b5c159053baac764a0dc37bd207238', '2016-08-18 17:34:23', '2016-08-18 17:35:01', b'0'),
	(61, 'maria', 'b7b622862dd419e623f1abbf5683c9a8', '2016-08-18 17:35:06', '2016-08-18 17:45:05', b'0'),
	(62, 'ana', '3c31607113e11662cfbfb1b24e598584', '2016-08-18 17:45:09', '2016-08-18 17:46:22', b'0'),
	(63, 'maria', '7eb3dbccc6a91484a03d57af2e3656e7', '2016-08-18 17:46:37', '2016-08-18 18:02:55', b'0'),
	(64, 'ana', 'bac2edc42a7f63668ade25c08a22e112', '2016-08-23 14:57:59', '2016-08-23 15:01:53', b'0'),
	(65, 'andres', '3e95d5d11820dc5e769679c28ecab146', '2016-08-23 15:02:19', '2016-08-23 15:53:44', b'0'),
	(66, 'maria', 'cb6f840167efa15e9c5ea1e7950e1c50', '2016-08-23 15:42:31', '2016-08-23 15:42:37', b'0'),
	(67, 'ana', 'c3d9711d0a4438c71cfa25fa646e5f78', '2016-08-23 15:42:40', '2016-08-23 15:51:32', b'0'),
	(68, 'ana', '5314c32edb40e5aca070dacd185821f0', '2016-08-23 15:53:48', NULL, b'1'),
	(69, 'ana', 'e83f668bc3ab15226a582eb2815979f5', '2016-08-24 09:33:40', '2016-08-24 10:17:20', b'0'),
	(70, 'maria', '66eac45f1b2abbbff6fdcb9061647463', '2016-08-24 10:17:28', '2016-08-24 10:25:31', b'0'),
	(71, 'ana', '7453df4f03e51d0b2504b5a3fe11d8e9', '2016-08-24 10:25:34', NULL, b'1'),
	(72, 'ana', '2a36a75de5e310ff48f4cf827ca7cc89', '2016-09-05 14:38:25', NULL, b'1'),
	(73, 'ana', '78dff918fdaf8b979ff6129d1df98db5', '2016-09-06 15:31:08', '2016-09-06 15:31:15', b'0'),
	(74, 'ana', 'a9af44a06f2563379d5d6b590844bab5', '2016-09-06 15:31:18', NULL, b'1');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.medicos
CREATE TABLE IF NOT EXISTS `medicos` (
  `Id` bigint(15) NOT NULL,
  `Tipoid` enum('CC','TI','RC','AN') COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` enum('F','M') COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `Celular` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  `Tipo` varchar(4) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Medico (0111)',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.medicos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` (`Id`, `Tipoid`, `Nombres`, `Apellidos`, `Edad`, `Sexo`, `Telefono`, `Celular`, `Direccion`, `Usuario`, `Password`, `Estado`, `Tipo`) VALUES
	(11043, 'CC', 'andres', 'arreola', 25, 'M', '281000', '300856412', 'sincelejo', 'andres', 'andres', b'1', '0111'),
	(11044, 'CC', 'maria', 'morales', 24, 'F', '282000', '300564784', 'sincelejo', 'maria', 'maria', b'1', '0111');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.motivosconsulta
CREATE TABLE IF NOT EXISTS `motivosconsulta` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `MotivoAmpliado` text COLLATE utf8_spanish2_ci NOT NULL,
  `Cita` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__citas` (`Cita`),
  CONSTRAINT `FK__citas` FOREIGN KEY (`Cita`) REFERENCES `citas` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacena la razon por la que el paciente acude a consulta';

-- Volcando datos para la tabla odontograma1.motivosconsulta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `motivosconsulta` DISABLE KEYS */;
INSERT INTO `motivosconsulta` (`Id`, `Motivo`, `MotivoAmpliado`, `Cita`) VALUES
	(9, 'consulta general', 'consulta general anual', 75),
	(10, 'asfdl;sdjifkksl;d', 'sd/lfksdlfksdl;f', 76),
	(11, 'consulta', 'consulta general', 77);
/*!40000 ALTER TABLE `motivosconsulta` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacienteantecedentes
CREATE TABLE IF NOT EXISTS `pacienteantecedentes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente` bigint(15) NOT NULL,
  `Antecedente` int(11) NOT NULL,
  `Respuesta` bit(1) NOT NULL DEFAULT b'0' COMMENT 'almacena la respuesta de cada antecedente',
  `Observacion` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_pacienteantecedentes_pacientes` (`Paciente`),
  KEY `FK_pacienteantecedentes_antecedentes` (`Antecedente`),
  CONSTRAINT `FK_pacienteantecedentes_antecedentes` FOREIGN KEY (`Antecedente`) REFERENCES `antecedentes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteantecedentes_pacientes` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Almacena los antecedentes odontologicos y generales del paciente';

-- Volcando datos para la tabla odontograma1.pacienteantecedentes: ~42 rows (aproximadamente)
/*!40000 ALTER TABLE `pacienteantecedentes` DISABLE KEYS */;
INSERT INTO `pacienteantecedentes` (`Id`, `Paciente`, `Antecedente`, `Respuesta`, `Observacion`) VALUES
	(256, 1104379214, 1, b'1', 'tiroides, colon irritable'),
	(257, 1104379214, 2, b'1', 'polvo, semento'),
	(258, 1104379214, 3, b'0', ''),
	(259, 1104379214, 4, b'0', ''),
	(260, 1104379214, 5, b'0', ''),
	(261, 1104379214, 6, b'0', ''),
	(262, 1104379214, 7, b'0', ''),
	(263, 1104379214, 8, b'0', ''),
	(264, 1104379214, 9, b'0', ''),
	(265, 1104379214, 10, b'0', ''),
	(266, 1104379214, 11, b'0', ''),
	(267, 1104379214, 12, b'0', ''),
	(268, 1104379214, 13, b'0', ''),
	(269, 1104379214, 14, b'0', ''),
	(270, 1104379214, 15, b'1', 'sinusitis'),
	(271, 1104379214, 16, b'0', ''),
	(272, 1104379214, 17, b'0', ''),
	(273, 1104379214, 18, b'1', 'problemas respiratorios'),
	(274, 1104379214, 19, b'1', 'extraccion cordales'),
	(275, 1104379214, 20, b'1', 'cordales'),
	(276, 1104379214, 21, b'1', 'sangrado de ensias'),
	(277, 1104379214, 22, b'1', 'frenos'),
	(278, 1104379214, 23, b'1', 'otras patologias'),
	(279, 1104379214, 24, b'0', ''),
	(280, 1104379214, 25, b'0', ''),
	(281, 1104379214, 26, b'0', ''),
	(282, 1104379214, 27, b'0', ''),
	(283, 1104379214, 28, b'0', ''),
	(284, 1104379214, 29, b'1', 'tratamiento'),
	(285, 1104379214, 30, b'0', ''),
	(286, 1104379214, 31, b'0', ''),
	(287, 1104379214, 32, b'0', ''),
	(288, 1104379214, 33, b'0', ''),
	(289, 1104379214, 34, b'0', ''),
	(290, 1104379214, 35, b'0', ''),
	(291, 1104379214, 36, b'1', 'al masticar'),
	(292, 1104379214, 37, b'1', 'al cerrar'),
	(293, 1104379214, 38, b'0', ''),
	(294, 1104379214, 39, b'0', ''),
	(295, 1104379214, 40, b'0', ''),
	(296, 1104379214, 41, b'0', ''),
	(297, 1104379214, 42, b'0', '');
/*!40000 ALTER TABLE `pacienteantecedentes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacienteprocedures
CREATE TABLE IF NOT EXISTS `pacienteprocedures` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Historia` int(11) NOT NULL,
  `Diente` int(11) DEFAULT NULL,
  `Zone` int(11) NOT NULL,
  `Procedure` int(11) NOT NULL,
  `Tipe` int(11) NOT NULL,
  `Cause` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Paciente_Diente_Zone_Procedure` (`Historia`,`Diente`,`Zone`,`Tipe`),
  KEY `FK_PacienteDiagnosticos_paciente` (`Historia`),
  KEY `FK_PacienteDiagnosticos_dientes` (`Diente`),
  KEY `FK_PacienteDiagnosticos_diagnosticos` (`Procedure`),
  KEY `FK_pacienteprocedures_zones` (`Zone`),
  KEY `FK_pacienteprocedures_tipeitems` (`Tipe`),
  KEY `FK_pacienteprocedures_pacienteprocedures` (`Cause`),
  CONSTRAINT `FK_PacienteDiagnosticos_diagnosticos` FOREIGN KEY (`Procedure`) REFERENCES `items` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_dientes` FOREIGN KEY (`Diente`) REFERENCES `dientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_Historia` FOREIGN KEY (`Historia`) REFERENCES `historias` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_pacienteprocedures` FOREIGN KEY (`Cause`) REFERENCES `pacienteprocedures` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_tipeitems` FOREIGN KEY (`Tipe`) REFERENCES `tipeitems` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_zones` FOREIGN KEY (`Zone`) REFERENCES `zones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.pacienteprocedures: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `pacienteprocedures` DISABLE KEYS */;
INSERT INTO `pacienteprocedures` (`Id`, `Fecha`, `Historia`, `Diente`, `Zone`, `Procedure`, `Tipe`, `Cause`) VALUES
	(121, '2016-08-18 18:00:07', 12, 22, 1, 13, 1, NULL),
	(122, '2016-08-18 18:00:11', 12, 23, 1, 17, 1, NULL),
	(123, '2016-08-18 18:00:13', 12, 20, 1, 19, 1, NULL),
	(126, '2016-08-23 15:39:29', 13, 21, 3, 17, 1, NULL),
	(127, '2016-08-23 15:39:33', 13, 22, 2, 17, 1, NULL),
	(128, '2016-08-23 15:39:36', 13, 22, 6, 17, 1, NULL),
	(129, '2016-08-18 18:00:07', 14, 22, 1, 13, 1, NULL),
	(130, '2016-08-18 18:00:11', 14, 23, 1, 17, 1, NULL),
	(131, '2016-08-18 18:00:13', 14, 20, 1, 19, 1, NULL),
	(132, '2016-08-24 10:18:23', 14, 38, 2, 17, 1, NULL),
	(133, '2016-08-24 10:18:26', 14, 37, 1, 17, 1, NULL),
	(134, '2016-08-24 10:18:28', 14, 36, 7, 17, 1, NULL),
	(136, '2016-08-24 10:18:59', 14, NULL, 11, 3, 1, NULL);
/*!40000 ALTER TABLE `pacienteprocedures` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `Id` bigint(15) NOT NULL,
  `Tipoid` enum('CC','TI','RC','AN') COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` enum('F','M') COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(6) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Celular` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Ocupacion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `EstadoCivil` enum('Soltero','Casado','Separado','Viudo','Union libre') COLLATE utf8_spanish2_ci NOT NULL,
  `Municipio` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Responsable` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `TelResponsable` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  `TipPaciente` int(11) NOT NULL,
  `Ips` int(11) NOT NULL,
  `Eps` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_pacientes_tipopacientes` (`TipPaciente`),
  KEY `FK_pacientes_ips` (`Ips`),
  KEY `FK_pacientes_eps` (`Eps`),
  CONSTRAINT `FK_pacientes_eps` FOREIGN KEY (`Eps`) REFERENCES `eps` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacientes_ips` FOREIGN KEY (`Ips`) REFERENCES `ips` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacientes_tipopacientes` FOREIGN KEY (`TipPaciente`) REFERENCES `tipopacientes` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.pacientes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`Id`, `Tipoid`, `Nombres`, `Apellidos`, `Edad`, `Sexo`, `Telefono`, `Celular`, `Direccion`, `Ocupacion`, `EstadoCivil`, `Municipio`, `FechaNacimiento`, `Responsable`, `TelResponsable`, `Estado`, `TipPaciente`, `Ips`, `Eps`) VALUES
	(789, 'CC', 'pedro', 'perez', 34, 'M', '280536', '31245689', 'sincelejo', 'independiente', 'Soltero', 'Sincelejo', '2000-02-01', NULL, NULL, b'1', 1, 1, 1),
	(1104, 'CC', 'juan', 'perez', 24, 'M', '274563', '300', 'sincelejo', 'independiente', 'Soltero', 'Sincelejo', '2001-07-01', NULL, NULL, b'1', 1, 1, 1),
	(1104379214, 'CC', 'carlos ', 'guzman', 25, 'M', '281654', '31358163', '20 de julio', 'programador', 'Soltero', 'sincelejo', '1991-09-05', '', '', b'1', 1, 1, 1);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.posiciondents
CREATE TABLE IF NOT EXISTS `posiciondents` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_posiciondents_posiciondents` (`Parent`),
  CONSTRAINT `FK_posiciondents_posiciondents` FOREIGN KEY (`Parent`) REFERENCES `posiciondents` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.posiciondents: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `posiciondents` DISABLE KEYS */;
INSERT INTO `posiciondents` (`Id`, `Nombre`, `Descripcion`, `Parent`) VALUES
	(1, 'Rowup', 'Fila superior de dientes', NULL),
	(2, 'Rowdown', 'Fila inferior de dientes', NULL),
	(3, 'Groupupleft', 'Fila superior izquierda de dientes', 1),
	(4, 'Groupupright', 'Fila superior derecha de dientes', 1),
	(5, 'Groupdownleft', 'Fila inferior izquierda de dientes', 2),
	(6, 'Groupdownright', 'Fila inferior derecha de dientes', 2),
	(7, 'Subgroupupleftadult', 'Fila superior izquierda de dientes adultos', 3),
	(8, 'Subgroupupleftchild', 'Fila superior izquierda de dientes niños', 3),
	(9, 'Subgroupuprightadult', 'Fila superior derecha de dientes adultos', 4),
	(10, 'Subgroupuprightchild', 'Fila superior derecha de dientes niños', 4),
	(11, 'Subgroupdownleftadult', 'Fila inferior izquierda de dientes adultos', 5),
	(12, 'Subgroupdownleftchild', 'Fila inferior izquierda de dientes niños', 5),
	(13, 'Subgroupdownrightadult', 'Fila inferior derecha de dientes adultos', 6),
	(14, 'Subgroupdownrightchild', 'Fila inferior derecha de dientes niños', 6);
/*!40000 ALTER TABLE `posiciondents` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.representacion
CREATE TABLE IF NOT EXISTS `representacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.representacion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `representacion` DISABLE KEYS */;
INSERT INTO `representacion` (`id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Color', 'Los items de este tipo seran pintados en una de las zonas del diente'),
	(2, 'Grafico', 'Los items de este tipo se representan con una forma');
/*!40000 ALTER TABLE `representacion` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.tipeitems
CREATE TABLE IF NOT EXISTS `tipeitems` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.tipeitems: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipeitems` DISABLE KEYS */;
INSERT INTO `tipeitems` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Diagnosticos', 'Estos items seran los usados para realizar los diagnosticos de los dientes'),
	(2, 'Tratamientos', 'Estos items seran los usados para los tratamientos de los dientes');
/*!40000 ALTER TABLE `tipeitems` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.tipoantecedentes
CREATE TABLE IF NOT EXISTS `tipoantecedentes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='tabla para agrupar los diferentes items de los antecedentes';

-- Volcando datos para la tabla odontograma1.tipoantecedentes: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoantecedentes` DISABLE KEYS */;
INSERT INTO `tipoantecedentes` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Generales', '--'),
	(2, 'Estomatológico', '--'),
	(3, 'Hallazgos ', '--'),
	(4, 'Otros', '--');
/*!40000 ALTER TABLE `tipoantecedentes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.tipopacientes
CREATE TABLE IF NOT EXISTS `tipopacientes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.tipopacientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipopacientes` DISABLE KEYS */;
INSERT INTO `tipopacientes` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Subsidiado', 'pacientes subsidiados');
/*!40000 ALTER TABLE `tipopacientes` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.ubicaciones
CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ubicacion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Ubicacionup` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ubicaciones_ubicaciones` (`Ubicacionup`),
  CONSTRAINT `FK_ubicaciones_ubicaciones` FOREIGN KEY (`Ubicacionup`) REFERENCES `ubicaciones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.ubicaciones: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` (`Id`, `Ubicacion`, `Ubicacionup`, `Descripcion`) VALUES
	(1, 'Rowup', NULL, 'Fila superior de dientes'),
	(2, 'Rowdown', NULL, 'Fila inferior de dientes'),
	(3, 'Groupleftup', 1, 'Grupo superior izquierdo de dientes'),
	(4, 'Grouprightup', 1, 'Grupo superior derecho de dientes'),
	(5, 'Groupleftdown', 2, 'Grupo inferior izquierdo de dientes'),
	(6, 'Grouprightdown', 2, 'Grupo inferior derecho de dientes'),
	(7, 'Subgroupleftadultup', 3, 'Grupo superior izquierdo de dientes adultos'),
	(8, 'Subgroupleftchildup', 3, 'Grupo superior izquierdo de dientes niños'),
	(9, 'Subgrouprightadultup', 4, 'Grupo superior derecho de dientes adultos'),
	(10, 'Subgrouprightchildup', 4, 'Grupo superior derecho de dientes niños'),
	(11, 'Subgroupleftadultdown', 5, 'Grupo inferior izquierdo de dientes adultos'),
	(12, 'Subgroupleftchilddown', 5, 'Grupo inferrior izquierdo de dientes niños'),
	(13, 'Subgrouprightadultdown', 6, 'Grupo inferior derecho de dientes adultos'),
	(14, 'Subgrouprightchilddown', 6, 'Grupo inferior derecho de dientes niños');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` bigint(15) NOT NULL,
  `Tipoid` enum('CC','TI','RC','AN') COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(3) NOT NULL,
  `Sexo` enum('F','M') COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `Celular` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'1',
  `Tipo` varchar(4) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Admin(1111), Auxiliar(0011)',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`Id`, `Tipoid`, `Nombres`, `Apellidos`, `Edad`, `Sexo`, `Telefono`, `Celular`, `Direccion`, `Usuario`, `Password`, `Estado`, `Tipo`) VALUES
	(92654, 'CC', '92654', 'ana', 30, 'F', '280000', '31284563', 'sincelej', 'ana', 'ana', b'1', '0011');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.zones
CREATE TABLE IF NOT EXISTS `zones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.zones: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Oclusal', 'Es la misma cara que el incisal pero en este caso se refiere puntualmente a los premolares y molares. Se trata de la superficie masticatoria del diente con la que se maceran los alimentos.'),
	(2, 'Vestibular', 'Se trata de la cara de los dientes que dan hacia el lado exterior, o sea, que la cara vestibular de los incisivos centrales superiores es la que vemos cuando alguien se sonríe.'),
	(3, 'Palatina', 'Se trata de la cara de los dientes que mira hacia el paladar, este término se usa para la arcada superior. Salvo en la operatoria dental no se emplea este término, normalmente se emplea el uso lingual'),
	(4, 'Mesial', 'Se trata te la línea media del diente, hacia el centro o hacia una línea imaginaria que divide al ser humano en dos trozos simétricos.'),
	(5, 'Distal', 'Es la cara que se aleja de la línea media. Tanto el término distal como mesial se definen en base a una posición anatómica.'),
	(6, 'Cervical Vestibular I', 'Inferior exterior'),
	(7, 'Cervical Vestibular S', 'Superior esterior'),
	(8, 'Top', 'Se ubica en el contenedor junto con el numero del diente'),
	(9, 'Bot', 'se ubica bajo el diente'),
	(10, 'General', 'Se ubica representa de forma que se sobrepone a todo el diente'),
	(11, 'Nula', 'Se trata de los procedimientos que no tienen una representacion grafica');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
