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

-- Volcando estructura de base de datos para odontograma1
CREATE DATABASE IF NOT EXISTS `odontograma1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `odontograma1`;


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

-- Volcando datos para la tabla odontograma1.dientes: ~51 rows (aproximadamente)
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


-- Volcando estructura para tabla odontograma1.items
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `resource` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Representacion` int(11) NOT NULL,
  `GroupParent` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_items_representaciom` (`Representacion`),
  KEY `FK_items_groupitemsdent` (`GroupParent`),
  CONSTRAINT `FK_items_groupitemsdent` FOREIGN KEY (`GroupParent`) REFERENCES `groupitemsdent` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_items_representaciom` FOREIGN KEY (`Representacion`) REFERENCES `representacion` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.items: ~119 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`Id`, `Codigo`, `Nombre`, `Descripcion`, `resource`, `Representacion`, `GroupParent`) VALUES
	(1, 'K000', 'Anodoncia', '--', NULL, 4, 1),
	(2, 'K001', 'Dientes Supernumerarios', '--', NULL, 4, 1),
	(3, 'K002', 'Anomalias Del Tamaño Y De La Forma Del Diente', '--', NULL, 4, 1),
	(4, 'K003', 'Dientes Moteados', '--', NULL, 4, 1),
	(5, 'K004', 'Alteraciones En La Formacion Dentaria', '--', NULL, 4, 1),
	(6, 'K005', 'Alteraciones Hereditarias De La Estructura Dentaria No Clasificadas En Otra Parte', '--', NULL, 4, 1),
	(7, 'K006', 'Alteraciones En La Erupcion Dentaria', '--', NULL, 4, 1),
	(8, 'K007', 'Sindrome De La Erupcion Dentaria', '--', NULL, 4, 1),
	(9, 'K008', 'Otros Trastornos Del Desarrollo De Los Dientes', '--', NULL, 4, 1),
	(10, 'K009', 'Trastorno Del Desarrollo De Los Dientes No Especificado', '--', NULL, 4, 1),
	(11, 'K010', 'Dientes Incluidos', '--', NULL, 4, 1),
	(12, 'K011', 'Dientes Impactados', '--', NULL, 4, 1),
	(13, 'K020', 'Caries Limitada Al Esmalte', '--', '63B982', 1, 2),
	(14, 'K021', 'Caries De La Dentina', '--', '63B982', 1, 2),
	(15, 'K022', 'Caries Del Cemento', '--', '63B982', 1, 2),
	(16, 'K023', 'Caries Dentaria Detenida', '--', '63B982', 1, 2),
	(17, 'K024', 'Odontoclasia Melanodoncia Infantil Melanodontoclasia', '--', '63B982', 1, 2),
	(18, 'K028', 'Otras Caries Dentales Especificadas', '--', '63B982', 1, 2),
	(19, 'K029', 'Caries Dental No Especificada', '--', '63B982', 1, 2),
	(20, 'K030', 'Atricion Excesiva De Los Dientes', '--', NULL, 4, 3),
	(21, 'K031', 'Abrasion De Los Dientes', '--', NULL, 4, 3),
	(22, 'K032', 'Erosion De Los Dientes', '--', NULL, 4, 3),
	(23, 'K033', 'Reabsorcion Patologica De Los Dientes', '--', NULL, 4, 3),
	(24, 'K034', 'Hipercementosis', '--', NULL, 4, 3),
	(25, 'K035', 'Anquilosis Dental', '--', NULL, 4, 3),
	(26, 'K036', 'Depositos [acreciones] En Los Dientes', '--', NULL, 4, 3),
	(27, 'K037', 'Cambios Posteruptivos Del Color De Los Tejidos Dentales Duros', '--', NULL, 4, 3),
	(28, 'K038', 'Otras Enfermedades Especificadas De Los Tejidos Duros De Los Dientes', '--', NULL, 4, 3),
	(29, 'K039', 'Enfermedad No Especificada De Los Tejidos Dentales Duros', '--', NULL, 4, 3),
	(30, 'K025', 'Fractura De Los Dientes', '--', NULL, 4, 3),
	(31, 'K032', 'Luxacion De Diente', '--', NULL, 4, 3),
	(32, 'K040', 'Pulpitis', '--', NULL, 4, 4),
	(33, 'K041', 'Necrosis De La Pulpa Gangrena De La Pulpa', '--', NULL, 4, 4),
	(34, 'K042', 'Degeneracion De La Pulpa Calcificaciones De La Pulpa Denticulos Piedras De La Pulpa', '--', NULL, 4, 4),
	(35, 'K043', 'Formacion Anormal De Tejido Duro En La Pulpa Dentina Secundaria O Irregular', '--', NULL, 4, 4),
	(36, 'K044', 'Periodontitis Apical Aguda Originada En La Pulpa Periodontitis Apical Aguda Sai', '--', NULL, 4, 4),
	(37, 'K045', 'Periodontitis Apical Cronica Granuloma Apical', '--', NULL, 4, 4),
	(38, 'K046', 'Absceso Periapical Con Fistula', '--', NULL, 4, 4),
	(39, 'K047', 'Absceso Periapical Sin Fistula Dental Dentoalveolar Sin Fistula', '--', NULL, 4, 4),
	(40, 'K048', 'Quiste Radicular', '--', NULL, 4, 4),
	(41, 'K049', 'Otras Enfermedades Y Las No Especificadas De La Pulpa Y Del Tejido Periapical', '--', NULL, 4, 4),
	(42, 'K050', 'Gingivitis Aguda', '--', NULL, 4, 5),
	(43, 'K051', 'Gingivitis Cronica', '--', NULL, 4, 5),
	(44, 'K052', 'Periodontitis Aguda', '--', NULL, 4, 5),
	(45, 'K053', 'Periodontitis Cronica', '--', NULL, 4, 5),
	(46, 'K054', 'Periodontosis Juvenil', '--', NULL, 4, 5),
	(47, 'K055', 'Otras Enfermedades Periodontales', '--', NULL, 4, 5),
	(48, 'K056', 'Enfermedad Del Periodonto No Especificada', '--', NULL, 4, 5),
	(49, 'K060', 'Retraccion Gingival', '--', NULL, 4, 5),
	(50, 'K061', 'Hiperplasia Gingival', '--', NULL, 4, 5),
	(51, 'K062', 'Lesiones De La Encia Y De La Zona Edentula Asociadas Con Traumatismo', '--', NULL, 4, 5),
	(52, 'K068', 'Otros Trastornos Especificados De La Encia Y De La Zona Edentula', '--', NULL, 4, 5),
	(53, 'K069', 'Trastorno No Especificado De La Encia Y De La Zona Edentula', '--', NULL, 4, 5),
	(54, 'K070', 'Anomalias Evidentes Del Tamaño De Los Maxilares', '--', NULL, 4, 6),
	(55, 'K071', 'Anomalias De La Relacion Maxilobasilar', '--', NULL, 4, 6),
	(56, 'K072', 'Anomalias De La Relacion Entre Los Arcos Dentarios', '--', NULL, 4, 6),
	(57, 'K073', 'Anomalias De La Posicion Del Diente', '--', NULL, 4, 6),
	(58, 'K074', 'Maloclusion De Tipo No Especificado', '--', NULL, 4, 6),
	(59, 'K075', 'Anomalias Dentofaciales Funcionales', '--', NULL, 4, 6),
	(60, 'K076', 'Trastornos De La Articulacion Temporomaxilar', '--', NULL, 4, 6),
	(61, 'K078', 'Otras Anomalias Dentofaciales', '--', NULL, 4, 6),
	(62, 'K079', 'Anomalia Dentofacial No Especificada', '--', NULL, 4, 6),
	(63, 'K080', 'Exfoliacion De Los Dientes Debida A Causas Sistemicas', '--', NULL, 4, 7),
	(64, 'K081', 'Perdida De Dientes Debida A Accidente Extraccion O Enfermedad Periodontal Local', '--', NULL, 4, 7),
	(65, 'K082', 'Atrofia Del Reborde Alveolar Desdentado', '--', NULL, 4, 7),
	(66, 'K083', 'Raiz Dental Retenida', '--', NULL, 4, 7),
	(67, 'K088', 'Otras Afecciones Especificadas De Los Dientes Y De Sus Estructuras De Sosten', '--', NULL, 4, 7),
	(68, 'K089', 'Trastorno De Los Dientes Y De Sus Estructuras De Sosten No Especificado', '--', NULL, 4, 7),
	(69, 'K090', 'Quistes Originados Por El Desarrollo De Los Dientes', '--', NULL, 4, 8),
	(70, 'K091', 'Quistes De Las Fisuras (no Odontogenicos)', '--', NULL, 4, 8),
	(71, 'K092', 'Otros Quistes De Los Maxilares', '--', NULL, 4, 8),
	(72, 'K098', 'Otros Quistes De La Region Bucal No Clasificados En Otra Parte', '--', NULL, 4, 8),
	(73, 'K099', 'Quiste De La Region Bucal Sin Otra Especificacion', '--', NULL, 4, 8),
	(74, 'K100', 'Trastornos Del Desarrollo De Los Maxilares', '--', NULL, 4, 9),
	(75, 'K101', 'Granuloma Central De Celulas Gigantes', '--', NULL, 4, 9),
	(76, 'K102', 'Afecciones Inflamatorias De Los Maxilares', '--', NULL, 4, 9),
	(77, 'K103', 'Alveolitis Del Maxilar', '--', NULL, 4, 9),
	(78, 'K108', 'Otras Enfermedades Especificadas De Los Maxilares', '--', NULL, 4, 9),
	(79, 'K109', 'Enfermedad De Los Maxilares No Especificada', '--', NULL, 4, 9),
	(80, 'K110', 'Atrofia De Glandula Salival', '--', NULL, 4, 10),
	(81, 'K111', 'Hipertrofia De Glandula Salival', '--', NULL, 4, 10),
	(82, 'K112', 'Sialadenitis', '--', NULL, 4, 10),
	(83, 'K113', 'Absceso De Glandula Salival', '--', NULL, 4, 10),
	(84, 'K114', 'Fistula De Glandula Salival', '--', NULL, 4, 10),
	(85, 'K115', 'Sialolitiasis', '--', NULL, 4, 10),
	(86, 'K116', 'Mucocele De Glandula Salival', '--', NULL, 4, 10),
	(87, 'K117', 'Alteraciones De La Secrecion Salival', '--', NULL, 4, 10),
	(88, 'K118', 'Otras Enfermedades De Las Glandulas Salivales', '--', NULL, 4, 10),
	(89, 'K119', 'Enfermedad De Glandula Salival No Especificada', '--', NULL, 4, 10),
	(90, 'K120', 'Estomatitis Aftosa Recurrente', '--', NULL, 4, 11),
	(91, 'K121', 'Otras Formas De Estomatitis', '--', NULL, 4, 11),
	(92, 'K122', 'Celulitis Y Abceso De Boca', '--', NULL, 4, 11),
	(93, 'K130', 'Enfermedades De Los Labios', '--', NULL, 4, 11),
	(94, 'K131', 'Mordedura Del Labio Y De La Mejilla', '--', NULL, 4, 11),
	(95, 'K132', 'Leucoplasia Y Otras Alteraciones Del Epitelio Bucal Incluyendo La Lengua', '--', NULL, 4, 11),
	(96, 'K133', 'Leucoplasia Pilosa', '--', NULL, 4, 11),
	(97, 'K134', 'Granuloma Y Lesiones Semejantes De La Mucosa Bucal', '--', NULL, 4, 11),
	(98, 'K135', 'Fibrosis De La Submucosa Bucal', '--', NULL, 4, 11),
	(99, 'K136', 'Hiperplasia Irrritativa De La Mucosa Bucal', '--', NULL, 4, 11),
	(100, 'K137', 'Otras Lesiones Y Las No Especificadas De La Mucosa Bucal', '--', NULL, 4, 11),
	(101, 'K140', 'Glositis', '--', NULL, 4, 12),
	(102, 'K141', 'Lengua Geografica', '--', NULL, 4, 12),
	(103, 'K142', 'Glositis Romboidea Mediana', '--', NULL, 4, 12),
	(104, 'K143', 'Hipertrofia De Las Papilas Linguales', '--', NULL, 4, 12),
	(105, 'K144', 'Atrofia De Las Papilas Linguales', '--', NULL, 4, 12),
	(106, 'K145', 'Lengua Plegada', '--', NULL, 4, 12),
	(107, 'K146', 'Glosodinia', '--', NULL, 4, 12),
	(108, 'K148', 'Otras Enfermedades De La Lengua', '--', NULL, 4, 12),
	(109, 'K149', 'Enfermedad De La Lengua No Especificada', '--', NULL, 4, 12),
	(110, 'GP00', 'Examen Odontologico', '--', NULL, 4, 13),
	(111, 'GP02', 'Superficie Sana', '--', '63B982', 1, 13),
	(112, 'GP03', 'Actividades De Promocion Y Prevencion', '--', NULL, 4, 13),
	(113, 'GP01', 'Diente Ausente', '--', NULL, 4, 14),
	(114, 'GP04', 'Corona En Mal Estado', '--', NULL, 4, 15),
	(115, 'GP05', 'Provisional En Mal Estado', '--', NULL, 4, 15),
	(116, 'GP06', 'Resina Desadaptada', '--', '63B982', 1, 15),
	(117, 'GP07', 'Amlagama Desadaptada', '--', '63B982', 1, 15),
	(118, 'GP08', 'Ionomero Desadaptado', '--', '63B982', 1, 15),
	(119, 'GP09', 'Provisional En Buen Estado', '--', NULL, 4, 15);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacienteprocedures
