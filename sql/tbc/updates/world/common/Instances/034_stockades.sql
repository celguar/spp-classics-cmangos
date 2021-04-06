/* DBScriptData
DBName: The Stockade
DBScriptName: -
DB%Complete: 75
DBComment:
EndDBScriptData */

SET @CGUID := 3400000; -- creatures
SET @OGUID := 3400000; -- gameobjects
SET @PGUID := 45100; -- pools

-- =========
-- CREATURES
-- =========

-- INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

-- INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(1663, 0, 0, 1, 16, 0, 0, '7165'), -- Dextren Ward
(1666, 0, 0, 1, 16, 0, 0, NULL), -- Kam Deepfury
(1696, 0, 0, 1, 16, 0, 0, '8876'), -- Targorr the Dread
(1706, 0, 0, 1, 16, 0, 0, NULL), -- Defias Prisoner
(1707, 0, 0, 1, 16, 0, 0, NULL), -- Defias Captive
(1708, 0, 1114112, 1, 16, 0, 0, '7165'), -- Defias Inmate
(1711, 0, 0, 1, 16, 0, 0, ''), -- Defias Convict
(1715, 0, 0, 1, 16, 0, 0, NULL), -- Defias Insurgent
(1716, 0, 0, 1, 16, 0, 0, ''), -- Bazil Thredd
(1717, 0, 0, 1, 16, 0, 0, NULL), -- Hamhock
(1720, 0, 0, 1, 16, 0, 0, NULL); -- Bruegal Ironknuckle

-- INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES

-- INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES

INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 1663, 34, 166.789, 134.787, -33.9396, 1.78929, 43200, 43200, 0, 0, 0, 0), -- Dextren Ward
(@CGUID+2, 1666, 34, 142.644, -71.8536, -34.8562, 4.49228, 43200, 43200, 0, 0, 0, 0), -- Kam Deepfury
(@CGUID+3, 1696, 34, 159.582, 1.25311, -25.6062, 6.25925, 43200, 43200, 0, 0, 0, 0), -- Targorr the Dread
(@CGUID+4, 1706, 34, 110.986, -29.1003, -26.4396, 4.23787, 43200, 43200, 5, 0, 0, 1), -- Defias Prisoner
(@CGUID+5, 1706, 34, 88.573, -15.4623, -26.4396, 4.33564, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+6, 1706, 34, 81.5075, -2.03578, -25.5229, 2.77507, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+7, 1706, 34, 110.512, -14.289, -26.4396, 2.07694, 43200, 43200, 5, 0, 0, 1), -- Defias Prisoner
(@CGUID+8, 1706, 34, 83.9548, 30.5974, -26.4396, 0.369557, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+9, 1706, 34, 131.149, 3.33946, -25.5229, 1.50787, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+10, 1706, 34, 93.4684, 3.03369, -25.5229, 3.50811, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+11, 1706, 34, 127.145, -1.40234, -25.5229, 2.26893, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+12, 1706, 34, 150.993, 39.1095, -34.7729, 2.50405, 43200, 43200, 5, 0, 0, 1), -- Defias Prisoner
(@CGUID+13, 1706, 34, 165.944, 1.0911, -25.6062, 2.88702, 43200, 43200, 5, 0, 0, 1), -- Defias Prisoner
(@CGUID+14, 1706, 34, 162.726, 59.1677, -34.8562, 4.46164, 43200, 43200, 5, 0, 0, 1), -- Defias Prisoner
(@CGUID+15, 1706, 34, 186.274, 86.9216, -33.8562, 3.42742, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+16, 1706, 34, 167.363, 127.883, -33.8562, 0.959931, 43200, 43200, 0, 0, 0, 0), -- Defias Prisoner
(@CGUID+17, 1707, 34, 82.3245, -10.6106, -26.4396, 0.371108, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+18, 1707, 34, 110.662, -0.797785, -25.5229, 0.30335, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+19, 1707, 34, 87.736, -28.9658, -26.4396, 1.5708, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+20, 1707, 34, 102.687, -28.8744, -26.4396, 6.02139, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+21, 1707, 34, 108.735, 21.5291, -26.5229, 2.66238, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+22, 1707, 34, 110.493, 42.8924, -34.7729, 3.87516, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+23, 1707, 34, 110.413, 30.1479, -26.4396, 5.35283, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+24, 1707, 34, 86.8127, 21.0691, -26.4396, 4.59022, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+25, 1707, 34, 80.683, 16.7574, -26.4396, 2.04204, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+26, 1707, 34, 131.167, 40.9354, -33.8562, 1.98968, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+27, 1707, 34, 140.338, 3.08356, -25.5229, 5.99824, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+28, 1707, 34, 103.24, 12.9131, -26.4396, 1.16937, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+29, 1707, 34, 115.026, 46.7235, -34.7729, 4.31096, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+30, 1707, 34, 153.705, 3.6997, -25.6062, 5.67859, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+31, 1707, 34, 134.054, 70.9823, -33.8562, 6.04937, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+32, 1707, 34, 148.353, 65.0762, -34.7729, 5.40655, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+33, 1707, 34, 148.538, 103.18, -35.1896, 4.52629, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+34, 1707, 34, 147.452, 111.814, -35.1896, 3.40928, 43200, 43200, 5, 0, 0, 1), -- Defias Captive
(@CGUID+35, 1707, 34, 192.771, 91.34, -33.8562, 5.44344, 43200, 43200, 0, 0, 0, 0), -- Defias Captive
(@CGUID+36, 1708, 34, 117.7, -45.8883, -34.7729, 2.96333, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+37, 1708, 34, 76.2288, 0.302129, -25.5229, 3.49974, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+38, 1708, 34, 128.622, 49.0336, -33.8562, 4.17134, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+39, 1708, 34, 105.4, 70.095, -34.7729, 2.75762, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+40, 1708, 34, 100.916, 53.2517, -34.7729, 2.70526, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+41, 1708, 34, 100.564, 44.3137, -34.7729, 2.30383, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+42, 1708, 34, 123.368, -61.7398, -33.8562, 3.01942, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+43, 1708, 34, 96.4198, -54.7564, -34.7729, 2.51327, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+44, 1708, 34, 82.6119, -94.8407, -33.8562, 5.54853, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+45, 1708, 34, 121.623, 74.722, -34.7729, 0.645772, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+46, 1708, 34, 108.453, 82.4015, -34.8562, 1.40505, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+47, 1708, 34, 145.489, 43.3674, -34.7729, 4.00042, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+48, 1708, 34, 114.613, -86.3965, -33.9396, 5.65375, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+49, 1708, 34, 159.931, 39.9643, -34.8562, 0.52169, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+50, 1708, 34, 151.641, 60.1077, -34.7729, 2.38636, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+51, 1708, 34, 161.133, 54.0252, -34.8562, 4.38428, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+52, 1708, 34, 141.995, 84.1125, -33.9396, 3.0374, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+53, 1708, 34, 152.804, -69.5129, -34.7729, 4.67092, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+54, 1708, 34, 150.261, -76.7672, -34.8562, 2.28934, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+55, 1708, 34, 171.119, 93.3214, -33.8562, 4.20114, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+56, 1708, 34, 155.673, 99.6374, -35.1896, 4.85931, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+57, 1708, 34, 123.941, 119.574, -33.8562, 3.60874, 43200, 43200, 5, 0, 0, 1), -- Defias Inmate
(@CGUID+58, 1708, 34, 129.951, 122.361, -33.8562, 1.54336, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+59, 1708, 34, 156.316, 109.516, -35.1896, 2.99417, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+60, 1708, 34, 189.206, 87.3162, -33.8562, 0.762264, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+61, 1708, 34, 182.74, 95.2994, -33.8562, 1.40045, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+62, 1708, 34, 119.78, 128.785, -33.9396, 6.2394, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+63, 1708, 34, 161.07, 129.292, -33.8562, 4.39901, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+64, 1708, 34, 171.059, 142.025, -33.9396, 4.49541, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+65, 1708, 34, 168.987, 147.931, -33.9396, 1.38903, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+66, 1708, 34, 176.087, 142.688, -33.8562, 2.28023, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+67, 1708, 34, 141.424, -120.264, -33.9396, 1.87443, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+68, 1708, 34, 139.681, -128.899, -33.8562, 2.90953, 43200, 43200, 0, 0, 0, 0), -- Defias Inmate
(@CGUID+69, 1711, 34, 70.595, -83.9379, -33.8562, 4.83093, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+70, 1711, 34, 111.721, -41.2636, -34.7729, 2.05949, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+71, 1711, 34, 129.414, 21.692, -29.216, 1.50148, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+72, 1711, 34, 129.687, -47.4302, -33.8562, 3.40339, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+73, 1711, 34, 94.8542, -60.1856, -34.7729, 2.61799, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+74, 1711, 34, 66.9717, -90.2606, -33.8562, 5.39307, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+75, 1711, 34, 104.11, -55.8138, -34.7729, 4.83456, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+76, 1711, 34, 124.704, -70.8525, -33.9396, 4.719, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+77, 1711, 34, 138.566, -48.0856, -34.7729, 0.529011, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+78, 1711, 34, 155.148, -52.0394, -34.8562, 3.07747, 43200, 43200, 5, 0, 0, 1), -- Defias Convict
(@CGUID+79, 1711, 34, 126.276, -116.828, -33.9396, 2.39055, 43200, 43200, 0, 0, 0, 0), -- Defias Convict
(@CGUID+80, 1711, 34, 95.3684, -128.729, -33.9396, 2.07435, 43200, 43200, 0, 0, 0, 0), -- Defias Convict
(@CGUID+81, 1715, 34, 77.8325, -88.7943, -33.8562, 1.87365, 43200, 43200, 5, 0, 0, 1), -- Defias Insurgent
(@CGUID+82, 1715, 34, 128.395, -36.2513, -33.9396, 3.46348, 43200, 43200, 5, 0, 0, 1), -- Defias Insurgent
(@CGUID+83, 1715, 34, 99.3863, -37.6553, -34.7729, 5.84427, 43200, 43200, 5, 0, 0, 1), -- Defias Insurgent
(@CGUID+84, 1715, 34, 110.796, -65.9973, -34.7729, 3.56047, 43200, 43200, 5, 0, 0, 1), -- Defias Insurgent
(@CGUID+85, 1715, 34, 146.893, -42.7851, -34.8562, 3.56855, 43200, 43200, 5, 0, 0, 1), -- Defias Insurgent
(@CGUID+86, 1715, 34, 140.158, -64.5333, -34.7729, 5.99149, 43200, 43200, 5, 0, 0, 1), -- Defias Insurgent
(@CGUID+87, 1715, 34, 95.4846, -105.947, -35.1062, 0.663225, 43200, 43200, 0, 0, 0, 0), -- Defias Insurgent
(@CGUID+88, 1715, 34, 109.097, -114.239, -35.1062, 1.43117, 43200, 43200, 0, 0, 0, 0), -- Defias Insurgent
(@CGUID+89, 1715, 34, 132.264, -123.557, -33.9396, 2.95052, 43200, 43200, 0, 0, 0, 0), -- Defias Insurgent
(@CGUID+90, 1715, 34, 91.7954, -126.047, -33.9396, 4.01449, 43200, 43200, 0, 0, 0, 0), -- Defias Insurgent
(@CGUID+91, 1716, 34, 89.5518, -136.922, -33.9396, 5.00727, 43200, 43200, 0, 0, 0, 0), -- Bazil Thredd
(@CGUID+92, 1717, 34, 105.523, -105.795, -35.1062, 1.09956, 43200, 43200, 0, 0, 0, 0), -- Hamhock
(@CGUID+93, 1720, 34, 160.051, 45.709, -34.7729, 3.36848, 43200, 43200, 0, 0, 0, 0); -- Bruegal Ironknuckle

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 75295, 34, 104.455, 77.2554, -34.8562, -0.366519, 0, 0, 0.182236, -0.983255, 43200, 43200, 100, 1), -- Large Iron Bound Chest
(@OGUID+2, 75295, 34, 92.3032, -56.1773, -34.8562, -0.209439, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Large Iron Bound Chest
(@OGUID+3, 75295, 34, 165.322, 57.6663, -34.8562, 2.9147, 0, 0, 0.993572, 0.113203, 43200, 43200, 100, 1), -- Large Iron Bound Chest
(@OGUID+4, 75298, 34, 188.603, 81.585, -33.9396, 2.47837, 0, 0, 0.945519, 0.325568, 86400, 86400, 100, 1), -- Large Solid Chest
(@OGUID+5, 75298, 34, 90.5921, -145.882, -33.9396, 1.44862, 0, 0, 0.66262, 0.748956, 86400, 86400, 100, 1), -- Large Solid Chest
(@OGUID+6, 75298, 34, 151.69, -65.131, -34.8562, -1.18682, 0, 0, 0.559193, -0.829037, 86400, 86400, 100, 1), -- Large Solid Chest
(@OGUID+7, 75298, 34, 173.185, 146.955, -33.9396, -2.05949, 0, 0, -0.857168, 0.515037, 86400, 86400, 100, 1); -- Large Solid Chest

-- ======
-- EVENTS
-- ======

-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES

-- INSERT INTO `game_event_creature` (`guid`, `event`) VALUES

-- INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES

-- =======
-- POOLING
-- =======

-- INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@PGUID+1, 2, 'Stormwind Stockades - Master Chest Pool');

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@OGUID+1, @PGUID+1, 0, 'Stormwind Stockades - Large Iron Bound Chest (75295)'),
(@OGUID+2, @PGUID+1, 0, 'Stormwind Stockades - Large Iron Bound Chest (75295)'),
(@OGUID+3, @PGUID+1, 0, 'Stormwind Stockades - Large Iron Bound Chest (75295)'),
(@OGUID+4, @PGUID+1, 0, 'Stormwind Stockades - Large Solid Chest Pool (75298)'),
(@OGUID+5, @PGUID+1, 0, 'Stormwind Stockades - Large Solid Chest Pool (75298)'),
(@OGUID+6, @PGUID+1, 0, 'Stormwind Stockades - Large Solid Chest Pool (75298)'),
(@OGUID+7, @PGUID+1, 0, 'Stormwind Stockades - Large Solid Chest Pool (75298)');

-- INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES

-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

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


