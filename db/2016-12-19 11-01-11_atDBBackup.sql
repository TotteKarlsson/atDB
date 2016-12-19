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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) DEFAULT NULL COMMENT 'This ID relates a block with a specimen process_id in the  specimen table',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT 'XXXXXX',
  `serial` smallint(5) unsigned NOT NULL COMMENT 'The serial starts at 1 and is related to the process_id',
  PRIMARY KEY (`id`),
  KEY `block_ibfk_1` (`created_by`),
  KEY `process_id` (`process_id`),
  KEY `status` (`status`),
  CONSTRAINT `block_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `block_ibfk_2` FOREIGN KEY (`process_id`) REFERENCES `specimen` (`process_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `block_ibfk_3` FOREIGN KEY (`status`) REFERENCES `blockstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `block` */

insert  into `block`(`id`,`process_id`,`created`,`created_by`,`modified`,`status`,`label`,`serial`) values 
(1,784,'2016-12-19 10:11:10',27,'2016-12-19 10:11:10',0,'M223480-1',1),
(13,842,'2016-12-19 10:56:31',27,'2016-12-19 10:56:31',0,'M270905-4',4),
(14,842,'2016-12-19 10:56:32',27,'2016-12-19 10:56:32',0,'M270905-4',4),
(15,842,'2016-12-19 10:57:16',27,'2016-12-19 10:57:16',0,'M270905-1',1),
(16,842,'2016-12-19 10:57:17',27,'2016-12-19 10:57:17',0,'M270905-1',1);

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
(1,1);

/*Table structure for table `blockstatus` */

DROP TABLE IF EXISTS `blockstatus`;

CREATE TABLE `blockstatus` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `blockstatus` */

insert  into `blockstatus`(`id`,`status`) values 
(0,'NOT_SET'),
(1,'NEW'),
(2,'PHASED'),
(3,'TRIMMED'),
(4,'DEPLETED');

/*Table structure for table `carboncoatedcsbatch` */

DROP TABLE IF EXISTS `carboncoatedcsbatch`;

CREATE TABLE `carboncoatedcsbatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` int(11) DEFAULT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `carboncoatedcsbatch` */

insert  into `carboncoatedcsbatch`(`id`,`date_created`,`count`,`user`) values 
(9,'2016-12-01 12:36:29',3,27),
(10,'2016-12-01 12:39:05',5,27),
(11,'2016-12-01 12:39:39',1,27),
(12,'2016-12-01 12:42:54',1,27),
(13,'2016-12-01 12:43:04',1,27),
(14,'2016-12-01 12:44:07',1,27),
(15,'2016-12-01 12:46:04',8,27),
(16,'2016-12-01 14:22:31',22,27),
(17,'2016-12-01 14:31:50',3,27),
(18,'2016-12-01 15:29:58',1,27),
(19,'2016-12-01 15:33:10',1,27),
(20,'2016-12-01 15:47:53',8,27),
(21,'2016-12-09 11:07:09',6,27),
(22,'2016-12-09 11:57:30',6,27),
(23,'2016-12-12 13:09:31',1,27),
(24,'2016-12-15 11:59:02',1,27);

/*Table structure for table `cleancsbatch` */

DROP TABLE IF EXISTS `cleancsbatch`;

CREATE TABLE `cleancsbatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `note` text,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `cleancsbatch_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `cleancsbatch` */

insert  into `cleancsbatch`(`id`,`date`,`user`,`note`,`count`) values 
(29,'2016-12-01 12:36:21',27,NULL,3),
(30,'2016-12-01 12:38:58',27,NULL,5),
(31,'2016-12-01 14:22:13',27,NULL,22),
(32,'2016-12-01 14:30:52',27,NULL,3),
(33,'2016-12-01 15:09:31',27,NULL,3),
(34,'2016-12-01 15:29:50',27,NULL,1),
(35,'2016-12-01 15:33:06',27,NULL,1),
(36,'2016-12-01 15:47:37',27,NULL,40),
(37,'2016-12-09 11:06:28',27,NULL,40),
(38,'2016-12-09 11:57:02',27,NULL,6),
(39,'2016-12-12 13:09:07',27,NULL,1),
(40,'2016-12-15 11:58:45',27,NULL,8);

/*Table structure for table `coverslip` */

DROP TABLE IF EXISTS `coverslip`;

CREATE TABLE `coverslip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL COMMENT 'The coverslips state',
  `type` int(11) NOT NULL COMMENT 'Type of cs',
  `notes` text,
  `freshCSBatch` int(11) NOT NULL,
  `cleanCSBatch` int(11) DEFAULT NULL,
  `carboncoatbatch` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `coverslip_ibfk_3` (`freshCSBatch`),
  KEY `cleanCSBatch` (`cleanCSBatch`),
  CONSTRAINT `coverslip_ibfk_1` FOREIGN KEY (`status`) REFERENCES `coverslipstatus` (`id`),
  CONSTRAINT `coverslip_ibfk_2` FOREIGN KEY (`type`) REFERENCES `coversliptype` (`id`),
  CONSTRAINT `coverslip_ibfk_3` FOREIGN KEY (`freshCSBatch`) REFERENCES `freshcsbatch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coverslip_ibfk_4` FOREIGN KEY (`cleanCSBatch`) REFERENCES `cleancsbatch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8;

/*Data for the table `coverslip` */

insert  into `coverslip`(`id`,`status`,`type`,`notes`,`freshCSBatch`,`cleanCSBatch`,`carboncoatbatch`) values 
(538,1,1,NULL,61,NULL,NULL),
(539,1,1,NULL,61,NULL,NULL),
(540,1,1,NULL,61,NULL,NULL),
(541,5,1,NULL,61,39,23),
(542,5,1,NULL,61,38,22),
(543,5,1,NULL,61,38,22),
(544,5,1,NULL,61,38,22),
(545,5,1,NULL,61,38,22),
(546,5,1,NULL,61,38,22),
(547,5,1,NULL,61,38,22),
(548,1,1,NULL,62,NULL,NULL),
(549,1,1,NULL,62,NULL,NULL),
(550,1,1,NULL,62,NULL,NULL),
(551,1,1,NULL,62,NULL,NULL),
(552,1,1,NULL,62,NULL,NULL),
(553,1,1,NULL,62,NULL,NULL),
(554,1,1,NULL,62,NULL,NULL),
(555,1,1,NULL,62,NULL,NULL),
(556,1,1,NULL,62,NULL,NULL),
(557,1,1,NULL,62,NULL,NULL),
(558,1,1,NULL,62,NULL,NULL),
(559,1,1,NULL,62,NULL,NULL),
(560,1,1,NULL,62,NULL,NULL),
(561,1,1,NULL,62,NULL,NULL),
(562,1,1,NULL,62,NULL,NULL),
(563,1,1,NULL,62,NULL,NULL),
(564,1,1,NULL,62,NULL,NULL),
(565,1,1,NULL,62,NULL,NULL),
(566,1,1,NULL,62,NULL,NULL),
(567,1,1,NULL,62,NULL,NULL),
(568,1,1,NULL,62,NULL,NULL),
(569,1,1,NULL,62,NULL,NULL),
(570,1,1,NULL,62,NULL,NULL),
(571,1,1,NULL,62,NULL,NULL),
(572,1,1,NULL,62,NULL,NULL),
(573,1,1,NULL,62,NULL,NULL),
(574,1,1,NULL,62,NULL,NULL),
(575,1,1,NULL,62,NULL,NULL),
(576,1,1,NULL,62,NULL,NULL),
(577,1,1,NULL,62,NULL,NULL),
(578,1,1,NULL,62,NULL,NULL),
(579,1,1,NULL,62,NULL,NULL),
(580,1,1,NULL,62,NULL,NULL),
(581,1,1,NULL,62,NULL,NULL),
(582,1,1,NULL,62,NULL,NULL),
(583,1,1,NULL,62,NULL,NULL),
(584,1,1,NULL,62,NULL,NULL),
(585,1,1,NULL,62,NULL,NULL),
(586,1,1,NULL,62,NULL,NULL),
(587,1,1,NULL,62,NULL,NULL),
(588,1,1,NULL,62,NULL,NULL),
(589,4,1,NULL,62,40,NULL),
(590,4,1,NULL,62,40,NULL),
(591,4,1,NULL,62,40,NULL),
(592,4,1,NULL,62,40,NULL),
(593,4,1,NULL,62,40,NULL),
(594,5,1,NULL,62,40,24),
(595,4,1,NULL,62,40,NULL),
(596,4,1,NULL,62,40,NULL),
(597,1,1,NULL,62,NULL,NULL);

/*Table structure for table `coverslipdustassay` */

DROP TABLE IF EXISTS `coverslipdustassay`;

CREATE TABLE `coverslipdustassay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `coverslip_id` int(11) NOT NULL,
  `background_image` varchar(36) DEFAULT NULL,
  `coverslip_image` varchar(36) DEFAULT NULL,
  `result_image` varchar(36) DEFAULT NULL,
  `coverslip_status` int(11) NOT NULL COMMENT 'Status of coverslip at time of control',
  `note` text,
  PRIMARY KEY (`id`),
  KEY `coverslip_id` (`coverslip_id`),
  KEY `coverslip_status` (`coverslip_status`),
  CONSTRAINT `coverslipdustassay_ibfk_1` FOREIGN KEY (`coverslip_id`) REFERENCES `coverslip` (`id`),
  CONSTRAINT `coverslipdustassay_ibfk_2` FOREIGN KEY (`coverslip_status`) REFERENCES `coverslipstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `coverslipdustassay` */

/*Table structure for table `coverslipstatus` */

DROP TABLE IF EXISTS `coverslipstatus`;

CREATE TABLE `coverslipstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `coverslipstatus` */

