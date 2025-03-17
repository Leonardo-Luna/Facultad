-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: ejercicio1
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
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `idCliente` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Juan','Prez','45789456','2211234567','Calle Falsa 123'),(2,'Ana','Garca','12345678','2217654321','Avenida Siempre Viva 742'),(3,'Luis','Fernndez','87654321','2212345678','Boulevard de los sueos 456'),(4,'Mara','Lpez','23456789','2219876543','Calle Real 456'),(5,'Pedro','Martnez','34567890','2216543210','Avenida Libertad 321'),(6,'Sofa','Rodrguez','45678901','2213214567','Calle del Sol 789'),(7,'Javier','Snchez','56789012','2214567890','Plaza Mayor 101'),(8,'Carla','Jimnez','67890123','2218765432','Avenida del Mar 202'),(9,'Felipe','Ramrez','78901234','2215432167','Calle del Bosque 303'),(10,'Natalia','Vsquez','89012345','2216789012','Calle de la Paz 404');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle`
--

DROP TABLE IF EXISTS `Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle` (
  `nroTicket` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precioUnitario` double DEFAULT NULL,
  PRIMARY KEY (`nroTicket`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `Detalle_ibfk_1` FOREIGN KEY (`nroTicket`) REFERENCES `Factura` (`nroTicket`),
  CONSTRAINT `Detalle_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle`
--

LOCK TABLES `Detalle` WRITE;
/*!40000 ALTER TABLE `Detalle` DISABLE KEYS */;
INSERT INTO `Detalle` VALUES (101,2,1,200),(102,1,1,100),(103,3,1,150),(104,4,1,250),(105,5,2,300),(106,6,3,120),(107,7,1,180),(108,8,4,90),(109,9,2,60),(110,10,1,75);
/*!40000 ALTER TABLE `Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Factura` (
  `nroTicket` int NOT NULL,
  `total` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  PRIMARY KEY (`nroTicket`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
INSERT INTO `Factura` VALUES (101,300,'2019-05-01','10:00',1),(102,100,'2020-01-15','14:30',1),(103,200,'2020-02-20','09:00',2),(104,150,'2019-07-10','12:00',3),(105,400,'2021-03-05','16:00',4),(106,500,'2020-08-22','18:30',5),(107,600,'2019-12-12','11:15',6),(108,250,'2020-06-30','15:45',7),(109,300,'2021-01-25','09:30',8),(110,150,'2020-09-15','10:15',9);
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto` (
  `idProducto` int NOT NULL,
  `nombreP` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `precio` double DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (1,'prod38','Descripcin del producto 38',100,50),(2,'prod1','Descripcin del producto 1',200,30),(3,'prod2','Descripcin del producto 2',150,20),(4,'prod3','Descripcin del producto 3',250,15),(5,'prod4','Descripcin del producto 4',300,10),(6,'prod5','Descripcin del producto 5',120,5),(7,'prod6','Descripcin del producto 6',180,40),(8,'prod7','Descripcin del producto 7',90,25),(9,'prod8','Descripcin del producto 8',75,60),(10,'prod9','Descripcin del producto 9',60,80);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-27  0:00:45
