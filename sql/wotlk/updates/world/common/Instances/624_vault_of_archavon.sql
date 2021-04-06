/* DBScriptData
DBName: Vault of Archavon
DBScriptName: 624_vault_of_archavon.sql
DB%Complete: 50%
DBComment: ReQ:
EndDBScriptData */

SET @CGUID := 6240000; -- creatures
SET @OGUID := 6240000; -- gameobjects
SET @PGUID := 53900;   -- pools

-- texts
-- 2000028000 - 2000028199 Reserved
SET @TGUID := 2000028000;



-- =========
-- CREATURES
-- =========

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
-- Archavon the Stone Watcher 31125
(@CGUID+1,31125,624,3,1,0,0,140.59,-101.09,91.7022,3.12414,604800,604800,0,0,2300925,0,0,0),
-- Archavon Warder 32353
(@CGUID+2,32353,624,3,1,0,0,-379.088,-104.053,104.742,3.12414,7200,7200,0,0,378000,0,0,0),
(@CGUID+3,32353,624,3,1,0,0,-221.683,-84.663,102.934,6.26901,7200,7200,5,0,378000,0,0,1),
(@CGUID+4,32353,624,3,1,0,0,-158.593,-104.718,103.65,0.053816,7200,7200,0,0,378000,0,0,0),
(@CGUID+5,32353,624,3,1,0,0,-90.4395,-102.141,103.43,3.19395,7200,7200,0,0,378000,0,0,0),
-- Invisible Stalker (All Phases) 32780
(@CGUID+6,32780,624,3,1,0,0,-231.521,-113.094,125.046,0,7200,7200,0,0,42,0,0,0),
-- Emalon the Storm Watcher 33993
(@CGUID+7,33993,624,3,1,0,0,-218.899,-288.638,91.4661,1.59435,604800,604800,0,0,2789000,212900,0,0),
-- Tempest Minion 33998
(@CGUID+8,33998,624,3,1,0,0,-204.773,-297.297,91.7125,1.76278,7200,7200,0,0,141550,41690,0,0),
(@CGUID+9,33998,624,3,1,0,0,-205.238,-281.033,91.6218,1.79769,7200,7200,0,0,141550,41690,0,0),
(@CGUID+10,33998,624,3,1,0,0,-232.909,-296.977,91.7115,1.39626,7200,7200,0,0,141550,41690,0,0),
(@CGUID+11,33998,624,3,1,0,0,-233.262,-280.356,91.8296,1.3439,7200,7200,0,0,141550,41690,0,0),
-- Tempest Warder 34015
(@CGUID+12,34015,624,3,1,0,0,-218.913,-229.265,97.844,1.62768,7200,7200,0,0,674050,41690,0,0),
(@CGUID+13,34015,624,3,1,0,0,-218.668,-143.996,104.301,1.571,7200,7200,0,1,674050,41690,0,2), -- waypoints
-- Emalon Controller 34230
(@CGUID+14,34230,624,3,1,0,0,-218.779,-263.68,91.8296,1.6057,7200,7200,0,0,12600,0,0,0),
-- Koralon the Flame Watcher 35013
(@CGUID+15,35013,624,3,1,0,0,-218.521,104.391,91.8297,4.69494,604800,604800,0,0,4183500,0,0,0),
-- Burning Breath Koralon Stalker 35015
(@CGUID+16,35015,624,3,1,0,0,-233.039,43.9149,104.162,6.03584,7200,7200,0,0,25200,0,0,0),
(@CGUID+17,35015,624,3,1,0,0,-254.364,99.653,104.159,4.24353,7200,7200,0,0,25200,0,0,0),
(@CGUID+18,35015,624,3,1,0,0,-255.719,96.7976,104.156,4.29508,7200,7200,0,0,25200,0,0,0),
(@CGUID+19,35015,624,3,1,0,0,-218.89,42.3804,104.203,0.006595,7200,7200,0,0,25200,0,0,0),
-- Flame Warder 35143
(@CGUID+20,35143,624,3,1,0,0,-219.483,27.4635,97.9274,4.72984,7200,7200,0,0,674050,0,0,0),
(@CGUID+21,35143,624,3,1,0,0,-219.056,-61.0287,104.299,4.73051,7200,7200,0,1,674050,0,0,2), -- waypoints
-- Vault Stalker 36093
(@CGUID+22,36093,624,3,1,0,0,-218.833,-103.13,112.854,0,7200,7200,0,0,25200,0,0,0),
-- Toravon the Ice Watcher 38433
(@CGUID+23,38433,624,3,1,0,0,-43.3316,-288.708,91.2511,1.58825,604800,604800,0,0,4601850,0,0,0),
-- Toravon Stalker 38439
(@CGUID+24,38439,624,3,1,0,0,-43.4167,-288.877,91.2511,1.58825,7200,7200,0,0,25200,0,0,0),
-- Frost Warder 38482
(@CGUID+25,38482,624,3,1,0,0,-43.3507,-214.01,97.378,1.62316,7200,7200,0,0,808860,0,0,0),
(@CGUID+26,38482,624,3,1,0,0,-42.8767,-229.505,97.6291,1.62316,7200,7200,0,0,808860,0,0,0);

-- addons
DELETE FROM `creature_template_addon` WHERE entry IN (31125,32353,32780,33998,34230,35013,35015,35143,36093,38433,38439,38482);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(31125,0,0,1,1,0,0,NULL),
(32353,0,0,1,0,0,0,NULL),
(32780,0,0,1,0,0,0,NULL),
(33998,0,0,1,0,0,0,NULL),
(34230,0,0,1,0,0,0,NULL),
(35013,0,0,1,0,0,0,NULL),
(35015,0,50331648,1,0,0,0,NULL),
(35143,0,0,1,0,0,0,NULL),
(36093,0,0,1,0,0,0,NULL),
(38433,0,0,1,0,0,0,NULL),
(38439,0,0,1,0,0,0,NULL),
(38482,0,0,1,0,0,0,'72122');

-- INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES


INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
-- @CGUID+13
(@CGUID+13,1,-218.668,-143.996,104.301,1.571,20000,0),
(@CGUID+13,2,-218.625,-164.052,98.216,4.739,0,0),
(@CGUID+13,3,-218.951,-215.453,97.593,4.701,20000,0),
(@CGUID+13,4,-218.948,-164.214,98.157,1.551,0,0),
-- @CGUID+21
(@CGUID+21,1,-219.056,-61.0287,104.299,4.73051,20000,0),
(@CGUID+21,2,-218.403,-41.1759,97.7714,1.54572,0,0),
(@CGUID+21,3,-218.649,11.4459,97.8441,1.54572,20000,0),
(@CGUID+21,4,-218.403,-41.1759,97.7714,4.73051,0,0);

-- INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
-- INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES



-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+0,192863,624,1,1,-515.463,-103.853,159.781,0,0,0,0,1,180,180,0,1),
(@OGUID+1,192864,624,1,1,-515.463,-103.853,159.781,0,0,0,0,1,180,180,0,1);


-- ======
-- EVENTS
-- ======

-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
-- INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
-- INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES

-- =======
-- POOLING
-- =======

-- INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_pool` (`entry`, `max_limit`, `description`) VALUES
-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- =========
-- DBSCRIPTS
-- =========

-- INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_template_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_relay` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_event` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_spell` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_start` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_end` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscript_string` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
-- INSERT INTO `dbscript_random_templates` (`id`, `type`, `target_id`, `chance`, `comments`) VALUES