insert  into `coverslipstatus`(`id`,`status`,`note`) values 
(1,'Fresh out of the box',NULL),
(2,'Post Ethanol Clean',NULL),
(3,'Post Plasma Clean',NULL),
(4,'Post Silanization',NULL),
(5,'Post Carbon Coat',NULL),
(6,'Post Sectioning',NULL),
(7,'Post mounting',NULL),
(8,'Discarded',NULL);

/*Table structure for table `coversliptype` */

DROP TABLE IF EXISTS `coversliptype`;

CREATE TABLE `coversliptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `coversliptype` */

insert  into `coversliptype`(`id`,`type`,`note`) values 
(1,'Regular CoverSlip',NULL),
(2,'Another Type',NULL);

/*Table structure for table `cryoprotection` */

DROP TABLE IF EXISTS `cryoprotection`;

CREATE TABLE `cryoprotection` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cryoprotection_ibfk_1` (`document_id`),
  CONSTRAINT `cryoprotection_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `cryoprotection` */

insert  into `cryoprotection`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(0,'NULL',NULL),
(1,'Glycerol series 	10%, 20%, 30% Glycerol in PBS	1 hour each',NULL),
(2,'Sucrose series	10%, 20%, 30% Glycerol in PBS	1 hour each',NULL),
(3,'Glycerol series 	10%, 20%, 30% glycerol in 0.1M sodium acetate pH 7.4	10% 30min, 20% 30min,30% 30min, overnight ',NULL);

/*Table structure for table `document` */

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(255) NOT NULL,
  `document` longblob,
  `type` varchar(16) DEFAULT NULL COMMENT 'document extension',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `document` */

/*Table structure for table `embedding` */

DROP TABLE IF EXISTS `embedding`;

CREATE TABLE `embedding` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `embedding_ibfk_1` (`document_id`),
  CONSTRAINT `embedding_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `embedding` */

