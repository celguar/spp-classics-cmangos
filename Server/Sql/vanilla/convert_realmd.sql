--
-- Table structure for table `realmd_db_version`
--

DROP TABLE IF EXISTS `realmd_db_version`;
CREATE TABLE `realmd_db_version` (
  `required_z2768_01_realmd_account_locale_agnostic` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Last applied sql update to DB';

--
-- Dumping data for table `realmd_db_version`
--

LOCK TABLES `realmd_db_version` WRITE;
/*!40000 ALTER TABLE `realmd_db_version` DISABLE KEYS */;
INSERT INTO `realmd_db_version` VALUES
(NULL);
/*!40000 ALTER TABLE `realmd_db_version` ENABLE KEYS */;
UNLOCK TABLES;

ALTER TABLE `account`
	DROP COLUMN `sha_pass_hash`,
	DROP COLUMN `os`,
	DROP COLUMN `playerBot`,
	ADD COLUMN `token` text AFTER `locale`;

DROP TABLE IF EXISTS account_logons;
CREATE TABLE account_logons (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
accountId INT UNSIGNED NOT NULL,
ip varchar(30) NOT NULL,
loginTime timestamp NOT NULL,
loginSource INT UNSIGNED NOT NULL
);

ALTER TABLE account CHANGE `last_ip` `lockedIp` VARCHAR(30) NOT NULL DEFAULT '0.0.0.0';
ALTER TABLE account DROP COLUMN last_login;

ALTER TABLE account DROP `locale`;
ALTER TABLE account ADD `locale` VARCHAR(4) NOT NULL DEFAULT '' AFTER `mutetime`;

ALTER TABLE `realmcharacters`
	CHANGE COLUMN `acctid` `acctid` bigint(20) unsigned NOT NULL AFTER `realmid`;

ALTER TABLE `realmlist`
	DROP COLUMN `localAddress`,
	DROP COLUMN `localSubnetMask`;

ALTER TABLE account_banned CHANGE id account_id int(11);
ALTER TABLE account_banned DROP PRIMARY KEY;
ALTER TABLE account_banned CHANGE bandate banned_at bigint(40);
ALTER TABLE account_banned CHANGE unbandate expires_at bigint(40);
ALTER TABLE account_banned CHANGE banreason reason varchar(255);
ALTER TABLE account_banned CHANGE bannedby banned_by varchar(50);
ALTER TABLE account_banned ADD COLUMN unbanned_at bigint(40) NOT NULL DEFAULT '0' AFTER banned_by;
ALTER TABLE account_banned ADD COLUMN unbanned_by varchar(50) DEFAULT NULL AFTER unbanned_at;
ALTER TABLE account_banned ADD COLUMN id int(11) PRIMARY KEY AUTO_INCREMENT FIRST;

ALTER TABLE ip_banned CHANGE bandate banned_at bigint(40);
ALTER TABLE ip_banned CHANGE unbandate expires_at bigint(40);
ALTER TABLE ip_banned CHANGE bannedby banned_by varchar(50);
ALTER TABLE ip_banned CHANGE banreason reason varchar(255);
