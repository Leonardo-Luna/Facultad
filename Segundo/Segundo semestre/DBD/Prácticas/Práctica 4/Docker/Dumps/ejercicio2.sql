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
INSERT INTO `Arbol` VALUES (1,'Eucalipto',5,'Av. Libertador',100,1001),(2,'Pino',10,'Calle Falsa',200,2002),(3,'Roble',15,'Calle Mayor',300,3003),(4,'Sauce',3,'Calle Menor',400,4004),(5,'Ciprs',7,'Calle Larga',500,5005),(10,'Eucalipto',5,'Av. Libertador',100,101),(11,'Pino',10,'Calle Falsa',200,202),(12,'Roble',15,'Calle Mayor',300,303),(13,'Sauce',3,'Calle Menor',400,404),(14,'Ciprs',7,'Calle Larga',500,505),(15,'lamo',12,'Calle Nueva',600,606),(16,'Conferas',8,'Calle Secundaria',700,707);
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
INSERT INTO `Localidad` VALUES (101,'Centro','Zona comercial y cultural',15000),(202,'Norte','rea residencial con parques',12000),(303,'Sur','Sector industrial y comercial',8000),(404,'Este','Zona de oficinas y negocios',5000),(505,'Oeste','rea rural y agrcola',3000),(606,'La Plata','Localidad educativa',20000),(707,'Salta','Zona turstica y cultural',18000),(1001,'Centro','Zona comercial y cultural',15000),(2002,'Norte','rea residencial con parques',12000),(3003,'Sur','Sector industrial y comercial',8000),(4004,'Este','Zona de oficinas y negocios',5000),(5005,'Oeste','rea rural y agrcola',3000);
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
INSERT INTO `Poda` VALUES (1,'2023-06-15',12345678,1),(2,'2023-07-20',23456789,2),(3,'2023-08-10',34567890,3),(4,'2023-09-05',45678901,4),(5,'2023-10-01',56789012,5),(10,'2022-06-15',10000001,10),(11,'2023-07-20',20000002,11),(12,'2023-08-10',30000003,12),(13,'2022-09-05',40000004,13),(14,'2024-01-01',60000006,14),(15,'2023-10-01',70000007,15);
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
  `fnac` varchar(50) DEFAULT NULL,
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
INSERT INTO `Podador` VALUES (10000001,'Juan','Prez','555-1234','1980-01-15',101),(12345678,'Juan','Prez','555-1234','1980-01-15',1001),(20000002,'Jos','Garca','555-2345','1990-02-20',202),(23456789,'Mara','Gmez','555-2345','1990-02-20',2002),(30000003,'Luis','Martnez','555-3456','1985-03-25',303),(34567890,'Luis','Martnez','555-3456','1985-03-25',3003),(40000004,'Ana','Rodrguez','555-4567','1975-04-30',404),(45678901,'Ana','Rodrguez','555-4567','1975-04-30',4004),(50000005,'Carlos','Hernndez','555-5678','1995-05-05',505),(56789012,'Carlos','Hernndez','555-5678','1995-05-05',5005),(60000006,'Mara','Zapata','555-6789','1988-06-15',606),(70000007,'Miguel','Serrano','555-7890','1982-07-20',707);
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

-- Dump completed on 2024-10-26 16:58:28
