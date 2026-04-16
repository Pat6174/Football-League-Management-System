-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: football_league
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int DEFAULT NULL,
  `player_id` int DEFAULT NULL,
  `card_type` varchar(10) DEFAULT NULL,
  `minute_issued` int DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `match_id` (`match_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  CONSTRAINT `cards_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  CONSTRAINT `cards_chk_1` CHECK ((`card_type` in (_utf8mb4'Yellow',_utf8mb4'Red')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,1,5,'Yellow',32,'Foul');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injuries`
--

DROP TABLE IF EXISTS `injuries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injuries` (
  `injury_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int DEFAULT NULL,
  `injury_type` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expected_return_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  PRIMARY KEY (`injury_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `injuries_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuries`
--

LOCK TABLES `injuries` WRITE;
/*!40000 ALTER TABLE `injuries` DISABLE KEYS */;
INSERT INTO `injuries` VALUES (1,2,'Hamstring','2023-10-05',NULL,'Active');
/*!40000 ALTER TABLE `injuries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `league_standings`
--

DROP TABLE IF EXISTS `league_standings`;
/*!50001 DROP VIEW IF EXISTS `league_standings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `league_standings` AS SELECT 
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `played`,
 1 AS `wins`,
 1 AS `draws`,
 1 AS `losses`,
 1 AS `gf`,
 1 AS `ga`,
 1 AS `gd`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `match_lineups`
--

DROP TABLE IF EXISTS `match_lineups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_lineups` (
  `lineup_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int DEFAULT NULL,
  `player_id` int DEFAULT NULL,
  `is_starter` tinyint(1) DEFAULT '1',
  `minutes_played` int DEFAULT '90',
  PRIMARY KEY (`lineup_id`),
  KEY `match_id` (`match_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `match_lineups_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  CONSTRAINT `match_lineups_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_lineups`
--

LOCK TABLES `match_lineups` WRITE;
/*!40000 ALTER TABLE `match_lineups` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_lineups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `home_team_id` int NOT NULL,
  `away_team_id` int NOT NULL,
  `match_date` datetime NOT NULL,
  `home_score` int DEFAULT NULL,
  `away_score` int DEFAULT NULL,
  `status` varchar(20) DEFAULT 'SCHEDULED',
  PRIMARY KEY (`match_id`),
  KEY `home_team_id` (`home_team_id`),
  KEY `away_team_id` (`away_team_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `position` varchar(20) DEFAULT NULL,
  `jersey_number` int DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `shirt_number` int DEFAULT NULL,
  `yellow_cards` int DEFAULT '0',
  `red_cards` int DEFAULT '0',
  `photo_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `unique_player` (`name`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `stadium` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `played` int DEFAULT '0',
  `won` int DEFAULT '0',
  `drawn` int DEFAULT '0',
  `lost` int DEFAULT '0',
  `goals_for` int DEFAULT '0',
  `goals_against` int DEFAULT '0',
  `goal_diff` int DEFAULT '0',
  `points` int DEFAULT '0',
  `manager` varchar(255) DEFAULT NULL,
  `league_id` varchar(10) DEFAULT 'PL',
  `short_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Arsenal',NULL,NULL,'https://crests.football-data.org/57.png',25,17,5,3,49,17,32,56,NULL,'PL',NULL),(2,'Man City',NULL,NULL,'https://crests.football-data.org/65.png',25,15,5,5,51,24,27,50,NULL,'PL',NULL),(3,'Aston Villa',NULL,NULL,'https://crests.football-data.org/58.png',25,14,5,6,36,27,9,47,NULL,'PL',NULL),(4,'Man United',NULL,NULL,'https://crests.football-data.org/66.png',25,12,8,5,46,36,10,44,NULL,'PL',NULL),(5,'Chelsea',NULL,NULL,'https://crests.football-data.org/61.png',25,12,7,6,45,28,17,43,NULL,'PL',NULL),(6,'Liverpool',NULL,NULL,'https://crests.football-data.org/64.png',25,11,6,8,40,35,5,39,NULL,'PL',NULL),(7,'Brentford',NULL,NULL,'https://crests.football-data.org/402.png',25,12,3,10,39,34,5,39,NULL,'PL',NULL),(8,'Everton',NULL,NULL,'https://crests.football-data.org/62.png',25,10,7,8,28,28,0,37,NULL,'PL',NULL),(9,'Sunderland',NULL,NULL,'https://crests.football-data.org/71.png',25,9,9,7,27,29,-2,36,NULL,'PL',NULL),(10,'Fulham',NULL,NULL,'https://crests.football-data.org/63.png',25,10,4,11,35,37,-2,34,NULL,'PL',NULL),(11,'Bournemouth',NULL,NULL,'https://crests.football-data.org/bournemouth.png',25,8,10,7,41,44,-3,34,NULL,'PL',NULL),(12,'Newcastle',NULL,NULL,'https://crests.football-data.org/67.png',25,9,6,10,35,36,-1,33,NULL,'PL',NULL),(13,'Crystal Palace',NULL,NULL,'https://crests.football-data.org/354.png',25,8,8,9,26,29,-3,32,NULL,'PL',NULL),(14,'Brighton Hove',NULL,NULL,'https://crests.football-data.org/397.png',25,7,10,8,34,33,1,31,NULL,'PL',NULL),(15,'Tottenham',NULL,NULL,'https://crests.football-data.org/73.png',25,7,8,10,35,35,0,29,NULL,'PL',NULL),(16,'Leeds United',NULL,NULL,'https://crests.football-data.org/341.png',25,7,8,10,34,43,-9,29,NULL,'PL',NULL),(17,'Nottingham',NULL,NULL,'https://crests.football-data.org/351.png',25,7,5,13,25,38,-13,26,NULL,'PL',NULL),(18,'West Ham',NULL,NULL,'https://crests.football-data.org/563.png',25,6,5,14,31,48,-17,23,NULL,'PL',NULL),(19,'Burnley',NULL,NULL,'https://crests.football-data.org/328.png',25,3,6,16,25,49,-24,15,NULL,'PL',NULL),(20,'Wolverhampton',NULL,NULL,'https://crests.football-data.org/76.png',25,1,5,19,16,48,-32,8,NULL,'PL',NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'admin',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','hashed_secret_123','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `league_standings`
--

/*!50001 DROP VIEW IF EXISTS `league_standings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `league_standings` AS select `t`.`team_id` AS `team_id`,`t`.`name` AS `team_name`,count(`m`.`match_id`) AS `played`,sum((case when ((`m`.`home_team_id` = `t`.`team_id`) and (`m`.`home_score` > `m`.`away_score`)) then 1 when ((`m`.`away_team_id` = `t`.`team_id`) and (`m`.`away_score` > `m`.`home_score`)) then 1 else 0 end)) AS `wins`,sum((case when (`m`.`home_score` = `m`.`away_score`) then 1 else 0 end)) AS `draws`,sum((case when ((`m`.`home_team_id` = `t`.`team_id`) and (`m`.`home_score` < `m`.`away_score`)) then 1 when ((`m`.`away_team_id` = `t`.`team_id`) and (`m`.`away_score` < `m`.`home_score`)) then 1 else 0 end)) AS `losses`,sum((case when (`m`.`home_team_id` = `t`.`team_id`) then `m`.`home_score` else `m`.`away_score` end)) AS `gf`,sum((case when (`m`.`home_team_id` = `t`.`team_id`) then `m`.`away_score` else `m`.`home_score` end)) AS `ga`,sum((case when (`m`.`home_team_id` = `t`.`team_id`) then (`m`.`home_score` - `m`.`away_score`) else (`m`.`away_score` - `m`.`home_score`) end)) AS `gd`,sum((case when (((`m`.`home_team_id` = `t`.`team_id`) and (`m`.`home_score` > `m`.`away_score`)) or ((`m`.`away_team_id` = `t`.`team_id`) and (`m`.`away_score` > `m`.`home_score`))) then 3 when (`m`.`home_score` = `m`.`away_score`) then 1 else 0 end)) AS `points` from (`teams` `t` join `matches` `m` on(((`t`.`team_id` = `m`.`home_team_id`) or (`t`.`team_id` = `m`.`away_team_id`)))) where (`m`.`status` = 'FINISHED') group by `t`.`team_id` order by `points` desc,`gd` desc */;
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

-- Dump completed on 2026-04-16 11:34:59
