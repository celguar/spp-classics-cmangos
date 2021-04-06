/* DBScriptData
DBName: Tempest Keep - The Mechanar (Mecha)
DBScriptName: instance_mechanar
DB%Complete: 80
DBComment:
EndDBScriptData */

SET @CGUID := 5540000; -- creatures
SET @OGUID := 5540000; -- gameobjects
SET @PGUID := 49100; -- pools

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+1, 1, 119.042, 78.4115, 14.9303, 3.08366, 0, 0),
(@CGUID+1, 2, 173.877, 78.9112, 0.003358, 6.07053, 0, 0),
(@CGUID+1, 3, 185.383, 69.3509, -0.00567, 5.58986, 0, 0),
(@CGUID+1, 4, 186.105, 50.8595, -0.00567, 4.73142, 0, 0),
(@CGUID+1, 5, 181.486, 47.4549, -0.00567, 3.72611, 0, 0),
(@CGUID+1, 6, 162.612, 47.1484, -0.003422, 3.03732, 0, 0),
(@CGUID+1, 7, 183.525, 47.4199, -0.006211, 6.18048, 0, 0),
(@CGUID+1, 8, 188.253, 53.3264, -0.006211, 0.874332, 0, 0),
(@CGUID+1, 9, 187.458, 68.5935, -0.006211, 1.63774, 0, 0),
(@CGUID+1, 10, 168.657, 80.5673, 0.781544, 2.59593, 0, 0),
(@CGUID+2, 1, 31.5228, 40.752, 0.010816, 4.44866, 3000, 0),
(@CGUID+2, 2, 30.8427, 54.2843, 0.16175, 1.60474, 0, 0),
(@CGUID+2, 3, 34.0663, 59.2636, 0.16175, 0.950498, 0, 0),
(@CGUID+2, 4, 43.2262, 59.5987, 1.90765, 0.099126, 5000, 0),
(@CGUID+2, 5, 77.7774, 59.9465, 14.9247, 0.003307, 0, 0),
(@CGUID+2, 6, 43.7659, 59.9917, 2.11506, 3.15747, 0, 0),
(@CGUID+2, 7, 34.1211, 59.8386, 0.16307, 3.15747, 0, 0),
(@CGUID+2, 8, 30.8546, 55.8926, 0.16307, 4.0269, 0, 0),
(@CGUID+3, 1, 30.8265, -14.1307, -0.000624, 5.15159, 0, 0),
(@CGUID+3, 2, 38.1104, -23.433, 0.001603, 5.34166, 0, 0),
(@CGUID+3, 3, 40.6051, -24.6406, 0.006674, 5.26076, 0, 0),
(@CGUID+3, 4, 44.8105, -26.2741, 0.007961, 6.24094, 0, 0),
(@CGUID+3, 5, 43.8387, -25.8542, 0.007961, 3.06165, 7000, 0),
(@CGUID+3, 6, 39.8908, -25.4798, 0.006565, 2.77576, 0, 0),
(@CGUID+3, 7, 31.9739, -15.7074, -0.000693, 2.26682, 0, 0),
(@CGUID+3, 8, 27.7192, -9.83059, -0.000693, 2.32337, 0, 0),
(@CGUID+3, 9, 23.9795, -6.5164, -0.000693, 2.57313, 10000, 0),
(@CGUID+4, 1, 30.4124, 16.7888, 0.000004, 1.01018, 0, 0),
(@CGUID+4, 2, 36.2202, 25.1386, 0.004621, 0.96306, 0, 0),
(@CGUID+4, 3, 40.6948, 29.1278, 0.004768, 0.649686, 0, 0),
(@CGUID+4, 4, 45.8053, 31.1411, 0.001092, 0.308823, 0, 0),
(@CGUID+4, 5, 44.0156, 30.6122, -0.000453, 3.34989, 7000, 0),
(@CGUID+4, 6, 39.3106, 29.3685, 0.006656, 3.38366, 0, 0),
(@CGUID+4, 7, 32.1276, 20.3602, 0.000805, 4.15256, 0, 0),
(@CGUID+4, 8, 28.3867, 11.9341, -0.000624, 4.25624, 0, 0),
(@CGUID+4, 9, 25.1239, 10.6747, -0.000624, 3.35303, 10000, 0),
(@CGUID+6, 1, 32.3648, -36.3204, 0.012541, 1.54505, 3000, 0),
(@CGUID+6, 2, 31.3405, -52.5362, 0.161877, 4.80681, 0, 0),
(@CGUID+6, 3, 34.9676, -56.5324, 0.161877, 5.40999, 0, 0),
(@CGUID+6, 4, 44.1341, -56.4007, 2.25689, 6.11842, 5000, 0),
(@CGUID+6, 5, 77.7927, -56.5618, 14.9247, 6.09957, 0, 0),
(@CGUID+6, 6, 52.5764, -55.6196, 5.76844, 3.06087, 0, 0),
(@CGUID+6, 7, 34.5183, -56.1068, 0.163073, 3.14098, 0, 0),
(@CGUID+6, 8, 30.9807, -49.9343, 0.163073, 1.98016, 0, 0),
(@CGUID+21, 1, 197.953, 12.5222, -2.19211, 0, 0, 0),
(@CGUID+21, 2, 195.769, -10.0593, -2.19211, 0, 0, 0),
(@CGUID+21, 3, 200.292, -39.2775, -2.19211, 0, 0, 0),
(@CGUID+21, 4, 221.534, -38.9328, -2.19211, 0, 0, 0),
(@CGUID+21, 5, 222.264, 15.791, -2.19211, 0, 0, 0),
(@CGUID+23, 1, 105.542, -76.0303, 14.9262, 5.19794, 0, 0),
(@CGUID+23, 2, 105.907, -80.6267, 14.9272, 4.93326, 0, 0),
(@CGUID+23, 3, 105.469, -75.8755, 14.9272, 1.94167, 0, 0),
(@CGUID+23, 4, 102.455, -73.0012, 14.9272, 2.2684, 0, 0),
(@CGUID+23, 5, 95.037, -71.3831, 14.9272, 2.94934, 0, 0),
(@CGUID+23, 6, 91.0628, -72.7787, 14.9258, 3.53603, 0, 0),
(@CGUID+23, 7, 96.7333, -71.0234, 14.9258, 0.300194, 0, 0),
(@CGUID+31, 1, 203.51, -78.7325, 0.00357, 6.26294, 0, 0),
(@CGUID+31, 2, 167.854, -77.1117, 1.04226, 3.06872, 0, 0),
(@CGUID+31, 3, 118.427, -73.8248, 14.9263, 3.11663, 0, 0),
(@CGUID+31, 4, 171.948, -77.0885, 0.004957, 6.25587, 0, 0),
(@CGUID+32, 1, 161.707, 53.2828, 0.00231, 0.546809, 0, 0),
(@CGUID+32, 2, 161.061, 59.0765, 0.002684, 1.54112, 0, 0),
(@CGUID+32, 3, 160.108, 51.9113, 0.002794, 4.53821, 0, 0),
(@CGUID+32, 4, 150.199, 46.6914, 0.005608, 3.66877, 0, 0),
(@CGUID+32, 5, 142.633, 46.3525, 0.007714, 3.14098, 0, 0),
(@CGUID+32, 6, 137.855, 38.1671, 0.0063, 4.18399, 0, 0),
(@CGUID+32, 7, 131.465, 37.7287, 0.004902, 3.2101, 0, 0),
(@CGUID+32, 8, 139.445, 39.674, 0.005337, 0.255427, 0, 0),
(@CGUID+32, 9, 143.096, 45.9515, 0.007527, 1.05575, 0, 0),
(@CGUID+32, 10, 151.936, 47.028, 0.007527, 0.047296, 0, 0),
(@CGUID+47, 1, 199.667, 41.5662, -0.006497, 0.084213, 0, 0),
(@CGUID+47, 2, 201.486, 38.8112, -0.006497, 5.29533, 0, 0),
(@CGUID+47, 3, 198.42, 41.301, -0.006497, 2.54486, 0, 0),
(@CGUID+47, 4, 177.189, 38.7453, -0.006497, 3.27686, 0, 0),
(@CGUID+47, 5, 175.857, 36.2103, 1.01048, 4.15964, 0, 0),
(@CGUID+47, 6, 180.796, 39.2187, -0.006297, 0.397588, 0, 0),
(@CGUID+47, 7, 191.442, 40.9485, -0.006297, 0.124269, 0, 0),
(@CGUID+55, 1, 226.707, -109.536, -0.00693, 5.82783, 0, 1971601),
(@CGUID+55, 2, 207.09, -95.4179, -0.000968, 2.55508, 0, 0),
(@CGUID+55, 3, 204.143, -88.2587, 0.000499, 1.96132, 0, 0),
(@CGUID+55, 4, 206.056, -76.7196, 0.00145, 1.33614, 0, 0),
(@CGUID+55, 5, 213.491, -69.7697, 0.00145, 0.724312, 0, 0),
(@CGUID+55, 6, 220.044, -69.2631, 0.00145, 0.077143, 0, 0),
(@CGUID+55, 7, 212.02, -69.8712, 0.00145, 3.12763, 0, 0),
(@CGUID+55, 8, 205.587, -76.0482, 0.001631, 3.90675, 0, 0),
(@CGUID+55, 9, 202.412, -87.2174, 0.001631, 4.39605, 0, 0),
(@CGUID+55, 10, 203.796, -92.6097, 0.001631, 4.9364, 0, 0),
(@CGUID+59, 1, 203.6965, 53.04169, -0.004259702, 100, 0, 0),
(@CGUID+59, 2, 233.3129, 52.31844, 0.02142454, 100, 0, 0),
(@CGUID+68, 1, 98.722, 51.8395, 14.9258, 4.39527, 0, 0),
(@CGUID+68, 2, 104.442, 42.0315, 14.9258, 5.24036, 0, 0),
(@CGUID+68, 3, 114.306, 38.4851, 14.9258, 5.90323, 0, 0),
(@CGUID+68, 4, 105.32, 41.7866, 14.9258, 2.81505, 0, 0),
(@CGUID+68, 5, 100.334, 50.5233, 14.9258, 2.08934, 0, 0),
(@CGUID+68, 6, 102.82, 64.9916, 14.922, 1.35813, 0, 0),
(@CGUID+68, 7, 114.837, 73.2963, 14.9225, 0.60101, 0, 0),
(@CGUID+68, 8, 103.303, 64.1023, 14.9206, 4.1086, 0, 0),
(@CGUID+70, 1, 224.938, -55.7028, 0.000941, 6.27629, 0, 0),
(@CGUID+70, 2, 229.92, -57.626, 0.006562, 5.95114, 0, 0),
(@CGUID+70, 3, 224.518, -55.8315, 0.001421, 2.86452, 0, 0),
(@CGUID+70, 4, 217.022, -59.4978, 0.001421, 3.59652, 0, 0),
(@CGUID+70, 5, 214.245, -63.6568, 0.001421, 4.15493, 0, 0),
(@CGUID+70, 6, 213.93, -67.4165, 0.001421, 4.7322, 0, 0),
(@CGUID+70, 7, 214.231, -61.3339, 0.001421, 1.5215, 0, 0),
(@CGUID+70, 8, 220.344, -55.3608, 0.001421, 0.773796, 0, 0),
(@CGUID+70, 9, 225.222, -55.4634, 0.001421, 6.26216, 0, 0),
(@CGUID+71, 1, 99.8818, -54.005, 14.9254, 4.73219, 0, 0),
(@CGUID+71, 2, 103.471, -61.7508, 14.9254, 5.31339, 0, 0),
(@CGUID+71, 3, 103.372, -72.7453, 14.9261, 4.63559, 0, 0),
(@CGUID+71, 4, 100.888, -76.3641, 14.9263, 4.11095, 0, 0),
(@CGUID+71, 5, 104.719, -70.5196, 14.9263, 1.03847, 0, 0),
(@CGUID+71, 6, 100.448, -48.7264, 14.9249, 1.87256, 0, 0),
(@CGUID+71, 7, 101.486, -38.4185, 14.9249, 1.47044, 0, 0),
(@CGUID+71, 8, 107.034, -19.5325, 14.9249, 1.28508, 0, 0),
(@CGUID+71, 9, 100.549, -33.547, 14.9249, 4.27902, 0, 0),
(@CGUID+71, 10, 99.186, -44.5496, 14.9249, 4.54998, 0, 0);