insert  into `embedding`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(0,'Combination',NULL),
(1,'gelatin capsule',NULL),
(2,'flat gelatin capsule with sealant',NULL),
(3,'flow through capsules',NULL),
(4,'beam capsules',NULL),
(5,'punched aclar sandwich\r\n',NULL),
(6,'LR White',NULL);

/*Table structure for table `fixative` */

DROP TABLE IF EXISTS `fixative`;

CREATE TABLE `fixative` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixative_ibfk_1` (`document_id`),
  CONSTRAINT `fixative_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `fixative` */

insert  into `fixative`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(0,'None- live tissue',NULL),
(1,'4%PFA + 1% Glutaraldehyde in PB',NULL),
(2,'2%PFA + 2% Glutaraldehyde in PB\r\n',NULL),
(3,'4%PFA in PB\r\n',NULL);

/*Table structure for table `fixmethod` */

DROP TABLE IF EXISTS `fixmethod`;

CREATE TABLE `fixmethod` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixmethod_ibfk_1` (`document_id`),
  CONSTRAINT `fixmethod_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `fixmethod` */

insert  into `fixmethod`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(0,'Immersion fixed',NULL),
(1,'Perfused with flush',NULL),
(2,'Perfused without flush',NULL),
(3,'none - not fixed',NULL);

