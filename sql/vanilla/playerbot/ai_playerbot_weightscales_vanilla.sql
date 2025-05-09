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

-- Dumping structure for table classicplayerbots.ai_playerbot_weightscales
DROP TABLE IF EXISTS `ai_playerbot_weightscales`;
CREATE TABLE IF NOT EXISTS `ai_playerbot_weightscales` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table classicplayerbots.ai_playerbot_weightscales: ~32 rows (approximately)
/*!40000 ALTER TABLE `ai_playerbot_weightscales` DISABLE KEYS */;
INSERT INTO `ai_playerbot_weightscales` (`id`, `name`, `class`) VALUES
	(1, 'arms', 1),
	(2, 'fury', 1),
	(3, 'prot', 1),
	(4, 'holy', 2),
	(5, 'prot', 2),
	(6, 'retrib', 2),
	(7, 'beast', 3),
	(8, 'marks', 3),
	(9, 'surv', 3),
	(10, 'assas', 4),
	(11, 'combat', 4),
	(12, 'subtle', 4),
	(13, 'disc', 5),
	(14, 'holy', 5),
	(15, 'shadow', 5),
	(16, 'blooddps', 6),
	(17, 'frostdps', 6),
	(18, 'frosttank', 6),
	(19, 'unholydps', 6),
	(20, 'elem', 7),
	(21, 'enhance', 7),
	(22, 'resto', 7),
	(23, 'arcane', 8),
	(24, 'fire', 8),
	(25, 'frost', 8),
	(26, 'afflic', 9),
	(27, 'demo', 9),
	(28, 'destro', 9),
	(29, 'balance', 11),
	(30, 'feraltank', 11),
	(31, 'resto', 11),
	(32, 'feraldps', 11);
/*!40000 ALTER TABLE `ai_playerbot_weightscales` ENABLE KEYS */;

