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
INSERT INTO `users` VALUES (0,'Rezanur','Tushar','tusher@diit.com','01735558545','Bangladesh',NULL,'2017-07-22 12:37:53','����\0JFIF\0\0H\0H\0\0��\0Created with GIMP��\0C\0\n\n\n\r\r��\0C		\r\r��\0\0d\0d\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0�H\0��\0\0\05J����d\0\00�tU��py�\0#\n�≢�=l\0ビ3��0v��M���06E@H�\'Ѽrcҥ�e����n7��K���I[�ʐ�2�I�2d\0\rr(��$�ue�t@\0\05\nT��LD1�u&�\0%NA�l���H\0\09�\0�%�!�\0\0\0\0\0��\0$\0\0\0\0\0\0\0\0\0 0!1@��\0\0���X��]�x�[���-A[b>�p�;j��疤D��L/:�����祫�;b�e�^���@≲�,]s�%��$�T>��J�--�(���T+²���jJ�X�hV*Q�;cd>W�\r����/���NGd�	�l�,�����Ś�6�\0����۾J@X}�\0z;�YR�.»��%��8��ki��,{�x�0X5Gu���ly�,�-Ni4��k��Uz�0؝Z���z�[r:�i�n�X�6��9m~����͝V�tRˋ^7r��$;�>���1�Z�\rl=�%�|�����LN�|A�[p4?�iF1z�b9�?���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\"\0\0\0\0\0\0\0\0\0\0! 012\"@AQ��\0\0?�-��fY�1e�*lN[�R\Z�0��;���[�Re�2`�!![G�Z�Oe�ad�5�\Zg�=��ȩ��ƣ�b���k�W��%[�t59IR4!:�����!`_ӳ���Ƀ�ŕ������\0 \0\0\0\0\0\0\0\0\0\0\0!1 A0aQ�q��\0\0?!��\'�� z4��h���j�<4`X[����X�^���N::^G6�^�2�J=�1��>#�j��\'OD�E�ҔsxHuՌI��#S]��$!㿠�[\n�L�hRB��Ċ�g�)T��%����\0`��f�b�7D�д�,b��s�\"7� *vw$m�/���\\��4��%�.:�動�,�L�����rۓU\'��GPaW�x?��\0\0\0\0\0\0�@�I$�\0$�	\0�I H\0�H\0	$�H �	�I�$�$�$I \0\0$�I 	$�@I$I$���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\"\0\0\0\0\0\0\0\0\0!1AQ aq0�����\0\0?�@V[��T��\'\Z�h_�i�o�\0^JZ �Q�;��7��4�Y��Z�YX�1�<]%���K\na���0�7�+���l��%HS�T	~\"p�.�Ƌ뫉�E�\Z��5��Sߩ���kpWQ����l���0F\\.�#Ǌ�b.PcD&�3z�c\0��V���qtʌ����au�����#��,VE�\0�Ct��)B���d�6�������p�(�������n��(�L>�F,�i��%x�3}�����\\J��X����c\' �b��@ F��(cH4WK2<씝C��W��<���Qr�����n��0������DT\\��4]�M��0̅�v%��߲TUǨ85z���k�y�4���','123'),(1,'dasdas','fasdsa','paul@paul.com','asdasfasd','India',NULL,'2017-07-29 19:25:24',NULL,'123'),(2,'dfd','fdsf','dd@dd.com','ahasan-m','Bangladesh',NULL,'2017-07-29 19:30:56','����\0JFIF\0\0H\0H\0\0��\0Created with GIMP��\0C\0\n\n\n\r\r��\0C		\r\r��\0\0d\0d\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0�H\0��\0\0\05J����d\0\00�tU��py�\0#\n�≢�=l\0ビ3��0v��M���06E@H�\'Ѽrcҥ�e����n7��K���I[�ʐ�2�I�2d\0\rr(��$�ue�t@\0\05\nT��LD1�u&�\0%NA�l���H\0\09�\0�%�!�\0\0\0\0\0��\0$\0\0\0\0\0\0\0\0\0 0!1@��\0\0���X��]�x�[���-A[b>�p�;j��疤D��L/:�����祫�;b�e�^���@≲�,]s�%��$�T>��J�--�(���T+²���jJ�X�hV*Q�;cd>W�\r����/���NGd�	�l�,�����Ś�6�\0����۾J@X}�\0z;�YR�.»��%��8��ki��,{�x�0X5Gu���ly�,�-Ni4��k��Uz�0؝Z���z�[r:�i�n�X�6��9m~����͝V�tRˋ^7r��$;�>���1�Z�\rl=�%�|�����LN�|A�[p4?�iF1z�b9�?���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\"\0\0\0\0\0\0\0\0\0\0! 012\"@AQ��\0\0?�-��fY�1e�*lN[�R\Z�0��;���[�Re�2`�!![G�Z�Oe�ad�5�\Zg�=��ȩ��ƣ�b���k�W��%[�t59IR4!:�����!`_ӳ���Ƀ�ŕ������\0 \0\0\0\0\0\0\0\0\0\0\0!1 A0aQ�q��\0\0?!��\'�� z4��h���j�<4`X[����X�^���N::^G6�^�2�J=�1��>#�j��\'OD�E�ҔsxHuՌI��#S]��$!㿠�[\n�L�hRB��Ċ�g�)T��%����\0`��f�b�7D�д�,b��s�\"7� *vw$m�/���\\��4��%�.:�動�,�L�����rۓU\'��GPaW�x?��\0\0\0\0\0\0�@�I$�\0$�	\0�I H\0�H\0	$�H �	�I�$�$�$I \0\0$�I 	$�@I$I$���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p��\0?)��\0\"\0\0\0\0\0\0\0\0\0!1AQ aq0�����\0\0?�@V[��T��\'\Z�h_�i�o�\0^JZ �Q�;��7��4�Y��Z�YX�1�<]%���K\na���0�7�+���l��%HS�T	~\"p�.�Ƌ뫉�E�\Z��5��Sߩ���kpWQ����l���0F\\.�#Ǌ�b.PcD&�3z�c\0��V���qtʌ����au�����#��,VE�\0�Ct��)B���d�6�������p�(�������n��(�L>�F,�i��%x�3}�����\\J��X����c\' �b��@ F��(cH4WK2<씝C��W��<���Qr�����n��0������DT\\��4]�M��0̅�v%��߲TUǨ85z���k�y�4���','123');
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
