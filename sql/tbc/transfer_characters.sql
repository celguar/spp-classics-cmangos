
-- Table structure for table `character_db_version`
--

DROP TABLE IF EXISTS `character_db_version`;
CREATE TABLE `character_db_version` (
  `required_s2423_01_characters_item_instance_duration_default` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Last applied sql update to DB';

--
-- Dumping data for table `character_db_version`
--

LOCK TABLES `character_db_version` WRITE;
/*!40000 ALTER TABLE `character_db_version` DISABLE KEYS */;
INSERT INTO `character_db_version` VALUES
(NULL);
/*!40000 ALTER TABLE `character_db_version` ENABLE KEYS */;
UNLOCK TABLES;

ALTER TABLE `characters`
	ADD COLUMN `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0' AFTER `map`,
        ADD COLUMN `arenaPoints` int(10) unsigned NOT NULL DEFAULT '0' AFTER `taxi_path`,
        DROP COLUMN `honor_highest_rank`,
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

ALTER TABLE `petition`
  ADD COLUMN `type` int(10) unsigned NOT NULL DEFAULT '0' AFTER `name`;

ALTER TABLE `petition_sign`
  ADD COLUMN `type` int(10) unsigned NOT NULL DEFAULT '0' AFTER `player_account`;

-- RESET TALENTS
UPDATE `characters`
  SET `at_login` = `at_login` | '4' WHERE (at_login & '4') = '0';

-- SET AS FIRST LOGIN TO GET COLLECTORS REWARD
UPDATE `characters`
  SET `at_login` = `at_login` | '32' WHERE (at_login & '32') = '0';

DROP TABLE IF EXISTS world_state;
CREATE TABLE world_state(
   Id INT(11) UNSIGNED NOT NULL COMMENT 'Internal save ID',
   Data longtext,
   PRIMARY KEY(`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='WorldState save system';
   