CREATE TABLE IF NOT EXISTS `pacienteprocedures` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Paciente` bigint(15) NOT NULL,
  `Diente` int(11) NOT NULL,
  `Zone` int(11) DEFAULT NULL,
  `Diagnostico` int(11) NOT NULL,
  `Ubicacion` int(11) NOT NULL,
  `Tipe` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PacienteDiagnosticos_paciente` (`Paciente`),
  KEY `FK_PacienteDiagnosticos_dientes` (`Diente`),
  KEY `FK_PacienteDiagnosticos_diagnosticos` (`Diagnostico`),
  KEY `FK_PacienteDiagnosticos_ubicaciones` (`Ubicacion`),
  KEY `FK_pacienteprocedures_zones` (`Zone`),
  KEY `FK_pacienteprocedures_tipeitems` (`Tipe`),
  CONSTRAINT `FK_PacienteDiagnosticos_diagnosticos` FOREIGN KEY (`Diagnostico`) REFERENCES `items` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_dientes` FOREIGN KEY (`Diente`) REFERENCES `dientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_paciente` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_ubicaciones` FOREIGN KEY (`Ubicacion`) REFERENCES `ubicaciones` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_tipeitems` FOREIGN KEY (`Tipe`) REFERENCES `tipeitems` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_zones` FOREIGN KEY (`Zone`) REFERENCES `zones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.pacienteprocedures: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pacienteprocedures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacienteprocedures` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacientes
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

