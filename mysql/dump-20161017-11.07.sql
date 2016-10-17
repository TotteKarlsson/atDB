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
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `freeze_type` int(11) NOT NULL DEFAULT '0',
  `process_id` int(11) DEFAULT NULL COMMENT 'This ID relates a block with a specimen process_id in the  specimen table',
  PRIMARY KEY (`id`),
  KEY `block_ibfk_1` (`created_by`),
  KEY `process_id` (`process_id`),
  CONSTRAINT `block_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `block_ibfk_2` FOREIGN KEY (`process_id`) REFERENCES `specimen` (`process_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8;

/*Data for the table `block` */

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

/*Table structure for table `blockstatus` */

DROP TABLE IF EXISTS `blockstatus`;

CREATE TABLE `blockstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `blockstatus` */

insert  into `blockstatus`(`id`,`status`) values 
(0,'NOT_SET'),
(1,'NEW'),
(2,'PHASED'),
(3,'TRIMMED'),
(4,'DEPLETED');

/*Table structure for table `cryoprotection` */

DROP TABLE IF EXISTS `cryoprotection`;

CREATE TABLE `cryoprotection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cryoprotection` */

insert  into `cryoprotection`(`id`,`protocol`) values 
(0,'none'),
(1,'Glycerol series 	10%, 20%, 30% Glycerol in PBS	1 hour each'),
(2,'Sucrose series	10%, 20%, 30% Glycerol in PBS	1 hour each'),
(3,'Glycerol series 	10%, 20%, 30% glycerol in 0.1M sodium acetate pH 7.4	10% 30min, 20% 30min,30% 30min, overnight ');

/*Table structure for table `embedding` */

DROP TABLE IF EXISTS `embedding`;

CREATE TABLE `embedding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `embedding` */

insert  into `embedding`(`id`,`protocol`) values 
(0,'Combination'),
(1,'gelatin capsule'),
(2,'flat gelatin capsule with sealant'),
(3,'flow through capsules'),
(4,'beem capsules'),
(5,'punched aclar sandwich\r\n');

/*Table structure for table `fixative` */

DROP TABLE IF EXISTS `fixative`;

CREATE TABLE `fixative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `fixative` */

insert  into `fixative`(`id`,`protocol`) values 
(0,'None- live tissue'),
(1,'4%PFA + 1% Glutaraldehyde in PB'),
(2,'2%PFA + 2% Glutaraldehyde in PB\r\n'),
(3,'4%PFA in PB\r\n');

/*Table structure for table `fixmethod` */

DROP TABLE IF EXISTS `fixmethod`;

CREATE TABLE `fixmethod` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `fixmethod` */

insert  into `fixmethod`(`id`,`protocol`) values 
(0,'Immersion fixed'),
(1,'Perfused with flush'),
(2,'Perfused without flush'),
(3,'none - not fixed');

/*Table structure for table `freezeprotocol` */

DROP TABLE IF EXISTS `freezeprotocol`;

CREATE TABLE `freezeprotocol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `freezeprotocol` */

insert  into `freezeprotocol`(`id`,`protocol`) values 
(0,'No freezing'),
(1,'High pressure freezer with BSA filler\r\n'),
(2,' High pressure freezer with 1-hexadecene filler\r\n'),
(3,'High pressure freezer with isooctane filler\r\n'),
(4,'High pressure freezer with PVP filler\r\n'),
(5,'High pressure freezer with fillers\r\n'),
(6,'Plunge freeze into acetone in AFS\r\n');

/*Table structure for table `infiltration` */

DROP TABLE IF EXISTS `infiltration`;

CREATE TABLE `infiltration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `infiltration` */

insert  into `infiltration`(`id`,`protocol`) values 
(0,'N/A'),
(1,'room temperature LR White 	1:1, 2:1, pure, pure, pure	room temp'),
(2,'Lowicryl	resin:acetone 1:1, 2:1, pure, pure, pure	-45'),
(3,'10% LR white 90% Lowicryl	resin:acetone 1:1, 2:1, pure, pure, pure	-45'),
(4,'mixed lowicryl/LR white dilutions	resin:acetone 1:1, 2:1, pure, pure, pure	-45');

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` mediumtext NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=utf8;

/*Data for the table `note` */

