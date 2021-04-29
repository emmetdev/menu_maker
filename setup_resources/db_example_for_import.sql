-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: meals
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

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
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(255) NOT NULL,
  `is_storecupboard` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Aubergine',0),(2,'Red Onion',0),(3,'Sweet Potato',0),(4,'Baby Plum Tomatoes',0),(5,'Garlic',0),(6,'Harissa Paste',1),(7,'Feta Cheese',0),(8,'Lemon',0),(9,'Coriander',0),(10,'Lentils',1),(11,'Flaked Almonds',0),(12,'Olive Oil',1),(13,'Ground Cumin',1),(14,'Water',1),(15,'Vegetable stock powder',1),(16,'Basmati Rice',1),(17,'Diced Chicken Breast',0),(18,'Cornflour',1),(19,'Echalion Shallot',0),(20,'Green Beans',0),(21,'Tomato Puree',1),(22,'Honey',1),(23,'Soy Sauce',1);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_ingredients` (
  `ingredientsID` int(11) NOT NULL,
  `recipesID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ingredientsID`,`recipesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,1,'piece'),(2,1,1,'piece'),(3,1,1,'piece'),(4,1,1,'piece'),(5,1,2,'clove'),(5,2,1,'clove'),(6,1,50,'gram'),(7,1,1,'block'),(8,1,1,'piece'),(9,1,1,'bunch'),(10,1,1,'carton'),(11,1,1,'pot'),(12,1,2,'tbsp'),(13,1,1,'sachet'),(14,1,75,'ml'),(14,2,150,'ml'),(15,1,1,'sachet'),(16,2,150,'gram'),(17,2,280,'gram'),(18,2,10,'gram'),(19,2,1,'piece'),(20,2,1,'pack'),(21,2,2,'tbsp'),(22,2,1,'tbsp'),(23,2,1,'tbsp');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(255) NOT NULL,
  `hf_ref` int(11) DEFAULT NULL,
  `steps` text DEFAULT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Roast Vegetable Lentil Mix',17,'Chop the ingredients\nGet roasting\nToast the nuts\nMake the Sauce\nCook the lentils\nServe'),(2,'Honey Soy Chicken',15,'Prepare the ingredients\nFry the Chicken\nSimmer\nFinishing touches\nServe');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 19:07:45
