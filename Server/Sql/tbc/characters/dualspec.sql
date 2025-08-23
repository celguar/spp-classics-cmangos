DROP TABLE IF EXISTS `custom_dualspec_talent`;
CREATE TABLE `custom_dualspec_talent` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_dualspec_talent_name`;
CREATE TABLE `custom_dualspec_talent_name` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_dualspec_action`;
CREATE TABLE `custom_dualspec_action` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `custom_dualspec_action` (`guid`, `spec`, `button`, `action`, `type`)
SELECT `guid`, 0 AS `spec`, `button`, `action`, `type` FROM `character_action`;

DROP TABLE IF EXISTS `custom_dualspec_characters`;
CREATE TABLE `custom_dualspec_characters` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spec_count` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
  `active_spec` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `custom_dualspec_characters` (`guid`)
SELECT `guid` FROM `characters`;