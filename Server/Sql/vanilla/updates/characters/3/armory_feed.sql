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

-- Dumping structure for table wotlkcharacters.character_armory_feed
DROP TABLE IF EXISTS `character_armory_feed`;
CREATE TABLE IF NOT EXISTS `character_armory_feed` (
  `guid` int(11) NOT NULL,
  `type` smallint(1) NOT NULL,
  `data` int(11) NOT NULL,
  `date` int(11) DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `difficulty` smallint(6) DEFAULT '-1',
  `item_guid` int(11) DEFAULT '-1',
  `item_quality` smallint(6) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table wotlkcharacters.character_armory_feed: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_armory_feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_armory_feed` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
