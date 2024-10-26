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
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `DNI` int DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Carlos','Gomez',12345678,'123-456-7890','123 Elm St'),(2,'Ana','Lopez',87654321,'234-567-8901','456 Maple Ave'),(3,'Luis','Martinez',11223344,'345-678-9012','789 Oak Rd'),(4,'Maria','Hernandez',55667788,'456-789-0123','101 Pine Dr'),(5,'Jose','Rodriguez',99887766,'567-890-1234','202 Cedar St'),(6,'Pablo','Perez',22334455,'123-456-7890','789 Pine St'),(7,'Lucia','Lopez',33445566,'234-567-8901','101 Maple Ave'),(8,'Carlos','Martinez',45789456,'345-678-9012','404 Oak Rd'),(9,'Sandra','Alvarez',55667788,'221-123-4567','505 Cedar St'),(10,'Laura','Morales',66778899,'567-890-1234','606 Birch St'),(12,'Pablo','Perez',11223344,'123-456-7890','789 Pine St'),(13,'Lucia','Lopez',22334455,'234-567-8901','101 Maple Ave'),(14,'Carlos','Martinez',33445566,'345-678-9012','404 Oak Rd'),(15,'Sandra','Alvarez',55667788,'221-123-4567','505 Cedar St'),(16,'Laura','Morales',66778899,'567-890-1234','606 Birch St'),(500002,'Jorge Luis','Castor',40578999,'221-4400789','11 entre 500 y 501 nro:2587'),(500003,'Jorge Luis','Castor',40578999,'221-4400789','11 entre 500 y 501 nro:2587');
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
INSERT INTO `Detalle` VALUES (1001,1,1,800),(1001,2,2,25),(1002,3,1,75),(1003,4,1,200),(1004,5,3,150),(1007,6,2,50),(1008,6,1,50),(1008,7,1,75),(1009,10,3,120),(1011,9,20000,500),(1012,11,1,50),(1012,12,1,75),(1013,11,1,50),(1014,11,1,50),(1015,15,1,120),(1017,14,20000,500);
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
  `hora` time DEFAULT NULL,
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
INSERT INTO `Factura` VALUES (1001,250.5,'2024-10-25','14:30:00',1),(1002,150.75,'2024-10-26','15:00:00',2),(1003,300,'2024-10-27','16:45:00',3),(1004,450.25,'2024-10-28','12:15:00',4),(1005,200.9,'2024-10-29','13:20:00',5),(1006,1200,'2017-05-10','10:30:00',7),(1007,350,'2024-10-30','11:45:00',8),(1008,400,'2024-11-01','09:15:00',9),(1009,500,'2019-06-10','14:00:00',6),(1011,10000001,'2024-12-20','13:30:00',5),(1012,1200,'2017-05-10','10:30:00',13),(1013,350,'2024-10-30','11:45:00',14),(1014,400,'2024-11-01','09:15:00',15),(1015,500,'2019-06-10','14:00:00',12),(1017,10000001,'2024-12-20','13:30:00',16);
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
INSERT INTO `Producto` VALUES (1,'Laptop','15-inch laptop',800,10),(2,'Mouse','Wireless mouse',25,50),(3,'Keyboard','Mechanical keyboard',75,30),(4,'Monitor','27-inch monitor',200,20),(5,'Printer','Inkjet printer',150,15),(6,'prod1','First product',50,100),(7,'prod2','Second product',75,200),(8,'prod3','Third product',100,150),(9,'Z','Product Z',500,25),(10,'prod38','Special product',120,60),(11,'prod1','First product',50,100),(12,'prod2','Second product',75,200),(13,'prod3','Third product',100,150),(14,'Z','Product Z',500,25),(15,'prod38','Special product',120,60);
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

-- Dump completed on 2024-10-26 15:46:57