/*Table structure for table `freezeprotocol` */

DROP TABLE IF EXISTS `freezeprotocol`;

CREATE TABLE `freezeprotocol` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(128) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `freezeprotocol_ibfk_1` (`document_id`),
  CONSTRAINT `freezeprotocol_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `freezeprotocol` */

insert  into `freezeprotocol`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(0,'No freezing',NULL),
(1,'High pressure freezer with BSA filler\r\n',NULL),
(2,'High pressure freezer with 1-hexadecene filler\r\n',NULL),
(3,'High pressure freezer with isooctane filler\r\n',NULL),
(4,'High pressure freezer with PVP filler\r\n',NULL),
(5,'High pressure freezer with fillers\r\n',NULL),
(6,'Plunge freeze into acetone in AFS\r\n',NULL),
(7,'Plunge freeze into acetone with 5% Uranyl Acetate\r\n',NULL);

/*Table structure for table `freshcsbatch` */

DROP TABLE IF EXISTS `freshcsbatch`;

CREATE TABLE `freshcsbatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` int(11) DEFAULT NULL,
  `batchcode` varchar(128) NOT NULL DEFAULT '0000000',
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  CONSTRAINT `freshcsbatch_ibfk_1` FOREIGN KEY (`type`) REFERENCES `coversliptype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `freshcsbatch` */

insert  into `freshcsbatch`(`id`,`date_created`,`count`,`batchcode`,`type`) values 
(61,'2016-12-09 11:56:08',10,'16DEC901',1),
(62,'2016-12-15 11:58:08',50,'16DEC1502',1);

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` varchar(36) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `filename` varchar(255) NOT NULL,
  `fileextension` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `image` */

/*Table structure for table `infiltration` */

DROP TABLE IF EXISTS `infiltration`;

CREATE TABLE `infiltration` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `infiltration_ibfk_1` (`document_id`),
  CONSTRAINT `infiltration_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `infiltration` */

