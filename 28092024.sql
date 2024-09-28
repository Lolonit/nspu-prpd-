-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: turchin_3008120
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `autoservice`
--

DROP TABLE IF EXISTS `autoservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoservice` (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `adress` mediumtext NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoservice`
--

LOCK TABLES `autoservice` WRITE;
/*!40000 ALTER TABLE `autoservice` DISABLE KEYS */;
INSERT INTO `autoservice` VALUES (21,'г. Москва, Верхняя Первомайская, 35А, стр. 1','333-66-89'),(22,'г. Москва, ул. Потешная, 6/2, стр. 18','666-99-88'),(23,'г. Москва, ул. Большая Семёновская, стр. 1','888-99-21'),(24,'г. Москва, ул. Прокатная, 7','633-45-55'),(25,'г. Москва, ул. Генерала Дорохова, стр. 4','787-88-99');
/*!40000 ALTER TABLE `autoservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoservice_has_owner`
--

DROP TABLE IF EXISTS `autoservice_has_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoservice_has_owner` (
  `autoservice_id_service` int NOT NULL,
  `owner_passport_owner` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`autoservice_id_service`,`owner_passport_owner`,`date`),
  KEY `fk_autoservice_has_owner_owner1_idx` (`owner_passport_owner`),
  KEY `fk_autoservice_has_owner_autoservice_idx` (`autoservice_id_service`),
  CONSTRAINT `fk_autoservice_has_owner_autoservice` FOREIGN KEY (`autoservice_id_service`) REFERENCES `autoservice` (`id_service`),
  CONSTRAINT `fk_autoservice_has_owner_owner1` FOREIGN KEY (`owner_passport_owner`) REFERENCES `owner` (`passport_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoservice_has_owner`
--

LOCK TABLES `autoservice_has_owner` WRITE;
/*!40000 ALTER TABLE `autoservice_has_owner` DISABLE KEYS */;
INSERT INTO `autoservice_has_owner` VALUES (25,1,'2023-12-25'),(22,2,'2023-12-25'),(22,3,'2023-12-25'),(21,5,'2023-12-25'),(21,6,'2023-12-25'),(22,6,'2023-12-25'),(23,7,'2023-12-25'),(24,9,'2023-12-25'),(23,11,'2023-12-25'),(22,13,'2023-12-25'),(21,14,'2023-12-25'),(23,15,'2023-12-25'),(21,16,'2023-12-25'),(21,18,'2023-12-25'),(24,19,'2023-12-25'),(22,20,'2023-12-25'),(25,20,'2023-12-25');
/*!40000 ALTER TABLE `autoservice_has_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `VIN` varchar(20) NOT NULL,
  `model` varchar(15) NOT NULL,
  `release` year NOT NULL,
  `odometr` int NOT NULL,
  `owner_passport_owner` int NOT NULL,
  PRIMARY KEY (`VIN`),
  KEY `fk_car_owner1_idx` (`owner_passport_owner`),
  CONSTRAINT `fk_car_owner1` FOREIGN KEY (`owner_passport_owner`) REFERENCES `owner` (`passport_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('1C4RJFBG5FC102220','Jeep',2004,400500,16),('1FADP3F27FL230703','Ford',2009,30000,3),('1FMCU0F77KUB91825','	Ford',2019,60000,11),('1G1BL52P0SR113667','Chevrolet',2005,600000,2),('1GNEVFKW6GJ222575','	Chevrolet',2017,29000,12),('1GNSKAKC5HR136717','	Chevrolet',2005,35000,1),('1HGCM82633A000001','Toyota',2003,500000,19),('1HGCV1F33JA000191','Honda',2020,70000,8),('1N4AL11D65C279065','Nissan',2001,36000,15),('2C3CDZBT8EH200368','Dodge',2019,15000,14),('3C4PDCAB9KT713749','Toyota',2019,30000,20),('4T1BF1FK5HU252391','Toyota',2023,20500,9),('4T1BF1FK8HU127550','BMW',1998,800000,20),('4T1BK3EK2AU557825','Toyota',2014,60000,5),('5J6TF1H52EL120516','Honda',2005,150000,13),('5NPEU46F26H043880','Hyundai',2004,100000,1),('JHMGK5H71GX002946','	Honda',2005,150000,6),('JM1BK12F7615283034','	Mazda',2001,125000,6),('JM1BK12F761528306','Mitsubishi',2006,90000,7),('JM1FE173640124193','Mazda',2009,60000,18),('JN1BJ0RR1GM284008','Nissan',2017,20500,16),('JTDKB20U557695821','Toyota',2012,180000,4),('SAJEA51B02WC70398','	Jaguar',2016,30000,10),('WBAEW53453PG03719','Honda',2019,30000,17),('YV1CM592XG1654804','Volvo',2024,10000,9);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanic`
--

DROP TABLE IF EXISTS `mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mechanic` (
  `mechanic_id` int NOT NULL AUTO_INCREMENT,
  `FIO` varchar(30) NOT NULL,
  `special` varchar(30) NOT NULL,
  `autoservice` varchar(15) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `autoservice_id_service` int NOT NULL,
  PRIMARY KEY (`mechanic_id`),
  KEY `fk_mechanic_autoservice1_idx` (`autoservice_id_service`),
  CONSTRAINT `fk_mechanic_autoservice1` FOREIGN KEY (`autoservice_id_service`) REFERENCES `autoservice` (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanic`
--

LOCK TABLES `mechanic` WRITE;
/*!40000 ALTER TABLE `mechanic` DISABLE KEYS */;
INSERT INTO `mechanic` VALUES (14,'Петров Петр Петрович','Диагност','AutoMax','7 999 111 22 33',21),(15,'Сидоров Иван Иванович','Диагност','ЕвроАвто','7 666 777 88 99',25),(16,'Иванов Иван Иванович','Диагност','ЕвроАвто','7 333 444 55 66',25),(17,'Кузнецов Николай Николаевич','Ремонт','ЕвроАвто','7 777 888 99 00',25),(18,'Михайлов Михаил Михайлович','ремонт электрооборудования','AutoMax','7 555 666 77 88',21),(19,'Фомин Фома Фомич','ремонт электрооборудования','Авто Сити','7 888 999 00 11',22),(20,'Лебедев Леонид Леонидович','Диагност','Авто Сити','7 222 333 44 55',22),(21,'Никитин Никита Никитич','ремонт электрооборудования','ЕвроАвто','7 444 555 66 77',25),(22,'Романов Роман Романович','ремонт электрооборудования','Авто Сити','7 999 111 22 33',22),(23,'Васильев Василий Васильевич','Диагност','AutoMax','7 666 777 88 99',21),(24,'Дмитриев Дмитрий Дмитриевич','ремонт электрооборудования','Авто-Старт','7 333 444 55 66',23),(25,'Егоров Егор Егорович','Ремонт','Авто-Старт','7 777 888 99 00',23),(26,'Павлов Павел Павлович','Ремонт','Авто-Старт','7 555 123 45 67',23),(27,'Сергеев Сергей Сергеевич','Диагност','Автолайн','7 111 222 33 44',24),(28,'Алексеев Алексей Алексеевич','Ремонт','Автолайн','7 901 234 56 78',24);
/*!40000 ALTER TABLE `mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nameservice`
--

DROP TABLE IF EXISTS `nameservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nameservice` (
  `name_service` varchar(15) NOT NULL,
  `opisanie` varchar(400) NOT NULL,
  PRIMARY KEY (`name_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nameservice`
--

LOCK TABLES `nameservice` WRITE;
/*!40000 ALTER TABLE `nameservice` DISABLE KEYS */;
INSERT INTO `nameservice` VALUES ('AutoMax','Мы чиним все модели авто. Берёмся за работы любой сложности: если вам отказали в другом автосервисе, то мы сможем помочь. Возьмём на себя как мелкие поломки вроде замены лампочки в фаре, так и крупные. Например, починим карбюратор, заменим тормозные колодки или ходовую. Даём гарантию на ремонт от полугода до трёх лет, в зависимости от того, что именно ремонтируем'),('Авто Сити','У нас есть пять видов дилерских сканеров для качественной компьютерной диагностики автомобилей. Они помогают найти неисправность, а наши специалисты расскажут, что с ней делать. Если клиент плохо разбирается в авто, то мы постараемся объяснить всё максимально просто'),('Авто-Старт','Наши мастера не самоутверждаются за счёт клиента и всегда объясняют простым языком, что сломалось и как это починить. Если вы плохо разбираетесь в автомобилях — не проблема! Мы готовы провести мини-лекцию без учительского тона и заумных фраз. Если вам хочется просто починить авто, не вникая в детали — тоже годится. Главное — скажите нам об этом'),('Автолайн','Мы не берёмся за работу без диагностики. Без неё невозможно понять, что именно надо ремонтировать, а в процессе могут возникнуть неприятные ситуации, когда мы чиним по просьбе клиента что-то одно, а сломано совсем другое. Диагностика бесплатная, если ремонтировать автомобиль будем мы.'),('ЕвроАвто',' Чиним то, что другие отказываются чинить. Если ваша фишка — быстрый ремонт. Чиним за три дня то, что другие чинят неделями. Если ваша особенность — качество, за которое не стыдно. Даём гарантию на ремонт до двух лет');
/*!40000 ALTER TABLE `nameservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `passport_owner` int NOT NULL AUTO_INCREMENT,
  `FIO` varchar(30) NOT NULL,
  `bd` date DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`passport_owner`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Иванов Петр Сергеевич','1985-05-16','8 999 123 45 67','ivanov_p@mail.ru'),(2,'Петров Алексей Иванович','1985-03-18','8 987 654 32 10','petrov_a@gmail.com'),(3,'Сидоров Владимир Павлович','1985-05-19','8 911 231 45 23','sidorov_v@yandex.ru'),(4,'Козлов Егор Максимович','1985-05-20','8 922 987 65 43','kozlov_e@mail.com'),(5,'Никитин Кирилл Андреевич','1985-08-20','8 953 123 45 67','nikitin_k@inbox.ru'),(6,'Морозов Антон Дмитриевич','1985-10-20','8 934 567 89 01','morozov_a@hotmail.com'),(7,'Васильев Игорь Николаевич','1985-11-20','8 977 543 21 09','vasiliev_i@rambler.ru'),(8,'Беляева Екатерина Андреевна','1985-01-01','8  988 321 65 43','belyaeva_e@mail.com.ru'),(9,'Григорьев Степан Петрович','1985-05-25','8 999 987 65 43','grigoryev_s@gmail.com'),(10,'Смирнов Александр Сергеевич','1985-04-05','8 911 234 56 78','smirnov_a@yandex.ru'),(11,'Дмитриев Павел Александрович','1985-05-04','8 922 321 65 87','dmitriev_p@inbox.ru'),(12,'Тихонов Михаил Алексеевич','1985-02-10','8 933 654 21 09','tikhonov_m@mail.com'),(13,'Федоров Илья Дмитриевич','1985-12-20','8 977 987 65 43','fedorov_i@rambler.ru'),(14,'Антонов Артем Михайлович','1985-05-09','8 999 123 45 67','antonov_a@mail.ru'),(15,'Кузнецов Денис Анатольевич','1985-02-20','8 987 654 32 10','kuznetsov_d@gmail.com'),(16,'Макаров Никита Ильич','1985-02-16','8 911 231 45 23','makarov_n@yandex.ru'),(17,'Комаров Алексей Викторович','1985-02-23','8 922 987 65 43','komarov_a@mail.com'),(18,'Богданов Владислав Олегович','1985-02-07','8 934 567 89 01','bogdanov_v@inbox.ru'),(19,'Соколов Артем Владимирович','1985-02-17','8 922 123 45 67','sokolov_a@hotmail.com'),(20,'Гаврилов Дмитрий Никитич','1985-02-25','8 932 345 65 01','gavrilov_d@rambler.ru');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remont`
--

DROP TABLE IF EXISTS `remont`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remont` (
  `car_VIN` varchar(20) NOT NULL,
  `nameservice_name_service` varchar(15) NOT NULL,
  `mechanic_mechanic_id` int NOT NULL,
  `date` date NOT NULL,
  `status` varchar(15) NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`car_VIN`,`nameservice_name_service`,`mechanic_mechanic_id`),
  KEY `fk_car_has_nameservice_nameservice1_idx` (`nameservice_name_service`),
  KEY `fk_car_has_nameservice_car1_idx` (`car_VIN`),
  KEY `fk_car_has_nameservice_mechanic1_idx` (`mechanic_mechanic_id`),
  CONSTRAINT `fk_car_has_nameservice_mechanic1` FOREIGN KEY (`mechanic_mechanic_id`) REFERENCES `mechanic` (`mechanic_id`),
  CONSTRAINT `fk_car_has_nameservice_nameservice1` FOREIGN KEY (`nameservice_name_service`) REFERENCES `nameservice` (`name_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remont`
--

LOCK TABLES `remont` WRITE;
/*!40000 ALTER TABLE `remont` DISABLE KEYS */;
INSERT INTO `remont` VALUES ('1C4RJFBG5FC102220','Авто Сити',22,'2024-05-08','в работе',2000),('1FADP3F27FL230703','Авто Сити',19,'2024-05-12','в работе',8000),('1HGCM82633A000001','Авто-Старт',26,'2024-01-14','в работе',5000),('2C3CDZBT8EH200368','Автолайн',28,'2024-06-15','выполнено',5000),('3C4PDCAB9KT713749','Авто-Старт',25,'2024-05-16','в работе',6000),('4T1BF1FK8HU127550','AutoMax',18,'2024-01-06','выполнено',6000),('4T1BK3EK2AU557825','ЕвроАвто',15,'2024-01-02','в работе',10000),('5J6TF1H52EL120516','Автолайн',27,'2024-01-15','выполнено',8000),('5NPEU46F26H043880','Авто Сити',22,'2024-01-25','в работе',1000),('JHMGK5H71GX002946','AutoMax',23,'2024-01-13','выполнено',6000),('JHMGK5H71GX002946','Авто Сити',22,'2024-08-09','выполнено',5000),('JM1BK12F761528306','ЕвроАвто',21,'2024-05-09','выполнено',3000),('JM1FE173640124193','Авто Сити',22,'2024-05-09','выполнено',1000),('SAJEA51B02WC70398','AutoMax',18,'2024-08-06','выполнено',1000),('SAJEA51B02WC70398','Авто-Старт',24,'2024-08-10','выполнено',1000),('WBAEW53453PG03719','AutoMax',14,'2024-05-10','в работе',5000),('YV1CM592XG1654804','AutoMax',23,'2024-08-07','выполнено',1000);
/*!40000 ALTER TABLE `remont` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 17:22:23