insert  into `note`(`id`,`note`,`created_on`,`created_by`) values 
(642,'Ribbon Note..','2016-10-11 12:48:58',27),
(654,'Ribbon Note..','2016-10-11 13:01:21',27),
(656,'Ribbon Note..','2016-10-11 13:15:52',27),
(660,'Ribbon Note..','2016-10-11 13:26:20',27);

/*Table structure for table `postfix` */

DROP TABLE IF EXISTS `postfix`;

CREATE TABLE `postfix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `postfix` */

insert  into `postfix`(`id`,`protocol`) values 
(0,'none'),
(1,'4%PFA + 2% Glutaraldehyde in PB 1-3 hour'),
(2,'4%PFA + 2% Glutaraldehyde in PB Overnight'),
(3,'2%PFA + 2% Glutaraldehyde in PB\r\n 1-3 hour'),
(4,'2%PFA + 2% Glutaraldehyde in PB\r\n Overnight'),
(5,'4%PFA + 1% Glutaraldehyde in PB 1-3 hour'),
(6,'4%PFA + 1% Glutaraldehyde in PB Overnight'),
(7,'4%PFA 1-3 hour'),
(8,'4%PFA Overnight'),
(9,'4%PFA, then shipped 4%PFA, 1%glut\r\n');

/*Table structure for table `preprocesstreatment` */

DROP TABLE IF EXISTS `preprocesstreatment`;

CREATE TABLE `preprocesstreatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `preprocesstreatment` */

insert  into `preprocesstreatment`(`id`,`protocol`) values 
(0,'N/A'),
(1,'Multiple treatments'),
(2,'Two viruses: HSV_HEF1a EGFP HT, HSV_HEF1a Cherry HT\r\n'),
(3,'HSV_HEF1a EGFP HT\r\n'),
(4,'HSV_HEF1α EGFP HT diluted 1:1'),
(5,'HSV_HEF1α EGFP HT diluted 1:5'),
(6,'HSV_HEF1α EGFP HT diluted 1:10\r\n'),
(7,'HSV_HEF1α EGFP HT single spot inoculation\r\n'),
(8,'HSV_hsyn1 EYFP (synaptic neuron specific promoter)'),
(9,'cultured slice day 0'),
(10,'cultured slice day 1\r\n'),
(11,'cultured slice day 2'),
(12,'cultured slice day 3'),
(13,'cultured slice day 4'),
(14,'Acute slice \r\n'),
(15,'HSV_HEF1α EYFP '),
(16,'HSV_DLX_GFP ');

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

/*Table structure for table `species` */

DROP TABLE IF EXISTS `species`;

CREATE TABLE `species` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `species` */

insert  into `species`(`id`,`name`) values 
(1,'Human'),
(2,'Mouse'),
(3,'Penguin');

/*Table structure for table `specimen` */

DROP TABLE IF EXISTS `specimen`;

