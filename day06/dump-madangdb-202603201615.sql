-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: madangdb
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `bookid` int NOT NULL,
  `bookname` varchar(40) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (1,'축구의 역사','굿스포츠',7000),(2,'축구 아는 여자','나무수',13000),(3,'축구의 이해','대한미디어',22000),(4,'골프 바이블','대한미디어',35000),(5,'피겨 교본','굿스포츠',8000),(6,'배구 단계별기술','굿스포츠',6000),(7,'야구의 추억','이상미디어',20000),(8,'야구를 부탁해','이상미디어',13000),(9,'올림픽 이야기','삼성당',7500),(10,'Olympic Champions','Pearson',13000),(11,'스포츠의학','한솔의학서적',90000),(12,'스포츠의학2','한솔의학서적',NULL),(14,'스포츠의학3','Human Kinetics',NULL),(21,'Zen Golf','Pearson',12000),(22,'Soccer Skills','Human Kinetics',15000),(31,'살면서 한번은 벽돌','글항아리',19500),(32,'100년 쓰는 완벽 허리','한즈미디어',19800),(33,'60일 영어 습관','시원스쿨닷컴',18900),(40,'에이리언 어스','20세기미디어',20000);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `custid` int NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'박지성','영국 맨체스타','000-5000-0001'),(2,'김연아','대한민국 서울','000-6000-0001'),(3,'김연경','대한민국 경기도','000-7000-0001'),(4,'추신수','미국 클리블랜드','000-8000-0001'),(5,'박세리','대한민국 부산','010-9090-0909');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idx_Book`
--

DROP TABLE IF EXISTS `Idx_Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Idx_Book` (
  `bookid` int NOT NULL,
  `bookname` varchar(40) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `releaseyear` int DEFAULT NULL,
  `price` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`bookid`),
  KEY `idx_bookname` (`bookname`),
  KEY `idx_book_isbn_releaseyear` (`releaseyear`,`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idx_Book`
--

LOCK TABLES `Idx_Book` WRITE;
/*!40000 ALTER TABLE `Idx_Book` DISABLE KEYS */;
INSERT INTO `Idx_Book` VALUES (1,'프로젝트 헤일메리','미디어','9789111111111',2022,18000);
/*!40000 ALTER TABLE `Idx_Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imported_Book`
--

DROP TABLE IF EXISTS `Imported_Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Imported_Book` (
  `bookid` int DEFAULT NULL,
  `bookname` varchar(40) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imported_Book`
--

LOCK TABLES `Imported_Book` WRITE;
/*!40000 ALTER TABLE `Imported_Book` DISABLE KEYS */;
INSERT INTO `Imported_Book` VALUES (21,'Zen Golf','Pearson',12000),(22,'Soccer Skills','Human Kinetics',15000);
/*!40000 ALTER TABLE `Imported_Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noidx_Book`
--

DROP TABLE IF EXISTS `Noidx_Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Noidx_Book` (
  `bookid` int DEFAULT NULL,
  `bookname` varchar(40) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `releaseyear` int DEFAULT NULL,
  `price` decimal(8,0) DEFAULT NULL,
  UNIQUE KEY `idx_book` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noidx_Book`
--

LOCK TABLES `Noidx_Book` WRITE;
/*!40000 ALTER TABLE `Noidx_Book` DISABLE KEYS */;
INSERT INTO `Noidx_Book` VALUES (NULL,'프로젝트 헤일메리','미디어','9789111111111',2022,18000);
/*!40000 ALTER TABLE `Noidx_Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `orderid` int NOT NULL,
  `custid` int DEFAULT NULL,
  `bookid` int DEFAULT NULL,
  `saleprice` int DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `custid` (`custid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `Customer` (`custid`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `Book` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,1,6000,'2024-07-01'),(2,1,3,21000,'2024-07-03'),(3,2,5,8000,'2024-07-03'),(4,3,6,6000,'2024-07-04'),(5,4,7,20000,'2024-07-05'),(6,1,2,12000,'2024-07-07'),(7,4,8,13000,'2024-07-07'),(8,3,10,12000,'2024-07-08'),(9,2,10,7000,'2024-07-09'),(10,3,8,13000,'2024-07-10');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL,
  `owner` varchar(40) NOT NULL,
  `balance` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Kim',9000),(2,'Lee',15000),(3,'Sung',9000);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (4,'Ashely',3000),(5,'Bread',7000),(6,'Canton',6000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_orders`
--

DROP TABLE IF EXISTS `v_orders`;
/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_orders` AS SELECT 
 1 AS `custid`,
 1 AS `name`,
 1 AS `bookid`,
 1 AS `bookname`,
 1 AS `price`,
 1 AS `orderid`,
 1 AS `saleprice`,
 1 AS `orderdate`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'madangdb'
--

--
-- Final view structure for view `v_orders`
--

/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`madang`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orders` AS select `c`.`custid` AS `custid`,`c`.`name` AS `name`,`b`.`bookid` AS `bookid`,`b`.`bookname` AS `bookname`,`b`.`price` AS `price`,`o`.`orderid` AS `orderid`,`o`.`saleprice` AS `saleprice`,`o`.`orderdate` AS `orderdate` from ((`Customer` `c` join `Orders` `o` on((`c`.`custid` = `o`.`custid`))) join `Book` `b` on((`o`.`bookid` = `b`.`bookid`))) */;
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

-- Dump completed on 2026-03-20 16:15:06
