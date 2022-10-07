-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: dbimport
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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `year` int NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Turgenev Ivan Sergeevich',1834,'Russia'),(2,'Lermontov Mihail Yur\'evich',1828,'Russia'),(3,'Pushkin Alexandr Sergeevich',1814,'Russia'),(4,'Tolstoy Lev Nikolaevich',1847,'Russia'),(5,'Gogol Nikolay Vasil\'evich',1827,'Russia'),(6,'Ray Douglas Bradbury',1942,'USA'),(7,'George Orwell',1935,'UK'),(8,'Jack London',1895,'USA'),(9,'Stephen Edwin King',1967,'USA'),(10,'Paulo Coelho',1987,'Brasil'),(11,'Haruki Murakami',1979,'Japan'),(12,'Janusz Leon Wiśniewski',2001,'Poland'),(13,'Ernest Miller Hemingway',1917,'USA'),(14,'Erich Paul Remark',1920,'German'),(15,'Gabriel Garcia Marquez',1947,'Colombia'),(16,'Oscar Wilde',1878,'Ireland'),(17,'Harper Lee',1950,'USA'),(18,'Chuck Palahniuk',1996,'USA'),(19,'Eli Fray',2015,'Russia'),(20,'Kurt Vonnegut',1950,'USA');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `year` int NOT NULL,
  `genre` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `mood_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Otsi i deti','Turgenev Ivan Sergeevich',1862,'roman','Russia',1),(2,'Heroi nashego vremeni','Lermontov Mihail Yur\'evich',1840,'roman','Russia',2),(3,'Mciri','Lermontov Mihail Yur\'evich',1840,'poema','Russia',1),(4,'Taras Bulba','Gogol Nikolay Vasil\'evich',1835,'povest\'','Russia',1),(5,'Mumu','Turgenev Ivan Sergeevich',1854,'rasskaz','Russia',2),(6,'Posle bala','Tolstoy Lev Nikolaevich',1911,'rasskaz','Russia',2),(7,'Zapiski sumasshedshego','Gogol Nikolay Vasil\'evich',1835,'povest\'','Russia',3),(8,'451 gradus po Faringeytu','Ray Douglas Bradbury',1953,'antiutopia','USA',3),(9,'Vino iz oduvanchikov','Ray Douglas Bradbury',1957,'povest\'','USA',3),(10,'Leto proshay','Ray Douglas Bradbury',2006,'roman','USA',3),(11,'Nadvigaetsya beda','Ray Douglas Bradbury',1962,'roman','USA',3),(12,'Skotniy dvor','George Orwell',1945,'satira','UK',4),(13,'1984','George Orwell',1949,'antiutopia','UK',4),(14,'Ohota na ovetc','Haruki Murakami',1982,'roman','Japan',5),(15,'Norvezhskiy les','Haruki Murakami',1987,'roman','Japan',5),(16,'Tckuru Tadzaki','Haruki Murakami',2013,'roman','Japan',5),(17,'Siyanie','Stephen Edwin King',1977,'uzhas','USA',6),(18,'Ono','Stephen Edwin King',1986,'uzhas','USA',6),(19,'Triumfalnaya arka','Erich Paul Remark',1945,'roman','German',5),(20,'Tri tovarisha','Erich Paul Remark',1936,'roman','German',3),(21,'Kolibel\' dlya koshki','Kurt Vonnegut',1963,'fantastika','USA',2),(22,'Fight club','Chuck Palahniuk',1996,'satira','USA',4),(23,'Proshay oruzhie','Ernest Miller Hemingway',1929,'roman','USA',5),(24,'Odinochesvo v seti','Janusz Leon Wiśniewski',2001,'roman','Poland',5),(25,'Martin Iden','Jack London',1909,'roman','USA',2);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(500) NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'super',1,'2022-10-04 21:15:41'),(2,'hkeghefkh',1,'2022-10-04 21:15:49'),(3,'Миру мир',2,'2022-10-05 11:53:49');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Russia'),(2,'USA'),(3,'UK'),(4,'Japan'),(5,'Poland'),(6,'German'),(7,'Brasil'),(8,'Colombia'),(9,'Ireland');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'roman'),(2,'povest\''),(3,'rasskaz'),(4,'antiutopia'),(5,'satira'),(6,'uzhas'),(7,'fantastika');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'Log out',1,'2022-10-05 00:16:04'),(2,'Log in',1,'2022-10-05 00:16:17'),(3,'Log out',1,'2022-10-05 00:16:37'),(4,'Log in',1,'2022-10-05 00:17:10'),(5,'Log out',1,'2022-10-05 00:17:19'),(6,'Log out',2,'2022-10-05 00:18:05'),(7,'Log in',2,'2022-10-05 14:44:30');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mood`
--

DROP TABLE IF EXISTS `mood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mood` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood`
--

LOCK TABLES `mood` WRITE;
/*!40000 ALTER TABLE `mood` DISABLE KEYS */;
INSERT INTO `mood` VALUES (1,'normal'),(2,'zadumchivoe'),(3,'nastolgicheskoe'),(4,'merzkoe'),(5,'podavlennoe'),(6,'nervnoe');
/*!40000 ALTER TABLE `mood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'linar','l@l','pbkdf2:sha256:260000$jgIkqgLUXfpERUGb$571a54ed4c3fb144b1af399f1e434d5f571d85508ea0282bae399a771058f6f0'),(2,'ggg','w@w','pbkdf2:sha256:260000$TCGe80QE4gML0WDI$a32747a38d32f96e0cac45c549b19ef56d91fee42b97d9e57491cc77a3aa7b18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 20:14:23
