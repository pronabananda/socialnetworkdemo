-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: socialnetworkdemo
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `friend_linkage`
--

DROP TABLE IF EXISTS `friend_linkage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_linkage` (
  `id` int(11) DEFAULT NULL,
  `friend_id` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_linkage`
--

LOCK TABLES `friend_linkage` WRITE;
/*!40000 ALTER TABLE `friend_linkage` DISABLE KEYS */;
INSERT INTO `friend_linkage` VALUES (0,'2','2017-08-01 01:08:34','0'),(0,'2','2017-08-01 01:11:35','0'),(0,'2','2017-08-01 01:15:11','0'),(0,'1','2017-08-01 01:22:44','0'),(0,'0','2017-08-01 01:23:02','0');
/*!40000 ALTER TABLE `friend_linkage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `sl` int(11) NOT NULL AUTO_INCREMENT,
  `like_no` int(11) DEFAULT '0',
  `dislike_no` int(11) DEFAULT '0',
  PRIMARY KEY (`sl`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (0,' I am tusher','2017-08-01 00:53:28',48,0,1),(2,' He he','2017-08-01 01:15:57',49,5,8);
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `photo` blob,
  `registrationtime` varchar(45) DEFAULT NULL,
  `profilephoto` blob,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'Rezanur','Tushar','tusher@diit.com','01735558545','Bangladesh',NULL,'2017-07-22 12:37:53','ÿØÿà\0JFIF\0\0H\0H\0\0ÿþ\0Created with GIMPÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0d\0d\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0õH\0Çè\0\0\05JøèÍòd\0\00…tU‡épyô\0#\nè®â‰¢é=l\0ãƒ“3œÙ0v§¡MÂíÉ06E@H‘\'Ñ¼rcÒ¥¸eÉÍÒn7·K¼ëÀI[˜Ê“2Iè2d\0\rr(àŠ$Ìueút@\0\05\nT¬ÏLD1¨u&Ð\0%NAl›¥€H\0\09¢\0—%É!ú\0\0\0\0\0ÿÄ\0$\0\0\0\0\0\0\0\0\0 0!1@ÿÚ\0\0õ–ÇXž¿]†xÖ[üˆÛ-A[b>‚p†;j„Æç–¤D÷ÝL/:áñú­ç¥«êª;bµe¾^ÆÍî@â‰²Ë,]sÎ%ªï$¤T>»¾Jû--‰(…çÊT+Â²€‡jJ½XähV*Q;cd>WÂ\r­±Äâª/ê™å¡ÆNGd¿	Ðl§,îÝÒÆÝÅšë6ñ»‡\0²ïˆŒÛ¾J@X}ÿ\0z;æYRº.Â»³ð%§Æ8´²ki¢¾,{çx’0X5Gu¬ñÜlyª,œ-Ni4²ök¨Uzµ0ØZó¯™z³[r:­iÞn³Xô6¸³9m~ØÓéÎÍVµtRË‹^7r¼$;Ê>³üä1ÜZç\rl=³%Ž|†±­ÄéLN¢|Aí[p4?µiF1zå¯b9Ò?ÃÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\"\0\0\0\0\0\0\0\0\0\0! 012\"@AQÿÚ\0\0?ú-™fY™1e¦*lN[¾R\Z‹0Çò;œ’[šRe»2`Õ!![G±Z‹Oe´adª5É\Zg³=˜²È©±–Æ£Ýb”«k¯WšÒ%[²t59IR4!:À±ž¡¨!`_Ó³²‹àºÉƒ÷Å•ÅÑ×ÒÿÄ\0 \0\0\0\0\0\0\0\0\0\0\0!1 A0aQ‘qÿÚ\0\0?!àð\'‚ù z4¢ìhô¼´j”<4`X[¢ùŽ„Xœ^š”öN::^G6ã¦Â™^È2åJ=Œ1ú²>#j£™\'OD‚E…Ò”sxHuÕŒI¥ö#S]äÅ$!ã¿ Þ[\n LùhRBƒÄŠ†gö)TÊÁ%³Ÿàê\0`‰ŒfÏbï7D§Ð´ã,b°ˆs”\"7ã *vw$m›/¢÷˜\\À§4¥¥%.:´å‹•ê¦,¡L³Ýêè¢ÔrÛ“U\'©·GPaW†x?ÿÚ\0\0\0\0\0\0’@’I$€\0$’	\0‚I H\0’H\0	$€H 	’I’$‚$’$I \0\0$’I 	$@I$I$ŸÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\"\0\0\0\0\0\0\0\0\0!1AQ aq0‘¡±ÿÚ\0\0?ð@V[æàT×ã\'\Z¢h_²iåo¦\0^JZ ËQÛ;ÖÄ7£ƒ4«Y—„Z¡YXÑ1ì<]%Á‚êK\na¹•Ò0Ð7î+»îålÅæ%HS„T	~\"pÐ.ÈÆ‹ë«‰E„\Z¹¦5ÀýSß©‚ÎÁkpWQÃàîùl•¶0F\\.Š#ÇŠÔb.PcD&à3z‡c\0°¹Vöå‡qtÊŒÁíŸáau’¥”Îõ#Ñõ,VEÿ\0±Ctª‚)BºªÔdú6Àˆõ©òÆÆpê(¾¥ºÃô•nà(—L>ŒF,ßiˆ€%x·3}ÄäÝÔØ\\J’‹XœÙâùc\' ªb …@ F¼÷(cH4WK2<ì”CÅW‹Ü<é‚ÛÛQrÙäìúšn¸¨0æ¢ú†Š‹©DT\\û˜4]ËM°ò°0Ì…ƒv%ÂÄß²TUÇ¨85zžêkÍy€4ƒÿÙ','123'),(1,'dasdas','fasdsa','paul@paul.com','asdasfasd','India',NULL,'2017-07-29 19:25:24',NULL,'123'),(2,'dfd','fdsf','dd@dd.com','ahasan-m','Bangladesh',NULL,'2017-07-29 19:30:56','ÿØÿà\0JFIF\0\0H\0H\0\0ÿþ\0Created with GIMPÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0d\0d\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0õH\0Çè\0\0\05JøèÍòd\0\00…tU‡épyô\0#\nè®â‰¢é=l\0ãƒ“3œÙ0v§¡MÂíÉ06E@H‘\'Ñ¼rcÒ¥¸eÉÍÒn7·K¼ëÀI[˜Ê“2Iè2d\0\rr(àŠ$Ìueút@\0\05\nT¬ÏLD1¨u&Ð\0%NAl›¥€H\0\09¢\0—%É!ú\0\0\0\0\0ÿÄ\0$\0\0\0\0\0\0\0\0\0 0!1@ÿÚ\0\0õ–ÇXž¿]†xÖ[üˆÛ-A[b>‚p†;j„Æç–¤D÷ÝL/:áñú­ç¥«êª;bµe¾^ÆÍî@â‰²Ë,]sÎ%ªï$¤T>»¾Jû--‰(…çÊT+Â²€‡jJ½XähV*Q;cd>WÂ\r­±Äâª/ê™å¡ÆNGd¿	Ðl§,îÝÒÆÝÅšë6ñ»‡\0²ïˆŒÛ¾J@X}ÿ\0z;æYRº.Â»³ð%§Æ8´²ki¢¾,{çx’0X5Gu¬ñÜlyª,œ-Ni4²ök¨Uzµ0ØZó¯™z³[r:­iÞn³Xô6¸³9m~ØÓéÎÍVµtRË‹^7r¼$;Ê>³üä1ÜZç\rl=³%Ž|†±­ÄéLN¢|Aí[p4?µiF1zå¯b9Ò?ÃÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\"\0\0\0\0\0\0\0\0\0\0! 012\"@AQÿÚ\0\0?ú-™fY™1e¦*lN[¾R\Z‹0Çò;œ’[šRe»2`Õ!![G±Z‹Oe´adª5É\Zg³=˜²È©±–Æ£Ýb”«k¯WšÒ%[²t59IR4!:À±ž¡¨!`_Ó³²‹àºÉƒ÷Å•ÅÑ×ÒÿÄ\0 \0\0\0\0\0\0\0\0\0\0\0!1 A0aQ‘qÿÚ\0\0?!àð\'‚ù z4¢ìhô¼´j”<4`X[¢ùŽ„Xœ^š”öN::^G6ã¦Â™^È2åJ=Œ1ú²>#j£™\'OD‚E…Ò”sxHuÕŒI¥ö#S]äÅ$!ã¿ Þ[\n LùhRBƒÄŠ†gö)TÊÁ%³Ÿàê\0`‰ŒfÏbï7D§Ð´ã,b°ˆs”\"7ã *vw$m›/¢÷˜\\À§4¥¥%.:´å‹•ê¦,¡L³Ýêè¢ÔrÛ“U\'©·GPaW†x?ÿÚ\0\0\0\0\0\0’@’I$€\0$’	\0‚I H\0’H\0	$€H 	’I’$‚$’$I \0\0$’I 	$@I$I$ŸÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0pÿÚ\0?)ÿÄ\0\"\0\0\0\0\0\0\0\0\0!1AQ aq0‘¡±ÿÚ\0\0?ð@V[æàT×ã\'\Z¢h_²iåo¦\0^JZ ËQÛ;ÖÄ7£ƒ4«Y—„Z¡YXÑ1ì<]%Á‚êK\na¹•Ò0Ð7î+»îålÅæ%HS„T	~\"pÐ.ÈÆ‹ë«‰E„\Z¹¦5ÀýSß©‚ÎÁkpWQÃàîùl•¶0F\\.Š#ÇŠÔb.PcD&à3z‡c\0°¹Vöå‡qtÊŒÁíŸáau’¥”Îõ#Ñõ,VEÿ\0±Ctª‚)BºªÔdú6Àˆõ©òÆÆpê(¾¥ºÃô•nà(—L>ŒF,ßiˆ€%x·3}ÄäÝÔØ\\J’‹XœÙâùc\' ªb …@ F¼÷(cH4WK2<ì”CÅW‹Ü<é‚ÛÛQrÙäìúšn¸¨0æ¢ú†Š‹©DT\\û˜4]ËM°ò°0Ì…ƒv%ÂÄß²TUÇ¨85zžêkÍy€4ƒÿÙ','123');
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

-- Dump completed on 2017-08-01  1:56:24
