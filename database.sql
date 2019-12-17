/*
SQLyog Ultimate
MySQL - 10.1.36-MariaDB : Database - db_mca_freddy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `inbox` */

DROP TABLE IF EXISTS `inbox`;

CREATE TABLE `inbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_id` text,
  `pesan` text,
  `account_id` text,
  `waktu_masuk` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `inbox` */

insert  into `inbox`(`id`,`message_id`,`pesan`,`account_id`,`waktu_masuk`,`status`) values 
(1,'656399567411216406','data semua player','620628251018002443','2019-12-17 03:37:32',1),
(2,'656399575908876361','Data Player\n\nNama	: Rama Pradana\nNick	: zulu\nUmur	: 20\nAsal	: Indonesia','656198520021450752','2019-12-17 03:37:34',0),
(3,'656399622603931648','data player #zulu','620628251018002443','2019-12-17 03:37:45',1),
(4,'656399634582732800','Data Player\n\nNama	: Rama Pradana\nNick	: zulu\nUmur	: 20\nAsal	: Indonesia','656198520021450752','2019-12-17 03:37:48',0),
(5,'656399723422285843','tambah player #Gus Arisna #wannacry #20 #Indo','620628251018002443','2019-12-17 03:38:09',1),
(6,'656399743567790091','Tambah Player Berhasil\n\nNama	: Gus Arisna \nNick	: wannacry \nUmur	: 20 \nAsal	: Indo','656198520021450752','2019-12-17 03:38:14',0),
(7,'656399842825863178','data semua player','620628251018002443','2019-12-17 03:38:38',1),
(8,'656399852573425665','Data Player\n\nNama	: Rama Pradana\nNick	: zulu\nUmur	: 20\nAsal	: Indonesia\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo','656198520021450752','2019-12-17 03:38:40',0),
(9,'656399915169349642','hapus player #zulu','620628251018002443','2019-12-17 03:38:55',1),
(10,'656399928372887577','Hapus Player Berhasil\n\nNick	: zulu','656198520021450752','2019-12-17 03:38:58',0),
(11,'656399958060171264','data semua player','620628251018002443','2019-12-17 03:39:05',1),
(12,'656399970311864340','Data Player\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo','656198520021450752','2019-12-17 03:39:08',0),
(13,'656400937707110430','','435433927025360896','2019-12-17 03:42:59',1),
(14,'656400952999411722','Data Player\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo','656198520021450752','2019-12-17 03:43:02',0),
(15,'656400987895889951','data semua player','435433927025360896','2019-12-17 03:43:11',1),
(16,'656401003595300874','Data Player\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo','656198520021450752','2019-12-17 03:43:14',0);

/*Table structure for table `outbox` */

DROP TABLE IF EXISTS `outbox`;

CREATE TABLE `outbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` text,
  `message_id` text,
  `pesan` text,
  `waktu_masuk` datetime DEFAULT NULL,
  `waktu_kirim` datetime DEFAULT NULL,
  `status_dikirim` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `outbox` */

insert  into `outbox`(`id`,`account_id`,`message_id`,`pesan`,`waktu_masuk`,`waktu_kirim`,`status_dikirim`) values 
(1,'620628251018002443','656399567411216406','Data Player\n\nNama	: Rama Pradana\nNick	: zulu\nUmur	: 20\nAsal	: Indonesia\n\n','2019-12-17 03:37:32','2019-12-17 03:37:34',1),
(2,'620628251018002443','656399622603931648','Data Player\n\nNama	: Rama Pradana\nNick	: zulu\nUmur	: 20\nAsal	: Indonesia\n\n','2019-12-17 03:37:45','2019-12-17 03:37:48',1),
(3,'620628251018002443','656399723422285843','Tambah Player Berhasil\n\nNama	: Gus Arisna \nNick	: wannacry \nUmur	: 20 \nAsal	: Indo\n\n','2019-12-17 03:38:09','2019-12-17 03:38:12',1),
(4,'620628251018002443','656399842825863178','Data Player\n\nNama	: Rama Pradana\nNick	: zulu\nUmur	: 20\nAsal	: Indonesia\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo\n\n','2019-12-17 03:38:38','2019-12-17 03:38:40',1),
(5,'620628251018002443','656399915169349642','Hapus Player Berhasil\n\nNick	: zulu','2019-12-17 03:38:55','2019-12-17 03:38:58',1),
(6,'620628251018002443','656399958060171264','Data Player\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo\n\n','2019-12-17 03:39:05','2019-12-17 03:39:08',1),
(7,'435433927025360896','656400937707110430','Data Player\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo\n\n','2019-12-17 03:42:59','2019-12-17 03:43:02',1),
(8,'435433927025360896','656400987895889951','Data Player\n\nNama	: Gus Arisna\nNick	: wannacry\nUmur	: 20\nAsal	: Indo\n\n','2019-12-17 03:43:11','2019-12-17 03:43:14',1);

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `asal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `player` */

insert  into `player`(`id`,`nama`,`nickname`,`umur`,`asal`) values 
(8,'Gus Arisna','wannacry',20,'Indo');

/*Table structure for table `processing` */

DROP TABLE IF EXISTS `processing`;

CREATE TABLE `processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` text,
  `tipe` int(11) DEFAULT NULL COMMENT '1 select, 2 insert, 3 update, 4 delete',
  `kode` text,
  `query` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `processing` */

insert  into `processing`(`id`,`menu`,`tipe`,`kode`,`query`) values 
(1,'Lihat Data Semua Player',1,'data semua player','SELECT * FROM player'),
(2,'Lihat Data Player',1,'data player #nickname','SELECT * FROM player WHERE nickname LIKE \'%?%\''),
(3,'Tambah Player Baru',2,'tambah player #nama #nickname #umur #asal','INSERT INTO player(nama, nickname, umur, asal) VALUES (\'?\', \'?\', ?, \'?\')'),
(4,'Hapus Player',4,'hapus player #nickname','DELETE FROM player WHERE nickname = \'?\'');

/* Trigger structure for table `outbox` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `updateInbox` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `updateInbox` AFTER INSERT ON `outbox` FOR EACH ROW BEGIN
	UPDATE inbox SET inbox.`status`='1' WHERE account_id=new.account_id AND message_id=new.message_id;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
