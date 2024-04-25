DROP TABLE IF EXISTS `custom_transmog_active`;
CREATE TABLE `custom_transmog_active` (
  `item_guid` int(11) unsigned NOT NULL,
  `transmog_entry` int(11) unsigned NOT NULL,
  `player` int(11) unsigned NOT NULL,
  PRIMARY KEY (`item_guid`),
  KEY `player` (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_transmog_discovered`;
CREATE TABLE `custom_transmog_discovered` (
  `player` int(11) unsigned NOT NULL,
  `item_entry` int(11) unsigned NOT NULL,
  PRIMARY KEY (`player`, `item_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;