insert  into `infiltration`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(1,'room temperature LR White 	1:1, 2:1, pure, pure, pure	room temp',NULL),
(2,'Lowicryl	resin:acetone 1:1, 2:1, pure, pure, pure	-45',NULL),
(3,'10% LR white 90% Lowicryl	resin:acetone 1:1, 2:1, pure, pure, pure	-45',NULL),
(4,'mixed lowicryl/LR white dilutions	resin:acetone 1:1, 2:1, pure, pure, pure	-45',NULL),
(6,'UNKNOWN',NULL);

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` mediumtext NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `note` */

insert  into `note`(`id`,`note`,`created_on`,`created_by`) values 
(1,'Block Note..','2016-12-19 10:11:29',40);

/*Table structure for table `postfix` */

DROP TABLE IF EXISTS `postfix`;

CREATE TABLE `postfix` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postfix_ibfk_1` (`document_id`),
  CONSTRAINT `postfix_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `postfix` */

insert  into `postfix`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(0,'none',NULL),
(1,'4%PFA + 2% Glutaraldehyde in PB 1-3 hour',NULL),
(2,'4%PFA + 2% Glutaraldehyde in PB Overnight',NULL),
(3,'2%PFA + 2% Glutaraldehyde in PB\r\n 1-3 hour',NULL),
(4,'2%PFA + 2% Glutaraldehyde in PB\r\n Overnight',NULL),
(5,'4%PFA + 1% Glutaraldehyde in PB 1-3 hour',NULL),
(6,'4%PFA + 1% Glutaraldehyde in PB Overnight',NULL),
(7,'4%PFA 1-3 hour',NULL),
(8,'4%PFA Overnight',NULL),
(9,'4%PFA, then shipped 4%PFA, 1%glut\r\n',NULL);

/*Table structure for table `preprocesstreatment` */

DROP TABLE IF EXISTS `preprocesstreatment`;

CREATE TABLE `preprocesstreatment` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preprocesstreatment_ibfk_1` (`document_id`),
  CONSTRAINT `preprocesstreatment_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `preprocesstreatment` */

insert  into `preprocesstreatment`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(0,'none',NULL),
(1,'Multiple treatments',NULL),
(2,'Two viruses: HSV_HEF1a EGFP HT, HSV_HEF1a Cherry HT\r\n',NULL),
(3,'HSV_HEF1a EGFP HT\r\n',NULL),
(4,'HSV_HEF1α EGFP HT diluted 1:1',NULL),
(5,'HSV_HEF1α EGFP HT diluted 1:5',NULL),
(6,'HSV_HEF1α EGFP HT diluted 1:10\r\n',NULL),
(7,'HSV_HEF1α EGFP HT single spot inoculation\r\n',NULL),
(8,'HSV_hsyn1 EYFP (synaptic neuron specific promoter)',NULL),
(9,'cultured slice day 0',NULL),
(10,'cultured slice day 1\r\n',NULL),
(11,'cultured slice day 2',NULL),
(12,'cultured slice day 3',NULL),
(13,'cultured slice day 4',NULL),
(14,'Acute slice \r\n',NULL),
(15,'HSV_HEF1α EYFP ',NULL),
(16,'HSV_DLX_GFP ',NULL),
(17,'HSV-hSyn1-EYFP',NULL);

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

/*Table structure for table `specie` */

DROP TABLE IF EXISTS `specie`;

CREATE TABLE `specie` (
  `id` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `specie` */

insert  into `specie`(`id`,`name`) values 
(1,'Human'),
(2,'Mouse'),
(3,'Human Surgical'),
(4,'mouse decap scoop'),
(5,'mouse acute slice');

/*Table structure for table `specimen` */

DROP TABLE IF EXISTS `specimen`;

CREATE TABLE `specimen` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(255) NOT NULL,
  `specie` smallint(11) DEFAULT NULL,
  `additional_identifier` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `lims_number` int(11) DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `preprocess_treatment` smallint(6) DEFAULT '0',
  `fixative` smallint(6) DEFAULT '0',
  `fixation_method` smallint(6) DEFAULT '0',
  `brain_region_dissection` varchar(255) DEFAULT NULL,
  `postfix_protocol` smallint(4) DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `date_embedded` date DEFAULT NULL,
  `cryoprotection_protocol` smallint(4) DEFAULT '0',
  `freezing_protocol` smallint(4) DEFAULT '0',
  `substitution_protocol` smallint(4) DEFAULT '0',
  `infiltration_protocol` smallint(4) DEFAULT '0',
  `embedding_protocol` smallint(4) DEFAULT '0',
  PRIMARY KEY (`process_id`),
  KEY `fixation_method` (`fixation_method`),
  KEY `fixative` (`fixative`),
  KEY `postfix_protocol` (`postfix_protocol`),
  KEY `cryoprotection_protocol` (`cryoprotection_protocol`),
  KEY `freezing_protocol` (`freezing_protocol`),
  KEY `substitution_protocol` (`substitution_protocol`),
  KEY `infiltration_protocol` (`infiltration_protocol`),
  KEY `embedding_protocol` (`embedding_protocol`),
  KEY `preprocess_treatment` (`preprocess_treatment`),
  KEY `species` (`specie`),
  CONSTRAINT `specimen_ibfk_1` FOREIGN KEY (`fixation_method`) REFERENCES `fixmethod` (`id`),
  CONSTRAINT `specimen_ibfk_10` FOREIGN KEY (`specie`) REFERENCES `specie` (`id`),
  CONSTRAINT `specimen_ibfk_2` FOREIGN KEY (`fixative`) REFERENCES `fixative` (`id`),
  CONSTRAINT `specimen_ibfk_3` FOREIGN KEY (`postfix_protocol`) REFERENCES `postfix` (`id`),
  CONSTRAINT `specimen_ibfk_4` FOREIGN KEY (`cryoprotection_protocol`) REFERENCES `cryoprotection` (`id`),
  CONSTRAINT `specimen_ibfk_5` FOREIGN KEY (`freezing_protocol`) REFERENCES `freezeprotocol` (`id`),
  CONSTRAINT `specimen_ibfk_6` FOREIGN KEY (`substitution_protocol`) REFERENCES `substitution` (`id`),
  CONSTRAINT `specimen_ibfk_7` FOREIGN KEY (`infiltration_protocol`) REFERENCES `infiltration` (`id`),
  CONSTRAINT `specimen_ibfk_8` FOREIGN KEY (`embedding_protocol`) REFERENCES `embedding` (`id`),
  CONSTRAINT `specimen_ibfk_9` FOREIGN KEY (`preprocess_treatment`) REFERENCES `preprocesstreatment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=875 DEFAULT CHARSET=utf8;