-- Dumping structure for table classicmangos.ai_playerbot_weightscale_data
DROP TABLE IF EXISTS `ai_playerbot_weightscale_data`;
CREATE TABLE IF NOT EXISTS `ai_playerbot_weightscale_data` (
  `id` int(32) NOT NULL,
  `field` varchar(18) NOT NULL,
  `val` smallint(6) unsigned NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table classicmangos.ai_playerbot_weightscale_data: ~217 rows (approximately)
INSERT INTO `ai_playerbot_weightscale_data` (`id`, `field`, `val`) VALUES
	(1, 'str', 4),
	(1, 'critstrkrtng', 40),
	(1, 'agi', 2),
	(1, 'hitrtng', 40),
	(1, 'atkpwr', 2),
	(2, 'str', 4),
	(2, 'critstrkrtng', 40),
	(2, 'agi', 2),
	(2, 'hitrtng', 40),
	(2, 'atkpwr', 2),
	(3, 'sta', 6),
	(3, 'dodgertng', 7),
	(3, 'defrtng', 1),
	(3, 'block', 3),
	(3, 'agi', 4),
	(3, 'parryrtng', 6),
	(3, 'blockrtng', 6),
	(3, 'str', 7),
	(3, 'atkpwr', 4),
	(3, 'hitrtng', 100),
	(3, 'critstrkrtng', 81),
	(4, 'int', 5),
	(4, 'manargn', 15),
	(4, 'splheal', 5),
	(4, 'spellcritstrkrtng', 100),
	(5, 'sta', 6),
	(5, 'dodgertng', 6),
	(5, 'block', 1),
	(5, 'defrtng', 8),
	(5, 'exprtng', 1),
	(5, 'agi', 5),
	(5, 'parryrtng', 5),
	(5, 'hitrtng', 1),
	(5, 'blockrtng', 14),
	(5, 'str', 1),
	(5, 'armor', 1),
	(5, 'atkpwr', 6),
	(5, 'splpwr', 2),
	(5, 'critstrkrtng', 3),
	(6, 'mledps', 28),
	(6, 'hitrtng', 40),
	(6, 'str', 4),
	(6, 'critstrkrtng', 30),
	(6, 'atkpwr', 2),
	(6, 'agi', 2),
	(7, 'hitrtng', 22),
	(7, 'agi', 4),
	(7, 'critstrkrtng', 29),
	(7, 'atkpwr', 1),
	(8, 'hitrtng', 22),
	(8, 'agi', 4),
	(8, 'critstrkrtng', 29),
	(8, 'atkpwr', 1),
	(8, 'rgddps', 14),
	(9, 'hitrtng', 22),
	(9, 'agi', 4),
	(9, 'critstrkrtng', 29),
	(9, 'atkpwr', 1),
	(9, 'rgddps', 14),
	(10, 'agi', 4),
	(10, 'hitrtng', 36),
	(10, 'critstrkrtng', 46),
	(10, 'atkpwr', 2),
	(10, 'str', 2),
	(11, 'agi', 4),
	(11, 'hitrtng', 36),
	(11, 'critstrkrtng', 46),
	(11, 'str', 2),
	(11, 'atkpwr', 2),
	(12, 'agi', 4),
	(12, 'hitrtng', 36),
	(12, 'critstrkrtng', 46),
	(12, 'mledps', 10),
	(12, 'str', 2),
	(12, 'atkpwr', 2),
	(13, 'splpwr', 29),
	(13, 'manargn', 100),
	(13, 'int', 33),
	(13, 'spellcritstrkrtng', 24),
	(13, 'spi', 34),
	(14, 'manargn', 100),
	(14, 'int', 33),
	(14, 'splheal', 29),
	(14, 'spi', 34),
	(15, 'spellhitrtng', 100),
	(15, 'shasplpwr', 10),
	(15, 'splpwr', 10),
	(15, 'spellcritstrkrtng', 24),
	(16, 'mledps', 360),
	(16, 'armorpenrtng', 100),
	(16, 'str', 99),
	(16, 'hitrtng', 91),
	(16, 'exprtng', 90),
	(16, 'critstrkrtng', 57),
	(16, 'hastertng', 55),
	(16, 'atkpwr', 36),
	(16, 'armor', 1),
	(17, 'mledps', 337),
	(17, 'hitrtng', 100),
	(17, 'str', 97),
	(17, 'exprtng', 81),
	(17, 'armorpenrtng', 61),
	(17, 'critstrkrtng', 45),
	(17, 'atkpwr', 35),
	(17, 'hastertng', 28),
	(17, 'armor', 1),
	(18, 'mledps', 419),
	(18, 'parryrtng', 100),
	(18, 'hitrtng', 97),
	(18, 'str', 96),
	(18, 'defrtng', 85),
	(18, 'exprtng', 69),
	(18, 'dodgertng', 61),
	(18, 'agi', 61),
	(18, 'sta', 61),
	(18, 'critstrkrtng', 49),
	(18, 'atkpwr', 41),
	(18, 'armorpenrtng', 31),
	(18, 'armor', 5),
	(19, 'mledps', 209),
	(19, 'str', 100),
	(19, 'hitrtng', 66),
	(19, 'exprtng', 51),
	(19, 'hastertng', 48),
	(19, 'critstrkrtng', 45),
	(19, 'atkpwr', 34),
	(19, 'armorpenrtng', 32),
	(19, 'armor', 1),
	(20, 'spellhitrtng', 100),
	(20, 'splpwr', 10),
	(20, 'spellpenrtng', 27),
	(20, 'spellcritstrkrtng', 80),
	(20, 'int', 1),
	(21, 'hitrtng', 48),
	(21, 'mledps', 28),
	(21, 'agi', 2),
	(21, 'critstrkrtng', 47),
	(21, 'str', 4),
	(21, 'atkpwr', 35),
	(22, 'manargn', 100),
	(22, 'int', 20),
	(22, 'splheal', 17),
	(22, 'splpwr', 17),
	(23, 'spellhitrtng', 100),
	(23, 'spellpenrtng', 30),
	(23, 'arcsplpwr', 7),
	(23, 'splpwr', 7),
	(23, 'spellcritstrkrtng', 81),
	(23, 'int', 1),
	(23, 'frosplpwr', 7),
	(23, 'firsplpwr', 7),
	(24, 'spellhitrtng', 100),
	(24, 'spellpenrtng', 30),
	(24, 'firsplpwr', 7),
	(24, 'splpwr', 7),
	(24, 'spellcritstrkrtng', 81),
	(24, 'frosplpwr', 7),
	(24, 'arcsplpwr', 7),
	(24, 'int', 1),
	(25, 'spellhitrtng', 100),
	(25, 'spellpenrtng', 30),
	(25, 'frosplpwr', 7),
	(25, 'splpwr', 7),
	(25, 'arcsplpwr', 7),
	(25, 'firsplpwr', 7),
	(25, 'spellcritstrkrtng', 81),
	(25, 'int', 1),
	(26, 'spellhitrtng', 100),
	(26, 'shasplpwr', 5),
	(26, 'splpwr', 5),
	(26, 'spellcritstrkrtng', 65),
	(26, 'firsplpwr', 5),
	(26, 'int', 1),
	(27, 'spellhitrtng', 100),
	(27, 'firsplpwr', 5),
	(27, 'shasplpwr', 5),
	(27, 'splpwr', 5),
	(27, 'spellcritstrkrtng', 65),
	(27, 'int', 1),
	(28, 'spellhitrtng', 100),
	(28, 'firsplpwr', 5),
	(28, 'splpwr', 5),
	(28, 'shasplpwr', 5),
	(28, 'spellcritstrkrtng', 65),
	(28, 'int', 1),
	(29, 'spellhitrtng', 100),
	(29, 'splpwr', 11),
	(29, 'spellcritstrkrtng', 74),
	(29, 'int', 1),
	(30, 'agi', 6),
	(30, 'sta', 16),
	(30, 'dodgertng', 100),
	(31, 'splheal', 10),
	(31, 'manargn', 30),
	(31, 'int', 3),
	(31, 'spi', 5),
	(32, 'agi', 10),
	(32, 'str', 11),
	(32, 'critstrkrtng', 100),
	(32, 'hitrtng', 68),
	(32, 'feratkpwr', 5),
	(32, 'atkpwr', 5),
	(29, 'arcsplpwr', 11),
	(5, 'spellhitrtng', 1),
	(5, 'int', 1),
	(20, 'natsplpwr', 10),
	(3, 'mledps', 28),
	(31, 'spellcritstrkrtng', 100),
	(31, 'splpwr', 10),
	(30, 'defrtng', 12),
	(30, 'armor', 2),
	(7, 'rgddps', 14),
	(10, 'mledps', 10),
	(11, 'mledps', 10),
	(1, 'mledps', 28),
	(2, 'mledps', 28),
	(15, 'int', 2),
	(15, 'spi', 1),
	(15, 'manargn', 1),
	(22, 'spi', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
