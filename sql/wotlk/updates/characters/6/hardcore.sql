DROP TABLE IF EXISTS `custom_hardcore_loot_gameobjects`;
CREATE TABLE `custom_hardcore_loot_gameobjects` (
  `id` int(11) unsigned NOT NULL,
  `player` int(11) unsigned NOT NULL COMMENT 'Player identifier',
  `loot_id` int(11) unsigned NOT NULL COMMENT 'The loot group this gameobject is part of',
  `loot_table` int(11) unsigned NOT NULL COMMENT 'custom_hardcore_loot_tables identifier',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` int(11) NOT NULL DEFAULT '0' COMMENT 'Map identifier',
  `phase_mask` int(11) NOT NULL DEFAULT '0' COMMENT 'Phase mask identifier',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `custom_hardcore_loot_tables`;
CREATE TABLE `custom_hardcore_loot_tables` (
  `id` int(11) unsigned NOT NULL,
  `item` int(11) unsigned NOT NULL COMMENT 'Item identifier',
  `amount` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Amount of items',
  `random_property_id` smallint(5) NOT NULL DEFAULT '0' COMMENT 'The property of the item (e.g. ... of the Hawk, ... of the Monkey)',
  `durability` int(5) unsigned NOT NULL DEFAULT '0',
  `enchantments` text,
  PRIMARY KEY (`id`, `item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `custom_hardcore_grave_gameobjects`;
CREATE TABLE `custom_hardcore_grave_gameobjects` (
  `id` int(11) unsigned NOT NULL,
  `player` int(11) unsigned NOT NULL COMMENT 'Player identifier',
  `gameobject_template` int(11) unsigned NOT NULL COMMENT 'gameobject_template entry',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` int(11) NOT NULL DEFAULT '0' COMMENT 'Map identifier',
  `phase_mask` int(11) NOT NULL DEFAULT '0' COMMENT 'Phase mask identifier',
  PRIMARY KEY (`id`, `player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;