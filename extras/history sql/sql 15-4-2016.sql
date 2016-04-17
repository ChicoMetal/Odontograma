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
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.items: ~331 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`Id`, `Codigo`, `Nombre`, `Descripcion`, `resource`, `Representacion`, `GroupParent`) VALUES
	(1, 'K000', 'Anodoncia', '--', NULL, 2, 1),
	(2, 'K001', 'Dientes Supernumerarios', '--', NULL, 2, 1),
	(3, 'K002', 'Anomalias Del Tamaño Y De La Forma Del Diente', '--', NULL, 2, 1),
	(4, 'K003', 'Dientes Moteados', '--', NULL, 2, 1),
	(5, 'K004', 'Alteraciones En La Formacion Dentaria', '--', NULL, 2, 1),
	(6, 'K005', 'Alteraciones Hereditarias De La Estructura Dentaria No Clasificadas En Otra Parte', '--', NULL, 2, 1),
	(7, 'K006', 'Alteraciones En La Erupcion Dentaria', '--', NULL, 2, 1),
	(8, 'K007', 'Sindrome De La Erupcion Dentaria', '--', NULL, 2, 1),
	(9, 'K008', 'Otros Trastornos Del Desarrollo De Los Dientes', '--', NULL, 2, 1),
	(10, 'K009', 'Trastorno Del Desarrollo De Los Dientes No Especificado', '--', NULL, 2, 1),
	(11, 'K010', 'Dientes Incluidos', '--', NULL, 2, 1),
	(12, 'K011', 'Dientes Impactados', '--', NULL, 2, 1),
	(13, 'K020', 'Caries Limitada Al Esmalte', '--', '63B982', 1, 2),
	(14, 'K021', 'Caries De La Dentina', '--', '63B982', 1, 2),
	(15, 'K022', 'Caries Del Cemento', '--', '63B982', 1, 2),
	(16, 'K023', 'Caries Dentaria Detenida', '--', '63B982', 1, 2),
	(17, 'K024', 'Odontoclasia Melanodoncia Infantil Melanodontoclasia', '--', '63B982', 1, 2),
	(18, 'K028', 'Otras Caries Dentales Especificadas', '--', '63B982', 1, 2),
	(19, 'K029', 'Caries Dental No Especificada', '--', '63B982', 1, 2),
	(20, 'K030', 'Atricion Excesiva De Los Dientes', '--', NULL, 2, 3),
	(21, 'K031', 'Abrasion De Los Dientes', '--', NULL, 2, 3),
	(22, 'K032', 'Erosion De Los Dientes', '--', NULL, 2, 3),
	(23, 'K033', 'Reabsorcion Patologica De Los Dientes', '--', NULL, 2, 3),
	(24, 'K034', 'Hipercementosis', '--', NULL, 2, 3),
	(25, 'K035', 'Anquilosis Dental', '--', NULL, 2, 3),
	(26, 'K036', 'Depositos [acreciones] En Los Dientes', '--', NULL, 2, 3),
	(27, 'K037', 'Cambios Posteruptivos Del Color De Los Tejidos Dentales Duros', '--', NULL, 2, 3),
	(28, 'K038', 'Otras Enfermedades Especificadas De Los Tejidos Duros De Los Dientes', '--', NULL, 2, 3),
	(29, 'K039', 'Enfermedad No Especificada De Los Tejidos Dentales Duros', '--', NULL, 2, 3),
	(30, 'K025', 'Fractura De Los Dientes', '--', NULL, 2, 3),
	(31, 'K032', 'Luxacion De Diente', '--', NULL, 2, 3),
	(32, 'K040', 'Pulpitis', '--', NULL, 2, 4),
	(33, 'K041', 'Necrosis De La Pulpa Gangrena De La Pulpa', '--', NULL, 2, 4),
	(34, 'K042', 'Degeneracion De La Pulpa Calcificaciones De La Pulpa Denticulos Piedras De La Pulpa', '--', NULL, 2, 4),
	(35, 'K043', 'Formacion Anormal De Tejido Duro En La Pulpa Dentina Secundaria O Irregular', '--', NULL, 2, 4),
	(36, 'K044', 'Periodontitis Apical Aguda Originada En La Pulpa Periodontitis Apical Aguda Sai', '--', NULL, 2, 4),
	(37, 'K045', 'Periodontitis Apical Cronica Granuloma Apical', '--', NULL, 2, 4),
	(38, 'K046', 'Absceso Periapical Con Fistula', '--', NULL, 2, 4),
	(39, 'K047', 'Absceso Periapical Sin Fistula Dental Dentoalveolar Sin Fistula', '--', NULL, 2, 4),
	(40, 'K048', 'Quiste Radicular', '--', NULL, 2, 4),
	(41, 'K049', 'Otras Enfermedades Y Las No Especificadas De La Pulpa Y Del Tejido Periapical', '--', NULL, 2, 4),
	(42, 'K050', 'Gingivitis Aguda', '--', NULL, 2, 5),
	(43, 'K051', 'Gingivitis Cronica', '--', NULL, 2, 5),
	(44, 'K052', 'Periodontitis Aguda', '--', NULL, 2, 5),
	(45, 'K053', 'Periodontitis Cronica', '--', NULL, 2, 5),
	(46, 'K054', 'Periodontosis Juvenil', '--', NULL, 2, 5),
	(47, 'K055', 'Otras Enfermedades Periodontales', '--', NULL, 2, 5),
	(48, 'K056', 'Enfermedad Del Periodonto No Especificada', '--', NULL, 2, 5),
	(49, 'K060', 'Retraccion Gingival', '--', NULL, 2, 5),
	(50, 'K061', 'Hiperplasia Gingival', '--', NULL, 2, 5),
	(51, 'K062', 'Lesiones De La Encia Y De La Zona Edentula Asociadas Con Traumatismo', '--', NULL, 2, 5),
	(52, 'K068', 'Otros Trastornos Especificados De La Encia Y De La Zona Edentula', '--', NULL, 2, 5),
	(53, 'K069', 'Trastorno No Especificado De La Encia Y De La Zona Edentula', '--', NULL, 2, 5),
	(54, 'K070', 'Anomalias Evidentes Del Tamaño De Los Maxilares', '--', NULL, 2, 6),
	(55, 'K071', 'Anomalias De La Relacion Maxilobasilar', '--', NULL, 2, 6),
	(56, 'K072', 'Anomalias De La Relacion Entre Los Arcos Dentarios', '--', NULL, 2, 6),
	(57, 'K073', 'Anomalias De La Posicion Del Diente', '--', NULL, 2, 6),
	(58, 'K074', 'Maloclusion De Tipo No Especificado', '--', NULL, 2, 6),
	(59, 'K075', 'Anomalias Dentofaciales Funcionales', '--', NULL, 2, 6),
	(60, 'K076', 'Trastornos De La Articulacion Temporomaxilar', '--', NULL, 2, 6),
	(61, 'K078', 'Otras Anomalias Dentofaciales', '--', NULL, 2, 6),
	(62, 'K079', 'Anomalia Dentofacial No Especificada', '--', NULL, 2, 6),
	(63, 'K080', 'Exfoliacion De Los Dientes Debida A Causas Sistemicas', '--', NULL, 2, 7),
	(64, 'K081', 'Perdida De Dientes Debida A Accidente Extraccion O Enfermedad Periodontal Local', '--', NULL, 2, 7),
	(65, 'K082', 'Atrofia Del Reborde Alveolar Desdentado', '--', NULL, 2, 7),
	(66, 'K083', 'Raiz Dental Retenida', '--', NULL, 2, 7),
	(67, 'K088', 'Otras Afecciones Especificadas De Los Dientes Y De Sus Estructuras De Sosten', '--', NULL, 2, 7),
	(68, 'K089', 'Trastorno De Los Dientes Y De Sus Estructuras De Sosten No Especificado', '--', NULL, 2, 7),
	(69, 'K090', 'Quistes Originados Por El Desarrollo De Los Dientes', '--', NULL, 2, 8),
	(70, 'K091', 'Quistes De Las Fisuras (no Odontogenicos)', '--', NULL, 2, 8),
	(71, 'K092', 'Otros Quistes De Los Maxilares', '--', NULL, 2, 8),
	(72, 'K098', 'Otros Quistes De La Region Bucal No Clasificados En Otra Parte', '--', NULL, 2, 8),
	(73, 'K099', 'Quiste De La Region Bucal Sin Otra Especificacion', '--', NULL, 2, 8),
	(74, 'K100', 'Trastornos Del Desarrollo De Los Maxilares', '--', NULL, 2, 9),
	(75, 'K101', 'Granuloma Central De Celulas Gigantes', '--', NULL, 2, 9),
	(76, 'K102', 'Afecciones Inflamatorias De Los Maxilares', '--', NULL, 2, 9),
	(77, 'K103', 'Alveolitis Del Maxilar', '--', NULL, 2, 9),
	(78, 'K108', 'Otras Enfermedades Especificadas De Los Maxilares', '--', NULL, 2, 9),
	(79, 'K109', 'Enfermedad De Los Maxilares No Especificada', '--', NULL, 2, 9),
	(80, 'K110', 'Atrofia De Glandula Salival', '--', NULL, 2, 10),
	(81, 'K111', 'Hipertrofia De Glandula Salival', '--', NULL, 2, 10),
	(82, 'K112', 'Sialadenitis', '--', NULL, 2, 10),
	(83, 'K113', 'Absceso De Glandula Salival', '--', NULL, 2, 10),
	(84, 'K114', 'Fistula De Glandula Salival', '--', NULL, 2, 10),
	(85, 'K115', 'Sialolitiasis', '--', NULL, 2, 10),
	(86, 'K116', 'Mucocele De Glandula Salival', '--', NULL, 2, 10),
	(87, 'K117', 'Alteraciones De La Secrecion Salival', '--', NULL, 2, 10),
	(88, 'K118', 'Otras Enfermedades De Las Glandulas Salivales', '--', NULL, 2, 10),
	(89, 'K119', 'Enfermedad De Glandula Salival No Especificada', '--', NULL, 2, 10),
	(90, 'K120', 'Estomatitis Aftosa Recurrente', '--', NULL, 2, 11),
	(91, 'K121', 'Otras Formas De Estomatitis', '--', NULL, 2, 11),
	(92, 'K122', 'Celulitis Y Abceso De Boca', '--', NULL, 2, 11),
	(93, 'K130', 'Enfermedades De Los Labios', '--', NULL, 2, 11),
	(94, 'K131', 'Mordedura Del Labio Y De La Mejilla', '--', NULL, 2, 11),
	(95, 'K132', 'Leucoplasia Y Otras Alteraciones Del Epitelio Bucal Incluyendo La Lengua', '--', NULL, 2, 11),
	(96, 'K133', 'Leucoplasia Pilosa', '--', NULL, 2, 11),
	(97, 'K134', 'Granuloma Y Lesiones Semejantes De La Mucosa Bucal', '--', NULL, 2, 11),
	(98, 'K135', 'Fibrosis De La Submucosa Bucal', '--', NULL, 2, 11),
	(99, 'K136', 'Hiperplasia Irrritativa De La Mucosa Bucal', '--', NULL, 2, 11),
	(100, 'K137', 'Otras Lesiones Y Las No Especificadas De La Mucosa Bucal', '--', NULL, 2, 11),
	(101, 'K140', 'Glositis', '--', NULL, 2, 12),
	(102, 'K141', 'Lengua Geografica', '--', NULL, 2, 12),
	(103, 'K142', 'Glositis Romboidea Mediana', '--', NULL, 2, 12),
	(104, 'K143', 'Hipertrofia De Las Papilas Linguales', '--', NULL, 2, 12),
	(105, 'K144', 'Atrofia De Las Papilas Linguales', '--', NULL, 2, 12),
	(106, 'K145', 'Lengua Plegada', '--', NULL, 2, 12),
	(107, 'K146', 'Glosodinia', '--', NULL, 2, 12),
	(108, 'K148', 'Otras Enfermedades De La Lengua', '--', NULL, 2, 12),
	(109, 'K149', 'Enfermedad De La Lengua No Especificada', '--', NULL, 2, 12),
	(110, 'GP00', 'Examen Odontologico', '--', NULL, 2, 13),
	(111, 'GP02', 'Superficie Sana', '--', '63B982', 1, 13),
	(112, 'GP03', 'Actividades De Promocion Y Prevencion', '--', NULL, 2, 13),
	(113, 'GP01', 'Diente Ausente', '--', NULL, 2, 14),
	(114, 'GP04', 'Corona En Mal Estado', '--', NULL, 2, 15),
	(115, 'GP05', 'Provisional En Mal Estado', '--', NULL, 2, 15),
	(116, 'GP06', 'Resina Desadaptada', '--', '63B982', 1, 15),
	(117, 'GP07', 'Amlagama Desadaptada', '--', '63B982', 1, 15),
	(118, 'GP08', 'Ionomero Desadaptado', '--', '63B982', 1, 15),
	(119, 'GP09', 'Provisional En Buen Estado', '--', NULL, 2, 15),
	(121, '990203', 'Educacion Individual En Salud, Por Odontologia', '--', NULL, 2, 16),
	(122, '990212', 'Educacion Individual En Salud, Por Higiene Oral', '--', NULL, 2, 16),
	(123, '997101', 'Aplicacion De Sellantes De Autocurado', '--', NULL, 2, 16),
	(124, '997102', 'Aplicacion De Sellantes De Fotocurado', '--', NULL, 2, 16),
	(125, '997103', 'Topicacion De Fluor En Gel', '--', NULL, 2, 16),
	(127, '997104', 'Topicacion De Fluor En Solucion', '--', NULL, 2, 16),
	(128, '997106', 'Topificacion Barniz De Fluor', '--', NULL, 2, 16),
	(129, '997300', 'Detartraje Supragingival Sod +', '--', NULL, 2, 16),
	(130, '997310', 'Control De Placa Dental Ncoc', '--', NULL, 2, 16),
	(131, 'C00015', 'Topificacion De Fluor En Barniz', '--', NULL, 2, 16),
	(132, '870101', 'Radiografia De Cara (perfilograma) +', '--', NULL, 2, 17),
	(133, '870102', 'Radiografia De Orbitas', '--', NULL, 2, 17),
	(134, '870103', 'Radiografia De Agujeros Opticos', '--', NULL, 2, 17),
	(135, '870104', 'Radiografia De Malar', '--', NULL, 2, 17),
	(136, '870105', 'Radiografia De Arco Cigomatico', '--', NULL, 2, 17),
	(137, '870107', 'Radiografia De Huesos Nasales', '--', NULL, 2, 17),
	(138, '870108', 'Radiografia De Senos Paranasales', '--', NULL, 2, 17),
	(139, '870112', 'Radiografia De Maxilar Superior', '--', NULL, 2, 17),
	(140, '870113', 'Radiografia De Maxilar Inferior', '--', NULL, 2, 17),
	(141, '870114', 'Radiografia Panoramica De Maxilares, Superior E Inferior (ortopantomografia)', '--', NULL, 2, 17),
	(142, '870131', 'Radiografia De Articulacion Temporomaxilar (atm)', '--', NULL, 2, 17),
	(143, '870440', 'Radiografias Intraorales Oclusales', '--', NULL, 2, 17),
	(144, '870450', 'Radiografias Intraorales Periapicales Milimetradas', '--', NULL, 2, 17),
	(145, '870451', 'Radiografias Intraorales Periapicales Dientes Anteriores Superiores', '--', NULL, 2, 17),
	(146, '870452', 'Radiografias Intraorales Periapicales Dientes Anteriores Inferiores', '--', NULL, 2, 17),
	(147, '870453', 'Radiografias Intraorales Periapicales Zona De Caninos', '--', NULL, 2, 17),
	(148, '870454', 'Radiografias Intraorales Periapicales Premolares', '--', NULL, 2, 17),
	(149, '870455', 'Radiografias Intraorales Periapicales Molares', '--', NULL, 2, 17),
	(150, '870456', 'Radiografias Intraorales Periapicales Juego Completo', '--', NULL, 2, 17),
	(151, '870460', 'Radiografias Intraorales Coronales', '--', NULL, 2, 17),
	(152, '230100', 'Exodoncia De Dientes Permanentes Sod', '--', NULL, 2, 18),
	(153, '230101', 'Exodoncia De Diente Permanente Unirradicular +', '--', NULL, 2, 17),
	(154, '230102', 'Exodoncia De Diente Permanente Multirradicular +', '--', NULL, 2, 18),
	(155, '230200', 'Exodoncia De Dientes Temporales Sod', '--', NULL, 2, 18),
	(156, '230201', 'Exodoncia De Diente Temporal Unirradicular +', '--', NULL, 2, 18),
	(157, '230202', 'Exodoncia De Diente Temporal Multirradicular +', '--', NULL, 2, 18),
	(158, '231100', 'Exodoncia Quirurgica Unirradicular Sod', '--', NULL, 2, 18),
	(159, '231200', 'Exodoncia Quirurgica Multirradicular Sod', '--', NULL, 2, 18),
	(160, '231300', 'Exodoncia De Diente Incluido Sod +', '--', NULL, 2, 18),
	(161, '231301', 'Exodoncia De Incluido En Posicion Ectopica Con Abordaje Intraoral +', '--', NULL, 2, 18),
	(162, '231302', 'Exodoncia De Incluido En Posicion Ectopica Con Abordaje Extraoral +', '--', NULL, 2, 18),
	(163, '231400', 'Exodoncias Multiples Con Alveoloplastia, Por Cuadrante Sod', '--', NULL, 2, 18),
	(164, '231500', 'Colgajo Desplazado Para Abordaje De Diente Retenido (ventana Quirurgica) Sod', '--', NULL, 2, 18),
	(165, '237502', 'Procedimientos Correctivos En Fracturas Radiculares', '--', NULL, 2, 18),
	(166, '237600', 'Fistulizacion Endodontica Sod', '--', NULL, 2, 18),
	(167, '237601', 'Fistulizacion Endodontica Por Trepanacion Y Drenaje +', '--', NULL, 2, 18),
	(168, '237602', 'Fistulizacion Endodontica Por Incision +', '--', NULL, 2, 18),
	(169, '237700', 'Radectomia (amputacion Radicular) Sod', '--', NULL, 2, 18),
	(170, '237701', 'Radectomia (amputacion Radicular) Unica', '--', NULL, 2, 18),
	(171, '237702', 'Radectomia (amputacion Radicular) Multiple', '--', NULL, 2, 18),
	(172, '237800', 'Hemiseccion Del Diente Sod', '--', NULL, 2, 18),
	(173, '242202', 'Cirugia A Colgajo Con Reseccion Radicular (amputacion, Hemiseccion)', '--', NULL, 2, 18),
	(174, '245200', 'Alveolectomia Sod +', '--', NULL, 2, 18),
	(175, '249100', 'Control De Hemorragia Dental Pos Quirurgica Sod +', '--', NULL, 2, 18),
	(176, '270100', 'Incision Y Drenaje En Cavidad Bucal Sod', '--', NULL, 2, 18),
	(177, '270101', 'Incision Y Drenaje Intraoral En Cavidad Bucal', '--', NULL, 2, 18),
	(178, '270102', 'Incision Y Drenaje Extraoral En Cavidad Bucal', '--', NULL, 2, 18),
	(179, '271100', 'Drenaje De Coleccion De Paladar Sod', '--', NULL, 2, 18),
	(180, '274100', 'Frenillectomia Labial Sod +', '--', NULL, 2, 18),
	(182, '232101', 'Obturacion Dental Con Amalgama +', '--', '63B982', 1, 19),
	(183, '232102', 'Obturacion Dental Con Resina De Fotocurado +', '--', '63B982', 1, 19),
	(184, '232103', 'Obturacion Dental Con Ionomero De Vidrio +', '--', '63B982', 1, 19),
	(185, '232200', 'Obturacion Temporal Por Diente Sod', '--', NULL, 2, 19),
	(186, '232401', 'Reconstruccion De Angulo Incisal, Con Resina De Fotocurado', '--', NULL, 2, 19),
	(187, '232402', 'Reconstruccion Tercio Incisal, Con Resina De Fotocurado', '--', NULL, 2, 19),
	(188, '237901', 'Blanqueamiento De Diente [intrinseco] Por Causas Endo-donticas +', '--', NULL, 2, 19),
	(189, '248100', 'Cierre De Diastema (alveolar, Dental) Sod', '--', NULL, 2, 19),
	(190, '997105', 'Aplicacion De Resina Preventiva', '--', '63B982', 1, 19),
	(191, '235200', 'Trasplante De Diente (intencional) Sod', '--', NULL, 2, 20),
	(192, '237100', 'Pulpotomia Sod +', '--', NULL, 2, 20),
	(193, '237101', 'Pulpotomia Con Pulpectomia +', '--', NULL, 2, 20),
	(194, '237200', 'Apexificacion (induccion De Apexogenesis) Sod +', '--', NULL, 2, 20),
	(195, '237300', 'Terapia De Conducto Radicular Sod', '--', NULL, 2, 20),
	(196, '237301', 'Terapia De Conducto Radicular En Diente Unirradicular +', '--', NULL, 2, 20),
	(197, '237302', 'Terap Ia De Conducto Radicular En Diente Birradicular +', '--', NULL, 2, 20),
	(198, '237303', 'Terapia De Conducto Radicular En Diente Multirradicular +', '--', NULL, 2, 20),
	(199, '237304', 'Terapia De Conducto Radicular En Diente Temporal Unirra-dicular +', '--', NULL, 2, 20),
	(200, '237305', 'Terapia De Conducto Radicular En Diente Temporal Multi-rradicular +', '--', NULL, 2, 20),
	(201, '237501', 'Procedimiento Correctivo En Resorcion Radicular (interna Y Externa)', '--', NULL, 2, 20),
	(202, '232300', 'Colocacion De Pin Milimetrico Sod', '--', NULL, 2, 21),
	(203, '233100', 'Restauracion De Dientes Mediante Incrustacion Metalica Sod', '--', NULL, 2, 21),
	(204, '233200', 'Restauracion De Dientes Mediante Incrustacion No Metalica Sod', '--', NULL, 2, 21),
	(205, '234100', 'Colocacion O Aplicacion De Corona Sod', '--', NULL, 2, 21),
	(206, '234201', 'Colocacion O Aplicacion De Corona En Acero Inoxidable (para Dientes Temporales)', '--', NULL, 2, 21),
	(207, '234102', 'Colocacion O Aplicacion De Corona En Policarboxilato (para Dientes Temporales)', '--', NULL, 2, 21),
	(208, '234103', 'Colocacion O Aplicacion De Corona En Forma Plastica', '--', NULL, 2, 21),
	(209, '234104', 'Colocacion O Aplicacion De Corona Acrilica Termocurada', '--', NULL, 2, 21),
	(210, '234201', 'Colocacion O Insercion De Protesis Fija Cada Unidad (pilar Y Ponticos)', '--', NULL, 2, 21),
	(211, '234201*', 'Colocacion O Insercion De Protesis Fija Cada Unidad (ponticos)', '--', NULL, 2, 21),
	(212, '234202', 'Reconstruccion De Muñones', '--', NULL, 2, 21),
	(213, '234203', 'Patron De Nucleo', '--', NULL, 2, 21),
	(214, '234204', 'Re Paracion De Protesis Fija', '--', NULL, 2, 21),
	(215, '234301', 'Colocacion O Insercion De Protesis Removible (superior O Inferior) Mucosoportada', '--', NULL, 2, 21),
	(216, '234202', 'Colocacion O Insercion De Protesis Removible (superior O Inferior) Dentomucosoportada', '--', NULL, 2, 21),
	(217, '234303', 'Reparacion De Protesis Removible', '--', NULL, 2, 21),
	(218, '234401', 'Colocacion O Insercion De Protesis Total Medio Caso (superior O Inferior)', '--', NULL, 2, 21),
	(219, '234402', 'Colocacion O Insercion De Protesis Total (superior E Inferior)', '--', NULL, 2, 21),
	(220, '248200', 'Ajustamiento Oclusal Sod', '--', NULL, 2, 21),
	(221, '248400', 'Reparacion De Aparatologia Fija O Removible Sod', '--', NULL, 2, 21),
	(222, '235100', 'Reimplante De Diente Sod', '--', NULL, 2, 22),
	(223, '236100', 'Implante Aloplastico Ceramico Sod', '--', NULL, 2, 22),
	(224, '236200', 'Implante Aloplastico Metalico Sod', '--', NULL, 2, 22),
	(225, '236300', 'Implante Dental Aloplastico (oseointegracion) Sod', '--', NULL, 2, 22),
	(226, '237401', 'Curetaje Apical Con Apicectomia Y Obturacion Retrogada [cirugia Perirradicular]', '--', NULL, 2, 22),
	(227, '240200', 'Detartraje Subgingival Sod +', '--', NULL, 2, 22),
	(228, '240300', 'Alisado Radicular, Campo Cerrado Sod +', '--', NULL, 2, 22),
	(229, '240400', 'Drenaje De Coleccion Periodontal (cerrado Con Alisado Radicular) Sod+', '--', NULL, 2, 22),
	(230, '242100', 'Plastia Mucogingival Sod', '--', NULL, 2, 22),
	(231, '242101', 'Plastia Mucogingival Con Injertos Pediculados (colgajos Pediculados)', '--', NULL, 2, 22),
	(232, '242102', 'Plastia Mucogingival Con Injerto Gingival Libre +', '--', NULL, 2, 22),
	(233, '242201', 'Curetaje A Campo Abierto +', '--', NULL, 2, 22),
	(234, '242300', 'Plastias Preprotesicas (aumento De Corona Clinica) Sod', '--', NULL, 2, 22),
	(235, '242400', 'Reparacion O Plastia Periodontal Regenerativa (injertos, Membranas) Sod', '--', NULL, 2, 22),
	(236, '243400', 'Gingivectomia Sod', '--', NULL, 2, 22),
	(237, '243500', 'Operculectomia Ncoc +', '--', NULL, 2, 22),
	(238, '245100', 'Regularizacion De Rebordes Sod +', '--', NULL, 2, 22),
	(239, '247100', 'Colocacion De Aparatologia Fija Para Ortodoncia (arcada) Sod', '--', NULL, 2, 23),
	(240, '247201', 'Colocacion De Aparatologia Removible Intraoral Para Ortodoncia (arcada)', '--', NULL, 2, 23),
	(241, '247202', 'Colocacion De Aparatologia Removible Extraoral Para Ortodoncia (arcada)', '--', NULL, 2, 23),
	(242, '247300', 'Colocacion De Aparatos De Retencion Sod', '--', NULL, 2, 23),
	(243, '241100', 'Biopsia De Encia Sod', '--', NULL, 2, 24),
	(244, '241101', 'Biopsia Incisional De Encia', '--', NULL, 2, 24),
	(245, '241102', 'Biopsia Escisional De Encia Con Cierre Primario', '--', NULL, 2, 24),
	(246, '241103', 'Biopsia Escisional De Encia Y Recubrimiento Con Colgajo O Injerto', '--', NULL, 2, 24),
	(247, '241200', 'Biopsia De Pared Alveolar Sod +', '--', NULL, 2, 24),
	(248, '272101', 'Biopsia De Uvula', '--', NULL, 2, 24),
	(249, '272102', 'Biopsia Incisional De Paladar', '--', NULL, 2, 24),
	(250, '272103', 'Biopsia Escisional De Paladar', '--', NULL, 2, 24),
	(251, '272300', 'Biopsia De Labio Sod', '--', NULL, 2, 24),
	(252, '272301', 'Biopsia Incisional De Labio', '--', NULL, 2, 24),
	(253, '272302', 'Biopsia Escisional De Labio', '--', NULL, 2, 24),
	(254, '272400', 'Biopsia De Pared De Cavidad Bucal Sod +', '--', NULL, 2, 24),
	(255, '272401', 'Biopsia Por Aspiracion Con Aguja Fina En Cavidad Oral', '--', NULL, 2, 24),
	(256, '273100', 'Escision Local De Lesion En Paladar Oseo Sod', '--', NULL, 2, 25),
	(257, '273101', 'Escision De Lesion Superficial De Paladar', '--', NULL, 2, 25),
	(258, '273102', 'Reseccion Local Del Paladar Por Cauterizacion O Crio-', '--', NULL, 2, 25),
	(259, '273103', 'Reseccion Local Del Paladar Por Quimioterapia', '--', NULL, 2, 25),
	(260, '273200', 'Escision Amplia De Lesion En Paladar Oseo Sod', '--', NULL, 2, 25),
	(261, '273201', 'Escision De Lesion Profunda De Paladar', '--', NULL, 2, 25),
	(262, '273202', 'Reseccion En Bloque De Apofisis Alveolar Y Paladar', '--', NULL, 2, 25),
	(263, '273203', 'Palatectomia Parcial Ncoc +', '--', NULL, 2, 25),
	(264, '273204', 'Palatectomia Total', '--', NULL, 2, 25),
	(265, '276100', 'Sutura De Laceracion De Paladar Sod', '--', NULL, 2, 25),
	(266, '276101', 'Palatorrafia En Z (furlow)', '--', NULL, 2, 25),
	(267, '276200', 'Correccion De Paladar Fisurado (estafilorrafia) Sod', '--', NULL, 2, 25),
	(268, '276201', 'Correccion De Hendidura Alveolopalatina', '--', NULL, 2, 25),
	(269, '276202', 'Cierre De Hendidura Alveolar Con Injerto', '--', NULL, 2, 25),
	(270, '276203', 'Cierre De Hendidura Alveolar Sin Injerto', '--', NULL, 2, 25),
	(271, '276204', 'Reconstruccion De Boveda Palatina Mediante Colgajos Pediculados', '--', NULL, 2, 25),
	(272, '276205', 'Correccion De Fisura Palatina, Con Colgajo Vomeriano', '--', NULL, 2, 25),
	(273, '276206', 'Injerto Oseo De Paladar', '--', NULL, 2, 25),
	(274, '276207', 'Uvulo-palato-faringoplastia', '--', NULL, 2, 25),
	(275, '276208', 'Uvulo-palato-faringoplastia Con Laser', '--', NULL, 2, 25),
	(276, '276300', 'Revision De Reparacion De Paladar Fisurado Sod +', '--', NULL, 2, 25),
	(277, '277100', 'Incision De Uvula Sod +', '--', NULL, 2, 25),
	(278, '277201', 'Reseccion Parcial De Uvula', '--', NULL, 2, 25),
	(279, '277301', 'Uvulorrafia', '--', NULL, 2, 25),
	(280, '278200', 'Incision De Cavidad Bucal, Estructura No Especificada Sod', '--', NULL, 2, 25),
	(281, '278301', 'Cierre Velofaringeo Con Colgajo Faringeo', '--', NULL, 2, 25),
	(282, '278400', 'Correccion De Macro O Microstoma Sod +', '--', NULL, 2, 25),
	(283, '274200', 'Escision De Lesion De Labio Sod', '--', NULL, 2, 26),
	(284, '274201', 'Reseccion Parcial De Labio Por Tumor Maligno +', '--', NULL, 2, 26),
	(285, '274202', 'Reseccion Parcial De Labio Por Tumor Maligno, Con Rotacion De Colgajo', '--', NULL, 2, 26),
	(286, '274203', 'Reseccion Total De Labio Por Tumor Maligno', '--', NULL, 2, 26),
	(287, '274400', 'Reseccion De Fosetas Labiales Sod +', '--', NULL, 2, 26),
	(288, '275100', 'Sutura De Laceracion En Labios Sod', '--', NULL, 2, 26),
	(289, '275101', 'Sutura O Reparacion De Laceracion (herida) En Labios Hasta De Cinco Centimetros +', '--', NULL, 2, 26),
	(290, '275102', 'Sutura O Reparacion De Laceracion (herida) En Labios De Mas De Cinco Centimetros +', '--', NULL, 2, 26),
	(291, '275400', 'Reparacion De Labio Fisurado [queiloplastia] Sod', '--', NULL, 2, 26),
	(292, '275401', 'Correccion Parcial De Labio Fisurado Por Adhesion', '--', NULL, 2, 26),
	(293, '275402', 'Correccion Primaria De Labio Fisurado Unilateral', '--', NULL, 2, 26),
	(294, '275403', 'Correccion Secundaria De Labio Fisurado Unilateral', '--', NULL, 2, 26),
	(295, '275404', 'Correccion De Labio Fisurado Bilateral Ncoc +', '--', NULL, 2, 26),
	(296, '243200', 'Sutura De Laceracion De Encia Sod', '--', NULL, 2, 27),
	(297, '243201', 'Sutura De Laceracion De Encia, Menor De Tres Centimetros', '--', NULL, 2, 27),
	(298, '243202', 'Sutura De Laceracion De Encia, Mayor De Tres Centimetros', '--', NULL, 2, 27),
	(299, '274300', 'Escision De Lesion En Mucosa Oral Sod', '--', NULL, 2, 27),
	(300, '274301', 'Reseccion De Lesion Benigna De La Mucosa Oral, Hasta De Dos Centimetros De Diametro', '--', NULL, 2, 27),
	(301, '274302', 'Reseccion De Lesion Benigna De La Mucosa Oral, Mayor De Dos Centimetros De Diametro', '--', NULL, 2, 27),
	(302, '274303', 'Reseccion De Tumor Maligno De Mucosa Oral +', '--', NULL, 2, 27),
	(303, '274304', 'Reseccion De Tumor Maligno De Mucosa Oral, Con Colgajo Local O A Distancia', '--', NULL, 2, 27),
	(304, '274901', 'Remocion De Cuerpo Extraño En Tejidos Blandos De La Boca', '--', NULL, 2, 27),
	(305, '274902', 'Reseccion De Bridas Intraorales', '--', NULL, 2, 27),
	(306, '275103', 'Sutura Y/o Plastia En Avulsion De Labios', '--', NULL, 2, 27),
	(307, '275200', 'Sutura De Laceracion De Otra Parte De La Boca Sod', '--', NULL, 2, 27),
	(308, '275201', 'Estomatorrafia (sutura De Herida En Mucosa Oral) De Menos De Cinco Centimetros', '--', NULL, 2, 27),
	(309, '275202', 'Estomatorrafia (sutura De Herida En Mucosa Oral) De Masde Cinco Centimetros', '--', NULL, 2, 27),
	(310, '243100', 'Escision De Lesion De Encia Sod', '--', NULL, 2, 28),
	(311, '243101', 'Escision De Lesion Benigna Encapsulada En Encia Hasta De Tres Centimetros', '--', NULL, 2, 28),
	(312, '243102', 'Escision De Lesion Benigna Encapsulada En Encia De Mas De Tres Centimetros', '--', NULL, 2, 28),
	(313, '243103', 'Escision De Lesion Benigna No Encapsulada En Encia Hasta De Tres Centimetros', '--', NULL, 2, 28),
	(314, '243104', 'Escision De Lesion Benigna No Encapsulada En Encia De Mas De Tres Cen', '--', NULL, 2, 28),
	(315, '243105', 'Escision De Lesion Maligna De Encia Sin Vaciamiento Ganglionar Ni Reseccion De Estructuras Vecinas U', '--', NULL, 2, 28),
	(316, '243106', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Piso De Boca Y/o Lengua Con Cierre P', '--', NULL, 2, 28),
	(317, '243107', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Piso De Boca Y/o Lengua Y Reconstruc', '--', NULL, 2, 28),
	(318, '243108', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Reseccion Osea Y Reconstruccion Con ', '--', NULL, 2, 28),
	(319, '243109', 'Escision De Lesion Maligna De Encia Con Vaciamiento Ganglionar, Reseccion Osea Y Reconstruccion Con ', '--', NULL, 2, 28),
	(320, '243300', 'Enucleacion De Quiste Epidermoide Sod', '--', NULL, 2, 28),
	(321, '243301', 'Enucleacion De Quiste Epidermoide, Via Intraoral', '--', NULL, 2, 28),
	(322, '243302', 'Enucleacion De Quiste Epidermoide, Via Extraoral', '--', NULL, 2, 28),
	(323, '244100', 'Escision De Lesion Odontogenica Sod', '--', NULL, 2, 28),
	(324, '244101', 'Enucleacion De Quiste Odontogenico Hasta De Tres Centimetros De Diametro+', '--', NULL, 2, 28),
	(325, '244102', 'Enucleacion De Quiste Odontogenico De Mas De Tres Centimetros De Diametro', '--', NULL, 2, 28),
	(326, '244108', 'Marsupializacion De Quiste Odontogenico +', '--', NULL, 2, 28),
	(327, '244103', 'Reseccion De Tumor Benigno O Maligno Odontogenico', '--', NULL, 2, 29),
	(328, '244104', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Inmediata Con Injerto Oseo Libre', '--', NULL, 2, 29),
	(329, '244105', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Colgajo Oseo Pediculado', '--', NULL, 2, 29),
	(330, '244106', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Colgajo Oseo Libre', '--', NULL, 2, 29),
	(331, '244107', 'Reseccion De Tumor Benigno O Maligno Odontogenico Y Reconstruccion Con Placa', '--', NULL, 2, 29),
	(332, '237902', 'Exploracion Y Movilizacion De Nervio Dentario Inferior', '--', NULL, 2, 30),
	(333, '242204', 'Aumento De Reborde Parcialmente Edentulo (sin Material)', '--', NULL, 2, 30),
	(334, '242205', 'Aumento De Reborde Parcialmente Edentulo (con Material)', '--', NULL, 2, 30),
	(335, '247400', 'Ferulizacion Sod', '--', NULL, 2, 30),
	(336, '247401', 'Ferulizacion Rigida (superior Y/o Inferior)', '--', NULL, 2, 30),
	(337, '247402', 'Ferulizacion Semirrigida (superior Y/o Inferior)', '--', NULL, 2, 30),
	(338, '275301', 'Reseccion Intraoral De Fistula De Boca', '--', NULL, 2, 30),
	(339, '275302', 'Reseccion Extraoral De Fistula De Boca', '--', NULL, 2, 30),
	(340, '275303', 'Cierre De Fistula Orosinusal U Oronasal, Con Colgajo Palatino, Lingual O Bucal', '--', NULL, 2, 30),
	(341, '275304', 'Cierre De Fistula Orosinusal Con Sinusotomia, Con O Sin Remocion De Cuerpo Extraño O Colgajo Palatin', '--', NULL, 2, 30),
	(342, '275305', 'Alargamiento De Paladar Con Colgajo En Isla', '--', NULL, 2, 30),
	(343, '275500', 'Injerto De Piel De Grosor Total Aplicado Al Labio Y Cavidad Bucal Sod', '--', NULL, 2, 30),
	(344, '275601', 'Lipoinjerto En Cara', '--', NULL, 2, 30),
	(345, '275701', 'Injerto De Piel En Labios Con Adhesion De Colgajo Pediculado', '--', NULL, 2, 30),
	(346, '275800', 'Profundizacion De Piso De Boca Sod', '--', NULL, 2, 30),
	(347, '275801', 'Profundizacion O Descenso De Piso De Boca Con Desinsercion De Milohiodeo Y/o Genihiodeo', '--', NULL, 2, 30),
	(348, '275900', 'Profundizacion De Surco Vestibular Sod', '--', NULL, 2, 30),
	(349, '275901', 'Profundizacion De Surco Vestibular Con Injerto Mucoso', '--', NULL, 2, 30),
	(350, '275902', 'Profundizacion De Surco Vestibular Con Injerto Cutaneo', '--', NULL, 2, 30);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


-- Volcando estructura para tabla odontograma1.pacienteprocedures
CREATE TABLE IF NOT EXISTS `pacienteprocedures` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Paciente` bigint(15) NOT NULL,
  `Diente` int(11) NOT NULL,
  `Zone` int(11) DEFAULT NULL,
  `Procedure` int(11) NOT NULL,
  `Tipe` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PacienteDiagnosticos_paciente` (`Paciente`),
  KEY `FK_PacienteDiagnosticos_dientes` (`Diente`),
  KEY `FK_PacienteDiagnosticos_diagnosticos` (`Procedure`),
  KEY `FK_pacienteprocedures_zones` (`Zone`),
  KEY `FK_pacienteprocedures_tipeitems` (`Tipe`),
  CONSTRAINT `FK_PacienteDiagnosticos_diagnosticos` FOREIGN KEY (`Procedure`) REFERENCES `items` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_dientes` FOREIGN KEY (`Diente`) REFERENCES `dientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PacienteDiagnosticos_paciente` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_tipeitems` FOREIGN KEY (`Tipe`) REFERENCES `tipeitems` (`Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pacienteprocedures_zones` FOREIGN KEY (`Zone`) REFERENCES `zones` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.pacienteprocedures: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `pacienteprocedures` DISABLE KEYS */;
INSERT INTO `pacienteprocedures` (`Id`, `Fecha`, `Paciente`, `Diente`, `Zone`, `Procedure`, `Tipe`) VALUES
	(1, '2015-12-22 10:35:21', 1104, 51, 9, 1, 1),
	(2, '2015-12-22 12:06:51', 1104, 35, 8, 110, 1),
	(3, '2015-12-22 12:07:42', 1104, 51, 9, 110, 2),
	(4, '2015-12-23 12:40:11', 1104, 51, 1, 111, 1),
	(5, '2015-12-23 12:41:18', 1104, 53, 6, 111, 1),
	(6, '2016-04-14 23:19:06', 1104, 14, 8, 110, 1),
	(7, '2016-04-14 23:49:11', 1104, 11, 8, 1, 1),
	(8, '2016-04-15 19:33:00', 1104, 3, 8, 1, 1),
	(9, '2016-04-15 19:35:07', 1104, 5, 8, 2, 1),
	(10, '2016-04-15 19:41:49', 1104, 7, 8, 3, 1);
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

-- Volcando datos para la tabla odontograma1.pacientes: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`Id`, `Tipoid`, `Nombres`, `Apellidos`, `Edad`, `Sexo`, `Telefono`, `Celular`, `Direccion`) VALUES
	(1104, 'CC', 'carlos', 'guzman', 24, 'M', '300', '300', 'sincelejo');
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

-- Volcando datos para la tabla odontograma1.representacion: ~3 rows (aproximadamente)
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


-- Volcando estructura para tabla odontograma1.zones
CREATE TABLE IF NOT EXISTS `zones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla odontograma1.zones: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`Id`, `Nombre`, `Descripcion`) VALUES
	(1, 'Oclusal', 'Es la misma cara que el incisal pero en este caso se refiere puntualmente a los premolares y molares. Se trata de la superficie masticatoria del diente con la que se maceran los alimentos.'),
	(2, 'Vestibular', 'Se trata de la cara de los dientes que dan hacia el lado exterior, o sea, que la cara vestibular de los incisivos centrales superiores es la que vemos cuando alguien se sonríe.'),
	(3, 'Palatina', 'Se trata de la cara de los dientes que mira hacia el paladar, este término se usa para la arcada superior. Salvo en la operatoria dental no se emplea este término, normalmente se emplea el uso lingual'),
	(4, 'Mesial', 'Se trata te la línea media del diente, hacia el centro o hacia una línea imaginaria que divide al ser humano en dos trozos simétricos.'),
	(5, 'Distal', 'Es la cara que se aleja de la línea media. Tanto el término distal como mesial se definen en base a una posición anatómica.'),
	(6, 'Cervical Vestibular ', 'Inferior exterior'),
	(7, 'Cervical Vestibular ', 'Superior esterior'),
	(8, 'Top', 'Se ubica en el contenedor junto con el numero del diente'),
	(9, 'Bot', 'se ubica bajo el diente');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;