-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(@CGUID+33, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Driller
(@CGUID+34, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Driller
(@CGUID+35, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Driller
(@CGUID+36, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Driller
(@CGUID+37, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Driller
(@CGUID+38, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Driller
(@CGUID+39, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Wrecker
(@CGUID+40, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Wrecker
(@CGUID+41, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Wrecker
(@CGUID+42, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Wrecker
(@CGUID+45, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Tinkerer
(@CGUID+46, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Tinkerer
(@CGUID+48, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Tinkerer
(@CGUID+49, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Tinkerer
(@CGUID+50, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Tinkerer
(@CGUID+51, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Tinkerer
(@CGUID+56, 0, 0, 1, 0, 28, 0, NULL), -- Mechanar Tinkerer
(@CGUID+57, 0, 0, 1, 0, 28, 0, NULL); -- Mechanar Tinkerer

-- REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+25, @CGUID+63, 1155), -- Bloodwarder Centurion -> Sunseeker Netherbinder
(@CGUID+76, @CGUID+63, 1155), -- Bloodwarder Physician -> Sunseeker Netherbinder
(@CGUID+10, @CGUID+64, 1155), -- Bloodwarder Slayer -> Sunseeker Netherbinder
(@CGUID+77, @CGUID+64, 1155), -- Bloodwarder Physician -> Sunseeker Netherbinder
(@CGUID+75, @CGUID+9, 1155), -- Bloodwarder Physician -> Bloodwarder Slayer
(@CGUID+81, @CGUID+13, 1155), -- Bloodwarder Physician -> Bloodwarder Slayer
(@CGUID+74, @CGUID+8, 1155), -- Bloodwarder Physician -> Bloodwarder Slayer
(@CGUID+80, @CGUID+12, 1155), -- Bloodwarder Physician -> Bloodwarder Slayer
(@CGUID+39, @CGUID+68, 1155), -- Mechanar Wrecker -> Sunseeker Engineer
(@CGUID+40, @CGUID+68, 1155), -- Mechanar Wrecker -> Sunseeker Engineer
(@CGUID+58, @CGUID+68, 1155), -- Mechanar Tinkerer -> Sunseeker Engineer
(@CGUID+56, @CGUID+23, 1155), -- Mechanar Tinkerer -> Mechanar Crusher
(@CGUID+57, @CGUID+23, 1155), -- Mechanar Tinkerer -> Mechanar Crusher
(@CGUID+37, @CGUID+71, 1155), -- Mechanar Driller -> Sunseeker Engineer
(@CGUID+38, @CGUID+71, 1155), -- Mechanar Driller -> Sunseeker Engineer
(@CGUID+7, @CGUID+73, 1155), -- Bloodwarder Slayer -> Bloodwarder Physician
(@CGUID+79, @CGUID+11, 1155), -- Bloodwarder Physician -> Bloodwarder Slayer
(@CGUID+62, @CGUID+24, 1155), -- Sunseeker Netherbinder -> Bloodwarder Centurion
(@CGUID+72, @CGUID+24, 1155), -- Bloodwarder Physician -> Bloodwarder Centurion
(@CGUID+65, @CGUID+26, 1155), -- Sunseeker Netherbinder -> Bloodwarder Centurion
(@CGUID+78, @CGUID+26, 1155), -- Bloodwarder Physician -> Bloodwarder Centurion
(@CGUID+48, @CGUID+47, 1155), -- Mechanar Tinkerer -> Mechanar Tinkerer
(@CGUID+49, @CGUID+47, 1155), -- Mechanar Tinkerer -> Mechanar Tinkerer
(@CGUID+51, @CGUID+47, 1155), -- Mechanar Tinkerer -> Mechanar Tinkerer
(@CGUID+33, @CGUID+55, 1155), -- Mechanar Driller -> Mechanar Tinkerer
(@CGUID+34, @CGUID+55, 1155), -- Mechanar Driller -> Mechanar Tinkerer
(@CGUID+54, @CGUID+55, 1155), -- Mechanar Tinkerer -> Mechanar Tinkerer
(@CGUID+45, @CGUID+32, 1155), -- Mechanar Tinkerer -> Mechanar Driller
(@CGUID+46, @CGUID+32, 1155), -- Mechanar Tinkerer -> Mechanar Driller
(@CGUID+50, @CGUID+32, 1155), -- Mechanar Tinkerer -> Mechanar Driller
(@CGUID+67, @CGUID+32, 1155), -- Sunseeker Engineer -> Mechanar Driller
(@CGUID+35, @CGUID+70, 1155), -- Mechanar Driller -> Sunseeker Engineer
(@CGUID+36, @CGUID+70, 1155), -- Mechanar Driller -> Sunseeker Engineer
(@CGUID+41, @CGUID+53, 1155), -- Mechanar Wrecker -> Mechanar Tinkerer
(@CGUID+42, @CGUID+53, 1155), -- Mechanar Wrecker -> Mechanar Tinkerer
(@CGUID+52, @CGUID+53, 1155), -- Mechanar Tinkerer -> Mechanar Tinkerer
(@CGUID+43, @CGUID+69, 1155), -- Mechanar Tinkerer -> Sunseeker Engineer
(@CGUID+44, @CGUID+69, 1155), -- Mechanar Tinkerer -> Sunseeker Engineer
(@CGUID+66, @CGUID+69, 1155), -- Sunseeker Engineer -> Sunseeker Engineer
(@CGUID+15, @CGUID+14, 1155), -- Sunseeker Astromage -> Sunseeker Astromage
(@CGUID+19, @CGUID+18, 1155), -- Sunseeker Astromage -> Sunseeker Astromage
(@CGUID+29, @CGUID+18, 1155), -- Bloodwarder Centurion -> Sunseeker Astromage
(@CGUID+30, @CGUID+18, 1155), -- Bloodwarder Centurion -> Sunseeker Astromage
(@CGUID+17, @CGUID+16, 1155), -- Sunseeker Astromage -> Sunseeker Astromage
(@CGUID+27, @CGUID+16, 1155), -- Bloodwarder Centurion -> Sunseeker Astromage
(@CGUID+28, @CGUID+16, 1155); -- Bloodwarder Centurion -> Sunseeker Astromage

REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(20481, 554, 19221, 4113, 0); -- Raging Flames -> Nethermancer Sepethrea

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 19166, 554, 3, 139.302, 79.2735, 9.5361, 3.14005, 7200, 7200, 0, 0, 0, 2), -- Tempest-Forge Patroller
(@CGUID+2, 19166, 554, 3, 31.1167, 50.942, 0.15789, 4.61499, 7200, 7200, 0, 0, 0, 2), -- Tempest-Forge Patroller
(@CGUID+3, 19166, 554, 3, 28.4327, -7.32528, 0.00000399165, 3.14865, 7200, 7200, 0, 0, 0, 2), -- Tempest-Forge Patroller
(@CGUID+4, 19166, 554, 3, 28.5279, 10.7081, -0.000455872, 3.14944, 7200, 7200, 0, 0, 0, 2), -- Tempest-Forge Patroller
(@CGUID+5, 19166, 554, 3, 30.7088, 3.51896, -0.000455872, 3.1141, 7200, 7200, 0, 0, 0, 0), -- Tempest-Forge Patroller
(@CGUID+6, 19166, 554, 3, 32.216, -39.603, 0.00384379, 1.54309, 7200, 7200, 0, 0, 0, 2), -- Tempest-Forge Patroller
(@CGUID+7, 19167, 554, 3, 119.302, 86.1098, 14.9333, 3.23967, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Slayer
(@CGUID+8, 19167, 554, 3, 74.4081, 65.8713, 14.9247, 3.12422, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Slayer
(@CGUID+9, 19167, 554, 3, 37.0378, 64.3177, 0.162094, 3.83588, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Slayer
(@CGUID+10, 19167, 554, 3, 23.3317, -23.394, 0.00000567781, 3.05991, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Slayer
(@CGUID+11, 19167, 554, 3, 119.726, -66.1184, 14.9247, 2.96427, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Slayer
(@CGUID+12, 19167, 554, 3, 76.8159, -51.7629, 14.9247, 3.01657, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Slayer
(@CGUID+13, 19167, 554, 3, 36.3608, -51.3871, 0.162347, 3.06699, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Slayer
(@CGUID+14, 19168, 554, 3, 225.822, 46.382, -0.00603536, 3.27292, 7200, 7200, 0, 0, 0, 0), -- Sunseeker Astromage
(@CGUID+15, 19168, 554, 3, 225.811, 59.3986, -0.0020728, 2.99409, 7200, 7200, 0, 0, 0, 0), -- Sunseeker Astromage
(@CGUID+16, 19168, 554, 3, 272.683, -24.5176, 26.3284, 0.0714562, 10800, 10800, 0, 0, 0, 0), -- Sunseeker Astromage
(@CGUID+17, 19168, 554, 3, 272.424, -20.9008, 26.3284, 0.0714562, 10800, 10800, 0, 0, 0, 0), -- Sunseeker Astromage
(@CGUID+18, 19168, 554, 3, 308.545, 15.4713, 25.3862, 3.14629, 10800, 10800, 0, 0, 0, 0), -- Sunseeker Astromage
(@CGUID+19, 19168, 554, 3, 308.593, 5.20942, 25.3862, 3.14629, 10800, 10800, 0, 0, 0, 0), -- Sunseeker Astromage
(@CGUID+20, 19218, 554, 3, 89.4443, 24.2701, 14.9247, 0.79717, 7200, 7200, 0, 0, 0, 0), -- Gatewatcher Gyro-Kill
(@CGUID+21, 19219, 554, 3, 210.416, 15.6408, -2.19211, 3.23112, 86400, 86400, 0, 0, 0, 2), -- Mechano-Lord Capacitus
(@CGUID+22, 19221, 554, 3, 325.558, 12.5866, 27.8366, 3.05075, 86400, 86400, 0, 0, 0, 0), -- Nethermancer Sepethrea
(@CGUID+23, 19231, 554, 3, 100.64, -72.6406, 14.9259, 6.20403, 7200, 7200, 0, 0, 0, 2), -- Mechanar Crusher
(@CGUID+24, 19510, 554, 3, 167.576, 88.3262, 1.13275, 3.13612, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Centurion
(@CGUID+25, 19510, 554, 3, 23.228, 18.9781, 0.00000711717, 3.11017, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Centurion
(@CGUID+26, 19510, 554, 3, 166.135, -73.2655, 1.55645, 3.15276, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Centurion
(@CGUID+27, 19510, 554, 3, 274.023, -17.8571, 26.3284, 6.26825, 10800, 10800, 0, 0, 0, 0), -- Bloodwarder Centurion
(@CGUID+28, 19510, 554, 3, 273.889, -26.8161, 26.3284, 6.25254, 10800, 10800, 0, 0, 0, 0), -- Bloodwarder Centurion
(@CGUID+29, 19510, 554, 3, 308.485, 20.3946, 25.3862, 3.12981, 10800, 10800, 0, 0, 0, 0), -- Bloodwarder Centurion
(@CGUID+30, 19510, 554, 3, 308.485, 11.1399, 25.3862, 3.11175, 10800, 10800, 0, 0, 0, 0), -- Bloodwarder Centurion
(@CGUID+31, 19710, 554, 3, 176.955, -77.0281, 0.005777, 1.00923, 7200, 7200, 0, 0, 0, 2), -- Gatewatcher Iron-Hand
(@CGUID+32, 19712, 554, 3, 147.889, 45.0173, -0.00156292, 0.426625, 7200, 7200, 0, 0, 0, 2), -- Mechanar Driller
(@CGUID+33, 19712, 554, 3, 220.283, -95.5726, 0.0000594996, 0.352802, 7200, 7200, 0, 0, 0, 0), -- Mechanar Driller
(@CGUID+34, 19712, 554, 3, 216.394, -80.0561, 0.0000594996, 5.4736, 7200, 7200, 0, 0, 0, 0), -- Mechanar Driller
(@CGUID+35, 19712, 554, 3, 228.547, -53.2302, 0.00192854, 0.154885, 7200, 7200, 0, 0, 0, 0), -- Mechanar Driller
(@CGUID+36, 19712, 554, 3, 225.146, -61.0923, 0.0015216, 5.13588, 7200, 7200, 0, 0, 0, 0), -- Mechanar Driller
(@CGUID+37, 19712, 554, 3, 109.813, -55.6875, 14.9233, 1.12643, 7200, 7200, 0, 0, 0, 0), -- Mechanar Driller
(@CGUID+38, 19712, 554, 3, 108.077, -42.1086, 14.9233, 5.46576, 7200, 7200, 0, 0, 0, 0), -- Mechanar Driller
(@CGUID+39, 19713, 554, 3, 110.535, 59.7892, 14.9232, 5.11599, 7200, 7200, 0, 0, 0, 0), -- Mechanar Wrecker
(@CGUID+40, 19713, 554, 3, 110.807, 46.7967, 14.9232, 1.07904, 7200, 7200, 0, 0, 0, 0), -- Mechanar Wrecker
(@CGUID+41, 19713, 554, 3, 166.968, -17.1549, -0.00102673, 5.45003, 7200, 7200, 0, 0, 0, 0), -- Mechanar Wrecker
(@CGUID+42, 19713, 554, 3, 174.259, -18.3418, -0.00102673, 3.7575, 7200, 7200, 0, 0, 0, 0), -- Mechanar Wrecker
(@CGUID+43, 19716, 554, 3, 141.167, -45.2077, -0.00164767, 4.43249, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+44, 19716, 554, 3, 135.119, -44.8897, -0.00164767, 4.44427, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+45, 19716, 554, 3, 139.378, 50.5137, -0.00137669, 1.23199, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+46, 19716, 554, 3, 152.785, 53.8737, -0.00282132, 3.05019, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+47, 19716, 554, 3, 186.807, 40.1627, -0.00623331, 0.127397, 7200, 7200, 0, 0, 0, 2), -- Mechanar Tinkerer
(@CGUID+48, 19716, 554, 3, 196.496, 36.608, -0.00623331, 5.04792, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+49, 19716, 554, 3, 189.831, 35.4342, -0.00623331, 4.74946, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+50, 19716, 554, 3, 134.617, 44.1247, -0.00164767, 1.67967, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+51, 19716, 554, 3, 180.879, 35.1528, -0.00623331, 4.76203, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+52, 19716, 554, 3, 169.242, -12.2941, -0.00102673, 4.806, 7200, 7200, 3, 0, 0, 1), -- Mechanar Tinkerer
(@CGUID+53, 19716, 554, 3, 173.388, -13.5083, -0.00102673, 3.74572, 7200, 7200, 3, 0, 0, 1), -- Mechanar Tinkerer
(@CGUID+54, 19716, 554, 3, 209.166, -90.5678, 0.0000594996, 1.5309, 7200, 7200, 3, 0, 0, 1), -- Mechanar Tinkerer
(@CGUID+55, 19716, 554, 3, 213.436, -100.189, 0.0000594996, 2.37913, 7200, 7200, 0, 0, 0, 2), -- Mechanar Tinkerer
(@CGUID+56, 19716, 554, 3, 99.502, -78.7173, 14.9259, 3.83213, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+57, 19716, 554, 3, 92.8965, -79.4786, 14.9259, 5.52074, 7200, 7200, 0, 0, 0, 0), -- Mechanar Tinkerer
(@CGUID+58, 19716, 554, 3, 106.545, 52.6026, 14.9234, 0.0881336, 7200, 7200, 3, 0, 0, 1), -- Mechanar Tinkerer
(@CGUID+59, 19735, 554, 3, 205.481, 51.6294, -0.00493833, 3.11426, 7200, 7200, 0, 0, 0, 2), -- Tempest-Forge Destroyer
(@CGUID+60, 19735, 554, 3, 290.6187, 29.12057, 25.4695, 1.692969, 7200, 7200, 0, 0, 0, 0), -- Tempest-Forge Destroyer
(@CGUID+61, 19735, 554, 3, 297.3579, -14.26091, 25.38358, 1.81211, 7200, 7200, 4, 0, 0, 1), -- Tempest-Forge Destroyer
(@CGUID+62, 20059, 554, 3, 169.156, 92.0407, 0.642169, 3.19502, 7200, 7200, 0, 0, 0, 0), -- Sunseeker Netherbinder
(@CGUID+63, 20059, 554, 3, 23.3113, 21.6298, 0.00000711717, 3.11017, 7200, 7200, 0, 0, 0, 0), -- Sunseeker Netherbinder
(@CGUID+64, 20059, 554, 3, 23.1913, -20.9207, 0.00000567781, 3.04813, 7200, 7200, 0, 0, 0, 0), -- Sunseeker Netherbinder
(@CGUID+65, 20059, 554, 3, 169.469, -66.9563, 0.512734, 3.15276, 7200, 7200, 0, 0, 0, 0), -- Sunseeker Netherbinder
(@CGUID+66, 20988, 554, 3, 133.053, -39.9267, -0.00164767, 6.15486, 7200, 7200, 3, 0, 0, 1), -- Sunseeker Engineer
(@CGUID+67, 20988, 554, 3, 131.178, 40.8598, 0.007842, 1.00548, 7200, 7200, 3, 0, 0, 1), -- Sunseeker Engineer
(@CGUID+68, 20988, 554, 3, 104.072, 66.8789, 14.924, 4.4052, 7200, 7200, 0, 0, 0, 2), -- Sunseeker Engineer
(@CGUID+69, 20988, 554, 3, 138.596, -40.4336, -0.00164767, 3.13108, 7200, 7200, 3, 0, 0, 1), -- Sunseeker Engineer
(@CGUID+70, 20988, 554, 3, 221.847, -55.5895, 0.00192854, 6.04145, 7200, 7200, 0, 0, 0, 2), -- Sunseeker Engineer
(@CGUID+71, 20988, 554, 3, 100.143, -43.7053, 14.9233, 4.90812, 7200, 7200, 0, 0, 0, 2), -- Sunseeker Engineer
(@CGUID+72, 20990, 554, 3, 167.539, 81.4523, 1.13569, 3.13612, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+73, 20990, 554, 3, 119.65, 67.89, 14.9258, 2.96792, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+74, 20990, 554, 3, 74.1962, 53.6792, 14.9247, 3.12422, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+75, 20990, 554, 3, 37.3334, 55.4128, 0.162094, 1.91239, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+76, 20990, 554, 3, 23.3909, 24.1625, 0.00000711717, 3.1141, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+77, 20990, 554, 3, 23.4324, -18.349, 0.00000567781, 3.04813, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+78, 20990, 554, 3, 169.136, -88.8967, 0.652591, 3.08443, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+79, 20990, 554, 3, 119.629, -82.6008, 14.9287, 3.13313, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+80, 20990, 554, 3, 76.7499, -60.4829, 14.9247, 2.96898, 7200, 7200, 0, 0, 0, 0), -- Bloodwarder Physician
(@CGUID+81, 20990, 554, 3, 36.4878, -61.3542, 0.163072, 2.95925, 7200, 7200, 0, 0, 0, 0); -- Bloodwarder Physician

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 183788, 554, 3, 0.543812, -1.39348, 0.21172, 3.14729, 0, 0, 0, 0, 25, 25, 0, 1), -- Doodad_FactoryElevator01
(@OGUID+2, 184225, 554, 3, 73.9475, 149.684, 27.7701, 3.14159, 0, 0, 0, 0, 0, 0, 0, 0), -- Instance_Portal_Difficulty_0
(@OGUID+3, 184226, 554, 3, 73.9475, 149.684, 27.7701, 3.14159, 0, 0, 0, 0, 0, 0, 0, 0), -- Instance_Portal_Difficulty_1
(@OGUID+4, 184227, 554, 3, -38.0125, 0.10273, 0.504373, 3.14159, 0, 0, 0, 0, 0, 0, 0, 0), -- Instance_Portal_Difficulty_0
(@OGUID+5, 184228, 554, 3, -38.0125, 0.10273, 0.504373, 3.14159, 0, 0, 0, 0, 0, 0, 0, 0), -- Instance_Portal_Difficulty_1
(@OGUID+6, 184322, 554, 3, 242.874, 52.3148, 1.59633, 3.14159, 0, 0, -1, 0, 43200, 43200, 0, 1), -- Mo'arg 2 Door
(@OGUID+7, 184449, 554, 3, 267.928, 52.3148, 27.0425, 3.14159, 0, 0, -1, 0, 7200, 7200, 255, 0), -- Nethermancer Encounter Door
(@OGUID+8, 184465, 554, 1, 225.442, 83.4075, 0.002621, 4.74591, 0, 0, 0, 0, 10800, 10800, 100, 1), -- Cache of the Legion
(@OGUID+9, 184632, 554, 3, 236.46, 52.3636, 1.65354, 3.14159, 0, 0, -1, 0, 43200, 43200, 0, 1), -- Mo'arg 1 Door
(@OGUID+10, 184849, 554, 2, 225.442, 83.4075, 0.002621, 4.74591, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Cache of the Legion
-- RE-USE 11 - 13
(@OGUID+14, 185015, 554, 3, 144.904, -44.3406, 1.01041, 0.543127, 0, 0, 0, 0, 120, 120, 100, 1), -- Overcharged Manacell
(@OGUID+15, 185015, 554, 3, 146.76, -36.2917, 1.01041, 5.99065, 0, 0, 0, 0, 120, 120, 100, 1), -- Overcharged Manacell
(@OGUID+16, 185015, 554, 3, 158.931, -26.9887, 1.00972, 4.98325, 0, 0, 0, 0, 120, 120, 100, 1), -- Overcharged Manacell
(@OGUID+17, 185015, 554, 3, 151.858, -29.8824, 1.01041, 5.41365, 0, 0, 0, 0, 120, 120, 100, 1), -- Overcharged Manacell
(@OGUID+18, 184936, 554, 3, 221.32, -90.15, 0.00, 3.73, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+19, 184937, 554, 3, 221.32, -90.15, 0.00, 3.73, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+20, 184936, 554, 3, 131.80, -44.97, -0.00, 0.81, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+21, 184937, 554, 3, 131.80, -44.97, -0.00, 0.81, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+22, 184936, 554, 3, 129.97, 45.00, 0.00, 5.51, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+23, 184937, 554, 3, 129.97, 45.00, 0.00, 5.51, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+24, 184940, 554, 3, 243.344, 14.1168, -0.0019269, 0.50436, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+25, 184941, 554, 3, 243.344, 14.1168, -0.0019269, 0.50436, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+26, 184936, 554, 3, 299.06, -46.0161, 25.3949, 6.1043, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+27, 184937, 554, 3, 299.06, -46.0161, 25.3949, 6.1043, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+28, 184936, 554, 3, 143.472, 179.921, 25.5636, 1.36442, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+29, 184937, 554, 3, 143.472, 179.921, 25.5636, 1.36442, 0, 0, 0, 0, 86400, 86400, 100, 1); -- Solid Adamantite Chest

-- ======
-- EVENTS
-- ======

-- INSERT INTO `game_event_creature` (`guid`, `event`) VALUES

INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
(@CGUID+22, 0, 22804, 0, 0, 0, 2); -- Nethermancer Sepethrea (Feast of Winter Veil - Main Event)

-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES

-- =======
-- POOLING
-- =======

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
(@PGUID+41, @PGUID+40, 0, 'The Mechanar - Bound / Solid Adamantite Chest #1'),
(@PGUID+42, @PGUID+40, 0, 'The Mechanar - Bound / Solid Adamantite Chest #2'),
(@PGUID+43, @PGUID+40, 0, 'The Mechanar - Bound / Solid Adamantite Chest #3'),
(@PGUID+44, @PGUID+40, 0, 'The Mechanar - Bound / Solid Adamantite Chest #4'),
(@PGUID+45, @PGUID+40, 0, 'The Mechanar - Bound / Solid Adamantite Chest #5'),
(@PGUID+46, @PGUID+40, 0, 'The Mechanar - Bound / Solid Adamantite Chest #6');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@PGUID+40, 1, 'The Mechanar - Master Chest Pool'), -- gameobject
(@PGUID+41, 1, 'The Mechanar - Bound / Solid Adamantite Chest #1'),
(@PGUID+42, 1, 'The Mechanar - Bound / Solid Adamantite Chest #2'),
(@PGUID+43, 1, 'The Mechanar - Bound / Solid Adamantite Chest #3'),
(@PGUID+44, 1, 'The Mechanar - Bound / Solid Adamantite Chest #4'),
(@PGUID+45, 1, 'The Mechanar - Bound / Solid Adamantite Chest #5'),
(@PGUID+46, 1, 'The Mechanar - Bound / Solid Adamantite Chest #6');

-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@OGUID+18, @PGUID+41, 0, 'The Mechanar - Bound Adamantite Chest (184936) - #1'),
(@OGUID+19, @PGUID+41, 0, 'The Mechanar - Solid Adamantite Chest (184937) - #1'),
(@OGUID+20, @PGUID+42, 0, 'The Mechanar - Bound Adamantite Chest (184936) - #2'),
(@OGUID+21, @PGUID+42, 0, 'The Mechanar - Solid Adamantite Chest (184937) - #2'),
(@OGUID+22, @PGUID+43, 0, 'The Mechanar - Bound Adamantite Chest (184936) - #3'),
(@OGUID+23, @PGUID+43, 0, 'The Mechanar - Solid Adamantite Chest (184937) - #3'),
(@OGUID+24, @PGUID+44, 0, 'The Mechanar - Solid Adamantite Chest (184940) - #4'),
(@OGUID+25, @PGUID+44, 0, 'The Mechanar - Solid Adamantite Chest (184941) - #4'),
(@OGUID+26, @PGUID+45, 0, 'The Mechanar - Bound Adamantite Chest (184936) - #5'),
(@OGUID+27, @PGUID+45, 0, 'The Mechanar - Solid Adamantite Chest (184937) - #5'),
(@OGUID+28, @PGUID+46, 0, 'The Mechanar - Bound Adamantite Chest (184936) - #6'),
(@OGUID+29, @PGUID+46, 0, 'The Mechanar - Solid Adamantite Chest (184937) - #6');

-- INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- =========
-- DBSCRIPTS
-- =========

DELETE FROM dbscripts_on_creature_movement WHERE id=1971601;
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1971601, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechanar Tinkerer (Mechanar) RUN ON');

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


