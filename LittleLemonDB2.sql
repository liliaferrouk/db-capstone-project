-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb2
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTableNo` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `booking_customer_fk_idx` (`CustomerID`),
  CONSTRAINT `booking_customer_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-08-12',2,4),(2,'2023-08-13',4,3),(3,'2023-08-14',6,2),(4,'2023-08-14',12,1);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `CustomerFullName` varchar(45) NOT NULL,
  `ContactNumber` varchar(20) NOT NULL,
  `Email` varchar(200) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Customer1','0549147755','c1@gmail.com'),(2,'Customer2','0549147565','c2@gmail.com'),(3,'Customer3','0533147755','c3@gmail.com'),(4,'Customer4','0549144755','c4@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL,
  `EmployeeRole` varchar(45) NOT NULL,
  `EmployeeSalary` varchar(20) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Manager','$70,000'),(2,'Assistant Manager','$65,000'),(3,'Head Chef','$50,000'),(4,'Assistant Chef','$45,000'),(5,'Head Waiter','$40,000'),(6,'Receptionist','$35,000');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemID` int NOT NULL,
  `ItemName` varchar(45) NOT NULL,
  `ItemType` varchar(20) NOT NULL,
  `ItemPrice` decimal(10,0) NOT NULL,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Olives','Starters',5),(2,'Minestrone','Starters',10),(3,'Falafel','Starters',5);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `menuitemswithmorethan2ordersview`
--

DROP TABLE IF EXISTS `menuitemswithmorethan2ordersview`;
/*!50001 DROP VIEW IF EXISTS `menuitemswithmorethan2ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menuitemswithmorethan2ordersview` AS SELECT 
 1 AS `ItemName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL,
  `Cuisine` varchar(45) NOT NULL,
  `MenuItemID` int NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `menus_menuitems_fk_idx` (`MenuItemID`),
  CONSTRAINT `menus_menuitems_fk` FOREIGN KEY (`MenuItemID`) REFERENCES `menuitems` (`MenuItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Greek',1),(2,'Italian',2),(3,'Turkish',3);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverystatus`
--

DROP TABLE IF EXISTS `orderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystatus` (
  `OrderDeliveryStatusID` int NOT NULL,
  `DeliveryStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderDeliveryStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverystatus`
--

LOCK TABLES `orderdeliverystatus` WRITE;
/*!40000 ALTER TABLE `orderdeliverystatus` DISABLE KEYS */;
INSERT INTO `orderdeliverystatus` VALUES (1,'not yet'),(2,'not yet'),(3,'delivered'),(4,'not yet'),(5,'delivered');
/*!40000 ALTER TABLE `orderdeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordermorethan150view`
--

DROP TABLE IF EXISTS `ordermorethan150view`;
/*!50001 DROP VIEW IF EXISTS `ordermorethan150view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordermorethan150view` AS SELECT 
 1 AS `CustomerID`,
 1 AS `CustomerFullName`,
 1 AS `OrderID`,
 1 AS `Cost`,
 1 AS `ItemName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `OrderQuantity` int NOT NULL,
  `BookingID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `OrderStatusID` int NOT NULL,
  `MenuID` int NOT NULL,
  `Cost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `booking_order_fk_idx` (`BookingID`),
  KEY `Employee_order_fk_idx` (`EmployeeID`),
  KEY `order_status_fk_idx` (`OrderStatusID`),
  KEY `Menu_order_fk_idx` (`MenuID`),
  CONSTRAINT `booking_order_fk` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`),
  CONSTRAINT `Employee_order_fk` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `Menu_order_fk` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`),
  CONSTRAINT `order_status_fk` FOREIGN KEY (`OrderStatusID`) REFERENCES `orderdeliverystatus` (`OrderDeliveryStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,2,1,1,2,200),(2,1,1,2,2,1,250),(3,2,3,2,3,3,100),(4,2,2,3,4,2,200);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `OrderQuantity`,
 1 AS `Cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `menuitemswithmorethan2ordersview`
--

/*!50001 DROP VIEW IF EXISTS `menuitemswithmorethan2ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `menuitemswithmorethan2ordersview` AS select `menuitems`.`ItemName` AS `ItemName` from `menuitems` where `menuitems`.`MenuItemID` in (select `menus`.`MenuItemID` from `menus` where `menus`.`MenuID` in (select `orders`.`MenuID` from `orders` where (`orders`.`OrderQuantity` > 2))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordermorethan150view`
--

/*!50001 DROP VIEW IF EXISTS `ordermorethan150view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordermorethan150view` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`CustomerFullName` AS `CustomerFullName`,`o`.`OrderID` AS `OrderID`,`o`.`Cost` AS `Cost`,`i`.`ItemName` AS `ItemName` from ((((`customers` `c` join `bookings` `b`) join `orders` `o`) join `menus` `m`) join `menuitems` `i` on(((`c`.`CustomerID` = `b`.`CustomerID`) and (`b`.`BookingID` = `o`.`BookingID`) and (`o`.`MenuID` = `m`.`MenuID`) and (`m`.`MenuItemID` = `i`.`MenuItemID`)))) where (`o`.`Cost` > 150) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`OrderQuantity` AS `OrderQuantity`,`orders`.`Cost` AS `Cost` from `orders` where (`orders`.`OrderQuantity` > 2) */;
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

-- Dump completed on 2023-08-04 22:28:07
