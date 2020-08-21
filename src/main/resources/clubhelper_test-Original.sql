CREATE DATABASE  IF NOT EXISTS `clubhelper` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clubhelper`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clubhelper
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
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adress1` varchar(255) DEFAULT NULL,
  `adress2` varchar(255) DEFAULT NULL,
  `plz` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `person_id` int NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` VALUES (2,'abc Str. 45A','','30629','Hannover',1,'2019-01-29 00:06:52','2015-08-31 22:26:16',NULL);
INSERT INTO `adress` VALUES (3,'def. 10','','30655','Hannover',41,'2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `adress` VALUES (4,'ghi 2','','30627','Hannover',70,'2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `adress` VALUES (5,'jklm Hof 15','','','',38,'2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `adress` VALUES (6,'jklm Hof 15','','30625','Hannover',74,'2016-01-26 18:04:00','2016-01-26 19:04:00',NULL);
INSERT INTO `adress` VALUES (7,'nop 11','','30161','Hannover',62,'2016-04-13 17:06:15','2016-04-13 19:06:15',NULL);
INSERT INTO `adress` VALUES (8,'xyz. 17','','30159','Hannover',1,'2019-01-29 00:06:52','2019-01-29 00:36:02','2019-01-29 01:06:27');
INSERT INTO `adress` VALUES (9,'zab. 26','','30627','Hannover',17,'2019-01-31 13:37:24','2019-01-31 14:37:24',NULL);
INSERT INTO `adress` VALUES (11,'test. 2','','30171','Hannover',148,'2019-01-31 21:42:05','2019-01-31 22:42:05',NULL);

--
-- Table structure for table `altersgruppe`
--

DROP TABLE IF EXISTS `altersgruppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `altersgruppe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` varchar(250) NOT NULL,
  `pflicht_id` int DEFAULT NULL,
  `bezeichnung` varchar(100) NOT NULL,
  `start` int DEFAULT NULL,
  `end` varchar(45) DEFAULT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_altersgruppe_pflicht_idx` (`pflicht_id`),
  KEY `fk_altersgruppe_event_idx` (`event_id`),
  CONSTRAINT `fk_altersgruppe_event` FOREIGN KEY (`event_id`) REFERENCES `clubevent` (`id`),
  CONSTRAINT `fk_altersgruppe_pflicht` FOREIGN KEY (`pflicht_id`) REFERENCES `pflichten` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `altersgruppe`
--

INSERT INTO `altersgruppe` VALUES (1,'nvlcjgfs6vl4i3sc4rhgnlc2g8',2,'Jugend D',2010,'2019','2019-01-27 21:46:28','2019-01-27 22:46:28',NULL);
INSERT INTO `altersgruppe` VALUES (2,'nvlcjgfs6vl4i3sc4rhgnlc2g8',4,'Jugend C',2008,'2009','2019-01-27 21:46:58','2019-01-27 22:46:58',NULL);
INSERT INTO `altersgruppe` VALUES (3,'nvlcjgfs6vl4i3sc4rhgnlc2g8',6,'Jugend B',2003,'2007','2019-01-27 21:50:56','2019-01-27 22:47:26',NULL);

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `on_date` datetime DEFAULT NULL,
  `person_id` int NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_person_id_on_date` (`person_id`,`on_date`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` VALUES (1,'2018-01-17 00:00:00',1,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (2,'2018-01-17 00:00:00',120,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (3,'2018-01-17 00:00:00',121,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (4,'2018-01-17 00:00:00',38,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (5,'2018-01-17 00:00:00',3,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (6,'2018-01-17 00:00:00',62,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (7,'2018-01-17 00:00:00',72,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (8,'2018-01-17 00:00:00',75,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (9,'2018-01-17 00:00:00',9,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (10,'2018-01-17 00:00:00',92,'2018-01-17 17:42:48','2018-01-17 18:42:48',NULL);
INSERT INTO `attendance` VALUES (11,'2018-01-17 00:00:00',123,'2018-01-17 17:44:55','2018-01-17 18:44:55',NULL);
INSERT INTO `attendance` VALUES (12,'2018-01-17 00:00:00',124,'2018-01-17 17:44:55','2018-01-17 18:44:55',NULL);
INSERT INTO `attendance` VALUES (13,'2018-01-17 00:00:00',125,'2018-01-17 17:46:19','2018-01-17 18:46:19',NULL);
INSERT INTO `attendance` VALUES (14,'2018-01-17 00:00:00',126,'2018-01-17 17:48:08','2018-01-17 18:48:08',NULL);
INSERT INTO `attendance` VALUES (15,'2018-01-17 00:00:00',127,'2018-01-17 17:49:37','2018-01-17 18:49:37',NULL);
INSERT INTO `attendance` VALUES (16,'2018-01-17 00:00:00',128,'2018-01-17 17:51:06','2018-01-17 18:51:06',NULL);
INSERT INTO `attendance` VALUES (17,'2018-01-17 00:00:00',129,'2018-01-17 17:52:46','2018-01-17 18:52:46',NULL);
INSERT INTO `attendance` VALUES (18,'2018-01-17 00:00:00',32,'2018-01-17 20:21:37','2018-01-17 21:21:37',NULL);
INSERT INTO `attendance` VALUES (19,'2018-02-07 00:00:00',1,'2018-02-07 17:01:35','2018-02-07 18:01:35',NULL);
INSERT INTO `attendance` VALUES (20,'2018-02-07 00:00:00',32,'2018-02-07 17:01:35','2018-02-07 18:01:35',NULL);
INSERT INTO `attendance` VALUES (21,'2018-02-07 00:00:00',8,'2018-02-07 17:01:35','2018-02-07 18:01:35',NULL);
INSERT INTO `attendance` VALUES (22,'2018-02-07 00:00:00',3,'2018-02-07 17:01:35','2018-02-07 18:01:35',NULL);
INSERT INTO `attendance` VALUES (23,'2018-02-07 00:00:00',72,'2018-02-07 17:01:35','2018-02-07 18:01:35',NULL);
INSERT INTO `attendance` VALUES (24,'2018-02-07 00:00:00',15,'2018-02-07 19:10:01','2018-02-07 20:10:01',NULL);
INSERT INTO `attendance` VALUES (25,'2018-02-07 00:00:00',131,'2018-02-07 19:10:11','2018-02-07 20:10:11',NULL);
INSERT INTO `attendance` VALUES (26,'2018-02-07 00:00:00',127,'2018-02-07 19:13:12','2018-02-07 20:13:12',NULL);
INSERT INTO `attendance` VALUES (27,'2018-02-07 00:00:00',129,'2018-02-07 19:13:12','2018-02-07 20:13:12',NULL);
INSERT INTO `attendance` VALUES (28,'2018-02-07 00:00:00',132,'2018-02-07 19:13:12','2018-02-07 20:13:12',NULL);
INSERT INTO `attendance` VALUES (29,'2018-02-19 00:00:00',72,'2018-02-19 19:34:11','2018-02-19 20:34:11',NULL);
INSERT INTO `attendance` VALUES (30,'2018-02-19 00:00:00',32,'2018-02-19 19:34:11','2018-02-19 20:34:11',NULL);
INSERT INTO `attendance` VALUES (31,'2018-02-21 00:00:00',1,'2018-02-21 17:32:12','2018-02-21 18:32:12',NULL);
INSERT INTO `attendance` VALUES (32,'2018-02-21 00:00:00',127,'2018-02-21 17:32:12','2018-02-21 18:32:12',NULL);
INSERT INTO `attendance` VALUES (33,'2018-02-21 00:00:00',129,'2018-02-21 17:32:12','2018-02-21 18:32:12',NULL);
INSERT INTO `attendance` VALUES (34,'2018-02-21 00:00:00',134,'2018-02-21 17:35:07','2018-02-21 18:35:07',NULL);
INSERT INTO `attendance` VALUES (35,'2018-02-21 00:00:00',8,'2018-02-21 17:35:07','2018-02-21 18:35:07',NULL);
INSERT INTO `attendance` VALUES (36,'2018-02-21 00:00:00',32,'2018-02-21 17:35:07','2018-02-21 18:35:07',NULL);
INSERT INTO `attendance` VALUES (37,'2018-02-21 00:00:00',3,'2018-02-21 17:35:07','2018-02-21 18:35:07',NULL);
INSERT INTO `attendance` VALUES (38,'2018-02-21 00:00:00',17,'2018-02-21 17:35:39','2018-02-21 18:35:39',NULL);
INSERT INTO `attendance` VALUES (39,'2018-02-21 00:00:00',135,'2018-02-21 17:35:39','2018-02-21 18:35:39',NULL);
INSERT INTO `attendance` VALUES (40,'2018-02-21 00:00:00',72,'2018-02-21 17:35:39','2018-02-21 18:35:39',NULL);
INSERT INTO `attendance` VALUES (41,'2018-02-21 00:00:00',75,'2018-02-21 17:35:39','2018-02-21 18:35:39',NULL);
INSERT INTO `attendance` VALUES (42,'2018-02-21 00:00:00',15,'2018-02-21 17:37:31','2018-02-21 18:37:31',NULL);

--
-- Table structure for table `clubevent`
--

DROP TABLE IF EXISTS `clubevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubevent` (
  `id` varchar(250) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `iCalUID` varchar(150) DEFAULT NULL,
  `organizerDisplayName` varchar(150) DEFAULT NULL,
  `caption` varchar(150) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `allDay` smallint DEFAULT NULL,
  `deleted` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubevent`
--

INSERT INTO `clubevent` VALUES ('0tud6mkilq58sb4o71v3sbtc60',NULL,'0tud6mkilq58sb4o71v3sbtc60@google.com','mtv_wettkampf','zum löschen',NULL,'2019-02-08 00:00:00','2019-02-08 00:00:00',1,1);
INSERT INTO `clubevent` VALUES ('1f3tph0d1lmoe80fs7dokeo1ds',NULL,'1f3tph0d1lmoe80fs7dokeo1ds@google.com','mtv_allgemein','Turnfest Oldenburg',NULL,'2020-05-20 00:00:00','2020-05-24 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('1hqi3ntpo80mf3evls4jqh5505',NULL,'1hqi3ntpo80mf3evls4jqh5505@google.com','mtv_wettkampf','Bezirks DMT',NULL,'2019-03-02 00:00:00','2019-03-02 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('2jpqksdhsk6g97r1cjh3t5llck','Göttingen','2jpqksdhsk6g97r1cjh3t5llck@google.com','mtv_wettkampf','LM Senioren: Katharina','Absagen: Nika, Maarten','2019-11-23 00:00:00','2019-11-23 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('3pqgg0g4lqdf1veik7e28vbam4',NULL,'3pqgg0g4lqdf1veik7e28vbam4@google.com','mtv_wettkampf','BZEinsteigerwettkampf','Absagen: Saskia','2019-11-30 00:00:00','2019-11-30 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('416dla37hvjknqrgoqaq91utbk','Laatzen?','416dla37hvjknqrgoqaq91utbk@google.com','mtv_wettkampf','LM Mannschaft',NULL,'2019-06-22 00:00:00','2019-06-22 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('5ab6m62nuqbmsea8gqgbp7hj5k','Laatzen','5ab6m62nuqbmsea8gqgbp7hj5k@google.com','mtv_wettkampf','KR-Einzel-MS',NULL,'2019-08-24 00:00:00','2019-08-24 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('6goj4cr6cgom2b9o69h68b9kcko36b9oc4o6ab9i70pm4e1o68p6aohi6s',NULL,'6goj4cr6cgom2b9o69h68b9kcko36b9oc4o6ab9i70pm4e1o68p6aohi6s@google.com','mtv_allgemein','Prämienveranstaltung sparkasse',NULL,'2019-12-05 00:00:00','2019-12-05 00:00:00',0,0);
INSERT INTO `clubevent` VALUES ('6k86gnjvjat0mbud82jmuml0kc','Pattensen?','6k86gnjvjat0mbud82jmuml0kc@google.com','mtv_wettkampf','KR-Mannschafts-MS',NULL,'2019-05-11 00:00:00','2019-05-12 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('6oqjacr4chij8b9k6cs3ib9k74r32bb170qmabb170s36cr368qm2o9j74','Laatzen','6oqjacr4chij8b9k6cs3ib9k74r32bb170qmabb170s36cr368qm2o9j74@google.com','mtv_wettkampf','Lehrgang Tipps&Tricks',NULL,'2019-10-27 00:00:00','2019-10-27 00:00:00',0,0);
INSERT INTO `clubevent` VALUES ('6phj4chj6pj30bb36tgj2b9k6oqjab9oc4q32b9icph3gopg71ijic9gcg',NULL,'6phj4chj6pj30bb36tgj2b9k6oqjab9oc4q32b9icph3gopg71ijic9gcg@google.com','mtv_allgemein','Vereinsmeisterschaft',NULL,'2019-11-16 00:00:00','2019-11-16 00:00:00',0,0);
INSERT INTO `clubevent` VALUES ('6ss34dhkcdhjgb9ickqjcb9k69hj8b9p6gqm8bb171h66d1mckq64e1ncg',NULL,'6ss34dhkcdhjgb9ickqjcb9k69hj8b9p6gqm8bb171h66d1mckq64e1ncg@google.com','mtv_allgemein','Ultimate kommt zurück',NULL,'2019-11-01 00:00:00','2019-11-01 00:00:00',0,1);
INSERT INTO `clubevent` VALUES ('7b6ugv4gh4slj47qsrjhfod3pg','Wunstorf','7b6ugv4gh4slj47qsrjhfod3pg@google.com','mtv_wettkampf','BZ DMT',NULL,'2019-03-02 00:00:00','2019-03-02 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('8q1am0fl47cn1h22j9m3348q48','Salzgitter','8q1am0fl47cn1h22j9m3348q48@google.com','mtv_wettkampf','LM Einzel',NULL,'2019-04-06 00:00:00','2019-04-06 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('8s2qo3v7pbclupqhsjfm1jfmqo','Poggenhagen','8s2qo3v7pbclupqhsjfm1jfmqo@google.com','mtv_wettkampf','BZMannschaftsMS',NULL,'2019-05-18 00:00:00','2019-05-18 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('a1inmotgn59qlou6n2kij3buco','Wunstorf','a1inmotgn59qlou6n2kij3buco@google.com','mtv_allgemein','F-Schein',NULL,'2019-06-29 00:00:00','2019-06-30 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('b0nj81eie0tc1neln1lmh5t9rs','Grasdorf, 30880 Laatzen, Deutschland','b0nj81eie0tc1neln1lmh5t9rs@google.com','mtv_wettkampf','BZSynchronMS',NULL,'2019-09-14 00:00:00','2019-09-14 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('b16m8eb2dmontpqki35ehvnlko','Laatzen, Albert-Einstein-Schule','b16m8eb2dmontpqki35ehvnlko@google.com','mtv_wettkampf','LM Synchron: Nika & Tala',NULL,'2019-11-02 00:00:00','2019-11-02 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('d79sjvhr416m3lbu2tn3m0omv4','Berenbostel, Garbsen, Deutschland','d79sjvhr416m3lbu2tn3m0omv4@google.com','mtv_allgemein','KR-Schein Passiv',NULL,'2019-01-12 00:00:00','2019-01-12 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('da5vvbhhoivia5sl5dhdqcn5fc',NULL,'da5vvbhhoivia5sl5dhdqcn5fc@google.com','mtv_wettkampf','LM Synchron',NULL,'2019-10-26 00:00:00','2019-10-26 00:00:00',0,0);
INSERT INTO `clubevent` VALUES ('ipq6elmji5p4bbkgvrbv28vgks','Poggenhagen','ipq6elmji5p4bbkgvrbv28vgks@google.com','mtv_wettkampf','BZEinzelMS',NULL,'2019-08-31 00:00:00','2019-08-31 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('j905urdm6gut66efql31nddta0','Laatzen','j905urdm6gut66efql31nddta0@google.com','mtv_allgemein','G-Schein',NULL,'2019-03-09 00:00:00','2019-03-10 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('ktginr305jn6l71omiggs4u1d8','Bremerhaven, Deutschland','ktginr305jn6l71omiggs4u1d8@google.com','mtv_wettkampf','Küstenteam-Cup',NULL,'2019-09-28 00:00:00','2019-09-28 00:00:00',1,1);
INSERT INTO `clubevent` VALUES ('l5s96f8l1fn5tdsqn4ir7hgc04','Melle','l5s96f8l1fn5tdsqn4ir7hgc04@google.com','mtv_allgemein','Trainer C 1. Teil',NULL,'2019-10-04 00:00:00','2019-10-06 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('nvlcjgfs6vl4i3sc4rhgnlc2g8','Laatzen','nvlcjgfs6vl4i3sc4rhgnlc2g8@google.com','mtv_wettkampf','Leine-Pokal',NULL,'2019-05-04 00:00:00','2019-05-04 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('obsq4kli1u16o9e01enbhde1a4','Laatzen','obsq4kli1u16o9e01enbhde1a4@google.com','mtv_wettkampf','Kreissynchronmeisterschaften',NULL,'2019-08-25 00:00:00','2019-08-25 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('q7mcfne5l3qgb2i82egmmb7kt4','Darmstadt','q7mcfne5l3qgb2i82egmmb7kt4@google.com','mtv_wettkampf','HCC-Ball','Absagen: Nika','2019-12-07 00:00:00','2019-12-07 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('qpj15a2495o7k8ee62fsrg8akk','Neu Wulmsdorf','qpj15a2495o7k8ee62fsrg8akk@google.com','mtv_wettkampf','LM DMT',NULL,'2019-02-16 00:00:00','2019-02-16 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('qs45hjtsivmjmpriirmn0mjf5g','Grasdorf, 30880 Laatzen, Deutschland','qs45hjtsivmjmpriirmn0mjf5g@google.com','mtv_wettkampf','Oldies Cup',NULL,'2019-09-20 00:00:00','2019-09-22 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h71fn8pbidlkmsdb168pjaphl70qj4d9g6t076or8elm6cpbid5imsbjfe9jg',NULL,'F_2018_termin5a235f5852507@schulferien.org','Schulferien','Weihnachtsferien 2018 Niedersachsen','Alle Termine auf www.schulferien.org','2018-12-24 00:00:00','2019-01-04 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h75fn8pbidlkmsdb360o3ip9l6krj8dhk61076or8elm6cpbid5imsbjfe9jg',NULL,'F_2019_termin5c009e5574640@schulferien.org','Schulferien','Winterferien 2019 Niedersachsen','Alle Termine auf www.schulferien.org','2019-01-31 00:00:00','2019-02-01 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h75fn8pbidlkmsdb360o3ip9l6krj8dj4c9076or8elm6cpbid5imsbjfe9jg',NULL,'F_2019_termin5c009e55746db@schulferien.org','Schulferien','Osterferien 2019 Niedersachsen','Alle Termine auf www.schulferien.org','2019-04-08 00:00:00','2019-04-23 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h75fn8pbidlkmsdb360o3ip9l6krj8dpm6d076or8elm6cpbid5imsbjfe9jg',NULL,'F_2019_termin5c009e5574763@schulferien.org','Schulferien','Pfingstferien 2019 Niedersachsen','Alle Termine auf www.schulferien.org','2019-05-31 00:00:00','2019-05-31 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h75fn8pbidlkmsdb360o3ip9l6krj8dr471076or8elm6cpbid5imsbjfe9jg',NULL,'F_2019_termin5c009e55747d8@schulferien.org','Schulferien','Pfingstferien 2019 Niedersachsen','Alle Termine auf www.schulferien.org','2019-06-11 00:00:00','2019-06-11 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h75fn8pbidlkmsdb360o3ip9l6krj8e1kc9076or8elm6cpbid5imsbjfe9jg',NULL,'F_2019_termin5c009e557484b@schulferien.org','Schulferien','Sommerferien 2019 Niedersachsen','Alle Termine auf www.schulferien.org','2019-07-04 00:00:00','2019-08-14 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h75fn8pbidlkmsdb360o3ip9l6krj8e32cp076or8elm6cpbid5imsbjfe9jg',NULL,'F_2019_termin5c009e55748bf@schulferien.org','Schulferien','Herbstferien 2019 Niedersachsen','Alle Termine auf www.schulferien.org','2019-10-04 00:00:00','2019-10-18 00:00:00',1,0);
INSERT INTO `clubevent` VALUES ('_8pfj4c1h75fn8pbidlkmsdb360o3ip9l6krj8e9l6p076or8elm6cpbid5imsbjfe9jg',NULL,'F_2019_termin5c009e5574956@schulferien.org','Schulferien','Weihnachtsferien 2019 Niedersachsen','Alle Termine auf www.schulferien.org','2019-12-23 00:00:00','2020-01-06 00:00:00',1,0);

--
-- Table structure for table `clubevent_addon`
--

DROP TABLE IF EXISTS `clubevent_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubevent_addon` (
  `id` varchar(250) NOT NULL,
  `competition_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_event_addon_id` FOREIGN KEY (`id`) REFERENCES `clubevent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubevent_addon`
--

INSERT INTO `clubevent_addon` VALUES ('2jpqksdhsk6g97r1cjh3t5llck','EINZEL');
INSERT INTO `clubevent_addon` VALUES ('3pqgg0g4lqdf1veik7e28vbam4','EINZEL');
INSERT INTO `clubevent_addon` VALUES ('416dla37hvjknqrgoqaq91utbk','MANNSCHAFT');
INSERT INTO `clubevent_addon` VALUES ('5ab6m62nuqbmsea8gqgbp7hj5k','EINZEL');
INSERT INTO `clubevent_addon` VALUES ('6k86gnjvjat0mbud82jmuml0kc','MANNSCHAFT');
INSERT INTO `clubevent_addon` VALUES ('7b6ugv4gh4slj47qsrjhfod3pg','DOPPELMINI');
INSERT INTO `clubevent_addon` VALUES ('8q1am0fl47cn1h22j9m3348q48','EINZEL');
INSERT INTO `clubevent_addon` VALUES ('8s2qo3v7pbclupqhsjfm1jfmqo','MANNSCHAFT');
INSERT INTO `clubevent_addon` VALUES ('b0nj81eie0tc1neln1lmh5t9rs','SYNCHRON');
INSERT INTO `clubevent_addon` VALUES ('da5vvbhhoivia5sl5dhdqcn5fc','SYNCHRON');
INSERT INTO `clubevent_addon` VALUES ('ipq6elmji5p4bbkgvrbv28vgks','EINZEL');
INSERT INTO `clubevent_addon` VALUES ('nvlcjgfs6vl4i3sc4rhgnlc2g8','EINZEL');
INSERT INTO `clubevent_addon` VALUES ('obsq4kli1u16o9e01enbhde1a4','SYNCHRON');
INSERT INTO `clubevent_addon` VALUES ('q7mcfne5l3qgb2i82egmmb7kt4','DOPPELMINI');
INSERT INTO `clubevent_addon` VALUES ('qpj15a2495o7k8ee62fsrg8akk','DOPPELMINI');
INSERT INTO `clubevent_addon` VALUES ('qs45hjtsivmjmpriirmn0mjf5g','EINZEL');

--
-- Table structure for table `clubevent_has_person`
--

DROP TABLE IF EXISTS `clubevent_has_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubevent_has_person` (
  `clubevent_id` varchar(250) NOT NULL,
  `person_id` int NOT NULL,
  `comment` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`clubevent_id`,`person_id`),
  KEY `fk_clubevent_has_person_person1_idx` (`person_id`),
  KEY `fk_clubevent_has_person_clubevent1_idx` (`clubevent_id`),
  CONSTRAINT `fk_clubevent_has_person_clubevent1` FOREIGN KEY (`clubevent_id`) REFERENCES `clubevent` (`id`),
  CONSTRAINT `fk_clubevent_has_person_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubevent_has_person`
--

INSERT INTO `clubevent_has_person` VALUES ('nvlcjgfs6vl4i3sc4rhgnlc2g8',32,'');
INSERT INTO `clubevent_has_person` VALUES ('nvlcjgfs6vl4i3sc4rhgnlc2g8',72,'');
INSERT INTO `clubevent_has_person` VALUES ('nvlcjgfs6vl4i3sc4rhgnlc2g8',134,'');
INSERT INTO `clubevent_has_person` VALUES ('nvlcjgfs6vl4i3sc4rhgnlc2g8',141,'');
INSERT INTO `clubevent_has_person` VALUES ('qpj15a2495o7k8ee62fsrg8akk',32,'');
INSERT INTO `clubevent_has_person` VALUES ('qpj15a2495o7k8ee62fsrg8akk',72,'');
INSERT INTO `clubevent_has_person` VALUES ('qpj15a2495o7k8ee62fsrg8akk',134,'');

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `person_id` int NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` VALUES (1,'Telefon','+49 511 ',1,'2019-01-29 00:06:52','2015-08-31 22:26:08',NULL);
INSERT INTO `contact` VALUES (2,'Email','markus@web.de',1,'2019-01-29 00:06:52','2015-08-31 22:26:09','2019-01-27 17:37:51');
INSERT INTO `contact` VALUES (3,'Mobile','+49 174 ',1,'2019-06-09 12:38:52','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (4,'Telefon','051140',2,'2019-01-27 14:18:15','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (5,'Telefon','+495111',3,'2019-08-10 22:19:10','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (6,'Email','cao@r.de',3,'2019-08-10 22:19:10','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (7,'Mobile','+49173',3,'2019-08-10 22:19:10','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (8,'Telefon','0511865',4,'2015-08-31 20:26:09','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (9,'Mobile','01573753',4,'2015-08-31 20:26:09','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (10,'Telefon','051865',5,'2015-08-31 20:26:09','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (11,'Mobile','0157753',5,'2015-08-31 20:26:09','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (12,'Telefon','0511311',6,'2015-08-31 20:26:09','2015-08-31 22:26:09',NULL);
INSERT INTO `contact` VALUES (13,'Telefon','05115761',7,'2015-08-31 20:26:10','2015-08-31 22:26:10','2018-01-03 20:27:01');
INSERT INTO `contact` VALUES (14,'Mobile','+49 1514 53',8,'2019-01-28 13:55:17','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (15,'Mobile','0151453',9,'2015-08-31 20:26:10','2015-08-31 22:26:10','2017-03-05 23:17:44');
INSERT INTO `contact` VALUES (16,'Telefon','051100',10,'2019-08-08 15:41:23','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (17,'Telefon','0511836',11,'2015-08-31 20:26:10','2015-08-31 22:26:10','2018-01-03 20:27:30');
INSERT INTO `contact` VALUES (18,'Telefon','051192',13,'2015-08-31 20:26:10','2015-08-31 22:26:10','2018-01-04 14:20:14');
INSERT INTO `contact` VALUES (19,'Telefon','051505',14,'2015-08-31 20:26:10','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (20,'Mobile','017621',14,'2015-08-31 20:26:10','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (21,'Telefon','0511854',15,'2015-08-31 20:26:10','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (22,'Telefon','+49 520',17,'2019-01-31 13:37:24','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (23,'Mobile','+49 1415',17,'2019-01-31 13:37:24','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (24,'Email','bien@gmx.net',17,'2019-01-31 13:37:24','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (25,'Telefon','051177',20,'2015-08-31 20:26:10','2015-08-31 22:26:10',NULL);
INSERT INTO `contact` VALUES (26,'Telefon','0511163',21,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (27,'Telefon','051156',22,'2015-08-31 20:26:11','2015-08-31 22:26:11','2018-01-03 20:25:41');
INSERT INTO `contact` VALUES (28,'Mobile','0151174',22,'2015-08-31 20:26:11','2015-08-31 22:26:11','2018-01-03 20:25:41');
INSERT INTO `contact` VALUES (29,'Telefon','051321',24,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (30,'Telefon','051199',25,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (31,'Telefon','05195',27,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (32,'Mobile','0171725',28,'2015-08-31 20:26:11','2015-08-31 22:26:11','2018-01-03 20:26:05');
INSERT INTO `contact` VALUES (33,'Email','mek@t-online.de',28,'2015-08-31 20:26:11','2015-08-31 22:26:11','2018-01-03 20:26:05');
INSERT INTO `contact` VALUES (34,'Email','Aren@gmail.com',29,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (35,'Mobile','0175',30,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (36,'Telefon','05168',30,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (37,'Telefon','051593',31,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (38,'Mobile','017980',32,'2015-08-31 20:26:11','2015-08-31 22:26:11',NULL);
INSERT INTO `contact` VALUES (39,'Email','krau@t-online.de',32,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (40,'Telefon','01570980',32,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (41,'Email','mr@web.de',33,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (42,'Telefon','051109',33,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (43,'Mobile','017558',34,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (44,'Mobile','016008',35,'2015-08-31 20:26:12','2015-08-31 22:26:12','2018-01-04 14:21:10');
INSERT INTO `contact` VALUES (45,'Email','ab@live.de',35,'2015-08-31 20:26:12','2015-08-31 22:26:12','2018-01-04 14:21:10');
INSERT INTO `contact` VALUES (46,'Telefon','05199',35,'2015-08-31 20:26:12','2015-08-31 22:26:12','2018-01-04 14:21:10');
INSERT INTO `contact` VALUES (47,'Mobile','1727',35,'2015-08-31 20:26:12','2015-08-31 22:26:12','2018-01-04 14:21:10');
INSERT INTO `contact` VALUES (48,'Mobile','01762',36,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (49,'Mobile','+49 5403',38,'2019-01-28 14:02:40','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (50,'Email','Daker@gmx.de',38,'2019-01-28 14:02:40','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (51,'Telefon','051191',39,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (52,'Telefon','051320',41,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (53,'Telefon','05189',42,'2015-08-31 20:26:12','2015-08-31 22:26:12',NULL);
INSERT INTO `contact` VALUES (54,'Email','lippe@hotmail.com',42,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (55,'Mobile','017727',42,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (56,'Mobile','+49377',48,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (57,'Mobile','+4917427',51,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (58,'Email','bergmin@googlemail.com',51,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (59,'Mobile','+49170415',52,'2019-01-28 13:56:28','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (60,'Email','birgen@gmx.net',52,'2019-01-28 13:56:28','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (61,'Mobile','+491225',49,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (62,'Email','kanz@hotmail.de',49,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (63,'Mobile','+4915431',29,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (64,'Email','arte@googlemail.com',53,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (65,'Telefon','+495143',53,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (66,'Mobile','+49173362',53,'2015-08-31 20:26:13','2015-08-31 22:26:13',NULL);
INSERT INTO `contact` VALUES (67,'Mobile','+4915699',47,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (68,'Telefon','+495126',43,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (69,'Mobile','+4951100',54,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (70,'Email','angell@gmx.de',54,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (71,'Mobile','+4916161',56,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (72,'Email','stefti@gmx.de',58,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (73,'Mobile','+491048',41,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (74,'Mobile','+4917669',59,'2015-08-31 20:26:14','2015-08-31 22:26:14',NULL);
INSERT INTO `contact` VALUES (75,'Email','resa@web.de',59,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (76,'Telefon','+4951240',61,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (77,'Mobile','+491766338',62,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (78,'Mobile','+491766137',62,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (79,'Telefon','+49511868',7,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (80,'Mobile','+491763021',63,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (81,'Telefon','+4951415',64,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (82,'Email','meyy@htp-tel.de',43,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (83,'Mobile','+4917917',66,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (84,'Email','anse@gmx.de',7,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (85,'Mobile','+491791',68,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (86,'Mobile','+491742',70,'2015-08-31 20:26:15','2015-08-31 22:26:15',NULL);
INSERT INTO `contact` VALUES (87,'Email','sane@gmx.de',66,'2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `contact` VALUES (88,'Mobile','+4917927',61,'2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `contact` VALUES (89,'Mobile','+49115',73,'2015-09-21 15:18:56','2015-09-21 17:18:56',NULL);
INSERT INTO `contact` VALUES (90,'Email','khof@web.de',73,'2016-01-25 18:10:17','2016-01-25 19:10:17',NULL);
INSERT INTO `contact` VALUES (91,'Telefon','+49510072',74,'2016-01-26 18:04:07','2016-01-26 19:04:07',NULL);
INSERT INTO `contact` VALUES (92,'Email','dr@gmx.de',74,'2016-01-26 18:04:39','2016-01-26 19:04:39',NULL);
INSERT INTO `contact` VALUES (93,'Email','j3@gmx.de',76,'2016-01-27 17:21:24','2016-01-27 18:21:24',NULL);
INSERT INTO `contact` VALUES (94,'Mobile','+491392',12,'2019-08-08 15:41:36','2016-01-30 10:30:37',NULL);
INSERT INTO `contact` VALUES (95,'Mobile','+491569',12,'2019-08-08 15:41:36','2016-01-30 14:58:54',NULL);
INSERT INTO `contact` VALUES (96,'Mobile','+4915745',76,'2016-02-08 16:15:59','2016-02-08 17:15:59',NULL);
INSERT INTO `contact` VALUES (97,'Mobile','+491787',78,'2016-02-29 17:32:17','2016-02-29 18:32:17',NULL);
INSERT INTO `contact` VALUES (98,'Email','gudtt@t-online.de',78,'2016-03-01 19:44:54','2016-03-01 20:44:54',NULL);
INSERT INTO `contact` VALUES (99,'Mobile','+49175',79,'2016-03-10 08:57:00','2016-03-10 09:57:00',NULL);
INSERT INTO `contact` VALUES (100,'Mobile','+49178566',81,'2016-04-13 14:56:01','2016-04-13 16:56:01',NULL);
INSERT INTO `contact` VALUES (122,'Mobile','0172238',144,'2019-01-16 17:04:05','2019-01-16 18:04:05',NULL);
INSERT INTO `contact` VALUES (123,'Email','01722538',145,'2019-01-16 17:05:27','2019-01-16 18:05:27',NULL);
INSERT INTO `contact` VALUES (125,'Email','mah@web.de',1,'2019-01-29 00:06:52','2019-01-28 01:52:34',NULL);
INSERT INTO `contact` VALUES (126,'Telefon','+49 5104',1,'2019-01-28 23:36:02','2019-01-28 02:00:16','2019-01-29 00:37:16');
INSERT INTO `contact` VALUES (127,'Email','xyhx@gmail.com',93,'2019-01-28 14:04:58','2019-01-28 15:04:58',NULL);
INSERT INTO `contact` VALUES (129,'Mobile','+49 1590 72',148,'2019-01-31 21:42:05','2019-01-31 22:42:05',NULL);
INSERT INTO `contact` VALUES (130,'Email','Renn@live.de',148,'2019-01-31 21:42:05','2019-01-31 22:42:05',NULL);
INSERT INTO `contact` VALUES (147,'Mobile','+49 17556',168,NULL,NULL,NULL);
INSERT INTO `contact` VALUES (148,'Email','die@adresse.de',170,NULL,NULL,NULL);
INSERT INTO `contact` VALUES (149,'Email','die@adresse.de',170,NULL,NULL,NULL);

--
-- Table structure for table `deleted_entries`
--

DROP TABLE IF EXISTS `deleted_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleted_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tablename` varchar(25) NOT NULL,
  `entryId` int NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_entries`
--

INSERT INTO `deleted_entries` VALUES (1,'person',14,'2017-01-02 12:15:45','2017-01-02 13:15:45',NULL);
INSERT INTO `deleted_entries` VALUES (2,'person',53,'2017-01-02 12:15:52','2017-01-02 13:15:52',NULL);
INSERT INTO `deleted_entries` VALUES (3,'person',29,'2017-01-02 12:15:55','2017-01-02 13:15:55',NULL);
INSERT INTO `deleted_entries` VALUES (4,'person',40,'2017-01-02 12:15:58','2017-01-02 13:15:58',NULL);
INSERT INTO `deleted_entries` VALUES (5,'person',44,'2017-01-02 12:16:00','2017-01-02 13:16:00',NULL);
INSERT INTO `deleted_entries` VALUES (6,'person',45,'2017-01-02 12:16:02','2017-01-02 13:16:02',NULL);
INSERT INTO `deleted_entries` VALUES (7,'person',4,'2017-01-02 12:16:16','2017-01-02 13:16:16',NULL);
INSERT INTO `deleted_entries` VALUES (8,'person',5,'2017-01-02 12:16:19','2017-01-02 13:16:19',NULL);
INSERT INTO `deleted_entries` VALUES (9,'person',34,'2017-01-02 12:16:31','2017-01-02 13:16:31',NULL);
INSERT INTO `deleted_entries` VALUES (10,'person',42,'2017-01-02 12:16:43','2017-01-02 13:16:43',NULL);
INSERT INTO `deleted_entries` VALUES (11,'person',19,'2017-01-02 12:17:03','2017-01-02 13:17:03',NULL);
INSERT INTO `deleted_entries` VALUES (12,'person',20,'2017-01-02 12:17:32','2017-01-02 13:17:32',NULL);
INSERT INTO `deleted_entries` VALUES (13,'person',27,'2017-01-02 12:18:00','2017-01-02 13:18:00',NULL);
INSERT INTO `deleted_entries` VALUES (14,'person',24,'2017-01-02 12:18:03','2017-01-02 13:18:03',NULL);
INSERT INTO `deleted_entries` VALUES (15,'person',60,'2017-01-02 12:18:07','2017-01-02 13:18:07',NULL);
INSERT INTO `deleted_entries` VALUES (16,'person',54,'2017-01-07 18:58:05','2017-01-07 19:58:05',NULL);
INSERT INTO `deleted_entries` VALUES (17,'person',37,'2017-01-09 14:45:54','2017-01-09 15:45:54',NULL);
INSERT INTO `deleted_entries` VALUES (18,'person',36,'2017-01-09 14:46:15','2017-01-09 15:46:15',NULL);
INSERT INTO `deleted_entries` VALUES (19,'contact',15,'2017-03-05 22:17:44','2017-03-05 23:17:44',NULL);
INSERT INTO `deleted_entries` VALUES (22,'person',22,'2018-01-03 19:25:41','2018-01-03 20:25:41',NULL);
INSERT INTO `deleted_entries` VALUES (27,'contact',27,'2018-01-03 19:25:41','2018-01-03 20:25:41',NULL);
INSERT INTO `deleted_entries` VALUES (28,'contact',28,'2018-01-03 19:25:41','2018-01-03 20:25:41',NULL);
INSERT INTO `deleted_entries` VALUES (32,'contact',32,'2018-01-03 19:26:05','2018-01-03 20:26:05',NULL);
INSERT INTO `deleted_entries` VALUES (33,'contact',33,'2018-01-03 19:26:05','2018-01-03 20:26:05',NULL);
INSERT INTO `deleted_entries` VALUES (44,'contact',44,'2018-01-04 13:21:10','2018-01-04 14:21:10',NULL);
INSERT INTO `deleted_entries` VALUES (45,'contact',45,'2018-01-04 13:21:10','2018-01-04 14:21:10',NULL);
INSERT INTO `deleted_entries` VALUES (46,'contact',46,'2018-01-04 13:21:10','2018-01-04 14:21:10',NULL);
INSERT INTO `deleted_entries` VALUES (47,'contact',47,'2018-01-04 13:21:10','2018-01-04 14:21:10',NULL);
INSERT INTO `deleted_entries` VALUES (125,'person',125,'2018-06-26 04:35:25','2018-06-26 06:35:25',NULL);
INSERT INTO `deleted_entries` VALUES (140,'person',140,'2018-05-01 12:35:34','2018-05-01 14:35:34',NULL);
INSERT INTO `deleted_entries` VALUES (141,'person',141,'2018-05-01 12:35:59','2018-05-01 14:35:59',NULL);

--
-- Table structure for table `event_has_altersgruppe`
--

DROP TABLE IF EXISTS `event_has_altersgruppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_has_altersgruppe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` varchar(250) NOT NULL,
  `altersgruppe_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_has_altersgruppe_event_idx` (`event_id`),
  KEY `fk_event_has_altersgruppe_altersgruppe_idx` (`altersgruppe_id`),
  CONSTRAINT `fk_event_has_altersgruppe_altersgruppe` FOREIGN KEY (`altersgruppe_id`) REFERENCES `altersgruppe` (`id`),
  CONSTRAINT `fk_event_has_altersgruppe_event` FOREIGN KEY (`event_id`) REFERENCES `clubevent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_has_altersgruppe`
--


--
-- Table structure for table `groupdef`
--

DROP TABLE IF EXISTS `groupdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupdef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupname_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupdef`
--

INSERT INTO `groupdef` VALUES (1,'Aktive','2016-12-17 13:59:01','2016-12-17 14:59:01',NULL);
INSERT INTO `groupdef` VALUES (2,'Angehörige','2016-12-18 19:55:01','2016-12-18 20:55:01',NULL);
INSERT INTO `groupdef` VALUES (3,'Übungsleiter','2016-12-18 19:55:01','2016-12-18 20:55:01',NULL);
INSERT INTO `groupdef` VALUES (6,'Ehemalige','2016-12-18 19:55:57','2016-12-18 20:55:57',NULL);
INSERT INTO `groupdef` VALUES (7,'Wettkämpfer','2016-12-18 19:56:09','2016-12-18 20:56:09',NULL);
INSERT INTO `groupdef` VALUES (8,'ADMIN','2016-12-30 21:34:13','2016-12-30 22:34:13',NULL);
INSERT INTO `groupdef` VALUES (9,'Kampfrichter','2019-01-12 12:44:00','2019-01-12 13:44:00',NULL);
INSERT INTO `groupdef` VALUES (10,'Warteliste','2020-01-28 18:52:58','2020-01-28 19:52:58',NULL);

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `notekey` varchar(25) DEFAULT NULL,
  `notetext` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notes_person` (`person_id`),
  CONSTRAINT `fk_notes_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` VALUES (1,3,'','Eine Notzi zu Chantal');
INSERT INTO `notes` VALUES (2,1,'','Eine Noziz zu Markus');
INSERT INTO `notes` VALUES (4,170,'','Email vom \n28.01.2020');

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prename` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `gender` smallint DEFAULT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

INSERT INTO `person` VALUES (1,'Maus','Krh','1973-09-11 00:00:00',1,'2020-01-18 15:14:19','2015-08-31 22:26:03',NULL,'markus','0773');
INSERT INTO `person` VALUES (2,'Irs','Baker','2004-02-14 00:00:00',2,'2019-01-27 14:18:15','2015-08-31 22:26:03','2019-01-27 22:05:11',NULL,NULL);
INSERT INTO `person` VALUES (3,'Ctal','Camho','2002-02-26 00:00:00',2,'2020-01-18 15:13:54','2015-08-31 22:26:04',NULL,NULL,NULL);
INSERT INTO `person` VALUES (4,'Paune','Eins','2005-04-19 00:00:00',2,'2015-08-31 20:26:04','2015-08-31 22:26:04','2017-01-02 13:16:16',NULL,NULL);
INSERT INTO `person` VALUES (5,'Vian','Eens','2000-05-07 00:00:00',2,'2015-08-31 20:26:04','2015-08-31 22:26:04','2017-01-02 13:16:19',NULL,NULL);
INSERT INTO `person` VALUES (6,'Jaik','Elleock','2006-01-09 00:00:00',NULL,'2015-08-31 20:26:04','2015-08-31 22:26:04','2019-01-27 22:05:19',NULL,NULL);
INSERT INTO `person` VALUES (7,'Lie','Prton','2007-02-15 00:00:00',2,'2015-08-31 20:26:04','2015-08-31 22:26:04','2019-01-27 22:05:16',NULL,NULL);
INSERT INTO `person` VALUES (8,'Bet','','2001-02-01 00:00:00',2,'2019-01-28 13:55:17','2015-08-31 22:26:04',NULL,NULL,NULL);
INSERT INTO `person` VALUES (9,'Gür','Göbelou','2003-11-27 00:00:00',2,'2015-08-31 20:26:04','2015-08-31 22:26:04',NULL,NULL,NULL);
INSERT INTO `person` VALUES (10,'Soie','Hüber','2001-08-21 00:00:00',NULL,'2019-08-08 15:41:23','2015-08-31 22:26:04',NULL,NULL,NULL);
INSERT INTO `person` VALUES (11,'Emy','Ien','2002-03-19 00:00:00',NULL,'2015-08-31 20:26:04','2015-08-31 22:26:04','2018-01-03 20:27:47',NULL,NULL);
INSERT INTO `person` VALUES (12,'Iaa','sa','2001-11-20 00:00:00',NULL,'2019-08-08 15:41:36','2015-08-31 22:26:04',NULL,NULL,NULL);
INSERT INTO `person` VALUES (13,'Ron','Jäcke','1999-08-17 00:00:00',NULL,'2015-08-31 20:26:04','2015-08-31 22:26:04','2019-01-27 22:05:23',NULL,NULL);
--
-- Table structure for table `persongroup`
--

DROP TABLE IF EXISTS `persongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persongroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `group_id` int NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_person_group` (`person_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `persongroup_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `persongroup_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groupdef` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persongroup`
--

INSERT INTO `persongroup` VALUES (2,1,1,'2016-12-18 19:55:01','2016-12-18 20:55:01',NULL);
INSERT INTO `persongroup` VALUES (5,26,1,'2016-12-18 19:55:01','2016-12-18 20:55:01',NULL);
INSERT INTO `persongroup` VALUES (6,86,1,'2016-12-18 19:55:01','2016-12-18 20:55:01',NULL);
INSERT INTO `persongroup` VALUES (55,60,1,'2016-12-18 19:55:04','2016-12-18 20:55:04',NULL);
INSERT INTO `persongroup` VALUES (57,25,1,'2016-12-18 19:55:04','2016-12-18 20:55:04',NULL);
INSERT INTO `persongroup` VALUES (90,1,7,'2016-12-18 19:56:25','2016-12-18 20:56:25',NULL);
INSERT INTO `persongroup` VALUES (91,37,1,'2016-12-19 15:22:52','2016-12-19 16:22:52',NULL);
INSERT INTO `persongroup` VALUES (92,14,6,'2016-12-19 15:23:20','2016-12-19 16:23:20',NULL);
INSERT INTO `persongroup` VALUES (93,29,6,'2016-12-21 20:14:43','2016-12-21 21:14:43',NULL);
INSERT INTO `persongroup` VALUES (94,1,8,'2016-12-31 15:37:37','2016-12-31 16:37:37',NULL);
INSERT INTO `persongroup` VALUES (96,3,3,'2017-01-09 14:46:37','2017-01-09 15:46:37',NULL);
INSERT INTO `persongroup` VALUES (97,57,2,'2017-01-09 14:47:21','2017-01-09 15:47:21',NULL);
INSERT INTO `persongroup` VALUES (98,76,2,'2017-01-09 15:06:51','2017-01-09 16:06:51',NULL);
INSERT INTO `persongroup` VALUES (99,92,3,'2017-01-16 11:32:54','2017-01-16 12:32:54',NULL);
INSERT INTO `persongroup` VALUES (104,120,1,'2017-09-04 20:17:36','2017-09-04 22:17:36',NULL);
INSERT INTO `persongroup` VALUES (105,119,1,'2017-09-04 20:17:36','2017-09-04 22:17:36',NULL);
INSERT INTO `persongroup` VALUES (108,122,1,'2017-11-05 12:47:52','2017-11-05 13:47:52',NULL);
INSERT INTO `persongroup` VALUES (110,124,1,'2018-01-17 17:44:31','2018-01-17 18:44:31',NULL);
INSERT INTO `persongroup` VALUES (131,142,1,'2018-11-28 17:21:08','2018-11-28 18:21:08',NULL);
INSERT INTO `persongroup` VALUES (133,143,1,'2018-11-28 17:23:32','2018-11-28 18:23:32',NULL);
INSERT INTO `persongroup` VALUES (134,1,3,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (135,32,7,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (141,134,7,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (142,81,2,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (143,78,2,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (146,144,1,'2019-01-16 17:03:41','2019-01-16 18:03:41',NULL);
INSERT INTO `persongroup` VALUES (147,145,1,'2019-01-16 17:05:03','2019-01-16 18:05:03',NULL);
INSERT INTO `persongroup` VALUES (149,2,6,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (150,8,6,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (165,49,6,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (171,38,6,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (172,35,6,NULL,NULL,NULL);
INSERT INTO `persongroup` VALUES (181,10,6,'2019-08-08 17:41:23','2019-08-08 19:41:23',NULL);
INSERT INTO `persongroup` VALUES (182,12,6,'2019-08-08 17:41:36','2019-08-08 19:41:36',NULL);
INSERT INTO `persongroup` VALUES (247,148,6,'2019-09-24 05:49:56','2019-09-24 07:49:56',NULL);
INSERT INTO `persongroup` VALUES (248,169,2,'2020-01-28 18:53:17','2020-01-28 19:53:17',NULL);
INSERT INTO `persongroup` VALUES (249,170,10,'2020-01-28 19:07:00','2020-01-28 20:07:00',NULL);

--
-- Table structure for table `pflichten`
--

DROP TABLE IF EXISTS `pflichten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pflichten` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fixed` tinyint DEFAULT NULL,
  `ordered` int NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pflichten`
--

INSERT INTO `pflichten` VALUES (1,'P3',1,3,NULL,'2019-01-27 22:40:17','2019-01-27 23:40:17',NULL);
INSERT INTO `pflichten` VALUES (2,'P4',1,4,NULL,'2019-01-27 22:40:17','2019-01-27 23:40:17',NULL);
INSERT INTO `pflichten` VALUES (3,'P5',1,5,NULL,'2019-01-27 22:40:17','2019-01-27 23:40:17',NULL);
INSERT INTO `pflichten` VALUES (4,'P6',1,6,NULL,'2019-01-27 22:40:17','2019-01-27 23:40:17',NULL);
INSERT INTO `pflichten` VALUES (5,'P7',1,7,NULL,'2019-01-27 22:40:17','2019-01-27 23:40:17',NULL);
INSERT INTO `pflichten` VALUES (6,'P8',1,8,NULL,'2019-01-27 22:40:17','2019-01-27 23:40:17',NULL);

--
-- Table structure for table `relative`
--

DROP TABLE IF EXISTS `relative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relative` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person1` int NOT NULL,
  `person2` int NOT NULL,
  `TO_PERSON1_RELATION` varchar(255) DEFAULT NULL,
  `TO_PERSON2_RELATION` varchar(255) DEFAULT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person1` (`person1`),
  KEY `person2` (`person2`),
  CONSTRAINT `relative_ibfk_1` FOREIGN KEY (`person1`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relative_ibfk_2` FOREIGN KEY (`person2`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relative`
--

INSERT INTO `relative` VALUES (1,51,1,'RELATIONSHIP','RELATIONSHIP','2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `relative` VALUES (2,4,5,'SIBLINGS','SIBLINGS','2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `relative` VALUES (3,52,17,'PARENT','CHILD','2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `relative` VALUES (4,8,9,'SIBLINGS','SIBLINGS','2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `relative` VALUES (5,53,29,'PARENT','CHILD','2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `relative` VALUES (6,35,55,'CHILD','PARENT','2015-08-31 20:26:16','2015-08-31 22:26:16','2018-01-04 14:21:10');
INSERT INTO `relative` VALUES (7,57,41,'PARENT','CHILD','2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `relative` VALUES (8,58,41,'PARENT','CHILD','2015-08-31 20:26:16','2015-08-31 22:26:16',NULL);
INSERT INTO `relative` VALUES (9,58,57,'RELATIONSHIP','RELATIONSHIP','2015-08-31 20:26:17','2015-08-31 22:26:17',NULL);
INSERT INTO `relative` VALUES (10,60,30,'SIBLINGS','SIBLINGS','2015-08-31 20:26:17','2015-08-31 22:26:17',NULL);
INSERT INTO `relative` VALUES (11,66,65,'CHILD','PARENT','2015-08-31 20:26:17','2015-08-31 22:26:17',NULL);
INSERT INTO `relative` VALUES (12,68,67,'PARENT','CHILD','2015-08-31 20:26:17','2015-08-31 22:26:17',NULL);
INSERT INTO `relative` VALUES (17,78,77,'PARENT','CHILD','2016-02-29 17:32:37','2016-02-29 18:32:37',NULL);
INSERT INTO `relative` VALUES (19,87,83,'SIBLINGS','SIBLINGS','2016-04-13 17:15:19','2016-04-13 19:15:19',NULL);
INSERT INTO `relative` VALUES (20,86,83,'SIBLINGS','SIBLINGS','2016-04-13 17:16:29','2016-04-13 19:16:29',NULL);
INSERT INTO `relative` VALUES (22,90,91,'CHILD','PARENT','2016-05-04 15:06:59','2016-05-04 17:06:59',NULL);
INSERT INTO `relative` VALUES (23,50,3,'SIBLINGS','SIBLINGS','2016-05-10 06:45:57','2016-05-10 08:45:57',NULL);

--
-- Table structure for table `startpaesse`
--

DROP TABLE IF EXISTS `startpaesse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `startpaesse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `startpass_nr` varchar(25) NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `startpass_nr` (`startpass_nr`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `startpaesse_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startpaesse`
--

INSERT INTO `startpaesse` VALUES (1,1,'90EFB973',NULL,NULL,NULL);
INSERT INTO `startpaesse` VALUES (2,32,'961TDV05',NULL,NULL,NULL);
INSERT INTO `startpaesse` VALUES (3,134,'84I8BR08',NULL,NULL,NULL);
INSERT INTO `startpaesse` VALUES (4,72,'328WUC09',NULL,NULL,NULL);
INSERT INTO `startpaesse` VALUES (6,141,'71BD3U07','2019-02-17 19:09:55','2019-02-17 20:09:55',NULL);

--
-- Table structure for table `startpass_startrechte`
--

DROP TABLE IF EXISTS `startpass_startrechte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `startpass_startrechte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startpass_id` int NOT NULL,
  `verein_name` varchar(100) NOT NULL,
  `fachgebiet` varchar(25) NOT NULL,
  `startrecht_beginn` datetime NOT NULL,
  `startrecht_ende` datetime NOT NULL,
  `changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `startpass_id` (`startpass_id`),
  CONSTRAINT `startpass_startrechte_ibfk_1` FOREIGN KEY (`startpass_id`) REFERENCES `startpaesse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startpass_startrechte`
--


--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

INSERT INTO `version` VALUES (1,10,NULL);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
