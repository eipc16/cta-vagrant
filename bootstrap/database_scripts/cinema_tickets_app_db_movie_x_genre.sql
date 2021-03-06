-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema_tickets_app_db
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `movie_x_genre`
--

DROP TABLE IF EXISTS `movie_x_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_x_genre` (
  `id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `object_state` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `genre_id` bigint DEFAULT NULL,
  `movie_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh6jt7mmrfbf7qr6ralm79ybc7` (`created_by_id`),
  KEY `FKd5vnxv6ivmv73aotinr9wk22y` (`updated_by_id`),
  KEY `FKr6ofas0gu8lh963owxxnrj99q` (`genre_id`),
  KEY `FKq6qrgsiktoeh2w2y433rh3avl` (`movie_id`),
  CONSTRAINT `FKd5vnxv6ivmv73aotinr9wk22y` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKh6jt7mmrfbf7qr6ralm79ybc7` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKq6qrgsiktoeh2w2y433rh3avl` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `FKr6ofas0gu8lh963owxxnrj99q` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_x_genre`
--

LOCK TABLES `movie_x_genre` WRITE;
/*!40000 ALTER TABLE `movie_x_genre` DISABLE KEYS */;
INSERT INTO `movie_x_genre` VALUES (21,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,2,168),(22,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,3,168),(23,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,4,168),(24,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,5,168),(25,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,6,169),(26,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,169),(27,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,8,169),(28,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,4,170),(29,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,170),(30,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,8,170),(31,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,171),(32,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,6,172),(33,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,172),(34,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,6,173),(35,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,173),(36,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,2,174),(37,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,6,174),(38,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,174),(39,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,8,174),(40,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,175),(41,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,176),(42,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,9,176),(43,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,10,176),(44,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,3,177),(45,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,177),(46,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,11,177),(47,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,6,178),(48,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,178),(49,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,12,179),(50,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,180),(51,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,181),(52,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,13,181),(53,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,2,182),(54,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,3,182),(55,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,5,182),(56,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,8,182),(57,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,2,183),(58,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,3,183),(59,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,5,183),(60,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,11,183),(61,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,3,184),(62,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,184),(63,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,11,184),(64,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,2,185),(65,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,5,185),(66,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,6,186),(67,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,186),(68,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,9,186),(69,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,7,187),(70,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,2,188),(71,'2020-05-30 16:22:49','ACTIVE','2020-05-30 16:22:51',1,1,3,188),(72,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,188),(73,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,6,189),(74,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,189),(75,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,8,189),(76,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,14,189),(77,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,4,190),(78,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,190),(79,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,13,190),(80,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,15,190),(81,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,6,191),(82,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,191),(83,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,6,192),(84,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,192),(85,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,8,192),(86,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,16,193),(87,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,193),(88,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,11,193),(89,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,2,194),(90,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,3,194),(91,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,5,194),(92,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,11,194),(93,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,195),(94,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,15,195),(95,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,16,196),(96,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,17,196),(97,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,3,196),(98,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,11,196),(99,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,14,196),(100,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,6,197),(101,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,197),(102,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,11,197),(103,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,14,197),(104,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,3,198),(105,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,5,198),(106,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,198),(107,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,8,198),(108,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,2,199),(109,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,6,199),(110,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,199),(111,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,8,199),(112,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,6,200),(113,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,8,200),(114,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,14,200),(115,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,2,201),(116,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,201),(117,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,10,201),(118,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,16,202),(119,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,17,202),(120,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,18,202),(121,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,3,202),(122,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,202),(123,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,203),(124,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,19,204),(125,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,204),(126,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,9,204),(127,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,15,204),(128,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,3,205),(129,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,4,205),(130,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,5,205),(131,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,2,206),(132,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,5,206),(133,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,16,207),(134,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,4,207),(135,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,207),(136,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,13,207),(137,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,20,208),(138,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,8,208),(139,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,14,208),(140,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,2,209),(141,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,3,209),(142,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,209),(143,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,4,210),(144,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,210),(145,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,13,210),(146,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,6,211),(147,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,211),(148,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,8,211),(149,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,4,212),(150,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,7,212),(151,'2020-05-30 16:22:50','ACTIVE','2020-05-30 16:22:51',1,1,9,212),(152,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,19,213),(153,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,7,213),(154,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,5,214),(155,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,7,214),(156,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,8,214),(157,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,14,214),(158,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,12,215),(159,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,17,216),(160,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,7,216),(161,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,15,216),(162,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,7,217),(163,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,13,217),(164,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,15,217),(165,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,7,218),(166,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,8,219),(167,'2020-05-30 16:22:51','ACTIVE','2020-05-30 16:22:51',1,1,14,219);
/*!40000 ALTER TABLE `movie_x_genre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 19:11:26
