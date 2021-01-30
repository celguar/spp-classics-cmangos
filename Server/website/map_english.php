<?php

$character_race = array(
  1 => 'Human',
  2 => 'Orc',
  3 => 'Dwarf',
  4 => 'Night Elf',
  5 => 'Undead',
  6 => 'Tauren',
  7 => 'Gnome',
  8 => 'Troll',
  9 => 'Goblin',
  10 => 'Blood Elf',
  11 => 'Drenai');

$character_class = array(
  1 => 'Warrior',
  2 => 'Paladin',
  3 => 'Hunter',
  4 => 'Rogue',
  5 => 'Priest',
  6 => 'Death Knight',
  7 => 'Shaman',
  8 => 'Mage',
  9 => 'Warlock',
  11 => 'Druid');
if($realm_id == 1) {
	$lang_defs = array(
  'maps_names' => array('Azeroth'),
  'total' => 'Total',
  'faction' => array('Alliance', 'Horde'),
  'name' => 'Name',
  'race' => 'Race',
  'class' => 'Class',
  'level' => 'lvl',
  'click_to_next' => 'Click: go to next',
  'click_to_first' => 'Click: go to first'
);
}
if($realm_id == 2) {
	$lang_defs = array(
  'maps_names' => array('Azeroth','Outland'),
  'total' => 'Total',
  'faction' => array('Alliance', 'Horde'),
  'name' => 'Name',
  'race' => 'Race',
  'class' => 'Class',
  'level' => 'lvl',
  'click_to_next' => 'Click: go to next',
  'click_to_first' => 'Click: go to first'
);
}
if($realm_id == 3) {
	$lang_defs = array(
  'maps_names' => array('Azeroth','Outland','Northrend'),
  'total' => 'Total',
  'faction' => array('Alliance', 'Horde'),
  'name' => 'Name',
  'race' => 'Race',
  'class' => 'Class',
  'level' => 'lvl',
  'click_to_next' => 'Click: go to next',
  'click_to_first' => 'Click: go to first'
);
}

include "zone_names_english.php";
