CREATE DATABASE  IF NOT EXISTS `sistema_prestamo_2024_05_01_security` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_prestamo_2024_05_01_security`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_prestamo_2024_05_01_security
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo` (
  `idCatalogo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idCatalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
INSERT INTO `catalogo` VALUES (1,'Tipo de Endidad Bancaria'),(2,'Tipo de Moneda'),(3,'Días de Préstamo'),(4,'Estado Solictud de Préstamo'),(10,'Jorge Jacinto GRUPO X'),(11,'Jorge Jacinto GRUPO X'),(13,'Jorge Jacinto GRUPO X'),(14,'Jorge Jacinto GRUPO X');
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordenada`
--

DROP TABLE IF EXISTS `coordenada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordenada` (
  `idCoordenada` int NOT NULL AUTO_INCREMENT,
  `latitud` decimal(10,5) NOT NULL,
  `longitud` decimal(10,5) NOT NULL,
  `idPrestatario` int NOT NULL,
  `ubigeo` int NOT NULL,
  `estado` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualizacion` int NOT NULL,
  PRIMARY KEY (`idCoordenada`),
  UNIQUE KEY `idPrestatario_UNIQUE` (`idPrestatario`),
  KEY `fk_prestatario_idx` (`idPrestatario`),
  KEY `fk_ubigeo_idx` (`ubigeo`),
  KEY `fk_coor_usu_registro_idx` (`idUsuarioRegistro`),
  KEY `fk_coor_usu_act_idx` (`idUsuarioActualizacion`),
  CONSTRAINT `fk_coor_usu_act` FOREIGN KEY (`idUsuarioActualizacion`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_coor_usu_registro` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_prestatario` FOREIGN KEY (`idPrestatario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_ubigeo` FOREIGN KEY (`ubigeo`) REFERENCES `ubigeo` (`idUbigeo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordenada`
--

LOCK TABLES `coordenada` WRITE;
/*!40000 ALTER TABLE `coordenada` DISABLE KEYS */;
INSERT INTO `coordenada` VALUES (8,11.00000,22111.00000,6,3113,1,'2024-06-30 05:26:36','2024-07-01 10:12:23',1,1),(9,1.00000,2.00000,7,96221,1,'2024-06-30 18:03:00','2024-06-30 18:03:00',1,1);
/*!40000 ALTER TABLE `coordenada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `idCuenta` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `idEntidadFinanciera` int NOT NULL,
  `idTipoMoneda` int NOT NULL,
  `estado` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualizacion` int NOT NULL,
  PRIMARY KEY (`idCuenta`),
  UNIQUE KEY `numero_UNIQUE` (`numero`),
  KEY `fk_cuenta_usu_registra_idx` (`idUsuarioRegistro`),
  KEY `fk_cuenta_usu_act_idx` (`idUsuarioActualizacion`),
  KEY `fk_tipo_entida_finac_idx` (`idEntidadFinanciera`),
  KEY `fk_tipo_moneda_idx` (`idTipoMoneda`),
  CONSTRAINT `fk_cuenta_usu_act` FOREIGN KEY (`idUsuarioActualizacion`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_cuenta_usu_registra` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_tipo_entida_finac` FOREIGN KEY (`idEntidadFinanciera`) REFERENCES `entidad_financiera` (`idEntidadFinanciera`),
  CONSTRAINT `fk_tipo_moneda` FOREIGN KEY (`idTipoMoneda`) REFERENCES `data_catalogo` (`idDataCatalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'01841214587415874174',3,5,1,'2022-04-03 22:59:07','2024-06-30 16:01:43',1,1),(2,'01841214748585747596',2,5,0,'2022-04-03 22:59:07','2024-06-30 16:01:46',1,1),(24,'01841214748585747111',2,5,1,'2024-06-24 20:50:05','2024-06-24 20:50:05',1,1),(26,'01841214748585747666',1,6,0,'2024-06-24 20:51:36','2024-06-24 20:51:36',1,1),(39,'01841214748585749999',1,5,0,'2024-06-30 04:29:16','2024-06-30 16:29:36',1,1),(40,'01841214587415875555',1,6,1,'2024-06-30 05:27:35','2024-06-30 17:27:49',1,1);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_catalogo`
--

DROP TABLE IF EXISTS `data_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_catalogo` (
  `idDataCatalogo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `idCatalogo` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`idDataCatalogo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `fk_catalogo_idx` (`idCatalogo`),
  CONSTRAINT `fk_catalogo` FOREIGN KEY (`idCatalogo`) REFERENCES `catalogo` (`idCatalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_catalogo`
--

LOCK TABLES `data_catalogo` WRITE;
/*!40000 ALTER TABLE `data_catalogo` DISABLE KEYS */;
INSERT INTO `data_catalogo` VALUES (1,'Bancos',1,0,'2022-04-03 22:59:07','2024-06-30 18:33:57'),(2,'Cooperativas',1,1,'2022-04-03 22:59:07','2024-06-30 16:07:35'),(3,'Financieras',1,1,'2022-04-03 22:59:07','2024-06-30 16:07:36'),(4,'Cajas',1,1,'2022-04-03 22:59:07','2024-06-30 16:07:36'),(5,'Soles',2,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(6,'Dólares',2,0,'2022-04-03 22:59:07','2024-06-30 18:34:25'),(7,'15',3,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(8,'20',3,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(9,'25',3,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(10,'30',3,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(11,'35',3,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(12,'Generado',4,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(13,'Aceptado',4,1,'2022-04-03 22:59:07','2024-06-30 16:06:10'),(14,'Rechazado',4,1,'2022-04-03 22:59:07','2022-04-03 22:59:07');
/*!40000 ALTER TABLE `data_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplo`
--

DROP TABLE IF EXISTS `ejemplo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemplo` (
  `idEjemplo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `idPais` int NOT NULL,
  `idUbigeo` int NOT NULL,
  `longitud` decimal(10,5) NOT NULL,
  `dias` int NOT NULL,
  `idUsuarioPrestatario` int NOT NULL,
  `estado` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualiza` int NOT NULL,
  PRIMARY KEY (`idEjemplo`),
  KEY `fk_prueba_pais_idx` (`idPais`),
  KEY `fk_prueba_usuario_idx` (`idUsuarioRegistro`),
  KEY `fk_prueba_usuario2_idx` (`idUsuarioActualiza`),
  KEY `fk_ejemplo_ubigeo_idx` (`idUbigeo`),
  KEY `fl_eje_usuario_idx` (`idUsuarioPrestatario`),
  KEY `fk_ejem_dias_idx` (`dias`),
  CONSTRAINT `fk_ejem_dias` FOREIGN KEY (`dias`) REFERENCES `data_catalogo` (`idDataCatalogo`),
  CONSTRAINT `fk_ejem_ubigeo` FOREIGN KEY (`idUbigeo`) REFERENCES `ubigeo` (`idUbigeo`),
  CONSTRAINT `fk_ejem_usuario` FOREIGN KEY (`idUsuarioPrestatario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_prueba_pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`),
  CONSTRAINT `fk_prueba_usuario1` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_prueba_usuario2` FOREIGN KEY (`idUsuarioActualiza`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplo`
--

LOCK TABLES `ejemplo` WRITE;
/*!40000 ALTER TABLE `ejemplo` DISABLE KEYS */;
INSERT INTO `ejemplo` VALUES (62,'AAAA',3,97223,11.00000,7,6,1,'2024-06-22 17:47:41','2024-06-22 17:47:41',4,4),(63,'AAAAA',1,2262163,111.00000,10,6,0,'2024-06-22 17:54:27','2024-06-22 17:54:27',4,4);
/*!40000 ALTER TABLE `ejemplo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidad_financiera`
--

DROP TABLE IF EXISTS `entidad_financiera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad_financiera` (
  `idEntidadFinanciera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `gerente` varchar(45) NOT NULL,
  `idTipoEntidad` int NOT NULL,
  `idUbigeo` int NOT NULL,
  `estado` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualizacion` int NOT NULL,
  PRIMARY KEY (`idEntidadFinanciera`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `kf_entidad_fin_usuario_reg_idx` (`idUsuarioRegistro`),
  KEY `kf_entidad_fin_usuario_act_idx` (`idUsuarioActualizacion`),
  KEY `fk_tipo_entidad_data_catalogo_idx` (`idTipoEntidad`),
  KEY `fk_ubigeo_entidad_idx` (`idUbigeo`),
  CONSTRAINT `fk_tipo_entidad_data_catalogo` FOREIGN KEY (`idTipoEntidad`) REFERENCES `data_catalogo` (`idDataCatalogo`),
  CONSTRAINT `fk_ubigeo_entidad` FOREIGN KEY (`idUbigeo`) REFERENCES `ubigeo` (`idUbigeo`),
  CONSTRAINT `kf_entidad_fin_usuario_act` FOREIGN KEY (`idUsuarioActualizacion`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `kf_entidad_fin_usuario_reg` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_financiera`
--

LOCK TABLES `entidad_financiera` WRITE;
/*!40000 ALTER TABLE `entidad_financiera` DISABLE KEYS */;
INSERT INTO `entidad_financiera` VALUES (1,'Banco CreditoAX','Luis Quispe',1,4114,1,'2024-06-30 15:24:34','2024-06-30 15:24:34',1,1),(2,'Scotiabank','Juan Vargas',1,24123,1,'2022-04-03 22:59:07','2024-06-30 16:09:18',1,1),(3,'Caja Arequipa','Elba Flores',4,128252,1,'2022-04-03 22:59:07','2024-06-30 16:09:19',1,1);
/*!40000 ALTER TABLE `entidad_financiera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `idGrupo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `idUbigeo` int NOT NULL,
  `idUsuarioLider` int NOT NULL,
  `estado` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualizacion` int NOT NULL,
  PRIMARY KEY (`idGrupo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `idUsuarioLider_UNIQUE` (`idUsuarioLider`),
  KEY `fk_grupo_ubigeo_idx` (`idUbigeo`),
  KEY `fk_grupo_usuario1_idx` (`idUsuarioLider`),
  KEY `fk_grupo_usuario2_idx` (`idUsuarioRegistro`),
  KEY `fk_grupo_usuario3_idx` (`idUsuarioActualizacion`),
  CONSTRAINT `fk_grupo_ubigeo` FOREIGN KEY (`idUbigeo`) REFERENCES `ubigeo` (`idUbigeo`),
  CONSTRAINT `fk_grupo_usuario1` FOREIGN KEY (`idUsuarioLider`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_grupo_usuario2` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_grupo_usuario3` FOREIGN KEY (`idUsuarioActualizacion`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Mercado CentralABX',22121,2,1,'2022-04-03 22:59:07','2024-06-30 17:51:44',1,1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monto_prestamo`
--

DROP TABLE IF EXISTS `monto_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monto_prestamo` (
  `idMontoPrestamo` int NOT NULL AUTO_INCREMENT,
  `capital` int NOT NULL,
  `dias` int NOT NULL,
  `monto` double NOT NULL,
  `estado` int NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualizacion` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`idMontoPrestamo`),
  KEY `fk_monto_dias_idx` (`dias`),
  KEY `fk_monto_usu_reg_idx` (`idUsuarioRegistro`),
  KEY `fk_monto_usu_act_idx` (`idUsuarioActualizacion`),
  CONSTRAINT `fk_monto_dias` FOREIGN KEY (`dias`) REFERENCES `data_catalogo` (`idDataCatalogo`),
  CONSTRAINT `fk_monto_usu_act` FOREIGN KEY (`idUsuarioActualizacion`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_monto_usu_reg` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monto_prestamo`
--

LOCK TABLES `monto_prestamo` WRITE;
/*!40000 ALTER TABLE `monto_prestamo` DISABLE KEYS */;
INSERT INTO `monto_prestamo` VALUES (1,150,10,165,1,1,1,'2024-06-24 19:44:08','2024-06-24 19:44:08'),(2,150,8,180,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(3,150,9,200,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(4,150,10,250,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(5,150,11,300,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(6,200,7,230,0,1,1,'2022-04-03 22:59:07','2024-06-30 18:46:31'),(7,200,8,250,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(8,200,9,280,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(9,200,10,300,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(10,400,7,450,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(11,400,8,470,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(14,500,9,550,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(15,500,10,580,1,1,1,'2022-04-03 22:59:07','2022-04-03 22:59:07'),(36,666,7,7500,1,1,1,'2024-06-30 05:32:38','2024-06-30 18:11:33');
/*!40000 ALTER TABLE `monto_prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcion` (
  `idOpcion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `ruta` text,
  `tipo` smallint DEFAULT NULL,
  PRIMARY KEY (`idOpcion`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,'Registro Coordenada','1','verRegistroCoordenada',1),(2,'Registro Cuenta','1','verRegistroCuenta',1),(3,'Registro Data Catalogo','1','verRegistroDataCatalogo',1),(4,'Registro Entidad Financiera','1','verRegistroEntidadFinanciera',1),(5,'Registro Grupo','1','verRegistroGrupo',1),(6,'Registro Monto Préstamo','1','verRegistroMontoPrestamo',1),(7,'Registro Prestatario','1','verRegistroPrestatario',1),(8,'Registro Solicitud Préstamo','1','verRegistroSolicitudPrestamo',1),(9,'Registro Ejemplo','1','verRegistroEjemplo',1),(10,'CRUD Ejemplo','1','verCrudEjemplo',3),(11,'CRUD Coordenada','1','verCrudCoordenada',3),(12,'CRUD Cuenta','1','verCrudCuenta',3),(13,'CRUD Data Catalogo','1','verCrudDataCatalogo',3),(14,'CRUD Entidad Financiera','1','verCrudEntidadFinanciera',3),(15,'CRUD Grupo','1','verCrudGrupo',3),(16,'CRUD Monto Préstamo','1','verCrudMontoPrestamo',3),(17,'CRUD Prestatario','1','verCrudPrestatario',3),(18,'CRUD Solicitud Préstamo','1','verCrudSolicitudPrestamo',3),(19,'Consulta Coordenada','1','verConsultaCoordenada',2),(20,'Consulta Cuenta','1','verConsultaCuenta',2),(21,'Consulta Data Catalogo','1','verConsultaDataCatalogo',2),(22,'Consulta Entidad Financiera','1','verConsultaEntidadFinanciera',2),(23,'Consulta Grupo','1','verConsultaGrupo',2),(24,'Consulta Monto Préstamo','1','verConsultaMontoPrestamo',2),(25,'Consulta Prestatario','1','verConsultaPrestatario',2),(26,'Consulta Solicitud Préstamo','1','verConsultaSolicitudPrestamo',2),(27,'Consulta Ejemplo','1','verConsultaEjemplo',2);
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idPais` int NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'AF','Afganistán'),(2,'AX','Islas Gland'),(3,'AL','Albania'),(4,'DE','Alemania'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antártida'),(9,'AG','Antigua y Barbuda'),(10,'AN','Antillas Holandesas'),(11,'SA','Arabia Saudí'),(12,'DZ','Argelia'),(13,'AR','Argentina'),(14,'AM','Armenia'),(15,'AW','Aruba'),(16,'AU','Australia'),(17,'AT','Austria'),(18,'AZ','Azerbaiyán'),(19,'BS','Bahamas'),(20,'BH','Bahréin'),(21,'BD','Bangladesh'),(22,'BB','Barbados'),(23,'BY','Bielorrusia'),(24,'BE','Bélgica'),(25,'BZ','Belice'),(26,'BJ','Benin'),(27,'BM','Bermudas'),(28,'BT','Bhután'),(29,'BO','Bolivia'),(30,'BA','Bosnia y Herzegovina'),(31,'BW','Botsuana'),(32,'BV','Isla Bouvet'),(33,'BR','Brasil'),(34,'BN','Brunéi'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'CV','Cabo Verde'),(39,'KY','Islas Caimán'),(40,'KH','Camboya'),(41,'CM','Camerún'),(42,'CA','Canadá'),(43,'CF','República Centroafricana'),(44,'TD','Chad'),(45,'CZ','República Checa'),(46,'CL','Chile'),(47,'CN','China'),(48,'CY','Chipre'),(49,'CX','Isla de Navidad'),(50,'VA','Ciudad del Vaticano'),(51,'CC','Islas Cocos'),(52,'CO','Colombia'),(53,'KM','Comoras'),(54,'CD','República Democrática del Congo'),(55,'CG','Congo'),(56,'CK','Islas Cook'),(57,'KP','Corea del Norte'),(58,'KR','Corea del Sur'),(59,'CI','Costa de Marfil'),(60,'CR','Costa Rica'),(61,'HR','Croacia'),(62,'CU','Cuba'),(63,'DK','Dinamarca'),(64,'DM','Dominica'),(65,'DO','República Dominicana'),(66,'EC','Ecuador'),(67,'EG','Egipto'),(68,'SV','El Salvador'),(69,'AE','Emiratos Árabes Unidos'),(70,'ER','Eritrea'),(71,'SK','Eslovaquia'),(72,'SI','Eslovenia'),(73,'ES','España'),(74,'UM','Islas ultramarinas de Estados Unidos'),(75,'US','Estados Unidos'),(76,'EE','Estonia'),(77,'ET','Etiopía'),(78,'FO','Islas Feroe'),(79,'PH','Filipinas'),(80,'FI','Finlandia'),(81,'FJ','Fiyi'),(82,'FR','Francia'),(83,'GA','Gabón'),(84,'GM','Gambia'),(85,'GE','Georgia'),(86,'GS','Islas Georgias del Sur y Sandwich del Sur'),(87,'GH','Ghana'),(88,'GI','Gibraltar'),(89,'GD','Granada'),(90,'GR','Grecia'),(91,'GL','Groenlandia'),(92,'GP','Guadalupe'),(93,'GU','Guam'),(94,'GT','Guatemala'),(95,'GF','Guayana Francesa'),(96,'GN','Guinea'),(97,'GQ','Guinea Ecuatorial'),(98,'GW','Guinea-Bissau'),(99,'GY','Guyana'),(100,'HT','Haití'),(101,'HM','Islas Heard y McDonald'),(102,'HN','Honduras'),(103,'HK','Hong Kong'),(104,'HU','Hungría'),(105,'IN','India'),(106,'ID','Indonesia'),(107,'IR','Irán'),(108,'IQ','Iraq'),(109,'IE','Irlanda'),(110,'IS','Islandia'),(111,'IL','Israel'),(112,'IT','Italia'),(113,'JM','Jamaica'),(114,'JP','Japón'),(115,'JO','Jordania'),(116,'KZ','Kazajstán'),(117,'KE','Kenia'),(118,'KG','Kirguistán'),(119,'KI','Kiribati'),(120,'KW','Kuwait'),(121,'LA','Laos'),(122,'LS','Lesotho'),(123,'LV','Letonia'),(124,'LB','Líbano'),(125,'LR','Liberia'),(126,'LY','Libia'),(127,'LI','Liechtenstein'),(128,'LT','Lituania'),(129,'LU','Luxemburgo'),(130,'MO','Macao'),(131,'MK','ARY Macedonia'),(132,'MG','Madagascar'),(133,'MY','Malasia'),(134,'MW','Malawi'),(135,'MV','Maldivas'),(136,'ML','Malí'),(137,'MT','Malta'),(138,'FK','Islas Malvinas'),(139,'MP','Islas Marianas del Norte'),(140,'MA','Marruecos'),(141,'MH','Islas Marshall'),(142,'MQ','Martinica'),(143,'MU','Mauricio'),(144,'MR','Mauritania'),(145,'YT','Mayotte'),(146,'MX','México'),(147,'FM','Micronesia'),(148,'MD','Moldavia'),(149,'MC','Mónaco'),(150,'MN','Mongolia'),(151,'MS','Montserrat'),(152,'MZ','Mozambique'),(153,'MM','Myanmar'),(154,'NA','Namibia'),(155,'NR','Nauru'),(156,'NP','Nepal'),(157,'NI','Nicaragua'),(158,'NE','Níger'),(159,'NG','Nigeria'),(160,'NU','Niue'),(161,'NF','Isla Norfolk'),(162,'NO','Noruega'),(163,'NC','Nueva Caledonia'),(164,'NZ','Nueva Zelanda'),(165,'OM','Omán'),(166,'NL','Países Bajos'),(167,'PK','Pakistán'),(168,'PW','Palau'),(169,'PS','Palestina'),(170,'PA','Panamá'),(171,'PG','Papúa Nueva Guinea'),(172,'PY','Paraguay'),(173,'PE','Perú'),(174,'PN','Islas Pitcairn'),(175,'PF','Polinesia Francesa'),(176,'PL','Polonia'),(177,'PT','Portugal'),(178,'PR','Puerto Rico'),(179,'QA','Qatar'),(180,'GB','Reino Unido'),(181,'RE','Reunión'),(182,'RW','Ruanda'),(183,'RO','Rumania'),(184,'RU','Rusia'),(185,'EH','Sahara Occidental'),(186,'SB','Islas Salomón'),(187,'WS','Samoa'),(188,'AS','Samoa Americana'),(189,'KN','San Cristóbal y Nevis'),(190,'SM','San Marino'),(191,'PM','San Pedro y Miquelón'),(192,'VC','San Vicente y las Granadinas'),(193,'SH','Santa Helena'),(194,'LC','Santa Lucía'),(195,'ST','Santo Tomé y Príncipe'),(196,'SN','Senegal'),(197,'CS','Serbia y Montenegro'),(198,'SC','Seychelles'),(199,'SL','Sierra Leona'),(200,'SG','Singapur'),(201,'SY','Siria'),(202,'SO','Somalia'),(203,'LK','Sri Lanka'),(204,'SZ','Suazilandia'),(205,'ZA','Sudáfrica'),(206,'SD','Sudán'),(207,'SE','Suecia'),(208,'CH','Suiza'),(209,'SR','Surinam'),(210,'SJ','Svalbard y Jan Mayen'),(211,'TH','Tailandia'),(212,'TW','Taiwán'),(213,'TZ','Tanzania'),(214,'TJ','Tayikistán'),(215,'IO','Territorio Británico del Océano Índico'),(216,'TF','Territorios Australes Franceses'),(217,'TL','Timor Oriental'),(218,'TG','Togo'),(219,'TK','Tokelau'),(220,'TO','Tonga'),(221,'TT','Trinidad y Tobago'),(222,'TN','Túnez'),(223,'TC','Islas Turcas y Caicos'),(224,'TM','Turkmenistán'),(225,'TR','Turquía'),(226,'TV','Tuvalu'),(227,'UA','Ucrania'),(228,'UG','Uganda'),(229,'UY','Uruguay'),(230,'UZ','Uzbekistán'),(231,'VU','Vanuatu'),(232,'VE','Venezuela'),(233,'VN','Vietnam'),(234,'VG','Islas Vírgenes Británicas'),(235,'VI','Islas Vírgenes de los Estados Unidos'),(236,'WF','Wallis y Futuna'),(237,'YE','Yemen'),(238,'DJ','Yibuti'),(239,'ZM','Zambia'),(240,'ZW','Zimbabue'),(241,'PQ','Prueba'),(242,'PQ','Prueba'),(243,'PQ','Prueba'),(244,'PQ','Prueba'),(245,'PQ','Prueba'),(246,'PQ','Prueba'),(247,'PQ','Prueba2'),(248,'PQ','Prueba2'),(249,'PQ','Prueba2'),(250,'PQ','Prueba2'),(251,'PQ','Prueba2'),(252,'PQ','Prueba2'),(253,'PQ','Prueba2'),(254,'PQ','Prueba2'),(255,'PQ','Prueba2'),(256,'PQ','Prueba2'),(257,'PQ','Prueba2'),(258,'PQ','Prueba22222'),(259,'PQ','Prueba22222'),(260,'PQ','Prueba22222ffdgdg'),(261,'PQ','Prueba22222ffdgdg'),(262,'PQ','Prueba22222ffdgdg'),(263,'PQ','Prueba22222ffdgdg'),(264,'PQ','Prueba22222'),(265,'PQ','Jorge Jacinto'),(266,'PQ','Jorge Jacinto GRUPO X'),(267,'PQ','Jorge Jacinto GRUPO X'),(268,'PQ','Jorge Jacinto GRUPO X'),(269,'PQ','Jorge Jacinto GRUPO X'),(270,'PQ','Jorge Jacinto GRUPO X'),(271,'AB','Jorge Jacinto GRUPO 5'),(272,'AB','Jorge Jacinto GRUPO 5'),(273,'XY','Jorge Jacinto GRUPO 30'),(274,'RZ','Jorge Jacinto GRUPO 40');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador General','1'),(2,'Jefe de Prestamista','1'),(3,'Prestamista','1'),(4,'Prestatario','1');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_has_opcion`
--

DROP TABLE IF EXISTS `rol_has_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_has_opcion` (
  `idrol` int NOT NULL,
  `idopcion` int NOT NULL,
  PRIMARY KEY (`idrol`,`idopcion`),
  KEY `fk_rol_has_opcion_opcion1_idx` (`idopcion`),
  KEY `fk_rol_has_opcion_rol1_idx` (`idrol`),
  CONSTRAINT `fk_rol_has_opcion_opcion1` FOREIGN KEY (`idopcion`) REFERENCES `opcion` (`idOpcion`),
  CONSTRAINT `fk_rol_has_opcion_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_has_opcion`
--

LOCK TABLES `rol_has_opcion` WRITE;
/*!40000 ALTER TABLE `rol_has_opcion` DISABLE KEYS */;
INSERT INTO `rol_has_opcion` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(3,7),(3,8),(3,9),(3,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(3,17),(3,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(3,25),(3,26),(3,27);
/*!40000 ALTER TABLE `rol_has_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_prestamo`
--

DROP TABLE IF EXISTS `solicitud_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_prestamo` (
  `idSolicitud` int NOT NULL AUTO_INCREMENT,
  `capital` double NOT NULL,
  `dias` int NOT NULL,
  `montoPagar` double NOT NULL,
  `fechaInicioPrestamo` date NOT NULL,
  `fechaFinPrestamo` date NOT NULL,
  `idEstadoSolcitud` int NOT NULL,
  `idUsuarioPrestatario` int NOT NULL,
  `estado` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualizacion` int NOT NULL,
  PRIMARY KEY (`idSolicitud`),
  KEY `fk_solicitud_usuario1_idx` (`idUsuarioPrestatario`),
  KEY `fk_solicitud_usuario2_idx` (`idUsuarioRegistro`),
  KEY `fk_solicitud_estado_idx` (`idEstadoSolcitud`),
  KEY `kf_solicitud_dias_idx` (`dias`),
  KEY `fk_solicitud_usuario3_idx` (`idUsuarioActualizacion`),
  CONSTRAINT `fk_solicitud_estado` FOREIGN KEY (`idEstadoSolcitud`) REFERENCES `data_catalogo` (`idDataCatalogo`),
  CONSTRAINT `fk_solicitud_usuario1` FOREIGN KEY (`idUsuarioPrestatario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_solicitud_usuario2` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_solicitud_usuario3` FOREIGN KEY (`idUsuarioActualizacion`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `kf_solicitud_dias` FOREIGN KEY (`dias`) REFERENCES `data_catalogo` (`idDataCatalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_prestamo`
--

LOCK TABLES `solicitud_prestamo` WRITE;
/*!40000 ALTER TABLE `solicitud_prestamo` DISABLE KEYS */;
INSERT INTO `solicitud_prestamo` VALUES (1,150,7,165,'2023-12-30','2024-01-14',12,6,1,'2022-04-03 22:59:07','2024-06-30 16:44:08',1,1),(8,200,7,230,'2024-06-12','2024-06-27',12,6,1,'2024-06-30 15:31:29','2024-06-30 15:31:29',1,1);
/*!40000 ALTER TABLE `solicitud_prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubigeo`
--

DROP TABLE IF EXISTS `ubigeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubigeo` (
  `idUbigeo` int NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `distrito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUbigeo`)
) ENGINE=InnoDB AUTO_INCREMENT=179022214 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubigeo`
--

LOCK TABLES `ubigeo` WRITE;
/*!40000 ALTER TABLE `ubigeo` DISABLE KEYS */;
INSERT INTO `ubigeo` VALUES (1111,'Amazonas','Chachapoyas','Chachapoyas'),(2112,'Amazonas','Chachapoyas','Asuncion'),(3113,'Amazonas','Chachapoyas','Balsas'),(4114,'Amazonas','Chachapoyas','Cheto'),(5115,'Amazonas','Chachapoyas','Chiliquin'),(6116,'Amazonas','Chachapoyas','Chuquibamba'),(7117,'Amazonas','Chachapoyas','Granada'),(8118,'Amazonas','Chachapoyas','Huancas'),(9119,'Amazonas','Chachapoyas','La Jalca'),(22121,'Amazonas','Bagua','La Peca'),(23122,'Amazonas','Bagua','Aramango'),(24123,'Amazonas','Bagua','Copallin'),(25124,'Amazonas','Bagua','El Parco'),(26126,'Amazonas','Bagua','Imaza'),(27131,'Amazonas','Bongara','Jumbilla'),(28132,'Amazonas','Bongara','Corosha'),(29133,'Amazonas','Bongara','Cuispes'),(30134,'Amazonas','Bongara','Chisquilla'),(31135,'Amazonas','Bongara','Churuja'),(32136,'Amazonas','Bongara','Florida'),(33137,'Amazonas','Bongara','Recta'),(34138,'Amazonas','Bongara','San Carlos'),(35139,'Amazonas','Bongara','Shipasbamba'),(39141,'Amazonas','Luya','Lamud'),(40142,'Amazonas','Luya','Camporredondo'),(41143,'Amazonas','Luya','Cocabamba'),(42144,'Amazonas','Luya','Colcamar'),(43145,'Amazonas','Luya','Conila'),(44146,'Amazonas','Luya','Inguilpata'),(45147,'Amazonas','Luya','Longuita'),(46148,'Amazonas','Luya','Lonya Chico'),(47149,'Amazonas','Luya','Luya'),(62151,'Amazonas','Rodriguez De Mendoza','San Nicolas'),(63152,'Amazonas','Rodriguez De Mendoza','Cochamal'),(64153,'Amazonas','Rodriguez De Mendoza','Chirimoto'),(65154,'Amazonas','Rodriguez De Mendoza','Huambo'),(66155,'Amazonas','Rodriguez De Mendoza','Limabamba'),(67156,'Amazonas','Rodriguez De Mendoza','Longar'),(68157,'Amazonas','Rodriguez De Mendoza','Milpuc'),(69158,'Amazonas','Rodriguez De Mendoza','Mcal Benavides'),(70159,'Amazonas','Rodriguez De Mendoza','Omia'),(74161,'Amazonas','Condorcanqui','Nieva'),(75162,'Amazonas','Condorcanqui','Rio Santiago'),(76163,'Amazonas','Condorcanqui','El Cenepa'),(77171,'Amazonas','Utcubamba','Bagua Grande'),(78172,'Amazonas','Utcubamba','Cajaruro'),(79173,'Amazonas','Utcubamba','Cumba'),(80174,'Amazonas','Utcubamba','El Milagro'),(81175,'Amazonas','Utcubamba','Jamalca'),(82176,'Amazonas','Utcubamba','Lonya Grande'),(83177,'Amazonas','Utcubamba','Yamon'),(84211,'Ancash','Huaraz','Huaraz'),(85212,'Ancash','Huaraz','Independencia'),(86213,'Ancash','Huaraz','Cochabamba'),(87214,'Ancash','Huaraz','Colcabamba'),(88215,'Ancash','Huaraz','Huanchay'),(89216,'Ancash','Huaraz','Jangas'),(90217,'Ancash','Huaraz','La Libertad'),(91218,'Ancash','Huaraz','Olleros'),(92219,'Ancash','Huaraz','Pampas'),(96221,'Ancash','Aija','Aija'),(97223,'Ancash','Aija','Coris'),(98225,'Ancash','Aija','Huacllan'),(99226,'Ancash','Aija','La Merced'),(100228,'Ancash','Aija','Succha'),(101110,'Amazonas','Chachapoyas','Leimebamba'),(101231,'Ancash','Bolognesi','Chiquian'),(102232,'Ancash','Bolognesi','A Pardo Lezameta'),(103234,'Ancash','Bolognesi','Aquia'),(104235,'Ancash','Bolognesi','Cajacay'),(111111,'Amazonas','Chachapoyas','Levanto'),(116241,'Ancash','Carhuaz','Carhuaz'),(117242,'Ancash','Carhuaz','Acopampa'),(118243,'Ancash','Carhuaz','Amashca'),(119244,'Ancash','Carhuaz','Anta'),(120245,'Ancash','Carhuaz','Ataquero'),(121112,'Amazonas','Chachapoyas','Magdalena'),(121246,'Ancash','Carhuaz','Marcara'),(122247,'Ancash','Carhuaz','Pariahuanca'),(123248,'Ancash','Carhuaz','San Miguel De Aco'),(124249,'Ancash','Carhuaz','Shilla'),(127251,'Ancash','Casma','Casma'),(128252,'Ancash','Casma','Buena Vista Alta'),(129253,'Ancash','Casma','Comandante Noel'),(130255,'Ancash','Casma','Yautan'),(131113,'Amazonas','Chachapoyas','Mariscal Castilla'),(131261,'Ancash','Corongo','Corongo'),(132262,'Ancash','Corongo','Aco'),(133263,'Ancash','Corongo','Bambas'),(134264,'Ancash','Corongo','Cusca'),(135265,'Ancash','Corongo','La Pampa'),(136266,'Ancash','Corongo','Yanac'),(137267,'Ancash','Corongo','Yupan'),(138271,'Ancash','Huaylas','Caraz'),(139272,'Ancash','Huaylas','Huallanca'),(140273,'Ancash','Huaylas','Huata'),(141114,'Amazonas','Chachapoyas','Molinopampa'),(141274,'Ancash','Huaylas','Huaylas'),(142275,'Ancash','Huaylas','Mato'),(143276,'Ancash','Huaylas','Pamparomas'),(144277,'Ancash','Huaylas','Pueblo Libre'),(145278,'Ancash','Huaylas','Santa Cruz'),(146279,'Ancash','Huaylas','Yuracmarca'),(148281,'Ancash','Huari','Huari'),(149282,'Ancash','Huari','Cajay'),(150283,'Ancash','Huari','Chavin De Huantar'),(151115,'Amazonas','Chachapoyas','Montevideo'),(151284,'Ancash','Huari','Huacachi'),(152285,'Ancash','Huari','Huachis'),(153286,'Ancash','Huari','Huacchis'),(154287,'Ancash','Huari','Huantar'),(155288,'Ancash','Huari','Masin'),(156289,'Ancash','Huari','Paucas'),(161116,'Amazonas','Chachapoyas','Olleros'),(164291,'Ancash','Mariscal Luzuriaga','Piscobamba'),(165292,'Ancash','Mariscal Luzuriaga','Casca'),(166293,'Ancash','Mariscal Luzuriaga','Lucma'),(167294,'Ancash','Mariscal Luzuriaga','Fidel Olivas Escudero'),(168295,'Ancash','Mariscal Luzuriaga','Llama'),(169296,'Ancash','Mariscal Luzuriaga','Llumpa'),(170297,'Ancash','Mariscal Luzuriaga','Musga'),(171117,'Amazonas','Chachapoyas','Quinjalca'),(171298,'Ancash','Mariscal Luzuriaga','Eleazar Guzman Barron'),(181118,'Amazonas','Chachapoyas','San Fco De Daguas'),(191119,'Amazonas','Chachapoyas','San Isidro De Maino'),(201120,'Amazonas','Chachapoyas','Soloco'),(211121,'Amazonas','Chachapoyas','Sonche'),(250311,'Apurimac','Abancay','Abancay'),(251312,'Apurimac','Abancay','Circa'),(252313,'Apurimac','Abancay','Curahuasi'),(253314,'Apurimac','Abancay','Chacoche'),(254315,'Apurimac','Abancay','Huanipaca'),(255316,'Apurimac','Abancay','Lambrama'),(256317,'Apurimac','Abancay','Pichirhua'),(257318,'Apurimac','Abancay','San Pedro De Cachora'),(258319,'Apurimac','Abancay','Tamburco'),(259321,'Apurimac','Aymaraes','Chalhuanca'),(260322,'Apurimac','Aymaraes','Capaya'),(261323,'Apurimac','Aymaraes','Caraybamba'),(262324,'Apurimac','Aymaraes','Colcabamba'),(263325,'Apurimac','Aymaraes','Cotaruse'),(264326,'Apurimac','Aymaraes','Chapimarca'),(265327,'Apurimac','Aymaraes','Ihuayllo'),(266328,'Apurimac','Aymaraes','Lucre'),(267329,'Apurimac','Aymaraes','Pocohuanca'),(276331,'Apurimac','Andahuaylas','Andahuaylas'),(277332,'Apurimac','Andahuaylas','Andarapa'),(278333,'Apurimac','Andahuaylas','Chiara'),(279334,'Apurimac','Andahuaylas','Huancarama'),(280335,'Apurimac','Andahuaylas','Huancaray'),(281336,'Apurimac','Andahuaylas','Kishuara'),(282337,'Apurimac','Andahuaylas','Pacobamba'),(283338,'Apurimac','Andahuaylas','Pampachiri'),(284339,'Apurimac','Andahuaylas','San Antonio De Cachi'),(295341,'Apurimac','Antabamba','Antabamba'),(296342,'Apurimac','Antabamba','El Oro'),(297343,'Apurimac','Antabamba','Huaquirca'),(298344,'Apurimac','Antabamba','Juan Espinoza Medrano'),(299345,'Apurimac','Antabamba','Oropesa'),(300346,'Apurimac','Antabamba','Pachaconas'),(301347,'Apurimac','Antabamba','Sabaino'),(302351,'Apurimac','Cotabambas','Tambobamba'),(303352,'Apurimac','Cotabambas','Coyllurqui'),(304353,'Apurimac','Cotabambas','Cotabambas'),(305354,'Apurimac','Cotabambas','Haquira'),(306355,'Apurimac','Cotabambas','Mara'),(307356,'Apurimac','Cotabambas','Challhuahuacho'),(308361,'Apurimac','Grau','Chuquibambilla'),(309362,'Apurimac','Grau','Curpahuasi'),(310363,'Apurimac','Grau','Huaillati'),(311364,'Apurimac','Grau','Mamara'),(312365,'Apurimac','Grau','Mariscal Gamarra'),(313366,'Apurimac','Grau','Micaela Bastidas'),(314367,'Apurimac','Grau','Progreso'),(315368,'Apurimac','Grau','Pataypampa'),(316369,'Apurimac','Grau','San Antonio'),(322371,'Apurimac','Chincheros','Chincheros'),(323372,'Apurimac','Chincheros','Ongoy'),(324373,'Apurimac','Chincheros','Ocobamba'),(325374,'Apurimac','Chincheros','Cocharcas'),(326375,'Apurimac','Chincheros','Anco Huallo'),(327376,'Apurimac','Chincheros','Huaccana'),(328377,'Apurimac','Chincheros','Uranmarca'),(329378,'Apurimac','Chincheros','Ranracancha'),(330411,'Arequipa','Arequipa','Arequipa'),(331412,'Arequipa','Arequipa','Cayma'),(332413,'Arequipa','Arequipa','Cerro Colorado'),(333414,'Arequipa','Arequipa','Characato'),(334415,'Arequipa','Arequipa','Chiguata'),(335416,'Arequipa','Arequipa','La Joya'),(336417,'Arequipa','Arequipa','Miraflores'),(337418,'Arequipa','Arequipa','Mollebaya'),(338419,'Arequipa','Arequipa','Paucarpata'),(359421,'Arequipa','Caylloma','Chivay'),(360422,'Arequipa','Caylloma','Achoma'),(361310,'Amazonas','Bongara','Valera'),(361423,'Arequipa','Caylloma','Cabanaconde'),(362424,'Arequipa','Caylloma','Caylloma'),(363425,'Arequipa','Caylloma','Callalli'),(364426,'Arequipa','Caylloma','Coporaque'),(365427,'Arequipa','Caylloma','Huambo'),(366428,'Arequipa','Caylloma','Huanca'),(367429,'Arequipa','Caylloma','Ichupampa'),(371311,'Amazonas','Bongara','Yambrasbamba'),(379431,'Arequipa','Camana','Camana'),(380432,'Arequipa','Camana','Jose Maria Quimper'),(381312,'Amazonas','Bongara','Jazan'),(381433,'Arequipa','Camana','Mariano N Valcarcel'),(382434,'Arequipa','Camana','Mariscal Caceres'),(383435,'Arequipa','Camana','Nicolas De Pierola'),(384436,'Arequipa','Camana','Ocoña'),(385437,'Arequipa','Camana','Quilca'),(386438,'Arequipa','Camana','Samuel Pastor'),(387441,'Arequipa','Caraveli','Caraveli'),(388442,'Arequipa','Caraveli','Acari'),(389443,'Arequipa','Caraveli','Atico'),(390444,'Arequipa','Caraveli','Atiquipa'),(391445,'Arequipa','Caraveli','Bella Union'),(392446,'Arequipa','Caraveli','Cahuacho'),(393447,'Arequipa','Caraveli','Chala'),(394448,'Arequipa','Caraveli','Chaparra'),(395449,'Arequipa','Caraveli','Huanuhuanu'),(400451,'Arequipa','Castilla','Aplao'),(401452,'Arequipa','Castilla','Andagua'),(402453,'Arequipa','Castilla','Ayo'),(403454,'Arequipa','Castilla','Chachas'),(404455,'Arequipa','Castilla','Chilcaymarca'),(405456,'Arequipa','Castilla','Choco'),(406457,'Arequipa','Castilla','Huancarqui'),(407458,'Arequipa','Castilla','Machaguay'),(408459,'Arequipa','Castilla','Orcopampa'),(414461,'Arequipa','Condesuyos','Chuquibamba'),(415462,'Arequipa','Condesuyos','Andaray'),(416463,'Arequipa','Condesuyos','Cayarani'),(417464,'Arequipa','Condesuyos','Chichas'),(418465,'Arequipa','Condesuyos','Iray'),(419466,'Arequipa','Condesuyos','Salamanca'),(420467,'Arequipa','Condesuyos','Yanaquihua'),(421468,'Arequipa','Condesuyos','Rio Grande'),(422471,'Arequipa','Islay','Mollendo'),(423472,'Arequipa','Islay','Cocachacra'),(424473,'Arequipa','Islay','Dean Valdivia'),(425474,'Arequipa','Islay','Islay'),(426475,'Arequipa','Islay','Mejia'),(427476,'Arequipa','Islay','Punta De Bombon'),(428481,'Arequipa','La Union','Cotahuasi'),(429482,'Arequipa','La Union','Alca'),(430483,'Arequipa','La Union','Charcana'),(431484,'Arequipa','La Union','Huaynacotas'),(432485,'Arequipa','La Union','Pampamarca'),(433486,'Arequipa','La Union','Puyca'),(434487,'Arequipa','La Union','Quechualla'),(435488,'Arequipa','La Union','Sayla'),(436489,'Arequipa','La Union','Tauria'),(439511,'Ayacucho','Huamanga','Ayacucho'),(440512,'Ayacucho','Huamanga','Acos Vinchos'),(441513,'Ayacucho','Huamanga','Carmen Alto'),(442514,'Ayacucho','Huamanga','Chiara'),(443515,'Ayacucho','Huamanga','Quinua'),(444516,'Ayacucho','Huamanga','San Jose De Ticllas'),(445517,'Ayacucho','Huamanga','San Juan Bautista'),(446518,'Ayacucho','Huamanga','Santiago De Pischa'),(447519,'Ayacucho','Huamanga','Vinchos'),(454521,'Ayacucho','Cangallo','Cangallo'),(455524,'Ayacucho','Cangallo','Chuschi'),(456526,'Ayacucho','Cangallo','Los Morochucos'),(457527,'Ayacucho','Cangallo','Paras'),(458528,'Ayacucho','Cangallo','Totos'),(460531,'Ayacucho','Huanta','Huanta'),(461532,'Ayacucho','Huanta','Ayahuanco'),(462533,'Ayacucho','Huanta','Huamanguilla'),(463534,'Ayacucho','Huanta','Iguain'),(464535,'Ayacucho','Huanta','Luricocha'),(465537,'Ayacucho','Huanta','Santillana'),(466538,'Ayacucho','Huanta','Sivia'),(467539,'Ayacucho','Huanta','Llochegua'),(468541,'Ayacucho','La Mar','San Miguel'),(469542,'Ayacucho','La Mar','Anco'),(470543,'Ayacucho','La Mar','Ayna'),(471544,'Ayacucho','La Mar','Chilcas'),(472545,'Ayacucho','La Mar','Chungui'),(473546,'Ayacucho','La Mar','Tambo'),(474547,'Ayacucho','La Mar','Luis Carranza'),(475548,'Ayacucho','La Mar','Santa Rosa'),(476551,'Ayacucho','Lucanas','Puquio'),(477552,'Ayacucho','Lucanas','Aucara'),(478553,'Ayacucho','Lucanas','Cabana'),(479554,'Ayacucho','Lucanas','Carmen Salcedo'),(480556,'Ayacucho','Lucanas','Chaviña'),(481410,'Amazonas','Luya','Luya Viejo'),(481558,'Ayacucho','Lucanas','Chipao'),(491411,'Amazonas','Luya','Maria'),(497561,'Ayacucho','Parinacochas','Coracora'),(498564,'Ayacucho','Parinacochas','Coronel Castañeda'),(499565,'Ayacucho','Parinacochas','Chumpi'),(500568,'Ayacucho','Parinacochas','Pacapausa'),(501412,'Amazonas','Luya','Ocalli'),(505571,'Ayacucho','Victor Fajardo','Huancapi'),(506572,'Ayacucho','Victor Fajardo','Alcamenca'),(507573,'Ayacucho','Victor Fajardo','Apongo'),(508574,'Ayacucho','Victor Fajardo','Canaria'),(509576,'Ayacucho','Victor Fajardo','Cayara'),(510577,'Ayacucho','Victor Fajardo','Colca'),(511413,'Amazonas','Luya','Ocumal'),(511578,'Ayacucho','Victor Fajardo','Huaya'),(512579,'Ayacucho','Victor Fajardo','Huamanquiquia'),(517581,'Ayacucho','Huanca Sancos','Sancos'),(518582,'Ayacucho','Huanca Sancos','Sacsamarca'),(519583,'Ayacucho','Huanca Sancos','Santiago De Lucanamarca'),(520584,'Ayacucho','Huanca Sancos','Carapo'),(521414,'Amazonas','Luya','Pisuquia'),(521591,'Ayacucho','Vilcas Huaman','Vilcas Huaman'),(522592,'Ayacucho','Vilcas Huaman','Vischongo'),(523593,'Ayacucho','Vilcas Huaman','Accomarca'),(524594,'Ayacucho','Vilcas Huaman','Carhuanca'),(525595,'Ayacucho','Vilcas Huaman','Concepcion'),(526596,'Ayacucho','Vilcas Huaman','Huambalpa'),(527597,'Ayacucho','Vilcas Huaman','Saurama'),(528598,'Ayacucho','Vilcas Huaman','Independencia'),(531415,'Amazonas','Luya','San Cristobal'),(541416,'Amazonas','Luya','San Francisco De Yeso'),(550611,'Cajamarca','Cajamarca','Cajamarca'),(551417,'Amazonas','Luya','San Jeronimo'),(551612,'Cajamarca','Cajamarca','Asuncion'),(552613,'Cajamarca','Cajamarca','Cospan'),(553614,'Cajamarca','Cajamarca','Chetilla'),(554615,'Cajamarca','Cajamarca','Encañada'),(555616,'Cajamarca','Cajamarca','Jesus'),(556617,'Cajamarca','Cajamarca','Los Baños Del Inca'),(557618,'Cajamarca','Cajamarca','Llacanora'),(558619,'Cajamarca','Cajamarca','Magdalena'),(561418,'Amazonas','Luya','San Juan De Lopecancha'),(562621,'Cajamarca','Cajabamba','Cajabamba'),(563622,'Cajamarca','Cajabamba','Cachachi'),(564623,'Cajamarca','Cajabamba','Condebamba'),(565625,'Cajamarca','Cajabamba','Sitacocha'),(566631,'Cajamarca','Celendin','Celendin'),(567632,'Cajamarca','Celendin','Cortegana'),(568633,'Cajamarca','Celendin','Chumuch'),(569634,'Cajamarca','Celendin','Huasmin'),(570635,'Cajamarca','Celendin','Jorge Chavez'),(571419,'Amazonas','Luya','Santa Catalina'),(571636,'Cajamarca','Celendin','Jose Galvez'),(572637,'Cajamarca','Celendin','Miguel Iglesias'),(573638,'Cajamarca','Celendin','Oxamarca'),(574639,'Cajamarca','Celendin','Sorochuco'),(578641,'Cajamarca','Contumaza','Contumaza'),(579643,'Cajamarca','Contumaza','Chilete'),(580644,'Cajamarca','Contumaza','Guzmango'),(581420,'Amazonas','Luya','Santo Tomas'),(581645,'Cajamarca','Contumaza','San Benito'),(582646,'Cajamarca','Contumaza','Cupisnique'),(583647,'Cajamarca','Contumaza','Tantarica'),(584648,'Cajamarca','Contumaza','Yonan'),(585649,'Cajamarca','Contumaza','Sta Cruz De Toledo'),(586651,'Cajamarca','Cutervo','Cutervo'),(587652,'Cajamarca','Cutervo','Callayuc'),(588653,'Cajamarca','Cutervo','Cujillo'),(589654,'Cajamarca','Cutervo','Choros'),(590655,'Cajamarca','Cutervo','La Ramada'),(591421,'Amazonas','Luya','Tingo'),(591656,'Cajamarca','Cutervo','Pimpingos'),(592657,'Cajamarca','Cutervo','Querocotillo'),(593658,'Cajamarca','Cutervo','San Andres De Cutervo'),(594659,'Cajamarca','Cutervo','San Juan De Cutervo'),(601422,'Amazonas','Luya','Trita'),(601661,'Cajamarca','Chota','Chota'),(602662,'Cajamarca','Chota','Anguia'),(603663,'Cajamarca','Chota','Cochabamba'),(604664,'Cajamarca','Chota','Conchan'),(605665,'Cajamarca','Chota','Chadin'),(606666,'Cajamarca','Chota','Chiguirip'),(607667,'Cajamarca','Chota','Chimban'),(608668,'Cajamarca','Chota','Huambos'),(609669,'Cajamarca','Chota','Lajas'),(611423,'Amazonas','Luya','Providencia'),(620671,'Cajamarca','Hualgayoc','Bambamarca'),(621672,'Cajamarca','Hualgayoc','Chugur'),(622673,'Cajamarca','Hualgayoc','Hualgayoc'),(623681,'Cajamarca','Jaen','Jaen'),(624682,'Cajamarca','Jaen','Bellavista'),(625683,'Cajamarca','Jaen','Colasay'),(626684,'Cajamarca','Jaen','Chontali'),(627685,'Cajamarca','Jaen','Pomahuaca'),(628686,'Cajamarca','Jaen','Pucara'),(629687,'Cajamarca','Jaen','Sallique'),(630688,'Cajamarca','Jaen','San Felipe'),(631689,'Cajamarca','Jaen','San Jose Del Alto'),(635691,'Cajamarca','Santa Cruz','Santa Cruz'),(636692,'Cajamarca','Santa Cruz','Catache'),(637693,'Cajamarca','Santa Cruz','Chancaibaños'),(638694,'Cajamarca','Santa Cruz','La Esperanza'),(639695,'Cajamarca','Santa Cruz','Ninabamba'),(640696,'Cajamarca','Santa Cruz','Pulan'),(641697,'Cajamarca','Santa Cruz','Sexi'),(642698,'Cajamarca','Santa Cruz','Uticyacu'),(643699,'Cajamarca','Santa Cruz','Yauyucan'),(677711,'Cusco','Cusco','Cusco'),(678712,'Cusco','Cusco','Ccorca'),(679713,'Cusco','Cusco','Poroy'),(680714,'Cusco','Cusco','San Jeronimo'),(681715,'Cusco','Cusco','San Sebastian'),(682716,'Cusco','Cusco','Santiago'),(683717,'Cusco','Cusco','Saylla'),(684718,'Cusco','Cusco','Wanchaq'),(685721,'Cusco','Acomayo','Acomayo'),(686722,'Cusco','Acomayo','Acopia'),(687723,'Cusco','Acomayo','Acos'),(688724,'Cusco','Acomayo','Pomacanchi'),(689725,'Cusco','Acomayo','Rondocan'),(690726,'Cusco','Acomayo','Sangarara'),(691727,'Cusco','Acomayo','Mosoc Llacta'),(692731,'Cusco','Anta','Anta'),(693732,'Cusco','Anta','Chinchaypujio'),(694733,'Cusco','Anta','Huarocondo'),(695734,'Cusco','Anta','Limatambo'),(696735,'Cusco','Anta','Mollepata'),(697736,'Cusco','Anta','Pucyura'),(698737,'Cusco','Anta','Zurite'),(699738,'Cusco','Anta','Cachimayo'),(700739,'Cusco','Anta','Ancahuasi'),(701741,'Cusco','Calca','Calca'),(702742,'Cusco','Calca','Coya'),(703743,'Cusco','Calca','Lamay'),(704744,'Cusco','Calca','Lares'),(705745,'Cusco','Calca','Pisac'),(706746,'Cusco','Calca','San Salvador'),(707747,'Cusco','Calca','Taray'),(708748,'Cusco','Calca','Yanatile'),(709751,'Cusco','Canas','Yanaoca'),(710752,'Cusco','Canas','Checca'),(711510,'Amazonas','Rodriguez De Mendoza','Santa Rosa'),(711753,'Cusco','Canas','Kunturkanki'),(712754,'Cusco','Canas','Langui'),(713755,'Cusco','Canas','Layo'),(714756,'Cusco','Canas','Pampamarca'),(715757,'Cusco','Canas','Quehue'),(716758,'Cusco','Canas','Tupac Amaru'),(717761,'Cusco','Canchis','Sicuani'),(718762,'Cusco','Canchis','Combapata'),(719763,'Cusco','Canchis','Checacupe'),(720764,'Cusco','Canchis','Marangani'),(721511,'Amazonas','Rodriguez De Mendoza','Totora'),(721765,'Cusco','Canchis','Pitumarca'),(722766,'Cusco','Canchis','San Pablo'),(723767,'Cusco','Canchis','San Pedro'),(724768,'Cusco','Canchis','Tinta'),(725771,'Cusco','Chumbivilcas','Santo Tomas'),(726772,'Cusco','Chumbivilcas','Capacmarca'),(727773,'Cusco','Chumbivilcas','Colquemarca'),(728774,'Cusco','Chumbivilcas','Chamaca'),(729775,'Cusco','Chumbivilcas','Livitaca'),(730776,'Cusco','Chumbivilcas','Llusco'),(731512,'Amazonas','Rodriguez De Mendoza','Vista Alegre'),(731777,'Cusco','Chumbivilcas','Quiñota'),(732778,'Cusco','Chumbivilcas','Velille'),(733781,'Cusco','Espinar','Espinar'),(734782,'Cusco','Espinar','Condoroma'),(735783,'Cusco','Espinar','Coporaque'),(736784,'Cusco','Espinar','Ocoruro'),(737785,'Cusco','Espinar','Pallpata'),(738786,'Cusco','Espinar','Pichigua'),(739787,'Cusco','Espinar','Suykutambo'),(740788,'Cusco','Espinar','Alto Pichigua'),(741791,'Cusco','La Convencion','Santa Ana'),(742792,'Cusco','La Convencion','Echarate'),(743793,'Cusco','La Convencion','Huayopata'),(744794,'Cusco','La Convencion','Maranura'),(745795,'Cusco','La Convencion','Ocobamba'),(746796,'Cusco','La Convencion','Santa Teresa'),(747797,'Cusco','La Convencion','Vilcabamba'),(748798,'Cusco','La Convencion','Quellouno'),(749799,'Cusco','La Convencion','Kimbiri'),(785811,'Huancavelica','Huancavelica','Huancavelica'),(786812,'Huancavelica','Huancavelica','Acobambilla'),(787813,'Huancavelica','Huancavelica','Acoria'),(788814,'Huancavelica','Huancavelica','Conayca'),(789815,'Huancavelica','Huancavelica','Cuenca'),(790816,'Huancavelica','Huancavelica','Huachocolpa'),(791818,'Huancavelica','Huancavelica','Huayllahuara'),(792819,'Huancavelica','Huancavelica','Izcuchaca'),(804821,'Huancavelica','Acobamba','Acobamba'),(805822,'Huancavelica','Acobamba','Anta'),(806823,'Huancavelica','Acobamba','Andabamba'),(807824,'Huancavelica','Acobamba','Caja'),(808825,'Huancavelica','Acobamba','Marcas'),(809826,'Huancavelica','Acobamba','Paucara'),(810827,'Huancavelica','Acobamba','Pomacocha'),(811828,'Huancavelica','Acobamba','Rosario'),(812831,'Huancavelica','Angaraes','Lircay'),(813832,'Huancavelica','Angaraes','Anchonga'),(814833,'Huancavelica','Angaraes','Callanmarca'),(815834,'Huancavelica','Angaraes','Congalla'),(816835,'Huancavelica','Angaraes','Chincho'),(817836,'Huancavelica','Angaraes','Huayllay Grande'),(818837,'Huancavelica','Angaraes','Huanca Huanca'),(819838,'Huancavelica','Angaraes','Julcamarca'),(820839,'Huancavelica','Angaraes','San Antonio De Antaparco'),(824841,'Huancavelica','Castrovirreyna','Castrovirreyna'),(825842,'Huancavelica','Castrovirreyna','Arma'),(826843,'Huancavelica','Castrovirreyna','Aurahua'),(827845,'Huancavelica','Castrovirreyna','Capillas'),(828846,'Huancavelica','Castrovirreyna','Cocas'),(829848,'Huancavelica','Castrovirreyna','Chupamarca'),(830849,'Huancavelica','Castrovirreyna','Huachos'),(837851,'Huancavelica','Tayacaja','Pampas'),(838852,'Huancavelica','Tayacaja','Acostambo'),(839853,'Huancavelica','Tayacaja','Acraquia'),(840854,'Huancavelica','Tayacaja','Ahuaycha'),(841856,'Huancavelica','Tayacaja','Colcabamba'),(842859,'Huancavelica','Tayacaja','Daniel Hernandez'),(853861,'Huancavelica','Huaytara','Ayavi'),(854862,'Huancavelica','Huaytara','Cordova'),(855863,'Huancavelica','Huaytara','Huayacundo Arma'),(856864,'Huancavelica','Huaytara','Huaytara'),(857865,'Huancavelica','Huaytara','Laramarca'),(858866,'Huancavelica','Huaytara','Ocoyo'),(859867,'Huancavelica','Huaytara','Pilpichaca'),(860868,'Huancavelica','Huaytara','Querco'),(861869,'Huancavelica','Huaytara','Quito Arma'),(869871,'Huancavelica','Churcampa','Churcampa'),(870872,'Huancavelica','Churcampa','Anco'),(871873,'Huancavelica','Churcampa','Chinchihuasi'),(872874,'Huancavelica','Churcampa','El Carmen'),(873875,'Huancavelica','Churcampa','La Merced'),(874876,'Huancavelica','Churcampa','Locroja'),(875877,'Huancavelica','Churcampa','Paucarbamba'),(876878,'Huancavelica','Churcampa','San Miguel De Mayoc'),(877879,'Huancavelica','Churcampa','San Pedro De Coris'),(879911,'Huanuco','Huanuco','Huanuco'),(880912,'Huanuco','Huanuco','Chinchao'),(881913,'Huanuco','Huanuco','Churubamba'),(882914,'Huanuco','Huanuco','Margos'),(883915,'Huanuco','Huanuco','Quisqui'),(884916,'Huanuco','Huanuco','San Fco De Cayran'),(885917,'Huanuco','Huanuco','San Pedro De Chaulan'),(886918,'Huanuco','Huanuco','Sta Maria Del Valle'),(887919,'Huanuco','Huanuco','Yarumayo'),(890921,'Huanuco','Ambo','Ambo'),(891922,'Huanuco','Ambo','Cayna'),(892923,'Huanuco','Ambo','Colpas'),(893924,'Huanuco','Ambo','Conchamarca'),(894925,'Huanuco','Ambo','Huacar'),(895926,'Huanuco','Ambo','San Francisco'),(896927,'Huanuco','Ambo','San Rafael'),(897928,'Huanuco','Ambo','Tomay Kichwa'),(898931,'Huanuco','Dos De Mayo','La Union'),(899937,'Huanuco','Dos De Mayo','Chuquis'),(907941,'Huanuco','Huamalies','Llata'),(908942,'Huanuco','Huamalies','Arancay'),(909943,'Huanuco','Huamalies','Chavin De Pariarca'),(910944,'Huanuco','Huamalies','Jacas Grande'),(911945,'Huanuco','Huamalies','Jircan'),(912946,'Huanuco','Huamalies','Miraflores'),(913947,'Huanuco','Huamalies','Monzon'),(914948,'Huanuco','Huamalies','Punchao'),(915949,'Huanuco','Huamalies','Puños'),(918951,'Huanuco','Marañón','Huacrachuco'),(919952,'Huanuco','Marañón','Cholon'),(920955,'Huanuco','Marañón','San Buenaventura'),(921961,'Huanuco','Leoncio Prado','Rupa Rupa'),(922962,'Huanuco','Leoncio Prado','Daniel Alomia Robles'),(923963,'Huanuco','Leoncio Prado','Hermilio Valdizan'),(924964,'Huanuco','Leoncio Prado','Luyando'),(925965,'Huanuco','Leoncio Prado','Mariano Damaso Beraun'),(926966,'Huanuco','Leoncio Prado','Jose Crespo Y Castillo'),(927971,'Huanuco','Pachitea','Panao'),(928972,'Huanuco','Pachitea','Chaglla'),(929974,'Huanuco','Pachitea','Molino'),(930976,'Huanuco','Pachitea','Umari'),(931981,'Huanuco','Puerto Inca','Honoria'),(932110,'Ancash','Huaraz','Pariacoto'),(932982,'Huanuco','Puerto Inca','Puerto Inca'),(933983,'Huanuco','Puerto Inca','Codo Del Pozuzo'),(934984,'Huanuco','Puerto Inca','Tournavista'),(935985,'Huanuco','Puerto Inca','Yuyapichis'),(936991,'Huanuco','Huacaybamba','Huacaybamba'),(937992,'Huanuco','Huacaybamba','Pinra'),(938993,'Huanuco','Huacaybamba','Canchabamba'),(939994,'Huanuco','Huacaybamba','Cochabamba'),(942111,'Ancash','Huaraz','Pira'),(952112,'Ancash','Huaraz','Tarica'),(1052310,'Ancash','Bolognesi','Huayllacayan'),(1062311,'Ancash','Bolognesi','Huasta'),(1072313,'Ancash','Bolognesi','Mangas'),(1082315,'Ancash','Bolognesi','Pacllon'),(1092317,'Ancash','Bolognesi','San Miguel De Corpanqui'),(1102320,'Ancash','Bolognesi','Ticllos'),(1112321,'Ancash','Bolognesi','Antonio Raimondi'),(1122322,'Ancash','Bolognesi','Canis'),(1132323,'Ancash','Bolognesi','Colquioc'),(1142324,'Ancash','Bolognesi','La Primavera'),(1152325,'Ancash','Bolognesi','Huallanca'),(1252410,'Ancash','Carhuaz','Tinco'),(1262411,'Ancash','Carhuaz','Yungar'),(1472710,'Ancash','Huaylas','Santo Toribio'),(1572810,'Ancash','Huari','Ponto'),(1582811,'Ancash','Huari','Rahuapampa'),(1592812,'Ancash','Huari','Rapayan'),(1602813,'Ancash','Huari','San Marcos'),(1612814,'Ancash','Huari','San Pedro De Chana'),(1622815,'Ancash','Huari','Uco'),(1632816,'Ancash','Huari','Anra'),(1722101,'Ancash','Pallasca','Cabana'),(1732102,'Ancash','Pallasca','Bolognesi'),(1742103,'Ancash','Pallasca','Conchucos'),(1752104,'Ancash','Pallasca','Huacaschuque'),(1762105,'Ancash','Pallasca','Huandoval'),(1772106,'Ancash','Pallasca','Lacabamba'),(1782107,'Ancash','Pallasca','Llapo'),(1792108,'Ancash','Pallasca','Pallasca'),(1802109,'Ancash','Pallasca','Pampas'),(1832111,'Ancash','Pomabamba','Pomabamba'),(1834125,'Amazonas','Bagua','Bagua'),(1842112,'Ancash','Pomabamba','Huayllan'),(1852113,'Ancash','Pomabamba','Parobamba'),(1862114,'Ancash','Pomabamba','Quinuabamba'),(1872121,'Ancash','Recuay','Recuay'),(1882122,'Ancash','Recuay','Cotaparaco'),(1892123,'Ancash','Recuay','Huayllapampa'),(1902124,'Ancash','Recuay','Marca'),(1912125,'Ancash','Recuay','Pampas Chico'),(1922126,'Ancash','Recuay','Pararin'),(1932127,'Ancash','Recuay','Tapacocha'),(1942128,'Ancash','Recuay','Ticapampa'),(1952129,'Ancash','Recuay','Llacllin'),(1972131,'Ancash','Santa','Chimbote'),(1982132,'Ancash','Santa','Caceres Del Peru'),(1992133,'Ancash','Santa','Macate'),(2002134,'Ancash','Santa','Moro'),(2012135,'Ancash','Santa','Nepeña'),(2022136,'Ancash','Santa','Samanco'),(2032137,'Ancash','Santa','Santa'),(2042138,'Ancash','Santa','Coishco'),(2052139,'Ancash','Santa','Nuevo Chimbote'),(2062141,'Ancash','Sihuas','Sihuas'),(2072142,'Ancash','Sihuas','Alfonso Ugarte'),(2082143,'Ancash','Sihuas','Chingalpo'),(2092144,'Ancash','Sihuas','Huayllabamba'),(2102145,'Ancash','Sihuas','Quiches'),(2112146,'Ancash','Sihuas','Sicsibamba'),(2122147,'Ancash','Sihuas','Acobamba'),(2132148,'Ancash','Sihuas','Cashapampa'),(2142149,'Ancash','Sihuas','Ragash'),(2162151,'Ancash','Yungay','Yungay'),(2172152,'Ancash','Yungay','Cascapara'),(2182153,'Ancash','Yungay','Mancos'),(2192154,'Ancash','Yungay','Matacoto'),(2202155,'Ancash','Yungay','Quillo'),(2212156,'Ancash','Yungay','Ranrahirca'),(2222157,'Ancash','Yungay','Shupluy'),(2232158,'Ancash','Yungay','Yanama'),(2242161,'Ancash','Antonio Raimondi','Llamellin'),(2252162,'Ancash','Antonio Raimondi','Aczo'),(2262163,'Ancash','Antonio Raimondi','Chaccho'),(2272164,'Ancash','Antonio Raimondi','Chingas'),(2282165,'Ancash','Antonio Raimondi','Mirgas'),(2292166,'Ancash','Antonio Raimondi','San Juan De Rontoy'),(2302171,'Ancash','Carlos Fermin Fitzcarrald','San Luis'),(2312172,'Ancash','Carlos Fermin Fitzcarrald','Yauya'),(2322173,'Ancash','Carlos Fermin Fitzcarrald','San Nicolas'),(2332181,'Ancash','Asuncion','Chacas'),(2342182,'Ancash','Asuncion','Acochaca'),(2352191,'Ancash','Huarmey','Huarmey'),(2362192,'Ancash','Huarmey','Cochapeti'),(2372193,'Ancash','Huarmey','Huayan'),(2382194,'Ancash','Huarmey','Malvas'),(2392195,'Ancash','Huarmey','Culebras'),(2402201,'Ancash','Ocros','Acas'),(2412202,'Ancash','Ocros','Cajamarquilla'),(2422203,'Ancash','Ocros','Carhuapampa'),(2432204,'Ancash','Ocros','Cochas'),(2442205,'Ancash','Ocros','Congas'),(2452206,'Ancash','Ocros','Llipa'),(2462207,'Ancash','Ocros','Ocros'),(2472208,'Ancash','Ocros','San Cristobal De Rajan'),(2482209,'Ancash','Ocros','San Pedro'),(2683210,'Apurimac','Aymaraes','Sañaica'),(2693211,'Apurimac','Aymaraes','Soraya'),(2703212,'Apurimac','Aymaraes','Tapairihua'),(2713213,'Apurimac','Aymaraes','Tintay'),(2723214,'Apurimac','Aymaraes','Toraya'),(2733215,'Apurimac','Aymaraes','Yanaca'),(2743216,'Apurimac','Aymaraes','San Juan De Chacña'),(2753217,'Apurimac','Aymaraes','Justo Apu Sahuaraura'),(2853310,'Apurimac','Andahuaylas','San Jeronimo'),(2863311,'Apurimac','Andahuaylas','Talavera'),(2873312,'Apurimac','Andahuaylas','Turpo'),(2883313,'Apurimac','Andahuaylas','Pacucha'),(2893314,'Apurimac','Andahuaylas','Pomacocha'),(2903315,'Apurimac','Andahuaylas','Sta Maria De Chicmo'),(2913316,'Apurimac','Andahuaylas','Tumay Huaraca'),(2923317,'Apurimac','Andahuaylas','Huayana'),(2933318,'Apurimac','Andahuaylas','San Miguel De Chaccrampa'),(2943319,'Apurimac','Andahuaylas','Kaquiabamba'),(3173610,'Apurimac','Grau','Turpay'),(3183611,'Apurimac','Grau','Vilcabamba'),(3193612,'Apurimac','Grau','Virundo'),(3203613,'Apurimac','Grau','Santa Rosa'),(3213614,'Apurimac','Grau','Curasco'),(3394110,'Arequipa','Arequipa','Pocsi'),(3404111,'Arequipa','Arequipa','Polobaya'),(3414112,'Arequipa','Arequipa','Quequeña'),(3424113,'Arequipa','Arequipa','Sabandia'),(3434114,'Arequipa','Arequipa','Sachaca'),(3444115,'Arequipa','Arequipa','San Juan De Siguas'),(3454116,'Arequipa','Arequipa','San Juan De Tarucani'),(3464117,'Arequipa','Arequipa','Santa Isabel De Siguas'),(3474118,'Arequipa','Arequipa','Sta Rita De Siguas'),(3484119,'Arequipa','Arequipa','Socabaya'),(3494120,'Arequipa','Arequipa','Tiabaya'),(3504121,'Arequipa','Arequipa','Uchumayo'),(3514122,'Arequipa','Arequipa','Vitor'),(3524123,'Arequipa','Arequipa','Yanahuara'),(3534124,'Arequipa','Arequipa','Yarabamba'),(3544125,'Arequipa','Arequipa','Yura'),(3554126,'Arequipa','Arequipa','Mariano Melgar'),(3564127,'Arequipa','Arequipa','Jacobo Hunter'),(3574128,'Arequipa','Arequipa','Alto Selva Alegre'),(3584129,'Arequipa','Arequipa','Jose Luis Bustamante Y Rivero'),(3684210,'Arequipa','Caylloma','Lari'),(3694211,'Arequipa','Caylloma','Lluta'),(3704212,'Arequipa','Caylloma','Maca'),(3714213,'Arequipa','Caylloma','Madrigal'),(3724214,'Arequipa','Caylloma','San Antonio De Chuca'),(3734215,'Arequipa','Caylloma','Sibayo'),(3744216,'Arequipa','Caylloma','Tapay'),(3754217,'Arequipa','Caylloma','Tisco'),(3764218,'Arequipa','Caylloma','Tuti'),(3774219,'Arequipa','Caylloma','Yanque'),(3784220,'Arequipa','Caylloma','Majes'),(3964410,'Arequipa','Caraveli','Jaqui'),(3974411,'Arequipa','Caraveli','Lomas'),(3984412,'Arequipa','Caraveli','Quicacha'),(3994413,'Arequipa','Caraveli','Yauca'),(4094510,'Arequipa','Castilla','Pampacolca'),(4104511,'Arequipa','Castilla','Tipan'),(4114512,'Arequipa','Castilla','Uraca'),(4124513,'Arequipa','Castilla','Uñon'),(4134514,'Arequipa','Castilla','Viraco'),(4374810,'Arequipa','La Union','Tomepampa'),(4384811,'Arequipa','La Union','Toro'),(4485110,'Ayacucho','Huamanga','Tambillo'),(4495111,'Ayacucho','Huamanga','Acocro'),(4505112,'Ayacucho','Huamanga','Socos'),(4515113,'Ayacucho','Huamanga','Ocros'),(4525114,'Ayacucho','Huamanga','Pacaycasa'),(4535115,'Ayacucho','Huamanga','Jesus Nazareno'),(4595211,'Ayacucho','Cangallo','Maria Parado De Bellido'),(4825510,'Ayacucho','Lucanas','Huac-huas'),(4835511,'Ayacucho','Lucanas','Laramate'),(4845512,'Ayacucho','Lucanas','Leoncio Prado'),(4855513,'Ayacucho','Lucanas','Lucanas'),(4865514,'Ayacucho','Lucanas','Llauta'),(4875516,'Ayacucho','Lucanas','Ocaña'),(4885517,'Ayacucho','Lucanas','Otoca'),(4895520,'Ayacucho','Lucanas','Sancos'),(4905521,'Ayacucho','Lucanas','San Juan'),(4915522,'Ayacucho','Lucanas','San Pedro'),(4925524,'Ayacucho','Lucanas','Sta Ana De Huaycahuacho'),(4935525,'Ayacucho','Lucanas','Santa Lucia'),(4945529,'Ayacucho','Lucanas','Saisa'),(4955531,'Ayacucho','Lucanas','San Pedro De Palco'),(4965532,'Ayacucho','Lucanas','San Cristobal'),(5015611,'Ayacucho','Parinacochas','Pullo'),(5025612,'Ayacucho','Parinacochas','Puyusca'),(5035615,'Ayacucho','Parinacochas','San Fco De Ravacayco'),(5045616,'Ayacucho','Parinacochas','Upahuacho'),(5135710,'Ayacucho','Victor Fajardo','Huancaraylla'),(5145713,'Ayacucho','Victor Fajardo','Sarhua'),(5155714,'Ayacucho','Victor Fajardo','Vilcanchos'),(5165715,'Ayacucho','Victor Fajardo','Asquipata'),(5295101,'Ayacucho','Paucar Del Sara Sara','Pausa'),(5305102,'Ayacucho','Paucar Del Sara Sara','Colta'),(5315103,'Ayacucho','Paucar Del Sara Sara','Corculla'),(5325104,'Ayacucho','Paucar Del Sara Sara','Lampa'),(5335105,'Ayacucho','Paucar Del Sara Sara','Marcabamba'),(5345106,'Ayacucho','Paucar Del Sara Sara','Oyolo'),(5355107,'Ayacucho','Paucar Del Sara Sara','Pararca'),(5365108,'Ayacucho','Paucar Del Sara Sara','San Javier De Alpabamba'),(5375109,'Ayacucho','Paucar Del Sara Sara','San Jose De Ushua'),(5395111,'Ayacucho','Sucre','Querobamba'),(5405112,'Ayacucho','Sucre','Belen'),(5415113,'Ayacucho','Sucre','Chalcos'),(5425114,'Ayacucho','Sucre','San Salvador De Quije'),(5435115,'Ayacucho','Sucre','Paico'),(5445116,'Ayacucho','Sucre','Santiago De Paucaray'),(5455117,'Ayacucho','Sucre','San Pedro De Larcay'),(5465118,'Ayacucho','Sucre','Soras'),(5475119,'Ayacucho','Sucre','Huacaña'),(5596110,'Cajamarca','Cajamarca','Matara'),(5606111,'Cajamarca','Cajamarca','Namora'),(5616112,'Cajamarca','Cajamarca','San Juan'),(5756310,'Cajamarca','Celendin','Sucre'),(5766311,'Cajamarca','Celendin','Utco'),(5776312,'Cajamarca','Celendin','La Libertad De Pallan'),(5956510,'Cajamarca','Cutervo','San Luis De Lucma'),(5966511,'Cajamarca','Cutervo','Santa Cruz'),(5976512,'Cajamarca','Cutervo','Santo Domingo De La Capilla'),(5986513,'Cajamarca','Cutervo','Santo Tomas'),(5996514,'Cajamarca','Cutervo','Socota'),(6006515,'Cajamarca','Cutervo','Toribio Casanova'),(6106610,'Cajamarca','Chota','Llama'),(6116611,'Cajamarca','Chota','Miracosta'),(6126612,'Cajamarca','Chota','Paccha'),(6136613,'Cajamarca','Chota','Pion'),(6146614,'Cajamarca','Chota','Querocoto'),(6156615,'Cajamarca','Chota','Tacabamba'),(6166616,'Cajamarca','Chota','Tocmoche'),(6176617,'Cajamarca','Chota','San Juan De Licupis'),(6186618,'Cajamarca','Chota','Choropampa'),(6196619,'Cajamarca','Chota','Chalamarca'),(6326810,'Cajamarca','Jaen','Santa Rosa'),(6336811,'Cajamarca','Jaen','Las Pirias'),(6346812,'Cajamarca','Jaen','Huabal'),(6446910,'Cajamarca','Santa Cruz','Andabamba'),(6456911,'Cajamarca','Santa Cruz','Saucepampa'),(6466101,'Cajamarca','San Miguel','San Miguel'),(6476102,'Cajamarca','San Miguel','Calquis'),(6486103,'Cajamarca','San Miguel','La Florida'),(6496104,'Cajamarca','San Miguel','Llapa'),(6506105,'Cajamarca','San Miguel','Nanchoc'),(6516106,'Cajamarca','San Miguel','Niepos'),(6526107,'Cajamarca','San Miguel','San Gregorio'),(6536108,'Cajamarca','San Miguel','San Silvestre De Cochan'),(6546109,'Cajamarca','San Miguel','El Prado'),(6596111,'Cajamarca','San Ignacio','San Ignacio'),(6606112,'Cajamarca','San Ignacio','Chirinos'),(6616113,'Cajamarca','San Ignacio','Huarango'),(6626114,'Cajamarca','San Ignacio','Namballe'),(6636115,'Cajamarca','San Ignacio','La Coipa'),(6646116,'Cajamarca','San Ignacio','San Jose De Lourdes'),(6656117,'Cajamarca','San Ignacio','Tabaconas'),(6666121,'Cajamarca','San Marcos','Pedro Galvez'),(6676122,'Cajamarca','San Marcos','Ichocan'),(6686123,'Cajamarca','San Marcos','Gregorio Pita'),(6696124,'Cajamarca','San Marcos','Jose Manuel Quiroz'),(6706125,'Cajamarca','San Marcos','Eduardo Villanueva'),(6716126,'Cajamarca','San Marcos','Jose Sabogal'),(6726127,'Cajamarca','San Marcos','Chancay'),(6736131,'Cajamarca','San Pablo','San Pablo'),(6746132,'Cajamarca','San Pablo','San Bernardino'),(6756133,'Cajamarca','San Pablo','San Luis'),(6766134,'Cajamarca','San Pablo','Tumbaden'),(7507910,'Cusco','La Convencion','Pichari'),(7517101,'Cusco','Paruro','Paruro'),(7527102,'Cusco','Paruro','Accha'),(7537103,'Cusco','Paruro','Ccapi'),(7547104,'Cusco','Paruro','Colcha'),(7557105,'Cusco','Paruro','Huanoquite'),(7567106,'Cusco','Paruro','Omacha'),(7577107,'Cusco','Paruro','Yaurisque'),(7587108,'Cusco','Paruro','Paccaritambo'),(7597109,'Cusco','Paruro','Pillpinto'),(7607111,'Cusco','Paucartambo','Paucartambo'),(7617112,'Cusco','Paucartambo','Caicay'),(7627113,'Cusco','Paucartambo','Colquepata'),(7637114,'Cusco','Paucartambo','Challabamba'),(7647115,'Cusco','Paucartambo','Cosñipata'),(7657116,'Cusco','Paucartambo','Huancarani'),(7667121,'Cusco','Quispicanchi','Urcos'),(7677122,'Cusco','Quispicanchi','Andahuaylillas'),(7687123,'Cusco','Quispicanchi','Camanti'),(7697124,'Cusco','Quispicanchi','Ccarhuayo'),(7707125,'Cusco','Quispicanchi','Ccatca'),(7717126,'Cusco','Quispicanchi','Cusipata'),(7727127,'Cusco','Quispicanchi','Huaro'),(7737128,'Cusco','Quispicanchi','Lucre'),(7747129,'Cusco','Quispicanchi','Marcapata'),(7787131,'Cusco','Urubamba','Urubamba'),(7797132,'Cusco','Urubamba','Chinchero'),(7807133,'Cusco','Urubamba','Huayllabamba'),(7817134,'Cusco','Urubamba','Machupicchu'),(7827135,'Cusco','Urubamba','Maras'),(7837136,'Cusco','Urubamba','Ollantaytambo'),(7847137,'Cusco','Urubamba','Yucay'),(7938110,'Huancavelica','Huancavelica','Laria'),(7948111,'Huancavelica','Huancavelica','Manta'),(7958112,'Huancavelica','Huancavelica','Mariscal Caceres'),(7968113,'Huancavelica','Huancavelica','Moya'),(7978114,'Huancavelica','Huancavelica','Nuevo Occoro'),(7988115,'Huancavelica','Huancavelica','Palca'),(7998116,'Huancavelica','Huancavelica','Pilchaca'),(8008117,'Huancavelica','Huancavelica','Vilca'),(8018118,'Huancavelica','Huancavelica','Yauli'),(8028119,'Huancavelica','Huancavelica','Ascension'),(8038120,'Huancavelica','Huancavelica','Huando'),(8218310,'Huancavelica','Angaraes','Sto Tomas De Pata'),(8228311,'Huancavelica','Angaraes','Secclla'),(8238312,'Huancavelica','Angaraes','Ccochaccasa'),(8318410,'Huancavelica','Castrovirreyna','Huamatambo'),(8328414,'Huancavelica','Castrovirreyna','Mollepampa'),(8338422,'Huancavelica','Castrovirreyna','San Juan'),(8348427,'Huancavelica','Castrovirreyna','Tantara'),(8358428,'Huancavelica','Castrovirreyna','Ticrapo'),(8368429,'Huancavelica','Castrovirreyna','Santa Ana'),(8438511,'Huancavelica','Tayacaja','Huachocolpa'),(8448512,'Huancavelica','Tayacaja','Huaribamba'),(8458515,'Huancavelica','Tayacaja','Ñahuimpuquio'),(8468517,'Huancavelica','Tayacaja','Pazos'),(8478518,'Huancavelica','Tayacaja','Quishuar'),(8488519,'Huancavelica','Tayacaja','Salcabamba'),(8498520,'Huancavelica','Tayacaja','San Marcos De Rocchac'),(8508523,'Huancavelica','Tayacaja','Surcubamba'),(8518525,'Huancavelica','Tayacaja','Tintay Puncu'),(8528526,'Huancavelica','Tayacaja','Salcahuasi'),(8628610,'Huancavelica','Huaytara','San Antonio De Cusicancha'),(8638611,'Huancavelica','Huaytara','San Francisco De Sangayaico'),(8648612,'Huancavelica','Huaytara','San Isidro'),(8658613,'Huancavelica','Huaytara','Santiago De Chocorvos'),(8668614,'Huancavelica','Huaytara','Santiago De Quirahuara'),(8678615,'Huancavelica','Huaytara','Santo Domingo De Capillas'),(8688616,'Huancavelica','Huaytara','Tambo'),(8788710,'Huancavelica','Churcampa','Pachamarca'),(8889110,'Huanuco','Huanuco','Amarilis'),(8899111,'Huanuco','Huanuco','Pillco Marca'),(9009312,'Huanuco','Dos De Mayo','Marias'),(9019314,'Huanuco','Dos De Mayo','Pachas'),(9029316,'Huanuco','Dos De Mayo','Quivilla'),(9039317,'Huanuco','Dos De Mayo','Ripan'),(9049321,'Huanuco','Dos De Mayo','Shunqui'),(9059322,'Huanuco','Dos De Mayo','Sillapata'),(9069323,'Huanuco','Dos De Mayo','Yanas'),(9169410,'Huanuco','Huamalies','Singa'),(9179411,'Huanuco','Huamalies','Tantamayo'),(9409101,'Huanuco','Lauricocha','Jesus'),(9419102,'Huanuco','Lauricocha','Baños'),(9429103,'Huanuco','Lauricocha','San Francisco De Asis'),(9439104,'Huanuco','Lauricocha','Queropalca'),(9449105,'Huanuco','Lauricocha','San Miguel De Cauri'),(9459106,'Huanuco','Lauricocha','Rondos'),(9469107,'Huanuco','Lauricocha','Jivia'),(9479111,'Huanuco','Yarowilca','Chavinillo'),(9489112,'Huanuco','Yarowilca','Aparicio Pomares (chupan);'),(9499113,'Huanuco','Yarowilca','Cahuac'),(9509114,'Huanuco','Yarowilca','Chacabamba'),(9519115,'Huanuco','Yarowilca','Jacas Chico'),(9529116,'Huanuco','Yarowilca','Obas'),(9539117,'Huanuco','Yarowilca','Pampamarca'),(9549118,'Huanuco','Yarowilca','Choras'),(9551011,'Ica','Ica','Ica'),(9561012,'Ica','Ica','La Tinguiña'),(9571013,'Ica','Ica','Los Aquijes'),(9581014,'Ica','Ica','Parcona'),(9591015,'Ica','Ica','Pueblo Nuevo'),(9601016,'Ica','Ica','Salas'),(9611017,'Ica','Ica','San Jose De Los Molinos'),(9621018,'Ica','Ica','San Juan Bautista'),(9631019,'Ica','Ica','Santiago'),(9691021,'Ica','Chincha','Chincha Alta'),(9701022,'Ica','Chincha','Chavin'),(9711023,'Ica','Chincha','Chincha Baja'),(9721024,'Ica','Chincha','El Carmen'),(9731025,'Ica','Chincha','Grocio Prado'),(9741026,'Ica','Chincha','San Pedro De Huacarpana'),(9751027,'Ica','Chincha','Sunampe'),(9761028,'Ica','Chincha','Tambo De Mora'),(9771029,'Ica','Chincha','Alto Laran'),(9801031,'Ica','Nazca','Nazca'),(9811032,'Ica','Nazca','Changuillo'),(9821033,'Ica','Nazca','El Ingenio'),(9831034,'Ica','Nazca','Marcona'),(9841035,'Ica','Nazca','Vista Alegre'),(9851041,'Ica','Pisco','Pisco'),(9861042,'Ica','Pisco','Huancano'),(9871043,'Ica','Pisco','Humay'),(9881044,'Ica','Pisco','Independencia'),(9891045,'Ica','Pisco','Paracas'),(9901046,'Ica','Pisco','San Andres'),(9911047,'Ica','Pisco','San Clemente'),(9921048,'Ica','Pisco','Tupac Amaru Inca'),(9931051,'Ica','Palpa','Palpa'),(9941052,'Ica','Palpa','Llipata'),(9951053,'Ica','Palpa','Rio Grande'),(9961054,'Ica','Palpa','Santa Cruz'),(9971055,'Ica','Palpa','Tibillo'),(9981111,'Junín','Huancayo','Huancayo'),(9991113,'Junín','Huancayo','Carhuacallanga'),(10001114,'Junín','Huancayo','Colca'),(10011115,'Junín','Huancayo','Cullhuas'),(10021116,'Junín','Huancayo','Chacapampa'),(10031117,'Junín','Huancayo','Chicche'),(10041118,'Junín','Huancayo','Chilca'),(10051119,'Junín','Huancayo','Chongos Alto'),(10261121,'Junín','Concepcion','Concepcion'),(10271122,'Junín','Concepcion','Aco'),(10281123,'Junín','Concepcion','Andamarca'),(10291124,'Junín','Concepcion','Comas'),(10301125,'Junín','Concepcion','Cochas'),(10311126,'Junín','Concepcion','Chambara'),(10321127,'Junín','Concepcion','Heroinas Toledo'),(10331128,'Junín','Concepcion','Manzanares'),(10341129,'Junín','Concepcion','Mcal Castilla'),(10411131,'Junín','Jauja','Jauja'),(10421132,'Junín','Jauja','Acolla'),(10431133,'Junín','Jauja','Apata'),(10441134,'Junín','Jauja','Ataura'),(10451135,'Junín','Jauja','Canchaillo'),(10461136,'Junín','Jauja','El Mantaro'),(10471137,'Junín','Jauja','Huamali'),(10481138,'Junín','Jauja','Huaripampa'),(10491139,'Junín','Jauja','Huertas'),(10751141,'Junín','Junín','Junín'),(10761142,'Junín','Junín','Carhuamayo'),(10771143,'Junín','Junín','Ondores'),(10781144,'Junín','Junín','Ulcumayo'),(10791151,'Junín','Tarma','Tarma'),(10801152,'Junín','Tarma','Acobamba'),(10811153,'Junín','Tarma','Huaricolca'),(10821154,'Junín','Tarma','Huasahuasi'),(10831155,'Junín','Tarma','La Union'),(10841156,'Junín','Tarma','Palca'),(10851157,'Junín','Tarma','Palcamayo'),(10861158,'Junín','Tarma','San Pedro De Cajas'),(10871159,'Junín','Tarma','Tapo'),(10881161,'Junín','Yauli','La Oroya'),(10891162,'Junín','Yauli','Chacapalpa'),(10901163,'Junín','Yauli','Huay Huay'),(10911164,'Junín','Yauli','Marcapomacocha'),(10921165,'Junín','Yauli','Morococha'),(10931166,'Junín','Yauli','Paccha'),(10941167,'Junín','Yauli','Sta Barbara De Carhuacayan'),(10951168,'Junín','Yauli','Suitucancha'),(10961169,'Junín','Yauli','Yauli'),(10981171,'Junín','Satipo','Satipo'),(10991172,'Junín','Satipo','Coviriali'),(11001173,'Junín','Satipo','Llaylla'),(11011174,'Junín','Satipo','Mazamari'),(11021175,'Junín','Satipo','Pampa Hermosa'),(11031176,'Junín','Satipo','Pangoa'),(11041177,'Junín','Satipo','Rio Negro'),(11051178,'Junín','Satipo','Rio Tambo'),(11061181,'Junín','Chanchamayo','Chanchamayo'),(11071182,'Junín','Chanchamayo','San Ramon'),(11081183,'Junín','Chanchamayo','Vitoc'),(11091184,'Junín','Chanchamayo','San Luis De Shuaro'),(11101185,'Junín','Chanchamayo','Pichanaqui'),(11111186,'Junín','Chanchamayo','Perene'),(11121191,'Junín','Chupaca','Chupaca'),(11131192,'Junín','Chupaca','Ahuac'),(11141193,'Junín','Chupaca','Chongos Bajo'),(11151194,'Junín','Chupaca','Huachac'),(11161195,'Junín','Chupaca','Huamancaca Chico'),(11171196,'Junín','Chupaca','San Juan De Iscos'),(11181197,'Junín','Chupaca','San Juan De Jarpa'),(11191198,'Junín','Chupaca','Tres De Diciembre'),(11201199,'Junín','Chupaca','Yanacancha'),(11211211,'La Libertad','Trujillo','Trujillo'),(11221212,'La Libertad','Trujillo','Huanchaco'),(11231213,'La Libertad','Trujillo','Laredo'),(11241214,'La Libertad','Trujillo','Moche'),(11251215,'La Libertad','Trujillo','Salaverry'),(11261216,'La Libertad','Trujillo','Simbal'),(11271217,'La Libertad','Trujillo','Victor Larco Herrera'),(11281219,'La Libertad','Trujillo','Poroto'),(11321221,'La Libertad','Bolivar','Bolivar'),(11331222,'La Libertad','Bolivar','Bambamarca'),(11341223,'La Libertad','Bolivar','Condormarca'),(11351224,'La Libertad','Bolivar','Longotea'),(11361225,'La Libertad','Bolivar','Ucuncha'),(11371226,'La Libertad','Bolivar','Uchumarca'),(11381231,'La Libertad','Sanchez Carrion','Huamachuco'),(11391232,'La Libertad','Sanchez Carrion','Cochorco'),(11401233,'La Libertad','Sanchez Carrion','Curgos'),(11411234,'La Libertad','Sanchez Carrion','Chugay'),(11421235,'La Libertad','Sanchez Carrion','Marcabal'),(11431236,'La Libertad','Sanchez Carrion','Sanagoran'),(11441237,'La Libertad','Sanchez Carrion','Sarin'),(11451238,'La Libertad','Sanchez Carrion','Sartimbamba'),(11461241,'La Libertad','Otuzco','Otuzco'),(11471242,'La Libertad','Otuzco','Agallpampa'),(11481243,'La Libertad','Otuzco','Charat'),(11491244,'La Libertad','Otuzco','Huaranchal'),(11501245,'La Libertad','Otuzco','La Cuesta'),(11511248,'La Libertad','Otuzco','Paranday'),(11521249,'La Libertad','Otuzco','Salpo'),(11561251,'La Libertad','Pacasmayo','San Pedro De Lloc'),(11571253,'La Libertad','Pacasmayo','Guadalupe'),(11581254,'La Libertad','Pacasmayo','Jequetepeque'),(11591256,'La Libertad','Pacasmayo','Pacasmayo'),(11601258,'La Libertad','Pacasmayo','San Jose'),(11611261,'La Libertad','Pataz','Tayabamba'),(11621262,'La Libertad','Pataz','Buldibuyo'),(11631263,'La Libertad','Pataz','Chillia'),(11641264,'La Libertad','Pataz','Huaylillas'),(11651265,'La Libertad','Pataz','Huancaspata'),(11661266,'La Libertad','Pataz','Huayo'),(11671267,'La Libertad','Pataz','Ongon'),(11681268,'La Libertad','Pataz','Parcoy'),(11691269,'La Libertad','Pataz','Pataz'),(11741271,'La Libertad','Santiago De Chuco','Santiago De Chuco'),(11751272,'La Libertad','Santiago De Chuco','Cachicadan'),(11761273,'La Libertad','Santiago De Chuco','Mollebamba'),(11771274,'La Libertad','Santiago De Chuco','Mollepata'),(11781275,'La Libertad','Santiago De Chuco','Quiruvilca'),(11791276,'La Libertad','Santiago De Chuco','Santa Cruz De Chuca'),(11801277,'La Libertad','Santiago De Chuco','Sitabamba'),(11811278,'La Libertad','Santiago De Chuco','Angasmarca'),(11821281,'La Libertad','Ascope','Ascope'),(11831282,'La Libertad','Ascope','Chicama'),(11841283,'La Libertad','Ascope','Chocope'),(11851284,'La Libertad','Ascope','Santiago De Cao'),(11861285,'La Libertad','Ascope','Magdalena De Cao'),(11871286,'La Libertad','Ascope','Paijan'),(11881287,'La Libertad','Ascope','Razuri'),(11891288,'La Libertad','Ascope','Casa Grande'),(11901291,'La Libertad','Chepen','Chepen'),(11911292,'La Libertad','Chepen','Pacanga'),(11921293,'La Libertad','Chepen','Pueblo Nuevo'),(12041311,'Lambayeque','Chiclayo','Chiclayo'),(12051312,'Lambayeque','Chiclayo','Chongoyape'),(12061313,'Lambayeque','Chiclayo','Eten'),(12071314,'Lambayeque','Chiclayo','Eten Puerto'),(12081315,'Lambayeque','Chiclayo','Lagunas'),(12091316,'Lambayeque','Chiclayo','Monsefu'),(12101317,'Lambayeque','Chiclayo','Nueva Arica'),(12111318,'Lambayeque','Chiclayo','Oyotun'),(12121319,'Lambayeque','Chiclayo','Picsi'),(12241321,'Lambayeque','Ferreñafe','Ferreñafe'),(12251322,'Lambayeque','Ferreñafe','Incahuasi'),(12261323,'Lambayeque','Ferreñafe','Cañaris'),(12271324,'Lambayeque','Ferreñafe','Pitipo'),(12281325,'Lambayeque','Ferreñafe','Pueblo Nuevo'),(12291326,'Lambayeque','Ferreñafe','Manuel Antonio Mesones Muro'),(12301331,'Lambayeque','Lambayeque','Lambayeque'),(12311332,'Lambayeque','Lambayeque','Chochope'),(12321333,'Lambayeque','Lambayeque','Illimo'),(12331334,'Lambayeque','Lambayeque','Jayanca'),(12341335,'Lambayeque','Lambayeque','Mochumi'),(12351336,'Lambayeque','Lambayeque','Morrope'),(12361337,'Lambayeque','Lambayeque','Motupe'),(12371338,'Lambayeque','Lambayeque','Olmos'),(12381339,'Lambayeque','Lambayeque','Pacora'),(12421411,'Lima','Lima','Lima'),(12431412,'Lima','Lima','Ancon'),(12441413,'Lima','Lima','Ate'),(12451414,'Lima','Lima','Breña'),(12461415,'Lima','Lima','Carabayllo'),(12471416,'Lima','Lima','Comas'),(12481417,'Lima','Lima','Chaclacayo'),(12491418,'Lima','Lima','Chorrillos'),(12501419,'Lima','Lima','La Victoria'),(12851421,'Lima','Cajatambo','Cajatambo'),(12861425,'Lima','Cajatambo','Copa'),(12871426,'Lima','Cajatambo','Gorgor'),(12881427,'Lima','Cajatambo','Huancapon'),(12891428,'Lima','Cajatambo','Manas'),(12901431,'Lima','Canta','Canta'),(12911432,'Lima','Canta','Arahuay'),(12921433,'Lima','Canta','Huamantanga'),(12931434,'Lima','Canta','Huaros'),(12941435,'Lima','Canta','Lachaqui'),(12951436,'Lima','Canta','San Buenaventura'),(12961437,'Lima','Canta','Santa Rosa De Quives'),(12971441,'Lima','Cañete','San Vicente De Cañete'),(12981442,'Lima','Cañete','Calango'),(12991443,'Lima','Cañete','Cerro Azul'),(13001444,'Lima','Cañete','Coayllo'),(13011445,'Lima','Cañete','Chilca'),(13021446,'Lima','Cañete','Imperial'),(13031447,'Lima','Cañete','Lunahuana'),(13041448,'Lima','Cañete','Mala'),(13051449,'Lima','Cañete','Nuevo Imperial'),(13131451,'Lima','Huaura','Huacho'),(13141452,'Lima','Huaura','Ambar'),(13151454,'Lima','Huaura','Caleta De Carquin'),(13161455,'Lima','Huaura','Checras'),(13171456,'Lima','Huaura','Hualmay'),(13181457,'Lima','Huaura','Huaura'),(13191458,'Lima','Huaura','Leoncio Prado'),(13201459,'Lima','Huaura','Paccho'),(13251461,'Lima','Huarochiri','Matucana'),(13261462,'Lima','Huarochiri','Antioquia'),(13271463,'Lima','Huarochiri','Callahuanca'),(13281464,'Lima','Huarochiri','Carampoma'),(13291465,'Lima','Huarochiri','Casta'),(13301466,'Lima','Huarochiri','San Jose De Los Chorrillos'),(13311467,'Lima','Huarochiri','Chicla'),(13321468,'Lima','Huarochiri','Huanza'),(13331469,'Lima','Huarochiri','Huarochiri'),(13571471,'Lima','Yauyos','Yauyos'),(13581472,'Lima','Yauyos','Alis'),(13591473,'Lima','Yauyos','Ayauca'),(13601474,'Lima','Yauyos','Ayaviri'),(13611475,'Lima','Yauyos','Azangaro'),(13621476,'Lima','Yauyos','Cacra'),(13631477,'Lima','Yauyos','Carania'),(13641478,'Lima','Yauyos','Cochas'),(13651479,'Lima','Yauyos','Colonia'),(13901481,'Lima','Huaral','Huaral'),(13911482,'Lima','Huaral','Atavillos Alto'),(13921483,'Lima','Huaral','Atavillos Bajo'),(13931484,'Lima','Huaral','Aucallama'),(13941485,'Lima','Huaral','Chancay'),(13951486,'Lima','Huaral','Ihuari'),(13961487,'Lima','Huaral','Lampian'),(13971488,'Lima','Huaral','Pacaraos'),(13981489,'Lima','Huaral','San Miguel De Acos'),(14021491,'Lima','Barranca','Barranca'),(14031492,'Lima','Barranca','Paramonga'),(14041493,'Lima','Barranca','Pativilca'),(14051494,'Lima','Barranca','Supe'),(14061495,'Lima','Barranca','Supe Puerto'),(14131511,'Loreto','Maynas','Iquitos'),(14141512,'Loreto','Maynas','Alto Nanay'),(14151513,'Loreto','Maynas','Fernando Lores'),(14161514,'Loreto','Maynas','Las Amazonas'),(14171515,'Loreto','Maynas','Mazan'),(14181516,'Loreto','Maynas','Napo'),(14191517,'Loreto','Maynas','Putumayo'),(14201518,'Loreto','Maynas','Torres Causana'),(14261521,'Loreto','Alto Amazonas','Yurimaguas'),(14271522,'Loreto','Alto Amazonas','Balsapuerto'),(14281525,'Loreto','Alto Amazonas','Jeberos'),(14291526,'Loreto','Alto Amazonas','Lagunas'),(14321531,'Loreto','Loreto','Nauta'),(14331532,'Loreto','Loreto','Parinari'),(14341533,'Loreto','Loreto','Tigre'),(14351534,'Loreto','Loreto','Urarinas'),(14361535,'Loreto','Loreto','Trompeteros'),(14371541,'Loreto','Requena','Requena'),(14381542,'Loreto','Requena','Alto Tapiche'),(14391543,'Loreto','Requena','Capelo'),(14401544,'Loreto','Requena','Emilio San Martin'),(14411545,'Loreto','Requena','Maquia'),(14421546,'Loreto','Requena','Puinahua'),(14431547,'Loreto','Requena','Sapuena'),(14441548,'Loreto','Requena','Soplin'),(14451549,'Loreto','Requena','Tapiche'),(14481551,'Loreto','Ucayali','Contamana'),(14491552,'Loreto','Ucayali','Vargas Guerra'),(14501553,'Loreto','Ucayali','Padre Marquez'),(14511554,'Loreto','Ucayali','Pampa Hermoza'),(14521555,'Loreto','Ucayali','Sarayacu'),(14531556,'Loreto','Ucayali','Inahuaya'),(14541561,'Loreto','Mariscal Ramon Castilla','Mariscal Ramon Castilla'),(14551562,'Loreto','Mariscal Ramon Castilla','Pebas'),(14561563,'Loreto','Mariscal Ramon Castilla','Yavari'),(14571564,'Loreto','Mariscal Ramon Castilla','San Pablo'),(14581571,'Loreto','Datem Del Marañón','Barranca'),(14591572,'Loreto','Datem Del Marañón','Andoas'),(14601573,'Loreto','Datem Del Marañón','Cahuapanas'),(14611574,'Loreto','Datem Del Marañón','Manseriche'),(14621575,'Loreto','Datem Del Marañón','Morona'),(14631576,'Loreto','Datem Del Marañón','Pastaza'),(14641611,'Madre De Dios','Tambopata','Tambopata'),(14651612,'Madre De Dios','Tambopata','Inambari'),(14661613,'Madre De Dios','Tambopata','Las Piedras'),(14671614,'Madre De Dios','Tambopata','Laberinto'),(14681621,'Madre De Dios','Manu','Manu'),(14691622,'Madre De Dios','Manu','Fitzcarrald'),(14701623,'Madre De Dios','Manu','Madre De Dios'),(14711624,'Madre De Dios','Manu','Huepetuhe'),(14721631,'Madre De Dios','Tahuamanu','Iñapari'),(14731632,'Madre De Dios','Tahuamanu','Iberia'),(14741633,'Madre De Dios','Tahuamanu','Tahuamanu'),(14751711,'Moquegua','Mariscal Nieto','Moquegua'),(14761712,'Moquegua','Mariscal Nieto','Carumas'),(14771713,'Moquegua','Mariscal Nieto','Cuchumbaya'),(14781714,'Moquegua','Mariscal Nieto','San Cristobal'),(14791715,'Moquegua','Mariscal Nieto','Torata'),(14801716,'Moquegua','Mariscal Nieto','Samegua'),(14811721,'Moquegua','General Sanchez Cerro','Omate'),(14821722,'Moquegua','General Sanchez Cerro','Coalaque'),(14831723,'Moquegua','General Sanchez Cerro','Chojata'),(14841724,'Moquegua','General Sanchez Cerro','Ichuña'),(14851725,'Moquegua','General Sanchez Cerro','La Capilla'),(14861726,'Moquegua','General Sanchez Cerro','Lloque'),(14871727,'Moquegua','General Sanchez Cerro','Matalaque'),(14881728,'Moquegua','General Sanchez Cerro','Puquina'),(14891729,'Moquegua','General Sanchez Cerro','Quinistaquillas'),(14921731,'Moquegua','Ilo','Ilo'),(14931732,'Moquegua','Ilo','El Algarrobal'),(14941733,'Moquegua','Ilo','Pacocha'),(14951811,'Pasco','Pasco','Chaupimarca'),(14961813,'Pasco','Pasco','Huachon'),(14971814,'Pasco','Pasco','Huariaca'),(14981815,'Pasco','Pasco','Huayllay'),(14991816,'Pasco','Pasco','Ninacaca'),(15001817,'Pasco','Pasco','Pallanchacra'),(15011818,'Pasco','Pasco','Paucartambo'),(15021819,'Pasco','Pasco','San Fco De Asis De Yarusyacan'),(15081821,'Pasco','Daniel Alcides Carrion','Yanahuanca'),(15091822,'Pasco','Daniel Alcides Carrion','Chacayan'),(15101823,'Pasco','Daniel Alcides Carrion','Goyllarisquizga'),(15111824,'Pasco','Daniel Alcides Carrion','Paucar'),(15121825,'Pasco','Daniel Alcides Carrion','San Pedro De Pillao'),(15131826,'Pasco','Daniel Alcides Carrion','Santa Ana De Tusi'),(15141827,'Pasco','Daniel Alcides Carrion','Tapuc'),(15151828,'Pasco','Daniel Alcides Carrion','Vilcabamba'),(15161831,'Pasco','Oxapampa','Oxapampa'),(15171832,'Pasco','Oxapampa','Chontabamba'),(15181833,'Pasco','Oxapampa','Huancabamba'),(15191834,'Pasco','Oxapampa','Puerto Bermudez'),(15201835,'Pasco','Oxapampa','Villa Rica'),(15211836,'Pasco','Oxapampa','Pozuzo'),(15221837,'Pasco','Oxapampa','Palcazu'),(15231911,'Piura','Piura','Piura'),(15241913,'Piura','Piura','Castilla'),(15251914,'Piura','Piura','Catacaos'),(15261915,'Piura','Piura','La Arena'),(15271916,'Piura','Piura','La Union'),(15281917,'Piura','Piura','Las Lomas'),(15291919,'Piura','Piura','Tambo Grande'),(15321921,'Piura','Ayabaca','Ayabaca'),(15331922,'Piura','Ayabaca','Frias'),(15341923,'Piura','Ayabaca','Lagunas'),(15351924,'Piura','Ayabaca','Montero'),(15361925,'Piura','Ayabaca','Pacaipampa'),(15371926,'Piura','Ayabaca','Sapillica'),(15381927,'Piura','Ayabaca','Sicchez'),(15391928,'Piura','Ayabaca','Suyo'),(15401929,'Piura','Ayabaca','Jilili'),(15421931,'Piura','Huancabamba','Huancabamba'),(15431932,'Piura','Huancabamba','Canchaque'),(15441933,'Piura','Huancabamba','Huarmaca'),(15451934,'Piura','Huancabamba','Sondor'),(15461935,'Piura','Huancabamba','Sondorillo'),(15471936,'Piura','Huancabamba','El Carmen De La Frontera'),(15481937,'Piura','Huancabamba','San Miguel De El Faique'),(15491938,'Piura','Huancabamba','Lalaquiz'),(15501941,'Piura','Morropon','Chulucanas'),(15511942,'Piura','Morropon','Buenos Aires'),(15521943,'Piura','Morropon','Chalaco'),(15531944,'Piura','Morropon','Morropon'),(15541945,'Piura','Morropon','Salitral'),(15551946,'Piura','Morropon','Santa Catalina De Mossa'),(15561947,'Piura','Morropon','Santo Domingo'),(15571948,'Piura','Morropon','La Matanza'),(15581949,'Piura','Morropon','Yamango'),(15601951,'Piura','Paita','Paita'),(15611952,'Piura','Paita','Amotape'),(15621953,'Piura','Paita','Arenal'),(15631954,'Piura','Paita','La Huaca'),(15641955,'Piura','Paita','Pueblo Nuevo De Colan'),(15651956,'Piura','Paita','Tamarindo'),(15661957,'Piura','Paita','Vichayal'),(15671961,'Piura','Sullana','Sullana'),(15681962,'Piura','Sullana','Bellavista'),(15691963,'Piura','Sullana','Lancones'),(15701964,'Piura','Sullana','Marcavelica'),(15711965,'Piura','Sullana','Miguel Checa'),(15721966,'Piura','Sullana','Querecotillo'),(15731967,'Piura','Sullana','Salitral'),(15741968,'Piura','Sullana','Ignacio Escudero'),(15751971,'Piura','Talara','Pariñas'),(15761972,'Piura','Talara','El Alto'),(15771973,'Piura','Talara','La Brea'),(15781974,'Piura','Talara','Lobitos'),(15791975,'Piura','Talara','Mancora'),(15801976,'Piura','Talara','Los Organos'),(15811981,'Piura','Sechura','Sechura'),(15821982,'Piura','Sechura','Vice'),(15831983,'Piura','Sechura','Bernal'),(15841984,'Piura','Sechura','Bellavista De La Union'),(15851985,'Piura','Sechura','Cristo Nos Valga'),(15861986,'Piura','Sechura','Rinconada Llicuar'),(15872011,'Puno','Puno','Puno'),(15882012,'Puno','Puno','Acora'),(15892013,'Puno','Puno','Atuncolla'),(15902014,'Puno','Puno','Capachica'),(15912015,'Puno','Puno','Coata'),(15922016,'Puno','Puno','Chucuito'),(15932017,'Puno','Puno','Huata'),(15942018,'Puno','Puno','Mañazo'),(15952019,'Puno','Puno','Paucarcolla'),(16022021,'Puno','Azangaro','Azangaro'),(16032022,'Puno','Azangaro','Achaya'),(16042023,'Puno','Azangaro','Arapa'),(16052024,'Puno','Azangaro','Asillo'),(16062025,'Puno','Azangaro','Caminaca'),(16072026,'Puno','Azangaro','Chupa'),(16082027,'Puno','Azangaro','Jose Domingo Choquehuanca'),(16092028,'Puno','Azangaro','Muñani'),(16172031,'Puno','Carabaya','Macusani'),(16182032,'Puno','Carabaya','Ajoyani'),(16192033,'Puno','Carabaya','Ayapata'),(16202034,'Puno','Carabaya','Coasa'),(16212035,'Puno','Carabaya','Corani'),(16222036,'Puno','Carabaya','Crucero'),(16232037,'Puno','Carabaya','Ituata'),(16242038,'Puno','Carabaya','Ollachea'),(16252039,'Puno','Carabaya','San Gaban'),(16272041,'Puno','Chucuito','Juli'),(16282042,'Puno','Chucuito','Desaguadero'),(16292043,'Puno','Chucuito','Huacullani'),(16302046,'Puno','Chucuito','Pisacoma'),(16312047,'Puno','Chucuito','Pomata'),(16342051,'Puno','Huancane','Huancane'),(16352052,'Puno','Huancane','Cojata'),(16362054,'Puno','Huancane','Inchupalla'),(16372056,'Puno','Huancane','Pusi'),(16382057,'Puno','Huancane','Rosaspata'),(16392058,'Puno','Huancane','Taraco'),(16402059,'Puno','Huancane','Vilque Chico'),(16422061,'Puno','Lampa','Lampa'),(16432062,'Puno','Lampa','Cabanilla'),(16442063,'Puno','Lampa','Calapuja'),(16452064,'Puno','Lampa','Nicasio'),(16462065,'Puno','Lampa','Ocuviri'),(16472066,'Puno','Lampa','Palca'),(16482067,'Puno','Lampa','Paratia'),(16492068,'Puno','Lampa','Pucara'),(16502069,'Puno','Lampa','Santa Lucia'),(16522071,'Puno','Melgar','Ayaviri'),(16532072,'Puno','Melgar','Antauta'),(16542073,'Puno','Melgar','Cupi'),(16552074,'Puno','Melgar','Llalli'),(16562075,'Puno','Melgar','Macari'),(16572076,'Puno','Melgar','Nuñoa'),(16582077,'Puno','Melgar','Orurillo'),(16592078,'Puno','Melgar','Santa Rosa'),(16602079,'Puno','Melgar','Umachiri'),(16612081,'Puno','Sandia','Sandia'),(16622083,'Puno','Sandia','Cuyocuyo'),(16632084,'Puno','Sandia','Limbani'),(16642085,'Puno','Sandia','Phara'),(16652086,'Puno','Sandia','Patambuco'),(16662087,'Puno','Sandia','Quiaca'),(16672088,'Puno','Sandia','San Juan Del Oro'),(16712091,'Puno','San Roman','Juliaca'),(16722092,'Puno','San Roman','Cabana'),(16732093,'Puno','San Roman','Cabanillas'),(16742094,'Puno','San Roman','Caracoto'),(16962111,'San Martín','Moyobamba','Moyobamba'),(16972112,'San Martín','Moyobamba','Calzada'),(16982113,'San Martín','Moyobamba','Habana'),(16992114,'San Martín','Moyobamba','Jepelacio'),(17002115,'San Martín','Moyobamba','Soritor'),(17012116,'San Martín','Moyobamba','Yantalo'),(17022121,'San Martín','Huallaga','Saposoa'),(17032122,'San Martín','Huallaga','Piscoyacu'),(17042123,'San Martín','Huallaga','Sacanche'),(17052124,'San Martín','Huallaga','Tingo De Saposoa'),(17062125,'San Martín','Huallaga','Alto Saposoa'),(17072126,'San Martín','Huallaga','El Eslabon'),(17082131,'San Martín','Lamas','Lamas'),(17092133,'San Martín','Lamas','Barranquita'),(17102134,'San Martín','Lamas','Caynarachi'),(17112135,'San Martín','Lamas','Cuñumbuqui'),(17122136,'San Martín','Lamas','Pinto Recodo'),(17132137,'San Martín','Lamas','Rumisapa'),(17192141,'San Martín','Mariscal Caceres','Juanjui'),(17202142,'San Martín','Mariscal Caceres','Campanilla'),(17212143,'San Martín','Mariscal Caceres','Huicungo'),(17222144,'San Martín','Mariscal Caceres','Pachiza'),(17232145,'San Martín','Mariscal Caceres','Pajarillo'),(17242151,'San Martín','Rioja','Rioja'),(17252152,'San Martín','Rioja','Posic'),(17262153,'San Martín','Rioja','Yorongos'),(17272154,'San Martín','Rioja','Yuracyacu'),(17282155,'San Martín','Rioja','Nueva Cajamarca'),(17292156,'San Martín','Rioja','Elias Soplin'),(17302157,'San Martín','Rioja','San Fernando'),(17312158,'San Martín','Rioja','Pardo Miguel'),(17322159,'San Martín','Rioja','Awajun'),(17332161,'San Martín','San Martín','Tarapoto'),(17342162,'San Martín','San Martín','Alberto Leveau'),(17352164,'San Martín','San Martín','Cacatachi'),(17362166,'San Martín','San Martín','Chazuta'),(17372167,'San Martín','San Martín','Chipurana'),(17382168,'San Martín','San Martín','El Porvenir'),(17392169,'San Martín','San Martín','Huimbayoc'),(17472171,'San Martín','Bellavista','Bellavista'),(17482172,'San Martín','Bellavista','San Rafael'),(17492173,'San Martín','Bellavista','San Pablo'),(17502174,'San Martín','Bellavista','Alto Biavo'),(17512175,'San Martín','Bellavista','Huallaga'),(17522176,'San Martín','Bellavista','Bajo Biavo'),(17532181,'San Martín','Tocache','Tocache'),(17542182,'San Martín','Tocache','Nuevo Progreso'),(17552183,'San Martín','Tocache','Polvora'),(17562184,'San Martín','Tocache','Shunte'),(17572185,'San Martín','Tocache','Uchiza'),(17582191,'San Martín','Picota','Picota'),(17592192,'San Martín','Picota','Buenos Aires'),(17602193,'San Martín','Picota','Caspizapa'),(17612194,'San Martín','Picota','Pilluana'),(17622195,'San Martín','Picota','Pucacaca'),(17632196,'San Martín','Picota','San Cristobal'),(17642197,'San Martín','Picota','San Hilarion'),(17652198,'San Martín','Picota','Tingo De Ponasa'),(17662199,'San Martín','Picota','Tres Unidos'),(17732211,'Tacna','Tacna','Tacna'),(17742212,'Tacna','Tacna','Calana'),(17752214,'Tacna','Tacna','Inclan'),(17762217,'Tacna','Tacna','Pachia'),(17772218,'Tacna','Tacna','Palca'),(17782219,'Tacna','Tacna','Pocollay'),(17832221,'Tacna','Tarata','Tarata'),(17842225,'Tacna','Tarata','Heroes Albarracin'),(17852226,'Tacna','Tarata','Estique'),(17862227,'Tacna','Tarata','Estique Pampa'),(17912231,'Tacna','Jorge Basadre','Locumba'),(17922232,'Tacna','Jorge Basadre','Ite'),(17932233,'Tacna','Jorge Basadre','Ilabaya'),(17942241,'Tacna','Candarave','Candarave'),(17952242,'Tacna','Candarave','Cairani'),(17962243,'Tacna','Candarave','Curibaya'),(17972244,'Tacna','Candarave','Huanuara'),(17982245,'Tacna','Candarave','Quilahuani'),(17992246,'Tacna','Candarave','Camilaca'),(18002311,'Tumbes','Tumbes','Tumbes'),(18012312,'Tumbes','Tumbes','Corrales'),(18022313,'Tumbes','Tumbes','La Cruz'),(18032314,'Tumbes','Tumbes','Pampas De Hospital'),(18042315,'Tumbes','Tumbes','San Jacinto'),(18052316,'Tumbes','Tumbes','San Juan De La Virgen'),(18062321,'Tumbes','Contralmirante Villar','Zorritos'),(18072322,'Tumbes','Contralmirante Villar','Casitas'),(18082323,'Tumbes','Contralmirante Villar','Canoas De Punta Sal'),(18092331,'Tumbes','Zarumilla','Zarumilla'),(18102332,'Tumbes','Zarumilla','Matapalo'),(18112333,'Tumbes','Zarumilla','Papayal'),(18121010,'Ancash','Pallasca','Santa Rosa'),(18122334,'Tumbes','Zarumilla','Aguas Verdes'),(18132411,'Region Callao','Callao','Callao'),(18142412,'Region Callao','Callao','Bellavista'),(18152413,'Region Callao','Callao','La Punta'),(18162414,'Region Callao','Callao','Carmen De La Legua-reynoso'),(18172415,'Region Callao','Callao','La Perla'),(18182416,'Region Callao','Callao','Ventanilla'),(18192511,'Ucayali','Coronel Portillo','Calleria'),(18202512,'Ucayali','Coronel Portillo','Yarinacocha'),(18212513,'Ucayali','Coronel Portillo','Masisea'),(18221011,'Ancash','Pallasca','Tauca'),(18222514,'Ucayali','Coronel Portillo','Campoverde'),(18232515,'Ucayali','Coronel Portillo','Iparia'),(18242516,'Ucayali','Coronel Portillo','Nueva Requena'),(18252517,'Ucayali','Coronel Portillo','Manantay'),(18262521,'Ucayali','Padre Abad','Padre Abad'),(18272522,'Ucayali','Padre Abad','Yrazola'),(18282523,'Ucayali','Padre Abad','Curimana'),(18292531,'Ucayali','Atalaya','Raimondi'),(18302532,'Ucayali','Atalaya','Tahuania'),(18312533,'Ucayali','Atalaya','Yurua'),(18322534,'Ucayali','Atalaya','Sepahua'),(18332541,'Ucayali','Purus','Purus'),(19621210,'Ancash','Recuay','Catac'),(21521410,'Ancash','Sihuas','San Juan'),(24922010,'Ancash','Ocros','Santiago De Chilcas'),(53851010,'Ayacucho','Paucar Del Sara Sara','Sara Sara'),(54851110,'Ayacucho','Sucre','Chilcayoc'),(54951111,'Ayacucho','Sucre','Morcolla'),(65561010,'Cajamarca','San Miguel','Union Agua Blanca'),(65661011,'Cajamarca','San Miguel','Tongod'),(65761012,'Cajamarca','San Miguel','Catilluc'),(65861013,'Cajamarca','San Miguel','Bolivar'),(77571210,'Cusco','Quispicanchi','Ocongate'),(77671211,'Cusco','Quispicanchi','Oropesa'),(77771212,'Cusco','Quispicanchi','Quiquijana'),(96410110,'Ica','Ica','Subtanjalla'),(96510111,'Ica','Ica','Yauca Del Rosario'),(96610112,'Ica','Ica','Tate'),(96710113,'Ica','Ica','Pachacutec'),(96810114,'Ica','Ica','Ocucaje'),(97810210,'Ica','Chincha','Pueblo Nuevo'),(97910211,'Ica','Chincha','San Juan De Yanac'),(100611112,'Junín','Huancayo','Chupuro'),(100711113,'Junín','Huancayo','El Tambo'),(100811114,'Junín','Huancayo','Huacrapuquio'),(100911116,'Junín','Huancayo','Hualhuas'),(101011118,'Junín','Huancayo','Huancan'),(101111119,'Junín','Huancayo','Huasicancha'),(101211120,'Junín','Huancayo','Huayucachi'),(101311121,'Junín','Huancayo','Ingenio'),(101411122,'Junín','Huancayo','Pariahuanca'),(101511123,'Junín','Huancayo','Pilcomayo'),(101611124,'Junín','Huancayo','Pucara'),(101711125,'Junín','Huancayo','Quichuay'),(101811126,'Junín','Huancayo','Quilcas'),(101911127,'Junín','Huancayo','San Agustin'),(102011128,'Junín','Huancayo','San Jeronimo De Tunan'),(102111131,'Junín','Huancayo','Sto Domingo De Acobamba'),(102211132,'Junín','Huancayo','Saño'),(102311133,'Junín','Huancayo','Sapallanga'),(102411134,'Junín','Huancayo','Sicaya'),(102511136,'Junín','Huancayo','Viques'),(103511210,'Junín','Concepcion','Matahuasi'),(103611211,'Junín','Concepcion','Mito'),(103711212,'Junín','Concepcion','Nueve De Julio'),(103811213,'Junín','Concepcion','Orcotuna'),(103911214,'Junín','Concepcion','Sta Rosa De Ocopa'),(104011215,'Junín','Concepcion','San Jose De Quero'),(105011310,'Junín','Jauja','Janjaillo'),(105111311,'Junín','Jauja','Julcan'),(105211312,'Junín','Jauja','Leonor Ordoñez'),(105311313,'Junín','Jauja','Llocllapampa'),(105411314,'Junín','Jauja','Marco'),(105511315,'Junín','Jauja','Masma'),(105611316,'Junín','Jauja','Molinos'),(105711317,'Junín','Jauja','Monobamba'),(105811318,'Junín','Jauja','Muqui'),(105911319,'Junín','Jauja','Muquiyauyo'),(106011320,'Junín','Jauja','Paca'),(106111321,'Junín','Jauja','Paccha'),(106211322,'Junín','Jauja','Pancan'),(106311323,'Junín','Jauja','Parco'),(106411324,'Junín','Jauja','Pomacancha'),(106511325,'Junín','Jauja','Ricran'),(106611326,'Junín','Jauja','San Lorenzo'),(106711327,'Junín','Jauja','San Pedro De Chunan'),(106811328,'Junín','Jauja','Sincos'),(106911329,'Junín','Jauja','Tunan Marca'),(107011330,'Junín','Jauja','Yauli'),(107111331,'Junín','Jauja','Curicaca'),(107211332,'Junín','Jauja','Masma Chicche'),(107311333,'Junín','Jauja','Sausa'),(107411334,'Junín','Jauja','Yauyos'),(109711610,'Junín','Yauli','Sta Rosa De Sacco'),(112912110,'La Libertad','Trujillo','El Porvenir'),(113012111,'La Libertad','Trujillo','La Esperanza'),(113112112,'La Libertad','Trujillo','Florencia De Mora'),(115312410,'La Libertad','Otuzco','Sinsicap'),(115412411,'La Libertad','Otuzco','Usquil'),(115512413,'La Libertad','Otuzco','Mache'),(117012610,'La Libertad','Pataz','Pias'),(117112611,'La Libertad','Pataz','Taurija'),(117212612,'La Libertad','Pataz','Urpay'),(117312613,'La Libertad','Pataz','Santiago De Challas'),(119312101,'La Libertad','Julcan','Julcan'),(119412102,'La Libertad','Julcan','Carabamba'),(119512103,'La Libertad','Julcan','Calamarca'),(119612104,'La Libertad','Julcan','Huaso'),(119712111,'La Libertad','Gran Chimu','Cascas'),(119812112,'La Libertad','Gran Chimu','Lucma'),(119912113,'La Libertad','Gran Chimu','Marmot'),(120012114,'La Libertad','Gran Chimu','Sayapullo'),(120112121,'La Libertad','Viru','Viru'),(120212122,'La Libertad','Viru','Chao'),(120312123,'La Libertad','Viru','Guadalupito'),(121313110,'Lambayeque','Chiclayo','Pimentel'),(121413111,'Lambayeque','Chiclayo','Reque'),(121513112,'Lambayeque','Chiclayo','Jose Leonardo Ortiz'),(121613113,'Lambayeque','Chiclayo','Santa Rosa'),(121713114,'Lambayeque','Chiclayo','Saña'),(121813115,'Lambayeque','Chiclayo','La Victoria'),(121913116,'Lambayeque','Chiclayo','Cayalti'),(122013117,'Lambayeque','Chiclayo','Patapo'),(122113118,'Lambayeque','Chiclayo','Pomalca'),(122213119,'Lambayeque','Chiclayo','Pucala'),(122313120,'Lambayeque','Chiclayo','Tuman'),(123913310,'Lambayeque','Lambayeque','Salas'),(124013311,'Lambayeque','Lambayeque','San Jose'),(124113312,'Lambayeque','Lambayeque','Tucume'),(125114110,'Lima','Lima','La Molina'),(125214111,'Lima','Lima','Lince'),(125314112,'Lima','Lima','Lurigancho'),(125414113,'Lima','Lima','Lurin'),(125514114,'Lima','Lima','Magdalena Del Mar'),(125614115,'Lima','Lima','Miraflores'),(125714116,'Lima','Lima','Pachacamac'),(125814117,'Lima','Lima','Pueblo Libre'),(125914118,'Lima','Lima','Pucusana'),(126014119,'Lima','Lima','Puente Piedra'),(126114120,'Lima','Lima','Punta Hermosa'),(126214121,'Lima','Lima','Punta Negra'),(126314122,'Lima','Lima','Rimac'),(126414123,'Lima','Lima','San Bartolo'),(126514124,'Lima','Lima','San Isidro'),(126614125,'Lima','Lima','Barranco'),(126714126,'Lima','Lima','San Martin De Porres'),(126814127,'Lima','Lima','San Miguel'),(126914128,'Lima','Lima','Sta Maria Del Mar'),(127014129,'Lima','Lima','Santa Rosa'),(127114130,'Lima','Lima','Santiago De Surco'),(127214131,'Lima','Lima','Surquillo'),(127314132,'Lima','Lima','Villa Maria Del Triunfo'),(127414133,'Lima','Lima','Jesus Maria'),(127514134,'Lima','Lima','Independencia'),(127614135,'Lima','Lima','El Agustino'),(127714136,'Lima','Lima','San Juan De Miraflores'),(127814137,'Lima','Lima','San Juan De Lurigancho'),(127914138,'Lima','Lima','San Luis'),(128014139,'Lima','Lima','Cieneguilla'),(128114140,'Lima','Lima','San Borja'),(128214141,'Lima','Lima','Villa El Salvador'),(128314142,'Lima','Lima','Los Olivos'),(128414143,'Lima','Lima','Santa Anita'),(130614410,'Lima','Cañete','Pacaran'),(130714411,'Lima','Cañete','Quilmana'),(130814412,'Lima','Cañete','San Antonio'),(130914413,'Lima','Cañete','San Luis'),(131014414,'Lima','Cañete','Santa Cruz De Flores'),(131114415,'Lima','Cañete','Zuñiga'),(131214416,'Lima','Cañete','Asia'),(132114511,'Lima','Huaura','Santa Leonor'),(132214512,'Lima','Huaura','Santa Maria'),(132314513,'Lima','Huaura','Sayan'),(132414516,'Lima','Huaura','Vegueta'),(133414610,'Lima','Huarochiri','Lahuaytambo'),(133514611,'Lima','Huarochiri','Langa'),(133614612,'Lima','Huarochiri','Mariatana'),(133714613,'Lima','Huarochiri','Ricardo Palma'),(133814614,'Lima','Huarochiri','San Andres De Tupicocha'),(133914615,'Lima','Huarochiri','San Antonio'),(134014616,'Lima','Huarochiri','San Bartolome'),(134114617,'Lima','Huarochiri','San Damian'),(134214618,'Lima','Huarochiri','Sangallaya'),(134314619,'Lima','Huarochiri','San Juan De Tantaranche'),(134414620,'Lima','Huarochiri','San Lorenzo De Quinti'),(134514621,'Lima','Huarochiri','San Mateo'),(134614622,'Lima','Huarochiri','San Mateo De Otao'),(134714623,'Lima','Huarochiri','San Pedro De Huancayre'),(134814624,'Lima','Huarochiri','Santa Cruz De Cocachacra'),(134914625,'Lima','Huarochiri','Santa Eulalia'),(135014626,'Lima','Huarochiri','Santiago De Anchucaya'),(135114627,'Lima','Huarochiri','Santiago De Tuna'),(135214628,'Lima','Huarochiri','Santo Domingo De Los Olleros'),(135314629,'Lima','Huarochiri','Surco'),(135414630,'Lima','Huarochiri','Huachupampa'),(135514631,'Lima','Huarochiri','Laraos'),(135614632,'Lima','Huarochiri','San Juan De Iris'),(136614710,'Lima','Yauyos','Chocos'),(136714711,'Lima','Yauyos','Huampara'),(136814712,'Lima','Yauyos','Huancaya'),(136914713,'Lima','Yauyos','Huangascar'),(137014714,'Lima','Yauyos','Huantan'),(137114715,'Lima','Yauyos','Huañec'),(137214716,'Lima','Yauyos','Laraos'),(137314717,'Lima','Yauyos','Lincha'),(137414718,'Lima','Yauyos','Miraflores'),(137514719,'Lima','Yauyos','Omas'),(137614720,'Lima','Yauyos','Quinches'),(137714721,'Lima','Yauyos','Quinocay'),(137814722,'Lima','Yauyos','San Joaquin'),(137914723,'Lima','Yauyos','San Pedro De Pilas'),(138014724,'Lima','Yauyos','Tanta'),(138114725,'Lima','Yauyos','Tauripampa'),(138214726,'Lima','Yauyos','Tupe'),(138314727,'Lima','Yauyos','Tomas'),(138414728,'Lima','Yauyos','Viñac'),(138514729,'Lima','Yauyos','Vitis'),(138614730,'Lima','Yauyos','Hongos'),(138714731,'Lima','Yauyos','Madean'),(138814732,'Lima','Yauyos','Putinza'),(138914733,'Lima','Yauyos','Catahuasi'),(139914810,'Lima','Huaral','Veintisiete De Noviembre'),(140014811,'Lima','Huaral','Sta Cruz De Andamarca'),(140114812,'Lima','Huaral','Sumbilca'),(140714101,'Lima','Oyon','Oyon'),(140814102,'Lima','Oyon','Navan'),(140914103,'Lima','Oyon','Caujul'),(141014104,'Lima','Oyon','Andajes'),(141114105,'Lima','Oyon','Pachangara'),(141214106,'Lima','Oyon','Cochamarca'),(142115110,'Loreto','Maynas','Indiana'),(142215111,'Loreto','Maynas','Punchana'),(142315112,'Loreto','Maynas','Belen'),(142415113,'Loreto','Maynas','San Juan Bautista'),(142515114,'Loreto','Maynas','Tnte Manuel Clavero'),(143015210,'Loreto','Alto Amazonas','Santa Cruz'),(143115211,'Loreto','Alto Amazonas','Tnte Cesar Lopez Rojas'),(144615410,'Loreto','Requena','Jenaro Herrera'),(144715411,'Loreto','Requena','Yaquerana'),(149017210,'Moquegua','General Sanchez Cerro','Ubinas'),(149117211,'Moquegua','General Sanchez Cerro','Yunga'),(150318110,'Pasco','Pasco','Simon Bolivar'),(150418111,'Pasco','Pasco','Ticlacayan'),(150518112,'Pasco','Pasco','Tinyahuarco'),(150618113,'Pasco','Pasco','Vicco'),(150718114,'Pasco','Pasco','Yanacancha'),(153019113,'Piura','Piura','Cura Mori'),(153119114,'Piura','Piura','El Tallan'),(154119210,'Piura','Ayabaca','Paimas'),(155919410,'Piura','Morropon','San Juan De Bigote'),(159620110,'Puno','Puno','Pichacani'),(159720111,'Puno','Puno','San Antonio'),(159820112,'Puno','Puno','Tiquillaca'),(159920113,'Puno','Puno','Vilque'),(160020114,'Puno','Puno','Plateria'),(160120115,'Puno','Puno','Amantani'),(161020210,'Puno','Azangaro','Potoni'),(161120212,'Puno','Azangaro','Saman'),(161220213,'Puno','Azangaro','San Anton'),(161320214,'Puno','Azangaro','San Jose'),(161420215,'Puno','Azangaro','San Juan De Salinas'),(161520216,'Puno','Azangaro','Stgo De Pupuja'),(161620217,'Puno','Azangaro','Tirapata'),(162620310,'Puno','Carabaya','Usicayos'),(163220410,'Puno','Chucuito','Zepita'),(163320412,'Puno','Chucuito','Kelluyo'),(164120511,'Puno','Huancane','Huatasani'),(165120610,'Puno','Lampa','Vilavila'),(166820810,'Puno','Sandia','Yanahuaya'),(166920811,'Puno','Sandia','Alto Inambari'),(167020812,'Puno','Sandia','San Pedro De Putina Punco'),(167520101,'Puno','Yunguyo','Yunguyo'),(167620102,'Puno','Yunguyo','Unicachi'),(167720103,'Puno','Yunguyo','Anapia'),(167820104,'Puno','Yunguyo','Copani'),(167920105,'Puno','Yunguyo','Cuturapi'),(168020106,'Puno','Yunguyo','Ollaraya'),(168120107,'Puno','Yunguyo','Tinicachi'),(168220111,'Puno','San Antonio De Putina','Putina'),(168320112,'Puno','San Antonio De Putina','Pedro Vilca Apaza'),(168420113,'Puno','San Antonio De Putina','Quilca Puncu'),(168520114,'Puno','San Antonio De Putina','Ananea'),(168620115,'Puno','San Antonio De Putina','Sina'),(168720121,'Puno','El Collao','Ilave'),(168820122,'Puno','El Collao','Pilcuyo'),(168920123,'Puno','El Collao','Santa Rosa'),(169020124,'Puno','El Collao','Capaso'),(169120125,'Puno','El Collao','Conduriri'),(169220131,'Puno','Moho','Moho'),(169320132,'Puno','Moho','Conima'),(169420133,'Puno','Moho','Tilali'),(169520134,'Puno','Moho','Huayrapata'),(171421311,'San Martín','Lamas','Shanao'),(171521313,'San Martín','Lamas','Tabalosos'),(171621314,'San Martín','Lamas','Zapatero'),(171721315,'San Martín','Lamas','Alonso De Alvarado'),(171821316,'San Martín','Lamas','San Roque De Cumbaza'),(174021610,'San Martín','San Martín','Juan Guerra'),(174121611,'San Martín','San Martín','Morales'),(174221612,'San Martín','San Martín','Papaplaya'),(174321616,'San Martín','San Martín','San Antonio'),(174421619,'San Martín','San Martín','Sauce'),(174521620,'San Martín','San Martín','Shapaja'),(174621621,'San Martín','San Martín','La Banda De Shilcayo'),(176721910,'San Martín','Picota','Shamboyacu'),(176821101,'San Martín','El Dorado','San Jose De Sisa'),(176921102,'San Martín','El Dorado','Agua Blanca'),(177021103,'San Martín','El Dorado','Shatoja'),(177121104,'San Martín','El Dorado','San Martin'),(177221105,'San Martín','El Dorado','Santa Rosa'),(177922110,'Tacna','Tacna','Sama'),(178022111,'Tacna','Tacna','Alto De La Alianza'),(178122112,'Tacna','Tacna','Ciudad Nueva'),(178222113,'Tacna','Tacna','Coronel Gregorio Albarracin L.'),(178722210,'Tacna','Tarata','Sitajara'),(178822211,'Tacna','Tarata','Susapaya'),(178922212,'Tacna','Tarata','Tarucachi'),(179022213,'Tacna','Tarata','Ticaco');
/*!40000 ALTER TABLE `ubigeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(200) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `direccion` text NOT NULL,
  `idUsuarioSuperior` int NOT NULL,
  `estado` int NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `idUsuarioRegistro` int NOT NULL,
  `idUsuarioActualiza` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_usuario_superior_idx` (`idUsuarioSuperior`),
  KEY `fk_usu_act_idx` (`idUsuarioActualiza`),
  KEY `fk_usu_regis_2_idx` (`idUsuarioRegistro`),
  CONSTRAINT `fk_usu_act_2` FOREIGN KEY (`idUsuarioActualiza`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_usu_regis_2` FOREIGN KEY (`idUsuarioRegistro`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_usuario_superior` FOREIGN KEY (`idUsuarioSuperior`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis Alberto','Sanchez Quispe ','74747474','luis','$2a$10$Z7/zwEFEV3L14ghsKapFj.tZKLiBvqCR84PwN9jG/bZA8ePDIUqru','luis@gmail.com','2000-10-10','Av Lima 123',1,1,'2022-04-04 10:59:07','2022-04-04 10:59:07',1,1),(2,'Ana','Flores Enero','87485965','ana','$2a$10$LX8ieXOpuhSzh9vxHU/rT.tckqFXfUJzylDYT1w61fRTp5cap9htG','ana@gmail.com','1997-10-10','Av Lince 787',1,1,'2022-04-04 10:59:07','2022-04-04 10:59:07',1,1),(3,'Juana','Arcos Gutierrez','85747478','juana','$2a$10$jtmeFyUrF9WHiIuR34VPgenBhHiX6muRo5O.0msO0OuwbEkrTnRu6','juana@gmail.com','1997-10-10','Av Mangomarca 987',1,1,'2022-04-04 10:59:07','2022-04-04 10:59:07',1,1),(4,'Gina','Alavarado Gutierrez','74859685','gina','$2a$10$l35uptN65JghrdX51XDkLOK29ie1wK0eRUcTd5BYz5na0X3auoUZ.','gina@gmail.com','1997-10-10','Av Mangomarca 987',2,1,'2022-04-04 10:59:07','2022-04-04 10:59:07',1,1),(5,'Pedro','Pedro Rosales','87485854','pedro','$2a$10$6341YJ1RtaQb0lJscJ5a8OK09OBDGixmmp/uDFEw/trG.Do0Zp2L6','pedro@gmail.com','1997-10-10','Av Mangomarca 987',3,1,'2022-04-04 10:59:07','2022-04-04 10:59:07',1,1),(6,'Luciana','Jacinto Arcos','74858585','lucianaAAA','$2a$10$6BI.s7b3IxbWKfAG1Vc1UOIqYfVoWun0LtkTmJZDqbI6K4QKQNlrC','luciana@gmail.com','1997-10-10','Av Mangomarca 987',4,0,'2022-04-03 22:59:07','2024-06-30 18:48:20',4,4),(7,'LeonardoAC','Gutarra Quispe','74858574','leonardo','$2a$10$lngAGIxr.vFYnLxBE39BmO6h.FaZlf0KY.bQ96Ehwmr6JeqQ8hP9K','leonardo@gmail.com','1997-10-10','Av Mangomarca 987',4,0,'2022-04-03 22:59:07','2024-06-30 16:40:14',4,4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tiene_rol`
--

DROP TABLE IF EXISTS `usuario_tiene_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_tiene_rol` (
  `idUsuario` int NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idRol`),
  KEY `fk_usuario_has_rol_rol1_idx` (`idRol`),
  KEY `fk_usuario_has_rol_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_usuario_has_rol_rol1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `fk_usuario_has_rol_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tiene_rol`
--

LOCK TABLES `usuario_tiene_rol` WRITE;
/*!40000 ALTER TABLE `usuario_tiene_rol` DISABLE KEYS */;
INSERT INTO `usuario_tiene_rol` VALUES (1,1),(2,2),(3,2),(4,3),(5,3),(6,4),(7,4);
/*!40000 ALTER TABLE `usuario_tiene_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistema_prestamo_2024_05_01_security'
--

--
-- Dumping routines for database 'sistema_prestamo_2024_05_01_security'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-21 18:19:50
