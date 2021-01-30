DROP TABLE IF EXISTS `realmd_db_version`;
ALTER TABLE `account`
	ADD COLUMN `sha_pass_hash` VARCHAR(40) NOT NULL DEFAULT '' AFTER `username`,
	ADD COLUMN `os` VARCHAR(3) NOT NULL DEFAULT '' AFTER `locale`,
	ADD COLUMN `playerBot` BIT(1) NOT NULL DEFAULT b'0' AFTER `os`,
	DROP COLUMN `token`;
ALTER TABLE `realmcharacters`
	CHANGE COLUMN `acctid` `acctid` INT(11) UNSIGNED NOT NULL DEFAULT 0 AFTER `realmid`;
ALTER TABLE `realmlist`
	ADD COLUMN `localAddress` VARCHAR(255) NOT NULL DEFAULT '127.0.0.1' AFTER `address`,
	ADD COLUMN `localSubnetMask` VARCHAR(255) NOT NULL DEFAULT '255.255.255.0' AFTER `localAddress`;