-- Volcando datos para la tabla odontograma1.pacientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.representacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `representacion` DISABLE KEYS */;
INSERT INTO `representacion` (`id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Color', 'Los items de este tipo seran pintados en una de las zonas del diente'),
	(2, 'General', 'Los items de este tipo son superpuestos en toda la figura del diente'),
	(3, 'Top', 'Estos items se representan junto al numero del diente'),
	(4, 'Bot', 'Estos items son representados en la parte inferior de la figura'),
	(5, 'gosh', 'Estos items no tienen una figura que los representa');
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

-- Volcando datos para la tabla odontograma1.ubicaciones: ~12 rows (aproximadamente)
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


-- Volcando estructura para tabla odontograma1.zones
CREATE TABLE IF NOT EXISTS `zones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.zones: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Oclusal', 'Es la misma cara que el incisal pero en este caso se refiere puntualmente a los premolares y molares. Se trata de la superficie masticatoria del diente con la que se maceran los alimentos.'),
	(2, 'Vestibular', 'Se trata de la cara de los dientes que dan hacia el lado exterior, o sea, que la cara vestibular de los incisivos centrales superiores es la que vemos cuando alguien se sonríe.'),
	(3, 'Palatina', 'Se trata de la cara de los dientes que mira hacia el paladar, este término se usa para la arcada superior. Salvo en la operatoria dental no se emplea este término, normalmente se emplea el uso lingual'),
	(4, 'Mesial', 'Se trata te la línea media del diente, hacia el centro o hacia una línea imaginaria que divide al ser humano en dos trozos simétricos.'),
	(5, 'Distal', 'Es la cara que se aleja de la línea media. Tanto el término distal como mesial se definen en base a una posición anatómica.'),
	(6, 'Cervical Vestibular ', 'Inferior exterior'),
	(7, 'Cervical Vestibular ', 'Superior esterior');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
