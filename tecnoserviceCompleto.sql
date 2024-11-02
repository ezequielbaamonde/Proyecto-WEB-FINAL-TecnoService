-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tecnoservice_users
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `amd`
--

DROP TABLE IF EXISTS `amd`;
/*!50001 DROP VIEW IF EXISTS `amd`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `amd` (
  `id_producto` tinyint NOT NULL,
  `nombre_producto` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `codigo_producto` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `stock` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `berazategui`
--

DROP TABLE IF EXISTS `berazategui`;
/*!50001 DROP VIEW IF EXISTS `berazategui`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `berazategui` (
  `cp` tinyint NOT NULL,
  `pais` tinyint NOT NULL,
  `provincia` tinyint NOT NULL,
  `localidad` tinyint NOT NULL,
  `direccion` tinyint NOT NULL,
  `id_cliente` tinyint NOT NULL,
  `id_personal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dni_cliente` varchar(8) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ezequiel','Baamonde','1128964374','baamonde.ezequiel@gmail.com','45782596');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `dni_cuarenta`
--

DROP TABLE IF EXISTS `dni_cuarenta`;
/*!50001 DROP VIEW IF EXISTS `dni_cuarenta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dni_cuarenta` (
  `id_cliente` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `dni_cliente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domicilio` (
  `cp` int(11) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_personal` int(11) DEFAULT NULL,
  PRIMARY KEY (`cp`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `domicilio_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` VALUES (1885,'Argentina','Buenos Aires','Berazategui','Calle 49 N°3364',1,NULL),(1886,'Argentina','Buenos Aires','Berazategui','Calle 51 N°2987',NULL,1);
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL AUTO_INCREMENT,
  `cp` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `cp` (`cp`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`cp`) REFERENCES `domicilio` (`cp`),
  CONSTRAINT `envios_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `envios_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,1885,1,3);
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion`
--

DROP TABLE IF EXISTS `gestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `id_personal` int(11) DEFAULT NULL,
  `cant_horas` int(11) NOT NULL,
  `turno_laboral` varchar(100) NOT NULL,
  `sueldo_bruto` int(11) NOT NULL,
  `dia_pago` varchar(100) NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `gestion_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
INSERT INTO `gestion` VALUES (1,1,30,'Noche',6300,'12 noviembre 2022');
/*!40000 ALTER TABLE `gestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `intel`
--

DROP TABLE IF EXISTS `intel`;
/*!50001 DROP VIEW IF EXISTS `intel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `intel` (
  `id_producto` tinyint NOT NULL,
  `nombre_producto` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `codigo_producto` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `stock` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `noche`
--

DROP TABLE IF EXISTS `noche`;
/*!50001 DROP VIEW IF EXISTS `noche`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `noche` (
  `id_personal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_salida` date NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (3,1,1,'2022-11-12','2022-11-14');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `sector` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `dni_personal` varchar(100) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `valor_hora` float NOT NULL,
  PRIMARY KEY (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Fabricio','Gonzalez','Mantenimiento','Reparacion Netbooks','45679234','1109876543',210);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `precio_menor`
--

DROP TABLE IF EXISTS `precio_menor`;
/*!50001 DROP VIEW IF EXISTS `precio_menor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `precio_menor` (
  `nombre_producto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `codigo_producto` int(100) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Intel I3 3600G','Intel','Microprocesadores',1,25999,20),(2,'AMD Ryzen 3 3600G','AMD','Microprocesadores',2,26999,10);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_productos` int(11) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `nombre_proveedor` varchar(100) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `cp` (`cp`),
  KEY `id_productos` (`id_productos`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`cp`) REFERENCES `domicilio` (`cp`),
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,1,NULL,'Intel BA','4210-2681','intel.productos@corporacion.com'),(2,2,NULL,'AMD BA','4210-2782','amd.productos@corporacion.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sector_mantenimiento`
--

DROP TABLE IF EXISTS `sector_mantenimiento`;
/*!50001 DROP VIEW IF EXISTS `sector_mantenimiento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sector_mantenimiento` (
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `cargo` tinyint NOT NULL,
  `dni_personal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stock_mas10`
--

DROP TABLE IF EXISTS `stock_mas10`;
/*!50001 DROP VIEW IF EXISTS `stock_mas10`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stock_mas10` (
  `id_producto` tinyint NOT NULL,
  `nombre_producto` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `codigo_producto` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `stock` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `sueldo_tresmil`
--

DROP TABLE IF EXISTS `sueldo_tresmil`;
/*!50001 DROP VIEW IF EXISTS `sueldo_tresmil`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sueldo_tresmil` (
  `id_horario` tinyint NOT NULL,
  `id_personal` tinyint NOT NULL,
  `cant_horas` tinyint NOT NULL,
  `turno_laboral` tinyint NOT NULL,
  `sueldo_bruto` tinyint NOT NULL,
  `dia_pago` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_microprocesadores`
--

DROP TABLE IF EXISTS `vista_microprocesadores`;
/*!50001 DROP VIEW IF EXISTS `vista_microprocesadores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_microprocesadores` (
  `id_producto` tinyint NOT NULL,
  `nombre_producto` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `codigo_producto` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `stock` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `amd`
--

/*!50001 DROP TABLE IF EXISTS `amd`*/;
/*!50001 DROP VIEW IF EXISTS `amd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amd` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`nombre_producto` AS `nombre_producto`,`productos`.`marca` AS `marca`,`productos`.`categoria` AS `categoria`,`productos`.`codigo_producto` AS `codigo_producto`,`productos`.`precio` AS `precio`,`productos`.`stock` AS `stock` from `productos` where `productos`.`marca` = 'AMD' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `berazategui`
--

/*!50001 DROP TABLE IF EXISTS `berazategui`*/;
/*!50001 DROP VIEW IF EXISTS `berazategui`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `berazategui` AS select `domicilio`.`cp` AS `cp`,`domicilio`.`pais` AS `pais`,`domicilio`.`provincia` AS `provincia`,`domicilio`.`localidad` AS `localidad`,`domicilio`.`direccion` AS `direccion`,`domicilio`.`id_cliente` AS `id_cliente`,`domicilio`.`id_personal` AS `id_personal` from `domicilio` where `domicilio`.`localidad` = 'Berazategui' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dni_cuarenta`
--

/*!50001 DROP TABLE IF EXISTS `dni_cuarenta`*/;
/*!50001 DROP VIEW IF EXISTS `dni_cuarenta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dni_cuarenta` AS select `clientes`.`id_cliente` AS `id_cliente`,`clientes`.`nombres` AS `nombres`,`clientes`.`apellidos` AS `apellidos`,`clientes`.`telefono` AS `telefono`,`clientes`.`email` AS `email`,`clientes`.`dni_cliente` AS `dni_cliente` from `clientes` where `clientes`.`dni_cliente` >= 40000000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `intel`
--

/*!50001 DROP TABLE IF EXISTS `intel`*/;
/*!50001 DROP VIEW IF EXISTS `intel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `intel` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`nombre_producto` AS `nombre_producto`,`productos`.`marca` AS `marca`,`productos`.`categoria` AS `categoria`,`productos`.`codigo_producto` AS `codigo_producto`,`productos`.`precio` AS `precio`,`productos`.`stock` AS `stock` from `productos` where `productos`.`marca` = 'Intel' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `noche`
--

/*!50001 DROP TABLE IF EXISTS `noche`*/;
/*!50001 DROP VIEW IF EXISTS `noche`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `noche` AS select `gestion`.`id_personal` AS `id_personal` from `gestion` where `gestion`.`turno_laboral` = 'Noche' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `precio_menor`
--

/*!50001 DROP TABLE IF EXISTS `precio_menor`*/;
/*!50001 DROP VIEW IF EXISTS `precio_menor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `precio_menor` AS select `productos`.`nombre_producto` AS `nombre_producto` from `productos` where `productos`.`precio` <= 26000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sector_mantenimiento`
--

/*!50001 DROP TABLE IF EXISTS `sector_mantenimiento`*/;
/*!50001 DROP VIEW IF EXISTS `sector_mantenimiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sector_mantenimiento` AS select `personal`.`nombres` AS `nombres`,`personal`.`apellidos` AS `apellidos`,`personal`.`cargo` AS `cargo`,`personal`.`dni_personal` AS `dni_personal` from `personal` where `personal`.`sector` = 'Mantenimiento' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_mas10`
--

/*!50001 DROP TABLE IF EXISTS `stock_mas10`*/;
/*!50001 DROP VIEW IF EXISTS `stock_mas10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_mas10` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`nombre_producto` AS `nombre_producto`,`productos`.`marca` AS `marca`,`productos`.`categoria` AS `categoria`,`productos`.`codigo_producto` AS `codigo_producto`,`productos`.`precio` AS `precio`,`productos`.`stock` AS `stock` from `productos` where `productos`.`stock` >= 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sueldo_tresmil`
--

/*!50001 DROP TABLE IF EXISTS `sueldo_tresmil`*/;
/*!50001 DROP VIEW IF EXISTS `sueldo_tresmil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sueldo_tresmil` AS select `gestion`.`id_horario` AS `id_horario`,`gestion`.`id_personal` AS `id_personal`,`gestion`.`cant_horas` AS `cant_horas`,`gestion`.`turno_laboral` AS `turno_laboral`,`gestion`.`sueldo_bruto` AS `sueldo_bruto`,`gestion`.`dia_pago` AS `dia_pago` from `gestion` where `gestion`.`sueldo_bruto` >= 3000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_microprocesadores`
--

/*!50001 DROP TABLE IF EXISTS `vista_microprocesadores`*/;
/*!50001 DROP VIEW IF EXISTS `vista_microprocesadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_microprocesadores` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`nombre_producto` AS `nombre_producto`,`productos`.`marca` AS `marca`,`productos`.`categoria` AS `categoria`,`productos`.`codigo_producto` AS `codigo_producto`,`productos`.`precio` AS `precio`,`productos`.`stock` AS `stock` from `productos` where `productos`.`categoria` = 'Microprocesadores' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13 12:11:44