/*Data for the table `specimen` */

insert  into `specimen`(`process_id`,`specimen_id`,`specie`,`additional_identifier`,`age`,`lims_number`,`death_date`,`preprocess_treatment`,`fixative`,`fixation_method`,`brain_region_dissection`,`postfix_protocol`,`date_received`,`date_embedded`,`cryoprotection_protocol`,`freezing_protocol`,`substitution_protocol`,`infiltration_protocol`,`embedding_protocol`) values 
(784,'223480',2,'','',NULL,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-02-06',0,0,6,1,2),
(785,'223480',2,'','',NULL,'2016-02-04',0,1,1,'v1',6,'2016-02-04','1900-01-01',0,-1,6,1,2),
(786,'223480',2,'','',NULL,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-03-01',0,0,6,1,2),
(787,'223482',2,'','',NULL,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-02-06',0,0,6,1,2),
(788,'223482',2,'','',NULL,'2016-02-04',0,1,1,'v1',6,'2016-02-04','1900-01-01',0,-1,6,3,2),
(789,'223482',2,'','',NULL,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-03-01',0,-1,6,3,2),
(790,'081015a',1,'Human Surgical','',NULL,'1900-01-01',0,1,0,'LTC',6,'1900-01-01','2016-02-06',0,5,-1,-1,2),
(791,'081015a',1,'Human Surgical','',NULL,'1900-01-01',0,1,0,'LTC',6,'2016-02-04','2016-02-06',0,0,6,1,1),
(792,'SC272',2,'','',NULL,'1900-01-01',-1,-1,0,'',8,'2016-02-24','1900-01-01',0,0,8,-1,-1),
(793,'SC365',2,'','',NULL,'1900-01-01',-1,-1,0,'',8,'2016-02-24','1900-01-01',0,0,8,-1,-1),
(794,'239673',2,'Rorb YFP','',NULL,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(795,'239900',2,'Scnn1a YFP','',NULL,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(796,'241119',2,'Rorb tdT','',NULL,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(797,'241665',2,'Scnn1a tdT','',NULL,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(798,'SC02216_1',2,'','',NULL,'1900-01-01',-1,-1,0,'',8,'2016-02-25','1900-01-01',0,0,8,3,2),
(799,'SC022316_2',2,'','',NULL,'1900-01-01',-1,-1,0,'',8,'2016-02-25','1900-01-01',0,0,8,3,2),
(800,'SC022316_3',2,'','',NULL,'1900-01-01',-1,-1,0,'',8,'2016-02-25','1900-01-01',0,0,8,3,2),
(801,'SC367',2,'','',NULL,'1900-01-01',-1,-1,0,'',8,'2016-04-06','2016-04-15',0,1,3,2,4),
(802,'SC367',2,'','',NULL,'1900-01-01',-1,-1,0,'',9,'2016-04-06','2016-04-15',0,1,3,2,4),
(803,'SC367',2,'','',NULL,'1900-01-01',-1,-1,0,'',6,'2016-04-06','2016-04-15',0,1,3,2,4),
(804,'236780',2,'Scnn1a tdT','',NULL,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(805,'239674',2,'Rorb YFP','',NULL,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(806,'239902',2,'Scnn1a YFP','',NULL,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(807,'239923',2,'Rorb tdT','',NULL,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(808,'233604',2,'WT (C57BL/6)','',NULL,'2016-05-18',0,2,2,'v1',4,'2016-05-18','2016-05-24',3,6,3,6,4),
(809,'231937',2,'Parvalbumin tdT','',NULL,'2016-05-18',0,2,2,'v1',4,'2016-05-18','2016-05-24',3,6,3,6,4),
(810,'H16.03.001',3,'cultured virus','',NULL,'1900-01-01',8,2,0,'',3,'2016-05-26','2016-06-07',3,4,3,2,4),
(811,'H16.03.001',3,'cultured virus','',NULL,'1900-01-01',8,2,0,'',3,'2016-05-26','2016-06-07',3,6,3,2,4),
(812,'H16.03.001',3,'cultured virus','',NULL,'1900-01-01',2,2,0,'',3,'2016-05-26','2016-06-07',3,4,3,2,4),
(813,'246930',2,'Scnn1a tdT','p64',NULL,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,4,3,2,4),
(814,'246930',2,'Scnn1a tdT','p64',NULL,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,6,3,2,4),
(815,'246951',2,'Rorb tdT','p64',NULL,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,4,3,2,4),
(816,'246951',2,'Rorb tdT','p64',NULL,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,6,3,2,4),
(817,'246934',2,'Scnn1a tdT','p99',NULL,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(818,'246935',2,'Scnn1a tdT','p99',NULL,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(819,'247514',2,'Rorb tdT','p96',NULL,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(820,'247516',2,'Rorb tdT','p96',NULL,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(821,'H16.03.005',3,'HSV_hEF1?G6s_P2A nls-dTom 6/28','',NULL,'1900-01-01',3,2,0,'',4,'2016-07-11','2016-07-12',3,4,3,2,4),
(822,'H16.03.005',3,'HSV_hSyn1_EYFP 6/29','',NULL,'1900-01-01',8,2,0,'',4,'2016-07-11','2016-07-12',3,4,3,2,4),
(823,'H16.06.008',3,'HSV_hEF1?_EGFP','',NULL,'1900-01-01',3,2,0,'',4,'2016-07-12','2016-08-02',3,4,3,2,4),
(824,'H16.06.009',3,'HSV_hEF1?_EGFP','',NULL,'1900-01-01',3,2,0,'',4,'2016-07-13','2016-08-02',3,4,3,2,4),
(825,'H16.06.009',3,'HSV_hEF1?_EGFP','',NULL,'1900-01-01',3,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(826,'H16.03.001',3,'HSV_hEF1?_EGFP','',NULL,'1900-01-01',3,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(827,'H16.06.010',3,'Acute slices','',NULL,'1900-01-01',14,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(828,'H16.06.010',3,'Day 0 cultured slice','',NULL,'1900-01-01',9,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(829,'H16.06.011',3,'Notched','',NULL,'1900-01-01',15,2,0,'',4,'1900-01-01','2016-08-30',3,1,3,2,4),
(830,'H16.06.011',3,'Notched','',NULL,'1900-01-01',16,2,0,'',4,'1900-01-01','2016-08-30',3,1,3,2,4),
(831,'H16.06.011',3,'Brainphys media - looks bad','',NULL,'1900-01-01',16,2,0,'',4,'1900-01-01','2016-08-30',3,1,3,2,4),
(832,'271152',2,'Chat tdT','p38',NULL,'2016-08-17',0,2,2,'v1',4,'2016-08-17','2016-08-24',3,4,3,2,4),
(833,'263885',2,'NdnF tdT','p62',NULL,'2016-08-17',0,2,2,'v1',4,'2016-08-17','2016-08-24',3,4,3,2,4),
(834,'259292',2,'Scnn1a_Tg2 tdT','p78',NULL,'2016-08-17',0,2,2,'v1',4,'2016-08-17','2016-08-24',3,4,3,2,4),
(835,'262849',2,'Chrna2-Cre_OE25;Pvalb_2A_DreO;Ai66D','',NULL,'2016-08-23',0,2,2,'v1',4,'2016-08-23','2016-08-30',3,4,3,2,4),
(836,'270923',2,'Nos1/sst/FlptdT','p55',NULL,'2016-08-23',0,2,2,'v1',4,'2016-08-23','2016-08-30',3,4,3,2,4),
(837,'268034',5,'Scnn1a Tg3 tdT','p55',NULL,'2016-09-07',0,0,3,'',0,'2016-09-07','2016-09-09',0,4,3,2,4),
(838,'267682',5,'Htr3a tdT','p56',NULL,'2016-09-07',0,0,3,'',0,'2016-09-07','2016-09-09',0,4,3,2,4),
(839,'270009',4,'Pvalb tdT','p45',NULL,'2016-09-07',0,0,3,'',0,'2016-09-07','2016-09-09',0,4,3,2,4),
(840,'H16.03.007',3,'full titer','',NULL,'1900-01-01',3,2,0,'',4,'1900-01-01','2016-09-13',3,4,3,2,4),
(841,'H16.03.007',3,'1:10 dilution','',NULL,'1900-01-01',6,2,0,'',4,'1900-01-01','2016-09-13',3,4,3,2,4),
(842,'270905',2,'Scnn1a_Tg2 tdT','',NULL,'1900-01-01',0,2,2,'v1',4,'2016-10-12','2016-10-18',3,4,3,2,4),
(843,'270905',2,'Scnn1a_Tg2 tdT','',NULL,'1900-01-01',0,2,2,'v1',4,'2016-10-12','2016-10-18',3,7,3,2,4),
(844,'270907',2,'Scnn1a_Tg2 tdT','',NULL,'1900-01-01',0,2,2,'v1',4,'2016-10-12','2016-10-18',3,4,3,2,4),
(845,'270907',2,'Scnn1a_Tg2 tdT','',NULL,'1900-01-01',0,2,2,'v1',4,'2016-10-12','2016-10-18',3,7,3,2,4),
(872,'NEW SPECIMEN',1,NULL,NULL,NULL,NULL,-1,0,-1,NULL,-1,NULL,NULL,-1,-1,-1,-1,-1),
(874,'H16.06.13',3,NULL,NULL,NULL,NULL,17,3,0,NULL,8,'2016-12-13','2016-12-18',0,0,8,1,6);

/*Table structure for table `substitution` */

DROP TABLE IF EXISTS `substitution`;

CREATE TABLE `substitution` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL COMMENT 'Reference to documents able',
  PRIMARY KEY (`id`),
  KEY `substitution_ibfk_1` (`document_id`),
  CONSTRAINT `substitution_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `substitution` */

insert  into `substitution`(`id`,`protocol`,`document_id`) values 
(-1,'N/A',NULL),
(1,'Acetone AFS 3 days',NULL),
(2,'acetone	quick freeze sub',NULL),
(3,'1.5% uranyl acetate in acetone	AFS	3 days',NULL),
(4,'1.5% uranyl acetate in acetone	quick freeze sub',NULL),
(5,'3% uranyl acetate in acetone	ambient',NULL),
(6,'1.5% uranyl acetate in ethyl alcohol	ambient',NULL),
(7,'3% uranyl acetate in ethyl alcohol	ambient',NULL),
(8,'ethyl alcohol (no UA)	ambient',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`user_name`,`created`) values 
(27,'Totte','2016-10-07 09:00:08'),
(30,'Sarah','2016-10-10 14:32:46'),
(34,'Kristy Parker','2016-10-13 12:39:17'),
(39,'Test','2016-10-17 16:33:12'),
(40,'Olga','2016-12-12 13:14:46');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
