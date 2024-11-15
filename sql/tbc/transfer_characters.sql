-- CONVERT DB VERSION
DROP TABLE IF EXISTS `character_db_version`;
CREATE TABLE `character_db_version` (
  `required_s2423_01_characters_item_instance_duration_default` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Last applied sql update to DB';

LOCK TABLES `character_db_version` WRITE;
/*!40000 ALTER TABLE `character_db_version` DISABLE KEYS */;
INSERT INTO `character_db_version` VALUES
(NULL);
/*!40000 ALTER TABLE `character_db_version` ENABLE KEYS */;
UNLOCK TABLES;

-- CONVERT MAIN TABLES
ALTER TABLE `characters`
  ADD COLUMN `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `map`,
  ADD COLUMN `arenaPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `taxi_path`,
  DROP COLUMN `honor_standing`,
  DROP COLUMN `stored_honor_rating`,
  DROP COLUMN `stored_dishonorable_kills`,
  CHANGE COLUMN `stored_honorable_kills` `totalKills` int(10) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `totalHonorPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `arenaPoints`,
  ADD COLUMN `todayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `totalHonorPoints`,
  ADD COLUMN `yesterdayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `todayHonorPoints`,
  ADD COLUMN `todayKills` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `totalKills`,
  ADD COLUMN `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `todayKills`,
  ADD COLUMN `chosenTitle` int(10) unsigned NOT NULL DEFAULT '0' AFTER `yesterdayKills`,
  ADD COLUMN `knownTitles` longtext AFTER `ammoId`;

ALTER TABLE `instance`
  ADD COLUMN `difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `encountersMask`;

ALTER TABLE `item_loot`
  ADD COLUMN `suffix` int(11) unsigned NOT NULL DEFAULT '0' AFTER `amount`;

ALTER TABLE `character_social`
  ADD COLUMN `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note' AFTER `flags`;

ALTER TABLE `saved_variables`
  DROP COLUMN `NextMaintenanceDate`,
  ADD COLUMN `NextArenaPointDistributionTime` bigint(40) unsigned NOT NULL DEFAULT '0' FIRST,
  ADD COLUMN `NextDailyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0' AFTER `NextArenaPointDistributionTime`,
  ADD COLUMN `NextMonthlyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0' AFTER `NextWeeklyQuestResetTime`; 

ALTER TABLE `groups`
  ADD COLUMN `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `isRaid`;

ALTER TABLE `guild`
  ADD COLUMN `BankMoney` bigint(20) unsigned NOT NULL DEFAULT '0' AFTER `createdate`;

ALTER TABLE `guild_member`
  ADD COLUMN `BankResetTimeMoney` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankRemMoney` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankResetTimeTab0` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankRemSlotsTab0` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankResetTimeTab1` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankRemSlotsTab1` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankResetTimeTab2` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankRemSlotsTab2` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankResetTimeTab3` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankRemSlotsTab3` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankResetTimeTab4` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankRemSlotsTab4` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankResetTimeTab5` int(11) unsigned NOT NULL DEFAULT '0',
  ADD COLUMN `BankRemSlotsTab5` int(11) unsigned NOT NULL DEFAULT '0';

ALTER TABLE `guild_rank`
  ADD COLUMN `BankMoneyPerDay` int(11) unsigned NOT NULL DEFAULT '0' AFTER `rights`;

DROP TABLE IF EXISTS `guild_bank_eventlog`;
CREATE TABLE `guild_bank_eventlog` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `guild_bank_item`;
CREATE TABLE `guild_bank_item` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_entry` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `guild_bank_right`;
CREATE TABLE `guild_bank_right` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `guild_bank_tab`;
CREATE TABLE `guild_bank_tab` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(100) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `petition`
  ADD COLUMN `type` int(10) unsigned NOT NULL DEFAULT '0' AFTER `name`,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (`ownerguid`,`type`);

ALTER TABLE `petition_sign`
  ADD COLUMN `type` int(10) unsigned NOT NULL DEFAULT '0' AFTER `player_account`;

-- SET ALL OLD PETITIONS TO GUILD PETITION TYPE
UPDATE `petition`
  SET `type` = 9;
UPDATE `petition_sign`
  SET `type` = 9;

-- RESET TALENTS
UPDATE `characters`
  SET `at_login` = `at_login` | '4' WHERE (at_login & '4') = '0';

-- CONVERT EXPLORED ZONES
UPDATE `characters`
  SET `exploredZones` = CONCAT(`exploredZones`, REPEAT('0 ', 64));

-- CLEAR AURAS AND COOLDOW
DELETE FROM `character_spell_cooldown`;
DELETE FROM `pet_spell_cooldown`;
DELETE FROM `character_aura`;
DELETE FROM `pet_aura`;

-- CONVERT ITEM ENCHANTMENT
UPDATE `item_instance`
  SET `enchantments` = CONCAT(INSERT(`enchantments`, 18, 0, REPEAT('0 ', 9)), REPEAT('0 ', 3));

-- SHIFT BECAUSE EXTRA 4 BANK SLOTS
UPDATE `character_inventory`
  SET `slot` = (`slot` + 4) WHERE `slot` >= 63;
-- SHIFT BECAUSE EXTRA 1 BANK BAG
UPDATE `character_inventory`
  SET `slot` = (`slot` + 1) WHERE `slot` >= 73;
-- SHIFT BECAUSE NEED TO PRESERVE ITEM ORDER AND MAKE NEW BANK COLUMN EMPTY
UPDATE `character_inventory`
  SET `slot` = (`slot` + 1) WHERE `slot` > 44 AND `slot` < 67; -- FIRST ROW
UPDATE `character_inventory`
  SET `slot` = (`slot` + 1) WHERE `slot` > 51 AND `slot` < 67; -- SECOND ROW
UPDATE `character_inventory`
  SET `slot` = (`slot` + 1) WHERE `slot` > 58 AND `slot` < 67; -- THIRD ROW

-- UPDATE TOTAL KILLS WITH CURRENT WEEK KILLS
UPDATE `characters` SET `totalKills` = (`totalKills` + (SELECT COUNT(*) FROM `character_honor_cp` WHERE `character_honor_cp`.`guid`=`characters`.`guid` AND `victim_type` > '0' AND `type` = '1'));
-- REMOVE HONOR INFO
DROP TABLE IF EXISTS `character_honor_cp`;

-- SET EMPTY TITLE FIELD
UPDATE `characters`
  SET `knownTitles` = '0 0 ';

-- CONVERT PVP TITLES
-- ALLIANCE
UPDATE `characters`
  SET `knownTitles` = CONCAT((1 << ((`honor_highest_rank` - 4) % 32)), ' 0 ') WHERE `honor_highest_rank` > '0' AND `race` IN (1,3,4,7);
-- HORDE
UPDATE `characters`
  SET `knownTitles` = CONCAT((1 << (((`honor_highest_rank` - 4) + 14) % 32)), ' 0 ') WHERE `honor_highest_rank` > '0' AND `race` IN (2,5,6,8);

-- SET TITLE AS SELECTED
-- ALLIANCE
UPDATE `characters`
  SET `chosenTitle` = (`honor_highest_rank` - 4) WHERE `honor_highest_rank` > '0' AND `race` IN (1,3,4,7);
-- HORDE
UPDATE `characters`
  SET `chosenTitle` = ((`honor_highest_rank` - 4) + 14) WHERE `honor_highest_rank` > '0' AND `race` IN (2,5,6,8);

-- ADD SCARAB LORD TITLE IF GONG! QUEST COMPLETED
UPDATE `characters`
  SET `knownTitles` = REPLACE(`knownTitles`, ' 0 ', ' 2 ') WHERE `guid` IN (SELECT `guid` FROM `character_queststatus` WHERE `quest` = '8743' AND `rewarded` = '1');

-- SET SCARAB LORD TITLE AS SELECTED
UPDATE `characters`
  SET `chosenTitle` = '33' WHERE `guid` IN (SELECT `guid` FROM `character_queststatus` WHERE `quest` = '8743' AND `rewarded` = '1');

-- DROP RANK INFO AFTER TITLE TRANSFER
ALTER TABLE `characters`
  DROP COLUMN `honor_highest_rank`;

-- SET AS FIRST LOGIN TO GET COLLECTORS REWARD
UPDATE `characters`
  SET `at_login` = `at_login` | '32' WHERE (at_login & '32') = '0';
  
-- DROP OLD ARENA TEAMS
DROP TABLE IF EXISTS `arena_team`;
CREATE TABLE `arena_team` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL,
  `captainguid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `arena_team` WRITE;
/*!40000 ALTER TABLE `arena_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `arena_team_member`;
CREATE TABLE `arena_team_member` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `played_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_week` int(10) unsigned NOT NULL DEFAULT '0',
  `played_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_season` int(10) unsigned NOT NULL DEFAULT '0',
  `personal_rating` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `arena_team_member` WRITE;
/*!40000 ALTER TABLE `arena_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_member` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `arena_team_stats`;
CREATE TABLE `arena_team_stats` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(10) unsigned NOT NULL DEFAULT '0',
  `games_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_week` int(10) unsigned NOT NULL DEFAULT '0',
  `games_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_season` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `arena_team_stats` WRITE;
/*!40000 ALTER TABLE `arena_team_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_stats` ENABLE KEYS */;
UNLOCK TABLES;

-- DROP WORLD STATE INFO  
DROP TABLE IF EXISTS world_state;
CREATE TABLE world_state(
   Id INT(11) UNSIGNED NOT NULL COMMENT 'Internal save ID',
   Data longtext,
   PRIMARY KEY(`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='WorldState save system';
   