CREATE TABLE `specimen` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen_id` varchar(255) NOT NULL,
  `species` int(11) DEFAULT NULL,
  `additional_identifier` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `lims_number` int(11) DEFAULT NULL,
  `death_date` date DEFAULT '1900-01-01',
  `preprocess_treatment` smallint(6) DEFAULT '0',
  `fixative` smallint(6) DEFAULT '0',
  `fixation_method` smallint(6) DEFAULT '0',
  `brain_region_dissection` varchar(255) DEFAULT NULL,
  `postfix_protocol` tinyint(4) DEFAULT NULL,
  `date_received` date DEFAULT '1900-01-01',
  `date_embedded` date DEFAULT '1900-01-01',
  `cryoprotection_protocol` tinyint(4) DEFAULT '0',
  `freezing_protocol` tinyint(4) DEFAULT '0',
  `substitution_protocol` tinyint(4) DEFAULT '0',
  `infiltration_protocol` tinyint(4) DEFAULT '0',
  `embedding_protocol` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`process_id`),
  KEY `fixation_method` (`fixation_method`),
  CONSTRAINT `specimen_ibfk_1` FOREIGN KEY (`fixation_method`) REFERENCES `fixmethod` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `specimen` */

insert  into `specimen`(`process_id`,`specimen_id`,`species`,`additional_identifier`,`age`,`lims_number`,`death_date`,`preprocess_treatment`,`fixative`,`fixation_method`,`brain_region_dissection`,`postfix_protocol`,`date_received`,`date_embedded`,`cryoprotection_protocol`,`freezing_protocol`,`substitution_protocol`,`infiltration_protocol`,`embedding_protocol`) values 
(25,'223480',2,'','',223480,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-02-06',0,0,6,1,2),
(26,'223480',2,'','',223480,'2016-02-04',0,1,1,'v1',6,'2016-02-04','1900-01-01',0,0,6,1,2),
(27,'223480',2,'','',223480,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-03-01',0,0,6,1,2),
(28,'223482',2,'','',223482,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-02-06',0,0,6,1,2),
(29,'223482',2,'','',223482,'2016-02-04',0,1,1,'v1',6,'2016-02-04','1900-01-01',0,0,6,3,2),
(30,'223482',2,'','',223482,'2016-02-04',0,1,1,'v1',6,'2016-02-04','2016-03-01',0,0,6,3,2),
(31,'081015a',1,'Human Surgical','',-1,'1900-01-01',0,1,0,'LTC',6,'1900-01-01','2016-02-06',0,5,0,0,2),
(32,'081015a',1,'Human Surgical','',-1,'1900-01-01',0,1,0,'LTC',6,'2016-02-04','2016-02-06',0,0,6,1,1),
(33,'SC272',2,'','',-1,'1900-01-01',0,0,0,'',8,'2016-02-24','1900-01-01',0,0,8,0,0),
(34,'SC365',2,'','',-1,'1900-01-01',0,0,0,'',8,'2016-02-24','1900-01-01',0,0,8,0,0),
(35,'239673',2,'Rorb YFP','',239673,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(36,'239900',2,'Scnn1a YFP','',239900,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(37,'241119',2,'Rorb tdT','',241119,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(38,'241665',2,'Scnn1a tdT','',241665,'2016-03-28',0,2,2,'v1',4,'2016-03-28','2016-04-06',0,1,1,4,3),
(39,'SC02216_1',2,'','',-1,'1900-01-01',0,0,0,'',8,'2016-02-25','1900-01-01',0,0,8,3,2),
(40,'SC022316_2',2,'','',-1,'1900-01-01',0,0,0,'',8,'2016-02-25','1900-01-01',0,0,8,3,2),
(41,'SC022316_3',2,'','',-1,'1900-01-01',0,0,0,'',8,'2016-02-25','1900-01-01',0,0,8,3,2),
(42,'SC367',2,'','',-1,'1900-01-01',0,0,0,'',8,'2016-04-06','2016-04-15',0,1,3,2,4),
(43,'SC367',2,'','',-1,'1900-01-01',0,0,0,'',9,'2016-04-06','2016-04-15',0,1,3,2,4),
(44,'SC367',2,'','',-1,'1900-01-01',0,0,0,'',6,'2016-04-06','2016-04-15',0,1,3,2,4),
(45,'236780',2,'Scnn1a tdT','',236780,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(46,'239674',2,'Rorb YFP','',239674,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(47,'239902',2,'Scnn1a YFP','',239902,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(48,'239923',2,'Rorb tdT','',239923,'2016-04-25',0,2,2,'v1',4,'2016-04-29','2016-05-03',0,1,3,2,4),
(49,'233604',2,'WT (C57BL/6)','',233604,'2016-05-18',0,2,2,'v1',4,'2016-05-18','2016-05-24',3,6,3,6,4),
(50,'246930',2,'Scnn1a tdT','p64',246930,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,4,3,2,4),
(51,'246930',2,'Scnn1a tdT','p64',246930,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,6,3,2,4),
(52,'246951',2,'Rorb tdT','p64',246951,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,4,3,2,4),
(53,'246951',2,'Rorb tdT','p64',246951,'2016-06-01',0,2,2,'v1',4,'2016-06-01','2016-06-07',3,6,3,2,4),
(54,'246934',2,'Scnn1a tdT','p99',246934,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(55,'246935',2,'Scnn1a tdT','p99',246935,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(56,'247514',2,'Rorb tdT','p96',247514,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(57,'247516',2,'Rorb tdT','p96',247516,'2016-07-06',0,2,2,'v1',4,'2016-07-06','2016-07-12',3,4,3,2,4),
(58,'H16.03.005',1,'HSV_hEF1?G6s_P2A nls-dTom 6/28','',-1,'1900-01-01',3,2,0,'',4,'2016-07-11','2016-07-12',3,4,3,2,4),
(59,'H16.03.005',1,'HSV_hSyn1_EYFP 6/29','',-1,'1900-01-01',8,2,0,'',4,'2016-07-11','2016-07-12',3,4,3,2,4),
(60,'H16.06.008',1,'HSV_hEF1?_EGFP','',-1,'1900-01-01',3,2,0,'',4,'2016-07-12','2016-08-02',3,4,3,2,4),
(61,'H16.06.009',1,'HSV_hEF1?_EGFP','',-1,'1900-01-01',3,2,0,'',4,'2016-07-13','2016-08-02',3,4,3,2,4),
(62,'H16.06.009',1,'HSV_hEF1?_EGFP','',-1,'1900-01-01',3,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(63,'H16.03.001',1,'HSV_hEF1?_EGFP','',-1,'1900-01-01',3,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(64,'H16.06.010',1,'Acute slices','',-1,'1900-01-01',14,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(65,'H16.06.010',1,'Day 0 cultured slice','',-1,'1900-01-01',9,2,0,'',4,'1900-01-01','2016-08-02',3,1,3,2,4),
(66,'H16.06.011',1,'Notched','',-1,'1900-01-01',15,2,0,'',4,'1900-01-01','2016-08-30',3,1,3,2,4),
(67,'H16.06.011',1,'Notched','',-1,'1900-01-01',16,2,0,'',4,'1900-01-01','2016-08-30',3,1,3,2,4),
(68,'H16.06.011',1,'Brainphys media - looks bad','',-1,'1900-01-01',16,2,0,'',4,'1900-01-01','2016-08-30',3,1,3,2,4),
(69,'271152',2,'Chat tdT','p38',271152,'2016-08-17',0,2,2,'v1',4,'2016-08-17','2016-08-24',3,4,3,2,4),
(70,'263885',2,'NdnF tdT','p62',263885,'2016-08-17',0,2,2,'v1',4,'2016-08-17','2016-08-24',3,4,3,2,4),
(71,'259292',2,'Scnn1a_Tg2 tdT','p78',259292,'2016-08-17',0,2,2,'v1',4,'2016-08-17','2016-08-24',3,4,3,2,4),
(72,'262849',2,'Chrna2-Cre_OE25;Pvalb_2A_DreO;Ai66D','',262849,'2016-08-23',0,2,2,'v1',4,'2016-08-23','2016-08-30',3,4,3,2,4),
(73,'270923',2,'Nos1/sst/FlptdT','p55',270923,'2016-08-23',0,2,2,'v1',4,'2016-08-23','2016-08-30',3,4,3,2,4),
(74,'268034',2,'Scnn1a Tg3 tdT','p55',268034,'2016-09-07',0,0,3,'',0,'2016-09-07','2016-09-09',0,4,3,2,4),
(75,'267682',2,'Htr3a tdT','p56',267682,'2016-09-07',0,0,3,'',0,'2016-09-07','2016-09-09',0,4,3,2,4),
(76,'270009',2,'Pvalb tdT','p45',270009,'2016-09-07',0,0,3,'',0,'2016-09-07','2016-09-09',0,4,3,2,4),
(77,'H16.03.007',1,'full titer','',-1,'1900-01-01',3,2,0,'',4,'1900-01-01','2016-09-13',3,4,3,2,4),
(78,'H16.03.007',1,'1:10 dilution','',-1,'1900-01-01',6,2,0,'',4,'1900-01-01','2016-09-13',3,4,3,2,4);

/*Table structure for table `substitution` */

DROP TABLE IF EXISTS `substitution`;

CREATE TABLE `substitution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `substitution` */

insert  into `substitution`(`id`,`protocol`) values 
(1,'acetone AFS 3 days'),
(2,'acetone	quick freeze sub'),
(3,'1.5% uranyl acetate in acetone	AFS	3 days'),
(4,'1.5% uranyl acetate in acetone	quick freeze sub'),
(5,'3% uranyl acetate in acetone	ambient'),
(6,'1.5% uranyl acetate in ethyl alcohol	ambient'),
(7,'3% uranyl acetate in ethyl alcohol	ambient'),
(8,'ethyl alcohol (no UA)	ambient'),
(9,'N/A');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`user_name`,`created`) values 
(27,'Totte','2016-10-07 09:00:08'),
(30,'Sarah','2016-10-10 14:32:46'),
(34,'Kristy Parker','2016-10-13 12:39:17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
