CREATE DATABASE twitter;

CREATE TABLE `twitter_user` (
  `userID` bigint(20) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `bio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`)
);

CREATE TABLE `language` (
  `languageID` bigint(20) NOT NULL,
  `language` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`languageID`)
);

CREATE TABLE `picture` (
  `pictureID` bigint(20) NOT NULL,
  `picture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pictureID`)
);

CREATE TABLE `tweet` (
  `tweetID` bigint(20) NOT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `languageID` bigint(20) DEFAULT NULL,
  `pictureID` bigint(20) DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `listID` bigint(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tweetID`),
  KEY `userID_idx` (`userID`),
  KEY `languageID_idx` (`languageID`),
  KEY `pictureID_idx` (`pictureID`),
  CONSTRAINT `languageID` FOREIGN KEY (`languageID`) REFERENCES `language` (`languageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pictureID` FOREIGN KEY (`pictureID`) REFERENCES `picture` (`pictureID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `twitter_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `retweets` (
  `retweetID` bigint(20) NOT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `tweetID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`retweetID`),
  KEY `userID_idx` (`userID`),
  KEY `tweetID_idx` (`tweetID`),
  CONSTRAINT `fk_tweetID` FOREIGN KEY (`tweetID`) REFERENCES `tweet` (`tweetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userID` FOREIGN KEY (`userID`) REFERENCES `twitter_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `followers` (
  `followID` bigint(20) NOT NULL,
  `followUserID` bigint(20) DEFAULT NULL,
  `followingUserID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`followID`),
  KEY `fk_followUserID_idx` (`followUserID`),
  KEY `fk_followingUserID_idx` (`followingUserID`),
  CONSTRAINT `fk_followUserID` FOREIGN KEY (`followUserID`) REFERENCES `twitter_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_followingUserID` FOREIGN KEY (`followingUserID`) REFERENCES `twitter_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `favorites` (
  `favoritID` bigint(20) NOT NULL,
  `tweetID` bigint(20) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`favoritID`),
  KEY `tweetID_idx` (`tweetID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `favoritTweetID` FOREIGN KEY (`tweetID`) REFERENCES `tweet` (`tweetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `favoritUserID` FOREIGN KEY (`userID`) REFERENCES `twitter_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);




