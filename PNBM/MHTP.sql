CREATE DATABASE  IF NOT EXISTS `mhtp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `mhtp`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mhtp
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `admin_interface_theme`
--

DROP TABLE IF EXISTS `admin_interface_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) unsigned NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) unsigned NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
INSERT INTO `admin_interface_theme` VALUES (2,'Mental Health Tests',1,'Mental Health Tests administration',1,'',0,'#3498DB','#39FF8C','#2ECC71','#FFFFFF','#36EF84','#3498DB','#FFFFFF','#FFFFFF','#36EF84',1,'#3498DB','#2ECC71','#12344B','#0E293B','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'','0.2','Mental Health Tests',1,'#E74C3C',1,1,1,'name',1,1,1,'#39FF8D','#FFFFFF',100,400,1,'minimal-select',1,1,0,0,'#36EF84',1,1,1,1);
/*!40000 ALTER TABLE `admin_interface_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Theme',1,'add_theme'),(2,'Can change Theme',1,'change_theme'),(3,'Can delete Theme',1,'delete_theme'),(4,'Can view Theme',1,'view_theme'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add categoria test',8,'add_categoriatest'),(30,'Can change categoria test',8,'change_categoriatest'),(31,'Can delete categoria test',8,'delete_categoriatest'),(32,'Can view categoria test',8,'view_categoriatest'),(33,'Can add pregunta',9,'add_pregunta'),(34,'Can change pregunta',9,'change_pregunta'),(35,'Can delete pregunta',9,'delete_pregunta'),(36,'Can view pregunta',9,'view_pregunta'),(37,'Can add respuesta',10,'add_respuesta'),(38,'Can change respuesta',10,'change_respuesta'),(39,'Can delete respuesta',10,'delete_respuesta'),(40,'Can view respuesta',10,'view_respuesta'),(41,'Can add Usuarios',11,'add_usuarios'),(42,'Can change Usuarios',11,'change_usuarios'),(43,'Can delete Usuarios',11,'delete_usuarios'),(44,'Can view Usuarios',11,'view_usuarios'),(45,'Can add resultado pregunta',12,'add_resultadopregunta'),(46,'Can change resultado pregunta',12,'change_resultadopregunta'),(47,'Can delete resultado pregunta',12,'delete_resultadopregunta'),(48,'Can view resultado pregunta',12,'view_resultadopregunta'),(49,'Can add resultado',13,'add_resultado'),(50,'Can change resultado',13,'change_resultado'),(51,'Can delete resultado',13,'delete_resultado'),(52,'Can view resultado',13,'view_resultado');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$J55ywl9ORKVL7vyTMHcZDz$0Y5dHyVCDTuCxuQgDVkwXCb9SKya2Cq7hsMOUFhz5/Q=','2023-09-27 01:15:01.406245',1,'manuel','','','alejolop507@gmail.com',1,1,'2023-09-25 17:13:23.235200'),(2,'pbkdf2_sha256$600000$oUJuA20lOn0UMxTnhgWq1s$JD49n7A7WpgyBi9nf1dWpiTvoL2sVVfu+m1LrlSoEqY=','2023-09-27 01:12:10.224676',0,'alejandro','alejandro','rojas','alejandro@gmail.com',0,1,'2023-09-25 17:19:35.023465'),(4,'pbkdf2_sha256$600000$p7shAyJ7MUez00nq8JHuR9$Nw/cdzx4DUAJmZ4FyPZRuGKAvetdxf+vP0Evo870C8s=','2023-09-27 01:03:19.175697',0,'nico','nico','coni','nico@gmail.com',0,1,'2023-09-27 00:55:56.855396');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (5,'Test de depresión de Goldberg','¿Qué es la depresión? La depresión es un conjunto de síntomas que se dan en los diferentes tipos de trastornos depresivos. La definición de depresión consiste en un trastorno psicológico del estado de ánimo caracterizado por tristeza profunda e incapacidad para desempeñar las funciones de la vida diaria.\r\n\r\n¿Cómo se manifiesta la depresión? Los síntomas de depresión más habituales son: tristeza, pérdida de interés, sentimientos de culpa, falta de energía, trastornos del sueño y del apetito, dificultad para concentrarse y pensamientos relacionados con la muerte.\r\n\r\n¿Cómo saber si tengo depresión? No existe un test online para saber si tienes depresión que sea totalmente fiable. Para diagnosticar la depresión es necesario acudir a un especialista para realizar una evaluación que consta de entrevistas clínicas y administración de pruebas como test de depresión fiables. Sin embargo, con un test de depresión online puedes identificar si presentas síntomas compatibles y si es necesario que consultes con un profesional.\r\n\r\nAlgunos de los test o escalas más utilizados para detectar la depresión son el test de depresión de Beck, la escala de Hamilton y la escala de Yasavage. El test de Goldberg de salud mental incluye una subescala de depresión.\r\n\r\nEl test de depresión de Goldberg es un instrumento de cribado, un test sencillo y corto. Esta adaptación de Psicología-Online del test de depresión de Goldberg, permite que se pueda realizar de forma gratuita y online. Este test psicológico te permitirá saber si tienes síntomas de depresión. En caso afirmativo, aparecerá en los resultados inmediatos información sobre cómo salir de la depresión. Sin embargo, es importante acudir a un profesional para realizar el diagnóstico y tratamiento adecuados, pues si no se trata adecuadamente los síntomas depresivos, pueden derivar en depresión mayor o en depresión crónica o recurrente.','depresion'),(6,'test felicidad','este es un test de felicidad','feliz');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_pregunta`
--

DROP TABLE IF EXISTS `core_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_pregunta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `texto_pregunta` longtext NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_pregunta_categoria_id_14b60422_fk_core_categoriatest_id` (`categoria_id`),
  CONSTRAINT `core_pregunta_categoria_id_14b60422_fk_core_categoriatest_id` FOREIGN KEY (`categoria_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_pregunta`
--

LOCK TABLES `core_pregunta` WRITE;
/*!40000 ALTER TABLE `core_pregunta` DISABLE KEYS */;
INSERT INTO `core_pregunta` VALUES (3,'Me siento con mucha energía.',5),(4,'He perdido el interés por las cosas.',5),(5,'Tengo confianza en mí mismo.',5),(6,'Tengo dificultades para concentrarme.',5),(7,'He perdido peso porque no tengo apetito.',5),(8,'Me despierto demasiado pronto.',5),(9,'Me siento más lento de lo normal.',5),(10,'Tengo esperanza en el futuro.',5),(11,'Me encuentro peor por las mañanas.',5),(12,'Me siento triste y cansado.',5),(13,'eres feliz',6);
/*!40000 ALTER TABLE `core_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_respuesta`
--

DROP TABLE IF EXISTS `core_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_respuesta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `texto_respuesta` longtext NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  `pregunta_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_respuesta_pregunta_id_3380b052_fk_core_pregunta_id` (`pregunta_id`),
  CONSTRAINT `core_respuesta_pregunta_id_3380b052_fk_core_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `core_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_respuesta`
--

LOCK TABLES `core_respuesta` WRITE;
/*!40000 ALTER TABLE `core_respuesta` DISABLE KEYS */;
INSERT INTO `core_respuesta` VALUES (6,'1',1.00,3),(7,'2',2.00,3),(8,'3',3.00,3),(9,'4',4.00,3),(10,'5',5.00,3),(11,'1',1.00,4),(12,'2',2.00,4),(13,'3',3.00,4),(14,'4',4.00,4),(15,'5',5.00,4),(16,'1',1.00,5),(17,'2',2.00,5),(18,'3',3.00,5),(19,'4',4.00,5),(20,'5',5.00,5),(21,'1',1.00,6),(22,'2',2.00,6),(23,'3',3.00,6),(24,'4',4.00,6),(25,'5',5.00,6),(26,'1',1.00,7),(27,'2',2.00,7),(28,'3',3.00,7),(29,'4',4.00,7),(30,'5',5.00,7),(32,'1',1.00,8),(33,'2',2.00,8),(34,'3',3.00,8),(35,'4',4.00,8),(36,'5',5.00,8),(37,'1',1.00,9),(38,'2',2.00,9),(39,'3',3.00,9),(40,'4',4.00,9),(41,'5',5.00,9),(42,'1',1.00,10),(43,'2',2.00,10),(44,'3',3.00,10),(45,'4',4.00,10),(46,'5',5.00,10),(47,'1',1.00,11),(48,'2',2.00,11),(49,'3',3.00,11),(50,'4',4.00,11),(51,'5',5.00,11),(52,'1',1.00,12),(53,'2',2.00,12),(54,'3',3.00,12),(55,'4',4.00,12),(56,'5',5.00,12),(57,'si',1.00,13),(58,'no',2.00,13);
/*!40000 ALTER TABLE `core_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_resultado`
--

DROP TABLE IF EXISTS `core_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_resultado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `puntuacion_max` decimal(5,2) NOT NULL,
  `puntuacion_min` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_resultado`
--

LOCK TABLES `core_resultado` WRITE;
/*!40000 ALTER TABLE `core_resultado` DISABLE KEYS */;
INSERT INTO `core_resultado` VALUES (4,'Has obtenido un resultado MEDIO','Obtener una puntuación MEDIA en este test significa que tus respuestas son compatibles con presentar depresión leve, es decir, tienes algunos de los síntomas característicos de la depresión según el test de depresión de Goldberg. Puede ser que te sientas triste y desesperanzado. Quizás has notado que te sientes más cansado de lo normal y con menos apetito. Puedes haber presentado dificultades para dormir y para realizar las tareas de la vida cotidiana. Te recomendamos acudir a un profesional para que puedas saber si tienes depresión y qué hacer al respecto.','MEDIO',33.00,17.00),(5,'Has obtenido un resultado BAJA','Obtener una puntuación BAJA en este test significa que tus respuestas no son compatibles con presentar depresión, es decir, no tienes los síntomas característicos de la depresión según el test de depresión de Goldberg. Nos alegra que no muestres síntomas depresivos. Sin embargo, puede ser que alguien de tu entorno padezca un trastorno depresivo. Por ello, te recomendamos leer Cómo ayudar a una persona con depresión.','BAJA',16.00,10.00),(6,'Has obtenido un resultado ALTA','Obtener una puntuación ALTA en este test significa que tus respuestas son compatibles con presentar depresión, es decir, tienes los síntomas característicos de la depresión según el test de depresión de Goldberg. Te sientes triste, sin energía, sin confianza y sin esperanza. Has experimentado dificultades para dormir, para pensar y concentrarte. Te recomendamos acudir a un profesional que evalúe tu caso y aplique el tratamiento para la depresión más adecuado para ti.','ALTA',50.00,34.00),(7,'eres feliz','tu eres feliz','felis',1.00,1.00),(8,'no eres feliz','tu no estas feliz',NULL,2.00,2.00);
/*!40000 ALTER TABLE `core_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_resultadopregunta`
--

DROP TABLE IF EXISTS `core_resultadopregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_resultadopregunta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `respuesta_id` bigint(20) NOT NULL,
  `resultado_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_resultadopregun_respuesta_id_2ded0178_fk_core_resp` (`respuesta_id`),
  KEY `core_resultadopregun_resultado_id_f40f1246_fk_core_resu` (`resultado_id`),
  CONSTRAINT `core_resultadopregun_respuesta_id_2ded0178_fk_core_resp` FOREIGN KEY (`respuesta_id`) REFERENCES `core_respuesta` (`id`),
  CONSTRAINT `core_resultadopregun_resultado_id_f40f1246_fk_core_resu` FOREIGN KEY (`resultado_id`) REFERENCES `core_resultado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_resultadopregunta`
--

LOCK TABLES `core_resultadopregunta` WRITE;
/*!40000 ALTER TABLE `core_resultadopregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_resultadopregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-09-25 17:30:30.889070','1','feliz',1,'[{\"added\": {}}]',8,1),(2,'2023-09-25 17:30:57.447644','1','tu eres feliz?',1,'[{\"added\": {}}]',9,1),(3,'2023-09-25 17:31:15.368450','1','si',1,'[{\"added\": {}}]',10,1),(4,'2023-09-25 17:32:08.096024','2','no',1,'[{\"added\": {}}]',10,1),(5,'2023-09-25 17:49:51.656158','2','Mental Health Tests',1,'[{\"added\": {}}]',1,1),(6,'2023-09-25 17:50:06.535459','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',1,1),(7,'2023-09-25 17:50:26.741337','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Control\"]}}]',1,1),(8,'2023-09-25 17:50:41.507352','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Display\"]}}]',1,1),(9,'2023-09-25 17:50:53.648494','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Control\", \"Display\"]}}]',1,1),(10,'2023-09-25 17:51:07.858341','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Control\"]}}]',1,1),(11,'2023-09-25 17:52:15.066788','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Visible\", \"Title\"]}}]',1,1),(12,'2023-09-25 17:53:54.742996','2','Mental Health Tests',2,'[]',1,1),(13,'2023-09-25 17:54:02.715691','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Color\"]}}]',1,1),(14,'2023-09-25 17:55:50.370530','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Background color\", \"Text color\", \"Link hover color\"]}}]',1,1),(15,'2023-09-25 17:56:27.929577','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Text color\", \"Link hover color\"]}}]',1,1),(16,'2023-09-25 17:56:42.872357','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Color\"]}}]',1,1),(17,'2023-09-25 17:56:52.048814','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Color\"]}}]',1,1),(18,'2023-09-25 17:57:03.786789','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Color\"]}}]',1,1),(19,'2023-09-25 17:57:44.537359','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Background color\", \"Background selected color\", \"Link hover color\"]}}]',1,1),(20,'2023-09-25 17:57:56.616828','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Text color\"]}}]',1,1),(21,'2023-09-25 17:58:08.204125','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Link hover color\"]}}]',1,1),(22,'2023-09-25 17:58:38.076227','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Text color\", \"Link hover color\"]}}]',1,1),(23,'2023-09-25 17:59:14.674610','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Background selected color\"]}}]',1,1),(24,'2023-09-25 17:59:25.763399','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Display\"]}}]',1,1),(25,'2023-09-25 18:00:33.226807','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Link color\", \"Link hover color\", \"Link active color\", \"Background color\", \"Background hover color\"]}}]',1,1),(26,'2023-09-25 18:00:58.212116','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Background opacity\"]}}]',1,1),(27,'2023-09-25 18:01:13.186109','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Sticky pagination\"]}}]',1,1),(28,'2023-09-25 18:01:55.975812','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Collapsible stacked inlines\"]}}]',1,1),(29,'2023-09-25 18:02:03.534712','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Collapsible tabular inlines\"]}}]',1,1),(30,'2023-09-25 18:02:24.845818','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Sticky submit\", \"Quick remove links for active filters at top of sidebar\"]}}]',1,1),(31,'2023-09-25 18:02:38.116433','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Fieldsets as tabs\"]}}]',1,1),(32,'2023-09-25 18:02:56.982871','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Inlines as tabs\"]}}]',1,1),(33,'2023-09-25 18:03:07.127417','2','Mental Health Tests',2,'[]',1,1),(34,'2023-09-25 18:03:08.097050','2','Mental Health Tests',2,'[]',1,1),(35,'2023-09-25 18:03:15.634176','1','Django',3,'',1,1),(36,'2023-09-25 18:03:58.595350','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Link color\"]}}]',1,1),(37,'2023-09-25 18:04:14.552512','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Link color\"]}}]',1,1),(38,'2023-09-25 18:04:25.565403','2','Mental Health Tests',2,'[]',1,1),(39,'2023-09-25 22:49:30.180713','2','te gusta la lluvia?',1,'[{\"added\": {}}]',9,1),(40,'2023-09-25 22:49:56.726403','3','si',1,'[{\"added\": {}}]',10,1),(41,'2023-09-25 22:50:10.108780','2','no',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(42,'2023-09-25 22:50:23.094510','3','si!',2,'[{\"changed\": {\"fields\": [\"Texto respuesta\"]}}]',10,1),(43,'2023-09-25 22:50:35.043361','4','no!',1,'[{\"added\": {}}]',10,1),(44,'2023-09-25 22:51:54.890278','1','no feliz',1,'[{\"added\": {}}]',13,1),(45,'2023-09-25 22:52:21.005369','2','si feliz',1,'[{\"added\": {}}]',13,1),(46,'2023-09-26 00:30:25.049821','3','nico',3,'',5,1),(47,'2023-09-26 03:37:14.135379','2','triste',1,'[{\"added\": {}}]',8,1),(48,'2023-09-26 03:37:45.595479','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Fieldsets as tabs\", \"Inlines as tabs\"]}}]',1,1),(49,'2023-09-26 03:38:16.782457','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Collapsible stacked inlines collapsed\", \"Collapsible tabular inlines collapsed\"]}}]',1,1),(50,'2023-09-26 03:38:52.930610','2','Mental Health Tests',2,'[{\"changed\": {\"fields\": [\"Collapsible stacked inlines collapsed\", \"Collapsible tabular inlines collapsed\"]}}]',1,1),(51,'2023-09-26 03:40:30.269156','1','feliz',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(52,'2023-09-26 03:40:35.554941','2','triste',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(53,'2023-09-26 17:44:53.761898','4','yolo',1,'[{\"added\": {}}]',8,1),(54,'2023-09-26 17:47:15.724055','4','yolo',2,'[]',8,1),(55,'2023-09-26 19:21:33.529325','3','si!',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(56,'2023-09-26 19:21:38.432622','5','Mi respuesta',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(57,'2023-09-26 19:21:43.181042','4','no!',2,'[]',10,1),(58,'2023-09-26 19:21:52.696276','3','si!',2,'[]',10,1),(59,'2023-09-26 19:21:59.896338','2','no',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(60,'2023-09-26 19:22:08.116282','1','si',2,'[]',10,1),(61,'2023-09-26 19:22:54.335362','2','si feliz',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',13,1),(62,'2023-09-26 19:22:57.048544','2','si feliz',2,'[]',13,1),(63,'2023-09-26 19:23:06.583535','1','no feliz',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',13,1),(64,'2023-09-26 19:23:59.248098','1','miusuario',3,'',11,1),(65,'2023-09-26 21:59:40.299792','2','si feliz',3,'',13,1),(66,'2023-09-26 21:59:40.301791','1','no feliz',3,'',13,1),(67,'2023-09-26 21:59:53.185151','5','Mi respuesta',3,'',10,1),(68,'2023-09-26 21:59:53.188048','4','no!',3,'',10,1),(69,'2023-09-26 21:59:53.192048','3','si!',3,'',10,1),(70,'2023-09-26 21:59:53.193908','2','no',3,'',10,1),(71,'2023-09-26 21:59:53.196614','1','si',3,'',10,1),(72,'2023-09-26 22:00:00.995598','2','te gusta la lluvia?',3,'',9,1),(73,'2023-09-26 22:00:00.999527','1','tu eres feliz?',3,'',9,1),(74,'2023-09-26 22:00:07.693769','1','feliz',3,'',8,1),(75,'2023-09-26 22:00:07.695972','2','triste',3,'',8,1),(76,'2023-09-26 22:00:07.697834','3','Nombre de Categoría',3,'',8,1),(77,'2023-09-26 22:00:07.701012','4','yolo',3,'',8,1),(78,'2023-09-26 22:03:20.401245','5','Test de depresión de Goldberg',1,'[{\"added\": {}}]',8,1),(79,'2023-09-26 22:04:05.728943','3','Me siento con mucha energía.',1,'[{\"added\": {}}]',9,1),(80,'2023-09-26 22:04:29.007647','4','He perdido el interés por las cosas.',1,'[{\"added\": {}}]',9,1),(81,'2023-09-26 22:04:46.893557','5','Tengo confianza en mí mismo.',1,'[{\"added\": {}}]',9,1),(82,'2023-09-26 22:05:12.655305','6','Tengo dificultades para concentrarme.',1,'[{\"added\": {}}]',9,1),(83,'2023-09-26 22:05:35.533483','7','He perdido peso porque no tengo apetito.',1,'[{\"added\": {}}]',9,1),(84,'2023-09-26 22:05:56.852373','8','Me despierto demasiado pronto.',1,'[{\"added\": {}}]',9,1),(85,'2023-09-26 22:06:13.574935','9','Me siento más lento de lo normal.',1,'[{\"added\": {}}]',9,1),(86,'2023-09-26 22:06:23.565350','10','Tengo esperanza en el futuro.',1,'[{\"added\": {}}]',9,1),(87,'2023-09-26 22:06:35.348538','11','Me encuentro peor por las mañanas.',1,'[{\"added\": {}}]',9,1),(88,'2023-09-26 22:06:49.853126','12','Me siento triste y cansado.',1,'[{\"added\": {}}]',9,1),(89,'2023-09-26 22:10:24.368147','6','1',1,'[{\"added\": {}}]',10,1),(90,'2023-09-26 22:10:35.357806','7','2',1,'[{\"added\": {}}]',10,1),(91,'2023-09-26 22:10:47.464214','8','3',1,'[{\"added\": {}}]',10,1),(92,'2023-09-26 22:11:03.681071','9','4',1,'[{\"added\": {}}]',10,1),(93,'2023-09-26 22:11:16.909249','10','5',1,'[{\"added\": {}}]',10,1),(94,'2023-09-26 22:11:37.515967','11','1',1,'[{\"added\": {}}]',10,1),(95,'2023-09-26 22:11:43.348978','12','2',1,'[{\"added\": {}}]',10,1),(96,'2023-09-26 22:11:49.718031','13','3',1,'[{\"added\": {}}]',10,1),(97,'2023-09-26 22:13:05.205755','14','4',1,'[{\"added\": {}}]',10,1),(98,'2023-09-26 22:13:18.808063','15','5',1,'[{\"added\": {}}]',10,1),(99,'2023-09-26 22:13:27.453714','16','1',1,'[{\"added\": {}}]',10,1),(100,'2023-09-26 22:13:38.183841','17','2',1,'[{\"added\": {}}]',10,1),(101,'2023-09-26 22:13:48.695152','18','3',1,'[{\"added\": {}}]',10,1),(102,'2023-09-26 22:13:56.404391','19','4',1,'[{\"added\": {}}]',10,1),(103,'2023-09-26 22:14:02.919103','20','5',1,'[{\"added\": {}}]',10,1),(104,'2023-09-26 22:14:13.653464','21','1',1,'[{\"added\": {}}]',10,1),(105,'2023-09-26 22:14:20.812178','22','2',1,'[{\"added\": {}}]',10,1),(106,'2023-09-26 22:14:37.958090','23','3',1,'[{\"added\": {}}]',10,1),(107,'2023-09-26 22:14:49.166180','24','4',1,'[{\"added\": {}}]',10,1),(108,'2023-09-26 22:14:57.910156','25','5',1,'[{\"added\": {}}]',10,1),(109,'2023-09-26 22:15:34.404982','26','1',1,'[{\"added\": {}}]',10,1),(110,'2023-09-26 22:15:41.476483','27','2',1,'[{\"added\": {}}]',10,1),(111,'2023-09-26 22:15:50.124596','28','3',1,'[{\"added\": {}}]',10,1),(112,'2023-09-26 22:15:58.413148','29','4',1,'[{\"added\": {}}]',10,1),(113,'2023-09-26 22:16:08.334819','30','5',1,'[{\"added\": {}}]',10,1),(114,'2023-09-26 22:16:16.340666','31','1',1,'[{\"added\": {}}]',10,1),(115,'2023-09-26 22:16:24.658449','31','1',3,'',10,1),(116,'2023-09-26 22:16:34.718870','32','1',1,'[{\"added\": {}}]',10,1),(117,'2023-09-26 22:16:43.061775','33','2',1,'[{\"added\": {}}]',10,1),(118,'2023-09-26 22:17:01.975485','34','3',1,'[{\"added\": {}}]',10,1),(119,'2023-09-26 22:17:16.755965','35','4',1,'[{\"added\": {}}]',10,1),(120,'2023-09-26 22:17:22.586599','34','3',2,'[]',10,1),(121,'2023-09-26 22:17:32.246411','36','5',1,'[{\"added\": {}}]',10,1),(122,'2023-09-26 22:17:49.072110','37','1',1,'[{\"added\": {}}]',10,1),(123,'2023-09-26 22:17:59.725050','38','2',1,'[{\"added\": {}}]',10,1),(124,'2023-09-26 22:18:18.916507','39','3',1,'[{\"added\": {}}]',10,1),(125,'2023-09-26 22:18:26.995091','40','4',1,'[{\"added\": {}}]',10,1),(126,'2023-09-26 22:18:33.838709','41','5',1,'[{\"added\": {}}]',10,1),(127,'2023-09-26 22:18:56.772740','41','5',2,'[]',10,1),(128,'2023-09-26 22:19:07.643562','42','1',1,'[{\"added\": {}}]',10,1),(129,'2023-09-26 22:19:15.723873','43','2',1,'[{\"added\": {}}]',10,1),(130,'2023-09-26 22:19:30.212860','44','3',1,'[{\"added\": {}}]',10,1),(131,'2023-09-26 22:19:48.261480','45','4',1,'[{\"added\": {}}]',10,1),(132,'2023-09-26 22:19:57.612841','46','5',1,'[{\"added\": {}}]',10,1),(133,'2023-09-26 22:20:10.255836','47','1',1,'[{\"added\": {}}]',10,1),(134,'2023-09-26 22:20:31.591811','48','1',1,'[{\"added\": {}}]',10,1),(135,'2023-09-26 22:20:40.407804','48','2',2,'[{\"changed\": {\"fields\": [\"Texto respuesta\", \"Valor\"]}}]',10,1),(136,'2023-09-26 22:20:50.165285','49','3',1,'[{\"added\": {}}]',10,1),(137,'2023-09-26 22:21:10.300360','50','4',1,'[{\"added\": {}}]',10,1),(138,'2023-09-26 22:21:21.892600','51','5',1,'[{\"added\": {}}]',10,1),(139,'2023-09-26 22:21:32.779625','52','1',1,'[{\"added\": {}}]',10,1),(140,'2023-09-26 22:21:40.990255','53','2',1,'[{\"added\": {}}]',10,1),(141,'2023-09-26 22:21:48.022005','54','3',1,'[{\"added\": {}}]',10,1),(142,'2023-09-26 22:22:04.176376','55','4',1,'[{\"added\": {}}]',10,1),(143,'2023-09-26 22:22:14.252032','56','5',1,'[{\"added\": {}}]',10,1),(144,'2023-09-26 22:24:21.654636','3','Has obtenido un resultado MEDIO (Puntuación: 7/10)',1,'[{\"added\": {}}]',13,1),(145,'2023-09-26 22:25:34.119171','3','Has obtenido un resultado MEDIO (Puntuación: 7/10)',3,'',13,1),(146,'2023-09-26 22:26:14.293543','4','Has obtenido un resultado MEDIO',1,'[{\"added\": {}}]',13,1),(147,'2023-09-26 22:28:32.765071','5','Has obtenido un resultado BAJA',1,'[{\"added\": {}}]',13,1),(148,'2023-09-26 22:29:56.750798','4','Has obtenido un resultado MEDIO',2,'[{\"changed\": {\"fields\": [\"Descripcion\"]}}]',13,1),(149,'2023-09-26 22:31:16.233124','6','Has obtenido un resultado ALTA',1,'[{\"added\": {}}]',13,1),(150,'2023-09-27 00:16:13.974572','6','Has obtenido un resultado ALTA',2,'[{\"changed\": {\"fields\": [\"Puntuacion min\"]}}]',13,1),(151,'2023-09-27 00:16:23.266967','6','Has obtenido un resultado ALTA',2,'[{\"changed\": {\"fields\": [\"Puntuacion max\"]}}]',13,1),(152,'2023-09-27 00:16:42.656865','5','Has obtenido un resultado BAJA',2,'[{\"changed\": {\"fields\": [\"Puntuacion min\", \"Puntuacion max\"]}}]',13,1),(153,'2023-09-27 00:16:58.792817','4','Has obtenido un resultado MEDIO',2,'[{\"changed\": {\"fields\": [\"Puntuacion min\", \"Puntuacion max\"]}}]',13,1),(154,'2023-09-27 00:57:53.058348','6','test felicidad',1,'[{\"added\": {}}]',8,1),(155,'2023-09-27 00:58:20.325973','13','eres feliz',1,'[{\"added\": {}}]',9,1),(156,'2023-09-27 00:58:48.698971','57','si',1,'[{\"added\": {}}]',10,1),(157,'2023-09-27 00:59:08.755211','58','no',1,'[{\"added\": {}}]',10,1),(158,'2023-09-27 01:00:16.261892','7','eres feliz',1,'[{\"added\": {}}]',13,1),(159,'2023-09-27 01:00:30.706306','57','si',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(160,'2023-09-27 01:00:37.073402','58','no',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(161,'2023-09-27 01:01:28.736238','8','no eres feliz',1,'[{\"added\": {}}]',13,1),(162,'2023-09-27 01:01:37.727230','7','eres feliz',2,'[{\"changed\": {\"fields\": [\"Puntuacion min\"]}}]',13,1),(163,'2023-09-27 01:01:47.688058','8','no eres feliz',2,'[{\"changed\": {\"fields\": [\"Puntuacion min\", \"Puntuacion max\"]}}]',13,1),(164,'2023-09-27 01:02:06.215048','57','si',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(165,'2023-09-27 01:02:11.592319','58','no',2,'[{\"changed\": {\"fields\": [\"Valor\"]}}]',10,1),(166,'2023-09-27 01:17:22.130216','6','Has obtenido un resultado ALTA',2,'[]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(1,'admin_interface','theme'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(8,'core','categoriatest'),(9,'core','pregunta'),(10,'core','respuesta'),(13,'core','resultado'),(12,'core','resultadopregunta'),(11,'core','usuarios'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-09-25 16:56:05.924760'),(2,'auth','0001_initial','2023-09-25 16:56:06.493823'),(3,'admin','0001_initial','2023-09-25 16:56:06.625031'),(4,'admin','0002_logentry_remove_auto_add','2023-09-25 16:56:06.638773'),(5,'admin','0003_logentry_add_action_flag_choices','2023-09-25 16:56:06.648708'),(6,'admin_interface','0001_initial','2023-09-25 16:56:06.673120'),(7,'admin_interface','0002_add_related_modal','2023-09-25 16:56:06.765078'),(8,'admin_interface','0003_add_logo_color','2023-09-25 16:56:06.794439'),(9,'admin_interface','0004_rename_title_color','2023-09-25 16:56:06.808073'),(10,'admin_interface','0005_add_recent_actions_visible','2023-09-25 16:56:06.832558'),(11,'admin_interface','0006_bytes_to_str','2023-09-25 16:56:06.907501'),(12,'admin_interface','0007_add_favicon','2023-09-25 16:56:06.930924'),(13,'admin_interface','0008_change_related_modal_background_opacity_type','2023-09-25 16:56:06.969440'),(14,'admin_interface','0009_add_enviroment','2023-09-25 16:56:07.014423'),(15,'admin_interface','0010_add_localization','2023-09-25 16:56:07.034684'),(16,'admin_interface','0011_add_environment_options','2023-09-25 16:56:07.111989'),(17,'admin_interface','0012_update_verbose_names','2023-09-25 16:56:07.122518'),(18,'admin_interface','0013_add_related_modal_close_button','2023-09-25 16:56:07.147721'),(19,'admin_interface','0014_name_unique','2023-09-25 16:56:07.166875'),(20,'admin_interface','0015_add_language_chooser_active','2023-09-25 16:56:07.191847'),(21,'admin_interface','0016_add_language_chooser_display','2023-09-25 16:56:07.214926'),(22,'admin_interface','0017_change_list_filter_dropdown','2023-09-25 16:56:07.222145'),(23,'admin_interface','0018_theme_list_filter_sticky','2023-09-25 16:56:07.247229'),(24,'admin_interface','0019_add_form_sticky','2023-09-25 16:56:07.291320'),(25,'admin_interface','0020_module_selected_colors','2023-09-25 16:56:07.346213'),(26,'admin_interface','0021_file_extension_validator','2023-09-25 16:56:07.373254'),(27,'admin_interface','0022_add_logo_max_width_and_height','2023-09-25 16:56:07.435334'),(28,'admin_interface','0023_theme_foldable_apps','2023-09-25 16:56:07.459998'),(29,'admin_interface','0024_remove_theme_css','2023-09-25 16:56:07.476771'),(30,'admin_interface','0025_theme_language_chooser_control','2023-09-25 16:56:07.502108'),(31,'admin_interface','0026_theme_list_filter_highlight','2023-09-25 16:56:07.527229'),(32,'admin_interface','0027_theme_list_filter_removal_links','2023-09-25 16:56:07.553268'),(33,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2023-09-25 16:56:07.601255'),(34,'admin_interface','0029_theme_css_generic_link_active_color','2023-09-25 16:56:07.628214'),(35,'admin_interface','0030_theme_collapsible_stacked_inlines_and_more','2023-09-25 16:56:07.718578'),(36,'contenttypes','0002_remove_content_type_name','2023-09-25 16:56:07.788856'),(37,'auth','0002_alter_permission_name_max_length','2023-09-25 16:56:07.849298'),(38,'auth','0003_alter_user_email_max_length','2023-09-25 16:56:07.870929'),(39,'auth','0004_alter_user_username_opts','2023-09-25 16:56:07.881229'),(40,'auth','0005_alter_user_last_login_null','2023-09-25 16:56:07.926960'),(41,'auth','0006_require_contenttypes_0002','2023-09-25 16:56:07.932077'),(42,'auth','0007_alter_validators_add_error_messages','2023-09-25 16:56:07.942234'),(43,'auth','0008_alter_user_username_max_length','2023-09-25 16:56:07.963306'),(44,'auth','0009_alter_user_last_name_max_length','2023-09-25 16:56:07.985851'),(45,'auth','0010_alter_group_name_max_length','2023-09-25 16:56:08.005938'),(46,'auth','0011_update_proxy_permissions','2023-09-25 16:56:08.021065'),(47,'auth','0012_alter_user_first_name_max_length','2023-09-25 16:56:08.039303'),(48,'core','0001_initial','2023-09-25 16:56:08.063061'),(49,'core','0002_categoriatest_pregunta_respuesta_usuarios_and_more','2023-09-25 16:56:08.305918'),(50,'sessions','0001_initial','2023-09-25 16:56:08.340726'),(51,'core','0003_resultado_resultadopregunta','2023-09-25 22:42:12.109676'),(52,'core','0004_alter_categoriatest_options_and_more','2023-09-26 01:43:54.906369'),(53,'core','0005_categoriatest_slug_resultado_slug','2023-09-26 03:35:08.131118'),(54,'core','0006_resultado_puntuacion_max_resultado_puntuacion_min','2023-09-26 23:31:22.698234');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ywo1azyghrn3thwqqe6dte9b5028qep','.eJxVjEEOwiAQRe_C2hCYFkGX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWVh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtnYu8gI_sMAIExsCNj3UkIRMaBwKMZkSw7Iwn9YLMXTiGTOAlHUO8PDoU5Gw:1qlJ8n:VEAJNNk3dEuOBRr-dr5b490wx9L1Wf2NyW3i6iHhI5U','2023-10-11 01:15:01.409245'),('1s9rnnncdqvavde3s71syubv7c3t8lnr','.eJxVjEEOwiAQRe_C2hCYFkGX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWVh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtnYu8gI_sMAIExsCNj3UkIRMaBwKMZkSw7Iwn9YLMXTiGTOAlHUO8PDoU5Gw:1qkyat:rewGut_DD9Yl58zbw3_zn36pvtKFFfI-96KQO54Vndw','2023-10-10 03:18:39.497518'),('ahptyidvu2uflk6n1zshwdaffd7j8a80','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkvEG:WtDYIM2XsVvvmcGPsjxg7T_96pquxJKTzrvs07O175E','2023-10-09 23:43:04.051066'),('ezbzlelzsb5m8tlqkn4op40bwz7z4aqu','.eJxVjEEOwiAQRe_C2hCYFkGX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWVh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtnYu8gI_sMAIExsCNj3UkIRMaBwKMZkSw7Iwn9YLMXTiGTOAlHUO8PDoU5Gw:1qkpmK:TOO22OEVJAIxomhnlZUw_2EEBBgFz9QctYE-ibYdYQE','2023-10-09 17:53:52.427556'),('fpyxy5d2rx8gzr2327oqe9c9s6haaqp3','.eJxVjEEOwiAQRe_C2hCYFkGX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWVh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtnYu8gI_sMAIExsCNj3UkIRMaBwKMZkSw7Iwn9YLMXTiGTOAlHUO8PDoU5Gw:1qkpFQ:t28uJlkTuWvhNE6M6_Jrp7UmHKQVsDTQRxubLtztAPY','2023-10-09 17:19:52.239250'),('ga2h1nup8fahulgsv1f7z5g03u0t07q7','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkuqL:NFal9y5Xp4zzuk3ql22ud8nqgNRevsppWyCeVwcO3Kg','2023-10-09 23:18:21.873976'),('gbd35aqqygrp0eh769s6exszeh85rysv','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkrhK:2WG00S9NxcK1UTDF3Ym47i76Ro2gIgdyOxoadkzvShw','2023-10-09 19:56:50.028330'),('i8e3dxkuhr43uqq1rm5jkvwvjrl86qy2','.eJxVjEEOwiAQRe_C2hCYFkGX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWVh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtnYu8gI_sMAIExsCNj3UkIRMaBwKMZkSw7Iwn9YLMXTiGTOAlHUO8PDoU5Gw:1qkyrs:K5Y7oEzgiS964QaCKVldmbqRg-D4F14qZkzAxqb5EmQ','2023-10-10 03:36:12.115165'),('jrhqeexoveewgkbjc335lrjnl1cctcep','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkw2O:QLixPM7h7y83Er38x6BgLg7SCJ5JFFlRxBJgJx-ZARc','2023-10-10 00:34:52.029452'),('ojpk73sn3f9zjyt7mh2akljfjlo4hgi7','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qlCBW:g3z5G7yRf0DJ8DhplLC0n6iGGrlgG5BdsGXxHcfWGy0','2023-10-10 17:49:22.098386'),('p5fioagsecl2bqo1azk2goxp881dhm80','.eJxVjEEOwiAQRe_C2hCYFkGX7j0DGWYGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWVh1-t4T0kLoBvmO9NU2tLvOU9KbonXZ9bSzPy-7-HRTs5VtnYu8gI_sMAIExsCNj3UkIRMaBwKMZkSw7Iwn9YLMXTiGTOAlHUO8PDoU5Gw:1qlH2k:AzGUoji4595MZynOSXcl29ilmJRGTVOlmn3Sv89IJUU','2023-10-10 23:00:38.932321'),('s4mv5itcqvy8fjr04d7yrds5nrglg5x8','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qlCA5:5ODhM-y8YtPfkFGsMOqum9YSHIZ44bUNfOF5Cz4hEKg','2023-10-10 17:47:53.968346'),('uspqbyyaqpzjgfjza48bmzg5j3jl2crb','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkwoR:R4P-GfSGnBQIr6JbEEN77jbq1JwFL2XlayKACk48Yoc','2023-10-10 01:24:31.664446'),('wuq79flinexcovourpferz9e9lkl3bwy','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkxAG:WGMQMcxGIApg33ZrEyUZYYJgMqz8rpj9Od6QHMLFKUo','2023-10-10 01:47:04.616998'),('x0490vhn1cx6b3u5q2f8flm5wyo3pub0','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkwjM:1Jje7i0AaDqbn5HL4py08L6nXE12awVIg6NQfEY0Sv0','2023-10-10 01:19:16.884834'),('zzfe03524vgudkklkmx5bzdgenvokbb2','.eJxVjDEOwjAMRe-SGUXBNCFmZO8Zqri2SQElUtNOiLtDpQ6w_vfef5khrUse1ibzMLG5GDCH343S-JCyAb6ncqt2rGWZJ7KbYnfabF9Zntfd_TvIqeVvfVRUEgkR2aNThhiUFRCB0Ed3HtGTUugc8QlJAoAmIekSgGjsgnl_AAF8OLk:1qkwmb:BgTSu2QAJMoMQ0e6NhKUTAiUyWo0U70hRkLdfz9KuZM','2023-10-10 01:22:37.732511');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(14) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `password1` varchar(15) DEFAULT NULL,
  `password2` varchar(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Usuarios_user_id_7fc343a8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-26 20:32:16
