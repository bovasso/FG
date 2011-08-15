# ************************************************************
# Sequel Pro SQL dump
# Version 3348
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.57)
# Database: funnygarbage
# Generation Time: 2011-08-08 03:46:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table about_slideshow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `about_slideshow`;

CREATE TABLE `about_slideshow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `about_slideshow` WRITE;
/*!40000 ALTER TABLE `about_slideshow` DISABLE KEYS */;

INSERT INTO `about_slideshow` (`id`, `title`, `subtitle`, `description`, `is_active`, `position`, `created_at`, `updated_at`)
VALUES
	(1,'WE MAKE IT WORK...','24/7 Problem Solvers','Based on our over fifteen years of launching interactive experiences, we know how to get it done. With a proven methodology and a deeply experienced team, we can deliver',1,-1,'2011-08-06 15:53:06','2011-08-06 15:53:06');

/*!40000 ALTER TABLE `about_slideshow` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `body`)
VALUES
	(1,'Animation & Motion Graphics',''),
	(2,'Application',''),
	(3,'Mobile & Tablet',''),
	(4,'Content Development',''),
	(5,'Website',''),
	(6,'Game',''),
	(7,'Kiosk',''),
	(8,'Print',''),
	(9,'Brand Identity',''),
	(10,'TV',''),
	(11,'Original Property','');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client
# ------------------------------------------------------------

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `logo` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_logo_idx` (`logo`),
  CONSTRAINT `client_logo_dm_media_id_1` FOREIGN KEY (`logo`) REFERENCES `dm_media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;

INSERT INTO `client` (`id`, `title`, `description`, `logo`, `is_active`, `position`)
VALUES
	(9,'Sesame Workshop','',300,1,-1),
	(10,'Crayola','',302,1,-2),
	(11,'WENNER PUBLISHING','',308,1,-3);

/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_area`;

CREATE TABLE `dm_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  `dm_page_view_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  KEY `dm_page_view_id_idx` (`dm_page_view_id`),
  CONSTRAINT `dm_area_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_area_dm_page_view_id_dm_page_view_id` FOREIGN KEY (`dm_page_view_id`) REFERENCES `dm_page_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_area` WRITE;
/*!40000 ALTER TABLE `dm_area` DISABLE KEYS */;

INSERT INTO `dm_area` (`id`, `dm_layout_id`, `dm_page_view_id`, `type`)
VALUES
	(1,NULL,2,'1'),
	(2,NULL,3,'1'),
	(3,1,NULL,'top'),
	(4,1,NULL,'left'),
	(5,NULL,1,'content'),
	(6,1,NULL,'right'),
	(7,1,NULL,'bottom'),
	(8,1,NULL,'content_top'),
	(9,1,NULL,'leadership_content'),
	(10,1,NULL,'services_content'),
	(11,1,NULL,'history_awards_content'),
	(12,NULL,2,'content'),
	(21,3,NULL,'top'),
	(22,3,NULL,'left'),
	(23,3,NULL,'right'),
	(24,3,NULL,'bottom'),
	(25,3,NULL,'content_top'),
	(26,3,NULL,'leadership_content'),
	(27,3,NULL,'services_content'),
	(28,3,NULL,'history_awards_content'),
	(29,4,NULL,'top'),
	(30,4,NULL,'left'),
	(31,4,NULL,'right'),
	(32,4,NULL,'bottom'),
	(33,4,NULL,'content_top'),
	(34,4,NULL,'leadership_content'),
	(35,4,NULL,'services_content'),
	(36,4,NULL,'history_awards_content'),
	(37,6,NULL,'top'),
	(38,6,NULL,'left'),
	(39,6,NULL,'right'),
	(40,6,NULL,'bottom'),
	(41,6,NULL,'content_top'),
	(42,6,NULL,'leadership_content'),
	(43,6,NULL,'services_content'),
	(44,6,NULL,'history_awards_content'),
	(45,8,NULL,'top'),
	(46,8,NULL,'left'),
	(47,8,NULL,'right'),
	(48,8,NULL,'bottom'),
	(49,8,NULL,'content_top'),
	(50,8,NULL,'leadership_content'),
	(51,8,NULL,'services_content'),
	(52,8,NULL,'history_awards_content'),
	(53,9,NULL,'top'),
	(54,9,NULL,'left'),
	(55,9,NULL,'right'),
	(56,9,NULL,'bottom'),
	(57,9,NULL,'content_top'),
	(58,9,NULL,'leadership_content'),
	(59,9,NULL,'services_content'),
	(60,9,NULL,'history_awards_content'),
	(61,10,NULL,'top'),
	(62,10,NULL,'left'),
	(63,10,NULL,'right'),
	(64,10,NULL,'bottom'),
	(65,10,NULL,'content_top'),
	(66,10,NULL,'leadership_content'),
	(67,10,NULL,'services_content'),
	(68,10,NULL,'history_awards_content'),
	(69,11,NULL,'top'),
	(70,11,NULL,'left'),
	(71,11,NULL,'right'),
	(72,11,NULL,'bottom'),
	(73,11,NULL,'content_top'),
	(74,11,NULL,'leadership_content'),
	(75,11,NULL,'services_content'),
	(76,11,NULL,'history_awards_content'),
	(77,NULL,11,'content'),
	(78,NULL,4,'content'),
	(79,NULL,13,'content'),
	(80,NULL,14,'content'),
	(81,12,NULL,'top'),
	(82,12,NULL,'left'),
	(83,12,NULL,'right'),
	(84,12,NULL,'bottom'),
	(85,12,NULL,'content_top'),
	(86,12,NULL,'leadership_content'),
	(87,12,NULL,'services_content'),
	(88,12,NULL,'history_awards_content'),
	(89,NULL,16,'content'),
	(90,NULL,10,'content'),
	(91,NULL,17,'content'),
	(92,13,NULL,'top'),
	(93,13,NULL,'left'),
	(94,13,NULL,'right'),
	(95,13,NULL,'bottom'),
	(96,13,NULL,'content_top'),
	(97,13,NULL,'leadership_content'),
	(98,13,NULL,'services_content'),
	(99,13,NULL,'history_awards_content'),
	(100,NULL,18,'content'),
	(101,NULL,20,'content'),
	(102,NULL,21,'content'),
	(103,14,NULL,'top'),
	(104,14,NULL,'left'),
	(105,14,NULL,'right'),
	(106,14,NULL,'bottom'),
	(107,14,NULL,'content_top'),
	(108,14,NULL,'leadership_content'),
	(109,14,NULL,'services_content'),
	(110,14,NULL,'history_awards_content'),
	(111,NULL,19,'content'),
	(112,12,NULL,'overview_content');

/*!40000 ALTER TABLE `dm_area` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_auto_seo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_auto_seo`;

CREATE TABLE `dm_auto_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmAutoSeoModuleAction_idx` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_auto_seo` WRITE;
/*!40000 ALTER TABLE `dm_auto_seo` DISABLE KEYS */;

INSERT INTO `dm_auto_seo` (`id`, `module`, `action`, `created_at`, `updated_at`)
VALUES
	(1,'category','show','2011-08-06 15:31:05','2011-08-06 15:31:05'),
	(2,'project','show','2011-08-06 15:31:05','2011-08-06 15:31:05'),
	(3,'projectVideo','show','2011-08-06 15:31:05','2011-08-06 15:31:05'),
	(4,'jobPosition','show','2011-08-06 15:41:55','2011-08-06 15:41:55'),
	(5,'jobApplication','show','2011-08-06 15:41:55','2011-08-06 15:41:55'),
	(6,'dmTag','show','2011-08-06 15:41:55','2011-08-06 15:41:55'),
	(7,'client','show','2011-08-06 15:41:55','2011-08-06 15:41:55'),
	(8,'staffMember','show','2011-08-06 15:41:55','2011-08-06 15:41:55'),
	(9,'serviceCategory','show','2011-08-06 15:41:55','2011-08-06 15:41:55');

/*!40000 ALTER TABLE `dm_auto_seo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_auto_seo_translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_auto_seo_translation`;

CREATE TABLE `dm_auto_seo_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strip_words` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_auto_seo_translation_id_dm_auto_seo_id` FOREIGN KEY (`id`) REFERENCES `dm_auto_seo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_auto_seo_translation` WRITE;
/*!40000 ALTER TABLE `dm_auto_seo_translation` DISABLE KEYS */;

INSERT INTO `dm_auto_seo_translation` (`id`, `slug`, `name`, `title`, `h1`, `description`, `keywords`, `strip_words`, `lang`)
VALUES
	(1,'%category.name%','%category.name%','%category.name%',NULL,'%category.body%',NULL,NULL,'en'),
	(2,'%project.title%','%project.title%','%project.title%',NULL,'%project.title%',NULL,NULL,'en'),
	(3,'%project_video.name%','%project_video.name%','%project_video.name%',NULL,'%project_video.body%',NULL,NULL,'en'),
	(4,'%job_position.name%','%job_position.name%','%job_position.name%',NULL,'%job_position.description%',NULL,NULL,'en'),
	(5,'%job_application%','%job_application%','%job_application%',NULL,'%job_application.resume%',NULL,NULL,'en'),
	(6,'%dm_tag.name%','%dm_tag.name%','%dm_tag.name%',NULL,'%dm_tag.name%',NULL,NULL,'en'),
	(7,'%client.title%','%client.title%','%client.title%',NULL,'%client.description%',NULL,NULL,'en'),
	(8,'%staff_member.name%','%staff_member.name%','%staff_member.name%',NULL,'%staff_member.name%',NULL,NULL,'en'),
	(9,'%service_category.name%','%service_category.name%','%service_category.name%',NULL,'%service_category.body%',NULL,NULL,'en');

/*!40000 ALTER TABLE `dm_auto_seo_translation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_catalogue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_catalogue`;

CREATE TABLE `dm_catalogue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `target_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dm_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_contact`;

CREATE TABLE `dm_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dm_error
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_error`;

CREATE TABLE `dm_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `php_class` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `module` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `env` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_error` WRITE;
/*!40000 ALTER TABLE `dm_error` DISABLE KEYS */;

INSERT INTO `dm_error` (`id`, `php_class`, `name`, `description`, `module`, `action`, `uri`, `env`, `created_at`)
VALUES
	(1,'Exception','Couldn\'t resolve host \'diem-project.org\'','Couldn\'t resolve host \'diem-project.org\'\n#0 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(217): sfCurlAdapter->call(Object(dmWebBrowser), \'http://diem-pro...\', \'GET\', Array, Array)\n#1 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(116): sfWebBrowser->call(\'http://diem-pro...\', \'GET\', Array, Array)\n#2 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmAdminPlugin/lib/webService/dmDiemVersionCheck.php(50): sfWebBrowser->get(\'http://diem-pro...\')\n#3 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmAdminPlugin/lib/webService/dmDiemVersionCheck.php(32): dmDiemVersionCheck->getLatestServerVersionForBranch(\'5.1\')\n#4 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmAdminPlugin/modules/dmAdmin/lib/BasedmAdminActions.class.php(93): dmDiemVersionCheck->isUpToDate()\n#5 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(459): BasedmAdminActions->executeVersionCheck(Object(dmWebRequest))\n#6 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(947): sfActions->execute(Object(dmWebRequest))\n#7 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(942): sfExecutionFilter->executeAction(Object(dmAdminActions))\n#8 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(dmAdminActions))\n#9 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfExecutionFilter->execute(Object(sfFilterChain))\n#10 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#11 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfCacheFilter->execute(Object(sfFilterChain))\n#12 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#13 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): dmAdminInitFilter->execute(Object(sfFilterChain))\n#14 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#15 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#16 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#17 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): dmRememberMeFilter->execute(Object(sfFilterChain))\n#18 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(990): sfFilterChain->execute()\n#19 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfRenderingFilter->execute(Object(sfFilterChain))\n#20 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(660): sfFilterChain->execute()\n#21 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(2344): sfController->forward(\'dmAdmin\', \'versionCheck\')\n#22 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#23 /Volumes/Data/Sites/funnygarbage/www/web/admin.php(7): dmContext->dispatch()\n#24 {main}','dmAdmin','versionCheck','http://dev.funnygarbage.com/admin.php/+/dmAdmin/versionCheck?_=1312686056705&dm_cpi=0&dm_xhr=1','prod','2011-08-06 23:00:57'),
	(2,'Doctrine_Connection_Mysql_Exception','SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'9-logo_90x90_crayola.jpg\' for key \'folderFile_idx\'','SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'9-logo_90x90_crayola.jpg\' for key \'folderFile_idx\'\n#0 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/Statement.php(269): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Statement))\n#1 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1042): Doctrine_Connection_Statement->execute(Array)\n#2 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(687): Doctrine_Connection->exec(\'INSERT INTO dm_...\', Array)\n#3 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(647): Doctrine_Connection->insert(Object(DmMediaTable), Array)\n#4 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(571): Doctrine_Connection_UnitOfWork->processSingleInsert(Object(DmMedia))\n#5 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(81): Doctrine_Connection_UnitOfWork->insert(Object(DmMedia))\n#6 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Record.php(1718): Doctrine_Connection_UnitOfWork->saveGraph(Object(DmMedia))\n#7 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmCorePlugin/lib/model/doctrine/PluginDmMedia.class.php(353): Doctrine_Record->save(Object(Doctrine_Connection_Mysql))\n#8 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(404): PluginDmMedia->save(Object(Doctrine_Connection_Mysql))\n#9 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(73): Doctrine_Connection_UnitOfWork->saveRelatedLocalKeys(Object(Client))\n#10 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Record.php(1718): Doctrine_Connection_UnitOfWork->saveGraph(Object(Client))\n#11 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/form/addon/sfFormObject.class.php(161): Doctrine_Record->save(Object(Doctrine_Connection_Mysql))\n#12 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/form/addon/sfFormObject.class.php(130): sfFormObject->doSave(Object(Doctrine_Connection_Mysql))\n#13 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/modules/autoClient/actions/actions.class.php(189): sfFormObject->save()\n#14 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/modules/autoClient/actions/actions.class.php(135): autoClientActions->processForm(Object(dmWebRequest), Object(ClientAdminForm))\n#15 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(459): autoClientActions->executeCreate(Object(dmWebRequest))\n#16 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(947): sfActions->execute(Object(dmWebRequest))\n#17 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(942): sfExecutionFilter->executeAction(Object(clientActions))\n#18 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(clientActions))\n#19 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfExecutionFilter->execute(Object(sfFilterChain))\n#20 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#21 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfCacheFilter->execute(Object(sfFilterChain))\n#22 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#23 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): dmAdminInitFilter->execute(Object(sfFilterChain))\n#24 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#25 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#26 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#27 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): dmRememberMeFilter->execute(Object(sfFilterChain))\n#28 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(990): sfFilterChain->execute()\n#29 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(1026): sfRenderingFilter->execute(Object(sfFilterChain))\n#30 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(660): sfFilterChain->execute()\n#31 /Volumes/Data/Sites/funnygarbage/www/cache/admin/prod/config/config_core_compile.yml.php(2344): sfController->forward(\'client\', \'create\')\n#32 /Volumes/Data/Sites/funnygarbage/www/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#33 /Volumes/Data/Sites/funnygarbage/www/web/admin.php(7): dmContext->dispatch()\n#34 {main}','client','create','http://dev.funnygarbage.com/admin.php/content/portfolio/clients/create','prod','2011-08-07 10:06:32');

