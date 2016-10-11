/*
SQLyog Ultimate v12.18 (64 bit)
MySQL - 5.7.15-log : Database - atdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`atdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `atdb`;

/*Table structure for table `block` */

DROP TABLE IF EXISTS `block`;

CREATE TABLE `block` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  `label` tinytext,
  PRIMARY KEY (`id`),
  KEY `block_ibfk_1` (`created_by`),
  CONSTRAINT `block_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;

/*Data for the table `block` */

insert  into `block`(`id`,`created`,`created_by`,`modified`,`status`,`label`) values 
(287,'2016-10-11 12:01:26',27,'2016-10-11 12:01:26',0,'M-24795_3'),
(302,'2016-10-11 13:01:38',27,'2016-10-11 13:01:38',0,NULL),
(303,'2016-10-11 13:15:32',27,'2016-10-11 13:15:32',0,NULL),
(305,'2016-10-11 13:22:55',27,'2016-10-11 13:22:55',0,NULL),
(306,'2016-10-11 13:22:56',27,'2016-10-11 13:22:56',0,NULL);

/*Table structure for table `block_note` */

DROP TABLE IF EXISTS `block_note`;

CREATE TABLE `block_note` (
  `block_id` int(11) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  KEY `block_id` (`block_id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `block_note_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `block_note_ibfk_3` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `block_note` */

insert  into `block_note`(`block_id`,`note_id`) values 
(287,653),
(306,657),
(306,658),
(306,659);

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` mediumtext NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8;

/*Data for the table `note` */

insert  into `note`(`id`,`note`,`created_on`,`created_by`) values 
(642,'Ribbon Note..','2016-10-11 12:48:58',27),
(653,'Block Note..','2016-10-11 13:01:16',27),
(654,'Ribbon Note..','2016-10-11 13:01:21',27),
(656,'Ribbon Note..','2016-10-11 13:15:52',27),
(657,'Block Note..','2016-10-11 13:22:57',27),
(658,'Block Note..','2016-10-11 13:22:58',27),
(659,'Block Note..','2016-10-11 13:22:58',27),
(660,'Ribbon Note..','2016-10-11 13:26:20',27);

/*Table structure for table `ribbon` */

DROP TABLE IF EXISTS `ribbon`;

CREATE TABLE `ribbon` (
  `id` varchar(36) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `block_id` int(11) NOT NULL DEFAULT '-1',
  `cutting_order` int(11) NOT NULL DEFAULT '-1',
  `nr_of_sections` smallint(6) DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  CONSTRAINT `ribbon_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ribbon` */

insert  into `ribbon`(`id`,`status`,`block_id`,`cutting_order`,`nr_of_sections`,`created`,`modified`) values 
('7fe41cf4-8fef-11e6-a44a-d8cb8abce51b',0,287,-1,0,'2016-10-11 13:15:48','2016-10-11 13:15:48'),
('813893f4-8ff0-11e6-9c59-d8cb8abce51b',0,306,-1,0,'2016-10-11 13:23:00','2016-10-11 13:23:00'),
('817dda54-8ff0-11e6-9e4e-d8cb8abce51b',0,306,-1,0,'2016-10-11 13:23:00','2016-10-11 13:23:00'),
('c8c202f4-8fec-11e6-a2df-d8cb8abce51b',0,287,-1,0,'2016-10-11 12:56:22','2016-10-11 12:56:22'),
('c9046324-8fec-11e6-93c8-d8cb8abce51b',0,287,-1,0,'2016-10-11 12:56:22','2016-10-11 12:56:22'),
('c977e574-8fec-11e6-801f-d8cb8abce51b',0,287,-1,0,'2016-10-11 12:56:23','2016-10-11 12:56:23'),
('f644df54-8ff0-11e6-8f44-d8cb8abce51b',0,303,-1,0,'2016-10-11 13:26:16','2016-10-11 13:26:16'),
('f6a8f854-8ff0-11e6-bfe9-d8cb8abce51b',0,303,-1,0,'2016-10-11 13:26:17','2016-10-11 13:26:17');

/*Table structure for table `ribbon_note` */

DROP TABLE IF EXISTS `ribbon_note`;

CREATE TABLE `ribbon_note` (
  `ribbon_id` varchar(36) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  KEY `ribbon_id` (`ribbon_id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `ribbon_note_ibfk_1` FOREIGN KEY (`ribbon_id`) REFERENCES `ribbon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ribbon_note_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ribbon_note` */

insert  into `ribbon_note`(`ribbon_id`,`note_id`) values 
('c977e574-8fec-11e6-801f-d8cb8abce51b',654),
('c9046324-8fec-11e6-93c8-d8cb8abce51b',656),
('c977e574-8fec-11e6-801f-d8cb8abce51b',660);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`user_name`,`created`) values 
(27,'Totte','2016-10-07 09:00:08'),
(28,'DbUser','2016-10-07 16:33:32'),
(30,'Sarah','2016-10-10 14:32:46'),
(33,'New Useradf','2016-10-11 11:24:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
