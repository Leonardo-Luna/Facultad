-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: ejercicio2
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Arbol`
--

DROP TABLE IF EXISTS `Arbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arbol` (
  `nroArbol` int NOT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `anios` int DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `nro` int DEFAULT NULL,
  `codigoPostal` int DEFAULT NULL,
  PRIMARY KEY (`nroArbol`),
  KEY `codigoPostal` (`codigoPostal`),
  CONSTRAINT `Arbol_ibfk_1` FOREIGN KEY (`codigoPostal`) REFERENCES `Localidad` (`codigoPostal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arbol`
--

LOCK TABLES `Arbol` WRITE;
/*!40000 ALTER TABLE `Arbol` DISABLE KEYS */;
INSERT INTO `Arbol` VALUES (10,'Coniferas',20,'Calle A',123,1000),(11,'Pino',15,'Calle B',456,1000),(12,'Roble',30,'Calle C',789,2000),(13,'Eucalipto',25,'Calle D',101,3000),(14,'Fresno',40,'Calle E',112,4000),(15,'Coniferas',10,'Calle F',131,5000),(16,'Jacarand',8,'Calle G',415,6000),(17,'Cedro',12,'Calle H',789,7000),(18,'Pino',18,'Calle I',321,8000),(19,'Roble',50,'Calle J',654,9000);
/*!40000 ALTER TABLE `Arbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Localidad`
--

DROP TABLE IF EXISTS `Localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Localidad` (
  `codigoPostal` int NOT NULL,
  `nombreL` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `cantHabitantes` int DEFAULT NULL,
  PRIMARY KEY (`codigoPostal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Localidad`
--

LOCK TABLES `Localidad` WRITE;
/*!40000 ALTER TABLE `Localidad` DISABLE KEYS */;
INSERT INTO `Localidad` VALUES (1000,'La Plata','Ciudad capital de la provincia de Buenos Aires',800000),(1001,'Mar del Plata','Ciudad en la costa de Buenos Aires',500000),(2000,'Salta','Ciudad capital de la provincia de Salta',600000),(3000,'Cordoba','Ciudad capital de la provincia de Cordoba',1500000),(4000,'Rosario','Ciudad en la provincia de Santa Fe',1200000),(5000,'Mendoza','Ciudad capital de la provincia de Mendoza',1150000),(6000,'Neuquen','Ciudad capital de la provincia de Neuquen',300000),(7000,'Tucuman','Ciudad capital de la provincia de Tucuman',900000),(8000,'Jujuy','Ciudad capital de la provincia de Jujuy',400000),(9000,'Santa Fe','Ciudad capital de la provincia de Santa Fe',700000);
/*!40000 ALTER TABLE `Localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poda`
--

DROP TABLE IF EXISTS `Poda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Poda` (
  `codPoda` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `DNI` int DEFAULT NULL,
  `nroArbol` int DEFAULT NULL,
  PRIMARY KEY (`codPoda`),
  KEY `DNI` (`DNI`),
  KEY `nroArbol` (`nroArbol`),
  CONSTRAINT `Poda_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `Podador` (`DNI`),
  CONSTRAINT `Poda_ibfk_2` FOREIGN KEY (`nroArbol`) REFERENCES `Arbol` (`nroArbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poda`
--

LOCK TABLES `Poda` WRITE;
/*!40000 ALTER TABLE `Poda` DISABLE KEYS */;
INSERT INTO `Poda` VALUES (10,'2023-03-15',22234566,10),(11,'2023-05-20',33345677,11),(12,'2022-08-10',44456788,12),(13,'2023-06-30',55567899,13),(14,'2022-09-05',66678900,14),(15,'2024-02-18',88890122,15),(16,'2024-04-22',99901233,16),(17,'2023-07-13',22234566,12),(18,'2023-11-20',33345677,18),(19,'2022-12-01',44456788,19);
/*!40000 ALTER TABLE `Poda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Podador`
--

DROP TABLE IF EXISTS `Podador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Podador` (
  `DNI` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  `codigoPostalVive` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `codigoPostalVive` (`codigoPostalVive`),
  CONSTRAINT `Podador_ibfk_1` FOREIGN KEY (`codigoPostalVive`) REFERENCES `Localidad` (`codigoPostal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Podador`
--

LOCK TABLES `Podador` WRITE;
/*!40000 ALTER TABLE `Podador` DISABLE KEYS */;
INSERT INTO `Podador` VALUES (11112334,'Luis','Tomas','987123654','1991-06-15',8000),(22223445,'Clara','Hernandez','456123789','1989-09-09',9000),(22234566,'Juan','Perez','123456789','1990-05-10',1000),(33345677,'Jose','Garcia','987654321','1985-07-22',1000),(44456788,'Ana','Lopez','456789123','1992-03-15',2000),(55567899,'Maria','Rodriguez','321654987','1988-12-30',3000),(66678900,'Carlos','Gonzalez','789123456','1995-08-08',4000),(77789011,'Marta','Martinez','654321987','1993-11-25',5000),(88890122,'Raul','Balata','213546879','1980-02-02',6000),(99901233,'Lucia','Zapata','321789654','1987-01-11',7000);
/*!40000 ALTER TABLE `Podador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-27 20:59:25
