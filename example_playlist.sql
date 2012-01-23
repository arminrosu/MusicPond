# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: i.friendsadvertising.ro (MySQL 5.1.41-3ubuntu12.10-log)
# Database: c17fringR0
# Generation Time: 2012-01-23 16:27:27 +0200
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table musicpond
# ------------------------------------------------------------

DROP TABLE IF EXISTS `musicpond`;

CREATE TABLE `musicpond` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` varchar(11) NOT NULL DEFAULT '' COMMENT 'YouTube video ID',
  `title` varchar(100) DEFAULT NULL,
  `time_added` timestamp NULL DEFAULT NULL,
  `time_played` timestamp NULL DEFAULT NULL COMMENT 'Used for "Now Playing"',
  `time_removed` timestamp NULL DEFAULT NULL,
  `skips` int(11) NOT NULL DEFAULT '0',
  `plays` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) DEFAULT NULL COMMENT 'seconds',
  `added_by` int(11) DEFAULT NULL COMMENT 'For future use',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `musicpond` WRITE;
/*!40000 ALTER TABLE `musicpond` DISABLE KEYS */;

INSERT INTO `musicpond` (`id`, `video_id`, `title`, `time_added`, `time_played`, `time_removed`, `skips`, `plays`, `duration`, `added_by`)
VALUES
	(1,'WBQODlM__14','AC/DC - War Machine','2011-11-09 12:01:26','2011-11-21 10:28:35','2011-12-12 16:40:08',16,2,187,NULL),
	(2,'JI-o25K6B-E','Coldplay - Fix You','2011-11-09 12:02:03','2012-01-16 12:27:49',NULL,0,12,295,NULL),
	(3,'t_qPTyy4itI','The Smiths - Last Night I Dreamt That Somebody Loved Me','2011-11-09 12:02:03','2012-01-16 12:28:05',NULL,0,4,307,NULL),
	(4,'3phAqQeMMcc','Depeche mode - Judas','2011-11-09 12:02:04','2012-01-16 12:28:13',NULL,0,4,314,NULL),
	(5,'3qgn1Rc0YJ4','Morrissey - First of the gang to die','2011-11-09 12:02:04','2012-01-16 12:28:25',NULL,0,4,221,NULL),
	(6,'6NQlZT8Lyxc','Nightmare Of You - Dear Scene I Wish I Were Deaf','2011-11-09 12:02:04','2012-01-16 18:00:15',NULL,1,4,195,NULL),
	(7,'n7Oy6_CfjD0','Boy Kill Boy - Civil sin','2011-11-09 12:02:05','2012-01-23 15:40:24',NULL,0,5,236,NULL),
	(8,'3tMXxN9Tbjg','Surferosa - Royal Uniform','2011-11-09 12:02:05','2012-01-23 15:14:08',NULL,0,6,204,NULL),
	(9,'u_6eJkpGAYs','Belasco - Chloroform','2011-11-09 12:02:05','2012-01-18 09:52:48',NULL,0,5,174,NULL),
	(10,'E5fhax_wOs4','Cas Haley-Walking On The Moon','2011-11-09 12:02:05','2012-01-16 16:57:12',NULL,0,4,205,NULL),
	(11,'O1WPOjDQOHA','Persephone\'s Bees - Muzika Dlya Fil\'ma','2011-11-09 12:02:06','2012-01-13 19:29:20',NULL,0,4,344,NULL),
	(12,'K2Dl3VQ2K2U','Mystery Jets - Two Doors Down','2011-11-09 12:02:06','2012-01-16 18:16:20',NULL,1,4,211,NULL),
	(13,'caqnOJ8cQjk','Fly - Epik High','2011-11-09 12:02:06','2012-01-16 17:13:46',NULL,0,4,202,NULL),
	(14,'fvRVAGBeUEs','Chapel Club - Surfacing','2011-11-09 12:02:06','2012-01-16 15:53:26',NULL,0,4,236,NULL),
	(15,'4b04jq7NB1s','Joe Cocker - You Can Leave Your Hat On','2011-11-09 12:02:07','2012-01-16 16:51:35',NULL,0,4,260,NULL),
	(16,'GemKqzILV4w','Snow Patrol - Chasing Cars','2011-11-09 12:02:07','2012-01-16 15:57:22',NULL,0,4,222,NULL),
	(17,'DynmjYUGuRw','Hello (Club Edit) - Martin Solveig & Dragonette','2011-11-09 12:02:07','2012-01-16 18:19:51',NULL,1,4,215,NULL),
	(18,'x9j6DE6RnSk','Billy Idol - White wedding Lyrics','2011-11-09 12:02:08','2012-01-13 19:25:11',NULL,0,4,249,NULL),
	(19,'tW8FKkVnqng','LCD Soundsystem - I Can Change','2011-11-09 12:02:08','2012-01-23 15:13:57',NULL,0,5,355,NULL),
	(20,'ocQeP1UOwss','Violent Femmes- Blister in the Sun','2011-11-09 12:02:08','2012-01-16 16:45:40',NULL,0,4,148,NULL),
	(21,'Ns-fQRnm9sk','Iron Maiden - For the Greater Good of God','2011-11-09 12:02:08','2012-01-13 16:11:01','2012-01-13 16:19:35',0,3,565,NULL),
	(22,'0nrMUBWdpTs','David Bowie - Conversation Piece [Toy 2001]','2011-11-09 12:02:09','2012-01-16 16:10:05',NULL,0,4,233,NULL),
	(23,'eU8P0Ufwpl8','Cock Sparrer - England Belongs To Me','2011-11-09 12:02:09','2012-01-09 13:31:10',NULL,0,5,184,NULL),
	(24,'jXbu2CsWX0c','Vaski - Zombie Apocalypse (HQ)','2011-11-09 12:02:09','2012-01-16 16:18:20',NULL,0,4,152,NULL),
	(25,'DMMj1FrRFH4','Heroes del silencio - entre dos tierras','2011-11-09 12:02:09','2012-01-16 18:32:02',NULL,2,4,361,NULL),
	(26,'EW1gLkH-qjk','Parov Stelar | The Phantom','2011-11-09 12:02:10','2012-01-16 16:54:14',NULL,0,4,179,NULL),
	(27,'ccoQyr_-aYw','IGLIDE | Christina Aguilera | DUBSTEP','2011-11-09 12:02:10','2012-01-13 19:14:02',NULL,0,4,294,NULL),
	(28,'idDOW8JeR04','Billy Joel - Vienna','2011-11-09 12:02:10','2012-01-16 16:48:08',NULL,0,4,208,NULL),
	(29,'ZQ9hLOHj8ag','Chairlift - Bruises','2011-11-09 12:02:10','2012-01-16 16:41:39',NULL,0,4,241,NULL),
	(30,'_kE0pxRkMtQ','Groove Armada - Superstylin\'','2011-11-09 12:02:11','2012-01-16 16:13:58',NULL,0,4,260,NULL),
	(31,'vZYbEL06lEU','Lykke Li - I Follow Rivers (Director: Tarik Saleh)','2011-11-09 12:02:11','2012-01-16 10:53:50',NULL,0,4,248,NULL),
	(32,'NzCukmO4fhg','Das Racist - You Oughta Know','2011-11-09 12:02:11','2012-01-23 15:49:11',NULL,0,5,176,NULL),
	(33,'Mzy_BEzlHWI','Janis Joplin - Piece of My Heart','2011-11-09 12:02:12','2012-01-16 15:29:17',NULL,0,4,269,NULL),
	(34,'GJY8jJkDoMY','The Doors - People Are Strange','2011-11-09 12:02:12','2012-01-16 16:39:27',NULL,0,4,133,NULL),
	(35,'RSdKmX2BH7o','Eminem - We Made You','2011-11-09 12:02:12','2012-01-16 16:01:03',NULL,0,4,283,NULL),
	(36,'PiBX-ESFDF0','No Doubt - Sunday Morning','2011-11-09 12:02:13','2012-01-10 18:35:18',NULL,0,5,261,NULL),
	(37,'PQZhN65vq9E','Florence + The Machine - You\'ve Got the Love','2011-11-09 12:02:13','2012-01-23 15:26:59',NULL,0,5,163,NULL),
	(38,'z_jGgZ35W5s','Slick Rick/Morcheeba - Women Lose Weight','2011-11-09 12:02:13','2012-01-16 16:05:46',NULL,0,4,258,NULL),
	(39,'xxn-fz9mjo4','Morcheeba - Otherwise','2011-11-09 12:02:13','2012-01-16 16:32:33',NULL,0,4,250,NULL),
	(40,'VtrR5YvZRxg','Sergio Mendes The Waters of March','2011-11-09 12:02:14','2012-01-16 16:28:44',NULL,0,4,230,NULL),
	(41,'TbGUrNtoRC4','Moby - Dream About Me','2011-11-09 12:02:14','2012-01-16 16:25:19',NULL,0,4,204,NULL),
	(42,'2gMk6mZotsk','Cut Copy - Feel The Love','2011-11-09 12:02:14','2012-01-16 16:20:51',NULL,0,4,268,NULL),
	(43,'YlrwMpWuz8U','Raized By Wolves feat. Tom Smith - The Call','2011-11-09 12:02:14','2012-01-16 13:04:24',NULL,0,4,213,NULL),
	(44,'_uoPOW9618o','Tired Pony - The Good Book (feat. Tom Smith from Editors)','2011-11-09 12:02:15','2012-01-13 19:22:08',NULL,0,4,183,NULL),
	(45,'rYEDA3JcQqw','Adele - Rolling In The Deep','2011-11-09 12:02:15','2012-01-16 17:56:21',NULL,1,4,234,NULL),
	(46,'jlSOX-dI0zM','Matrix Reloaded soundtrack Fluke - Zion','2011-11-09 12:02:15','2012-01-16 11:12:02',NULL,0,4,274,NULL),
	(47,'43beuzU6ux4','Suie Paparude - Moartea Boxelor [official]','2011-11-09 12:02:15','2012-01-16 12:42:02',NULL,0,4,256,NULL),
	(48,'UIUX0NozeO4','Feed Me - Trapdoor (Ft. Hadouken)','2011-11-09 12:02:16','2012-01-16 12:58:09',NULL,0,4,164,NULL),
	(49,'tfbaTK8cztQ','Modestep - Feel Good','2011-11-09 12:02:16','2012-01-16 18:12:01',NULL,1,4,259,NULL),
	(50,'38Y16Q4t860','SL2 - On A Ragga Tip.','2011-11-09 12:02:16','2012-01-16 18:03:31',NULL,1,4,302,NULL),
	(51,'ihwzG5-W8tE','Skream & Example - Shot Yourself In The Foot Again','2011-11-09 12:02:17','2012-01-16 13:38:59',NULL,0,4,306,NULL),
	(52,'VI_GEC7Kigc','Adele - Set Fire To The Rain (Thomas Gold Remix)','2011-11-09 12:02:17','2012-01-09 12:49:39',NULL,1,5,351,NULL),
	(53,'NUkT2LrcGyc','Arty - Kate','2011-11-09 12:02:17','2012-01-23 15:44:19',NULL,0,5,293,NULL),
	(54,'qg_PagfRU0o','Example - \'Stay Awake\' (Audio Only)','2011-11-09 12:02:17','2012-01-16 13:35:20',NULL,0,4,205,NULL),
	(55,'9anzryZo2WA','Magnetic Man ft P Money — Anthemic','2011-11-09 12:02:18','2012-01-16 13:44:06',NULL,0,4,189,NULL),
	(56,'hGVuqOzG-TM','MECK ft. Leo Sayer - Thunder In My Heart Again (Official Video HQ)','2011-11-09 12:02:18','2012-01-16 12:32:06',NULL,0,4,191,NULL),
	(57,'Dv7vr6oE3U8','Kings Of Leon - Red Morning Light','2011-11-09 12:02:18','2012-01-16 12:12:01',NULL,0,4,178,NULL),
	(58,'rPTXyR49pUQ','Cock Sparrer - Working','2011-11-09 12:02:18','2012-01-16 12:04:16',NULL,0,4,167,NULL),
	(59,'Hei_T3x40Rk','Fall into Place - Apartment','2011-11-09 12:02:19','2012-01-16 11:57:35',NULL,0,4,203,NULL),
	(60,'tiABMvXHp1E','Manga - Bir Kadin Cizeceksin','2011-11-09 12:02:19','2012-01-16 11:48:02',NULL,0,4,241,NULL),
	(61,'1SmxVCM39j4','Florence + The Machine - Kiss With A Fist','2011-11-09 12:02:19','2012-01-16 11:41:14',NULL,0,4,129,NULL),
	(62,'WgJJc0H0enU','Active Child - Hanging On','2011-11-09 12:02:20','2012-01-13 19:08:34',NULL,0,4,329,NULL),
	(63,'w-9KdDMdzHs','The Prototypes - Kaleidoscope','2011-11-09 12:02:20','2012-01-11 09:56:55','2012-01-11 13:22:09',0,2,225,NULL),
	(64,'smyQRprA4NQ','flogging molly- To Youth (My Sweet Roisin Dubh)','2011-11-09 12:02:20','2012-01-16 11:29:58',NULL,0,4,198,NULL),
	(65,'xHM3cxcP4Tk','Asian Dub Foundation - Rise to the Challenge','2011-11-09 12:02:20','2012-01-16 11:24:49',NULL,0,4,220,NULL),
	(66,'YfpRm-p7qlY','The Jam - Town Called Malice','2011-11-09 12:02:21','2012-01-16 11:16:50',NULL,0,4,178,NULL),
	(67,'SSbBvKaM6sk','Blur - Song 2','2011-11-09 12:02:21','2012-01-16 11:16:47',NULL,0,4,123,NULL),
	(68,'ZThquH5t0ow','The Trashmen : Surfin\' Bird ( 1963 )','2011-11-09 12:02:21','2012-01-16 11:16:36',NULL,0,4,162,NULL),
	(69,'NYqaX3QYXZs','Kraak & Smaak - Squeeze Me (OFFICIAL VIDEO HQ)','2011-11-09 12:02:22','2012-01-16 11:08:24',NULL,0,4,218,NULL),
	(70,'04mfKJWDSzI','Gorillaz - On Melancholy Hill','2011-11-09 12:02:22','2012-01-23 15:29:41',NULL,0,5,262,NULL),
	(71,'iL2M0OSKruA','Stone Temple Pilots - Vasoline','2011-11-09 12:02:22','2012-01-10 18:34:41','2012-01-10 18:35:10',0,2,177,NULL),
	(72,'oUm4MHEeFCY','Jamie Woon - Shoulda','2011-11-09 12:02:22','2012-01-16 14:52:55',NULL,0,5,206,NULL),
	(73,'Xz7_3n7xyDg','Liam Lynch: United States of Whatever','2011-11-09 12:02:23','2012-01-16 11:28:29',NULL,0,4,88,NULL),
	(74,'734aIu-3Ngw','Interpol - Memory Serves (Video + Lyrics 2010)','2011-11-09 12:02:23','2012-01-23 15:21:37',NULL,0,5,301,NULL),
	(75,'-dwG4UT7JNs','IAMX - Volatile Times Official Video','2011-11-09 12:02:23','2012-01-18 09:48:19',NULL,0,6,268,NULL),
	(76,'SDTZ7iX4vTQ','Queen Qgjumbdakiw IT WASN´T ME ( Lahhncfa7ni )','2011-11-09 12:02:23','2012-01-13 19:35:09',NULL,0,4,181,NULL),
	(77,'NZyVZFJGX5g','Black Sabbath - Paranoid(1970 - Music Video)','2011-11-09 12:02:24','2011-12-12 16:49:30',NULL,0,5,167,NULL),
	(78,'u3wUZw9S2PM','The Black Eyed Peas - The APL Song','2011-11-09 12:02:24','2012-01-16 11:37:39',NULL,0,4,215,NULL),
	(79,'JJyIOScUNrY','BB King ft. John Mayer - Hummingbird','2011-11-09 12:02:24','2012-01-16 11:43:22',NULL,0,4,280,NULL),
	(80,'zUGyFYUlquo','the Knife - Heartbeats','2011-11-09 12:02:24','2012-01-11 13:22:14','2012-01-12 09:29:41',0,4,236,NULL),
	(81,'am6rArVPip8','Florence + The Machine - What The Water Gave Me','2011-11-09 12:02:25','2012-01-16 11:52:02',NULL,0,4,333,NULL),
	(82,'zL4zg5oOO9M','IAMX -Volatile Times','2011-11-09 12:02:25','2012-01-11 09:57:37','2012-01-11 18:02:34',0,4,312,NULL),
	(83,'8CpP8_LWvtQ','Owl City - Alligator Sky (New Song - High Quality with Lyrics Video)','2011-11-09 12:02:25','2012-01-16 12:00:59',NULL,0,4,198,NULL),
	(84,'I-3fmjjk4aA','Aly, Walk With Me','2011-11-09 12:02:26','2012-01-16 12:07:02',NULL,0,4,300,NULL),
	(85,'zBVfD7qCQnI','Let\'s Dance To Joy Division - The Wombats','2011-11-09 12:02:26','2012-01-23 16:23:09',NULL,0,5,174,NULL),
	(86,'fnld4HXFiLk','Linkin Park Reanimation Points Of Authority','2011-11-09 12:02:26','2012-01-16 18:28:16',NULL,2,4,226,NULL),
	(87,'WpYeekQkAdc','The Black Eyed Peas - Where Is The Love?','2011-11-09 12:02:27','2012-01-16 14:18:07',NULL,0,4,253,NULL),
	(88,'ub747pprmJ8','Right Here, Right Now by Fatboy Slim (High Res / Official video).mp4','2011-11-09 12:02:27','2012-01-16 15:16:14',NULL,0,4,229,NULL),
	(89,'GYkia94Bngw','The Clash London\'s Burning','2011-11-09 12:02:27','2012-01-04 20:19:46',NULL,2,5,131,NULL),
	(90,'4vHvzybkqfo','London calling-The clash','2011-11-09 12:02:27','2012-01-16 18:37:20',NULL,2,4,197,NULL),
	(91,'WI2NYRhlM30','Cock Sparrer - Take \'Em All','2011-11-09 12:02:28','2012-01-16 14:17:50',NULL,0,4,155,NULL),
	(92,'KdxUsoJ3Xfk','We\'re Coming Back - Cock Sparrer','2011-11-09 12:02:28','2012-01-16 14:14:26',NULL,0,4,203,NULL),
	(93,'-_wssByW7JQ','The Ramones - I Wanna Be Sedated','2011-11-09 12:02:28','2012-01-16 14:11:57',NULL,0,4,150,NULL),
	(94,'WIXg9KUiy00','The Sex Pistols - My Way','2011-11-09 12:02:29','2012-01-16 14:08:10',NULL,0,4,227,NULL),
	(95,'227m9lw5CcI','Sex Pistols - Holidays In The Sun','2011-11-09 12:02:29','2012-01-16 14:03:02','2012-01-23 14:34:19',0,4,201,NULL),
	(96,'NDU4Z_BBkTA','Sex Pistols - Jingle Bells','2011-11-09 12:02:29','2012-01-16 17:54:15',NULL,1,4,126,NULL),
	(97,'bWSxELGNShk','System Of A Down - Toxicity #12','2011-11-09 12:02:30','2012-01-16 10:57:58',NULL,0,4,220,NULL),
	(98,'hTWKbfoikeg','Nirvana - Smells Like Teen Spirit','2011-11-09 12:02:30','2012-01-13 19:39:25',NULL,0,4,278,NULL),
	(99,'ac2EjcaFM2I','Galvanize - The Chemical Brothers','2011-11-09 12:02:30','2012-01-16 13:16:44',NULL,0,4,270,NULL),
	(100,'uVefPPr69NU','The Prodigy - Omen','2011-11-09 12:02:30','2012-01-23 15:17:32',NULL,0,5,362,NULL),
	(101,'-Fz85FE0KtQ','THE PRODIGY - voodoo people (original)','2011-11-09 12:02:31','2012-01-13 19:03:25',NULL,0,4,308,NULL),
	(102,'FxdPnBr48Hk','Papa Roach - Between Angels And Insects','2011-11-09 12:02:31','2012-01-16 13:07:57',NULL,0,4,239,NULL),
	(103,'6H9yzZqF3_E','Marilyn Manson Rock Is Dead','2011-11-09 12:02:31','2012-01-16 13:50:19',NULL,0,4,202,NULL),
	(104,'GGNNqAc1s4Y','Marilyn Manson - Beautiful People','2011-11-09 12:02:32','2012-01-23 16:26:04',NULL,0,5,238,NULL),
	(105,'fob5FSgZHrA','Deeper Underground - Jamiroquai','2011-11-09 12:02:32','2012-01-16 13:11:57',NULL,0,4,287,NULL),
	(106,'T2ojuJdgquI','The Prodigy - Breathe','2011-11-09 12:02:32','2012-01-16 13:21:13',NULL,0,4,335,NULL),
	(107,'6RI9wVgOO1s','Prodigy - No Good','2011-11-09 12:02:32','2012-01-16 13:26:48',NULL,0,4,236,NULL),
	(108,'uswXI4fDYrM','The Who - My Generation','2011-11-09 12:02:33','2012-01-16 13:47:15',NULL,0,4,181,NULL),
	(109,'A6gaS9wrtM4','Kiss - Crazy Crazy Nights','2011-11-09 12:02:33','2012-01-16 18:27:28',NULL,2,4,220,NULL),
	(110,'hBiETZFOrFc','Mötley Crüe - Home Sweet Home','2011-11-09 12:02:33','2012-01-16 18:23:26',NULL,2,4,242,NULL),
	(111,'tBrUjvONIrA','Faithless - Insomnia','2011-11-09 12:02:34','2012-01-16 13:53:40',NULL,0,4,252,NULL),
	(112,'dJTYNzuPGdk','Faithless - Drifting Away, Buddha Bar Vol. 1','2011-11-09 12:02:34','2012-01-16 13:57:53',NULL,0,4,309,NULL),
	(113,'Q7zQlsLgYhg','Moby \'Shot In The Back Of The Head\'','2011-11-09 12:02:34','2012-01-16 11:05:08',NULL,0,4,196,NULL),
	(114,'DcHKOC64KnE','Queens Of The Stone Age - Go With The Flow','2011-11-09 12:02:34','2012-01-13 19:18:56',NULL,0,4,191,NULL),
	(115,'agVpq_XXRmU','Kasabian - Fire','2011-11-09 12:02:35','2012-01-16 14:22:19',NULL,0,4,280,NULL),
	(116,'32udqal_lyQ','Crystal Castles - Not In Love ft. Robert Smith of The Cure','2011-11-09 12:02:35','2012-01-11 09:52:29',NULL,0,5,227,NULL),
	(117,'oIEEIif21g4','Mt Eden Dubstep - Sierra Leone','2011-11-09 12:02:35','2011-11-21 12:07:50','2012-01-12 09:31:44',0,2,318,NULL),
	(118,'sO_QntXc-c4','Drowning Pool - Bodies (Let The Bodies Hit The Floor)','2011-11-09 12:02:36','2012-01-16 14:26:59',NULL,0,4,209,NULL),
	(119,'CSvFpBOe8eY','System Of A Down - Chop Suey!','2011-11-09 12:02:36','2012-01-22 22:29:35',NULL,0,5,207,NULL),
	(120,'mvy8bcRXe18','Moby - Raining Again','2011-11-09 12:02:36','2012-01-16 14:30:29',NULL,0,4,247,NULL),
	(121,'CTAud5O7Qqk','Modest Mouse - Float On','2011-11-09 12:02:37','2012-01-23 16:08:09',NULL,0,5,215,NULL),
	(122,'Xj9m9ifjVn0','Float On (Modest Mouse Cover) - Blackbird Blackbird','2011-11-09 12:02:37','2012-01-16 14:34:35',NULL,0,4,110,NULL),
	(123,'Z8PDTlxSveI','Blackbird Blackbird - Dreams I Create','2011-11-09 12:02:37','2012-01-16 14:36:25',NULL,0,4,144,NULL),
	(124,'iWOyfLBYtuU','Florence + The Machine - Dog Days Are Over (2010 Version)','2011-11-09 12:02:38','2012-01-16 14:36:44',NULL,0,4,224,NULL),
	(125,'LTh9IuSTOY0','White Lies - Death','2011-11-09 12:02:38','2012-01-12 15:59:17','2012-01-12 15:59:42',0,2,258,NULL),
	(126,'CDl9ZMfj6aE','Alien Ant Farm - Smooth Criminal','2011-11-09 12:02:38','2012-01-16 14:40:29',NULL,0,4,219,NULL),
	(127,'f3gUPs5JS30','Gorillaz - Dirty Harry','2011-11-09 12:02:38','2012-01-16 14:44:07',NULL,0,4,296,NULL),
	(128,'WSWrepLjTKc','Kid Cudi vs. Crookers - Day \'n\' Night','2011-11-09 12:02:39','2012-01-13 18:35:30','2012-01-13 18:35:53',1,3,186,NULL),
	(129,'8GbwNKTn7JM','Paul van Dyk - We are alive','2011-11-09 12:02:39','2012-01-23 15:55:55',NULL,0,5,229,NULL),
	(130,'0MgqGfET30Y','Royksopp - Remind Me','2011-11-09 12:02:39','2012-01-11 18:52:27','2012-01-11 18:52:31',0,3,256,NULL),
	(131,'ObXlNlMxLnY','The Wombats Let\'s Dance To Joy Division + Lyrics','2011-11-09 12:02:40','2012-01-16 14:49:02',NULL,0,4,194,NULL),
	(132,'suRsxpoAc5w','Moves Like Jagger - Maroon 5 featuring Christina Aguilera','2011-11-09 12:02:40','2012-01-10 15:45:40','2011-11-09 17:30:19',0,1,202,NULL),
	(133,'rSpqObhK4Rw','Fight Club - This Is Your Life','2011-11-09 12:02:40','2012-01-16 11:01:37',NULL,0,4,212,NULL),
	(134,'RCD14IrOcIs','Pixies - Where is my Mind (Fight Club Soundtrack)','2011-11-09 12:02:40','2012-01-23 15:59:43',NULL,0,5,235,NULL),
	(135,'LcbtulcX8nQ','Paraziţii - Arde','2011-11-09 12:02:41','2012-01-16 15:00:56',NULL,0,4,203,NULL),
	(136,'lMG9tADP4QE','The Cure - Kyoto Song','2011-11-09 12:02:41','2012-01-10 16:59:06','2012-01-10 17:03:51',0,1,309,NULL),
	(137,'dQw4w9WgXcQ','Rick Astley - Never Gonna Give You Up','2011-11-09 15:06:32',NULL,'2011-11-09 15:06:59',0,0,213,NULL),
	(138,'HkhfL0pnMPQ','Disturbed - Down With The Sickness (Video) (Explicit)','2011-11-09 16:05:46','2012-01-11 19:50:40','2012-01-11 19:51:08',0,2,217,NULL),
	(139,'4nAON-MwUPY','Siouxsie And The Banshees - The Passenger','2011-11-09 16:32:40','2012-01-16 15:04:19',NULL,0,4,250,NULL),
	(140,'N6-PxqhWiYo','Juli - Dieses Leben','2011-11-09 16:48:47','2012-01-23 15:52:06',NULL,0,5,229,NULL),
	(141,'Cp3hS6agd_o','Rosenstolz - Ich geh in Flammen auf','2011-11-09 16:51:20','2012-01-16 15:08:28',NULL,0,4,222,NULL),
	(142,'XgwDdqi3vI0','Little Miss Pipedream - The Wombats','2011-11-09 17:17:41','2012-01-16 15:12:09',NULL,0,4,246,NULL),
	(143,'HvMY_QQb3Io','Boy Kill Boy \'Suzie\'','2011-11-09 17:54:22','2012-01-16 18:08:33',NULL,1,4,208,NULL),
	(144,'mLqHDhF-O28','30 Seconds To Mars - Closer To The Edge','2011-11-10 09:15:41','2012-01-23 15:34:02',NULL,0,5,383,NULL),
	(145,'MSxjbF18BBM','Ratatat - Neckbrace','2011-11-10 19:19:22','2012-01-16 15:20:02',NULL,0,4,255,NULL),
	(146,'RaTQqEXNd0k','PF Project - Choose Life','2011-11-16 11:07:03','2012-01-16 15:24:25',NULL,0,4,230,NULL),
	(147,'8UVNT4wvIGY','Gotye- Somebody That I Used To Know (feat. Kimbra)- official film clip (HD)','2011-11-22 16:37:35','2012-01-16 15:25:14',NULL,0,4,244,NULL),
	(148,'7NhkK-1epUA','Gotye- Lyrics- Somebody That I Used To Know (feat. Kimbra)','2011-11-22 16:38:06',NULL,'2011-12-12 16:20:30',0,0,235,NULL),
	(149,'aE9BpegPl1A','Chevelle - Comfortable Liar (Lyrics)','2011-12-12 16:39:42','2012-01-16 15:45:29',NULL,0,4,226,NULL),
	(150,'CSJXle3LP_Q','Korn - Coming Undone','2011-12-16 21:00:52','2012-01-16 15:33:45',NULL,0,4,209,NULL),
	(151,'xycnv87N_BU','SEPTEMBER!!! by Earth Wind and Fire','2012-01-10 15:59:13','2012-01-16 15:37:16',NULL,0,4,252,NULL),
	(152,'LKgu0xdYP3I','Dubioza Kolektiv -  Balkan Funk','2012-01-10 17:47:58','2012-01-16 12:27:40',NULL,0,4,195,NULL),
	(153,'bGLrrTbF3t8','Rammstein - Sonne','2012-01-11 15:18:04','2012-01-16 15:41:31',NULL,0,4,239,NULL),
	(154,'SBjQ9tuuTJQ','Foo Fighters - The Pretender','2012-01-11 15:18:38','2012-01-23 16:03:39',NULL,0,5,271,NULL),
	(155,'WZ88oTITMoM','A Walk On The Wild Side','2012-01-12 14:36:07','2012-01-16 15:49:14',NULL,0,4,251,NULL),
	(156,'QYEC4TZsy-Y','Lou Reed - Perfect Day','2012-01-12 14:44:25','2012-01-16 12:49:53',NULL,0,4,224,NULL),
	(157,'eJlN9jdQFSc','Johnny Cash - God\'s Gonna Cut You Down','2012-01-12 14:45:47','2012-01-16 12:39:13',NULL,0,4,170,NULL),
	(158,'2_HXUhShhmY','Her Morning Elegance / Oren Lavie','2012-01-12 14:48:07','2012-01-16 12:46:17',NULL,0,4,217,NULL),
	(159,'wqCpjFMvz-k','Youssou N\'Dour featuring Neneh Cherry - 7 Seconds','2012-01-12 14:49:19','2012-01-16 12:53:38',NULL,0,4,272,NULL),
	(160,'4x23l6BGu3w','Under The Bridge - Red Hot Chili Peppers','2012-01-12 14:50:15','2012-01-16 11:33:14',NULL,0,4,261,NULL),
	(161,'R8OOWcsFj0U','Muse - Undisclosed Desires','2012-01-12 14:50:40','2012-01-12 16:44:04','2012-01-12 16:44:20',0,2,234,NULL),
	(162,'G1f2M5G9KG8','Travis - Sing','2012-01-12 14:50:54','2012-01-16 17:05:04',NULL,0,4,229,NULL),
	(163,'0Q0vZWh168Y','Kumm - Butterflies','2012-01-12 14:51:12','2012-01-16 17:00:37',NULL,0,4,268,NULL),
	(164,'9GNhdQRbXhc','Meat Loaf - I would do anything for love','2012-01-12 14:51:36','2012-01-23 16:15:32',NULL,0,5,456,NULL),
	(165,'bay2_TlJSbg','J\'taime Live - Lara Fabian - Lyrics.avi','2012-01-12 14:52:05','2012-01-16 17:08:52',NULL,0,4,295,NULL),
	(166,'irp8CNj9qBI','Queen - Bohemian Rhapsody','2012-01-12 14:52:43','2012-01-16 17:17:08',NULL,0,4,349,NULL),
	(167,'LV58fxXOQuE','Stereophonics - Maybe Tomorrow','2012-01-12 14:53:12','2012-01-16 13:30:44',NULL,0,4,276,NULL),
	(168,'-26hsZqwveA','Susanne Vega - Tom\'s Diner','2012-01-12 14:53:28','2012-01-23 16:11:43',NULL,0,5,229,NULL),
	(169,'upnTg2GPgTM','Lykke Li - Little Bit','2012-01-12 14:53:48','2012-01-16 17:28:26',NULL,0,4,231,NULL),
	(170,'tB71QZcBYjc','Una Palabra','2012-01-12 14:54:04','2012-01-12 14:57:23','2012-01-12 14:58:51',0,1,152,NULL),
	(171,'w7JthgTMHDU','MGMT- Kids','2012-01-12 14:54:45','2012-01-16 17:22:58',NULL,0,4,327,NULL),
	(172,'j3tB82dGhSA','Carlos Varela - Una Palabra with lyrics and translation','2012-01-12 14:58:48','2012-01-16 16:51:40',NULL,0,4,155,NULL),
	(173,'bWTuKd2lTo4','Undisclosed desires- Muse Full song (With Lyrics)','2012-01-12 16:45:00','2012-01-16 12:35:17',NULL,0,4,237,NULL),
	(174,'eYz_e4vuixQ','Awolnation- Sail w/ lyrics','2012-01-13 11:55:57','2012-01-16 17:49:46',NULL,0,4,269,NULL),
	(175,'HO1OV5B_JDw','LANA DEL REY-VIDEO GAMES','2012-01-13 11:59:01','2012-01-16 17:44:56',NULL,0,4,290,NULL),
	(176,'-DSVDcw6iW8','College feat. Electric Youth - A Real Hero (Drive Original Movie Soundtrack)','2012-01-13 12:00:40','2012-01-16 17:40:29',NULL,0,4,268,NULL),
	(177,'9K7rmxjk5RQ','Desire:Under Your Spell','2012-01-13 12:01:39','2012-01-16 17:35:29',NULL,0,4,300,NULL),
	(178,'eRdV-ZY-F0c','Ra Ra Riot - Boy','2012-01-13 12:03:33','2012-01-16 17:32:18',NULL,0,4,192,NULL),
	(179,'1RMfcOJuIa8','Mark Ronson Somebody To Love Me','2012-01-13 12:04:29','2012-01-16 14:56:20',NULL,0,4,276,NULL);

/*!40000 ALTER TABLE `musicpond` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
