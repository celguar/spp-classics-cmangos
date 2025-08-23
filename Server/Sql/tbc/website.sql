-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.26 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table classicrealmd.f_attachs
DROP TABLE IF EXISTS `f_attachs`;
CREATE TABLE IF NOT EXISTS `f_attachs` (
  `attach_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attach_file` varchar(255) CHARACTER SET cp1251 NOT NULL,
  `attach_location` varchar(255) CHARACTER SET cp1251 NOT NULL,
  `attach_hits` int(10) NOT NULL DEFAULT '0',
  `attach_date` int(10) NOT NULL,
  `attach_tid` int(10) unsigned NOT NULL DEFAULT '0',
  `attach_member_id` int(8) unsigned NOT NULL,
  `attach_filesize` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.f_attachs: 0 rows
/*!40000 ALTER TABLE `f_attachs` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_attachs` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.f_categories
DROP TABLE IF EXISTS `f_categories`;
CREATE TABLE IF NOT EXISTS `f_categories` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT 'New Category',
  `cat_disp_position` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.f_categories: 1 rows
/*!40000 ALTER TABLE `f_categories` DISABLE KEYS */;
INSERT INTO `f_categories` (`cat_id`, `cat_name`, `cat_disp_position`) VALUES
	(1, 'General', 1);
/*!40000 ALTER TABLE `f_categories` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.f_forums
DROP TABLE IF EXISTS `f_forums`;
CREATE TABLE IF NOT EXISTS `f_forums` (
  `forum_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(255) NOT NULL DEFAULT 'New forum',
  `forum_desc` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(200) DEFAULT NULL,
  `moderators` varchar(255) DEFAULT NULL,
  `num_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_topic_id` int(10) unsigned DEFAULT NULL,
  `disp_position` smallint(6) NOT NULL DEFAULT '0',
  `quick_reply` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.f_forums: 1 rows
/*!40000 ALTER TABLE `f_forums` DISABLE KEYS */;
INSERT INTO `f_forums` (`forum_id`, `forum_name`, `forum_desc`, `redirect_url`, `moderators`, `num_topics`, `num_posts`, `last_topic_id`, `disp_position`, `quick_reply`, `closed`, `hidden`, `cat_id`) VALUES
	(1, 'Connection info', '', NULL, NULL, 1, 2, 1, 1, 0, 0, 0, 1);
/*!40000 ALTER TABLE `f_forums` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.f_markread
DROP TABLE IF EXISTS `f_markread`;
CREATE TABLE IF NOT EXISTS `f_markread` (
  `marker_member_id` int(8) unsigned NOT NULL DEFAULT '0',
  `marker_forum_id` int(10) unsigned NOT NULL DEFAULT '0',
  `marker_last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `marker_unread` smallint(5) NOT NULL DEFAULT '0',
  `marker_topics_read` text NOT NULL,
  `marker_last_cleared` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `marker_forum_id` (`marker_forum_id`,`marker_member_id`),
  KEY `marker_member_id` (`marker_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.f_markread: 0 rows
/*!40000 ALTER TABLE `f_markread` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_markread` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.f_posts
DROP TABLE IF EXISTS `f_posts`;
CREATE TABLE IF NOT EXISTS `f_posts` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` varchar(12) NOT NULL,
  `poster_id` int(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(15) DEFAULT NULL,
  `poster_character_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `posted` int(10) unsigned NOT NULL DEFAULT '0',
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_by` varchar(30) DEFAULT NULL,
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.f_posts: 0 rows
/*!40000 ALTER TABLE `f_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_posts` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.f_topics
DROP TABLE IF EXISTS `f_topics`;
CREATE TABLE IF NOT EXISTS `f_topics` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_poster` varchar(12) NOT NULL,
  `topic_poster_id` int(8) unsigned NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `topic_posted` int(10) unsigned NOT NULL DEFAULT '0',
  `last_post` int(10) unsigned NOT NULL DEFAULT '0',
  `last_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_poster` varchar(200) DEFAULT NULL,
  `num_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_replies` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `redirect_url` varchar(200) DEFAULT NULL,
  `forum_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.f_topics: 0 rows
/*!40000 ALTER TABLE `f_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_topics` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_accounts
DROP TABLE IF EXISTS `website_accounts`;
CREATE TABLE IF NOT EXISTS `website_accounts` (
  `account_id` int(11) unsigned NOT NULL,
  `character_id` int(11) unsigned DEFAULT NULL,
  `character_name` varchar(12) DEFAULT NULL,
  `fname` varchar(12) DEFAULT NULL,
  `lname` varchar(12) DEFAULT NULL,
  `city` varchar(12) DEFAULT NULL,
  `display_name` varchar(12) DEFAULT NULL,
  `g_id` smallint(5) unsigned NOT NULL DEFAULT '2',
  `avatar` varchar(60) DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `homepage` varchar(100) DEFAULT NULL,
  `icq` varchar(12) DEFAULT NULL,
  `aim` varchar(12) DEFAULT NULL,
  `location` varchar(2) DEFAULT NULL,
  `gmt` varchar(6) DEFAULT NULL,
  `signature` text,
  `hideemail` tinyint(1) NOT NULL DEFAULT '1',
  `hideprofile` tinyint(1) DEFAULT '0',
  `hidelocation` tinyint(1) NOT NULL DEFAULT '1',
  `theme` smallint(5) unsigned NOT NULL DEFAULT '0',
  `forum_posts` int(10) unsigned NOT NULL DEFAULT '0',
  `registration_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `activation_code` varchar(40) DEFAULT NULL,
  `msn` varchar(255) DEFAULT NULL,
  `yahoo` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `secretq1` varchar(300) NOT NULL DEFAULT '0',
  `secreta1` varchar(300) NOT NULL DEFAULT '0',
  `vip` int(1) NOT NULL DEFAULT '0',
  `donator` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_accounts: 0 rows
/*!40000 ALTER TABLE `website_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_accounts` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_account_groups
DROP TABLE IF EXISTS `website_account_groups`;
CREATE TABLE IF NOT EXISTS `website_account_groups` (
  `g_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `g_title` varchar(32) NOT NULL,
  `g_prefix` char(6) DEFAULT NULL,
  `g_is_admin` tinyint(1) DEFAULT '0',
  `g_is_supadmin` tinyint(1) DEFAULT '0',
  `g_use_search` tinyint(1) DEFAULT '0',
  `g_view_profile` tinyint(1) DEFAULT '0',
  `g_post_new_topics` tinyint(1) DEFAULT '0',
  `g_reply_other_topics` tinyint(1) DEFAULT '0',
  `g_use_attach` tinyint(1) DEFAULT '0',
  `g_edit_own_posts` tinyint(1) DEFAULT '0',
  `g_delete_own_posts` tinyint(1) DEFAULT '0',
  `g_delete_own_topics` tinyint(1) DEFAULT '0',
  `g_forum_moderate` tinyint(1) NOT NULL DEFAULT '0',
  `g_use_pm` tinyint(1) DEFAULT '0',
  `g_gal_view` tinyint(1) NOT NULL DEFAULT '0',
  `g_gal_upload` tinyint(1) DEFAULT '0',
  `g_gal_download` tinyint(1) DEFAULT '0',
  `g_gal_moderate` tinyint(1) DEFAULT '0',
  `g_gal_balanceon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_account_groups: 5 rows
/*!40000 ALTER TABLE `website_account_groups` DISABLE KEYS */;
INSERT INTO `website_account_groups` (`g_id`, `g_title`, `g_prefix`, `g_is_admin`, `g_is_supadmin`, `g_use_search`, `g_view_profile`, `g_post_new_topics`, `g_reply_other_topics`, `g_use_attach`, `g_edit_own_posts`, `g_delete_own_posts`, `g_delete_own_topics`, `g_forum_moderate`, `g_use_pm`, `g_gal_view`, `g_gal_upload`, `g_gal_download`, `g_gal_moderate`, `g_gal_balanceon`) VALUES
	(1, 'Guests', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
	(2, 'Members', NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1),
	(3, 'Administrators', '+', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
	(4, 'Root Admins', '&#165;', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
	(5, 'Banned', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `website_account_groups` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_account_keys
DROP TABLE IF EXISTS `website_account_keys`;
CREATE TABLE IF NOT EXISTS `website_account_keys` (
  `id` int(11) unsigned NOT NULL,
  `key` varchar(40) DEFAULT NULL,
  `assign_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_account_keys: 0 rows
/*!40000 ALTER TABLE `website_account_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_account_keys` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_captcha
DROP TABLE IF EXISTS `website_captcha`;
CREATE TABLE IF NOT EXISTS `website_captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) NOT NULL DEFAULT '',
  `filekey` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_captcha: 0 rows
/*!40000 ALTER TABLE `website_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_captcha` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_donations
DROP TABLE IF EXISTS `website_donations`;
CREATE TABLE IF NOT EXISTS `website_donations` (
  `id_donation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_account` int(10) unsigned NOT NULL,
  `value` varchar(45) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_donation`,`id_account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_donations: 0 rows
/*!40000 ALTER TABLE `website_donations` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_donations` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_donation_templates
DROP TABLE IF EXISTS `website_donation_templates`;
CREATE TABLE IF NOT EXISTS `website_donation_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donation` varchar(255) NOT NULL,
  `items` varchar(4000) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `description` varchar(255) NOT NULL,
  `itemset` varchar(1000) NOT NULL,
  `realm` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_donation_templates: 0 rows
/*!40000 ALTER TABLE `website_donation_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_donation_templates` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_gallery
DROP TABLE IF EXISTS `website_gallery`;
CREATE TABLE IF NOT EXISTS `website_gallery` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `img` text NOT NULL,
  `comment` text NOT NULL,
  `autor` text NOT NULL,
  `date` date NOT NULL,
  `cat` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table classicrealmd.website_gallery: 2 rows
/*!40000 ALTER TABLE `website_gallery` DISABLE KEYS */;
INSERT INTO `website_gallery` (`id`, `img`, `comment`, `autor`, `date`, `cat`) VALUES
	(1, 'Mangosweb_wall.jpg', 'Test Wallpaper', 'MangosWeb', '0000-00-00', 'wallpaper'),
	(2, 'Mangosweb_scr.jpg', 'Test Screenshot', 'MangosWeb', '0000-00-00', 'screenshot');
/*!40000 ALTER TABLE `website_gallery` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_gallery_ssotd
DROP TABLE IF EXISTS `website_gallery_ssotd`;
CREATE TABLE IF NOT EXISTS `website_gallery_ssotd` (
  `image` varchar(50) NOT NULL,
  `date` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_gallery_ssotd: 1 rows
/*!40000 ALTER TABLE `website_gallery_ssotd` DISABLE KEYS */;
INSERT INTO `website_gallery_ssotd` (`image`, `date`) VALUES
	('Mangosweb_scr.jpg', '21.09.09');
/*!40000 ALTER TABLE `website_gallery_ssotd` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_misc
DROP TABLE IF EXISTS `website_misc`;
CREATE TABLE IF NOT EXISTS `website_misc` (
  `id_misc` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `urls` text,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_misc`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_misc: 2 rows
/*!40000 ALTER TABLE `website_misc` DISABLE KEYS */;
INSERT INTO `website_misc` (`id_misc`, `title`, `text`, `urls`, `image`) VALUES
	(1, 'Pictures', 'Enjoy our Picture Galleries. Share yours with us aswell.', '[url=?n=media.screenshots]Screenshots[/url]\r\n[url=?n=media.wallpapers]Wallpapers[/url]\r\n[url=?n=community.fanart]Fan Art[/url]', 'misc-image-bc.gif'),
	(2, 'Challenges', 'Two different types where you must use your strategy or creativity.', '[url=?n=community.contests]Contests[/url]\r\n[url=?n=workshop.eventscalendar]Events Calendar[/url]', 'misc-icon-insider.gif');
/*!40000 ALTER TABLE `website_misc` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_online
DROP TABLE IF EXISTS `website_online`;
CREATE TABLE IF NOT EXISTS `website_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `user_name` varchar(200) NOT NULL DEFAULT 'Guest',
  `user_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `logged` int(10) NOT NULL DEFAULT '0',
  `currenturl` varchar(255) NOT NULL DEFAULT './',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_online: 0 rows
/*!40000 ALTER TABLE `website_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_online` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_pms
DROP TABLE IF EXISTS `website_pms`;
CREATE TABLE IF NOT EXISTS `website_pms` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `message` text,
  `sender_id` int(8) unsigned NOT NULL DEFAULT '0',
  `posted` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(15) DEFAULT '0.0.0.0',
  `showed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_pms: 0 rows
/*!40000 ALTER TABLE `website_pms` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_pms` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_realm_settings
DROP TABLE IF EXISTS `website_realm_settings`;
CREATE TABLE IF NOT EXISTS `website_realm_settings` (
  `id_realm` int(10) unsigned NOT NULL,
  `dbuser` varchar(25) NOT NULL,
  `dbpass` varchar(25) NOT NULL,
  `dbhost` varchar(25) NOT NULL,
  `dbport` varchar(5) NOT NULL,
  `dbname` varchar(25) NOT NULL,
  `chardbname` varchar(25) NOT NULL,
  `uptime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `template` varchar(50) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_realm_settings: 1 rows
/*!40000 ALTER TABLE `website_realm_settings` DISABLE KEYS */;
INSERT INTO `website_realm_settings` (`id_realm`, `dbuser`, `dbpass`, `dbhost`, `dbport`, `dbname`, `chardbname`, `uptime`, `template`) VALUES
	(1, 'root', '123456', '127.0.0.1', '3310', 'tbcmangos', 'tbccharacters', '0000-00-00 00:00:00', 'tbc');
/*!40000 ALTER TABLE `website_realm_settings` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_regkeys
DROP TABLE IF EXISTS `website_regkeys`;
CREATE TABLE IF NOT EXISTS `website_regkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_regkeys: 0 rows
/*!40000 ALTER TABLE `website_regkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_regkeys` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_voting
DROP TABLE IF EXISTS `website_voting`;
CREATE TABLE IF NOT EXISTS `website_voting` (
  `user_ip` varchar(30) NOT NULL,
  `sites` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_voting: ~0 rows (approximately)
/*!40000 ALTER TABLE `website_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_voting` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_voting_points
DROP TABLE IF EXISTS `website_voting_points`;
CREATE TABLE IF NOT EXISTS `website_voting_points` (
  `id` bigint(20) unsigned NOT NULL,
  `points` smallint(5) unsigned NOT NULL DEFAULT '0',
  `date` varchar(8) NOT NULL DEFAULT '20081214',
  `date_points` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `times_voted` smallint(5) NOT NULL DEFAULT '0',
  `points_earned` bigint(20) NOT NULL DEFAULT '0',
  `points_spent` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_voting_points: ~0 rows (approximately)
/*!40000 ALTER TABLE `website_voting_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_voting_points` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_voting_rewards
DROP TABLE IF EXISTS `website_voting_rewards`;
CREATE TABLE IF NOT EXISTS `website_voting_rewards` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `item_id` decimal(10,0) NOT NULL,
  `quanity` decimal(10,0) NOT NULL,
  `cost` decimal(10,0) NOT NULL,
  `quality` decimal(10,0) NOT NULL,
  `reward_text` varchar(255) NOT NULL,
  `realmid` decimal(10,0) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_voting_rewards: 0 rows
/*!40000 ALTER TABLE `website_voting_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_voting_rewards` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.website_voting_sites
DROP TABLE IF EXISTS `website_voting_sites`;
CREATE TABLE IF NOT EXISTS `website_voting_sites` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(255) NOT NULL,
  `votelink` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `points` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.website_voting_sites: 0 rows
/*!40000 ALTER TABLE `website_voting_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_voting_sites` ENABLE KEYS */;

-- Dumping structure for table classicrealmd.world_entries
DROP TABLE IF EXISTS `world_entries`;
CREATE TABLE IF NOT EXISTS `world_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(255) NOT NULL,
  `last_inc` int(20) NOT NULL,
  `last_id` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table classicrealmd.world_entries: 3 rows
/*!40000 ALTER TABLE `world_entries` DISABLE KEYS */;
INSERT INTO `world_entries` (`id`, `db_name`, `last_inc`, `last_id`) VALUES
	(1, 'character', 0, 0),
	(2, 'item_instance', 0, 0),
	(3, 'mail', 0, 0);
/*!40000 ALTER TABLE `world_entries` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

INSERT INTO `website_accounts` (`account_id`, `display_name`) SELECT `id`, `username` FROM `account`;

UPDATE `website_accounts`
  SET `g_id` = '3' WHERE `account_id` IN (SELECT `id` FROM `account` WHERE `gmlevel` = '3');
  
UPDATE `website_accounts`
  SET `g_id` = '4' WHERE `account_id` IN (SELECT `id` FROM `account` WHERE `gmlevel` = '4');
