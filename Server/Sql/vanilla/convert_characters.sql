--
-- Table structure for table `account_instances_entered`
--

DROP TABLE IF EXISTS `account_instances_entered`;
CREATE TABLE `account_instances_entered` (
   `AccountId` INT(11) UNSIGNED NOT NULL COMMENT 'Player account',
   `ExpireTime` BIGINT(40) NOT NULL COMMENT 'Time when instance was entered',
   `InstanceId` INT(11) UNSIGNED NOT NULL COMMENT 'ID of instance entered',
   PRIMARY KEY(`AccountId`,`InstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Instance reset limit system';

--
-- Dumping data for table `account_instances_entered`
--

LOCK TABLES `account_instances_entered` WRITE;
/*!40000 ALTER TABLE `account_instances_entered` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_instances_entered` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `character_db_version`
--

DROP TABLE IF EXISTS `character_db_version`;
CREATE TABLE `character_db_version` (
  `required_z2770_01_characters_item_instance_duration_default` bit(1) DEFAULT NULL
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


DROP TABLE IF EXISTS `character_queststatus_weekly`;
CREATE TABLE `character_queststatus_weekly` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Player System';


--
-- Table structure for table `playerbot_saved_data`
--

DROP TABLE IF EXISTS `playerbot_saved_data`;
CREATE TABLE `playerbot_saved_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `combat_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `primary_target` int(11) unsigned NOT NULL DEFAULT '0',
  `secondary_target` int(11) unsigned NOT NULL DEFAULT '0',
  `pname` varchar(12) NOT NULL DEFAULT '',
  `sname` varchar(12) NOT NULL DEFAULT '',
  `combat_delay` INT(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS world_state;
CREATE TABLE world_state(
   Id INT(11) UNSIGNED NOT NULL COMMENT 'Internal save ID',
   Data longtext,
   PRIMARY KEY(`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='WorldState save system';


ALTER TABLE `character_honor_cp`
	DROP COLUMN `used`;

ALTER TABLE `character_pet`
	ADD COLUMN `xpForNextLoyalty` int(11) unsigned NOT NULL default '0' AFTER `loyalty`;

ALTER TABLE `character_spell_cooldown`
	CHANGE COLUMN `spell` `SpellId` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell Identifier' AFTER `guid`,
	CHANGE COLUMN `item` `ItemId` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item Identifier' AFTER `SpellId`,
	CHANGE COLUMN `time` `SpellExpireTime` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell cooldown expire time' AFTER `SpellId`,
	ADD COLUMN `Category` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category' AFTER `SpellExpireTime`,
	ADD COLUMN `CategoryExpireTime` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category cooldown expire time' AFTER `Category`;


DROP TABLE IF EXISTS `gm_tickets`;
CREATE TABLE `gm_tickets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GM Ticket\'s unique identifier',
  `category` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'GM Ticket Category DBC entry\'s identifier',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Ticket\'s current state',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Ticket\'s current status',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Ticket\'s security level',
  `author_guid` int(11) unsigned NOT NULL COMMENT 'Player\'s character Global Unique Identifier',
  `author_name` varchar(12) NOT NULL COMMENT 'Player\'s character name',
  `locale` varchar(4) NOT NULL DEFAULT 'enUS' COMMENT 'Player\'s client locale name',
  `mapid` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Character\'s map identifier on submission',
  `x` float NOT NULL DEFAULT '0' COMMENT 'Character\'s x coordinate on submission',
  `y` float NOT NULL DEFAULT '0' COMMENT 'Character\'s y coordinate on submission',
  `z` float NOT NULL DEFAULT '0' COMMENT 'Character\'s z coordinate on submission',
  `o` float NOT NULL DEFAULT '0' COMMENT 'Character\'s orientation angle on submission',
  `text` text NOT NULL COMMENT 'Ticket\'s message',
  `created` bigint(40) unsigned NOT NULL COMMENT 'Timestamp: ticket created by a player',
  `updated` bigint(40) unsigned NOT NULL DEFAULT 0 COMMENT 'Timestamp: ticket text\'s last update',
  `seen` bigint(40) unsigned NOT NULL DEFAULT 0 COMMENT 'Timestamp: ticket\'s last time opened by a GM',
  `answered` bigint(40) unsigned NOT NULL DEFAULT 0 COMMENT 'Timestamp: ticket\'s last time answered by a GM',
  `closed` bigint(40) unsigned NOT NULL DEFAULT 0 COMMENT 'Timestamp: ticket closed by a GM',
  `assignee_guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Assignee\'s character\'s Global Unique Identifier',
  `assignee_name` varchar(12) NOT NULL DEFAULT '' COMMENT 'Assignee\'s character\'s name',
  `conclusion` varchar(255) NOT NULL DEFAULT '' COMMENT 'Assignee\'s final conclusion on this ticket',
  `notes` varchar(10000) NOT NULL DEFAULT '' COMMENT 'Additional notes for GMs',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='GM Tickets System';

--
-- Dumping data for table `gm_tickets`
--

LOCK TABLES `gm_tickets` WRITE;
/*!40000 ALTER TABLE `gm_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_surveys`
--

DROP TABLE IF EXISTS `gm_surveys`;
CREATE TABLE `gm_surveys` (
  `ticketid` int(11) unsigned NOT NULL COMMENT 'GM Ticket\'s unique identifier',
  `surveyid` int(2) unsigned NOT NULL COMMENT 'Survey DBC entry\'s identifier',
  `answer1` tinyint(2) unsigned,
  `answer2` tinyint(2) unsigned,
  `answer3` tinyint(2) unsigned,
  `answer4` tinyint(2) unsigned,
  `answer5` tinyint(2) unsigned,
  `answer6` tinyint(2) unsigned,
  `answer7` tinyint(2) unsigned,
  `answer8` tinyint(2) unsigned,
  `answer9` tinyint(2) unsigned,
  `answer10` tinyint(2) unsigned,
  `comment` text COMMENT 'Player\'s feedback',
  PRIMARY KEY (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='GM Tickets System';

--
-- Dumping data for table `gm_surveys`
--

LOCK TABLES `gm_surveys` WRITE;
/*!40000 ALTER TABLE `gm_surveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Migrating data from table `character_tickets` to table `gm_tickets`
--

LOCK TABLES `gm_tickets` WRITE, `characters` AS C WRITE, `character_ticket` AS T WRITE;
/*!40000 ALTER TABLE `gm_tickets` DISABLE KEYS */;
INSERT INTO `gm_tickets` (`author_guid`, `author_name`, `text`, `created`) SELECT T.`guid`, C.`name`, T.`ticket_text`, UNIX_TIMESTAMP() FROM `character_ticket` T INNER JOIN `characters` C ON T.`guid` = C.`guid` ORDER BY T.`ticket_id`;
/*!40000 ALTER TABLE `gm_tickets` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `character_ticket`;

ALTER TABLE `gm_tickets` MODIFY COLUMN `created` bigint(40) unsigned NOT NULL;
ALTER TABLE `gm_tickets` MODIFY COLUMN `updated` bigint(40) unsigned NOT NULL DEFAULT 0;
ALTER TABLE `gm_tickets` MODIFY COLUMN `seen` bigint(40) unsigned NOT NULL DEFAULT 0;
ALTER TABLE `gm_tickets` MODIFY COLUMN `answered` bigint(40) unsigned NOT NULL DEFAULT 0;
ALTER TABLE `gm_tickets` MODIFY COLUMN `closed` bigint(40) unsigned NOT NULL DEFAULT 0;
ALTER TABLE `gm_tickets` MODIFY COLUMN `created` bigint(40) unsigned NOT NULL;


ALTER TABLE `saved_variables`
	ADD COLUMN `NextWeeklyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0' FIRST;

ALTER TABLE `instance`
	ADD COLUMN `encountersMask` int(10) unsigned NOT NULL DEFAULT '0' AFTER `resettime`;

DROP TABLE IF EXISTS `item_instance_backup_pre_data_field_drop`;
CREATE TABLE item_instance_backup_pre_data_field_drop AS (SELECT * FROM item_instance);

ALTER TABLE `item_instance`
 ADD `itemEntry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `owner_guid`,
 ADD `creatorGuid` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `itemEntry`,
 ADD `giftCreatorGuid` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `creatorGuid`,
 ADD `count` INT(10) UNSIGNED NOT NULL DEFAULT '1' AFTER `giftCreatorGuid`,
 ADD `duration` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `count`,
 ADD `charges` TEXT NOT NULL AFTER `duration`,
 ADD `flags` INT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `charges`,
 ADD `enchantments` TEXT NOT NULL AFTER `flags`,
 ADD `randomPropertyId` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `enchantments`,
 ADD `durability` INT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `randomPropertyId`,
 ADD `itemTextId` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `durability`;
 
 -- Temporarily change delimiter to prevent SQL syntax errors
DELIMITER ||

-- Function to convert ints from unsigned to signed
DROP FUNCTION IF EXISTS `uint32toint32`||
CREATE FUNCTION `uint32toint32`(input INT(10) UNSIGNED) RETURNS BIGINT(20) SIGNED DETERMINISTIC
BEGIN
  RETURN CAST((input<<32) AS SIGNED)/(1<<32);
END||

-- Restore original delimiter
DELIMITER ;

-- Move data to new fields
UPDATE `item_instance` SET
`itemEntry` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',3))+2, length(SUBSTRING_INDEX(`data`,' ',3+1))-length(SUBSTRING_INDEX(data,' ',3))-1),
`creatorGuid` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',10))+2, length(SUBSTRING_INDEX(`data`,' ',10+1))-length(SUBSTRING_INDEX(data,' ',10))-1),
`giftCreatorGuid` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',12))+2, length(SUBSTRING_INDEX(`data`,' ',12+1))-length(SUBSTRING_INDEX(data,' ',12))-1),
`count` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',14))+2, length(SUBSTRING_INDEX(`data`,' ',14+1))-length(SUBSTRING_INDEX(data,' ',14))-1),
`duration` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',15))+2, length(SUBSTRING_INDEX(`data`,' ',15+1))-length(SUBSTRING_INDEX(data,' ',15))-1),
`charges` = CONCAT_WS(' ',
 uint32toint32(SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',16))+2, length(SUBSTRING_INDEX(`data`,' ',16+1))-length(SUBSTRING_INDEX(data,' ',16))-1)),
 uint32toint32(SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',17))+2, length(SUBSTRING_INDEX(`data`,' ',17+1))-length(SUBSTRING_INDEX(data,' ',17))-1)),
 uint32toint32(SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',18))+2, length(SUBSTRING_INDEX(`data`,' ',18+1))-length(SUBSTRING_INDEX(data,' ',18))-1)),
 uint32toint32(SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',19))+2, length(SUBSTRING_INDEX(`data`,' ',19+1))-length(SUBSTRING_INDEX(data,' ',19))-1)),
 uint32toint32(SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',20))+2, length(SUBSTRING_INDEX(`data`,' ',20+1))-length(SUBSTRING_INDEX(data,' ',20))-1)) ),
`flags` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',21))+2, length(SUBSTRING_INDEX(`data`,' ',21+1))-length(SUBSTRING_INDEX(data,' ',21))-1),
`enchantments` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',22))+2, length(SUBSTRING_INDEX(`data`,' ',42+1))-length(SUBSTRING_INDEX(data,' ',22))-1),
`randomPropertyId` = uint32toint32(SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',44))+2, length(SUBSTRING_INDEX(`data`,' ',44+1))-length(SUBSTRING_INDEX(data,' ',44))-1)),
`durability` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',46))+2, length(SUBSTRING_INDEX(`data`,' ',46+1))-length(SUBSTRING_INDEX(data,' ',46))-1),
`itemTextId` = SUBSTRING(`data`, length(SUBSTRING_INDEX(`data`,' ',45))+2, length(SUBSTRING_INDEX(`data`,' ',45+1))-length(SUBSTRING_INDEX(data,' ',45))-1);

-- Drop function
DROP FUNCTION IF EXISTS `uint32toint32`;

-- Drop old field 
 ALTER TABLE `item_instance` DROP `data`;

ALTER TABLE item_instance ALTER duration SET DEFAULT 0;

TRUNCATE `character_honor_cp`;

