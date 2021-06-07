-- Missing Spirit Guides in Alliance/Horde caves
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (3000616, 13117, 30, 0, 0, -1437.67, -610.089, 51.1619, -0.001854, 120, 120, 0, 0, 24420, 4868, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (3000617, 13116, 30, 0, 0, 873.002, -491.284, 96.5419, -0.001854, 120, 120, 0, 0, 24420, 4868, 0, 0);
-- Fix mine events
-- Bosses
UPDATE `battleground_events` SET `event2`='0' WHERE  `map`=30 AND `event1`=46 AND `event2`=1;
UPDATE `battleground_events` SET `event2`='1' WHERE  `map`=30 AND `event1`=46 AND `event2`=3;
UPDATE `battleground_events` SET `event2`='2' WHERE  `map`=30 AND `event1`=46 AND `event2`=5;
UPDATE `battleground_events` SET `event2`='0' WHERE  `map`=30 AND `event1`=47 AND `event2`=1;
UPDATE `battleground_events` SET `event2`='1' WHERE  `map`=30 AND `event1`=47 AND `event2`=3;
UPDATE `battleground_events` SET `event2`='2' WHERE  `map`=30 AND `event1`=47 AND `event2`=5;
-- Creatures
UPDATE `battleground_events` SET `event2`='0' WHERE  `map`=30 AND `event1`=50 AND `event2`=1;
UPDATE `battleground_events` SET `event2`='1' WHERE  `map`=30 AND `event1`=50 AND `event2`=3;
UPDATE `battleground_events` SET `event2`='2' WHERE  `map`=30 AND `event1`=50 AND `event2`=5;
UPDATE `battleground_events` SET `event2`='0' WHERE  `map`=30 AND `event1`=51 AND `event2`=1;
UPDATE `battleground_events` SET `event2`='1' WHERE  `map`=30 AND `event1`=51 AND `event2`=3;
UPDATE `battleground_events` SET `event2`='2' WHERE  `map`=30 AND `event1`=51 AND `event2`=5;
-- Fix mine creatures
-- alliance
UPDATE `creature_battleground` SET `event2`='0' WHERE `event1`=50 AND `event2`=1;
UPDATE `creature_battleground` SET `event2`='0' WHERE `event1`=51 AND `event2`=1;
-- horde
UPDATE `creature_battleground` SET `event2`='1' WHERE `event1`=50 AND `event2`=3;
UPDATE `creature_battleground` SET `event2`='1' WHERE `event1`=51 AND `event2`=3;
-- neutral
UPDATE `creature_battleground` SET `event2`='2' WHERE `event1`=50 AND `event2`=5;
UPDATE `creature_battleground` SET `event2`='2' WHERE `event1`=51 AND `event2`=5;
-- boss1
UPDATE `creature_battleground` SET `event2`='0' WHERE `event1`=46 AND `event2`=1;
UPDATE `creature_battleground` SET `event2`='1' WHERE `event1`=46 AND `event2`=3;
UPDATE `creature_battleground` SET `event2`='2' WHERE `event1`=46 AND `event2`=5;
-- boss2
UPDATE `creature_battleground` SET `event2`='0' WHERE `event1`=47 AND `event2`=1;
UPDATE `creature_battleground` SET `event2`='1' WHERE `event1`=47 AND `event2`=3;
UPDATE `creature_battleground` SET `event2`='2' WHERE `event1`=47 AND `event2`=5;
-- Fix Snowfall Alliance Contested flag not usable by horde
UPDATE `gameobject_template` SET `flags`='0' WHERE  `entry`=179286;
UPDATE `gameobject_template` SET `flags`='32' WHERE  `entry`=179424;
UPDATE `gameobject_template` SET `flags`='32' WHERE  `entry`=179425;
