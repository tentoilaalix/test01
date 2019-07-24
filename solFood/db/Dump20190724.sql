-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: solfood
-- ------------------------------------------------------
-- Server version	5.7.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `account_user` varchar(20) COLLATE utf8_bin NOT NULL,
  `account_password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `account_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `account_date` date DEFAULT NULL,
  `account_tel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `account_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `account_grade` int(20) DEFAULT NULL,
  `account_age` int(20) DEFAULT NULL,
  `account_gender` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `account_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`account_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1','1','Fripp','2019-06-12','650-123-2234','서울시 종로구',1,50,'m','AFRIPP@gmail.com'),('1809','1809','1809','2019-06-12','1809','1809',0,1809,'1809','1809'),('2','2222','2','2019-07-19','01022221111','2',1,10,'M','2'),('3','3333','3','2019-07-19','01033332222','3',1,10,'M','3'),('4','4444','4','2019-07-19','01044442222','4',1,10,'M','4'),('5','5555','5','2019-07-19','01055551111','5',1,10,'M','5'),('6','6666','6','2019-07-19','01066661111','6',1,10,'M','6'),('7','7777','7','2019-07-19','01011117777','7',1,19910707,'M',''),('Alana','1111','Walsh','2006-04-24','650-507-9811','서울시 용산구',1,50,'m','AWALSH@gmail.com'),('Alberto','1111','Errazuriz','2005-03-10','011-344-4292','서울시 서초구',1,80,'m','AERRAZUR@gmail.com'),('Alexander','1111','Hunold','2006-01-03','590-423-4567','강원도 강릉시',1,60,'m','AHUNOLD@gmail.com'),('Alexander2','1111','Khoo','2003-05-18','515-127-4562','서울시 동대문구',1,30,'m','AKHOO@gmail.com'),('Alexis','1111','Bull','2005-02-20','650-509-2876','서울시 용산구',1,50,'m','ABULL@gmail.com'),('Allan','1111','McEwen','2004-08-01','011-345-8292','서울시 중구',1,80,'m','AMCEWEN@gmail.com'),('Alyssa','1111','Hutton','2005-03-19','011-346-3292','서울시 노원구',1,80,'m','AHUTTON@gmail.com'),('Amit','1111','Banda','2008-04-21','011-346-3292','서울시 노원구',1,80,'m','ABANDA@gmail.com'),('Anthony','1111','Cabrio','2007-02-07','650-509-4876','서울시 용산구',1,50,'m','ACABRIO@gmail.com'),('Britney','1111','Everett','2005-03-03','650-501-2876','서울시 용산구',1,50,'m','BEVERETT@gmail.com'),('Bruce','1111','Ernst','2007-05-21','590-423-4568','강원도 강릉시',1,60,'m','BERNST@gmail.com'),('Charles','1111','Johnson','2008-01-04','011-346-3292','서울시 노원구',1,80,'m','CJOHNSON@gmail.com'),('Christopher','1111','Olsen','2006-03-30','011-344-4987','서울시 중구',1,80,'m','COLSEN@gmail.com'),('Clara','1111','Vishney','2005-11-11','011-346-1292','서울시 중구',1,80,'m','CVISHNEY@gmail.com'),('Curtis','1111','Davies','2005-01-29','650-121-2994','서울시 강남구',1,50,'m','CDAVIES@gmail.com'),('Daniel','1111','Faviet','2002-08-16','515-124-4169','서울시 성북구',1,100,'m','DFAVIET@gmail.com'),('Danielle','1111','Greene','2007-03-19','011-346-2292','서울시 중구',1,80,'m','DGREENE@gmail.com'),('David','1111','Austin','2005-06-25','590-423-4569','강원도 강릉시',1,60,'m','DAUSTIN@gmail.com'),('David123','1111','Bernstein','2005-03-24','011-344-3452','서울시 서초구',1,80,'m','DBERNSTE@gmail.com'),('David878','1111','Lee','2008-02-23','011-346-3292','서울시 중구',1,80,'m','DLEE@gmail.com'),('Den','1111','Raphaely','2002-12-07','515-127-4561','서울시 강북구',1,30,'m','DRAPHEAL@gmail.com'),('Diana','1111','Lorentz','2007-02-07','590-423-5567','강원도 강릉시',1,60,'m','DLORENTZ@gmail.com'),('Donald','1111','OConnell','2007-06-21','650-507-9833','서울시 용산구',1,50,'m','DOCONNEL@gmail.com'),('Douglas','1111','Grant','2008-01-13','650-507-9844','인천시 계양구',1,50,'m','DGRANT@gmail.com'),('Eleni','1111','Zlotkey','2008-01-29','011-344-4290','서울시 서초구',1,80,'m','EZLOTKEY@gmail.com'),('Elizabeth','1111','Bates','2007-03-24','011-346-3292','서울시 노원구',1,80,'m','EBATES@gmail.com'),('Ellen','1111','Abel','2004-05-11','011-346-3292','서울시 노원구',1,80,'m','EABEL@gmail.com'),('Gerald','1111','Cambrault','2007-10-15','011-344-6192','서울시 서초구',1,80,'m','GCAMBRAU@gmail.com'),('Girard','1111','Geoni','2008-02-03','650-507-9879','서울시 용산구',1,50,'m','GGEONI@gmail.com'),('Guy','1111','Himuro','2006-11-15','515-127-4565','서울시 동대문구',1,30,'m','GHIMURO@gmail.com'),('Harrison','1111','Bloom','2006-03-23','011-346-3292','서울시 노원구',1,80,'m','HBLOOM@gmail.com'),('Hazel','1111','Philtanker','2008-02-06','650-127-1634','서울시 강남구',1,50,'m','HPHILTAN@gmail.com'),('Hermann','1111','Baer','2002-06-07','515-123-8888','인천시 계양구',1,70,'m','HBAER@gmail.com'),('Irene','1111','Mikkilineni','2006-09-28','650-124-1224','서울시 종로구',1,50,'m','IMIKKILI@gmail.com'),('Ismael','1111','Sciarra','2005-09-30','515-124-4369','서울시 성북구',1,100,'m','ISCIARRA@gmail.com'),('Jack','1111','Livingston','2006-04-23','011-346-3292','서울시 노원구',1,80,'m','JLIVINGS@gmail.com'),('James','1111','Landry','2007-01-14','650-124-1334','서울시 종로구',1,50,'m','JLANDRY@gmail.com'),('James2','1111','Marlow','2005-02-16','650-124-7234','서울시 강남구',1,50,'m','JAMRLOW@gmail.com'),('Janette','1111','King','2004-01-30','011-345-4292','서울시 중구',1,80,'m','JKING@gmail.com'),('Jason','1111','Mallin','2004-06-14','650-127-1934','서울시 강남구',1,50,'m','JMALLIN@gmail.com'),('Jean','1111','Fleaur','2006-02-23','650-507-9877','서울시 용산구',1,50,'m','JFLEAUR@gmail.com'),('Jennifer','1111','Dilly','2005-08-13','650-505-2876','서울시 용산구',1,50,'m','JDILLY@gmail.com'),('Jennifer555','1111','Whalen','2003-09-17','515-123-4444','인천시 계양구',1,10,'m','JWHALEN@gmail.com'),('John','1111','Chen','2005-09-28','515-124-4269','서울시 성북구',1,100,'m','JCHEN@gmail.com'),('John123','1111','Seo','2006-02-12','650-121-2019','서울시 강남구',1,50,'m','JSEO@gmail.com'),('John33','1111','Russell','2004-10-01','011-344-4292','서울시 서초구',1,80,'m','JRUSSEL@gmail.com'),('Jonathon','1111','Taylor','2006-03-24','011-346-3292','서울시 노원구',1,80,'m','JTAYLOR@gmail.com'),('Jose Manuel','1111','Urman','2006-03-07','515-124-4469','서울시 성북구',1,100,'m','JMURMAN@gmail.com'),('Joshua','1111','Patel','2006-04-06','650-121-1834','서울시 강남구',1,50,'m','JPATEL@gmail.com'),('Julia','1111','Nayer','2005-07-16','650-124-1214','서울시 종로구',1,50,'m','JNAYER@gmail.com'),('Julia657','1111','Dellinger','2006-06-24','650-509-3876','서울시 용산구',1,50,'m','JDELLING@gmail.com'),('Karen','1111','Colmenares','2007-08-10','515-127-4566','서울시 동대문구',1,30,'m','KCOLMENA@gmail.com'),('Karen44','1111','Partners','2005-01-05','011-344-4672','서울시 서초구',1,80,'m','KPARTNER@gmail.com'),('Kelly','1111','Chung','2005-06-14','650-505-1876','서울시 용산구',1,50,'m','KCHUNG@gmail.com'),('Kevin','1111','Mourgos','2007-11-16','650-123-5234','서울시 종로구',1,50,'m','KMOURGOS@gmail.com'),('Kevin68','1111','Feeney','2006-05-23','650-507-9822','서울시 용산구',1,50,'m','KFEENEY@gmail.com'),('Ki','1111','Gee','2007-12-12','650-127-1734','서울시 강남구',1,50,'m','KGEE@gmail.com'),('Kimberely','1111','Grant','2007-05-24','011-346-3292','서울시 노원구',1,80,'m','KGRANT@gmail.com'),('Laura','1111','Bissot','2005-08-20','650-124-5234','서울시 종로구',1,50,'m','LBISSOT@gmail.com'),('Lex','1111','De Haan','2001-01-13','515-123-4569','제주도 서귀포시',1,90,'m','LDEHAAN@gmail.com'),('Lindsey','1111','Smith','2005-03-10','011-345-7292','서울시 중구',1,80,'m','LSMITH@gmail.com'),('Lisa','1111','Ozer','2005-03-11','011-346-3292','서울시 노원구',1,80,'m','LOZER@gmail.com'),('Louise','1111','Doran','2005-12-15','011-345-6292','서울시 중구',1,80,'m','LDORAN@gmail.com'),('Luis','1111','Popp','2007-12-07','515-124-4567','서울시 성북구',1,100,'m','LPOPP@gmail.com'),('Martha','1111','Sullivan','2007-06-21','650-507-9878','서울시 용산구',1,50,'m','MSULLIVA@gmail.com'),('Mattea','1111','Marvins','2008-01-24','011-346-3292','서울시 중구',1,80,'m','MMARVINS@gmail.com'),('Matthew','1111','Weiss','2004-07-18','650-123-1234','서울시 종로구',1,50,'m','MWEISS@gmail.com'),('Michael','1111','Rogers','2006-08-26','650-127-1834','서울시 강남구',1,50,'m','MROGERS@gmail.com'),('Michael122','1111','Hartstein','2004-02-17','515-123-5555','인천시 계양구',1,20,'m','MHARTSTE@gmail.com'),('Mozhe','1111','Atkinson','2005-10-30','650-124-6234','서울시 강남구',1,50,'m','MATKINSO@gmail.com'),('Nancy','1111','Greenberg','2002-08-17','515-124-4569','강원도 태백시',1,100,'m','NGREENBE@gmail.com'),('Nandita','1111','Sarchand','2004-01-27','650-509-1876','서울시 용산구',1,50,'m','NSARCHAN@gmail.com'),('Nanette','1111','Cambrault','2006-12-09','011-344-9876','서울시 중구',1,80,'m','NCAMBRAU@gmail.com'),('Neena','1111','Kochhar','2005-09-21','515-123-4568','제주도 서귀포시',1,90,'m','NKOCHHAR@gmail.com'),('Oliver','1111','Tuvault','2007-11-23','011-344-4865','서울시 중구',1,80,'m','OTUVAULT@gmail.com'),('Pat','1111','Fay','2005-08-17','603-123-6666','인천시 계양구',1,20,'m','PFAY@gmail.com'),('Patrick','1111','Sully','2004-03-04','011-345-9292','서울시 중구',1,80,'m','PSULLY@gmail.com'),('Payam','1111','Kaufling','2003-05-01','650-123-3234','서울시 종로구',1,50,'m','PKAUFLIN@gmail.com'),('Peter','1111','Vargas','2006-07-09','650-121-2004','서울시 강남구',1,50,'m','PVARGAS@gmail.com'),('Peter22','1111','Tucker','2005-01-30','011-344-1292','서울시 서초구',1,80,'m','PTUCKER@gmail.com'),('Peter555','1111','Hall','2005-08-20','011-344-4789','서울시 중구',1,80,'m','PHALL@gmail.com'),('Randall','1111','Matos','2006-03-15','650-121-2874','서울시 강남구',1,50,'m','RMATOS@gmail.com'),('Randall345','1111','Perkins','2007-12-19','650-505-4876','서울시 용산구',1,50,'m','RPERKINS@gmail.com'),('Renske','1111','Ladwig','2003-07-14','650-121-1234','서울시 강남구',1,50,'m','RLADWIG@gmail.com'),('Samuel','1111','McCain','2006-07-01','650-501-3876','서울시 용산구',1,50,'m','SMCCAIN@gmail.com'),('Sarah','1111','Bell','2004-02-04','650-501-1876','서울시 용산구',1,50,'m','SBELL@gmail.com'),('Sarath','1111','Sewall','2006-11-03','011-345-5292','서울시 중구',1,80,'m','SSEWALL@gmail.com'),('Shanta','1111','Vollman','2005-10-10','650-123-4234','서울시 종로구',1,50,'m','SVOLLMAN@gmail.com'),('Shelley','1111','Higgins','2002-06-07','515-123-8080','인천시 계양구',1,110,'m','SHIGGINS@gmail.com'),('Shelli','1111','홍길동','2005-12-24','515-127-4563','서울시 동대문구',1,30,'m','SBAIDA@gmail.com'),('Sigal','1111','Tobias','2005-07-24','515-127-4564','서울시 동대문구',1,30,'m','STOBIAS@gmail.com'),('Stephen','1111','Stiles','2005-10-26','650-121-2034','서울시 강남구',1,50,'m','SSTILES@gmail.com'),('Steven','1111','King','2003-06-17','515-123-4567','제주도 제주시',1,90,'m','SKING@gmail.com'),('Steven2','1111','Markle','2008-03-08','650-124-1434','서울시 종로구',1,50,'m','SMARKLE@gmail.com'),('Sundar','1111','Ande','2008-03-24','011-346-3292','서울시 중구',1,80,'m','SANDE@gmail.com'),('Sundita','1111','Kumar','2008-04-21','011-346-3292','서울시 노원구',1,80,'m','SKUMAR@gmail.com'),('Susan','1111','Mavris','2002-06-07','515-123-7777','인천시 계양구',1,40,'m','SMAVRIS@gmail.com'),('TJ','1111','Olson','2007-04-10','650-124-8234','서울시 강남구',1,50,'m','TJOLSON@gmail.com'),('Tayler','1111','Fox','2006-01-24','011-346-3292','서울시 노원구',1,80,'m','TFOX@gmail.com'),('Timothy','1111','Gates','2006-07-11','650-505-3876','서울시 용산구',1,50,'m','TGATES@gmail.com'),('Trenna','1111','Rajs','2003-10-17','650-121-8009','서울시 강남구',1,50,'m','TRAJS@gmail.com'),('Valli','1111','Pataballa','2006-02-05','590-423-4560','강원도 강릉시',1,60,'m','VPATABAL@gmail.com'),('Vance','1111','Jones','2007-03-17','650-501-4876','서울시 용산구',1,50,'m','VJONES@gmail.com'),('William','1111','Smith','2007-02-23','011-346-3292','서울시 노원구',1,80,'m','WSMITH@gmail.com'),('William3453','1111','Gietz','2002-06-07','515-123-8181','인천시 계양구',1,110,'m','WGIETZ@gmail.com'),('William87','1111','Gietz','2002-06-07','515-123-8181','인천시 계양구',1,110,'m','WGIETZ@gmail.com'),('Winston','1111','Taylor','2006-01-24','650-507-9876','서울시 용산구',1,50,'m','WTAYLOR@gmail.com'),('eee','eee','eee','2019-07-22','11','11',1,11,'F',NULL),('iiii','iiii','iiii','2019-07-23','06050505050','iiii',1,66666666,'F',NULL),('jjjj','jjjj','jjjj','2019-07-23','01024269712','jjjj',1,19940527,'M',NULL),('rrrr','rrrr','rrrr','2019-07-23','11111111111','rrrr',1,19000606,'F',NULL),('tttt','ffff','ffff','2019-07-23','01022223333','ffff',1,11111111,'M',NULL),('youngmin','1234','youngmin','2019-07-19','010242697','seoul',1,10,'M','youngmin7854@naver.com'),('youngmin78','tttt','tttt','2019-07-23','01024269712','No',1,19910606,'F',NULL),('yyyy','yyyy','yyyy','2019-07-23','01022221111','yyyy',1,19910605,'F',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board` (
  `BOARD_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `board_date` date NOT NULL,
  `board_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `board_category` varchar(20) COLLATE utf8_bin NOT NULL,
  `board_content` varchar(1000) COLLATE utf8_bin NOT NULL,
  `board_file` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `board_readcount` int(20) NOT NULL,
  `board_comment` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `account_user` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`BOARD_NUM`),
  KEY `board_FK` (`account_user`),
  CONSTRAINT `board_FK` FOREIGN KEY (`account_user`) REFERENCES `account` (`account_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'2019-07-24','youngmin','event','영민 바보',NULL,5,NULL,'youngmin'),(2,'2019-07-24','@@@@','event','@@@@',NULL,3,NULL,'youngmin');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buy` (
  `buy_id` int(20) NOT NULL AUTO_INCREMENT,
  `buy_date` date DEFAULT NULL,
  `buy_count` int(20) DEFAULT NULL,
  `account_user` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`buy_id`),
  KEY `buy_FK2` (`product_id`),
  KEY `buy_FK1` (`account_user`),
  CONSTRAINT `buy_FK1` FOREIGN KEY (`account_user`) REFERENCES `account` (`account_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buy_FK2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (92,'2019-07-15',1,'1809',1),(93,'2019-07-16',1,'1809',1),(94,'2019-07-16',3,'1',2),(95,'2019-07-16',2,'1',3);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `CART_ID` int(10) NOT NULL AUTO_INCREMENT,
  `cart_date` date DEFAULT NULL,
  `cart_count` int(10) DEFAULT '0',
  `product_id` int(20) DEFAULT NULL,
  `account_user` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CART_ID`),
  KEY `CART_FK1` (`product_id`),
  KEY `CART_FK2` (`account_user`),
  CONSTRAINT `CART_FK1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CART_FK2` FOREIGN KEY (`account_user`) REFERENCES `account` (`account_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (24,'2019-07-23',2,1,'1809'),(25,NULL,0,1,NULL),(26,NULL,0,1,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `reply_num` int(11) NOT NULL AUTO_INCREMENT,
  `reply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reply_content` varchar(100) DEFAULT NULL,
  `board_num` int(11) DEFAULT NULL,
  `reply_writer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reply_num`),
  KEY `fk1_idx` (`board_num`),
  CONSTRAINT `fk1` FOREIGN KEY (`board_num`) REFERENCES `board` (`BOARD_NUM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'2019-07-24 07:59:56','1등~',2,NULL),(2,'2019-07-24 08:00:11','2등~ 수정완료',2,NULL),(3,'2019-07-24 08:00:59','영민 바보123',1,NULL),(5,'2019-07-24 08:01:24','바보래요',1,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heart`
--

DROP TABLE IF EXISTS `heart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `heart` (
  `heart_num` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`heart_num`),
  KEY `like_FK` (`product_id`),
  CONSTRAINT `like_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heart`
--

LOCK TABLES `heart` WRITE;
/*!40000 ALTER TABLE `heart` DISABLE KEYS */;
INSERT INTO `heart` VALUES (114,1),(117,1),(118,1),(119,1),(115,2),(116,5);
/*!40000 ALTER TABLE `heart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notice` (
  `notice_num` int(20) NOT NULL,
  `notice_date` date NOT NULL,
  `notice_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `notice_category` varchar(20) COLLATE utf8_bin NOT NULL,
  `notice_content` varchar(1000) COLLATE utf8_bin NOT NULL,
  `notice_file` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `notice_readcount` int(20) NOT NULL,
  `notice_comment` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `account_user` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`notice_num`),
  KEY `notice_FK` (`account_user`),
  CONSTRAINT `notice_FK` FOREIGN KEY (`account_user`) REFERENCES `account` (`account_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` int(20) NOT NULL,
  `product_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `product_category1` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `product_category2` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `product_price` int(20) DEFAULT NULL,
  `product_discountrate` int(20) DEFAULT NULL,
  `product_count` int(20) unsigned DEFAULT NULL,
  `product_image` varchar(10000) COLLATE utf8_bin DEFAULT NULL,
  `product_package` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `product_ea` int(20) DEFAULT NULL,
  `product_content` varchar(10000) COLLATE utf8_bin DEFAULT NULL,
  `product_date` date DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'신선한 고구마 2입','채소·과일','기본채소',10,10,2,'\\productImg\\7d1d1f19-c898-480c-9801-e6efe6033e76_9.PNG','실온',2,'1','2018-08-30'),(2,'초당 옥수수 2입','채소·과일','기본채소',5000,10,50,'\\productImg\\9b3e5a17-1342-4fd1-872d-ef0d5623e7f0_2.PNG','실온',2,'SolFood제품','2012-12-12'),(3,'당근 2입','채소·과일','기본채소',2300,5,100,'\\productImg\\1b2fa938-3ac6-4181-846c-80adfe34e5a1_4.PNG','실온',2,'SolFood제품','2018-08-30'),(4,'무농약 미니밤호박 1입','채소·과일','기본채소',3900,5,100,'\\productImg\\84e770f0-5cb8-43c7-8890-4dd09a0287c5_7.PNG','실온',1,'SolFood제품','2018-08-30'),(5,'무농약 양배추 1입','채소·과일','기본채소',2900,5,100,'\\productImg\\d3ab1f26-5ba2-491e-abd7-eca48403a4a2_5.PNG','실온',1,'SolFood제품','2018-08-30'),(6,'신선 애호박 1입','채소·과일','기본채소',1400,5,100,'\\productImg\\322fd72a-226e-47d2-b880-e3585a7942ca_6.PNG','실온',1,'SolFood제품','2018-08-30'),(7,'무농약 간편 샐러드 6종','채소·과일','쌈·간편채소',6000,0,50,'\\productImg\\d847b4bf-e0f0-4ea4-85ab-e28a163a1090_10.PNG','냉장',6,'SolFood제품','2018-08-30'),(8,'신선 깻잎 30매','채소·과일','쌈·간편채소',1500,0,100,'\\productImg\\59c55962-b51b-448b-8b97-2b3485f3fb53_12.PNG','냉장',30,'SolFood제품','2018-08-30'),(9,'국산콩 무농약 콩나물 300g','채소·과일','콩나물·버섯류',1500,0,100,'\\productImg\\b20fa873-36aa-4b1b-958e-849f4b684f60_13.PNG','냉장',300,'SolFood제품','2018-08-30'),(10,'양송이버섯 8입','채소·과일','콩나물·버섯류',3500,0,100,'\\productImg\\066c021f-2f13-46d9-8e90-af9e38ec8467_14.PNG','실온',8,'SolFood제품','2018-08-30'),(11,'햇 양파 1kg','채소·과일','양파·마늘·생강·파',3200,5,100,'\\productImg\\2887689c-e7ed-4759-ac9f-d9cab0e81175_15.PNG','실온',1000,'SolFood제품','2018-08-30'),(12,'설렁탕 & 양곰탕 (각 200g)','국·반찬·요리','국·탕·찌개',15000,5,100,'\\productImg\\f9cd6168-e538-464e-9ac7-0aaff69bbd03_2.PNG','냉장',200,'SolFood제품','2018-08-30'),(13,'초복 삼계탕 200g','국·반찬·요리','국·탕·찌개',9900,5,100,'\\productImg\\71c6c6ec-679a-4899-970e-9e46c4a359e9_3.PNG','냉장',200,'SolFood제품','2018-08-30'),(14,'인기 반찬 9종 세트 500g','국·반찬·요리','밑반찬',9900,5,100,'\\productImg\\31c8ebde-997c-4573-8948-c515209c0bd7_1.PNG','냉장',500,'SolFood제품','2018-08-30'),(15,'여름나물 3종 모둠 300g','국·반찬·요리','밑반찬',7800,5,100,'\\productImg\\3669ef60-07f6-483a-a3a2-30c0991b95f1_3.PNG','냉장',300,'SolFood제품','2018-08-30'),(16,'무말랭이김치 100g','국·반찬·요리','김치·장아찌·젓갈',3500,0,100,'\\productImg\\d7462aa0-76b9-415e-bed0-b6807344d12a_4.PNG','냉장',100,'SolFood제품','2018-08-30'),(17,'간편장아찌 모둠 10종 500g','국·반찬·요리','김치·장아찌·젓갈',7000,20,100,'\\productImg\\13f126aa-0ce4-48bc-b0e2-6facc2332611_5.PNG','냉장',500,'SolFood제품','2018-08-30'),(18,'토종콩 두부 200g','국·반찬·요리','두부·어묵',2500,0,100,'\\productImg\\7e84b9a1-d3aa-49c4-aca1-7996cbd5a50a_6.PNG','냉장',200,'SolFood제품','2018-08-30'),(19,'면두부 & 쌈두부 200g','국·반찬·요리','두부·어묵',3500,0,100,'\\productImg\\961b2a6d-b622-44e6-8828-689668bb0a6d_7.PNG','냉장',200,'SolFood제품','2018-08-30'),(20,'[삼원가든]목살 양념 구이 500g','국·반찬·요리','메인요리',16000,0,100,'\\productImg\\55d62668-fb0d-4acb-baa8-3c81cfb38357_8.PNG','냉장',500,'SolFood제품','2018-08-30'),(21,'와규 떡갈비 300g','국·반찬·요리','메인요리',9900,5,100,'\\productImg\\f5975a5e-e284-4c91-8a11-23df7d89e13a_9.PNG','냉장',300,'SolFood제품','2018-08-30'),(22,'신선 소고기 500g','정육·계란','소고기',13000,5,1000,'\\productImg\\9f0a4a21-7521-4290-b258-fd799f8a2e2b_6.PNG','냉장',500,'SolFood제품','2018-08-30'),(23,'바베큐백립 1kg','정육·계란','소고기',25000,15,100,'\\productImg\\a0d2e5ac-a21c-42ec-8966-0aa9c56935b8_5.PNG','냉장',1000,'SolFood제품','2018-08-30'),(24,'이베리코 갈비살 500g','정육·계란','돼지고기',20000,5,100,'\\productImg\\c2309bee-f16a-448b-aa60-acc645060a6f_10.PNG','냉장',500,'SolFood제품','2018-08-30'),(25,'[미트클레버]건강 삼겹살 500g','정육·계란','돼지고기',15000,5,100,'\\productImg\\daf9ea6d-85f7-4142-9e14-2a115079d538_11.PNG','냉장',500,'SolFood제품','2018-08-30'),(26,'시그니처 양갈비 300g','정육·계란','양고기',15000,5,100,'\\productImg\\ae03585f-f271-4e59-8c5d-27a15628fc18_12.PNG','냉장',300,'SolFood제품','2018-08-30'),(27,'[토마스푸드]프렌치 양고기 300g','정육·계란','양고기',16000,5,100,'\\productImg\\cf84032c-d747-4fa9-8385-7cd25d5e2c7c_13.PNG','냉장',300,'SolFood제품','2018-08-30'),(28,'무항생제 닭고기 200g','정육·계란','닭·오리고기',9900,20,100,'\\productImg\\fdd5e559-78e2-4d1c-9d00-e7e0e97aa0b8_8.PNG','냉장',200,'SolFood제품','2018-08-30'),(29,'토종닭 한마리 500g','정육·계란','닭·오리고기',13000,5,100,'\\productImg\\0ce3c05b-15d7-40a0-95ee-3ab6b019a46d_9.PNG','냉장',500,'SolFood제품','2018-08-30'),(30,'동물복지 유정란 20입','정육·계란','계란·돈까스',6500,5,100,'\\productImg\\6b04ba11-aff6-47b4-8721-493ed4f7f12b_1.PNG','냉장',20,'SolFood제품','2018-08-30'),(31,'무항생제 달걀 10입','정육·계란','계란·돈까스',4000,5,100,'\\productImg\\913b53cc-3545-4863-b743-868c1a679000_4.PNG','냉장',10,'SolFood제품','2018-08-30'),(32,'콥샐러드 3종 세트 ','샐러드·간편식','샐러드·도시락',15000,5,100,'\\productImg\\2010dde2-07c9-464b-89ae-5eb4c77b5bb1_1.PNG','냉장',3,'SolFood제품','2018-08-30'),(33,'[프레시웨이]참치 샐러드 300g','샐러드·간편식','샐러드·도시락',9900,0,100,'\\productImg\\4252dd4e-1684-4152-b289-fd2b3b5a120a_2.PNG','냉장',300,'SolFood제품','2018-08-30'),(34,'[밀하우스]간편 닭가슴살 3종','샐러드·간편식','간편식·냉동식품',9900,5,100,'\\productImg\\27d4ebe0-b318-4262-8055-c39778441096_3.PNG','냉동',3,'SolFood제품','2018-08-30'),(35,'[밀하우스]타마고산도 300g','샐러드·간편식','간편식·냉동식품',9900,5,100,'\\productImg\\9b0d1f61-5329-4d6b-acac-1ab0b4d843e9_4.PNG','냉장',300,'SolFood제품','2018-08-30'),(36,'크림 수프 4종 세트 (각 100g)','샐러드·간편식','죽·수프',9900,5,100,'\\productImg\\4ce8cb01-8ac8-4a72-9a73-5d3ef307be99_5.PNG','냉장',4,'SolFood제품','2018-08-30'),(37,'[본죽]야채죽 100g','샐러드·간편식','죽·수프',1500,0,100,'\\productImg\\43507c28-01a4-4472-86d9-50befaf6b648_6.PNG','실온',100,'SolFood제품','2018-08-30'),(38,'[다노샵]브라운 라이스 소울 5종 세','샐러드·간편식','선식·시리얼·그래놀라',9900,5,100,'\\productImg\\cc15bf33-12ea-4084-aa05-d36bdb2af9f6_7.PNG','실온',5,'SolFood제품','2018-08-30');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recent`
--

DROP TABLE IF EXISTS `recent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recent` (
  `recent_num` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  PRIMARY KEY (`recent_num`),
  KEY `recent_FK` (`product_id`),
  CONSTRAINT `recent_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recent`
--

LOCK TABLES `recent` WRITE;
/*!40000 ALTER TABLE `recent` DISABLE KEYS */;
/*!40000 ALTER TABLE `recent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recipe` (
  `recipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_image` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `recipe_content` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `recipe_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `recipe_keyword` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `recipe_date` date DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `recipe_fk1_idx` (`product_id`),
  CONSTRAINT `recipe_fk1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (14,'\\productImg\\99bb5c1b-868e-43d2-81b8-4f61ca56a8d6_8.PNG','<p><b>1</b></p>','두부','우유',1,'2011-11-10'),(15,'\\productImg\\d2ca9c1e-5df2-494b-acd9-d220e905f684_11.jpeg','<p><b>곤약무침 </b></p>','곤약무침','감자 곤약 무침 시금치',NULL,'2012-12-11');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `search` (
  `search_num` int(20) NOT NULL,
  `account_user` varchar(20) COLLATE utf8_bin NOT NULL,
  `search_keyword` varchar(100) COLLATE utf8_bin NOT NULL,
  `search_date` date NOT NULL,
  PRIMARY KEY (`search_num`),
  KEY `search_FK` (`account_user`),
  CONSTRAINT `search_FK` FOREIGN KEY (`account_user`) REFERENCES `account` (`account_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-24 17:02:23
