/* DBScriptData
DBName: Hellfire Citadel - Magtheridon's Lair
DBScriptName: instance_magtheridons_lair
DB%Complete: 75
DBComment:
EndDBScriptData */

SET @CGUID := 5440000; -- creatures
SET @OGUID := 5440000; -- gameobjects
SET @PGUID := 48300; -- pools

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+28, 1, 2.00162, -64.4008, 22.8575, 0.645772, 5000, 1882902),
(@CGUID+29, 1, 2.69777, -60.936, 22.8984, 4.95674, 5000, 1882902),
(@CGUID+30, 1, 5.55054, -64.0838, 22.9179, 2.86234, 5000, 1882902),
(@CGUID+34, 1, -49.6813, 60.5927, 5.03416, 0.332226, 0, 0),
(@CGUID+34, 2, -37.0806, 63.5505, 11.4187, 0.234052, 0, 0),
(@CGUID+34, 3, -15.339, 64.4607, 22.4051, 0.037702, 0, 0),
(@CGUID+34, 4, -2.82082, 60.3236, 22.7537, 5.91719, 0, 0),
(@CGUID+34, 5, 10.4314, 54.2387, 22.9883, 5.7821, 0, 0),
(@CGUID+34, 6, 18.6907, 49.4066, 25.5468, 5.75383, 0, 0),
(@CGUID+34, 7, 42.6337, 20.2855, 45.0879, 5.32736, 0, 0),
(@CGUID+34, 8, 42.6019, -5.68907, 45.0774, 4.71632, 0, 0),
(@CGUID+34, 9, 41.2016, -15.4674, 44.9791, 4.52075, 0, 0),
(@CGUID+34, 10, 30.0538, -32.4034, 35.263, 4.13748, 0, 0),
(@CGUID+34, 11, 14.3028, -49.8232, 22.9866, 3.97726, 0, 0),
(@CGUID+34, 12, -13.0309, -62.9285, 22.5601, 3.57121, 0, 0),
(@CGUID+34, 13, -36.8669, -60.4307, 11.6268, 2.99551, 0, 0),
(@CGUID+34, 14, -64.109, -49.4102, -0.356022, 2.67899, 0, 0),
(@CGUID+34, 15, -79.3555, -36.7386, -0.222637, 2.43395, 0, 0),
(@CGUID+34, 16, -86.1129, -25.0452, -0.408269, 2.12057, 0, 0),
(@CGUID+34, 17, -83.6407, -29.8983, -0.407861, 5.13415, 0, 0),
(@CGUID+34, 18, -80.0049, -37.4373, -0.16519, 5.24253, 0, 0),
(@CGUID+34, 19, -64.1558, -51.1257, -0.356127, 5.57633, 0, 0),
(@CGUID+34, 20, -35.592, -62.0832, 12.3951, 6.04835, 0, 0),
(@CGUID+34, 21, -13.6475, -63.2063, 22.5574, 0.000001, 0, 0),
(@CGUID+34, 22, 6.73354, -54.1176, 22.9273, 0.469669, 0, 0),
(@CGUID+34, 23, 15.6039, -49.7295, 22.9852, 0.509725, 0, 0),
(@CGUID+34, 24, 31.6304, -31.8703, 36.0042, 0.764979, 0, 0),
(@CGUID+34, 25, 42.8399, -15.4249, 45.1253, 1.02495, 0, 0),
(@CGUID+34, 26, 44.0306, 4.02115, 45.0505, 1.58808, 0, 0),
(@CGUID+34, 27, 40.6251, 19.6828, 44.7934, 1.51739, 0, 0),
(@CGUID+34, 28, 28.8451, 37.0172, 34.6125, 2.19441, 0, 0),
(@CGUID+34, 29, 18.3277, 51.5737, 24.4037, 2.18341, 0, 0),
(@CGUID+34, 30, 10.3613, 58.283, 22.9413, 2.2054, 0, 0),
(@CGUID+34, 31, -2.81051, 60.1499, 22.7567, 3.01436, 0, 0),
(@CGUID+34, 32, -16.115, 66.385, 22.0908, 2.70334, 0, 0),
(@CGUID+34, 33, -37.9759, 64.8516, 11.1452, 3.1683, 0, 0),
(@CGUID+34, 34, -51.0157, 60.8371, 4.48624, 3.53744, 0, 0),
(@CGUID+34, 35, -75.4553, 45.1516, -0.396156, 3.77306, 0, 0),
(@CGUID+34, 36, -58.4703, 56.2286, 1.37021, 0.471243, 0, 0),
(@CGUID+35, 1, -55.234, 60.5085, 2.99863, 0, 0, 0),
(@CGUID+35, 2, -37.7151, 66.1987, 11.4115, 0, 0, 0),
(@CGUID+35, 3, -14.9284, 68.7511, 22.5529, 0, 0, 0),
(@CGUID+35, 4, 20.8101, 57.2702, 22.9905, 0, 0, 0),
(@CGUID+35, 5, 26.8489, 48.706, 28.9105, 0, 0, 0),
(@CGUID+35, 6, 47.2214, 22.5543, 45.1353, 0, 0, 0),
(@CGUID+35, 7, 38.5798, 32.6211, 39.6193, 0, 0, 0),
(@CGUID+35, 8, 20.0412, 57.3771, 22.9918, 0, 0, 0),
(@CGUID+35, 9, 2.31412, 72.5404, 22.7469, 0, 0, 0),
(@CGUID+35, 10, -16.0148, 70.392, 22.1648, 0, 0, 0),
(@CGUID+35, 11, -42.8931, 66.5904, 8.8977, 0, 0, 0),
(@CGUID+35, 12, -64.7546, 57.9985, -0.145019, 0, 0, 0),
(@CGUID+35, 13, -81.132, 42.338, -0.340041, 0, 0, 0),
(@CGUID+35, 14, -95.6278, 0.14971, -0.405304, 0, 0, 0),
(@CGUID+35, 15, -80.9191, -38.8677, -0.170906, 0, 0, 0),
(@CGUID+35, 16, -65.3985, -52.5286, -0.353556, 0, 0, 0),
(@CGUID+35, 17, -48.8276, -60.4675, 5.80386, 0, 0, 0),
(@CGUID+35, 18, -15.2278, -66.2001, 22.4984, 0, 0, 0),
(@CGUID+35, 19, 21.2852, -52.6708, 23.0739, 0, 0, 0),
(@CGUID+35, 20, 46.664, -18.4289, 45.1355, 0, 0, 0),
(@CGUID+35, 21, 21.374, -53.3218, 22.9903, 0, 0, 0),
(@CGUID+35, 22, -15.51, -66.444, 22.3805, 0, 0, 0),
(@CGUID+35, 23, -44.0308, -62.3177, 8.29794, 0, 0, 0),
(@CGUID+35, 24, -65.6405, -52.4029, -0.352717, 0, 0, 0),
(@CGUID+35, 25, -80.9337, -37.7214, -0.404019, 0, 0, 0),
(@CGUID+35, 26, -94.746, 10.1514, -0.409091, 0, 0, 0),
(@CGUID+35, 27, -80.0183, 43.6117, -0.404083, 0, 0, 0),
(@CGUID+35, 28, -65.0384, 58.4484, -0.154763, 0, 0, 0),
(@CGUID+35, 29, -56.2019, 63.2689, 3.1689, 0, 0, 0),
(@CGUID+36, 1, -52.1384, 55.7327, 3.49043, 0, 0, 0),
(@CGUID+36, 2, -40.9405, 60.8842, 9.2133, 0, 0, 0),
(@CGUID+36, 3, -15.2454, 64.8395, 22.4477, 0, 0, 0),
(@CGUID+36, 4, 1.3771, 62.4794, 22.8113, 0, 0, 0),
(@CGUID+36, 5, 16.3913, 52.8378, 23.0947, 0, 0, 0),
(@CGUID+36, 6, 24.3307, 41.3301, 31.1295, 0, 0, 0),
(@CGUID+36, 7, 37.073, 22.9092, 42.9227, 0, 0, 0),
(@CGUID+36, 8, 40.5738, 17.8492, 45.1196, 0, 0, 0),
(@CGUID+36, 9, 27.4304, 35.9925, 34.5229, 0, 0, 0),
(@CGUID+36, 10, 14.6117, 52.2796, 22.9799, 0, 0, 0),
(@CGUID+36, 11, 1.14761, 64.879, 22.7888, 0, 0, 0),
(@CGUID+36, 12, -15.541, 63.6245, 22.3126, 0, 0, 0),
(@CGUID+36, 13, -37.1306, 60.4842, 11.064, 0, 0, 0),
(@CGUID+36, 14, -50.5292, 56.4438, 4.25248, 0, 0, 0),
(@CGUID+36, 15, -60.2663, 51.5542, 0.093987, 0, 0, 0),
(@CGUID+36, 16, -80.4335, 40.0347, -0.404076, 0, 0, 0),
(@CGUID+36, 17, -84.8469, -21.2955, -0.407463, 0, 0, 0),
(@CGUID+36, 18, -78.5454, -36.5968, -0.170894, 0, 0, 0),
(@CGUID+36, 19, -61.3208, -46.4972, -0.360505, 0, 0, 0),
(@CGUID+36, 20, -40.5863, -56.342, 9.34526, 0, 0, 0),
(@CGUID+36, 21, -15.0931, -59.9033, 22.5063, 0, 0, 0),
(@CGUID+36, 22, 13.6751, -47.9871, 22.9806, 0, 0, 0),
(@CGUID+36, 23, 20.0747, -39.6656, 28.4988, 0, 0, 0),
(@CGUID+36, 24, 40.6408, -14.3598, 45.122, 0, 0, 0),
(@CGUID+36, 25, 31.6929, -25.6237, 38.4127, 0, 0, 0),
(@CGUID+36, 26, 14.3495, -47.8754, 22.98, 0, 0, 0),
(@CGUID+36, 27, 8.08049, -54.2793, 22.9213, 0, 0, 0),
(@CGUID+36, 28, -15.8007, -60.0378, 22.2069, 0, 0, 0),
(@CGUID+36, 29, -40.6956, -56.1491, 9.26639, 0, 0, 0),
(@CGUID+36, 30, -61.812, -45.8192, -0.360371, 0, 0, 0),
(@CGUID+36, 31, -78.2635, -36.2336, -0.170903, 0, 0, 0),
(@CGUID+36, 32, -87.9498, 5.63329, -0.405027, 0, 0, 0),
(@CGUID+36, 33, -77.1802, 41.3763, -0.40408, 0, 0, 0),
(@CGUID+36, 34, -62.7242, 49.8808, -0.362047, 0, 0, 0),
(@CGUID+36, 35, -53.4821, 53.9016, 2.72844, 0, 0, 0),
(@CGUID+37, 1, -0.181343, 67.1853, 22.8294, 1.5708, 5000, 1882901),
(@CGUID+38, 1, 6.12531, 69.0678, 22.9075, 2.07694, 5000, 1882901),
(@CGUID+39, 1, -8.90767, 68.377, 22.6632, 1.16937, 5000, 1882901);

