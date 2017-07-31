CREATE SCHEMA `socialnetworkdemo`;

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


CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `sl` int(11) NOT NULL AUTO_INCREMENT,
  `like_no` int(11) DEFAULT '0',
  `dislike_no` int(11) DEFAULT '0',
  PRIMARY KEY (`sl`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;


CREATE TABLE `friend_linkage` (
  `id` int(11) DEFAULT NULL,
  `friend_id` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Creting Routine
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_reg`(
IN
fname varchar(50)
   ,lname varchar(50)
   ,mail varchar(50)
   ,contactNo varchar(30)
   ,land varchar(50)
   ,pass varchar(30),
out
regid int
)
BEGIN
DECLARE	tmpUserId INT;
DECLARE	MaxUserID INT;
	SET MaxUserID=0;
	SET tmpUserId=0;
Select max(id) into MaxUserID From users;

IF MaxUserID is null
THEN
	set MaxUserID=1;
ELSE
	set MaxUserID=MaxUserID+1;
SET tmpUserId=MaxUserID;
END IF;	

insert into users (id,firstname,lastname,email,contact,country,password,registrationtime)
values(tmpUserId,fname,lname,mail,contactNo,land,pass,now());
set regid=tmpUserId;
END$$
DELIMITER ;

