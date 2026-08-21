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

-- Dumping structure for table wotlkcharacters.character_stats
DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE IF NOT EXISTS `character_stats` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower1` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower2` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower3` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower4` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower5` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower6` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower7` int(10) unsigned NOT NULL DEFAULT '0',
  `strength` int(10) unsigned NOT NULL DEFAULT '0',
  `agility` int(10) unsigned NOT NULL DEFAULT '0',
  `stamina` int(10) unsigned NOT NULL DEFAULT '0',
  `intellect` int(10) unsigned NOT NULL DEFAULT '0',
  `spirit` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `resHoly` int(10) unsigned NOT NULL DEFAULT '0',
  `resFire` int(10) unsigned NOT NULL DEFAULT '0',
  `resNature` int(10) unsigned NOT NULL DEFAULT '0',
  `resFrost` int(10) unsigned NOT NULL DEFAULT '0',
  `resShadow` int(10) unsigned NOT NULL DEFAULT '0',
  `resArcane` int(10) unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float unsigned NOT NULL DEFAULT '0',
  `holyCritPct` float unsigned NOT NULL DEFAULT '0',
  `fireCritPct` float unsigned NOT NULL DEFAULT '0',
  `natureCritPct` float unsigned NOT NULL DEFAULT '0',
  `frostCritPct` float unsigned NOT NULL DEFAULT '0',
  `shadowCritPct` float unsigned NOT NULL DEFAULT '0',
  `arcaneCritPct` float unsigned NOT NULL DEFAULT '0',
  `attackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `attackPowerMod` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedAttackPowerMod` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPower` int(10) unsigned NOT NULL DEFAULT '0',
  `holyDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `fireDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `natureDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `frostDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `shadowDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `arcaneDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `healBonus` int(10) unsigned NOT NULL DEFAULT '0',
  `defenseRating` int(10) unsigned NOT NULL DEFAULT '0',
  `dodgeRating` int(10) unsigned NOT NULL DEFAULT '0',
  `parryRating` int(10) unsigned NOT NULL DEFAULT '0',
  `blockRating` int(10) unsigned NOT NULL DEFAULT '0',
  `resilience` int(10) unsigned NOT NULL DEFAULT '0',
  `meleeHitRating` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedHitRating` int(10) unsigned NOT NULL DEFAULT '0',
  `spellHitRating` int(10) unsigned NOT NULL DEFAULT '0',
  `meleeCritRating` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedCritRating` int(10) unsigned NOT NULL DEFAULT '0',
  `spellCritRating` int(10) unsigned NOT NULL DEFAULT '0',
  `meleeHasteRating` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedHasteRating` int(10) unsigned NOT NULL DEFAULT '0',
  `spellHasteRating` int(10) unsigned NOT NULL DEFAULT '0',
  `expertise` int(10) unsigned NOT NULL DEFAULT '0',
  `expertiseRating` int(10) unsigned NOT NULL DEFAULT '0',
  `mainHandDamageMin` float unsigned NOT NULL DEFAULT '0',
  `mainHandDamageMax` float unsigned NOT NULL DEFAULT '0',
  `mainHandSpeed` float unsigned NOT NULL DEFAULT '0',
  `offHandDamageMin` float unsigned NOT NULL DEFAULT '0',
  `offHandDamageMax` float unsigned NOT NULL DEFAULT '0',
  `offHandSpeed` float unsigned NOT NULL DEFAULT '0',
  `rangedDamageMin` float unsigned NOT NULL DEFAULT '0',
  `rangedDamageMax` float unsigned NOT NULL DEFAULT '0',
  `rangedSpeed` float unsigned NOT NULL DEFAULT '0',
  `manaRegen` float unsigned NOT NULL DEFAULT '0',
  `manaInterrupt` float unsigned NOT NULL DEFAULT '0',
  `pvpRank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