-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(@CGUID+40, 0, 0, 1, 16, 0, 0, NULL); -- World Trigger (Not Immune PC)

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(17256, 0, 0, 1, 16, 0, 0, NULL), -- Hellfire Channeler
(17257, 0, 0, 1, 16, 0, 0, '30205'), -- Magtheridon
(17376, 0, 0, 1, 16, 0, 0, NULL), -- Hellfire Raid Trigger
(18829, 0, 0, 1, 16, 0, 0, NULL); -- Hellfire Warder

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+28, @CGUID+30, 3), -- Hellfire Warder -> Hellfire Warder
(@CGUID+29, @CGUID+30, 3), -- Hellfire Warder -> Hellfire Warder
(@CGUID+30, @CGUID+8, 1), -- Hellfire Warder -> Magtheridon
(@CGUID+31, @CGUID+32, 3), -- Hellfire Warder -> Hellfire Warder
(@CGUID+33, @CGUID+32, 3), -- Hellfire Warder -> Hellfire Warder
(@CGUID+35, @CGUID+34, 515), -- Hellfire Warder -> Hellfire Warder
(@CGUID+36, @CGUID+34, 515), -- Hellfire Warder -> Hellfire Warder
(@CGUID+37, @CGUID+39, 3), -- Hellfire Warder -> Hellfire Warder
(@CGUID+38, @CGUID+39, 3), -- Hellfire Warder -> Hellfire Warder
(@CGUID+39, @CGUID+8, 1); -- Hellfire Warder -> Magtheridon

REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(17256, 544, 17256, 15, 0), -- Hellfire Channeler -> Hellfire Channeler
(18829, 544, 18829, 15, 40); -- Hellfire Warder -> Hellfire Warder

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 15384, 544, 1, -2.59192, 83.3255, 22.6908, 4.57276, 7200, 7200, 0, 0, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+2, 15384, 544, 1, 3.16924, -63.2071, 22.8882, 2.14675, 7200, 7200, 0, 0, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+3, 17256, 544, 1, -55.6891, 2.17024, 0.71428, 0.05236, 604800, 604800, 0, 0, 0, 0), -- Hellfire Channeler
(@CGUID+4, 17256, 544, 1, -31.9479, 40.2201, 0.714251, 4.93928, 604800, 604800, 0, 0, 0, 0), -- Hellfire Channeler
(@CGUID+5, 17256, 544, 1, 10.4777, 23.9914, 0.714224, 3.66519, 604800, 604800, 0, 0, 0, 0), -- Hellfire Channeler
(@CGUID+6, 17256, 544, 1, 10.3369, -19.7942, 0.714241, 2.53073, 604800, 604800, 0, 0, 0, 0), -- Hellfire Channeler
(@CGUID+7, 17256, 544, 1, -31.7645, -35.8374, 0.714268, 1.37881, 604800, 604800, 0, 0, 0, 0), -- Hellfire Channeler
(@CGUID+8, 17257, 544, 1, -18.7012, 2.24051, -0.320873, 3.00197, 604800, 604800, 0, 0, 0, 0), -- Magtheridon
(@CGUID+9, 17376, 544, 1, 8.79722, -19.4801, 2.43646, 3.07178, 7200, 7200, 0, 0, 0, 0), -- Hellfire Raid Trigger
(@CGUID+10, 17376, 544, 1, -31.471, -34.156, 2.2351, 1.06465, 7200, 7200, 0, 0, 0, 0), -- Hellfire Raid Trigger
(@CGUID+11, 17376, 544, 1, -54.2772, 2.34374, 2.30456, 1.3439, 7200, 7200, 0, 0, 0, 0), -- Hellfire Raid Trigger
(@CGUID+12, 17376, 544, 1, -31.8918, 38.4303, 2.18647, 5.07891, 7200, 7200, 0, 0, 0, 0), -- Hellfire Raid Trigger
(@CGUID+13, 17376, 544, 1, 9.3589, 23.2286, 2.24895, 3.89208, 7200, 7200, 0, 0, 0, 0), -- Hellfire Raid Trigger
(@CGUID+14, 17474, 544, 1, 13.1331, 2.75793, -0.312492, 0.264242, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+15, 17474, 544, 1, -12.1116, 1.01105, -0.303638, 6.08346, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+16, 17474, 544, 1, -11.3749, -29.1214, -0.312463, 4.99445, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+17, 17474, 544, 1, -7.10759, 25.524, -0.312497, 5.1917, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+18, 17474, 544, 1, -3.11093, 29.1424, -0.31249, 5.67216, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+19, 17474, 544, 1, -37.1834, -19.4914, -0.312451, 5.05616, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+20, 17474, 544, 1, -29.691, 29.643, -0.034676, 0.478655, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+21, 17474, 544, 1, 13.1331, 2.75793, -0.312492, 0.264242, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+22, 17474, 544, 1, -12.1116, 1.01105, -0.303638, 6.08346, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+23, 17474, 544, 1, -11.3749, -29.1214, -0.312463, 4.99445, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+24, 17474, 544, 1, -7.10759, 25.524, -0.312497, 5.1917, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+25, 17474, 544, 1, -3.11093, 29.1424, -0.31249, 5.67216, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+26, 17474, 544, 1, -37.1834, -19.4914, -0.312451, 5.05616, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+27, 17474, 544, 1, -29.691, 29.643, -0.034676, 0.478655, 300, 300, 0, 0, 0, 0), -- Target Trigger
(@CGUID+28, 18829, 544, 1, 2.00162, -64.4008, 22.8575, 0.645772, 7200, 7200, 0, 0, 0, 2), -- Hellfire Warder
(@CGUID+29, 18829, 544, 1, 2.69777, -60.936, 22.8984, 4.95674, 7200, 7200, 0, 0, 0, 2), -- Hellfire Warder
(@CGUID+30, 18829, 544, 1, 5.55054, -64.0838, 22.9179, 2.86234, 7200, 7200, 0, 0, 0, 2), -- Hellfire Warder
(@CGUID+31, 18829, 544, 1, 34.5866, -3.04499, 45.1226, 0.069813, 7200, 7200, 0, 0, 0, 0), -- Hellfire Warder
(@CGUID+32, 18829, 544, 1, 36.4493, 2.02954, 45.1387, 0.034907, 7200, 7200, 0, 0, 0, 0), -- Hellfire Warder
(@CGUID+33, 18829, 544, 1, 34.3106, 6.95704, 45.1233, 0.017453, 7200, 7200, 0, 0, 0, 0), -- Hellfire Warder
(@CGUID+34, 18829, 544, 1, -53.9371, 58.8454, 3.1001, 0.356661, 7200, 7200, 5, 0, 0, 2), -- Hellfire Warder
(@CGUID+35, 18829, 544, 1, -54.8378, 60.2842, 3.07587, 0.173576, 7200, 7200, 5, 0, 0, 2), -- Hellfire Warder
(@CGUID+36, 18829, 544, 1, -53.5156, 57.127, 3.03991, 0.321231, 7200, 7200, 5, 0, 0, 2), -- Hellfire Warder
(@CGUID+37, 18829, 544, 1, -0.181343, 67.1853, 22.8294, 1.5708, 7200, 7200, 0, 0, 0, 2), -- Hellfire Warder
(@CGUID+38, 18829, 544, 1, 6.12531, 69.0678, 22.9075, 2.07694, 7200, 7200, 0, 0, 0, 2), -- Hellfire Warder
(@CGUID+39, 18829, 544, 1, -8.90767, 68.377, 22.6632, 1.16937, 7200, 7200, 0, 0, 0, 2), -- Hellfire Warder
(@CGUID+40, 21252, 544, 1, -16.683, 2.34519, -0.320923, 1.29154, 7200, 7200, 0, 0, 0, 0); -- World Trigger (Not Immune PC)

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 181713, 544, 1, 8.89169, -19.392, 0.630908, 2.44346, 0, 0, 0, 0, 900, 900, 100, 1), -- Manticron Cube
(@OGUID+2, 181713, 544, 1, -31.7948, 38.3964, 0.630919, -1.20428, 0, 0, 0, 0, 900, 900, 100, 1), -- Manticron Cube
(@OGUID+3, 181713, 544, 1, -31.4977, -34.0832, 0.630935, 1.22173, 0, 0, 0, 0, 900, 900, 100, 1), -- Manticron Cube
(@OGUID+4, 181713, 544, 1, -54.2302, 2.32818, 0.630945, 0.017453, 0, 0, 0, 0, 900, 900, 100, 1), -- Manticron Cube
(@OGUID+5, 181713, 544, 1, 9.39513, 23.2389, 0.630891, -2.49582, 0, 0, 0, 0, 900, 900, 100, 1), -- Manticron Cube
(@OGUID+6, 183847, 544, 1, -72.5866, 1.559, 0, 3.14159, 0, 0, 0, 0, 900, 900, 100, 0), -- Doodad_HF_Mag_door01
(@OGUID+7, 184634, 544, 1, 17.7522, 34.5464, 0.144816, 0.179666, 0, 0, 0, 0, 900, 900, 100, 1), -- Magtheridon Column 003
(@OGUID+8, 184635, 544, 1, 19.0966, -29.2772, 0.133036, -1.26399, 0, 0, 0, 0, 900, 900, 100, 1), -- Magtheridon Column 002
(@OGUID+9, 184636, 544, 1, -30.8852, 46.6723, -0.497104, 1.23468, 0, 0, 0, 0, 900, 900, 100, 1), -- Magtheridon Column 004
(@OGUID+10, 184637, 544, 1, -60.2491, 27.9361, -0.018443, 1.94711, 0, 0, 0, 0, 900, 900, 100, 1), -- Magtheridon Column 005
(@OGUID+11, 184638, 544, 1, -60.8202, -21.9269, -0.03026, 3.08278, 0, 0, 0, 0, 900, 900, 100, 1), -- Magtheridon Column 000
(@OGUID+12, 184639, 544, 1, -29.7699, -43.4445, -0.522461, -2.37604, 0, 0, 0, 0, 900, 900, 100, 1), -- Magtheridon Column 001
(@OGUID+13, 184653, 544, 1, 0, 0, 0, 3.14159, 0, 0, 0, 0, 900, 900, 100, 1); -- Doodad_Hellfire_Raid_FX01

-- ======
-- EVENTS
-- ======

-- INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
-- INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES

-- =======
-- POOLING
-- =======

-- INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
-- INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- =========
-- DBSCRIPTS
-- =========

DELETE FROM dbscripts_on_creature_movement WHERE id IN (1882901,1882902);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1882901, 1000, 15, 33346, 0, 0, 15384, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Green Beam at Trigger'),
(1882901, 2000, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'movement changed to 0:idle'),
(1882902, 1000, 15, 33827, 0, 0, 15384, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Hellfire Warder Channel Visual at Trigger'),
(1882902, 2000, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'movement changed to 0:idle');

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


