-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bds_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(29,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(30,5,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(31,5,'category_id','text','Category',1,0,1,1,1,0,NULL,3),(32,5,'title','text','Title',1,1,1,1,1,1,NULL,4),(33,5,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Description',1,0,1,1,1,1,NULL,9),(38,5,'meta_keywords','text_area','Meta Keywords',1,0,1,1,1,1,NULL,10),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(42,5,'seo_title','text','SEO Title',0,1,1,1,1,1,NULL,14),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,NULL,15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(56,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,7,'sender_id','text','Sender Id',1,1,1,1,1,1,'{}',2),(58,7,'receiver_id','text','Receiver Id',1,1,1,1,1,1,'{}',3),(59,7,'property_id','text','Property Id',1,1,1,1,1,1,'{}',4),(60,7,'message','text','Message',1,1,1,1,1,1,'{}',5),(61,7,'status','text','Status',1,1,1,1,1,1,'{}',6),(62,7,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(63,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(64,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(65,8,'author_id','text','Author Id',1,1,1,1,1,1,'{}',2),(66,8,'property_type_id','text','Property Type Id',1,1,1,1,1,1,'{}',3),(67,8,'title','text','Title',1,1,1,1,1,1,'{}',4),(68,8,'description','text','Description',0,1,1,1,1,1,'{}',5),(69,8,'price','text','Price',0,1,1,1,1,1,'{}',6),(70,8,'location','text','Location',0,1,1,1,1,1,'{}',7),(71,8,'status','text','Status',1,1,1,1,1,1,'{}',8),(72,8,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',9),(73,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),(74,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(75,9,'property_id','text','Property Id',1,1,1,1,1,1,'{}',2),(76,9,'feature','text','Feature',1,1,1,1,1,1,'{}',3),(77,9,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(78,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(79,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(80,10,'property_id','text','Property Id',1,1,1,1,1,1,'{}',2),(81,10,'image_path','text','Image Path',1,1,1,1,1,1,'{}',3),(82,10,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(83,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(84,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(85,11,'name','text','Name',1,1,1,1,1,1,'{}',2),(86,11,'slug','text','Slug',1,1,1,1,1,1,'{}',3),(87,11,'icon','text','Icon',0,1,1,1,1,1,'{}',4),(88,11,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(89,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(90,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(91,12,'user_id','text','User Id',1,1,1,1,1,1,'{}',2),(92,12,'property_id','text','Property Id',1,1,1,1,1,1,'{}',3),(93,12,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(94,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2025-02-23 19:39:52','2025-02-23 19:39:52'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2025-02-23 19:39:53','2025-02-23 19:39:53'),(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2025-02-23 19:39:53','2025-02-23 19:39:53'),(7,'messages','messages','Message','Messages',NULL,'App\\Models\\Message',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2025-02-23 20:07:28','2025-02-23 20:07:28'),(8,'properties','properties','Property','Properties',NULL,'App\\Models\\Property',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2025-02-23 20:07:42','2025-02-23 20:07:42'),(9,'property_features','property-features','Property Feature','Property Features',NULL,'App\\Models\\PropertyFeature',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2025-02-23 20:07:54','2025-02-23 20:07:54'),(10,'property_images','property-images','Property Image','Property Images',NULL,'App\\Models\\PropertyImage',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2025-02-23 20:08:06','2025-02-23 20:08:06'),(11,'property_types','property-types','Property Type','Property Types',NULL,'App\\Models\\PropertyType',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2025-02-23 20:08:16','2025-02-23 20:08:16'),(12,'user_favorites','user-favorites','User Favorite','User Favorites',NULL,'App\\Models\\UserFavorite',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2025-02-23 20:09:02','2025-02-23 20:09:02');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Admin Dashboard','','_self','voyager-boat','#000000',NULL,2,'2025-02-23 19:39:47','2025-02-23 20:18:22','voyager.dashboard','null'),(2,1,'Media','','_self','voyager-images',NULL,5,1,'2025-02-23 19:39:47','2025-02-23 20:19:41','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,21,1,'2025-02-23 19:39:47','2025-02-23 20:19:20','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,21,2,'2025-02-23 19:39:47','2025-02-23 20:19:20','voyager.roles.index',NULL),(5,1,'Admin Tools','','_self','voyager-tools','#000000',NULL,8,'2025-02-23 19:39:47','2025-02-23 20:22:02',NULL,'null'),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,2,'2025-02-23 19:39:47','2025-02-23 20:19:41','voyager.menus.index',NULL),(7,1,'Database Management','','_blank','voyager-data','#000000',NULL,3,'2025-02-23 19:39:47','2025-02-23 20:18:42','voyager.database.index','null'),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2025-02-23 19:39:47','2025-02-23 20:19:41','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2025-02-23 19:39:47','2025-02-23 20:19:41','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,9,'2025-02-23 19:39:47','2025-02-23 20:22:02','voyager.settings.index',NULL),(11,1,'Categories','','_self','voyager-categories',NULL,22,1,'2025-02-23 19:39:52','2025-02-23 20:21:12','voyager.categories.index',NULL),(12,1,'Posts','','_self','voyager-news',NULL,22,2,'2025-02-23 19:39:53','2025-02-23 20:21:12','voyager.posts.index',NULL),(14,1,'Messages Management','','_self','voyager-chat','#000000',NULL,6,'2025-02-23 20:07:28','2025-02-23 20:22:06','voyager.messages.index','null'),(15,1,'Properties','','_self',NULL,NULL,23,1,'2025-02-23 20:07:42','2025-02-23 20:21:46','voyager.properties.index',NULL),(16,1,'Property Features','','_self',NULL,NULL,23,2,'2025-02-23 20:07:54','2025-02-23 20:21:47','voyager.property-features.index',NULL),(17,1,'Property Images','','_self',NULL,NULL,23,3,'2025-02-23 20:08:06','2025-02-23 20:21:50','voyager.property-images.index',NULL),(18,1,'Property Types','','_self',NULL,NULL,23,4,'2025-02-23 20:08:16','2025-02-23 20:21:51','voyager.property-types.index',NULL),(19,1,'User Favorites','','_self',NULL,NULL,23,5,'2025-02-23 20:09:02','2025-02-23 20:21:53','voyager.user-favorites.index',NULL),(20,1,'Client Page','/','_blank','voyager-company','#000000',NULL,1,'2025-02-23 20:18:07','2025-02-23 20:18:27',NULL,''),(21,1,'User Management','','_self','voyager-people','#000000',NULL,4,'2025-02-23 20:19:08','2025-02-23 20:19:15',NULL,NULL),(22,1,'Post Management','','_self','voyager-browser','#000000',NULL,7,'2025-02-23 20:21:04','2025-02-23 20:22:06',NULL,NULL),(23,1,'Property Management','','_self','voyager-home','#000000',NULL,5,'2025-02-23 20:21:41','2025-02-23 20:22:02',NULL,NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2025-02-23 19:39:47','2025-02-23 19:39:47');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `property_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('sent','read','archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_receiver_id_foreign` (`receiver_id`),
  KEY `messages_property_id_foreign` (`property_id`),
  CONSTRAINT `messages_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,3,1,'Helooo','sent','2025-02-23 20:35:37','2025-02-23 20:35:37');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2016_01_01_000000_add_voyager_user_fields',1),(5,'2016_01_01_000000_create_data_types_table',1),(6,'2016_05_19_173453_create_menu_table',1),(7,'2016_10_21_190000_create_roles_table',1),(8,'2016_10_21_190000_create_settings_table',1),(9,'2016_11_30_135954_create_permission_table',1),(10,'2016_11_30_141208_create_permission_role_table',1),(11,'2016_12_26_201236_data_types__add__server_side',1),(12,'2017_01_13_000000_add_route_to_menu_items_table',1),(13,'2017_01_14_005015_create_translations_table',1),(14,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(15,'2017_03_06_000000_add_controller_to_data_types_table',1),(16,'2017_04_21_000000_add_order_to_data_rows_table',1),(17,'2017_07_05_210000_add_policyname_to_data_types_table',1),(18,'2017_08_05_000000_add_group_to_settings_table',1),(19,'2017_11_26_013050_add_user_role_relationship',1),(20,'2017_11_26_015000_create_user_roles_table',1),(21,'2018_03_11_000000_add_user_settings',1),(22,'2018_03_14_000000_add_details_to_data_types_table',1),(23,'2018_03_16_000000_make_settings_value_nullable',1),(24,'2019_08_19_000000_create_failed_jobs_table',1),(25,'2019_12_14_000001_create_personal_access_tokens_table',1),(26,'2025_02_24_023535_create_sessions_table',1),(27,'2016_01_01_000000_create_pages_table',2),(28,'2016_01_01_000000_create_posts_table',2),(29,'2016_02_15_204651_create_categories_table',2),(38,'2017_04_11_000000_alter_post_nullable_fields_table',3),(39,'2025_02_24_030001_create_property_types_table',3),(40,'2025_02_24_030035_create_properties_table',3),(41,'2025_02_24_030053_create_property_features_table',3),(42,'2025_02_24_030124_create_user_favorites_table',3),(43,'2025_02_24_030144_create_messages_table',3),(44,'2025_02_24_030159_create_property_images_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2025-02-23 19:39:53','2025-02-23 19:39:53');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(2,'browse_bread',NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(3,'browse_database',NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(4,'browse_media',NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(5,'browse_compass',NULL,'2025-02-23 19:39:47','2025-02-23 19:39:47'),(6,'browse_menus','menus','2025-02-23 19:39:47','2025-02-23 19:39:47'),(7,'read_menus','menus','2025-02-23 19:39:47','2025-02-23 19:39:47'),(8,'edit_menus','menus','2025-02-23 19:39:47','2025-02-23 19:39:47'),(9,'add_menus','menus','2025-02-23 19:39:47','2025-02-23 19:39:47'),(10,'delete_menus','menus','2025-02-23 19:39:47','2025-02-23 19:39:47'),(11,'browse_roles','roles','2025-02-23 19:39:47','2025-02-23 19:39:47'),(12,'read_roles','roles','2025-02-23 19:39:47','2025-02-23 19:39:47'),(13,'edit_roles','roles','2025-02-23 19:39:47','2025-02-23 19:39:47'),(14,'add_roles','roles','2025-02-23 19:39:47','2025-02-23 19:39:47'),(15,'delete_roles','roles','2025-02-23 19:39:47','2025-02-23 19:39:47'),(16,'browse_users','users','2025-02-23 19:39:47','2025-02-23 19:39:47'),(17,'read_users','users','2025-02-23 19:39:47','2025-02-23 19:39:47'),(18,'edit_users','users','2025-02-23 19:39:47','2025-02-23 19:39:47'),(19,'add_users','users','2025-02-23 19:39:47','2025-02-23 19:39:47'),(20,'delete_users','users','2025-02-23 19:39:47','2025-02-23 19:39:47'),(21,'browse_settings','settings','2025-02-23 19:39:47','2025-02-23 19:39:47'),(22,'read_settings','settings','2025-02-23 19:39:47','2025-02-23 19:39:47'),(23,'edit_settings','settings','2025-02-23 19:39:47','2025-02-23 19:39:47'),(24,'add_settings','settings','2025-02-23 19:39:47','2025-02-23 19:39:47'),(25,'delete_settings','settings','2025-02-23 19:39:47','2025-02-23 19:39:47'),(26,'browse_categories','categories','2025-02-23 19:39:52','2025-02-23 19:39:52'),(27,'read_categories','categories','2025-02-23 19:39:52','2025-02-23 19:39:52'),(28,'edit_categories','categories','2025-02-23 19:39:52','2025-02-23 19:39:52'),(29,'add_categories','categories','2025-02-23 19:39:52','2025-02-23 19:39:52'),(30,'delete_categories','categories','2025-02-23 19:39:52','2025-02-23 19:39:52'),(31,'browse_posts','posts','2025-02-23 19:39:53','2025-02-23 19:39:53'),(32,'read_posts','posts','2025-02-23 19:39:53','2025-02-23 19:39:53'),(33,'edit_posts','posts','2025-02-23 19:39:53','2025-02-23 19:39:53'),(34,'add_posts','posts','2025-02-23 19:39:53','2025-02-23 19:39:53'),(35,'delete_posts','posts','2025-02-23 19:39:53','2025-02-23 19:39:53'),(36,'browse_pages','pages','2025-02-23 19:39:53','2025-02-23 19:39:53'),(37,'read_pages','pages','2025-02-23 19:39:53','2025-02-23 19:39:53'),(38,'edit_pages','pages','2025-02-23 19:39:53','2025-02-23 19:39:53'),(39,'add_pages','pages','2025-02-23 19:39:53','2025-02-23 19:39:53'),(40,'delete_pages','pages','2025-02-23 19:39:53','2025-02-23 19:39:53'),(41,'browse_messages','messages','2025-02-23 20:07:28','2025-02-23 20:07:28'),(42,'read_messages','messages','2025-02-23 20:07:28','2025-02-23 20:07:28'),(43,'edit_messages','messages','2025-02-23 20:07:28','2025-02-23 20:07:28'),(44,'add_messages','messages','2025-02-23 20:07:28','2025-02-23 20:07:28'),(45,'delete_messages','messages','2025-02-23 20:07:28','2025-02-23 20:07:28'),(46,'browse_properties','properties','2025-02-23 20:07:42','2025-02-23 20:07:42'),(47,'read_properties','properties','2025-02-23 20:07:42','2025-02-23 20:07:42'),(48,'edit_properties','properties','2025-02-23 20:07:42','2025-02-23 20:07:42'),(49,'add_properties','properties','2025-02-23 20:07:42','2025-02-23 20:07:42'),(50,'delete_properties','properties','2025-02-23 20:07:42','2025-02-23 20:07:42'),(51,'browse_property_features','property_features','2025-02-23 20:07:54','2025-02-23 20:07:54'),(52,'read_property_features','property_features','2025-02-23 20:07:54','2025-02-23 20:07:54'),(53,'edit_property_features','property_features','2025-02-23 20:07:54','2025-02-23 20:07:54'),(54,'add_property_features','property_features','2025-02-23 20:07:54','2025-02-23 20:07:54'),(55,'delete_property_features','property_features','2025-02-23 20:07:54','2025-02-23 20:07:54'),(56,'browse_property_images','property_images','2025-02-23 20:08:06','2025-02-23 20:08:06'),(57,'read_property_images','property_images','2025-02-23 20:08:06','2025-02-23 20:08:06'),(58,'edit_property_images','property_images','2025-02-23 20:08:06','2025-02-23 20:08:06'),(59,'add_property_images','property_images','2025-02-23 20:08:06','2025-02-23 20:08:06'),(60,'delete_property_images','property_images','2025-02-23 20:08:06','2025-02-23 20:08:06'),(61,'browse_property_types','property_types','2025-02-23 20:08:16','2025-02-23 20:08:16'),(62,'read_property_types','property_types','2025-02-23 20:08:16','2025-02-23 20:08:16'),(63,'edit_property_types','property_types','2025-02-23 20:08:16','2025-02-23 20:08:16'),(64,'add_property_types','property_types','2025-02-23 20:08:16','2025-02-23 20:08:16'),(65,'delete_property_types','property_types','2025-02-23 20:08:16','2025-02-23 20:08:16'),(66,'browse_user_favorites','user_favorites','2025-02-23 20:09:02','2025-02-23 20:09:02'),(67,'read_user_favorites','user_favorites','2025-02-23 20:09:02','2025-02-23 20:09:02'),(68,'edit_user_favorites','user_favorites','2025-02-23 20:09:02','2025-02-23 20:09:02'),(69,'add_user_favorites','user_favorites','2025-02-23 20:09:02','2025-02-23 20:09:02'),(70,'delete_user_favorites','user_favorites','2025-02-23 20:09:02','2025-02-23 20:09:02');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint unsigned NOT NULL,
  `property_type_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,2) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('available','sold','rented') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `properties_author_id_foreign` (`author_id`),
  KEY `properties_property_type_id_foreign` (`property_type_id`),
  CONSTRAINT `properties_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `properties_property_type_id_foreign` FOREIGN KEY (`property_type_id`) REFERENCES `property_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,3,4,'Biệt thự đẹp tại trung tâm','Biệt thự rộng rãi, view đẹp',5000000.00,'Bình tân, Hồ Chí Minh','available','2025-02-23 20:29:10','2025-02-23 20:29:10'),(2,3,2,'Căn hộ cao cấp','Căn hộ sang trọng, đầy đủ tiện nghi',3000000.00,'thanh xuân, Hà Nội','available','2025-02-23 20:30:00','2025-02-23 20:30:00'),(3,3,3,'Đất nền khu công nghiệp','Đất nền gần khu công nghiệp, vị trí đẹp',1000000.00,'Đà Nẵng','available','2025-02-23 20:30:39','2025-02-23 20:30:39'),(4,3,1,'Nhà ở cho thuê','Nhà ở đầy đủ tiện nghi, giá rẻ',100000.00,'Cần Thơ','available','2025-02-23 20:31:47','2025-02-23 20:31:47'),(5,3,4,'Biệt thự cao cấp','Biệt thự sang trọng với hồ bơi',10000000.00,'Bình Dương','sold','2025-02-23 20:32:28','2025-02-23 20:32:28'),(6,2,4,'chung cư Minn Hiuu','fhfuefheufhefuh',10000000000.00,'Tân Phú, Hồ Chí minh','available','2025-02-23 21:32:55','2025-02-23 21:32:55'),(7,2,1,'rrgrgrg','rrrr',5000000.00,'rrr','available','2025-02-23 21:38:20','2025-02-23 21:38:20'),(8,2,3,'test','test',10000000.00,'1111','available','2025-02-23 21:46:08','2025-02-23 21:46:08');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_features`
--

DROP TABLE IF EXISTS `property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `property_id` bigint unsigned NOT NULL,
  `feature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_features_property_id_foreign` (`property_id`),
  CONSTRAINT `property_features_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_features`
--

LOCK TABLES `property_features` WRITE;
/*!40000 ALTER TABLE `property_features` DISABLE KEYS */;
INSERT INTO `property_features` VALUES (1,1,'Sân vườn','2025-02-23 20:32:49','2025-02-23 20:32:49'),(2,1,'Hồ bơi','2025-02-23 20:33:25','2025-02-23 20:33:25'),(3,1,'Phòng gym','2025-02-23 20:33:37','2025-02-23 20:33:37'),(4,1,'Gần trường học','2025-02-23 20:33:47','2025-02-23 20:33:47'),(5,1,'Gần trung tâm','2025-02-23 20:33:55','2025-02-23 20:33:55'),(6,8,'Hồ Bơi','2025-02-23 21:46:08','2025-02-23 21:46:08'),(7,8,'Gần trung tâm','2025-02-23 21:46:08','2025-02-23 21:46:08');
/*!40000 ALTER TABLE `property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_images`
--

DROP TABLE IF EXISTS `property_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `property_id` bigint unsigned NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_images_property_id_foreign` (`property_id`),
  CONSTRAINT `property_images_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_images`
--

LOCK TABLES `property_images` WRITE;
/*!40000 ALTER TABLE `property_images` DISABLE KEYS */;
INSERT INTO `property_images` VALUES (1,1,'https://storage.googleapis.com/a1aa/image/wosPBT0yEdJ4Cqx0NsW_OBexgNcN6L7IqNLbIDZcbKI.jpg','2025-02-23 20:36:47','2025-02-23 20:36:47'),(2,2,'https://storage.googleapis.com/a1aa/image/yuYYwIw4fr5vhaoUmRDIBPazsSVY2Uy22DfKv8OMiaM.jpg','2025-02-23 20:36:58','2025-02-23 20:36:58'),(3,3,'https://storage.googleapis.com/a1aa/image/yuYYwIw4fr5vhaoUmRDIBPazsSVY2Uy22DfKv8OMiaM.jpg','2025-02-23 20:37:05','2025-02-23 20:37:05'),(4,4,'https://storage.googleapis.com/a1aa/image/PZuZpBlrO55Qgyyn5cLqmmE6aayKo0YK-wjN0xaK5bo.jpg','2025-02-23 20:37:17','2025-02-23 20:37:17'),(5,5,'https://storage.googleapis.com/a1aa/image/daVdeBu1nOePNtzDy2ZY159O-GZlKc_YlGpDbW6hnYI.jpg','2025-02-23 20:37:27','2025-02-23 20:37:27'),(6,6,'properties/ZHLmXwKhU7km2SaD3Cw1EYeM7Sh69dAN0rHbckMy.png','2025-02-23 21:32:55','2025-02-23 21:32:55'),(7,7,'storage/properties/bNk1O21GQvpEni8EY6N1jV7Mbk0cW3JrZ4ejIMwU.png','2025-02-23 21:38:20','2025-02-23 21:38:20'),(8,8,'storage/properties/tbhpwJeTJDT3OQ3Dw1PdnysZwgUlGDOnpA09Ogug.png','2025-02-23 21:46:08','2025-02-23 21:46:08'),(9,8,'storage/properties/nkw87wbzWWgBAgsyDni3znZ6IZZV2ozMWngZafFX.png','2025-02-23 21:46:08','2025-02-23 21:46:08'),(10,8,'storage/properties/XVCJl04W5IGpVrt46O6LSH6ZHAe3zXfK9EQ3JJfg.png','2025-02-23 21:46:08','2025-02-23 21:46:08');
/*!40000 ALTER TABLE `property_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_types`
--

DROP TABLE IF EXISTS `property_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `property_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_types`
--

LOCK TABLES `property_types` WRITE;
/*!40000 ALTER TABLE `property_types` DISABLE KEYS */;
INSERT INTO `property_types` VALUES (1,'nhà ở','nha-o','fas fa-home','2025-02-23 20:26:22','2025-02-23 20:26:22'),(2,'căn hộ','can-ho','fas fa-building','2025-02-23 20:26:40','2025-02-23 20:26:40'),(3,'đất nền','dat nen','fas fa-tree','2025-02-23 20:27:03','2025-02-23 20:27:03'),(4,'biệt thự','biet-thu','fas fa-cottage','2025-02-23 20:27:23','2025-02-23 20:27:23'),(5,'chung cư','chung-cu','fas fa-apartment','2025-02-23 20:27:45','2025-02-23 20:27:45');
/*!40000 ALTER TABLE `property_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2025-02-23 19:39:47','2025-02-23 19:39:47'),(2,'user','Normal User','2025-02-23 19:39:47','2025-02-23 19:39:47');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('35cLFeZZz9sURe19aHZtpkFEMg7pLOSJXSmzvBN0',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoibVBkY0hhUk9QN2h5WThFSWxMeVhnSVY5WkdXQUFXRmF2UHljZVhMMCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRwWGtQZ1JXb29TazEyS2lwenJkbTEucGlZdDl2NDJWQnc2Ni5iZi5aRHQ2SVJUQ3IyelY4eSI7fQ==',1740365362),('91pN3h8mOsItewhutytf4RkAUb0XqROxuJCNCJmz',3,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWk1LZElTakF5RVBaZDg4NzZENkptN25halFvU1NqNUZlNGE0UlFJMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9kdWN0LWRldGFpbC8zIjt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkUVc2b1RwL3paM0lsWnJQamZjOG15T3VUQTlGV1A1WGpmaWZUdlBjOXg5dEZsOGMvQmUyWG0iO30=',1740373217),('j3XLfzs8OkPzizn29fWdr89DV25DtWGzkdIDtCmK',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiamJYZVhFSDJmUGRhTFJIZVNZU3U5ckpjdnprY3B6NnVYUk9DRDBheCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0LWRldGFpbC84Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRwWGtQZ1JXb29TazEyS2lwenJkbTEucGlZdDl2NDJWQnc2Ni5iZi5aRHQ2SVJUQ3IyelY4eSI7fQ==',1740372931);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','bds.com','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','bds.com','','text',1,'Admin'),(7,'admin.description','Admin Description','Admin Dashboard','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2025-02-23 19:39:53','2025-02-23 19:39:53'),(2,'data_types','display_name_singular',6,'pt','Página','2025-02-23 19:39:53','2025-02-23 19:39:53'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2025-02-23 19:39:53','2025-02-23 19:39:53'),(4,'data_types','display_name_singular',4,'pt','Categoria','2025-02-23 19:39:53','2025-02-23 19:39:53'),(5,'data_types','display_name_singular',2,'pt','Menu','2025-02-23 19:39:53','2025-02-23 19:39:53'),(6,'data_types','display_name_singular',3,'pt','Função','2025-02-23 19:39:53','2025-02-23 19:39:53'),(7,'data_types','display_name_plural',5,'pt','Posts','2025-02-23 19:39:53','2025-02-23 19:39:53'),(8,'data_types','display_name_plural',6,'pt','Páginas','2025-02-23 19:39:53','2025-02-23 19:39:53'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2025-02-23 19:39:53','2025-02-23 19:39:53'),(10,'data_types','display_name_plural',4,'pt','Categorias','2025-02-23 19:39:53','2025-02-23 19:39:53'),(11,'data_types','display_name_plural',2,'pt','Menus','2025-02-23 19:39:53','2025-02-23 19:39:53'),(12,'data_types','display_name_plural',3,'pt','Funções','2025-02-23 19:39:53','2025-02-23 19:39:53'),(13,'categories','slug',1,'pt','categoria-1','2025-02-23 19:39:53','2025-02-23 19:39:53'),(14,'categories','name',1,'pt','Categoria 1','2025-02-23 19:39:53','2025-02-23 19:39:53'),(15,'categories','slug',2,'pt','categoria-2','2025-02-23 19:39:53','2025-02-23 19:39:53'),(16,'categories','name',2,'pt','Categoria 2','2025-02-23 19:39:53','2025-02-23 19:39:53'),(17,'pages','title',1,'pt','Olá Mundo','2025-02-23 19:39:53','2025-02-23 19:39:53'),(18,'pages','slug',1,'pt','ola-mundo','2025-02-23 19:39:53','2025-02-23 19:39:53'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2025-02-23 19:39:53','2025-02-23 19:39:53'),(20,'menu_items','title',1,'pt','Painel de Controle','2025-02-23 19:39:53','2025-02-23 19:39:53'),(21,'menu_items','title',2,'pt','Media','2025-02-23 19:39:53','2025-02-23 19:39:53'),(22,'menu_items','title',12,'pt','Publicações','2025-02-23 19:39:53','2025-02-23 19:39:53'),(23,'menu_items','title',3,'pt','Utilizadores','2025-02-23 19:39:53','2025-02-23 19:39:53'),(24,'menu_items','title',11,'pt','Categorias','2025-02-23 19:39:53','2025-02-23 19:39:53'),(25,'menu_items','title',13,'pt','Páginas','2025-02-23 19:39:53','2025-02-23 19:39:53'),(26,'menu_items','title',4,'pt','Funções','2025-02-23 19:39:53','2025-02-23 19:39:53'),(27,'menu_items','title',5,'pt','Ferramentas','2025-02-23 19:39:53','2025-02-23 19:39:53'),(28,'menu_items','title',6,'pt','Menus','2025-02-23 19:39:53','2025-02-23 19:39:53'),(29,'menu_items','title',7,'pt','Base de dados','2025-02-23 19:39:53','2025-02-23 19:39:53'),(30,'menu_items','title',10,'pt','Configurações','2025-02-23 19:39:53','2025-02-23 19:39:53');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorites`
--

DROP TABLE IF EXISTS `user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `property_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_favorites_user_id_property_id_unique` (`user_id`,`property_id`),
  KEY `user_favorites_property_id_foreign` (`property_id`),
  CONSTRAINT `user_favorites_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `user_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
INSERT INTO `user_favorites` VALUES (1,3,3,'2025-02-23 20:34:40','2025-02-23 20:34:40'),(2,3,1,'2025-02-23 20:34:44','2025-02-23 20:34:44'),(3,3,2,'2025-02-23 20:34:50','2025-02-23 20:34:50');
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,1,'BDS_Admin','admin@gmail.com','users/default.png',NULL,'$2y$12$pXkPgRWooSk12Kipzrdm1.piYt9v42VBw66.bf.ZDt6IRTCr2zV8y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-02-23 19:40:29','2025-02-23 19:40:29'),(3,2,'BDS_User','user@gmail.com','users/default.png',NULL,'$2y$12$QW6oTp/zZ3IlZrPjfc8myOuTA9FWP5XjfifTvPc9x9tFl8c/Be2Xm',NULL,NULL,NULL,NULL,'{\"locale\":\"vi\"}',NULL,NULL,'2025-02-23 20:14:39','2025-02-23 20:14:39');
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

-- Dump completed on 2025-02-24 12:02:33