/*!40000 ALTER TABLE `dm_error` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_group`;

CREATE TABLE `dm_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_group` WRITE;
/*!40000 ALTER TABLE `dm_group` DISABLE KEYS */;

INSERT INTO `dm_group` (`id`, `name`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'developer','Able to read and update source code','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(2,'seo','Seo knowledge','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(3,'integrator','Integrator','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(4,'webmaster 1','Webmaster level 1','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(5,'writer','Writer','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(6,'front_editor','Can fast edit front widgets','2011-08-06 14:52:03','2011-08-06 14:52:03');

/*!40000 ALTER TABLE `dm_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_group_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_group_permission`;

CREATE TABLE `dm_group_permission` (
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_group_id`,`dm_permission_id`),
  KEY `dm_group_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`),
  CONSTRAINT `dm_group_permission_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_group_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_group_permission` WRITE;
/*!40000 ALTER TABLE `dm_group_permission` DISABLE KEYS */;

INSERT INTO `dm_group_permission` (`dm_group_id`, `dm_permission_id`)
VALUES
	(1,1),
	(2,2),
	(3,2),
	(4,2),
	(5,2),
	(3,5),
	(3,9),
	(4,9),
	(5,9),
	(3,10),
	(3,11),
	(3,12),
	(3,13),
	(3,14),
	(3,15),
	(6,16),
	(6,17),
	(6,18),
	(6,19),
	(6,20),
	(6,21),
	(6,22),
	(3,23),
	(3,24),
	(3,25),
	(2,26),
	(3,26),
	(4,26),
	(5,26),
	(3,27),
	(4,27),
	(5,27),
	(3,28),
	(2,29),
	(3,29),
	(4,29),
	(5,29),
	(2,30),
	(3,30),
	(4,30),
	(3,31),
	(4,31),
	(2,32),
	(3,32),
	(4,32),
	(2,33),
	(3,33),
	(4,33),
	(5,33),
	(3,34),
	(3,35),
	(2,36),
	(2,37),
	(2,38),
	(2,40),
	(2,41),
	(2,42),
	(2,43),
	(2,44),
	(4,46),
	(2,47),
	(3,47),
	(4,47),
	(5,47),
	(2,48),
	(3,48),
	(4,48),
	(5,48),
	(2,51),
	(3,51),
	(4,51),
	(3,52),
	(4,52),
	(3,53),
	(3,57);

/*!40000 ALTER TABLE `dm_group_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_layout`;

CREATE TABLE `dm_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'page',
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_layout` WRITE;
/*!40000 ALTER TABLE `dm_layout` DISABLE KEYS */;

INSERT INTO `dm_layout` (`id`, `name`, `template`, `css_class`)
VALUES
	(1,'Global','page',NULL),
	(3,'ProjectShow','page','project-show'),
	(4,'Projects','page','project-list'),
	(6,'ProjectsCategory','page','project-list'),
	(8,'Jobs','page','jobs'),
	(9,'JobsApply','page','job-application'),
	(10,'Home','page','home'),
	(11,'Contact','page','contact'),
	(12,'About','page','about'),
	(13,'Search','page','search'),
	(14,'Clients','page','project-list');

/*!40000 ALTER TABLE `dm_layout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_lock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_lock`;

CREATE TABLE `dm_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `time` bigint(20) NOT NULL,
  `app` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `culture` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmLockIndex_idx` (`user_id`,`module`,`action`,`record_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `dm_lock_user_id_dm_user_id` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_lock` WRITE;
/*!40000 ALTER TABLE `dm_lock` DISABLE KEYS */;

INSERT INTO `dm_lock` (`id`, `user_id`, `user_name`, `module`, `action`, `record_id`, `time`, `app`, `url`, `culture`)
VALUES
	(214,1,'admin','client','index',0,1312774572,'admin','/admin.php/content/portfolio/clients/index','en');

/*!40000 ALTER TABLE `dm_lock` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_mail_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_mail_template`;

CREATE TABLE `dm_mail_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vars` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_mail_template` WRITE;
/*!40000 ALTER TABLE `dm_mail_template` DISABLE KEYS */;

INSERT INTO `dm_mail_template` (`id`, `name`, `vars`, `created_at`, `updated_at`)
VALUES
	(1,'dm_user_forgot_password','username, email, step2_url','2011-08-06 14:52:03','2011-08-06 14:52:03');

/*!40000 ALTER TABLE `dm_mail_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_mail_template_translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_mail_template_translation`;

CREATE TABLE `dm_mail_template_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `from_email` text COLLATE utf8_unicode_ci NOT NULL,
  `to_email` text COLLATE utf8_unicode_ci,
  `cc_email` text COLLATE utf8_unicode_ci,
  `bcc_email` text COLLATE utf8_unicode_ci,
  `reply_to_email` text COLLATE utf8_unicode_ci,
  `sender_email` text COLLATE utf8_unicode_ci,
  `list_unsuscribe` text COLLATE utf8_unicode_ci,
  `is_html` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_mail_template_translation_id_dm_mail_template_id` FOREIGN KEY (`id`) REFERENCES `dm_mail_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_mail_template_translation` WRITE;
/*!40000 ALTER TABLE `dm_mail_template_translation` DISABLE KEYS */;

INSERT INTO `dm_mail_template_translation` (`id`, `description`, `subject`, `body`, `from_email`, `to_email`, `cc_email`, `bcc_email`, `reply_to_email`, `sender_email`, `list_unsuscribe`, `is_html`, `is_active`, `lang`)
VALUES
	(1,'Sent to a user that requests a new password','Www: change your password','Hello %username%\nYou can choose a new password at %step2_url%','webmaster@domain.com','%email%',NULL,NULL,NULL,NULL,NULL,0,1,'en');

/*!40000 ALTER TABLE `dm_mail_template_translation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_media`;

CREATE TABLE `dm_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_media_folder_id` bigint(20) NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `legend` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `dimensions` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folderFile_idx` (`dm_media_folder_id`,`file`),
  KEY `dm_media_folder_id_idx` (`dm_media_folder_id`),
  CONSTRAINT `dm_media_dm_media_folder_id_dm_media_folder_id` FOREIGN KEY (`dm_media_folder_id`) REFERENCES `dm_media_folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_media` WRITE;
/*!40000 ALTER TABLE `dm_media` DISABLE KEYS */;

INSERT INTO `dm_media` (`id`, `dm_media_folder_id`, `file`, `legend`, `author`, `license`, `mime`, `size`, `dimensions`, `created_at`, `updated_at`)
VALUES
	(1,3,'118470584372x41cn.jpg',NULL,NULL,NULL,'image/jpeg',1773,'72x41','2011-08-06 14:58:26','2011-08-06 22:11:44'),
	(2,3,'118477369472x41wb.jpg',NULL,NULL,NULL,'image/jpeg',1418,'72x41','2011-08-06 14:58:26','2011-08-06 22:13:14'),
	(3,3,'125875148172x41afta.jpg',NULL,NULL,NULL,'image/jpeg',3556,'72x41','2011-08-06 14:58:26','2011-08-06 22:13:15'),
	(4,3,'125900670372x41_lifetime.jpg',NULL,NULL,NULL,'image/jpeg',1615,'72x41','2011-08-06 14:58:26','2011-08-06 22:13:15'),
	(5,3,'125900672872x41_teennick.jpg',NULL,NULL,NULL,'image/jpeg',1758,'72x41','2011-08-06 14:58:26','2011-08-06 22:13:15'),
	(6,3,'125900677972x41_wenner.jpg',NULL,NULL,NULL,'image/jpeg',2649,'72x41','2011-08-06 14:58:26','2011-08-06 22:13:15'),
	(7,3,'screen-shot-2011-04-07-at-1-06-09-pm.png',NULL,NULL,NULL,'image/png',6448,'101x54','2011-08-06 14:58:26','2011-08-06 22:13:15'),
	(8,4,'resume_ajb121310.pdf',NULL,NULL,NULL,'application/pdf',67523,NULL,'2011-08-06 14:58:26','2011-08-06 14:58:26'),
	(9,4,'screen-shot-2011-04-05-at-2-44-10-pm.png',NULL,NULL,NULL,'image/png',442683,NULL,'2011-08-06 14:58:26','2011-08-06 14:58:26'),
	(10,4,'screen-shot-2011-04-06-at-11-49-53-am-2.png',NULL,NULL,NULL,'image/png',1004359,NULL,'2011-08-06 14:58:26','2011-08-06 14:58:26'),
	(11,6,'238x105_cokezero_5.jpg',NULL,NULL,NULL,'image/jpeg',54658,'238x105','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(12,6,'298x131_ammi_1.jpg',NULL,NULL,NULL,'image/jpeg',61594,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(13,6,'298x131_ammi_2.jpg',NULL,NULL,NULL,'image/jpeg',73929,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(14,6,'298x131_ch_tt.jpg',NULL,NULL,NULL,'image/jpeg',7748,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(15,6,'298x131_cmj_1.jpg',NULL,NULL,NULL,'image/jpeg',54432,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(16,6,'298x131_cmj_1.psd',NULL,NULL,NULL,'image/vnd.adobe.photoshop',1087228,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(17,6,'298x131_cn_dd-title.jpg',NULL,NULL,NULL,'image/jpeg',17544,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(18,6,'298x131_cn_pinkdonkey.jpg',NULL,NULL,NULL,'image/jpeg',23011,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(19,6,'298x131_cn_site.jpg',NULL,NULL,NULL,'image/jpeg',27698,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(20,6,'298x131_gaa.jpg',NULL,NULL,NULL,'image/jpeg',20303,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(21,6,'298x131_hit_1.jpg',NULL,NULL,NULL,'image/jpeg',660870,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(22,6,'298x131_video_masher_3.jpg',NULL,NULL,NULL,'image/jpeg',77385,'298x131','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(23,6,'400_adc_1.jpg',NULL,NULL,NULL,'image/jpeg',105474,'400x300','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(24,6,'400_ammi_1.jpg',NULL,NULL,NULL,'image/jpeg',153222,'400x303','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(25,6,'400_cmj_1.jpg',NULL,NULL,NULL,'image/jpeg',163958,'400x383','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(26,6,'400_hit_1.jpg',NULL,NULL,NULL,'image/jpeg',184142,'400x351','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(27,6,'400_video_masher_1.jpg',NULL,NULL,NULL,'image/jpeg',96708,'400x224','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(28,6,'400x138_boomkat.jpg',NULL,NULL,NULL,'image/jpeg',17005,'400x138','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(29,6,'400x163_dash-treasure.jpg',NULL,NULL,NULL,'image/jpeg',31443,'400x163','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(30,6,'400x225_cn_dd-title.jpg',NULL,NULL,NULL,'image/jpeg',31744,'400x225','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(31,6,'400x237_loc_intro.jpg',NULL,NULL,NULL,'image/jpeg',61196,'400x237','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(32,6,'400x258_curveworld_map.jpg',NULL,NULL,NULL,'image/jpeg',30262,'400x258','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(33,6,'400x266_cn_webprem-home.jpg',NULL,NULL,NULL,'image/jpeg',52377,'400x266','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(34,6,'400x268_sportsguy_01.jpg',NULL,NULL,NULL,'image/jpeg',47128,'400x268','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(35,6,'400x271_pbs_dash-song.jpg',NULL,NULL,NULL,'image/jpeg',123458,'400x271','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(36,6,'400x282_cn_site.jpg',NULL,NULL,NULL,'image/jpeg',63149,'400x282','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(37,6,'400x282_cn_site_1.jpg',NULL,NULL,NULL,'image/jpeg',63149,'400x282','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(38,6,'400x294_screeninglobby.jpg',NULL,NULL,NULL,'image/jpeg',163723,'400x294','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(39,6,'400x295_avatar-mall.jpg',NULL,NULL,NULL,'image/jpeg',187130,'400x295','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(40,6,'400x297_ch_tt.jpg',NULL,NULL,NULL,'image/jpeg',62118,'400x297','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(41,6,'400x300_abc-mole.jpg',NULL,NULL,NULL,'image/jpeg',47879,'400x300','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(42,6,'400x300_adultswim-saul.jpg',NULL,NULL,NULL,'image/jpeg',130091,'400x300','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(43,6,'400x300_bpod-scan.jpg',NULL,NULL,NULL,'image/jpeg',30841,'400x300','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(44,6,'400x300_emp_indy.jpg',NULL,NULL,NULL,'image/jpeg',54672,'400x300','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(45,6,'400x300_mtg_kiss108.jpg',NULL,NULL,NULL,'image/jpeg',89271,'400x300','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(46,6,'400x302_cn_pinkdonkey.jpg',NULL,NULL,NULL,'image/jpeg',52225,'400x302','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(47,6,'400x304_tecsmash_video.jpg',NULL,NULL,NULL,'image/jpeg',53147,'400x304','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(48,6,'400x318_sprout.jpg',NULL,NULL,NULL,'image/jpeg',183275,'400x318','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(49,6,'400x320_afta_hp.jpg',NULL,NULL,NULL,'image/jpeg',54604,'400x320','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(50,6,'400x320_ocean_homepage.jpg',NULL,NULL,NULL,'image/jpeg',76195,'400x320','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(51,6,'400x322_luaka.jpg',NULL,NULL,NULL,'image/jpeg',104332,'400x322','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(52,6,'400x324_monarch_home.jpg',NULL,NULL,NULL,'image/jpeg',69121,'400x324','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(53,6,'400x336_crayola-pap_home.jpg',NULL,NULL,NULL,'image/jpeg',59006,'400x336','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(54,6,'400x353_gaa_home.jpg',NULL,NULL,NULL,'image/jpeg',130983,'400x353','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(55,6,'400x353_gaa_home.psd',NULL,NULL,NULL,'image/vnd.adobe.photoshop',555477,'400x353','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(56,6,'400x370_captionsplash_hp.jpg',NULL,NULL,NULL,'image/jpeg',66613,'400x370','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(57,6,'400x428_mashup.jpg',NULL,NULL,NULL,'image/jpeg',56082,'400x428','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(58,6,'400x429_st_hp.jpg',NULL,NULL,NULL,'image/jpeg',123993,'400x429','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(59,6,'400x466_knoll_home.jpg',NULL,NULL,NULL,'image/jpeg',91247,'400x466','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(60,6,'400x466_us_home.jpg',NULL,NULL,NULL,'image/jpeg',117021,'400x466','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(61,6,'400x466_us_home_1.jpg',NULL,NULL,NULL,'image/jpeg',117021,'400x466','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(62,6,'400x467_adultswim-minor.jpg',NULL,NULL,NULL,'image/jpeg',257708,'400x467','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(63,6,'400x468_bn-card-home.jpg',NULL,NULL,NULL,'image/jpeg',242351,'400x468','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(64,6,'400x572_chtimeline_hp.jpg',NULL,NULL,NULL,'image/jpeg',88693,'400x572','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(65,6,'640_adc_1.jpg',NULL,NULL,NULL,'image/jpeg',169827,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(66,6,'640_adc_2.jpg',NULL,NULL,NULL,'image/jpeg',212177,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(67,6,'640_adultswim-saul.jpg',NULL,NULL,NULL,'image/jpeg',238127,'640x1000','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(68,6,'640_adultswim-saul_1.jpg',NULL,NULL,NULL,'image/jpeg',238127,'640x1000','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(69,6,'640_ammi_1.jpg',NULL,NULL,NULL,'image/jpeg',310623,'640x485','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(70,6,'640_ammi_2.jpg',NULL,NULL,NULL,'image/jpeg',193183,'640x657','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(71,6,'640_ammi_3.jpg',NULL,NULL,NULL,'image/jpeg',583274,'640x763','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(72,6,'640_ammi_4.jpg',NULL,NULL,NULL,'image/jpeg',245873,'640x763','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(73,6,'640_boomkat_1.jpg',NULL,NULL,NULL,'image/jpeg',156782,'640x800','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(74,6,'640_boomkat_2.jpg',NULL,NULL,NULL,'image/jpeg',237864,'640x800','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(75,6,'640_boomkat_3.jpg',NULL,NULL,NULL,'image/jpeg',194674,'640x800','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(76,6,'640_boomkat_4.jpg',NULL,NULL,NULL,'image/jpeg',189487,'640x800','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(77,6,'640_minoriteam_1.jpg',NULL,NULL,NULL,'image/jpeg',318954,'640x3000','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(78,6,'640_minoriteam_2.jpg',NULL,NULL,NULL,'image/jpeg',1011814,'640x2100','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(79,6,'640_minoriteam_3.jpg',NULL,NULL,NULL,'image/jpeg',293720,'640x1296','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(80,6,'640_minoriteam_4.jpg',NULL,NULL,NULL,'image/jpeg',295207,'640x1296','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(81,6,'640_minoriteam_5.jpg',NULL,NULL,NULL,'image/jpeg',1121419,'640x1800','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(82,6,'640_minoriteam_6.jpg',NULL,NULL,NULL,'image/jpeg',1011814,'640x2100','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(83,6,'640_minoriteam_7.jpg',NULL,NULL,NULL,'image/jpeg',318954,'640x3000','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(84,6,'640x360_cn_dd-1.jpg',NULL,NULL,NULL,'image/jpeg',59951,'640x360','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(85,6,'640x360_cn_dd-porky.jpg',NULL,NULL,NULL,'image/jpeg',52428,'640x360','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(86,6,'640x360_cn_dd-title.jpg',NULL,NULL,NULL,'image/jpeg',64424,'640x360','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(87,6,'640x413_curveworld_intro.jpg',NULL,NULL,NULL,'image/jpeg',79439,'640x413','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(88,6,'640x413_curveworld_map.jpg',NULL,NULL,NULL,'image/jpeg',85525,'640x413','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(89,6,'640x428_sportsguy_01.jpg',NULL,NULL,NULL,'image/jpeg',88463,'640x428','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(90,6,'640x428_sportsguy_02.jpg',NULL,NULL,NULL,'image/jpeg',125131,'640x428','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(91,6,'640x428_sportsguy_04.jpg',NULL,NULL,NULL,'image/jpeg',150092,'640x428','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(92,6,'640x428_sportsguy_2.jpg',NULL,NULL,NULL,'image/jpeg',88463,'640x428','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(93,6,'640x480_abc-mole-1.jpg',NULL,NULL,NULL,'image/jpeg',88010,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(94,6,'640x480_abc-mole-1_1.jpg',NULL,NULL,NULL,'image/jpeg',88010,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(95,6,'640x480_abc-mole-2.jpg',NULL,NULL,NULL,'image/jpeg',98574,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(96,6,'640x480_abc-mole-2_1.jpg',NULL,NULL,NULL,'image/jpeg',98574,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(97,6,'640x480_abc-mole-2_2.jpg',NULL,NULL,NULL,'image/jpeg',98574,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(98,6,'640x480_abc-mole-3.jpg',NULL,NULL,NULL,'image/jpeg',81528,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(99,6,'640x480_abc-mole-3_1.jpg',NULL,NULL,NULL,'image/jpeg',81528,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(100,6,'640x480_abc-mole-3_2.jpg',NULL,NULL,NULL,'image/jpeg',81528,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(101,6,'640x480_abc-mole-3_3.jpg',NULL,NULL,NULL,'image/jpeg',81528,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(102,6,'640x480_abc-mole-4.jpg',NULL,NULL,NULL,'image/jpeg',89128,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(103,6,'640x480_abc-mole-4_1.jpg',NULL,NULL,NULL,'image/jpeg',89128,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(104,6,'640x480_abc-mole-4_2.jpg',NULL,NULL,NULL,'image/jpeg',89128,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(105,6,'640x480_abc-mole-5.jpg',NULL,NULL,NULL,'image/jpeg',91360,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(106,6,'640x480_abc-mole-5_1.jpg','','','','image/jpeg',91360,'640x480','2011-08-06 14:58:26','2011-08-07 14:04:53'),
	(107,6,'640x480_abc-mole-6.jpg',NULL,NULL,NULL,'image/jpeg',76463,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(108,6,'640x480_abc-mole-6_1.jpg',NULL,NULL,NULL,'image/jpeg',76463,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(109,6,'640x480_abc-mole-7.jpg',NULL,NULL,NULL,'image/jpeg',84167,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(110,6,'640x480_abc-mole-7_1.jpg',NULL,NULL,NULL,'image/jpeg',84167,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(111,6,'640x480_abc-mole-7_2.jpg',NULL,NULL,NULL,'image/jpeg',84167,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(112,6,'640x480_abc-mole-7_3.jpg',NULL,NULL,NULL,'image/jpeg',84167,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:16'),
	(113,6,'640x480_abc-mole-menu.jpg',NULL,NULL,NULL,'image/jpeg',40855,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:17'),
	(114,6,'640x480_abc-mole-menu_1.jpg',NULL,NULL,NULL,'image/jpeg',40855,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:17'),
	(115,6,'640x480_abc-mole-menu_2.jpg',NULL,NULL,NULL,'image/jpeg',40855,'640x480','2011-08-06 14:58:26','2011-08-06 16:38:17'),
	(116,6,'640x495_us_stylebeauty.jpg',NULL,NULL,NULL,'image/jpeg',165335,'640x495','2011-08-06 14:58:26','2011-08-06 16:38:17'),
	(117,6,'640x495_us_stylebeauty_1.jpg',NULL,NULL,NULL,'image/jpeg',165335,'640x495','2011-08-06 14:58:26','2011-08-06 16:38:17'),
	(118,6,'640x512_afta_afta.jpg',NULL,NULL,NULL,'image/jpeg',97855,'640x512','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(119,6,'640x512_afta_calendar.jpg',NULL,NULL,NULL,'image/jpeg',129692,'640x496','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(120,6,'640x512_afta_calendar_1.jpg',NULL,NULL,NULL,'image/jpeg',129692,'640x496','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(121,6,'640x512_afta_hp.jpg',NULL,NULL,NULL,'image/jpeg',111995,'640x512','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(122,6,'640x512_afta_hp_1.jpg',NULL,NULL,NULL,'image/jpeg',111995,'640x512','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(123,6,'640x512_afta_kids.jpg',NULL,NULL,NULL,'image/jpeg',112420,'640x512','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(124,6,'640x512_afta_kids_1.jpg',NULL,NULL,NULL,'image/jpeg',112420,'640x512','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(125,6,'640x512_afta_map.jpg',NULL,NULL,NULL,'image/jpeg',180278,'640x511','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(126,6,'640x538_crayola-pap_avatar.jpg',NULL,NULL,NULL,'image/jpeg',105308,'640x538','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(127,6,'640x538_crayola-pap_home.jpg',NULL,NULL,NULL,'image/jpeg',131113,'640x538','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(128,6,'640x538_crayola-pap_prod.jpg',NULL,NULL,NULL,'image/jpeg',120635,'640x538','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(129,6,'640x538_crayola-pap_profile.jpg',NULL,NULL,NULL,'image/jpeg',119859,'640x538','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(130,6,'640x549_afta_map.jpg',NULL,NULL,NULL,'image/jpeg',100401,'640x549','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(131,6,'640x613_bn-card-newgarden.jpg',NULL,NULL,NULL,'image/jpeg',240327,'640x613','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(132,6,'640x725_bn-card-home.jpg',NULL,NULL,NULL,'image/jpeg',492342,'640x725','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(133,6,'640x745_chtimeline_funk.jpg',NULL,NULL,NULL,'image/jpeg',423243,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(134,6,'640x745_chtimeline_funk_1.jpg',NULL,NULL,NULL,'image/jpeg',423243,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(135,6,'640x745_knoll_home.jpg',NULL,NULL,NULL,'image/jpeg',191708,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(136,6,'640x745_knoll_oj.jpg',NULL,NULL,NULL,'image/jpeg',228151,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(137,6,'640x745_us_home.jpg',NULL,NULL,NULL,'image/jpeg',254110,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(138,6,'640x745_us_home_1.jpg',NULL,NULL,NULL,'image/jpeg',254110,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(139,6,'640x745_us_momsandbabies.jpg',NULL,NULL,NULL,'image/jpeg',243569,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(140,6,'640x745_us_momsandbabies_1.jpg',NULL,NULL,NULL,'image/jpeg',243569,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(141,6,'640x745_us_news.jpg',NULL,NULL,NULL,'image/jpeg',236707,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(142,6,'640x745_us_news_1.jpg',NULL,NULL,NULL,'image/jpeg',236707,'640x745','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(143,6,'640x901_chtimeline_hp.jpg',NULL,NULL,NULL,'image/jpeg',544245,'640x901','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(144,6,'640x961_knoll_intra.jpg',NULL,NULL,NULL,'image/jpeg',290241,'640x961','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(145,6,'640x961_knoll_intra_1.jpg',NULL,NULL,NULL,'image/jpeg',290241,'640x961','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(146,6,'logo_90x90_cartoonnetwork.jpg',NULL,NULL,NULL,'image/jpeg',3050,'90x90','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(147,6,'nikebodemiller_1.jpg',NULL,NULL,NULL,'image/jpeg',47407,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(148,6,'nikeshoes_2.jpg',NULL,NULL,NULL,'image/jpeg',35767,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(149,6,'screen-shot-2011-04-05-at-2-44-10-pm.png',NULL,NULL,NULL,'image/png',442683,'1001x845','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(150,6,'screen-shot-2011-04-05-at-2-44-10-pm_1.png',NULL,NULL,NULL,'image/png',442683,'1001x845','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(151,6,'screen-shot-2011-04-05-at-9-46-13-pm.png',NULL,NULL,NULL,'image/png',427742,'999x777','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(152,6,'screen-shot-2011-04-05-at-9-47-18-pm.png',NULL,NULL,NULL,'image/png',386395,'991x778','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(153,6,'screen-shot-2011-04-06-at-11-58-01-am.png',NULL,NULL,NULL,'image/png',558798,'1442x1050','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(154,6,'screen-shot-2011-04-06-at-11-58-01-am_1.png',NULL,NULL,NULL,'image/png',558798,'1442x1050','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(155,6,'screen-shot-2011-04-06-at-11-58-42-am.png',NULL,NULL,NULL,'image/png',356029,'1048x855','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(156,6,'screen-shot-2011-04-06-at-11-59-49-am.png',NULL,NULL,NULL,'image/png',565793,'1010x858','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(157,6,'screen-shot-2011-04-07-at-1-09-31-pm.png',NULL,NULL,NULL,'image/png',736042,'1066x914','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(158,6,'screen-shot-2011-04-07-at-1-17-35-pm.png',NULL,NULL,NULL,'image/png',1897607,'1449x893','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(159,6,'screen-shot-2011-04-07-at-1-24-52-pm.png',NULL,NULL,NULL,'image/png',1086094,'1410x738','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(160,6,'screen-shot-2011-04-07-at-2-00-13-pm.png',NULL,NULL,NULL,'image/png',495585,'1154x952','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(161,6,'screen-shot-2011-04-07-at-2-00-13-pm_1.png',NULL,NULL,NULL,'image/png',495585,'1154x952','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(162,6,'screen-shot-2011-05-18-at-4-56-18-pm.png',NULL,NULL,NULL,'image/png',1024158,'1440x900','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(163,6,'screen-shot-2011-05-18-at-4-58-14-pm.png','','','','image/png',419742,'634x614','2011-08-06 14:58:27','2011-08-06 22:07:44'),
	(164,6,'screen-shot-2011-05-18-at-5-01-08-pm.png',NULL,NULL,NULL,'image/png',416246,'633x492','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(165,6,'screen-shot-2011-05-19-at-6-56-27-am.png',NULL,NULL,NULL,'image/png',363686,'622x480','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(166,6,'thumb_abcnewscalculator.jpg',NULL,NULL,NULL,'image/jpeg',50028,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(167,6,'thumb_aerojimmy.jpg',NULL,NULL,NULL,'image/jpeg',50452,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(168,6,'thumb_afta_allianceforthearts.jpg',NULL,NULL,NULL,'image/jpeg',45868,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(169,6,'thumb_amc.jpg',NULL,NULL,NULL,'image/jpeg',50952,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(170,6,'thumb_amnhkiosk_1.jpg',NULL,NULL,NULL,'image/jpeg',40070,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(171,6,'thumb_avatarmall.jpg',NULL,NULL,NULL,'image/jpeg',53480,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(172,6,'thumb_comedycentral.jpg','','','','image/jpeg',60691,'298x130','2011-08-06 14:58:27','2011-08-06 22:07:44'),
	(173,6,'thumb_cranium.jpg',NULL,NULL,NULL,'image/jpeg',48813,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(174,6,'thumb_crankyankers.jpg',NULL,NULL,NULL,'image/jpeg',42946,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(175,6,'thumb_fotjamz.jpg',NULL,NULL,NULL,'image/jpeg',56539,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(176,6,'thumb_fridayafternext.jpg',NULL,NULL,NULL,'image/jpeg',44774,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(177,6,'thumb_ifc.jpg',NULL,NULL,NULL,'image/jpeg',44428,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(178,6,'thumb_jbvo.jpg',NULL,NULL,NULL,'image/jpeg',32685,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(179,6,'thumb_kidsbop.jpg',NULL,NULL,NULL,'image/jpeg',59414,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(180,6,'thumb_kitkat.jpg',NULL,NULL,NULL,'image/jpeg',52122,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(181,6,'thumb_luakabob.jpg',NULL,NULL,NULL,'image/jpeg',46101,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(182,6,'thumb_sportsguy.jpg',NULL,NULL,NULL,'image/jpeg',60733,'298x130','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(183,6,'tn_298x131_abc-mole.jpg',NULL,NULL,NULL,'image/jpeg',19224,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(184,6,'tn_298x131_adultswim-minor.jpg',NULL,NULL,NULL,'image/jpeg',29163,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(185,6,'tn_298x131_adultswim-saul.jpg',NULL,NULL,NULL,'image/jpeg',14720,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(186,6,'tn_298x131_bn-cards.jpg',NULL,NULL,NULL,'image/jpeg',17724,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(187,6,'tn_298x131_boomkat.jpg',NULL,NULL,NULL,'image/jpeg',16131,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(188,6,'tn_298x131_bpod.jpg',NULL,NULL,NULL,'image/jpeg',16262,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(189,6,'tn_298x131_captionsplash.jpg',NULL,NULL,NULL,'image/jpeg',34371,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(190,6,'tn_298x131_chtimeline.jpg',NULL,NULL,NULL,'image/jpeg',25450,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(191,6,'tn_298x131_cn_wpt.jpg',NULL,NULL,NULL,'image/jpeg',23969,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(192,6,'tn_298x131_crayola-pap.jpg',NULL,NULL,NULL,'image/jpeg',21366,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(193,6,'tn_298x131_knoll.jpg',NULL,NULL,NULL,'image/jpeg',26792,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(194,6,'tn_298x131_learning_curve.jpg',NULL,NULL,NULL,'image/jpeg',17661,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(195,6,'tn_298x131_loc.jpg',NULL,NULL,NULL,'image/jpeg',32899,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(196,6,'tn_298x131_monarch.jpg',NULL,NULL,NULL,'image/jpeg',25609,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(197,6,'tn_298x131_mtg.jpg',NULL,NULL,NULL,'image/jpeg',25733,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(198,6,'tn_298x131_ocean.jpg',NULL,NULL,NULL,'image/jpeg',43105,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(199,6,'tn_298x131_ocean_1.jpg',NULL,NULL,NULL,'image/jpeg',43105,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(200,6,'tn_298x131_pbs-dash-treas.jpg',NULL,NULL,NULL,'image/jpeg',21030,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(201,6,'tn_298x131_pbs-dash.jpg',NULL,NULL,NULL,'image/jpeg',17254,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(202,6,'tn_298x131_pbs-sprout.jpg',NULL,NULL,NULL,'image/jpeg',17211,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(203,6,'tn_298x131_sp.jpg',NULL,NULL,NULL,'image/jpeg',16736,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(204,6,'tn_298x131_startrek.jpg',NULL,NULL,NULL,'image/jpeg',34748,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(205,6,'tn_298x131_tec-smash.jpg',NULL,NULL,NULL,'image/jpeg',24691,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(206,6,'tn_298x131_us.jpg',NULL,NULL,NULL,'image/jpeg',43948,'298x131','2011-08-06 14:58:27','2011-08-06 16:38:17'),
	(207,7,'sesame-street-large.png',NULL,NULL,NULL,'image/png',6219,NULL,'2011-08-06 14:58:27','2011-08-06 14:58:27'),
	(208,8,'img140x190leader.jpg',NULL,NULL,NULL,'image/jpeg',37485,NULL,'2011-08-06 14:58:27','2011-08-06 14:58:27'),
	(209,8,'img140x190leader_1.jpg',NULL,NULL,NULL,'image/jpeg',37485,NULL,'2011-08-06 14:58:27','2011-08-06 14:58:27'),
	(210,8,'screen-shot-2011-05-24-at-2-58-15-pm.png',NULL,NULL,NULL,'image/png',113685,'223x368','2011-08-06 14:58:27','2011-08-07 11:42:19'),
	(211,8,'screen-shot-2011-05-24-at-3-00-27-pm.png',NULL,NULL,NULL,'image/png',65091,NULL,'2011-08-06 14:58:27','2011-08-06 14:58:27'),
	(212,8,'screen-shot-2011-05-24-at-3-00-27-pm_1.png','John Carlin','Funny Garbage','','image/png',65091,'265x267','2011-08-06 16:02:18','2011-08-06 16:02:18'),
	(213,8,'screen-shot-2011-05-24-at-2-58-15-pm_1.png','','','','image/png',113685,'223x368','2011-08-06 16:03:54','2011-08-06 16:03:54'),
	(218,6,'avatarEmpty.png','','','','image/png',1481,'85x85','2011-08-06 19:44:08','2011-08-06 19:44:08'),
	(269,11,'logo_90x90_sesame.jpg','Sesame Workshop','Sesame Workshop','','image/jpeg',3724,'90x90','2011-08-07 09:39:51','2011-08-07 09:39:51'),
	(282,9,'logo_90x90_crayola.jpg','','','','image/jpeg',3957,'90x90','2011-08-07 09:45:25','2011-08-07 09:45:27'),
	(293,9,'logo_90x90_sesame.jpg','','','','image/jpeg',3724,'90x90','2011-08-07 09:45:26','2011-08-07 09:45:27'),
	(300,9,'logo_90x90_sesame_1.jpg','','','','image/jpeg',3724,'90x90','2011-08-07 10:06:05','2011-08-07 10:06:05'),
	(302,9,'logo_90x90_crayola_1.jpg','','','','image/jpeg',3957,'90x90','2011-08-07 10:07:00','2011-08-07 10:07:00'),
	(303,6,'400x336_crayola-pap_home_1.jpg','','','','image/jpeg',59006,'400x336','2011-08-07 10:11:34','2011-08-07 10:11:34'),
	(304,6,'tn_298x131_crayola-pap_1.jpg','','','','image/jpeg',21366,'298x131','2011-08-07 10:11:34','2011-08-07 10:11:34'),
	(305,9,'.DS_Store',NULL,NULL,NULL,'application/force-download',6148,NULL,'2011-08-07 11:05:00','2011-08-07 11:05:00'),
	(306,6,'400x466_us_home_2.jpg','','','','image/jpeg',117021,'400x466','2011-08-07 14:21:12','2011-08-07 14:21:13'),
	(307,6,'tn_298x131_us_1.jpg','','','','image/jpeg',43948,'298x131','2011-08-07 14:21:12','2011-08-07 14:21:13'),
	(308,9,'logo_90x90_wenner.jpg','','','','image/jpeg',4750,'90x90','2011-08-07 14:22:01','2011-08-07 14:22:01');

/*!40000 ALTER TABLE `dm_media` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_media_folder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_media_folder`;

CREATE TABLE `dm_media_folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rel_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rel_path` (`rel_path`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_media_folder` WRITE;
/*!40000 ALTER TABLE `dm_media_folder` DISABLE KEYS */;

INSERT INTO `dm_media_folder` (`id`, `rel_path`, `lft`, `rgt`, `level`)
VALUES
	(1,'',1,20,0),
	(3,'dm_user',12,13,1),
	(4,'job_application',10,11,1),
	(5,'page',8,9,1),
	(6,'project',6,7,1),
	(7,'project_client',4,5,1),
	(8,'staff_member',2,3,1),
	(9,'client',14,15,1),
	(11,'logos',18,19,1);

/*!40000 ALTER TABLE `dm_media_folder` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_page`;

CREATE TABLE `dm_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordModuleAction_idx` (`module`,`action`,`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_page` WRITE;
/*!40000 ALTER TABLE `dm_page` DISABLE KEYS */;

INSERT INTO `dm_page` (`id`, `module`, `action`, `record_id`, `credentials`, `lft`, `rgt`, `level`)
VALUES
	(1,'main','root',0,'',1,98,0),
	(2,'main','error404',0,NULL,4,5,1),
	(3,'main','signin',0,NULL,2,3,1),
	(4,'jobPosition','list',0,'',6,21,1),
	(5,'dmTag','list',0,NULL,22,31,1),
	(6,'category','list',0,NULL,32,59,1),
	(7,'client','list',0,NULL,60,67,1),
	(8,'staffMember','list',0,NULL,68,73,1),
	(9,'serviceCategory','list',0,NULL,74,85,1),
	(10,'category','show',1,'',33,34,2),
	(11,'category','show',2,NULL,35,36,2),
	(12,'category','show',3,NULL,37,38,2),
	(13,'category','show',4,NULL,39,40,2),
	(14,'category','show',5,'',41,46,2),
	(15,'category','show',6,NULL,47,48,2),
	(16,'category','show',7,NULL,49,50,2),
	(17,'category','show',8,NULL,51,52,2),
	(18,'category','show',9,NULL,53,54,2),
	(19,'category','show',10,NULL,55,56,2),
	(20,'category','show',11,NULL,57,58,2),
	(22,'staffMember','show',1,NULL,69,70,2),
	(23,'staffMember','show',2,NULL,71,72,2),
	(24,'main','about',0,'',86,87,1),
	(25,'main','contact',0,'',88,89,1),
	(26,'main','portfolio',0,'',90,93,1),
	(27,'serviceCategory','show',1,NULL,75,76,2),
	(28,'serviceCategory','show',2,NULL,77,78,2),
	(29,'serviceCategory','show',3,NULL,79,80,2),
	(30,'serviceCategory','show',4,NULL,81,82,2),
	(31,'serviceCategory','show',5,NULL,83,84,2),
	(32,'jobPosition','show',1,'',7,8,2),
	(33,'jobPosition','show',2,NULL,9,10,2),
	(34,'jobPosition','show',3,NULL,11,12,2),
	(35,'jobPosition','show',4,NULL,13,14,2),
	(36,'jobPosition','show',5,NULL,15,16,2),
	(37,'jobPosition','show',6,NULL,17,18,2),
	(38,'jobPosition','show',7,NULL,19,20,2),
	(39,'main','searchResults',0,NULL,94,95,1),
	(40,'main','search',0,NULL,96,97,1),
	(46,'main','clients',0,'',91,92,2),
	(70,'client','show',9,NULL,61,62,2),
	(71,'client','show',10,NULL,63,64,2),
	(72,'project','show',1,NULL,42,43,3),
	(92,'dmTag','show',1,NULL,23,24,2),
	(93,'dmTag','show',2,NULL,25,26,2),
	(94,'dmTag','show',4,NULL,27,28,2),
	(95,'dmTag','show',3,NULL,29,30,2),
	(96,'project','show',21,NULL,44,45,3),
	(97,'client','show',11,NULL,65,66,2);

/*!40000 ALTER TABLE `dm_page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_page_translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_page_translation`;

CREATE TABLE `dm_page_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_mod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'snthdk',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_secure` tinyint(1) NOT NULL DEFAULT '0',
  `is_indexable` tinyint(1) NOT NULL DEFAULT '1',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_page_translation_id_dm_page_id` FOREIGN KEY (`id`) REFERENCES `dm_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_page_translation` WRITE;
/*!40000 ALTER TABLE `dm_page_translation` DISABLE KEYS */;

INSERT INTO `dm_page_translation` (`id`, `slug`, `name`, `title`, `h1`, `description`, `keywords`, `auto_mod`, `is_active`, `is_secure`, `is_indexable`, `lang`)
VALUES
	(1,'','Home','Home','','','','snthdk',1,0,1,'en'),
	(2,'error404','Page not found','Page not found',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(3,'security/signin','Signin','Signin',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(4,'jobs','Jobs','Jobs','','Jobs','','snthdk',1,0,1,'en'),
	(5,'tags','Tags','Tags',NULL,'Tags',NULL,'snthdk',1,0,1,'en'),
	(6,'categories','Categories','Categories',NULL,'Categories',NULL,'snthdk',1,0,1,'en'),
	(7,'client','Client','Client',NULL,'Client',NULL,'snthdk',1,0,1,'en'),
	(8,'staff','Staff','Staff',NULL,'Staff',NULL,'snthdk',1,0,1,'en'),
	(9,'service-categories','Service Categories','Service Categories',NULL,'Service Categories',NULL,'snthdk',1,0,1,'en'),
	(10,'categories/animation-motion-graphics','Animation & Motion Graphics','Animation & Motion Graphics','','','','snthdk',1,0,1,'en'),
	(11,'categories/application','Application','Application',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(12,'categories/mobile-tablet','Mobile & Tablet','Mobile & Tablet',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(13,'categories/content-development','Content Development','Content Development',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(14,'categories/website','Website','Website','','','','snthdk',1,0,1,'en'),
	(15,'categories/game','Game','Game',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(16,'categories/kiosk','Kiosk','Kiosk',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(17,'categories/print','Print','Print',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(18,'categories/brand-identity','Brand Identity','Brand Identity',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(19,'categories/tv','TV','TV',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(20,'categories/original-property','Original Property','Original Property',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(22,'staff/john-carlin','John Carlin','John Carlin',NULL,'John Carlin',NULL,'snthdk',1,0,1,'en'),
	(23,'staff/kristin-ellington','Kristin Ellington','Kristin Ellington',NULL,'Kristin Ellington',NULL,'snthdk',1,0,1,'en'),
	(24,'about','About','About','','About Funny Garbage','about, philosophy','snthdk',1,0,1,'en'),
	(25,'contact','Contact','Contact','','','','snthdk',1,0,1,'en'),
	(26,'portfolio','Portfolio','Portfolio','','','','snthdk',1,0,1,'en'),
	(27,'service-categories/creative','Creative','Creative',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(28,'service-categories/product-planning','Product Planning','Product Planning',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(29,'service-categories/project-management','Project Management','Project Management',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(30,'service-categories/technology','Technology','Technology',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(31,'service-categories/user-experience','User Experience','User Experience',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(32,'jobs/interaction-design-intern','Interaction Design Intern','Interaction Design Intern','','An interaction design internship involves working with the Interaction Designers at Funny Garbage to execute upon established functionality, navigation and inte','','snthdk',1,0,1,'en'),
	(33,'jobs/design-internship','Design Internship','Design Internship',NULL,'A design internship at Funny Garbage involves working with Junior and Senior Designers to build out designs as established through their design directions. The ',NULL,'snthdk',1,0,1,'en'),
	(34,'jobs/interactive-producer','Interactive Producer','Interactive Producer',NULL,'Producers develop and manage medium to largescale projects for corporate and creative clients. Projects range from web sites to interactive games, web animation',NULL,'snthdk',1,0,1,'en'),
	(35,'jobs/project-management-intern','Project Management Intern','Project Management Intern',NULL,'A project management internship focuses on learning what\'s involved in developing and managing projects from the business development stage to the project stage',NULL,'snthdk',1,0,1,'en'),
	(36,'jobs/lead-developer','Lead Developer','Lead Developer',NULL,'Award winning design and production firm seeks a technical lead/software developer for client projects and operations management. Applicants should be technical',NULL,'snthdk',1,0,1,'en'),
	(37,'jobs/drupal-developer','Drupal Developer','Drupal Developer',NULL,'Award winning design and production firm seeks an experienced Drupal developer for high profile client projects and operations management. Applicants should be ',NULL,'snthdk',1,0,1,'en'),
	(38,'jobs/technology-project-manager','Technology Project Manager','Technology Project Manager',NULL,'Award winning design and product firm seeks a technical project manager who can help assure the ontime, onbudget delivery of multiple, simultaneous client proje',NULL,'snthdk',1,0,1,'en'),
	(39,'search-results','Search Results','Search Results',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(40,'search','Search','Search',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(46,'portfolio/clients','clients','clients','','','','snthdk',1,0,1,'en'),
	(70,'client/sesame-workshop','Sesame Workshop','Sesame Workshop',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(71,'client/crayola','Crayola','Crayola',NULL,NULL,NULL,'snthdk',1,0,1,'en'),
	(72,'categories/website/pop-art-pixies','Pop Art Pixies','Pop Art Pixies',NULL,'Pop Art Pixies',NULL,'snthdk',1,0,1,'en'),
	(92,'tags/cold-fusion','Cold Fusion','Cold Fusion',NULL,'Cold Fusion',NULL,'snthdk',1,0,1,'en'),
	(93,'tags/pluck','Pluck','Pluck',NULL,'Pluck',NULL,'snthdk',1,0,1,'en'),
	(94,'tags/content-management-systems','Content Management Systems','Content Management Systems',NULL,'Content Management Systems',NULL,'snthdk',1,0,1,'en'),
	(95,'tags/symfony','Symfony','Symfony',NULL,'Symfony',NULL,'snthdk',1,0,1,'en'),
	(96,'categories/website/us-magazine','US Magazine','US Magazine',NULL,'US Magazine',NULL,'snthdk',1,0,1,'en'),
	(97,'client/wenner-publishing','WENNER PUBLISHING','WENNER PUBLISHING',NULL,NULL,NULL,'snthdk',1,0,1,'en');

/*!40000 ALTER TABLE `dm_page_translation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_page_view
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_page_view`;

CREATE TABLE `dm_page_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmPageViewModuleAction_idx` (`module`,`action`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  CONSTRAINT `dm_page_view_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_page_view` WRITE;
/*!40000 ALTER TABLE `dm_page_view` DISABLE KEYS */;

INSERT INTO `dm_page_view` (`id`, `module`, `action`, `dm_layout_id`)
VALUES
	(1,'main','root',10),
	(2,'main','error404',1),
	(3,'main','signin',1),
	(4,'jobPosition','list',8),
	(5,'dmTag','list',1),
	(6,'category','list',1),
	(7,'client','list',1),
	(8,'staffMember','list',1),
	(9,'serviceCategory','list',1),
	(10,'category','show',6),
	(11,'main','about',12),
	(12,'staffMember','show',1),
	(13,'main','contact',11),
	(14,'main','portfolio',4),
	(15,'serviceCategory','show',1),
	(16,'jobPosition','show',9),
	(17,'main','searchResults',1),
	(18,'main','search',13),
	(19,'client','show',1),
	(20,'project','show',3),
	(21,'main','clients',14),
	(22,'dmTag','show',1);

/*!40000 ALTER TABLE `dm_page_view` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_permission`;

CREATE TABLE `dm_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_permission` WRITE;
/*!40000 ALTER TABLE `dm_permission` DISABLE KEYS */;

INSERT INTO `dm_permission` (`id`, `name`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'system','System administrator','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(2,'admin','Log into administration','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(3,'clear_cache','Clear the cache','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(4,'log','Manage logs','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(5,'code_editor','Use admin and front code editors','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(6,'security_user','Manage security users','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(7,'security_permission','Manage security permissions','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(8,'security_group','Manage security groups','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(9,'content','CRUD dynamic content in admin','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(10,'zone_add','Add zones','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(11,'zone_edit','Edit zones','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(12,'zone_delete','Delete zones','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(13,'widget_add','Add widgets','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(14,'widget_edit','Edit widgets','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(15,'widget_delete','Delete widgets','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(16,'widget_edit_fast','Can fast edit widgets','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(17,'widget_edit_fast_record','Fast edit widget record','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(18,'widget_edit_fast_content_title','Fast edit widget content title','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(19,'widget_edit_fast_content_link','Fast edit widget content link','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(20,'widget_edit_fast_content_image','Fast edit widget content image','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(21,'widget_edit_fast_content_text','Fast edit widget content text','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(22,'widget_edit_fast_navigation_menu','Fast edit widget navigation menu','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(23,'page_add','Add pages','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(24,'page_edit','Edit pages','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(25,'page_delete','Delete pages','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(26,'page_bar_admin','See page bar in admin','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(27,'media_bar_admin','See media bar in admin','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(28,'media_library','Use media library in admin','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(29,'tool_bar_admin','See toolbar in admin','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(30,'page_bar_front','See page bar in front','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(31,'media_bar_front','See media bar in front','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(32,'tool_bar_front','See toolbar in front','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(33,'site_view','See non-public website and inactive pages','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(34,'loremize','Create automatic random content','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(35,'export_table','Export table contents','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(36,'sitemap','Regenerate sitemap','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(37,'automatic_metas','Configure automatic pages metas','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(38,'manual_metas','Configure manually pages metas','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(39,'manage_pages','Move and sort pages','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(40,'url_redirection','Configure url redirections','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(41,'use_google_analytics','Use google analytics','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(42,'google_analytics','Configure google analytics','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(43,'use_google_webmaster_tools','Use google webmaster tools','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(44,'google_webmaster_tools','Configure google webmaster tools','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(45,'xiti','Configure Xiti','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(46,'search_engine','Manage internal search engine','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(47,'see_log','See the logs','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(48,'see_chart','See the charts','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(49,'see_diagrams','See the developer diagrams','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(50,'see_server','See the server infos','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(51,'config_panel','Use the configuration panel','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(52,'translation','Use the translation interface','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(53,'layout','Use the layout interface','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(54,'sent_mail','See mails sent by server','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(55,'mail_template','Configure mail templates','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(56,'error_log','See error log','2011-08-06 14:52:03','2011-08-06 14:52:03'),
	(57,'interface_settings','Manage interface settings like default image resize method','2011-08-06 14:52:03','2011-08-06 14:52:03');

/*!40000 ALTER TABLE `dm_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_redirect
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_redirect`;

CREATE TABLE `dm_redirect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dest` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dm_remember_key
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_remember_key`;

CREATE TABLE `dm_remember_key` (
  `dm_user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`ip_address`),
  KEY `dm_user_id_idx` (`dm_user_id`),
  CONSTRAINT `dm_remember_key_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_remember_key` WRITE;
/*!40000 ALTER TABLE `dm_remember_key` DISABLE KEYS */;

INSERT INTO `dm_remember_key` (`dm_user_id`, `remember_key`, `ip_address`, `created_at`)
VALUES
	(1,'ef348d4aa970aeb717fe94a93c50f037','127.0.0.1','2011-08-07 21:17:12');

/*!40000 ALTER TABLE `dm_remember_key` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_sent_mail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_sent_mail`;

CREATE TABLE `dm_sent_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_mail_template_id` bigint(20) DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `from_email` text COLLATE utf8_unicode_ci NOT NULL,
  `to_email` text COLLATE utf8_unicode_ci,
  `cc_email` text COLLATE utf8_unicode_ci,
  `bcc_email` text COLLATE utf8_unicode_ci,
  `reply_to_email` text COLLATE utf8_unicode_ci,
  `sender_email` text COLLATE utf8_unicode_ci,
  `strategy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `culture` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debug_string` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_mail_template_id_idx` (`dm_mail_template_id`),
  CONSTRAINT `dm_sent_mail_dm_mail_template_id_dm_mail_template_id` FOREIGN KEY (`dm_mail_template_id`) REFERENCES `dm_mail_template` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dm_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_setting`;

CREATE TABLE `dm_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `params` text COLLATE utf8_unicode_ci,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_setting` WRITE;
/*!40000 ALTER TABLE `dm_setting` DISABLE KEYS */;

INSERT INTO `dm_setting` (`id`, `name`, `type`, `params`, `group_name`, `credentials`)
VALUES
	(1,'site_name','text',NULL,'site',NULL),
	(2,'site_active','boolean',NULL,'site',NULL),
	(3,'site_indexable','boolean',NULL,'site',NULL),
	(4,'site_working_copy','boolean',NULL,'site',NULL),
	(5,'ga_key','text',NULL,'tracking','google_analytics'),
	(6,'ga_token','text',NULL,'internal','google_analytics'),
	(7,'gwt_key','text',NULL,'tracking','google_webmaster_tools'),
	(8,'xiti_code','textarea',NULL,'tracking','xiti'),
	(9,'search_stop_words','textarea',NULL,'search engine','search_engine'),
	(10,'base_urls','textarea',NULL,'internal','system'),
	(11,'image_resize_method','select','fit=Fit scale=Scale inflate=Inflate top=Top right=Right left=Left bottom=Bottom center=Center','interface','interface_settings'),
	(12,'image_resize_quality','number',NULL,'interface','interface_settings'),
	(13,'link_external_blank','boolean',NULL,'interface','interface_settings'),
	(14,'link_current_span','boolean',NULL,'interface','interface_settings'),
	(15,'link_use_page_title','boolean',NULL,'interface','interface_settings'),
	(16,'title_prefix','text',NULL,'seo','manual_metas'),
	(17,'title_suffix','text',NULL,'seo','manual_metas'),
	(18,'smart_404','boolean',NULL,'seo','url_redirection');

/*!40000 ALTER TABLE `dm_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_setting_translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_setting_translation`;

CREATE TABLE `dm_setting_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `default_value` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_setting_translation_id_dm_setting_id` FOREIGN KEY (`id`) REFERENCES `dm_setting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_setting_translation` WRITE;
/*!40000 ALTER TABLE `dm_setting_translation` DISABLE KEYS */;

INSERT INTO `dm_setting_translation` (`id`, `description`, `value`, `default_value`, `lang`)
VALUES
	(1,'The site name','FUNNY GARBAGE','Www','en'),
	(2,'Is the site ready for visitors ?','1','1','en'),
	(3,'Is the site ready for search engine crawlers ?','1','1','en'),
	(4,'Is this site the current working copy ?','1','1','en'),
	(5,'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )',NULL,'','en'),
	(6,'Auth token gor Google Analytics, computed from password',NULL,'','en'),
	(7,'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )',NULL,'','en'),
	(8,'The xiti html code',NULL,'','en'),
	(9,'Words to exclude from searches (e.g. the, a, to )',NULL,'','en'),
	(10,'Diem base urls for different applications/environments/cultures','{\"admin-prod\":\"http:\\/\\/dev.funnygarbage.com\\/admin.php\",\"front-prod\":\"http:\\/\\/dev.funnygarbage.com\\/index.php\",\"front-dev\":\"http:\\/\\/dev.funnygarbage.com\\/dev.php\",\"admin-dev\":\"http:\\/\\/dev.funnygarbage.com\\/admin_dev.php\"}','','en'),
	(11,'Default method when an image needs to be resized','center','center','en'),
	(12,'Jpeg default quality when generating thumbnails','95','95','en'),
	(13,'Links to other domain get automatically a _blank target',NULL,'0','en'),
	(14,'Links to current page are changed from <a> to <span>','1','1','en'),
	(15,'Add an automatic title on link based on the target page title','1','1','en'),
	(16,'Append something at the beginning of all pages title',NULL,'','en'),
	(17,'Append something at the end of all pages title',' | FUNNY GARBAGE',' | Www','en'),
	(18,'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.','1','1','en');

/*!40000 ALTER TABLE `dm_setting_translation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_tag`;

CREATE TABLE `dm_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_tag` WRITE;
/*!40000 ALTER TABLE `dm_tag` DISABLE KEYS */;

INSERT INTO `dm_tag` (`id`, `name`)
VALUES
	(1,'Cold Fusion'),
	(4,'Content Management Systems'),
	(2,'Pluck'),
	(3,'Symfony');

/*!40000 ALTER TABLE `dm_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_trans_unit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_trans_unit`;

CREATE TABLE `dm_trans_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_catalogue_id` bigint(20) NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `target` text COLLATE utf8_unicode_ci NOT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_catalogue_id_idx` (`dm_catalogue_id`),
  CONSTRAINT `dm_trans_unit_dm_catalogue_id_dm_catalogue_id` FOREIGN KEY (`dm_catalogue_id`) REFERENCES `dm_catalogue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dm_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_user`;

CREATE TABLE `dm_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `algorithm` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `forgot_password_code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `photo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `forgot_password_code` (`forgot_password_code`),
  KEY `is_active_idx_idx` (`is_active`),
  KEY `dm_user_photo_idx` (`photo`),
  CONSTRAINT `dm_user_photo_dm_media_id` FOREIGN KEY (`photo`) REFERENCES `dm_media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_user` WRITE;
/*!40000 ALTER TABLE `dm_user` DISABLE KEYS */;

INSERT INTO `dm_user` (`id`, `username`, `email`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `forgot_password_code`, `created_at`, `updated_at`, `description`, `photo`)
VALUES
	(1,'admin','admin@www.com','sha1','4c10ceb29460022d66b6f1cd6df82d57','4e8aa5e81cc371b3f9a37a71efe6b771e1c6e7b9',1,1,'2011-08-07 23:09:45',NULL,'2011-08-06 14:52:03','2011-08-06 14:52:03',NULL,NULL);

/*!40000 ALTER TABLE `dm_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_user_group`;

CREATE TABLE `dm_user_group` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_group_id`),
  KEY `dm_user_group_dm_group_id_dm_group_id` (`dm_group_id`),
  CONSTRAINT `dm_user_group_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_user_group_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dm_user_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_user_permission`;

CREATE TABLE `dm_user_permission` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_permission_id`),
  KEY `dm_user_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`),
  CONSTRAINT `dm_user_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_user_permission_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dm_widget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_widget`;

CREATE TABLE `dm_widget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_zone_id` bigint(20) NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_zone_id_idx` (`dm_zone_id`),
  CONSTRAINT `dm_widget_dm_zone_id_dm_zone_id` FOREIGN KEY (`dm_zone_id`) REFERENCES `dm_zone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_widget` WRITE;
/*!40000 ALTER TABLE `dm_widget` DISABLE KEYS */;

INSERT INTO `dm_widget` (`id`, `dm_zone_id`, `module`, `action`, `css_class`, `position`, `updated_at`)
VALUES
	(1,1,'dmWidgetContent','title',NULL,-1,'2011-08-06 14:52:03'),
	(2,2,'dmUser','signin',NULL,-2,'2011-08-06 14:52:03'),
	(3,3,'main','header',NULL,1,'2011-08-06 15:23:42'),
	(4,7,'main','footer','',1,'2011-08-06 15:24:07'),
	(7,21,'main','header',NULL,-5,'2011-08-06 15:26:24'),
	(8,24,'main','footer','',-6,'2011-08-06 15:26:24'),
	(9,29,'main','header',NULL,-7,'2011-08-06 15:26:39'),
	(10,32,'main','footer','',1,'2011-08-07 10:45:40'),
	(11,37,'main','header',NULL,-9,'2011-08-06 15:27:24'),
	(12,40,'main','footer','',-10,'2011-08-06 15:27:24'),
	(13,45,'main','header',NULL,-11,'2011-08-06 15:28:22'),
	(14,48,'main','footer','',-12,'2011-08-06 15:28:22'),
	(15,53,'main','header',NULL,-13,'2011-08-06 15:28:51'),
	(16,56,'main','footer','',-14,'2011-08-06 15:28:51'),
	(17,61,'main','header',NULL,-15,'2011-08-06 15:29:42'),
	(18,64,'main','footer','',-16,'2011-08-06 15:29:42'),
	(19,69,'main','header',NULL,-17,'2011-08-06 15:30:19'),
	(20,72,'main','footer','',-18,'2011-08-06 15:30:19'),
	(31,70,'dmContact','form','',1,'2011-08-06 16:27:18'),
	(32,73,'dmWidgetContent','title','shdr',1,'2011-08-06 16:27:34'),
	(35,81,'main','header',NULL,-19,'2011-08-06 16:34:55'),
	(36,84,'main','footer','',2,'2011-08-06 17:01:49'),
	(37,49,'dmWidgetContent','title','',1,'2011-08-06 16:36:33'),
	(38,33,'dmWidgetContent','title','',1,'2011-08-06 16:37:27'),
	(40,85,'dmWidgetContent','title','',1,'2011-08-06 16:50:00'),
	(41,85,'aboutSlideshow','list','',2,'2011-08-06 16:50:00'),
	(42,82,'main','aboutSidebar','inner-sidebar',1,'2011-08-06 16:50:31'),
	(43,82,'dmWidgetTwitter','timeline','recent_tweets',2,'2011-08-06 16:51:22'),
	(44,112,'main','aboutOverview','overview_content',1,'2011-08-07 14:43:52'),
	(45,86,'dmWidgetContent','title','shdr',2,'2011-08-07 14:46:59'),
	(46,86,'staffMember','list','',3,'2011-08-07 14:46:59'),
	(58,46,'jobPosition','list','',1,'2011-08-06 17:18:15'),
	(59,88,'main','aboutHistory','',1,'2011-08-06 17:29:44'),
	(60,88,'main','aboutAwards','',2,'2011-08-06 17:29:55'),
	(61,87,'service','listByServiceCategory','',2,'2011-08-06 17:35:47'),
	(62,87,'service','listByServiceCategory','technology_services',3,'2011-08-06 17:35:43'),
	(63,87,'service','listByServiceCategory','',4,'2011-08-06 17:34:51'),
	(64,87,'service','listByServiceCategory','',6,'2011-08-06 17:35:51'),
	(65,87,'service','listByServiceCategory','',5,'2011-08-06 17:35:51'),
	(66,87,'dmWidgetContent','title','shdr',1,'2011-08-06 17:35:47'),
	(67,33,'project','listFeatured','',2,'2011-08-07 10:45:19'),
	(68,30,'category','list','sidebar',1,'2011-08-07 10:46:41'),
	(69,80,'project','list','',2,'2011-08-07 10:46:05'),
	(71,89,'jobApplication','form','',1,'2011-08-06 17:54:08'),
	(72,54,'jobPosition','show','',1,'2011-08-06 18:09:30'),
	(75,41,'dmWidgetContent','title','',2,'2011-08-07 11:38:59'),
	(76,38,'category','list','sidebar',1,'2011-08-07 11:39:55'),
	(77,41,'project','listFeaturedByCategory','',3,'2011-08-07 11:38:59'),
	(78,90,'project','listByCategory','',1,'2011-08-07 11:40:09'),
	(79,65,'main','flashFeature','',1,'2011-08-06 18:42:44'),
	(80,92,'main','header',NULL,-20,'2011-08-06 18:46:48'),
	(81,95,'main','footer','',1,'2011-08-06 18:53:23'),
	(82,96,'dmWidgetContent','title','',1,'2011-08-06 18:53:58'),
	(85,93,'dmWidgetSearch','results','',1,'2011-08-06 18:54:16'),
	(88,103,'main','header',NULL,-21,'2011-08-06 19:51:39'),
	(90,106,'main','footer','',1,'2011-08-06 20:56:22'),
	(91,107,'dmWidgetContent','title','',1,'2011-08-07 23:12:12'),
	(95,102,'client','list','',2,'2011-08-06 21:04:27'),
	(96,111,'project','listByClient','',1,'2011-08-07 10:48:30'),
	(98,104,'category','list','sdebar',1,'2011-08-06 21:05:22'),
	(100,8,'dmWidgetContent','title','',1,'2011-08-07 10:48:54'),
	(101,4,'category','list','sidebar',1,'2011-08-07 10:49:37'),
	(102,86,'main','aboutOverview','overview_content',1,'2011-08-07 14:47:18'),
	(103,25,'project','show',NULL,1,'2011-08-07 21:18:42'),
	(104,107,'project','listFeatured','',2,'2011-08-07 23:12:17');

/*!40000 ALTER TABLE `dm_widget` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_widget_translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_widget_translation`;

CREATE TABLE `dm_widget_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_widget_translation_id_dm_widget_id` FOREIGN KEY (`id`) REFERENCES `dm_widget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_widget_translation` WRITE;
/*!40000 ALTER TABLE `dm_widget_translation` DISABLE KEYS */;

INSERT INTO `dm_widget_translation` (`id`, `value`, `lang`)
VALUES
	(1,'{\"text\":\"Page not found\",\"tag\":\"h1\"}','en'),
	(2,'[]','en'),
	(3,'{\"cssClass\":null}','en'),
	(4,'[]','en'),
	(7,'{\"cssClass\":null}','en'),
	(8,'[]','en'),
	(9,'{\"cssClass\":null}','en'),
	(10,'[]','en'),
	(11,'{\"cssClass\":null}','en'),
	(12,'[]','en'),
	(13,'{\"cssClass\":null}','en'),
	(14,'[]','en'),
	(15,'{\"cssClass\":null}','en'),
	(16,'[]','en'),
	(17,'{\"cssClass\":null}','en'),
	(18,'[]','en'),
	(19,'{\"cssClass\":null}','en'),
	(20,'[]','en'),
	(31,'[]','en'),
	(32,'{\"text\":\"Contact Funny Garbage\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(35,'{\"cssClass\":null}','en'),
	(36,'[]','en'),
	(37,'{\"text\":\"Jobs\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(38,'{\"text\":\"Portfolio\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(40,'{\"text\":\"About\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(41,'{\"orderField\":\"created_at\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(42,'[]','en'),
	(43,'{\"user\":\"funnygarbage\",\"nb_tweets\":5,\"life_time\":3600}','en'),
	(44,'[]','en'),
	(45,'{\"text\":\"Leadership\",\"tag\":\"h3\",\"href\":\"\"}','en'),
	(46,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(58,'{\"orderField\":\"id\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(59,'[]','en'),
	(60,'[]','en'),
	(61,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":null,\"serviceCategoryFilter\":\"1\",\"navTop\":false,\"navBottom\":false}','en'),
	(62,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":5,\"serviceCategoryFilter\":\"4\",\"navTop\":false,\"navBottom\":false}','en'),
	(63,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":null,\"serviceCategoryFilter\":\"5\",\"navTop\":false,\"navBottom\":false}','en'),
	(64,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":5,\"serviceCategoryFilter\":\"2\",\"navTop\":false,\"navBottom\":false}','en'),
	(65,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":null,\"serviceCategoryFilter\":\"3\",\"navTop\":false,\"navBottom\":false}','en'),
	(66,'{\"text\":\"Services\",\"tag\":\"h3\",\"href\":\"\"}','en'),
	(67,'{\"orderField\":\"title\",\"orderType\":\"asc\",\"maxPerPage\":3,\"navTop\":false,\"navBottom\":false}','en'),
	(68,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(69,'{\"orderField\":\"title\",\"orderType\":\"asc\",\"maxPerPage\":5,\"navTop\":true,\"navBottom\":true}','en'),
	(71,'[]','en'),
	(72,'{\"recordId\":null}','en'),
	(75,'{\"text\":\"Portfolio\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(76,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(77,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":3,\"categoryFilter\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(78,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":12,\"navTop\":true,\"navBottom\":true,\"categoryFilter\":null}','en'),
	(79,'[]','en'),
	(80,'{\"cssClass\":null}','en'),
	(81,'[]','en'),
	(82,'{\"text\":\"Search Results\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(85,'{\"maxPerPage\":15,\"navTop\":true,\"navBottom\":true}','en'),
	(88,'{\"cssClass\":null}','en'),
	(90,'[]','en'),
	(91,'{\"text\":\"Clients\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(95,'{\"orderField\":\"title\",\"orderType\":\"asc\",\"maxPerPage\":12,\"navTop\":true,\"navBottom\":true}','en'),
	(96,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":true,\"navBottom\":true,\"clientFilter\":null}','en'),
	(98,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(100,'{\"text\":\"Clients\",\"tag\":\"h2\",\"href\":\"\"}','en'),
	(101,'{\"orderField\":\"name\",\"orderType\":\"asc\",\"maxPerPage\":null,\"navTop\":false,\"navBottom\":false}','en'),
	(102,'[]','en'),
	(103,'{\"recordId\":null,\"cssClass\":null}','en'),
	(104,'{\"orderField\":\"title\",\"orderType\":\"asc\",\"maxPerPage\":3,\"navTop\":false,\"navBottom\":false}','en');

/*!40000 ALTER TABLE `dm_widget_translation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dm_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dm_zone`;

CREATE TABLE `dm_zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_area_id` bigint(20) NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_area_id_idx` (`dm_area_id`),
  CONSTRAINT `dm_zone_dm_area_id_dm_area_id` FOREIGN KEY (`dm_area_id`) REFERENCES `dm_area` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `dm_zone` WRITE;
/*!40000 ALTER TABLE `dm_zone` DISABLE KEYS */;

INSERT INTO `dm_zone` (`id`, `dm_area_id`, `css_class`, `width`, `position`)
VALUES
	(1,1,NULL,NULL,-1),
	(2,2,NULL,NULL,-2),
	(3,3,NULL,NULL,-3),
	(4,4,'left','',-4),
	(5,5,NULL,NULL,-5),
	(6,6,NULL,NULL,-6),
	(7,7,NULL,NULL,-7),
	(8,8,NULL,NULL,-8),
	(9,9,NULL,NULL,-9),
	(10,10,NULL,NULL,-10),
	(11,11,NULL,NULL,-11),
	(12,12,NULL,NULL,-12),
	(21,21,NULL,NULL,-21),
	(22,22,NULL,NULL,-22),
	(23,23,NULL,NULL,-23),
	(24,24,NULL,NULL,-24),
	(25,25,'','',-25),
	(26,26,NULL,NULL,-26),
	(27,27,NULL,NULL,-27),
	(28,28,NULL,NULL,-28),
	(29,29,NULL,NULL,-29),
	(30,30,'','',-30),
	(31,31,'left','',-31),
	(32,32,NULL,NULL,-32),
	(33,33,NULL,NULL,-33),
	(34,34,NULL,NULL,-34),
	(35,35,NULL,NULL,-35),
	(36,36,NULL,NULL,-36),
	(37,37,NULL,NULL,-37),
	(38,38,'','',-38),
	(39,39,NULL,NULL,-39),
	(40,40,NULL,NULL,-40),
	(41,41,NULL,NULL,-41),
	(42,42,NULL,NULL,-42),
	(43,43,NULL,NULL,-43),
	(44,44,NULL,NULL,-44),
	(45,45,NULL,NULL,-45),
	(46,46,NULL,NULL,-46),
	(47,47,NULL,NULL,-47),
	(48,48,NULL,NULL,-48),
	(49,49,NULL,NULL,-49),
	(50,50,NULL,NULL,-50),
	(51,51,NULL,NULL,-51),
	(52,52,NULL,NULL,-52),
	(53,53,NULL,NULL,-53),
	(54,54,NULL,NULL,-54),
	(55,55,NULL,NULL,-55),
	(56,56,NULL,NULL,-56),
	(57,57,NULL,NULL,-57),
	(58,58,NULL,NULL,-58),
	(59,59,NULL,NULL,-59),
	(60,60,NULL,NULL,-60),
	(61,61,NULL,NULL,-61),
	(62,62,NULL,NULL,-62),
	(63,63,NULL,NULL,-63),
	(64,64,NULL,NULL,-64),
	(65,65,NULL,NULL,-65),
	(66,66,NULL,NULL,-66),
	(67,67,NULL,NULL,-67),
	(68,68,NULL,NULL,-68),
	(69,69,NULL,NULL,-69),
	(70,70,NULL,NULL,-70),
	(71,71,NULL,NULL,-71),
	(72,72,NULL,NULL,-72),
	(73,73,NULL,NULL,-73),
	(74,74,NULL,NULL,-74),
	(75,75,NULL,NULL,-75),
	(76,76,NULL,NULL,-76),
	(78,78,NULL,NULL,-78),
	(79,79,NULL,NULL,-79),
	(80,80,'left','',-80),
	(81,81,NULL,NULL,-81),
	(82,82,'sidebar','',-82),
	(84,84,NULL,NULL,-84),
	(85,85,NULL,NULL,-85),
	(86,86,NULL,NULL,-86),
	(87,87,'services_content','',-87),
	(88,88,'','',-88),
	(89,89,NULL,NULL,-89),
	(90,90,'left','',-90),
	(91,91,NULL,NULL,-91),
	(92,92,NULL,NULL,-92),
	(93,93,NULL,NULL,-93),
	(94,94,NULL,NULL,-94),
	(95,95,NULL,NULL,-95),
	(96,96,NULL,NULL,-96),
	(97,97,NULL,NULL,-97),
	(98,98,NULL,NULL,-98),
	(99,99,NULL,NULL,-99),
	(100,100,NULL,NULL,-100),
	(101,101,NULL,NULL,-101),
	(102,102,'','',-102),
	(103,103,NULL,NULL,-103),
	(104,104,'sidebar','',-104),
	(105,105,'','',-105),
	(106,106,NULL,NULL,-106),
	(107,107,NULL,NULL,-107),
	(108,108,NULL,NULL,-108),
	(109,109,NULL,NULL,-109),
	(110,110,NULL,NULL,-110),
	(111,111,'left','',-111),
	(112,112,NULL,NULL,-112);

/*!40000 ALTER TABLE `dm_zone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_application
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_application`;

CREATE TABLE `job_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job_position_id` bigint(20) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resume` bigint(20) NOT NULL,
  `objective` longtext COLLATE utf8_unicode_ci,
  `links` longtext COLLATE utf8_unicode_ci,
  `cover_letter` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_application_resume_idx` (`resume`),
  KEY `job_application_job_position_id_idx` (`job_position_id`),
  CONSTRAINT `job_application_job_position_id_job_position_id` FOREIGN KEY (`job_position_id`) REFERENCES `job_position` (`id`),
  CONSTRAINT `job_application_resume_dm_media_id` FOREIGN KEY (`resume`) REFERENCES `dm_media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table job_position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_position`;

CREATE TABLE `job_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `qualifications` longtext COLLATE utf8_unicode_ci,
  `tech_experience` longtext COLLATE utf8_unicode_ci,
  `additional_areas` longtext COLLATE utf8_unicode_ci,
  `required_skills` longtext COLLATE utf8_unicode_ci,
  `time_reqs` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `job_position` WRITE;
/*!40000 ALTER TABLE `job_position` DISABLE KEYS */;

INSERT INTO `job_position` (`id`, `name`, `department`, `description`, `qualifications`, `tech_experience`, `additional_areas`, `required_skills`, `time_reqs`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,'Interaction Design Intern','User Experience Design/IA','An interaction design internship involves working with the Interaction Designers at Funny Garbage to execute upon established functionality, navigation and interaction models for web sites, games and other interactive design projects. The internship would provide candidates with real world experience in motion tests, site maps, wire frames, flow charts, functional specifications, use-case scenarios, nomenclature and taxonomies. Interaction Design, also known as User Experience Design or Information Architecture, is an exciting new field with many opportunities for employment in the current marketplace.','','','','','',1,'2011-08-06 17:52:54','2011-08-06 17:52:54'),
	(2,'Design Internship','Design','A design internship at Funny Garbage involves working with Junior and Senior Designers to build out designs as established through their design directions. The internship also includes scanning and preparing imagery for incorporation into designs. As Flash development is very in demand, an opportunity to develop valuable, cutting-edge skills is available to those with a basic understanding of Flash. Overall, interns work closely with the design team and gain a solid understanding of the role of a designer at a multimedia studio.','','','','','',1,'2011-08-06 17:55:38','2011-08-06 18:00:50'),
	(3,'Interactive Producer','Project Management','Producers develop and manage medium- to large-scale projects for corporate and creative clients. Projects range from web sites to interactive games, web animation and software applications.\r\n\r\nYou will be responsible for overseeing all aspects of project management including client relations, project specification and documentation, budgets, resource allocation, and defining and maintaining large project schedules and workplans.\r\n\r\nProducers work closely with internal resources and freelancers, as well as the business development team and the client. You will need to coordinate between departments and prioritize tasks. You will be involved with every aspect of the project from inception to QA, and charged with delivering the project on time and on budget.','Applicant must possess strong client facing experience, excellent people skills, and an innate ability to plan projects and keep them on track in a highly organized and logical manner.\r\n\r\nA high level of personal energy, passion for your work, and overall sense of responsibility are vital.\r\n\r\nWe are looking for applicants who are well versed in industry best practices and developments, and are excited about the creative, technological, and business opportunities that are emerging in this field.','- Basic HTML / Dreamweaver experience (willing to teach skills to fast learning person)\r\n- Ability to use Photoshop\r\n- Experience in Marketing, Copy Writing, Proposal and Business Development\r\n- Experience producing Motion Graphics (After Effects) or Character Animation (Flash)\r\n- Broadcast Production\r\n','','3 Plus years of demonstrated skill producing complex consumer-oriented websites including features such as flash scripting, content management systems, games and activities, e-commerce, membership programs\r\n\r\nExcel at defining scope of work, assessing resources, scheduling, budgeting, project management, defining and meeting milestones and deadlines, verbal and written communication, managing up and down the internal and client hierarchies\r\n\r\nExcel at client and team management including business, technical and creative personalities, Cross Platform Computer skills including: MS Project Scheduling; Excel budgeting & financial tracking; MS Office Suite\r\n\r\nThe right mindset: pride in quality work, eager communicator, team player, personable, ability to both lead and follow, can-do attitude, willingness to take accountability for critical decisions, willingness to contribute to company knowledge, strategy & well being.','',1,'2011-08-06 17:58:48','2011-08-06 17:58:48'),
	(4,'Project Management Intern','Project Management','A project management internship focuses on learning what\'s involved in developing and managing projects from the business development stage to the project stage through completion. This internship involves working with Producers on 1-2 projects and trailing them to learn the basics of project management (i.e. process, scheduling, how to manage a team, balancing creativity, documentation). Interns could feasibly provide support on tasks such as posting designs, asset management, documentation and working with the team. Interns also have the opportunity to work with business development on proposals to learn what goes into a variety of pitches. Interns could also be assigned a variety of internal organizational projects that will round out their introduction to project management.','','','','Applicants must have a working knowledge of Microsoft Word and Excel. It is preferable to have a basic understanding of HTML','',1,'2011-08-06 18:03:33','2011-08-06 18:03:33'),
	(5,'Lead Developer','Technology','Award winning design and production firm seeks a technical lead/software developer for client projects and operations management. Applicants should be technically skilled/experienced with an emphasis on creating business solutions. The role involves working as part of a multidisciplinary project team, designing, implementing and maintaining enterprise level software systems, outlining technical solutions/options to clients, and managing the company application infrastructure. Candidates must have at least five years of work experience and should have a computer science degree.','Solid foundation and understanding of OO, MVC and IoC\r\n\r\nExperience leading technology projects\r\n\r\nExperience building and maintaining relational, production databases and servers\r\n\r\n3+ years of experience with PHP\r\n\r\nThe right mindset: pride in quality work, eager communicator, team player, personable, ability to both lead and follow, can-do attitude, nothing is beneath you, willingness to take accountability for critical decisions, willingness to contribute to company knowledge, strategy & well being\r\n\r\nBig plus if you have: Management experience, background or strong','','','','',1,'2011-08-06 18:04:54','2011-08-06 18:04:54'),
	(6,'Drupal Developer','Technology','Award winning design and production firm seeks an experienced Drupal developer for high profile client projects and operations management. Applicants should be technically skilled/experienced with an emphasis on creating business solutions. The role involves working as part of a multidisciplinary project team, determining potential existing software solutions, designing and implementing new modules, outlining technical solutions/options to clients and implementing said solutions. The ideal candidate is self-motivated and is eager to learn new technologies.','','','','Required Skills: Deep Drupal 6 knowledge including module development, 2+ years experience with PHP, MySQL\r\n\r\nAdditional Areas of Knowledge (helpful but not required): Experience with working with Drupal forms API, Clustered MySQL and Redhat solutions, XHTML/CSS, SQL, Symfony framework, Flex, Flash AS 3, AJAX, Rails, jQuery and other Javascript Frameworks\r\n\r\nThe right mindset: pride in quality work, eager communicator, team player, personable, ability to both lead and follow, can-do attitude, nothing is beneath you, willingness to take accountability for critical decisions, willingness to contribute to company knowledge, strategy & well being eager to learn\r\n\r\nBig plus if you have: Management experience, background or strong interest in UI design','',1,'2011-08-06 18:06:10','2011-08-06 18:26:41'),
	(7,'Technology Project Manager','Technology','Award winning design and product firm seeks a technical project manager who can help assure the on-time, on-budget delivery of multiple, simultaneous client projects. Applicants should be technically skilled enough to understand in detail what development tasks need to be accomplished, knows how to create realistic but aggressive schedules, can motivate and direct engineers in their day to day work (without a supervisory role), and manage the specification, documentation,m budgeting, required for the delivery of required technology.','- 3+ years as a project manager (in an Agency environment helpful) with increasingly responsible roles\r\n- Must have led large-scale development\r\n- Excellent communications skills\r\n- Focus and passion to follow through with difficult problems and experience in a wide range of environments\r\n- Working knowledge of client-side development (Drupal, PHP, Symfony, Java, HTML, CSS, JavaScript, Flash)\r\n- Can\'t get “snowed” by tech talk\r\n- Strong understanding of highly-interactive web sites and applications\r\n- Knowledge of project management principles, processes and software, including Microsoft Project, PowerPoint and Excel\r\n- Demonstrated ability to lead large scale software development projects to successful completion on time and on budget','','','','',1,'2011-08-06 18:07:51','2011-08-06 18:26:41');

/*!40000 ALTER TABLE `job_position` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migration_version
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migration_version`;

CREATE TABLE `migration_version` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `migration_version` WRITE;
/*!40000 ALTER TABLE `migration_version` DISABLE KEYS */;

INSERT INTO `migration_version` (`version`)
VALUES
	(3);

/*!40000 ALTER TABLE `migration_version` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `photo` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_photo_idx` (`photo`),
  CONSTRAINT `page_photo_dm_media_id` FOREIGN KEY (`photo`) REFERENCES `dm_media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;

INSERT INTO `page` (`id`, `title`, `body`, `photo`, `is_active`, `position`, `created_at`, `updated_at`)
VALUES
	(1,'About','',NULL,1,-1,'2011-08-06 15:51:07','2011-08-06 15:51:07');

/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page_dm_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_dm_tag`;

CREATE TABLE `page_dm_tag` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `dm_tag_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`dm_tag_id`),
  KEY `page_dm_tag_dm_tag_id_idx` (`dm_tag_id`),
  KEY `page_dm_tag_id_idx` (`id`),
  CONSTRAINT `page_dm_tag_dm_tag_id_dm_tag_id` FOREIGN KEY (`dm_tag_id`) REFERENCES `dm_tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `page_dm_tag_id_page_id` FOREIGN KEY (`id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `overview` text COLLATE utf8_unicode_ci NOT NULL,
  `launch_date` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awards` text COLLATE utf8_unicode_ci,
  `screenshot` bigint(20) DEFAULT NULL,
  `thumbnail` bigint(20) DEFAULT NULL,
  `client` bigint(20) NOT NULL,
  `client_2` bigint(20) DEFAULT NULL,
  `client_3` bigint(20) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  `extract` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `project_screenshot_idx` (`screenshot`),
  KEY `project_thumbnail_idx` (`thumbnail`),
  KEY `project_client_idx` (`client`),
  KEY `project_client_2_idx` (`client_2`),
  KEY `project_client_3_idx` (`client_3`),
  KEY `project_category_id_idx` (`category_id`),
  CONSTRAINT `project_category_id_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `project_client_2_client_id` FOREIGN KEY (`client_2`) REFERENCES `client` (`id`),
  CONSTRAINT `project_client_3_client_id` FOREIGN KEY (`client_3`) REFERENCES `client` (`id`),
  CONSTRAINT `project_client_client_id` FOREIGN KEY (`client`) REFERENCES `client` (`id`),
  CONSTRAINT `project_screenshot_dm_media_id` FOREIGN KEY (`screenshot`) REFERENCES `dm_media` (`id`),
  CONSTRAINT `project_thumbnail_dm_media_id` FOREIGN KEY (`thumbnail`) REFERENCES `dm_media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;

INSERT INTO `project` (`id`, `title`, `category_id`, `overview`, `launch_date`, `url`, `awards`, `screenshot`, `thumbnail`, `client`, `client_2`, `client_3`, `is_featured`, `is_active`, `position`, `extract`)
VALUES
	(1,'Pop Art Pixies',5,'The Pop Art Pixies of Crayola: Naomi, Maya, Tatum and Skye, are “Friending” the world one tween at a time while creating and sharing awesome crafts and artwork both in the real world and online.\r\n\r\nWhen Crayola approached Funny Garbage to create a virtual world to immerse girls in the exciting world of the Pop Art Pixies, we pitched the idea that the characters launch their own COPA compliant social network website based around their love of crafting. Naomi does the coding, Maya creates the look and art, Skye creates the avatars and Tatum oversees the promotion and finds online friends who love art and crafting. The site has Facebook-like functionality such as user profiles, friending, sharing, and avatars.\r\n\r\nWhen first arriving at the site, fans can meet the Pixies by watching an animated video that introduces the characters and their world.\r\n\r\nOnce on the site, fans can use custom applications to create an avatar in the style of the Pop Art Pixies. Choosing from different backgrounds, facial features, body parts, clothing and accessories, girls can create a highly individualized avatar to represent themselves on the social network of the site. The tools can also be used to create artwork, both for display on the site and to customize the real world crafts that are part of the Pixie universe. Each Crayola craft kit is featured on the site through the social network that shows how tween girls across America are customizing their art through the use of the online Collage Activities.\r\n\r\nFG created the Pop Art Pixies website using Flash for the applications and Cold Fusion for the site build and CMS. User generated content was supported and moderated using Pluck, a third party SAAS.\r\n\r\nFunny garbage infused the physical crafting product with an online component through the user generated art tools and added a real world dimension to the Pop Art Pixies characters and story, to inspire product loyalty, usage and sharing among the fan group.','2010','http://www.popartpixies.com','',303,304,10,NULL,NULL,1,1,-1,'The Pop Art Pixies of Crayola: Naomi, Maya, Tatum and Skye, are “Friending” the world one tween at a time.'),
	(21,'US Magazine',5,'In September 2009, Funny Garbage re-launched the website Us Magazine, the dominant source for celebrity news and entertainment online. FG worked closely with Wenner Media to conceptualize and implement innovative web 2.0 approaches to increase traffic, site “stickiness”, editorial workflow, search engine optimization, media capacity and revenue potential. The resultant site includes expanded lifestyle channels and a robust state-of-the-art approach to display advertising, promotions and subscriptions.\r\n\r\nOne of the challenges of maintaining a site that relies on topical and up to the minute content is the ease of publishing new information. Through user testing focus groups and extensive Information Architecture exploration, FG was able to scope out the new Content Management system and backend infrastructure to ease the workflow of the Wenner editorial staff and technical team. The CMS was then taken off its original Drupal platform and custom built to be more usable by both readers and staff, the end result being a more flexible and intelligent design/user interface that improves the ease of use. We also re-architected and redesigned the site to focus more on news and celebrity information. Photo galleries, links to third party vendors for subscriptions and video hosting provide a strong foundation for growth over the next few years in terms of both traffic and revenues.\r\n\r\nAfter it’s successful launch, FG still enjoys a maintenance relationship with Wenner Media to provide ongoing creative and technical services to support and enhance the site.','2009','http://usmagazine.com','- 2009 Webby Award Honorable Mention',306,307,11,NULL,NULL,1,1,-2,'This is the extract.');

/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_dm_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_dm_media`;

CREATE TABLE `project_dm_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_media_id` bigint(20) NOT NULL,
  `dm_record_id` bigint(20) NOT NULL,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_dm_media_idx` (`dm_record_id`,`dm_media_id`),
  KEY `project_dm_media_dm_media_id_idx` (`dm_media_id`),
  KEY `project_dm_media_dm_record_id_idx` (`dm_record_id`),
  CONSTRAINT `project_dm_media_dm_media_id_dm_media_id` FOREIGN KEY (`dm_media_id`) REFERENCES `dm_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_dm_media_dm_record_id_project_id` FOREIGN KEY (`dm_record_id`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `project_dm_media` WRITE;
/*!40000 ALTER TABLE `project_dm_media` DISABLE KEYS */;

INSERT INTO `project_dm_media` (`id`, `dm_media_id`, `dm_record_id`, `position`)
VALUES
	(1,127,1,1),
	(2,128,1,0),
	(3,138,21,-1),
	(4,140,21,-2);

/*!40000 ALTER TABLE `project_dm_media` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_dm_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_dm_tag`;

CREATE TABLE `project_dm_tag` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `dm_tag_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`dm_tag_id`),
  KEY `project_dm_tag_dm_tag_id_idx` (`dm_tag_id`),
  KEY `project_dm_tag_id_idx` (`id`),
  CONSTRAINT `project_dm_tag_dm_tag_id_dm_tag_id` FOREIGN KEY (`dm_tag_id`) REFERENCES `dm_tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_dm_tag_id_project_id` FOREIGN KEY (`id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `project_dm_tag` WRITE;
/*!40000 ALTER TABLE `project_dm_tag` DISABLE KEYS */;

INSERT INTO `project_dm_tag` (`id`, `dm_tag_id`)
VALUES
	(21,3),
	(21,4);

/*!40000 ALTER TABLE `project_dm_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_video`;

CREATE TABLE `project_video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `project` bigint(20) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_video_project_idx` (`project`),
  CONSTRAINT `project_video_project_project_id` FOREIGN KEY (`project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `service_category_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_service_category_id_idx` (`service_category_id`),
  CONSTRAINT `service_service_category_id_service_category_id` FOREIGN KEY (`service_category_id`) REFERENCES `service_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;

INSERT INTO `service` (`id`, `name`, `description`, `service_category_id`, `is_active`, `position`)
VALUES
	(1,'Agile','',3,1,-1),
	(2,'Waterfall','',3,1,-2),
	(3,'Content analysis strategy','',2,1,-3),
	(4,'Strategic direction','',2,1,-4),
	(5,'Competitive analysis & positioning','',2,1,-5),
	(6,'Usability testing','',5,1,-6),
	(7,'Focus group testing','',5,1,-7),
	(8,'Prototype development','',4,1,-8),
	(9,'Information architecture','',5,1,-9),
	(10,'Quality assurance testing','',4,1,-10),
	(11,'Content Management Systems','',4,1,-11),
	(12,'Web and app development','',4,1,-12),
	(13,'Open source development','',4,1,-13),
	(14,'System architecture definition','',4,1,-14),
	(15,'Technology strategy','',4,1,-15),
	(16,'Style guide development','',1,1,-16),
	(17,'Animation','',1,1,-17),
	(18,'Character development','',1,1,-18),
	(19,'Logo design','',1,1,-19),
	(20,'Art direction','',1,1,-20),
	(21,'Copy writing','',1,1,-21),
	(22,'Brand identity','',1,1,-22),
	(23,'Creative direction','',1,1,-23);

/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_category`;

CREATE TABLE `service_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `service_category` WRITE;
/*!40000 ALTER TABLE `service_category` DISABLE KEYS */;

INSERT INTO `service_category` (`id`, `name`, `body`)
VALUES
	(1,'Creative',''),
	(2,'Product Planning',''),
	(3,'Project Management',''),
	(4,'Technology',''),
	(5,'User Experience','');

/*!40000 ALTER TABLE `service_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table staff_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staff_member`;

CREATE TABLE `staff_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` longtext COLLATE utf8_unicode_ci,
  `photo` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_member_photo_idx` (`photo`),
  CONSTRAINT `staff_member_photo_dm_media_id` FOREIGN KEY (`photo`) REFERENCES `dm_media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `staff_member` WRITE;
/*!40000 ALTER TABLE `staff_member` DISABLE KEYS */;

INSERT INTO `staff_member` (`id`, `name`, `title`, `department`, `bio`, `photo`, `is_active`, `position`)
VALUES
	(1,'John Carlin','President & Chief Executive Officer','Project Management','John\'s background in law, business, art and popular culture helped established the company as leader in the business of interactive media. John produced the PBS documentary \"Imagining America\" and curated \"Masters of American Comics\" one of the first major museum exhibitions to showcase the art of comic strips, comic books and graphic novels',212,1,1),
	(2,'Kristin Ellington','Chief Operating Officer','Project Management','Not just your average C.O.O., but also an Executive Producer of all the premier FG projects. Truly the motor powering FG\'s daily operations, Kristin has been with FG since its formation, managing the growth of the company from a small design studio into a full-scale production and content development business with a global clientele.',213,1,2);

/*!40000 ALTER TABLE `staff_member` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
