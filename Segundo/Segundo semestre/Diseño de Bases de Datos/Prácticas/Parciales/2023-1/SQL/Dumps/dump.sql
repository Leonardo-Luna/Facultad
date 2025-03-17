-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: parcial
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
-- Table structure for table `Articulos`
--

DROP TABLE IF EXISTS `Articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Articulos` (
  `codigoArticulo` int NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantExist` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigoArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Articulos`
--

LOCK TABLES `Articulos` WRITE;
/*!40000 ALTER TABLE `Articulos` DISABLE KEYS */;
INSERT INTO `Articulos` VALUES (1,'Electrnica','Smartphone',50,300.00),(2,'Electrodomstico','Aspiradora',20,150.00),(3,'Electrnica','Tablet',30,200.00),(4,'Hogar','Sof',10,500.00),(5,'Electrodomstico','Microondas',25,100.00),(6,'Electrnica','Laptop',15,800.00);
/*!40000 ALTER TABLE `Articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `nroClte` int NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `domicilio` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nroClte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Gonzlez','Mara','Calle Falsa 123','123456789'),(2,'Prez','Juan','Av. Siempre Viva 742','987654321'),(3,'Rodrguez','Ana','Calle Luna 456','654987321'),(4,'Snchez','Luis','Av. Central 789','321654987'),(5,'Martnez','Carlos','Calle Sol 987','456123789'),(6,'Fernndez','Laura','Calle Norte 1024','789654123');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PedidoArticulo`
--

DROP TABLE IF EXISTS `PedidoArticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PedidoArticulo` (
  `nroPedido` int NOT NULL,
  `codigoArticulo` int NOT NULL,
  `cantPedido` int DEFAULT NULL,
  PRIMARY KEY (`nroPedido`,`codigoArticulo`),
  KEY `codigoArticulo` (`codigoArticulo`),
  CONSTRAINT `PedidoArticulo_ibfk_1` FOREIGN KEY (`nroPedido`) REFERENCES `Pedidos` (`nroPedido`),
  CONSTRAINT `PedidoArticulo_ibfk_2` FOREIGN KEY (`codigoArticulo`) REFERENCES `Articulos` (`codigoArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PedidoArticulo`
--

LOCK TABLES `PedidoArticulo` WRITE;
/*!40000 ALTER TABLE `PedidoArticulo` DISABLE KEYS */;
INSERT INTO `PedidoArticulo` VALUES (1,1,2),(1,2,1),(2,2,1),(2,3,2),(3,3,3),(4,4,1),(5,5,2),(6,1,1);
/*!40000 ALTER TABLE `PedidoArticulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedidos`
--

DROP TABLE IF EXISTS `Pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedidos` (
  `nroPedido` int NOT NULL,
  `fechaPedido` date DEFAULT NULL,
  `fechaEnvio` date DEFAULT NULL,
  `nroClte` int DEFAULT NULL,
  PRIMARY KEY (`nroPedido`),
  KEY `nroClte` (`nroClte`),
  CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`nroClte`) REFERENCES `Cliente` (`nroClte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedidos`
--

LOCK TABLES `Pedidos` WRITE;
/*!40000 ALTER TABLE `Pedidos` DISABLE KEYS */;
INSERT INTO `Pedidos` VALUES (1,'2023-10-01','2023-11-07',1),(2,'2023-10-02','2023-11-07',2),(3,'2023-10-03','2023-10-10',3),(4,'2023-10-04','2023-10-12',4),(5,'2023-10-05','2023-10-15',5),(6,'2023-10-06','2023-11-07',6);
/*!40000 ALTER TABLE `Pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RemitoArticulo`
--

DROP TABLE IF EXISTS `RemitoArticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RemitoArticulo` (
  `nroRemito` int NOT NULL,
  `codigoArticulo` int NOT NULL,
  `cantRemito` int DEFAULT NULL,
  `precioVenta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`nroRemito`,`codigoArticulo`),
  KEY `codigoArticulo` (`codigoArticulo`),
  CONSTRAINT `RemitoArticulo_ibfk_1` FOREIGN KEY (`nroRemito`) REFERENCES `Remitos` (`nroRemito`),
  CONSTRAINT `RemitoArticulo_ibfk_2` FOREIGN KEY (`codigoArticulo`) REFERENCES `Articulos` (`codigoArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RemitoArticulo`
--

LOCK TABLES `RemitoArticulo` WRITE;
/*!40000 ALTER TABLE `RemitoArticulo` DISABLE KEYS */;
INSERT INTO `RemitoArticulo` VALUES (1,1,1,290.00),(1,2,1,145.00),(2,2,1,145.00),(2,3,1,190.00),(3,3,3,195.00),(4,4,1,495.00),(5,5,2,95.00),(6,1,1,290.00);
/*!40000 ALTER TABLE `RemitoArticulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Remitos`
--

DROP TABLE IF EXISTS `Remitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Remitos` (
  `nroRemito` int NOT NULL,
  `fechaRemito` date DEFAULT NULL,
  `nroPedido` int DEFAULT NULL,
  PRIMARY KEY (`nroRemito`),
  KEY `nroPedido` (`nroPedido`),
  CONSTRAINT `Remitos_ibfk_1` FOREIGN KEY (`nroPedido`) REFERENCES `Pedidos` (`nroPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Remitos`
--

LOCK TABLES `Remitos` WRITE;
/*!40000 ALTER TABLE `Remitos` DISABLE KEYS */;
INSERT INTO `Remitos` VALUES (1,'2023-11-07',1),(2,'2023-11-07',2),(3,'2023-10-11',3),(4,'2023-10-13',4),(5,'2023-10-16',5),(6,'2023-11-07',6);
/*!40000 ALTER TABLE `Remitos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 19:53:14

