-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: football
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `titre_article` varchar(75) NOT NULL,
  `content_article` varchar(1500) DEFAULT NULL,
  `image_article` blob,
  `id_championnat` int(11) NOT NULL,
  PRIMARY KEY (`id_article`),
  KEY `ARTICLE_CHAMPIONNAT_FK` (`id_championnat`),
  CONSTRAINT `ARTICLE_CHAMPIONNAT_FK` FOREIGN KEY (`id_championnat`) REFERENCES `championnat` (`id_championnat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tag` (
  `id_article` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  PRIMARY KEY (`id_article`,`id_tag`),
  KEY `ARTICLE_TAG_TAG0_FK` (`id_tag`),
  CONSTRAINT `ARTICLE_TAG_ARTICLE_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  CONSTRAINT `ARTICLE_TAG_TAG0_FK` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `but`
--

DROP TABLE IF EXISTS `but`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `but` (
  `id_but` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur` int(11) NOT NULL,
  `id_matchs` int(11) NOT NULL,
  PRIMARY KEY (`id_but`),
  KEY `BUT_JOUEUR_FK` (`id_joueur`),
  KEY `BUT_MATCHS0_FK` (`id_matchs`),
  CONSTRAINT `BUT_JOUEUR_FK` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`),
  CONSTRAINT `BUT_MATCHS0_FK` FOREIGN KEY (`id_matchs`) REFERENCES `matchs` (`id_matchs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `but`
--

LOCK TABLES `but` WRITE;
/*!40000 ALTER TABLE `but` DISABLE KEYS */;
/*!40000 ALTER TABLE `but` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `championnat`
--

DROP TABLE IF EXISTS `championnat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `championnat` (
  `id_championnat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_championnat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_championnat`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `championnat`
--

LOCK TABLES `championnat` WRITE;
/*!40000 ALTER TABLE `championnat` DISABLE KEYS */;
INSERT INTO `championnat` VALUES (1,'Ligue 1'),(2,'Liga BBVA'),(3,'Premier League'),(4,'Serie A'),(5,'Bundesliga'),(6,'Liga Sagres'),(7,'Pro League'),(8,'Super League');
/*!40000 ALTER TABLE `championnat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_equipe` varchar(50) NOT NULL,
  `description_equipe` varchar(1000) NOT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Lyon','Olympique Lyonnais'),(2,'Paris','Paris Saint Germain'),(3,'Saint Etienne','Association Sportive Saint Etienne'),(4,'Marseille','Olympique de Marseille'),(5,'Real Madrid','Real Madrid'),(6,'Barcelone','FC Barcelone'),(7,'Athletico Madrid','Athletico Madrid'),(8,'Valencia','Valencia'),(9,'Liverpool','Liverpool'),(10,'Arsenal','Arsenal'),(11,'Chelsea','Chelsea'),(12,'Manchester City','Manchester City'),(13,'Liege','Liege'),(14,'Bruxelle','Bruxelle'),(15,'Zurich','Zurich'),(16,'Lausanne','Lausanne'),(17,'Rome','AS Rome'),(18,'Juventus','Juventus'),(19,'Naples','Naples'),(20,'Milan','AC Milan'),(21,'Porto','FC Porto'),(22,'Benfica','Benfica Lisbonne');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_saison`
--

DROP TABLE IF EXISTS `equipe_saison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe_saison` (
  `id_saison` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  PRIMARY KEY (`id_saison`,`id_equipe`),
  KEY `EQUIPE_SAISON_EQUIPE0_FK` (`id_equipe`),
  CONSTRAINT `EQUIPE_SAISON_EQUIPE0_FK` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `EQUIPE_SAISON_SAISON_FK` FOREIGN KEY (`id_saison`) REFERENCES `saison` (`id_saison`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_saison`
--

LOCK TABLES `equipe_saison` WRITE;
/*!40000 ALTER TABLE `equipe_saison` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe_saison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historique`
--

DROP TABLE IF EXISTS `historique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historique` (
  `id_joueur` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `date_entree` date NOT NULL,
  `date_sortie` date NOT NULL,
  PRIMARY KEY (`id_joueur`,`id_equipe`),
  KEY `historique_EQUIPE0_FK` (`id_equipe`),
  CONSTRAINT `historique_EQUIPE0_FK` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `historique_JOUEUR_FK` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historique`
--

LOCK TABLES `historique` WRITE;
/*!40000 ALTER TABLE `historique` DISABLE KEYS */;
/*!40000 ALTER TABLE `historique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joueur` (
  `id_joueur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_joueur` varchar(50) NOT NULL,
  `datenaiss_joueur` date DEFAULT NULL,
  `id_equipe` int(11) DEFAULT NULL,
  `id_pays` int(11) NOT NULL,
  PRIMARY KEY (`id_joueur`),
  KEY `JOUEUR_EQUIPE_FK` (`id_equipe`),
  KEY `JOUEUR_PAYS0_FK` (`id_pays`),
  CONSTRAINT `JOUEUR_EQUIPE_FK` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `JOUEUR_PAYS0_FK` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueur`
--

LOCK TABLES `joueur` WRITE;
/*!40000 ALTER TABLE `joueur` DISABLE KEYS */;
INSERT INTO `joueur` VALUES (1,'Fekir','1993-07-18',1,1),(2,'Ferri','1992-03-12',1,1),(3,'Mbappé','1998-12-20',2,1),(4,'Rabiot','1995-04-03',2,1),(5,'Cabella','1990-03-08',3,1),(6,'Perrin','1985-08-07',3,1),(7,'Payet','1987-03-29',4,1),(8,'Thauvin','1993-01-26',4,1),(9,'Ramos','1986-03-30',5,2),(10,'Carvajal','1992-01-11',5,2),(11,'Piqué','1987-02-02',6,2),(12,'Busquets','1988-07-16',6,2),(13,'Torres','1984-03-20',7,2),(14,'Fernandez','1983-07-10',7,2),(15,'Mina','1995-12-07',8,2),(16,'Soler','1997-01-02',8,2),(17,'Oxlade-Chamberlain','1993-08-15',9,3),(18,'Henderson','1990-06-17',9,3),(19,'Wilshere','1992-01-01',10,3),(20,'Ramsey','1990-12-26',10,3),(21,'Barkley','1993-12-05',11,3),(22,'Cahill','1985-12-19',11,3),(23,'Foden','2000-05-28',12,3),(24,'Sterling','1994-12-08',12,3),(25,'Gillet','1979-05-31',13,7),(26,'Emond','1991-12-05',13,7),(27,'Phiri','1990-07-01',14,7),(28,'Govaerts','1994-09-26',14,7),(29,'Schönbächler','1990-01-11',15,8),(30,'Winter','1986-06-08',15,8),(31,'Castella','1993-06-30',16,8),(32,'Pasche','1991-05-31',16,8),(33,'De Rossi','1983-07-24',17,5),(34,'Florenzi','1991-03-11',17,5),(35,'Buffon','1978-01-28',18,5),(36,'Chiellini','1984-08-14',18,5),(37,'Tonelli','1990-01-17',19,5),(38,'Sepe','1991-05-08',19,5),(39,'Bonucci','1987-05-01',20,5),(40,'Bonaventura','1989-08-22',20,5),(41,'Oliveira','1992-06-02',21,6),(42,'Sa','1993-01-17',21,6),(43,'Carvalho','1997-03-09',22,6),(44,'Silva','1993-05-17',22,6);
/*!40000 ALTER TABLE `joueur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journee`
--

DROP TABLE IF EXISTS `journee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journee` (
  `id_journee` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_journee` varchar(100) NOT NULL,
  `num_journee` int(11) NOT NULL,
  `id_saison` int(11) NOT NULL,
  PRIMARY KEY (`id_journee`),
  KEY `JOURNEE_SAISON_FK` (`id_saison`),
  CONSTRAINT `JOURNEE_SAISON_FK` FOREIGN KEY (`id_saison`) REFERENCES `saison` (`id_saison`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journee`
--

LOCK TABLES `journee` WRITE;
/*!40000 ALTER TABLE `journee` DISABLE KEYS */;
INSERT INTO `journee` VALUES (1,'Journée 1 - Ligue 1',1,1),(2,'Journée 2 - Ligue 1',2,1),(3,'Journée 1 - Liga BBVA',1,2),(4,'Journée 1 - Liga BBVA',2,2),(5,'Journée 1 - Premier League',1,3),(6,'Journée 1 - Premier League',2,3),(7,'Journée 1 - Serie A',1,4),(8,'Journée 1 - Serie A',2,4),(9,'Journée 1 - Bundesliga',1,5),(10,'Journée 1 - Bundesliga',2,5),(11,'Journée 1 - Liga Sagres',1,6),(12,'Journée 1 - Liga Sagres',2,6),(13,'Journée 1 - Pro League',1,7),(14,'Journée 1 - Pro League',2,7),(15,'Journée 1 - Super League',1,8),(16,'Journée 1 - Super League',2,8);
/*!40000 ALTER TABLE `journee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchs`
--

DROP TABLE IF EXISTS `matchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchs` (
  `id_matchs` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_matchs` varchar(100) NOT NULL,
  `date_matchs` date NOT NULL,
  `score_domicile_matchs` int(11) NOT NULL,
  `score_exterieur_matchs` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `id_equipe_deplacer` int(11) NOT NULL,
  `id_journee` int(11) NOT NULL,
  PRIMARY KEY (`id_matchs`),
  KEY `MATCHS_EQUIPE_FK` (`id_equipe`),
  KEY `MATCHS_EQUIPE0_FK` (`id_equipe_deplacer`),
  KEY `MATCHS_JOURNEE1_FK` (`id_journee`),
  CONSTRAINT `MATCHS_EQUIPE0_FK` FOREIGN KEY (`id_equipe_deplacer`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `MATCHS_EQUIPE_FK` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `MATCHS_JOURNEE1_FK` FOREIGN KEY (`id_journee`) REFERENCES `journee` (`id_journee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchs`
--

LOCK TABLES `matchs` WRITE;
/*!40000 ALTER TABLE `matchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id_msg` int(11) NOT NULL AUTO_INCREMENT,
  `userID_msg` int(11) NOT NULL,
  `articleID_msg` int(11) NOT NULL,
  `content_msg` varchar(1000) NOT NULL,
  `datecreation_msg` date NOT NULL,
  `datemodif_msg` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  PRIMARY KEY (`id_msg`),
  KEY `MESSAGE_Utilisateur_FK` (`id_user`),
  KEY `MESSAGE_ARTICLE0_FK` (`id_article`),
  CONSTRAINT `MESSAGE_ARTICLE0_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  CONSTRAINT `MESSAGE_Utilisateur_FK` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays` (
  `id_pays` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'France'),(2,'Espagne'),(3,'Angleterre'),(4,'Allemagne'),(5,'Italie'),(6,'Portugal'),(7,'Belgique'),(8,'Suisse');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saison`
--

DROP TABLE IF EXISTS `saison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saison` (
  `id_saison` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_saison` varchar(100) NOT NULL,
  `datedeb_saison` date NOT NULL,
  `datefin_saison` date NOT NULL,
  `id_championnat` int(11) NOT NULL,
  PRIMARY KEY (`id_saison`),
  KEY `SAISON_CHAMPIONNAT_FK` (`id_championnat`),
  CONSTRAINT `SAISON_CHAMPIONNAT_FK` FOREIGN KEY (`id_championnat`) REFERENCES `championnat` (`id_championnat`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saison`
--

LOCK TABLES `saison` WRITE;
/*!40000 ALTER TABLE `saison` DISABLE KEYS */;
INSERT INTO `saison` VALUES (1,'saison 2017-2018','2017-08-04','2018-05-19',1),(2,'saison 2017-2018','2017-08-04','2018-05-19',2),(3,'saison 2017-2018','2017-08-04','2018-05-19',3),(4,'saison 2017-2018','2017-08-04','2018-05-19',4),(5,'saison 2017-2018','2017-08-04','2018-05-19',5),(6,'saison 2017-2018','2017-08-04','2018-05-19',6),(7,'saison 2017-2018','2017-08-04','2018-05-19',7),(8,'saison 2017-2018','2017-08-04','2018-05-19',8);
/*!40000 ALTER TABLE `saison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tag` varchar(50) NOT NULL,
  `articlecount_tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeuser`
--

DROP TABLE IF EXISTS `typeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeuser` (
  `id_typeuser` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_typeuser` varchar(50) NOT NULL,
  PRIMARY KEY (`id_typeuser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeuser`
--

LOCK TABLES `typeuser` WRITE;
/*!40000 ALTER TABLE `typeuser` DISABLE KEYS */;
INSERT INTO `typeuser` VALUES (1,'administrateur'),(2,'editeur'),(3,'membre');
/*!40000 ALTER TABLE `typeuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo_user` varchar(50) NOT NULL,
  `nom_user` varchar(50) NOT NULL,
  `prenom_user` varchar(50) NOT NULL,
  `email_user` varchar(80) NOT NULL,
  `motdepasse_user` varchar(50) NOT NULL,
  `rue_user` varchar(80) DEFAULT NULL,
  `codepostal_user` varchar(5) DEFAULT NULL,
  `ville_user` varchar(60) NOT NULL,
  `pays_user` varchar(50) NOT NULL,
  `datenaiss_user` date NOT NULL,
  `tel_user` varchar(14) DEFAULT NULL,
  `genre_user` char(1) DEFAULT NULL,
  `type_user` int(11) NOT NULL COMMENT 'table liée statut user',
  `isnewsletter_user` tinyint(1) NOT NULL,
  `id_typeuser` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `Utilisateur_TYPEUSER_FK` (`id_typeuser`),
  CONSTRAINT `Utilisateur_TYPEUSER_FK` FOREIGN KEY (`id_typeuser`) REFERENCES `typeuser` (`id_typeuser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'kenny','robert','kenny','kenny.robert@epsi.fr','password','victor hugo','69520','grigny','france','1997-05-03','0695408160','h',1,1,1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-18 10:05:47
