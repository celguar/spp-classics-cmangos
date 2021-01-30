-- DROP TABLE IF EXISTS `account_instances_entered`;
-- DROP TABLE IF EXISTS `character_db_version`;
-- DROP TABLE IF EXISTS `character_queststatus_weekly`;
-- DROP TABLE IF EXISTS `playerbot_saved_data`;
-- DROP TABLE IF EXISTS `world_state`;
-- ALTER TABLE `character_honor_cp`
--	ADD COLUMN `used` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' AFTER `type`;
ALTER TABLE `character_pet`
	DROP COLUMN `xpForNextLoyalty`;
ALTER TABLE `character_spell_cooldown`
	CHANGE COLUMN `SpellId` `spell` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell Identifier' AFTER `guid`,
	CHANGE COLUMN `ItemId` `item` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item Identifier' AFTER `spell`,
	CHANGE COLUMN `SpellExpireTime` `time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell cooldown expire time' AFTER `item`,
	DROP COLUMN `Category`,
	DROP COLUMN `CategoryExpireTime`;
ALTER TABLE `character_ticket`
	ADD COLUMN `resolved` TINYINT(1) DEFAULT '0' AFTER `ticket_lastchange`;
ALTER TABLE `saved_variables`
	DROP COLUMN `NextWeeklyQuestResetTime`;
ALTER TABLE `instance`
	DROP COLUMN `encountersMask`;