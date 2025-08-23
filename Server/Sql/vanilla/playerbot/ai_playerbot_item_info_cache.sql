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

-- Dumping structure for table wotlkplayerbots.ai_playerbot_item_info_cache
DROP TABLE IF EXISTS `ai_playerbot_item_info_cache`;
CREATE TABLE IF NOT EXISTS `ai_playerbot_item_info_cache` (
  `id` bigint(20) NOT NULL,
  `quality` bigint(20) DEFAULT NULL,
  `slot` bigint(20) DEFAULT NULL,
  `source` mediumint(8) DEFAULT NULL,
  `sourceId` mediumint(8) DEFAULT NULL,
  `team` mediumint(8) DEFAULT NULL,
  `faction` mediumint(8) DEFAULT NULL,
  `factionRepRank` mediumint(8) DEFAULT NULL,
  `minLevel` mediumint(8) DEFAULT NULL,
  `scale_1` mediumint(8) DEFAULT NULL,
  `scale_2` mediumint(8) DEFAULT NULL,
  `scale_3` mediumint(8) DEFAULT NULL,
  `scale_4` mediumint(8) DEFAULT NULL,
  `scale_5` mediumint(8) DEFAULT NULL,
  `scale_6` mediumint(8) DEFAULT NULL,
  `scale_7` mediumint(8) DEFAULT NULL,
  `scale_8` mediumint(8) DEFAULT NULL,
  `scale_9` mediumint(8) DEFAULT NULL,
  `scale_10` mediumint(8) DEFAULT NULL,
  `scale_11` mediumint(8) DEFAULT NULL,
  `scale_12` mediumint(8) DEFAULT NULL,
  `scale_13` mediumint(8) DEFAULT NULL,
  `scale_14` mediumint(8) DEFAULT NULL,
  `scale_15` mediumint(8) DEFAULT NULL,
  `scale_16` mediumint(8) DEFAULT NULL,
  `scale_17` mediumint(8) DEFAULT NULL,
  `scale_18` mediumint(8) DEFAULT NULL,
  `scale_19` mediumint(8) DEFAULT NULL,
  `scale_20` mediumint(8) DEFAULT NULL,
  `scale_21` mediumint(8) DEFAULT NULL,
  `scale_22` mediumint(8) DEFAULT NULL,
  `scale_23` mediumint(8) DEFAULT NULL,
  `scale_24` mediumint(8) DEFAULT NULL,
  `scale_25` mediumint(8) DEFAULT NULL,
  `scale_26` mediumint(8) DEFAULT NULL,
  `scale_27` mediumint(8) DEFAULT NULL,
  `scale_28` mediumint(8) DEFAULT NULL,
  `scale_29` mediumint(8) DEFAULT NULL,
  `scale_30` mediumint(8) DEFAULT NULL,
  `scale_31` mediumint(8) DEFAULT NULL,
  `scale_32` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI item info Cache';

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
