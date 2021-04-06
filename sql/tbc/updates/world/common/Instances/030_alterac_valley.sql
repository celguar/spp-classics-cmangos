/* DBScriptData
DBName: Alterac Valley
DBScriptName:
DB%Complete: 50
DBComment:
Add correct position for Frostwolf Battleguard 14285 at Horde Entrance
Frostwolf Bloodhound 14282 has 12787 prenerf?
10991/11677/13088 has 8876 prenerf?
11603 sometimes have s.13589 - Whitewhisker Overseer 11605 ACID seems wrong
Find Sniff Spawn Position for @CGUID+609, @CGUID+611, @CGUID+612, @CGUID+613
Frostwolf 10981 & Alterac Ram 10990 are maybe pooled
13116/13117 ss.24237 summon 26350/26351 which use ss.46893
EndDBScriptData */

SET @CGUID := 3000000; -- creatures
SET @OGUID := 3000000; -- gameobjects
SET @PGUID := 44900; -- pools

-- ============
-- BATTLEGROUND
-- ============

DELETE FROM `battleground_events` WHERE `map` = 30;
INSERT INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES
(30, 0, 0, 'Firstaid Station - Alliance Assaulted'),
(30, 0, 1, 'Firstaid Station - Alliance Control'),
(30, 0, 2, 'Firstaid Station - Horde Assaulted'),
(30, 0, 3, 'Firstaid Station - Horde Control'),
(30, 1, 0, 'Stormpike Grave - Alliance Assaulted'),
(30, 1, 1, 'Stormpike Grave - Alliance Control'),
(30, 1, 2, 'Stormpike Grave - Horde Assaulted'),
(30, 1, 3, 'Stormpike Grave - Horde Control'),
(30, 2, 0, 'Stoneheart Grave - Alliance Assaulted'),
(30, 2, 1, 'Stoneheart Grave - Alliance Control'),
(30, 2, 2, 'Stoneheart Grave - Horde Assaulted'),
(30, 2, 3, 'Stoneheart Grave - Horde Control'),
(30, 3, 0, 'Snowfall Grave - Alliance Assaulted'),
(30, 3, 1, 'Snowfall Grave - Alliance Control'),
(30, 3, 2, 'Snowfall Grave - Horde Assaulted'),
(30, 3, 3, 'Snowfall Grave - Horde Control'),
(30, 3, 5, 'Snowfall Grave - Neutral Control'),
(30, 4, 0, 'Iceblood Grave - Alliance Assaulted'),
(30, 4, 1, 'Iceblood Grave - Alliance Control'),
(30, 4, 2, 'Iceblood Grave - Horde Assaulted'),
(30, 4, 3, 'Iceblood Grave - Horde Control'),
(30, 5, 0, 'Frostwolf Grave - Alliance Assaulted'),
(30, 5, 1, 'Frostwolf Grave - Alliance Control'),
(30, 5, 2, 'Frostwolf Grave - Horde Assaulted'),
(30, 5, 3, 'Frostwolf Grave - Horde Control'),
(30, 6, 0, 'Frostwolf Hut - Alliance Assaulted'),
(30, 6, 1, 'Frostwolf Hut - ALliance Control'),
(30, 6, 2, 'Frostwolf Hut - Horde Assaulted'),
(30, 6, 3, 'Frostwolf Hut - Horde Control'),
(30, 7, 1, 'Dunbaldar South - Alliance Control'),
(30, 7, 2, 'Dunbaldar South - Horde Assaulted'),
(30, 7, 3, 'Dunbaldar South - Horde Control'),
(30, 8, 1, 'Dunbaldar North - Alliance Control'),
(30, 8, 2, 'Dunbaldar North - Horde Assaulted'),
(30, 8, 3, 'Dunbaldar North - Horde Control'),
(30, 9, 1, 'Icewing Bunker - Alliance Control'),
(30, 9, 2, 'Icewing Bunker - Horde Assaulted'),
(30, 9, 3, 'Icewing Bunker - Horde Control'),
(30, 10, 1, 'Stoneheart Bunker - Alliance Control'),
(30, 10, 2, 'Stoneheart Bunker - Horde Assaulted'),
(30, 10, 3, 'Stoneheart Bunker - Horde Control'),
(30, 11, 0, 'Iceblood Tower - Alliance Assaulted'),
(30, 11, 1, 'Iceblood Tower - Alliance Control'),
(30, 11, 3, 'Iceblood Tower - Horde Control'),
(30, 12, 0, 'Tower Point - Alliance Assaulted'),
(30, 12, 1, 'Tower Point - Alliance Control'),
(30, 12, 3, 'Tower Point - Horde Control'),
(30, 13, 0, 'Frostwolf east Tower - Alliance Assaulted'),
(30, 13, 1, 'Frostwolf east Tower - Alliance Control'),
(30, 13, 3, 'Frostwolf east Tower - Horde Control'),
(30, 14, 0, 'Frostwolf west Tower - Alliance Assaulted'),
(30, 14, 1, 'Frostwolf west Tower - Alliance Control'),
(30, 14, 3, 'Frostwolf west Tower - Horde Control'),
(30, 15, 0, 'Firstaid Station - Alliance Defender Quest0'),
(30, 15, 1, 'Firstaid Station - Alliance Defender Quest1'),
(30, 15, 2, 'Firstaid Station - Alliance Defender Quest2'),
(30, 15, 3, 'Firstaid Station - Alliance Defender Quest3'),
(30, 15, 4, 'Firstaid Station - Horde Defender Quest0'),
(30, 15, 5, 'Firstaid Station - Horde Defender Quest1'),
(30, 15, 6, 'Firstaid Station - Horde Defender Quest2'),
(30, 15, 7, 'Firstaid Station - Horde Defender Quest3'),
(30, 16, 0, 'Stormpike Grave - Alliance Defender Quest0'),
(30, 16, 1, 'Stormpike Grave - Alliance Defender Quest1'),
(30, 16, 2, 'Stormpike Grave - Alliance Defender Quest2'),
(30, 16, 3, 'Stormpike Grave - Alliance Defender Quest3'),
(30, 16, 4, 'Stormpike Grave - Horde Defender Quest0'),
(30, 16, 5, 'Stormpike Grave - Horde Defender Quest1'),
(30, 16, 6, 'Stormpike Grave - Horde Defender Quest2'),
(30, 16, 7, 'Stormpike Grave - Horde Defender Quest3'),
(30, 17, 0, 'Stoneheart Grave - Alliance Defender Quest0'),
(30, 17, 1, 'Stoneheart Grave - Alliance Defender Quest1'),
(30, 17, 2, 'Stoneheart Grave - Alliance Defender Quest2'),
(30, 17, 3, 'Stoneheart Grave - Alliance Defender Quest3'),
(30, 17, 4, 'Stoneheart Grave - Horde Defender Quest0'),
(30, 17, 5, 'Stoneheart Grave - Horde Defender Quest1'),
(30, 17, 6, 'Stoneheart Grave - Horde Defender Quest2'),
(30, 17, 7, 'Stoneheart Grave - Horde Defender Quest3'),
(30, 18, 0, 'Snowfall Grave - Alliance Defender Quest0'),
(30, 18, 1, 'Snowfall Grave - Alliance Defender Quest1'),
(30, 18, 2, 'Snowfall Grave - Alliance Defender Quest2'),
(30, 18, 3, 'Snowfall Grave - Alliance Defender Quest3'),
(30, 18, 4, 'Snowfall Grave - Horde Defender Quest0'),
(30, 18, 5, 'Snowfall Grave - Horde Defender Quest1'),
(30, 18, 6, 'Snowfall Grave - Horde Defender Quest2'),
(30, 18, 7, 'Snowfall Grave - Horde Defender Quest3'),
(30, 19, 0, 'Iceblood Grave - Alliance Defender Quest0'),
(30, 19, 1, 'Iceblood Grave - Alliance Defender Quest1'),
(30, 19, 2, 'Iceblood Grave - Alliance Defender Quest2'),
(30, 19, 3, 'Iceblood Grave - Alliance Defender Quest3'),
(30, 19, 4, 'Iceblood Grave - Horde Defender Quest0'),
(30, 19, 5, 'Iceblood Grave - Horde Defender Quest1'),
(30, 19, 6, 'Iceblood Grave - Horde Defender Quest2'),
(30, 19, 7, 'Iceblood Grave - Horde Defender Quest3'),
(30, 20, 0, 'Frostwolf Grave - Alliance Defender Quest0'),
(30, 20, 1, 'Frostwolf Grave - Alliance Defender Quest1'),
(30, 20, 2, 'Frostwolf Grave - Alliance Defender Quest2'),
(30, 20, 3, 'Frostwolf Grave - Alliance Defender Quest3'),
(30, 20, 4, 'Frostwolf Grave - Horde Defender Quest0'),
(30, 20, 5, 'Frostwolf Grave - Horde Defender Quest1'),
(30, 20, 6, 'Frostwolf Grave - Horde Defender Quest2'),
(30, 20, 7, 'Frostwolf Grave - Horde Defender Quest3'),
(30, 21, 0, 'Frostwolf Hut - Alliance Defender Quest0'),
(30, 21, 1, 'Frostwolf Hut - Alliance Defender Quest1'),
(30, 21, 2, 'Frostwolf Hut - Alliance Defender Quest2'),
(30, 21, 3, 'Frostwolf Hut - Alliance Defender Quest3'),
(30, 21, 4, 'Frostwolf Hut - Horde Defender Quest0'),
(30, 21, 5, 'Frostwolf Hut - Horde Defender Quest1'),
(30, 21, 6, 'Frostwolf Hut - Horde Defender Quest2'),
(30, 21, 7, 'Frostwolf Hut - Horde Defender Quest3'),
(30, 46, 1, 'North Mine - Alliance Boss'),
(30, 46, 3, 'North Mine - Horde Boss'),
(30, 46, 5, 'North Mine - Neutral Boss'),
(30, 47, 1, 'South Mine - Alliance Boss'),
(30, 47, 3, 'South Mine - Horde Boss'),
(30, 47, 5, 'South Mine - Neutral Boss'),
(30, 48, 0, 'Alliance Captain'),
(30, 49, 0, 'Horde Captain'),
(30, 50, 1, 'North Mine - Alliance Control'),
(30, 50, 3, 'North Mine - Horde Control'),
(30, 50, 5, 'North Mine - Neutral Control'),
(30, 51, 1, 'South Mine - Alliance Control'),
(30, 51, 3, 'South Mine - Horde Control'),
(30, 51, 5, 'South Mine - Neutral Control'),
(30, 52, 0, 'Alliance Marshal - Dunbaldar South'),
(30, 53, 0, 'Alliance Marshal - Dunbaldar North'),
(30, 54, 0, 'Alliance Marshal - Icewing Bunker'),
(30, 55, 0, 'Alliance Marshal - Stoneheart Bunker'),
(30, 56, 0, 'Horde Marshal - Iceblood Tower'),
(30, 57, 0, 'Horde Marshal - Towerpoint'),
(30, 58, 0, 'Horde Marshal - East Frostwolf Tower'),
(30, 59, 0, 'Horde Marshal - West Frostwolf Tower'),
(30, 60, 0, 'Herald - That Guy Who Yells All The Time'),
(30, 61, 0, 'Alliance - Boss'),
(30, 62, 0, 'Horde - Boss'),
(30, 63, 0, 'Alliance - Captain Dead'),
(30, 64, 0, 'Horde - Captain Dead'),
(30, 254, 0, 'Doors');

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+327, 1, -717.9724, -351.5104, 67.01498, 100, 0, 0),
(@CGUID+327, 2, -672.0903, -378.3383, 65.37374, 100, 0, 0),
(@CGUID+327, 3, -717.9724, -351.5104, 67.01498, 100, 0, 0),
(@CGUID+327, 4, -715.8, -399.0, 67.6, 100, 0, 0),
(@CGUID+327, 5, -734.6262, -417.6662, 67.63018, 100, 0, 0),
(@CGUID+327, 6, -754.5065, -433.2337, 65.92907, 100, 0, 0),
(@CGUID+327, 7, -734.6262, -417.6662, 67.63018, 100, 0, 0),
(@CGUID+327, 8, -715.8, -399.0, 67.6, 100, 0, 0),
(@CGUID+328, 1, -1210.257, -291.6836, 71.45374, 100, 0, 0),
(@CGUID+328, 2, -1204.342, -283.5223, 71.92797, 100, 0, 0),
(@CGUID+328, 3, -1199.276, -269.5737, 72.33282, 100, 0, 0),
(@CGUID+328, 4, -1207.1, -254.5, 72.53, 100, 0, 0),
(@CGUID+328, 5, -1199.276, -269.5737, 72.33282, 100, 0, 0),
(@CGUID+328, 6, -1204.342, -283.5223, 71.92797, 100, 0, 0),
(@CGUID+328, 7, -1210.257, -291.6836, 71.45374, 100, 0, 0),
(@CGUID+328, 8, -1226.996, -310.9992, 63.6784, 100, 0, 0),
(@CGUID+328, 9, -1238.369, -324.9574, 60.26186, 100, 0, 0),
(@CGUID+328, 10, -1247.391, -342.1514, 59.55701, 100, 0, 0),
(@CGUID+328, 11, -1241.973, -363.2155, 59.78738, 100, 0, 0),
(@CGUID+328, 12, -1229.135, -368.157, 58.34117, 100, 0, 0),
(@CGUID+328, 13, -1216.346, -367.1806, 56.8439, 100, 0, 0),
(@CGUID+328, 14, -1180.38, -359.7979, 52.35567, 100, 0, 0),
(@CGUID+328, 15, -1169.7, -355.1, 51.8, 100, 0, 0),
(@CGUID+328, 16, -1180.38, -359.7979, 52.35567, 100, 0, 0),
(@CGUID+328, 17, -1216.346, -367.1806, 56.8439, 100, 0, 0),
(@CGUID+328, 18, -1229.135, -368.157, 58.34117, 100, 0, 0),
(@CGUID+328, 19, -1241.973, -363.2155, 59.78738, 100, 0, 0),
(@CGUID+328, 20, -1247.391, -342.1514, 59.55701, 100, 0, 0),
(@CGUID+328, 21, -1238.369, -324.9574, 60.26186, 100, 0, 0),
(@CGUID+328, 22, -1226.996, -310.9992, 63.6784, 100, 0, 0),
(@CGUID+345, 1, -1486.33, -682.971, 47.7011, 100, 0, 0),
(@CGUID+345, 2, -1494.91, -648.142, 48.4024, 100, 0, 0),
(@CGUID+345, 3, -1489.91, -629.843, 47.5982, 100, 0, 0),
(@CGUID+345, 4, -1460.69, -607.274, 51.3118, 100, 0, 0),
(@CGUID+345, 5, -1451.77, -605.11, 51.1929, 100, 0, 0),
(@CGUID+345, 6, -1437.34, -611.431, 51.134, 100, 0, 0),
(@CGUID+345, 7, -1432.5, -590.196, 51.0203, 100, 0, 0),
(@CGUID+345, 8, -1415.36, -576.796, 54.1464, 100, 0, 0),
(@CGUID+345, 9, -1394.32, -557.176, 55.2875, 100, 0, 0),
(@CGUID+345, 10, -1415.36, -576.796, 54.1464, 100, 0, 0),
(@CGUID+345, 11, -1432.5, -590.196, 51.0203, 100, 0, 0),
(@CGUID+345, 12, -1437.34, -611.431, 51.134, 100, 0, 0),
(@CGUID+345, 13, -1451.77, -605.11, 51.1929, 100, 0, 0),
(@CGUID+345, 14, -1460.69, -607.274, 51.3118, 100, 0, 0),
(@CGUID+345, 15, -1489.91, -629.843, 47.5982, 100, 0, 0),
(@CGUID+345, 16, -1494.91, -648.142, 48.4024, 100, 0, 0),
(@CGUID+345, 17, -1486.33, -682.971, 47.7011, 100, 0, 0),
(@CGUID+345, 18, -1491.89, -701.583, 46.8154, 100, 0, 0),
(@CGUID+345, 19, -1500.38, -707.63, 47.4581, 100, 0, 0),
(@CGUID+345, 20, -1491.89, -701.583, 46.8154, 100, 0, 0),
(@CGUID+387, 1, 289.6146, -383.6547, 4.620863, 100, 0, 0),
(@CGUID+387, 2, 266.3748, -400.5663, 20.63937, 100, 0, 0),
(@CGUID+387, 3, 236.8505, -420.9095, 37.19023, 100, 0, 0),
(@CGUID+387, 4, 195.3, -408.6, 42.9, 100, 0, 0),
(@CGUID+387, 5, 236.8505, -420.9095, 37.19023, 100, 0, 0),
(@CGUID+387, 6, 266.3748, -400.5663, 20.63937, 100, 0, 0),
(@CGUID+387, 7, 289.6146, -383.6547, 4.620863, 100, 0, 0),
(@CGUID+387, 8, 308.608, -379.6056, -0.1389214, 100, 0, 0),
(@CGUID+387, 9, 336.9562, -382.6639, -0.5014818, 100, 0, 0),
(@CGUID+387, 10, 386.1, -394.1, -1.0, 100, 0, 0),
(@CGUID+387, 11, 336.9562, -382.6639, -0.5014818, 100, 0, 0),
(@CGUID+387, 12, 308.608, -379.6056, -0.1389214, 100, 0, 0),
(@CGUID+389, 1, 504.8129, -333.6856, -1.07503, 100, 0, 0),
(@CGUID+389, 2, 529.7457, -323.3787, 1.453802, 100, 0, 0),
(@CGUID+389, 3, 569.9723, -330.872, 23.32988, 100, 0, 0),
(@CGUID+389, 4, 589.1626, -336.1972, 30.21035, 100, 0, 0),
(@CGUID+389, 5, 597.5015, -337.8206, 30.21035, 100, 0, 0),
(@CGUID+389, 6, 605.5213, -337.1194, 30.41666, 100, 0, 0),
(@CGUID+389, 7, 616.1661, -331.9636, 30.23941, 100, 0, 0),
(@CGUID+389, 8, 631.8382, -315.1201, 30.17706, 100, 0, 0),
(@CGUID+389, 9, 637.2, -288.6, 30.1, 100, 0, 0),
(@CGUID+389, 10, 631.8382, -315.1201, 30.17706, 100, 0, 0),
(@CGUID+389, 11, 616.1661, -331.9636, 30.23941, 100, 0, 0),
(@CGUID+389, 12, 605.5213, -337.1194, 30.41666, 100, 0, 0),
(@CGUID+389, 13, 597.5015, -337.8206, 30.21035, 100, 0, 0),
(@CGUID+389, 14, 589.1626, -336.1972, 30.21035, 100, 0, 0),
(@CGUID+389, 15, 569.9723, -330.872, 23.32988, 100, 0, 0),
(@CGUID+389, 16, 529.7457, -323.3787, 1.453802, 100, 0, 0),
(@CGUID+389, 17, 504.8129, -333.6856, -1.07503, 100, 0, 0),
(@CGUID+389, 18, 490.1862, -345.8856, -1.170044, 100, 0, 0),
(@CGUID+389, 19, 465.7911, -365.4338, -1.129818, 100, 0, 0),
(@CGUID+389, 20, 416.4, -382.7, -1.2, 100, 0, 0),
(@CGUID+389, 21, 465.7911, -365.4338, -1.129818, 100, 0, 0),
(@CGUID+389, 22, 490.1862, -345.8856, -1.170044, 100, 0, 0),
(@CGUID+391, 1, 705.7, -465.1, 67.4, 100, 0, 0),
(@CGUID+391, 2, 726.0901, -475.4705, 79.14072, 100, 0, 0),
(@CGUID+391, 3, 744.2236, -479.2292, 86.93983, 100, 0, 0),
(@CGUID+391, 4, 726.0901, -475.4705, 79.14072, 100, 0, 0),
(@CGUID+391, 5, 705.7, -465.1, 67.4, 100, 0, 0),
(@CGUID+391, 6, 697.8643, -433.238, 62.79142, 100, 0, 0),
(@CGUID+1130, 1, 927.5777, -515.9267, 93.3563, 100, 0, 0),
(@CGUID+1130, 2, 918.3017, -515.0845, 93.68497, 100, 0, 0),
(@CGUID+1130, 3, 907.7813, -514.1292, 94.7373, 100, 0, 0),
(@CGUID+1130, 4, 894.2585, -511.6711, 96.00562, 100, 0, 0),
(@CGUID+1130, 5, 885.7021, -508.7171, 96.83955, 100, 0, 0),
(@CGUID+1130, 6, 882.9472, -507.766, 96.68661, 100, 0, 0),
(@CGUID+1130, 7, 879.2994, -490.8898, 96.54842, 100, 0, 0),
(@CGUID+1130, 8, 872.6658, -491.6815, 96.55302, 100, 0, 0),
(@CGUID+1130, 9, 865.7615, -494.7393, 96.58194, 100, 0, 0),
(@CGUID+1130, 10, 852.6349, -500.169, 96.39604, 100, 0, 0),
(@CGUID+1130, 11, 847.1078, -499.4121, 97.57212, 100, 0, 0),
(@CGUID+1130, 12, 833.5049, -497.5145, 99.49442, 100, 0, 0),
(@CGUID+1130, 13, 824.1744, -496.2, 100.7622, 100, 0, 0),
(@CGUID+1130, 14, 815.2069, -495.48, 100.0972, 100, 0, 0),
(@CGUID+1130, 15, 807.1964, -494.8593, 100.078, 100, 0, 0),
(@CGUID+1130, 16, 815.2069, -495.48, 100.0972, 100, 0, 0),
(@CGUID+1130, 17, 824.1744, -496.2, 100.7622, 100, 0, 0),
(@CGUID+1130, 18, 833.5049, -497.5145, 99.49442, 100, 0, 0),
(@CGUID+1130, 19, 847.1078, -499.4121, 97.57212, 100, 0, 0),
(@CGUID+1130, 20, 852.6349, -500.169, 96.39604, 100, 0, 0),
(@CGUID+1130, 21, 865.7615, -494.7393, 96.58194, 100, 0, 0),
(@CGUID+1130, 22, 872.6658, -491.6815, 96.55302, 100, 0, 0),
(@CGUID+1130, 23, 879.2994, -490.8898, 96.54842, 100, 0, 0),
(@CGUID+1130, 24, 882.9472, -507.766, 96.68661, 100, 0, 0),
(@CGUID+1130, 25, 885.7021, -508.7171, 96.83955, 100, 0, 0),
(@CGUID+1130, 26, 894.2585, -511.6711, 96.00562, 100, 0, 0),
(@CGUID+1130, 27, 907.7813, -514.1292, 94.7373, 100, 0, 0),
(@CGUID+1130, 28, 918.3017, -515.0845, 93.68497, 100, 0, 0),
(@CGUID+1899, 1, 39.89626, 102.9547, 21.90303, 100, 0, 0),
(@CGUID+1899, 2, 31.50856, 94.22149, 21.40742, 100, 0, 0),
(@CGUID+1899, 3, 24.31769, 88.03424, 20.8376, 100, 0, 0),
(@CGUID+1899, 4, 8.748568, 84.28809, 19.26014, 3.377733, 40000, 0),
(@CGUID+1899, 5, 13.1456, 86.09248, 19.95485, 100, 0, 0),
(@CGUID+1899, 6, 24.94954, 89.21867, 20.89757, 100, 0, 0),
(@CGUID+1899, 7, 33.83179, 95.94749, 21.7635, 100, 0, 0),
(@CGUID+1899, 8, 40.82042, 103.9332, 21.93791, 4.171337, 51000, 0); -- 40-51secs something

-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(@CGUID+36, 0, 0, 1, 16, 0, 0, NULL), -- Irondeep Trogg
(@CGUID+37, 0, 0, 1, 16, 0, 0, NULL), -- Irondeep Trogg
(@CGUID+38, 0, 0, 1, 16, 0, 0, NULL), -- Irondeep Trogg
(@CGUID+39, 0, 0, 1, 16, 0, 0, NULL), -- Irondeep Trogg
(@CGUID+40, 0, 0, 1, 16, 0, 0, NULL), -- Irondeep Trogg
(@CGUID+41, 0, 0, 1, 16, 0, 0, NULL), -- Irondeep Trogg
(@CGUID+162, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+163, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+164, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+165, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+166, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+167, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+168, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+169, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+170, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+171, 0, 0, 1, 16, 0, 0, NULL), -- Whitewhisker Digger
(@CGUID+644, 0, 0, 1, 16, 0, 0, NULL), -- Coldmine Peon
(@CGUID+645, 0, 0, 1, 16, 0, 0, NULL), -- Coldmine Peon
(@CGUID+696, 0, 0, 1, 16, 0, 0, NULL), -- Coldmine Miner
(@CGUID+697, 0, 0, 1, 16, 0, 0, NULL), -- Coldmine Miner
(@CGUID+698, 0, 0, 1, 16, 0, 0, NULL), -- Coldmine Miner
(@CGUID+699, 0, 0, 1, 16, 0, 0, NULL), -- Coldmine Miner
(@CGUID+700, 0, 0, 1, 16, 0, 0, NULL), -- Coldmine Miner
(@CGUID+955, 0, 0, 1, 16, 0, 0, NULL), -- Irondeep Peon
(@CGUID+956, 0, 0, 1, 16, 0, 0, NULL); -- Irondeep Peon

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(10987, 0, 0, 1, 16, 233, 0, NULL), -- Irondeep Trogg
(10991, 0, 0, 1, 16, 0, 0, NULL), -- Wildpaw Gnoll
(11603, 0, 0, 1, 16, 233, 0, NULL), -- Whitewhisker Digger
(11677, 0, 0, 1, 16, 0, 0, NULL), -- Taskmaster Snivvle
(12050, 0, 0, 1, 16, 0, 0, '5301'), -- Stormpike Defender
(12053, 0, 0, 1, 16, 0, 0, '5301'), -- Frostwolf Guardian
(13088, 0, 0, 1, 16, 0, 0, NULL), -- Masha Swiftcut
(13116, 0, 0, 0, 0, 0, 0, ''), -- Alliance Spirit Guide s.22011 - npc_spirit_guide
(13117, 0, 0, 0, 0, 0, 0, ''), -- Horde Spirit Guide s.22011 - npc_spirit_guide
(13316, 0, 0, 1, 16, 233, 0, NULL), -- Coldmine Peon
(13317, 0, 0, 1, 16, 233, 0, NULL), -- Coldmine Miner
(13326, 0, 0, 1, 16, 0, 0, '5301'), -- Seasoned Defender
(13328, 0, 0, 1, 16, 0, 0, '5301'), -- Seasoned Guardian
(13331, 0, 0, 1, 16, 0, 0, '5301'), -- Veteran Defender
(13332, 0, 0, 1, 16, 0, 0, '5301'), -- Veteran Guardian
(13358, 0, 0, 2, 0, 0, 0, NULL), -- Stormpike Bowman
(13359, 0, 0, 2, 0, 0, 0, NULL), -- Frostwolf Bowman
(13396, 0, 0, 1, 16, 233, 0, NULL), -- Irondeep Miner
(13397, 0, 0, 1, 16, 233, 0, NULL), -- Irondeep Peon
(13421, 0, 0, 1, 16, 0, 0, '5301'), -- Champion Guardian - aura guessed
(13422, 0, 0, 1, 16, 0, 0, '5301'), -- Champion Defender - aura guessed
(13437, 0, 0, 1, 16, 0, 0, NULL), -- Wing Commander Ichman
(13577, 2786, 0, 0, 0, 0, 0, NULL), -- Stormpike Ram Rider Commander
(14282, 0, 0, 1, 16, 0, 0, '18950'), -- Frostwolf Bloodhound
(14283, 0, 0, 1, 16, 0, 0, '18950'), -- Stormpike Owl
(14284, 0, 0, 1, 16, 0, 0, '12782'), -- Stormpike Battleguard
(14285, 0, 0, 1, 16, 0, 0, '12782'), -- Frostwolf Battleguard
(14762, 0, 0, 1, 0, 0, 0, '45828'), -- Dun Baldar North Marshal
(14763, 0, 0, 1, 0, 0, 0, '45829'), -- Dun Baldar South Marshal
(14764, 0, 0, 1, 0, 0, 0, '45831'), -- Icewing Marshal
(14765, 0, 0, 1, 0, 0, 0, '45830'), -- Stonehearth Marshal
(14772, 0, 0, 1, 0, 0, 0, '45826'), -- East Frostwolf Warmaster
(14773, 0, 0, 1, 0, 0, 0, '45822'), -- Iceblood Warmaster
(14776, 0, 0, 1, 0, 0, 0, '45823'), -- Tower Point Warmaster
(14777, 0, 0, 1, 0, 0, 0, '45824'); -- West Frostwolf Warmaster

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+1120, @CGUID+327, 515), -- Frostwolf Bloodhound -> Frostwolf Legionnaire
(@CGUID+1121, @CGUID+327, 515), -- Frostwolf Bloodhound -> Frostwolf Legionnaire
(@CGUID+1122, @CGUID+328, 515), -- Frostwolf Bloodhound -> Frostwolf Legionnaire
(@CGUID+1123, @CGUID+328, 515), -- Frostwolf Bloodhound -> Frostwolf Legionnaire
(@CGUID+346, @CGUID+345, 515), -- Frostwolf Bloodhound -> Frostwolf Battleguard
(@CGUID+347, @CGUID+345, 515), -- Frostwolf Bloodhound -> Frostwolf Battleguard
(@CGUID+642, @CGUID+387, 515), -- Stormpike Owl -> Stormpike Guardsman
(@CGUID+643, @CGUID+387, 515), -- Stormpike Owl -> Stormpike Guardsman
(@CGUID+390, @CGUID+389, 515), -- Stormpike Guardsman -> Stormpike Guardsman
(@CGUID+392, @CGUID+391, 515), -- Stormpike Guardsman -> Stormpike Guardsman
(@CGUID+640, @CGUID+1130, 515), -- Stormpike Owl -> Stormpike Battleguard
(@CGUID+641, @CGUID+1130, 515); -- Stormpike Owl -> Stormpike Battleguard

INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(14772, 30, 11946, 1+16384, 0), -- East Frostwolf Warmaster -> Drek'Thar
(14773, 30, 11946, 1+16384, 0), -- Iceblood Warmaster -> Drek'Thar
(14776, 30, 11946, 1+16384, 0), -- Tower Point Warmaster -> Drek'Thar
(14777, 30, 11946, 1+16384, 0), -- West Frostwolf Warmaster -> Drek'Thar
(12121, 30, 11946, 5+16384, 0), -- Drakan -> Drek'Thar
(12122, 30, 11946, 5+16384, 0), -- Duros -> Drek'Thar
(14762, 30, 11948, 1+16384, 0), -- Dun Baldar North Marshal -> Vanndar Stormpike
(14763, 30, 11948, 1+16384, 0), -- Dun Baldar South Marshal -> Vanndar Stormpike
(14764, 30, 11948, 1+16384, 0), -- Icewing Marshal -> Vanndar Stormpike
(14765, 30, 11948, 1+16384, 0), -- Stonehearth Marshal -> Vanndar Stormpike
(13443, 30, 13442, 515, 50), -- Druid of the Grove -> Arch Druid Renferal
(13284, 30, 13236, 515, 50); -- Frostwolf Shaman -> Primalist Thurloga

INSERT INTO `creature_battleground` (`guid`, `event1`, `event2`) VALUES
(@CGUID+602, 0, 1), -- Firstaid Station - Alliance Control
(@CGUID+609, 0, 3), -- Firstaid Station - Horde Control
(@CGUID+603, 1, 1), -- Stormpike Grave - Alliance Control
(@CGUID+610, 1, 3), -- Stormpike Grave - Horde Control
(@CGUID+604, 2, 1), -- Stoneheart Grave - Alliance Control
(@CGUID+611, 2, 3), -- Stoneheart Grave - Horde Control
(@CGUID+605, 3, 1), -- Snowfall Grave - Alliance Control
(@CGUID+612, 3, 3), -- Snowfall Grave - Horde Control
(@CGUID+606, 4, 1), -- Iceblood Grave - Alliance Control
(@CGUID+613, 4, 3), -- Iceblood Grave - Horde Control
(@CGUID+607, 5, 1), -- Frostwolf Grave - Alliance Control
(@CGUID+614, 5, 3), -- Frostwolf Grave - Horde Control
(@CGUID+608, 6, 1), -- Frostwolf Hut - Alliance Control
(@CGUID+615, 6, 3), -- Frostwolf Hut - Horde Control
(@CGUID+873, 7, 1), -- Dunbaldar South - Alliance Control
(@CGUID+874, 7, 1), -- Dunbaldar South - Alliance Control
(@CGUID+875, 7, 1), -- Dunbaldar South - Alliance Control
(@CGUID+876, 7, 1), -- Dunbaldar South - Alliance Control
(@CGUID+877, 8, 1), -- Dunbaldar North - Alliance Control
(@CGUID+878, 8, 1), -- Dunbaldar North - Alliance Control
(@CGUID+879, 8, 1), -- Dunbaldar North - Alliance Control
(@CGUID+880, 8, 1), -- Dunbaldar North - Alliance Control
(@CGUID+881, 9, 1), -- Icewing Bunker - Alliance Control
(@CGUID+882, 9, 1), -- Icewing Bunker - Alliance Control
(@CGUID+883, 9, 1), -- Icewing Bunker - Alliance Control
(@CGUID+884, 9, 1), -- Icewing Bunker - Alliance Control
(@CGUID+885, 10, 1), -- Stoneheart Bunker - Alliance Control
(@CGUID+886, 10, 1), -- Stoneheart Bunker - Alliance Control
(@CGUID+887, 10, 1), -- Stoneheart Bunker - Alliance Control
(@CGUID+888, 10, 1), -- Stoneheart Bunker - Alliance Control
(@CGUID+889, 11, 3), -- Iceblood Tower - Horde Control
(@CGUID+890, 11, 3), -- Iceblood Tower - Horde Control
(@CGUID+891, 11, 3), -- Iceblood Tower - Horde Control
(@CGUID+892, 11, 3), -- Iceblood Tower - Horde Control
(@CGUID+893, 12, 3), -- Tower Point - Horde Control
(@CGUID+894, 12, 3), -- Tower Point - Horde Control
(@CGUID+895, 12, 3), -- Tower Point - Horde Control
(@CGUID+896, 12, 3), -- Tower Point - Horde Control
(@CGUID+897, 13, 3), -- Frostwolf east Tower - Horde Control
(@CGUID+898, 13, 3), -- Frostwolf east Tower - Horde Control
(@CGUID+899, 13, 3), -- Frostwolf east Tower - Horde Control
(@CGUID+900, 13, 3), -- Frostwolf east Tower - Horde Control
(@CGUID+901, 14, 3), -- Frostwolf west Tower - Horde Control
(@CGUID+902, 14, 3), -- Frostwolf west Tower - Horde Control
(@CGUID+903, 14, 3), -- Frostwolf west Tower - Horde Control
(@CGUID+904, 14, 3), -- Frostwolf west Tower - Horde Control
(@CGUID+299, 15, 0), -- Firstaid Station - Alliance Defender Quest 0
(@CGUID+300, 15, 0), -- Firstaid Station - Alliance Defender Quest 0
(@CGUID+301, 15, 0), -- Firstaid Station - Alliance Defender Quest 0
(@CGUID+302, 15, 0), -- Firstaid Station - Alliance Defender Quest 0
(@CGUID+756, 15, 1), -- Firstaid Station - Alliance Defender Quest 1
(@CGUID+757, 15, 1), -- Firstaid Station - Alliance Defender Quest 1
(@CGUID+758, 15, 1), -- Firstaid Station - Alliance Defender Quest 1
(@CGUID+759, 15, 1), -- Firstaid Station - Alliance Defender Quest 1
(@CGUID+816, 15, 2), -- Firstaid Station - Alliance Defender Quest 2
(@CGUID+817, 15, 2), -- Firstaid Station - Alliance Defender Quest 2
(@CGUID+818, 15, 2), -- Firstaid Station - Alliance Defender Quest 2
(@CGUID+819, 15, 2), -- Firstaid Station - Alliance Defender Quest 2
(@CGUID+1038, 15, 3), -- Firstaid Station - Alliance Defender Quest 3
(@CGUID+1039, 15, 3), -- Firstaid Station - Alliance Defender Quest 3
(@CGUID+1040, 15, 3), -- Firstaid Station - Alliance Defender Quest 3
(@CGUID+1041, 15, 3), -- Firstaid Station - Alliance Defender Quest 3
(@CGUID+355, 15, 4), -- Firstaid Station - Horde Defender Quest 0
(@CGUID+356, 15, 4), -- Firstaid Station - Horde Defender Quest 0
(@CGUID+357, 15, 4), -- Firstaid Station - Horde Defender Quest 0
(@CGUID+358, 15, 4), -- Firstaid Station - Horde Defender Quest 0
(@CGUID+784, 15, 5), -- Firstaid Station - Horde Defender Quest 1
(@CGUID+785, 15, 5), -- Firstaid Station - Horde Defender Quest 1
(@CGUID+786, 15, 5), -- Firstaid Station - Horde Defender Quest 1
(@CGUID+787, 15, 5), -- Firstaid Station - Horde Defender Quest 1
(@CGUID+844, 15, 6), -- Firstaid Station - Horde Defender Quest 2
(@CGUID+845, 15, 6), -- Firstaid Station - Horde Defender Quest 2
(@CGUID+846, 15, 6), -- Firstaid Station - Horde Defender Quest 2
(@CGUID+847, 15, 6), -- Firstaid Station - Horde Defender Quest 2
(@CGUID+1008, 15, 7), -- Firstaid Station - Horde Defender Quest 3
(@CGUID+1009, 15, 7), -- Firstaid Station - Horde Defender Quest 3
(@CGUID+1010, 15, 7), -- Firstaid Station - Horde Defender Quest 3
(@CGUID+1011, 15, 7), -- Firstaid Station - Horde Defender Quest 3
(@CGUID+303, 16, 0), -- Stormpike Grave - Alliance Defender Quest 0
(@CGUID+304, 16, 0), -- Stormpike Grave - Alliance Defender Quest 0
(@CGUID+305, 16, 0), -- Stormpike Grave - Alliance Defender Quest 0
(@CGUID+306, 16, 0), -- Stormpike Grave - Alliance Defender Quest 0
(@CGUID+760, 16, 1), -- Stormpike Grave - Alliance Defender Quest 1
(@CGUID+761, 16, 1), -- Stormpike Grave - Alliance Defender Quest 1
(@CGUID+762, 16, 1), -- Stormpike Grave - Alliance Defender Quest 1
(@CGUID+763, 16, 1), -- Stormpike Grave - Alliance Defender Quest 1
(@CGUID+820, 16, 2), -- Stormpike Grave - Alliance Defender Quest 2
(@CGUID+821, 16, 2), -- Stormpike Grave - Alliance Defender Quest 2
(@CGUID+822, 16, 2), -- Stormpike Grave - Alliance Defender Quest 2
(@CGUID+823, 16, 2), -- Stormpike Grave - Alliance Defender Quest 2
(@CGUID+1042, 16, 3), -- Stormpike Grave - Alliance Defender Quest 3
(@CGUID+1043, 16, 3), -- Stormpike Grave - Alliance Defender Quest 3
(@CGUID+1044, 16, 3), -- Stormpike Grave - Alliance Defender Quest 3
(@CGUID+1045, 16, 3), -- Stormpike Grave - Alliance Defender Quest 3
(@CGUID+359, 16, 4), -- Stormpike Grave - Horde Defender Quest 0
(@CGUID+360, 16, 4), -- Stormpike Grave - Horde Defender Quest 0
(@CGUID+361, 16, 4), -- Stormpike Grave - Horde Defender Quest 0
(@CGUID+362, 16, 4), -- Stormpike Grave - Horde Defender Quest 0
(@CGUID+788, 16, 5), -- Stormpike Grave - Horde Defender Quest 1
(@CGUID+789, 16, 5), -- Stormpike Grave - Horde Defender Quest 1
(@CGUID+790, 16, 5), -- Stormpike Grave - Horde Defender Quest 1
(@CGUID+791, 16, 5), -- Stormpike Grave - Horde Defender Quest 1
(@CGUID+848, 16, 6), -- Stormpike Grave - Horde Defender Quest 2
(@CGUID+849, 16, 6), -- Stormpike Grave - Horde Defender Quest 2
(@CGUID+850, 16, 6), -- Stormpike Grave - Horde Defender Quest 2
(@CGUID+851, 16, 6), -- Stormpike Grave - Horde Defender Quest 2
(@CGUID+1012, 16, 7), -- Stormpike Grave - Horde Defender Quest 3
(@CGUID+1013, 16, 7), -- Stormpike Grave - Horde Defender Quest 3
(@CGUID+1014, 16, 7), -- Stormpike Grave - Horde Defender Quest 3
(@CGUID+1015, 16, 7), -- Stormpike Grave - Horde Defender Quest 3
(@CGUID+307, 17, 0), -- Stoneheart Grave - Alliance Defender Quest 0
(@CGUID+308, 17, 0), -- Stoneheart Grave - Alliance Defender Quest 0
(@CGUID+309, 17, 0), -- Stoneheart Grave - Alliance Defender Quest 0
(@CGUID+310, 17, 0), -- Stoneheart Grave - Alliance Defender Quest 0
(@CGUID+764, 17, 1), -- Stoneheart Grave - Alliance Defender Quest 1
(@CGUID+765, 17, 1), -- Stoneheart Grave - Alliance Defender Quest 1
(@CGUID+766, 17, 1), -- Stoneheart Grave - Alliance Defender Quest 1
(@CGUID+767, 17, 1), -- Stoneheart Grave - Alliance Defender Quest 1
(@CGUID+824, 17, 2), -- Stoneheart Grave - Alliance Defender Quest 2
(@CGUID+825, 17, 2), -- Stoneheart Grave - Alliance Defender Quest 2
(@CGUID+826, 17, 2), -- Stoneheart Grave - Alliance Defender Quest 2
(@CGUID+827, 17, 2), -- Stoneheart Grave - Alliance Defender Quest 2
(@CGUID+1046, 17, 3), -- Stoneheart Grave - Alliance Defender Quest 3
(@CGUID+1047, 17, 3), -- Stoneheart Grave - Alliance Defender Quest 3
(@CGUID+1048, 17, 3), -- Stoneheart Grave - Alliance Defender Quest 3
(@CGUID+1049, 17, 3), -- Stoneheart Grave - Alliance Defender Quest 3
(@CGUID+363, 17, 4), -- Stoneheart Grave - Horde Defender Quest 0
(@CGUID+364, 17, 4), -- Stoneheart Grave - Horde Defender Quest 0
(@CGUID+365, 17, 4), -- Stoneheart Grave - Horde Defender Quest 0
(@CGUID+366, 17, 4), -- Stoneheart Grave - Horde Defender Quest 0
(@CGUID+792, 17, 5), -- Stoneheart Grave - Horde Defender Quest 1
(@CGUID+793, 17, 5), -- Stoneheart Grave - Horde Defender Quest 1
(@CGUID+794, 17, 5), -- Stoneheart Grave - Horde Defender Quest 1
(@CGUID+795, 17, 5), -- Stoneheart Grave - Horde Defender Quest 1
(@CGUID+852, 17, 6), -- Stoneheart Grave - Horde Defender Quest 2
(@CGUID+853, 17, 6), -- Stoneheart Grave - Horde Defender Quest 2
(@CGUID+854, 17, 6), -- Stoneheart Grave - Horde Defender Quest 2
(@CGUID+855, 17, 6), -- Stoneheart Grave - Horde Defender Quest 2
(@CGUID+1016, 17, 7), -- Stoneheart Grave - Horde Defender Quest 3
(@CGUID+1017, 17, 7), -- Stoneheart Grave - Horde Defender Quest 3
(@CGUID+1018, 17, 7), -- Stoneheart Grave - Horde Defender Quest 3
(@CGUID+1019, 17, 7), -- Stoneheart Grave - Horde Defender Quest 3
(@CGUID+311, 18, 0), -- Snowfall Grave - Alliance Defender Quest 0
(@CGUID+312, 18, 0), -- Snowfall Grave - Alliance Defender Quest 0
(@CGUID+313, 18, 0), -- Snowfall Grave - Alliance Defender Quest 0
(@CGUID+314, 18, 0), -- Snowfall Grave - Alliance Defender Quest 0
(@CGUID+768, 18, 1), -- Snowfall Grave - Alliance Defender Quest 1
(@CGUID+769, 18, 1), -- Snowfall Grave - Alliance Defender Quest 1
(@CGUID+770, 18, 1), -- Snowfall Grave - Alliance Defender Quest 1
(@CGUID+771, 18, 1), -- Snowfall Grave - Alliance Defender Quest 1
(@CGUID+828, 18, 2), -- Snowfall Grave - Alliance Defender Quest 2
(@CGUID+829, 18, 2), -- Snowfall Grave - Alliance Defender Quest 2
(@CGUID+830, 18, 2), -- Snowfall Grave - Alliance Defender Quest 2
(@CGUID+831, 18, 2), -- Snowfall Grave - Alliance Defender Quest 2
(@CGUID+1050, 18, 3), -- Snowfall Grave - Alliance Defender Quest 3
(@CGUID+1051, 18, 3), -- Snowfall Grave - Alliance Defender Quest 3
(@CGUID+1052, 18, 3), -- Snowfall Grave - Alliance Defender Quest 3
(@CGUID+1053, 18, 3), -- Snowfall Grave - Alliance Defender Quest 3
(@CGUID+367, 18, 4), -- Snowfall Grave - Horde Defender Quest 0
(@CGUID+368, 18, 4), -- Snowfall Grave - Horde Defender Quest 0
(@CGUID+369, 18, 4), -- Snowfall Grave - Horde Defender Quest 0
(@CGUID+370, 18, 4), -- Snowfall Grave - Horde Defender Quest 0
(@CGUID+796, 18, 5), -- Snowfall Grave - Horde Defender Quest 1
(@CGUID+797, 18, 5), -- Snowfall Grave - Horde Defender Quest 1
(@CGUID+798, 18, 5), -- Snowfall Grave - Horde Defender Quest 1
(@CGUID+799, 18, 5), -- Snowfall Grave - Horde Defender Quest 1
(@CGUID+856, 18, 6), -- Snowfall Grave - Horde Defender Quest 2
(@CGUID+857, 18, 6), -- Snowfall Grave - Horde Defender Quest 2
(@CGUID+858, 18, 6), -- Snowfall Grave - Horde Defender Quest 2
(@CGUID+859, 18, 6), -- Snowfall Grave - Horde Defender Quest 2
(@CGUID+1020, 18, 7), -- Snowfall Grave - Horde Defender Quest 3
(@CGUID+1021, 18, 7), -- Snowfall Grave - Horde Defender Quest 3
(@CGUID+1022, 18, 7), -- Snowfall Grave - Horde Defender Quest 3
(@CGUID+1023, 18, 7), -- Snowfall Grave - Horde Defender Quest 3
(@CGUID+315, 19, 0), -- Iceblood Grave - Alliance Defender Quest 0
(@CGUID+316, 19, 0), -- Iceblood Grave - Alliance Defender Quest 0
(@CGUID+317, 19, 0), -- Iceblood Grave - Alliance Defender Quest 0
(@CGUID+318, 19, 0), -- Iceblood Grave - Alliance Defender Quest 0
(@CGUID+772, 19, 1), -- Iceblood Grave - Alliance Defender Quest 1
(@CGUID+773, 19, 1), -- Iceblood Grave - Alliance Defender Quest 1
(@CGUID+774, 19, 1), -- Iceblood Grave - Alliance Defender Quest 1
(@CGUID+775, 19, 1), -- Iceblood Grave - Alliance Defender Quest 1
(@CGUID+832, 19, 2), -- Iceblood Grave - Alliance Defender Quest 2
(@CGUID+833, 19, 2), -- Iceblood Grave - Alliance Defender Quest 2
(@CGUID+834, 19, 2), -- Iceblood Grave - Alliance Defender Quest 2
(@CGUID+835, 19, 2), -- Iceblood Grave - Alliance Defender Quest 2
(@CGUID+1054, 19, 3), -- Iceblood Grave - Alliance Defender Quest 3
(@CGUID+1055, 19, 3), -- Iceblood Grave - Alliance Defender Quest 3
(@CGUID+1056, 19, 3), -- Iceblood Grave - Alliance Defender Quest 3
(@CGUID+1057, 19, 3), -- Iceblood Grave - Alliance Defender Quest 3
(@CGUID+371, 19, 4), -- Iceblood Grave - Horde Defender Quest 0
(@CGUID+372, 19, 4), -- Iceblood Grave - Horde Defender Quest 0
(@CGUID+373, 19, 4), -- Iceblood Grave - Horde Defender Quest 0
(@CGUID+374, 19, 4), -- Iceblood Grave - Horde Defender Quest 0
(@CGUID+800, 19, 5), -- Iceblood Grave - Horde Defender Quest 1
(@CGUID+801, 19, 5), -- Iceblood Grave - Horde Defender Quest 1
(@CGUID+802, 19, 5), -- Iceblood Grave - Horde Defender Quest 1
(@CGUID+803, 19, 5), -- Iceblood Grave - Horde Defender Quest 1
(@CGUID+860, 19, 6), -- Iceblood Grave - Horde Defender Quest 2
(@CGUID+861, 19, 6), -- Iceblood Grave - Horde Defender Quest 2
(@CGUID+862, 19, 6), -- Iceblood Grave - Horde Defender Quest 2
(@CGUID+863, 19, 6), -- Iceblood Grave - Horde Defender Quest 2
(@CGUID+1024, 19, 7), -- Iceblood Grave - Horde Defender Quest 3
(@CGUID+1025, 19, 7), -- Iceblood Grave - Horde Defender Quest 3
(@CGUID+1026, 19, 7), -- Iceblood Grave - Horde Defender Quest 3
(@CGUID+1027, 19, 7), -- Iceblood Grave - Horde Defender Quest 3
(@CGUID+319, 20, 0), -- Frostwolf Grave - Alliance Defender Quest 0
(@CGUID+320, 20, 0), -- Frostwolf Grave - Alliance Defender Quest 0
(@CGUID+321, 20, 0), -- Frostwolf Grave - Alliance Defender Quest 0
(@CGUID+322, 20, 0), -- Frostwolf Grave - Alliance Defender Quest 0
(@CGUID+776, 20, 1), -- Frostwolf Grave - Alliance Defender Quest 1
(@CGUID+777, 20, 1), -- Frostwolf Grave - Alliance Defender Quest 1
(@CGUID+778, 20, 1), -- Frostwolf Grave - Alliance Defender Quest 1
(@CGUID+779, 20, 1), -- Frostwolf Grave - Alliance Defender Quest 1
(@CGUID+836, 20, 2), -- Frostwolf Grave - Alliance Defender Quest 2
(@CGUID+837, 20, 2), -- Frostwolf Grave - Alliance Defender Quest 2
(@CGUID+838, 20, 2), -- Frostwolf Grave - Alliance Defender Quest 2
(@CGUID+839, 20, 2), -- Frostwolf Grave - Alliance Defender Quest 2
(@CGUID+1058, 20, 3), -- Frostwolf Grave - Alliance Defender Quest 3
(@CGUID+1059, 20, 3), -- Frostwolf Grave - Alliance Defender Quest 3
(@CGUID+1060, 20, 3), -- Frostwolf Grave - Alliance Defender Quest 3
(@CGUID+1061, 20, 3), -- Frostwolf Grave - Alliance Defender Quest 3
(@CGUID+375, 20, 4), -- Frostwolf Grave - Horde Defender Quest 0
(@CGUID+376, 20, 4), -- Frostwolf Grave - Horde Defender Quest 0
(@CGUID+377, 20, 4), -- Frostwolf Grave - Horde Defender Quest 0
(@CGUID+378, 20, 4), -- Frostwolf Grave - Horde Defender Quest 0
(@CGUID+804, 20, 5), -- Frostwolf Grave - Horde Defender Quest 1
(@CGUID+805, 20, 5), -- Frostwolf Grave - Horde Defender Quest 1
(@CGUID+806, 20, 5), -- Frostwolf Grave - Horde Defender Quest 1
(@CGUID+807, 20, 5), -- Frostwolf Grave - Horde Defender Quest 1
(@CGUID+864, 20, 6), -- Frostwolf Grave - Horde Defender Quest 2
(@CGUID+865, 20, 6), -- Frostwolf Grave - Horde Defender Quest 2
(@CGUID+866, 20, 6), -- Frostwolf Grave - Horde Defender Quest 2
(@CGUID+867, 20, 6), -- Frostwolf Grave - Horde Defender Quest 2
(@CGUID+1028, 20, 7), -- Frostwolf Grave - Horde Defender Quest 3
(@CGUID+1029, 20, 7), -- Frostwolf Grave - Horde Defender Quest 3
(@CGUID+1030, 20, 7), -- Frostwolf Grave - Horde Defender Quest 3
(@CGUID+1031, 20, 7), -- Frostwolf Grave - Horde Defender Quest 3
(@CGUID+323, 21, 0), -- Frostwolf Hut - Alliance Defender Quest 0
(@CGUID+324, 21, 0), -- Frostwolf Hut - Alliance Defender Quest 0
(@CGUID+325, 21, 0), -- Frostwolf Hut - Alliance Defender Quest 0
(@CGUID+326, 21, 0), -- Frostwolf Hut - Alliance Defender Quest 0
(@CGUID+780, 21, 1), -- Frostwolf Hut - Alliance Defender Quest 1
(@CGUID+781, 21, 1), -- Frostwolf Hut - Alliance Defender Quest 1
(@CGUID+782, 21, 1), -- Frostwolf Hut - Alliance Defender Quest 1
(@CGUID+783, 21, 1), -- Frostwolf Hut - Alliance Defender Quest 1
(@CGUID+840, 21, 2), -- Frostwolf Hut - Alliance Defender Quest 2
(@CGUID+841, 21, 2), -- Frostwolf Hut - Alliance Defender Quest 2
(@CGUID+842, 21, 2), -- Frostwolf Hut - Alliance Defender Quest 2
(@CGUID+843, 21, 2), -- Frostwolf Hut - Alliance Defender Quest 2
(@CGUID+1062, 21, 3), -- Frostwolf Hut - Alliance Defender Quest 3
(@CGUID+1063, 21, 3), -- Frostwolf Hut - Alliance Defender Quest 3
(@CGUID+1064, 21, 3), -- Frostwolf Hut - Alliance Defender Quest 3
(@CGUID+1065, 21, 3), -- Frostwolf Hut - Alliance Defender Quest 3
(@CGUID+379, 21, 4), -- Frostwolf Hut - Horde Defender Quest 0
(@CGUID+380, 21, 4), -- Frostwolf Hut - Horde Defender Quest 0
(@CGUID+381, 21, 4), -- Frostwolf Hut - Horde Defender Quest 0
(@CGUID+382, 21, 4), -- Frostwolf Hut - Horde Defender Quest 0
(@CGUID+808, 21, 5), -- Frostwolf Hut - Horde Defender Quest 1
(@CGUID+809, 21, 5), -- Frostwolf Hut - Horde Defender Quest 1
(@CGUID+810, 21, 5), -- Frostwolf Hut - Horde Defender Quest 1
(@CGUID+811, 21, 5), -- Frostwolf Hut - Horde Defender Quest 1
(@CGUID+868, 21, 6), -- Frostwolf Hut - Horde Defender Quest 2
(@CGUID+869, 21, 6), -- Frostwolf Hut - Horde Defender Quest 2
(@CGUID+870, 21, 6), -- Frostwolf Hut - Horde Defender Quest 2
(@CGUID+871, 21, 6), -- Frostwolf Hut - Horde Defender Quest 2
(@CGUID+1032, 21, 7), -- Frostwolf Hut - Horde Defender Quest 3
(@CGUID+1033, 21, 7), -- Frostwolf Hut - Horde Defender Quest 3
(@CGUID+1034, 21, 7), -- Frostwolf Hut - Horde Defender Quest 3
(@CGUID+1035, 21, 7), -- Frostwolf Hut - Horde Defender Quest 3
(@CGUID+264, 46, 5), -- North Mine - Neutral Boss
(@CGUID+400, 46, 1), -- North Mine - Alliance Boss
(@CGUID+401, 46, 3), -- North Mine - Horde Boss
(@CGUID+268, 47, 5), -- South Mine - Neutral Boss
(@CGUID+462, 47, 3), -- South Mine - Horde Boss
(@CGUID+460, 47, 1), -- South Mine - Alliance Boss
(@CGUID+286, 48, 0), -- Alliance Captain
(@CGUID+282, 49, 0), -- Horde Captain
(@CGUID+42, 50, 5), -- North Mine - Neutral Control
(@CGUID+43, 50, 5), -- North Mine - Neutral Control
(@CGUID+44, 50, 5), -- North Mine - Neutral Control
(@CGUID+45, 50, 5), -- North Mine - Neutral Control
(@CGUID+46, 50, 5), -- North Mine - Neutral Control
(@CGUID+47, 50, 5), -- North Mine - Neutral Control
(@CGUID+48, 50, 5), -- North Mine - Neutral Control
(@CGUID+49, 50, 5), -- North Mine - Neutral Control
(@CGUID+50, 50, 5), -- North Mine - Neutral Control
(@CGUID+51, 50, 5), -- North Mine - Neutral Control
(@CGUID+52, 50, 5), -- North Mine - Neutral Control
(@CGUID+53, 50, 5), -- North Mine - Neutral Control
(@CGUID+54, 50, 5), -- North Mine - Neutral Control
(@CGUID+55, 50, 5), -- North Mine - Neutral Control
(@CGUID+56, 50, 5), -- North Mine - Neutral Control
(@CGUID+57, 50, 5), -- North Mine - Neutral Control
(@CGUID+58, 50, 5), -- North Mine - Neutral Control
(@CGUID+59, 50, 5), -- North Mine - Neutral Control
(@CGUID+60, 50, 5), -- North Mine - Neutral Control
(@CGUID+61, 50, 5), -- North Mine - Neutral Control
(@CGUID+62, 50, 5), -- North Mine - Neutral Control
(@CGUID+63, 50, 5), -- North Mine - Neutral Control
(@CGUID+64, 50, 5), -- North Mine - Neutral Control
(@CGUID+65, 50, 5), -- North Mine - Neutral Control
(@CGUID+66, 50, 5), -- North Mine - Neutral Control
(@CGUID+67, 50, 5), -- North Mine - Neutral Control
(@CGUID+68, 50, 5), -- North Mine - Neutral Control
(@CGUID+69, 50, 5), -- North Mine - Neutral Control
(@CGUID+70, 50, 5), -- North Mine - Neutral Control
(@CGUID+71, 50, 5), -- North Mine - Neutral Control
(@CGUID+72, 50, 5), -- North Mine - Neutral Control
(@CGUID+73, 50, 5), -- North Mine - Neutral Control
(@CGUID+74, 50, 5), -- North Mine - Neutral Control
(@CGUID+75, 50, 5), -- North Mine - Neutral Control
(@CGUID+76, 50, 5), -- North Mine - Neutral Control
(@CGUID+77, 50, 5), -- North Mine - Neutral Control
(@CGUID+78, 50, 5), -- North Mine - Neutral Control
(@CGUID+79, 50, 5), -- North Mine - Neutral Control
(@CGUID+80, 50, 5), -- North Mine - Neutral Control
(@CGUID+81, 50, 5), -- North Mine - Neutral Control
(@CGUID+82, 50, 5), -- North Mine - Neutral Control
(@CGUID+83, 50, 5), -- North Mine - Neutral Control
(@CGUID+84, 50, 5), -- North Mine - Neutral Control
(@CGUID+85, 50, 5), -- North Mine - Neutral Control
(@CGUID+86, 50, 5), -- North Mine - Neutral Control
(@CGUID+87, 50, 5), -- North Mine - Neutral Control
(@CGUID+88, 50, 5), -- North Mine - Neutral Control
(@CGUID+89, 50, 5), -- North Mine - Neutral Control
(@CGUID+90, 50, 5), -- North Mine - Neutral Control
(@CGUID+91, 50, 5), -- North Mine - Neutral Control
(@CGUID+104, 50, 5), -- North Mine - Neutral Control
(@CGUID+105, 50, 5), -- North Mine - Neutral Control
(@CGUID+106, 50, 5), -- North Mine - Neutral Control
(@CGUID+107, 50, 5), -- North Mine - Neutral Control
(@CGUID+108, 50, 5), -- North Mine - Neutral Control
(@CGUID+109, 50, 5), -- North Mine - Neutral Control
(@CGUID+110, 50, 5), -- North Mine - Neutral Control
(@CGUID+111, 50, 5), -- North Mine - Neutral Control
(@CGUID+112, 50, 5), -- North Mine - Neutral Control
(@CGUID+113, 50, 5), -- North Mine - Neutral Control
(@CGUID+114, 50, 5), -- North Mine - Neutral Control
(@CGUID+115, 50, 5), -- North Mine - Neutral Control
(@CGUID+116, 50, 5), -- North Mine - Neutral Control
(@CGUID+117, 50, 5), -- North Mine - Neutral Control
(@CGUID+118, 50, 5), -- North Mine - Neutral Control
(@CGUID+119, 50, 5), -- North Mine - Neutral Control
(@CGUID+120, 50, 5), -- North Mine - Neutral Control
(@CGUID+121, 50, 5), -- North Mine - Neutral Control
(@CGUID+122, 50, 5), -- North Mine - Neutral Control
(@CGUID+123, 50, 5), -- North Mine - Neutral Control
(@CGUID+124, 50, 5), -- North Mine - Neutral Control
(@CGUID+125, 50, 5), -- North Mine - Neutral Control
(@CGUID+126, 50, 5), -- North Mine - Neutral Control
(@CGUID+127, 50, 5), -- North Mine - Neutral Control
(@CGUID+128, 50, 5), -- North Mine - Neutral Control
(@CGUID+129, 50, 5), -- North Mine - Neutral Control
(@CGUID+130, 50, 5), -- North Mine - Neutral Control
(@CGUID+131, 50, 5), -- North Mine - Neutral Control
(@CGUID+132, 50, 5), -- North Mine - Neutral Control
(@CGUID+133, 50, 5), -- North Mine - Neutral Control
(@CGUID+134, 50, 5), -- North Mine - Neutral Control
(@CGUID+135, 50, 5), -- North Mine - Neutral Control
(@CGUID+136, 50, 5), -- North Mine - Neutral Control
(@CGUID+137, 50, 5), -- North Mine - Neutral Control
(@CGUID+138, 50, 5), -- North Mine - Neutral Control
(@CGUID+139, 50, 5), -- North Mine - Neutral Control
(@CGUID+140, 50, 5), -- North Mine - Neutral Control
(@CGUID+141, 50, 5), -- North Mine - Neutral Control
(@CGUID+142, 50, 5), -- North Mine - Neutral Control
(@CGUID+143, 50, 5), -- North Mine - Neutral Control
(@CGUID+144, 50, 5), -- North Mine - Neutral Control
(@CGUID+145, 50, 5), -- North Mine - Neutral Control
(@CGUID+146, 50, 5), -- North Mine - Neutral Control
(@CGUID+147, 50, 5), -- North Mine - Neutral Control
(@CGUID+148, 50, 5), -- North Mine - Neutral Control
(@CGUID+149, 50, 5), -- North Mine - Neutral Control
(@CGUID+150, 50, 5), -- North Mine - Neutral Control
(@CGUID+151, 50, 5), -- North Mine - Neutral Control
(@CGUID+152, 50, 5), -- North Mine - Neutral Control
(@CGUID+153, 50, 5), -- North Mine - Neutral Control
(@CGUID+154, 50, 5), -- North Mine - Neutral Control
(@CGUID+155, 50, 5), -- North Mine - Neutral Control
(@CGUID+156, 50, 5), -- North Mine - Neutral Control
(@CGUID+157, 50, 5), -- North Mine - Neutral Control
(@CGUID+158, 50, 5), -- North Mine - Neutral Control
(@CGUID+159, 50, 5), -- North Mine - Neutral Control
(@CGUID+160, 50, 5), -- North Mine - Neutral Control
(@CGUID+402, 50, 1), -- North Mine - Alliance Control
(@CGUID+403, 50, 1), -- North Mine - Alliance Control
(@CGUID+404, 50, 1), -- North Mine - Alliance Control
(@CGUID+405, 50, 1), -- North Mine - Alliance Control
(@CGUID+406, 50, 1), -- North Mine - Alliance Control
(@CGUID+407, 50, 1), -- North Mine - Alliance Control
(@CGUID+408, 50, 1), -- North Mine - Alliance Control
(@CGUID+409, 50, 1), -- North Mine - Alliance Control
(@CGUID+410, 50, 1), -- North Mine - Alliance Control
(@CGUID+411, 50, 1), -- North Mine - Alliance Control
(@CGUID+412, 50, 1), -- North Mine - Alliance Control
(@CGUID+413, 50, 1), -- North Mine - Alliance Control
(@CGUID+414, 50, 1), -- North Mine - Alliance Control
(@CGUID+415, 50, 1), -- North Mine - Alliance Control
(@CGUID+416, 50, 1), -- North Mine - Alliance Control
(@CGUID+417, 50, 1), -- North Mine - Alliance Control
(@CGUID+418, 50, 1), -- North Mine - Alliance Control
(@CGUID+419, 50, 1), -- North Mine - Alliance Control
(@CGUID+420, 50, 1), -- North Mine - Alliance Control
(@CGUID+421, 50, 1), -- North Mine - Alliance Control
(@CGUID+422, 50, 1), -- North Mine - Alliance Control
(@CGUID+423, 50, 1), -- North Mine - Alliance Control
(@CGUID+424, 50, 1), -- North Mine - Alliance Control
(@CGUID+425, 50, 1), -- North Mine - Alliance Control
(@CGUID+426, 50, 1), -- North Mine - Alliance Control
(@CGUID+427, 50, 1), -- North Mine - Alliance Control
(@CGUID+428, 50, 1), -- North Mine - Alliance Control
(@CGUID+429, 50, 1), -- North Mine - Alliance Control
(@CGUID+430, 50, 1), -- North Mine - Alliance Control
(@CGUID+431, 50, 1), -- North Mine - Alliance Control
(@CGUID+432, 50, 1), -- North Mine - Alliance Control
(@CGUID+433, 50, 1), -- North Mine - Alliance Control
(@CGUID+434, 50, 1), -- North Mine - Alliance Control
(@CGUID+435, 50, 1), -- North Mine - Alliance Control
(@CGUID+436, 50, 1), -- North Mine - Alliance Control
(@CGUID+437, 50, 1), -- North Mine - Alliance Control
(@CGUID+438, 50, 1), -- North Mine - Alliance Control
(@CGUID+439, 50, 1), -- North Mine - Alliance Control
(@CGUID+440, 50, 1), -- North Mine - Alliance Control
(@CGUID+441, 50, 1), -- North Mine - Alliance Control
(@CGUID+442, 50, 1), -- North Mine - Alliance Control
(@CGUID+443, 50, 1), -- North Mine - Alliance Control
(@CGUID+444, 50, 1), -- North Mine - Alliance Control
(@CGUID+445, 50, 1), -- North Mine - Alliance Control
(@CGUID+446, 50, 1), -- North Mine - Alliance Control
(@CGUID+447, 50, 1), -- North Mine - Alliance Control
(@CGUID+448, 50, 1), -- North Mine - Alliance Control
(@CGUID+449, 50, 1), -- North Mine - Alliance Control
(@CGUID+450, 50, 1), -- North Mine - Alliance Control
(@CGUID+451, 50, 1), -- North Mine - Alliance Control
(@CGUID+452, 50, 1), -- North Mine - Alliance Control
(@CGUID+453, 50, 1), -- North Mine - Alliance Control
(@CGUID+454, 50, 1), -- North Mine - Alliance Control
(@CGUID+455, 50, 1), -- North Mine - Alliance Control
(@CGUID+456, 50, 1), -- North Mine - Alliance Control
(@CGUID+457, 50, 1), -- North Mine - Alliance Control
(@CGUID+458, 50, 1), -- North Mine - Alliance Control
(@CGUID+905, 50, 1), -- North Mine - Alliance Control
(@CGUID+906, 50, 1), -- North Mine - Alliance Control
(@CGUID+907, 50, 1), -- North Mine - Alliance Control
(@CGUID+908, 50, 1), -- North Mine - Alliance Control
(@CGUID+909, 50, 1), -- North Mine - Alliance Control
(@CGUID+910, 50, 1), -- North Mine - Alliance Control
(@CGUID+911, 50, 1), -- North Mine - Alliance Control
(@CGUID+912, 50, 1), -- North Mine - Alliance Control
(@CGUID+913, 50, 1), -- North Mine - Alliance Control
(@CGUID+914, 50, 1), -- North Mine - Alliance Control
(@CGUID+915, 50, 1), -- North Mine - Alliance Control
(@CGUID+916, 50, 1), -- North Mine - Alliance Control
(@CGUID+917, 50, 1), -- North Mine - Alliance Control
(@CGUID+918, 50, 1), -- North Mine - Alliance Control
(@CGUID+919, 50, 1), -- North Mine - Alliance Control
(@CGUID+920, 50, 1), -- North Mine - Alliance Control
(@CGUID+921, 50, 1), -- North Mine - Alliance Control
(@CGUID+922, 50, 1), -- North Mine - Alliance Control
(@CGUID+923, 50, 1), -- North Mine - Alliance Control
(@CGUID+924, 50, 1), -- North Mine - Alliance Control
(@CGUID+925, 50, 1), -- North Mine - Alliance Control
(@CGUID+926, 50, 1), -- North Mine - Alliance Control
(@CGUID+927, 50, 1), -- North Mine - Alliance Control
(@CGUID+928, 50, 1), -- North Mine - Alliance Control
(@CGUID+929, 50, 1), -- North Mine - Alliance Control
(@CGUID+930, 50, 1), -- North Mine - Alliance Control
(@CGUID+931, 50, 1), -- North Mine - Alliance Control
(@CGUID+932, 50, 1), -- North Mine - Alliance Control
(@CGUID+933, 50, 1), -- North Mine - Alliance Control
(@CGUID+934, 50, 1), -- North Mine - Alliance Control
(@CGUID+935, 50, 1), -- North Mine - Alliance Control
(@CGUID+936, 50, 1), -- North Mine - Alliance Control
(@CGUID+937, 50, 1), -- North Mine - Alliance Control
(@CGUID+938, 50, 1), -- North Mine - Alliance Control
(@CGUID+939, 50, 1), -- North Mine - Alliance Control
(@CGUID+940, 50, 1), -- North Mine - Alliance Control
(@CGUID+941, 50, 1), -- North Mine - Alliance Control
(@CGUID+942, 50, 1), -- North Mine - Alliance Control
(@CGUID+943, 50, 1), -- North Mine - Alliance Control
(@CGUID+944, 50, 1), -- North Mine - Alliance Control
(@CGUID+945, 50, 1), -- North Mine - Alliance Control
(@CGUID+946, 50, 1), -- North Mine - Alliance Control
(@CGUID+947, 50, 1), -- North Mine - Alliance Control
(@CGUID+948, 50, 1), -- North Mine - Alliance Control
(@CGUID+949, 50, 1), -- North Mine - Alliance Control
(@CGUID+950, 50, 1), -- North Mine - Alliance Control
(@CGUID+951, 50, 1), -- North Mine - Alliance Control
(@CGUID+952, 50, 1), -- North Mine - Alliance Control
(@CGUID+953, 50, 1), -- North Mine - Alliance Control
(@CGUID+954, 50, 1), -- North Mine - Alliance Control
(@CGUID+545, 50, 3), -- North Mine - Horde Control
(@CGUID+546, 50, 3), -- North Mine - Horde Control
(@CGUID+547, 50, 3), -- North Mine - Horde Control
(@CGUID+548, 50, 3), -- North Mine - Horde Control
(@CGUID+549, 50, 3), -- North Mine - Horde Control
(@CGUID+550, 50, 3), -- North Mine - Horde Control
(@CGUID+551, 50, 3), -- North Mine - Horde Control
(@CGUID+552, 50, 3), -- North Mine - Horde Control
(@CGUID+553, 50, 3), -- North Mine - Horde Control
(@CGUID+554, 50, 3), -- North Mine - Horde Control
(@CGUID+555, 50, 3), -- North Mine - Horde Control
(@CGUID+556, 50, 3), -- North Mine - Horde Control
(@CGUID+557, 50, 3), -- North Mine - Horde Control
(@CGUID+558, 50, 3), -- North Mine - Horde Control
(@CGUID+559, 50, 3), -- North Mine - Horde Control
(@CGUID+560, 50, 3), -- North Mine - Horde Control
(@CGUID+561, 50, 3), -- North Mine - Horde Control
(@CGUID+562, 50, 3), -- North Mine - Horde Control
(@CGUID+563, 50, 3), -- North Mine - Horde Control
(@CGUID+564, 50, 3), -- North Mine - Horde Control
(@CGUID+565, 50, 3), -- North Mine - Horde Control
(@CGUID+566, 50, 3), -- North Mine - Horde Control
(@CGUID+567, 50, 3), -- North Mine - Horde Control
(@CGUID+568, 50, 3), -- North Mine - Horde Control
(@CGUID+569, 50, 3), -- North Mine - Horde Control
(@CGUID+570, 50, 3), -- North Mine - Horde Control
(@CGUID+571, 50, 3), -- North Mine - Horde Control
(@CGUID+572, 50, 3), -- North Mine - Horde Control
(@CGUID+573, 50, 3), -- North Mine - Horde Control
(@CGUID+574, 50, 3), -- North Mine - Horde Control
(@CGUID+575, 50, 3), -- North Mine - Horde Control
(@CGUID+576, 50, 3), -- North Mine - Horde Control
(@CGUID+577, 50, 3), -- North Mine - Horde Control
(@CGUID+578, 50, 3), -- North Mine - Horde Control
(@CGUID+579, 50, 3), -- North Mine - Horde Control
(@CGUID+580, 50, 3), -- North Mine - Horde Control
(@CGUID+581, 50, 3), -- North Mine - Horde Control
(@CGUID+582, 50, 3), -- North Mine - Horde Control
(@CGUID+583, 50, 3), -- North Mine - Horde Control
(@CGUID+584, 50, 3), -- North Mine - Horde Control
(@CGUID+585, 50, 3), -- North Mine - Horde Control
(@CGUID+586, 50, 3), -- North Mine - Horde Control
(@CGUID+587, 50, 3), -- North Mine - Horde Control
(@CGUID+588, 50, 3), -- North Mine - Horde Control
(@CGUID+589, 50, 3), -- North Mine - Horde Control
(@CGUID+590, 50, 3), -- North Mine - Horde Control
(@CGUID+591, 50, 3), -- North Mine - Horde Control
(@CGUID+592, 50, 3), -- North Mine - Horde Control
(@CGUID+593, 50, 3), -- North Mine - Horde Control
(@CGUID+594, 50, 3), -- North Mine - Horde Control
(@CGUID+595, 50, 3), -- North Mine - Horde Control
(@CGUID+596, 50, 3), -- North Mine - Horde Control
(@CGUID+597, 50, 3), -- North Mine - Horde Control
(@CGUID+598, 50, 3), -- North Mine - Horde Control
(@CGUID+599, 50, 3), -- North Mine - Horde Control
(@CGUID+600, 50, 3), -- North Mine - Horde Control
(@CGUID+601, 50, 3), -- North Mine - Horde Control
(@CGUID+957, 50, 3), -- North Mine - Horde Control
(@CGUID+958, 50, 3), -- North Mine - Horde Control
(@CGUID+959, 50, 3), -- North Mine - Horde Control
(@CGUID+960, 50, 3), -- North Mine - Horde Control
(@CGUID+961, 50, 3), -- North Mine - Horde Control
(@CGUID+962, 50, 3), -- North Mine - Horde Control
(@CGUID+963, 50, 3), -- North Mine - Horde Control
(@CGUID+964, 50, 3), -- North Mine - Horde Control
(@CGUID+965, 50, 3), -- North Mine - Horde Control
(@CGUID+966, 50, 3), -- North Mine - Horde Control
(@CGUID+967, 50, 3), -- North Mine - Horde Control
(@CGUID+968, 50, 3), -- North Mine - Horde Control
(@CGUID+969, 50, 3), -- North Mine - Horde Control
(@CGUID+970, 50, 3), -- North Mine - Horde Control
(@CGUID+971, 50, 3), -- North Mine - Horde Control
(@CGUID+972, 50, 3), -- North Mine - Horde Control
(@CGUID+973, 50, 3), -- North Mine - Horde Control
(@CGUID+974, 50, 3), -- North Mine - Horde Control
(@CGUID+975, 50, 3), -- North Mine - Horde Control
(@CGUID+976, 50, 3), -- North Mine - Horde Control
(@CGUID+977, 50, 3), -- North Mine - Horde Control
(@CGUID+978, 50, 3), -- North Mine - Horde Control
(@CGUID+979, 50, 3), -- North Mine - Horde Control
(@CGUID+980, 50, 3), -- North Mine - Horde Control
(@CGUID+981, 50, 3), -- North Mine - Horde Control
(@CGUID+982, 50, 3), -- North Mine - Horde Control
(@CGUID+983, 50, 3), -- North Mine - Horde Control
(@CGUID+984, 50, 3), -- North Mine - Horde Control
(@CGUID+985, 50, 3), -- North Mine - Horde Control
(@CGUID+986, 50, 3), -- North Mine - Horde Control
(@CGUID+987, 50, 3), -- North Mine - Horde Control
(@CGUID+988, 50, 3), -- North Mine - Horde Control
(@CGUID+989, 50, 3), -- North Mine - Horde Control
(@CGUID+990, 50, 3), -- North Mine - Horde Control
(@CGUID+991, 50, 3), -- North Mine - Horde Control
(@CGUID+992, 50, 3), -- North Mine - Horde Control
(@CGUID+993, 50, 3), -- North Mine - Horde Control
(@CGUID+994, 50, 3), -- North Mine - Horde Control
(@CGUID+995, 50, 3), -- North Mine - Horde Control
(@CGUID+996, 50, 3), -- North Mine - Horde Control
(@CGUID+997, 50, 3), -- North Mine - Horde Control
(@CGUID+998, 50, 3), -- North Mine - Horde Control
(@CGUID+999, 50, 3), -- North Mine - Horde Control
(@CGUID+1000, 50, 3), -- North Mine - Horde Control
(@CGUID+1001, 50, 3), -- North Mine - Horde Control
(@CGUID+1002, 50, 3), -- North Mine - Horde Control
(@CGUID+1003, 50, 3), -- North Mine - Horde Control
(@CGUID+1004, 50, 3), -- North Mine - Horde Control
(@CGUID+1005, 50, 3), -- North Mine - Horde Control
(@CGUID+1006, 50, 3), -- North Mine - Horde Control
(@CGUID+22, 51, 5), -- South Mine - Neutral Control
(@CGUID+23, 51, 5), -- South Mine - Neutral Control
(@CGUID+24, 51, 5), -- South Mine - Neutral Control
(@CGUID+25, 51, 5), -- South Mine - Neutral Control
(@CGUID+26, 51, 5), -- South Mine - Neutral Control
(@CGUID+27, 51, 5), -- South Mine - Neutral Control
(@CGUID+28, 51, 5), -- South Mine - Neutral Control
(@CGUID+29, 51, 5), -- South Mine - Neutral Control
(@CGUID+30, 51, 5), -- South Mine - Neutral Control
(@CGUID+31, 51, 5), -- South Mine - Neutral Control
(@CGUID+172, 51, 5), -- South Mine - Neutral Control
(@CGUID+173, 51, 5), -- South Mine - Neutral Control
(@CGUID+174, 51, 5), -- South Mine - Neutral Control
(@CGUID+175, 51, 5), -- South Mine - Neutral Control
(@CGUID+176, 51, 5), -- South Mine - Neutral Control
(@CGUID+177, 51, 5), -- South Mine - Neutral Control
(@CGUID+178, 51, 5), -- South Mine - Neutral Control
(@CGUID+179, 51, 5), -- South Mine - Neutral Control
(@CGUID+180, 51, 5), -- South Mine - Neutral Control
(@CGUID+181, 51, 5), -- South Mine - Neutral Control
(@CGUID+182, 51, 5), -- South Mine - Neutral Control
(@CGUID+183, 51, 5), -- South Mine - Neutral Control
(@CGUID+184, 51, 5), -- South Mine - Neutral Control
(@CGUID+185, 51, 5), -- South Mine - Neutral Control
(@CGUID+186, 51, 5), -- South Mine - Neutral Control
(@CGUID+187, 51, 5), -- South Mine - Neutral Control
(@CGUID+188, 51, 5), -- South Mine - Neutral Control
(@CGUID+189, 51, 5), -- South Mine - Neutral Control
(@CGUID+190, 51, 5), -- South Mine - Neutral Control
(@CGUID+191, 51, 5), -- South Mine - Neutral Control
(@CGUID+192, 51, 5), -- South Mine - Neutral Control
(@CGUID+193, 51, 5), -- South Mine - Neutral Control
(@CGUID+194, 51, 5), -- South Mine - Neutral Control
(@CGUID+195, 51, 5), -- South Mine - Neutral Control
(@CGUID+196, 51, 5), -- South Mine - Neutral Control
(@CGUID+197, 51, 5), -- South Mine - Neutral Control
(@CGUID+198, 51, 5), -- South Mine - Neutral Control
(@CGUID+199, 51, 5), -- South Mine - Neutral Control
(@CGUID+200, 51, 5), -- South Mine - Neutral Control
(@CGUID+201, 51, 5), -- South Mine - Neutral Control
(@CGUID+202, 51, 5), -- South Mine - Neutral Control
(@CGUID+203, 51, 5), -- South Mine - Neutral Control
(@CGUID+204, 51, 5), -- South Mine - Neutral Control
(@CGUID+205, 51, 5), -- South Mine - Neutral Control
(@CGUID+206, 51, 5), -- South Mine - Neutral Control
(@CGUID+207, 51, 5), -- South Mine - Neutral Control
(@CGUID+208, 51, 5), -- South Mine - Neutral Control
(@CGUID+209, 51, 5), -- South Mine - Neutral Control
(@CGUID+210, 51, 5), -- South Mine - Neutral Control
(@CGUID+211, 51, 5), -- South Mine - Neutral Control
(@CGUID+212, 51, 5), -- South Mine - Neutral Control
(@CGUID+213, 51, 5), -- South Mine - Neutral Control
(@CGUID+214, 51, 5), -- South Mine - Neutral Control
(@CGUID+215, 51, 5), -- South Mine - Neutral Control
(@CGUID+216, 51, 5), -- South Mine - Neutral Control
(@CGUID+217, 51, 5), -- South Mine - Neutral Control
(@CGUID+218, 51, 5), -- South Mine - Neutral Control
(@CGUID+219, 51, 5), -- South Mine - Neutral Control
(@CGUID+220, 51, 5), -- South Mine - Neutral Control
(@CGUID+221, 51, 5), -- South Mine - Neutral Control
(@CGUID+223, 51, 5), -- South Mine - Neutral Control
(@CGUID+224, 51, 5), -- South Mine - Neutral Control
(@CGUID+225, 51, 5), -- South Mine - Neutral Control
(@CGUID+226, 51, 5), -- South Mine - Neutral Control
(@CGUID+227, 51, 5), -- South Mine - Neutral Control
(@CGUID+228, 51, 5), -- South Mine - Neutral Control
(@CGUID+229, 51, 5), -- South Mine - Neutral Control
(@CGUID+230, 51, 5), -- South Mine - Neutral Control
(@CGUID+231, 51, 5), -- South Mine - Neutral Control
(@CGUID+232, 51, 5), -- South Mine - Neutral Control
(@CGUID+233, 51, 5), -- South Mine - Neutral Control
(@CGUID+234, 51, 5), -- South Mine - Neutral Control
(@CGUID+235, 51, 5), -- South Mine - Neutral Control
(@CGUID+236, 51, 5), -- South Mine - Neutral Control
(@CGUID+237, 51, 5), -- South Mine - Neutral Control
(@CGUID+238, 51, 5), -- South Mine - Neutral Control
(@CGUID+239, 51, 5), -- South Mine - Neutral Control
(@CGUID+240, 51, 5), -- South Mine - Neutral Control
(@CGUID+241, 51, 5), -- South Mine - Neutral Control
(@CGUID+242, 51, 5), -- South Mine - Neutral Control
(@CGUID+243, 51, 5), -- South Mine - Neutral Control
(@CGUID+244, 51, 5), -- South Mine - Neutral Control
(@CGUID+245, 51, 5), -- South Mine - Neutral Control
(@CGUID+246, 51, 5), -- South Mine - Neutral Control
(@CGUID+247, 51, 5), -- South Mine - Neutral Control
(@CGUID+248, 51, 5), -- South Mine - Neutral Control
(@CGUID+249, 51, 5), -- South Mine - Neutral Control
(@CGUID+250, 51, 5), -- South Mine - Neutral Control
(@CGUID+251, 51, 5), -- South Mine - Neutral Control
(@CGUID+252, 51, 5), -- South Mine - Neutral Control
(@CGUID+253, 51, 5), -- South Mine - Neutral Control
(@CGUID+254, 51, 5), -- South Mine - Neutral Control
(@CGUID+255, 51, 5), -- South Mine - Neutral Control
(@CGUID+256, 51, 5), -- South Mine - Neutral Control
(@CGUID+257, 51, 5), -- South Mine - Neutral Control
(@CGUID+258, 51, 5), -- South Mine - Neutral Control
(@CGUID+259, 51, 5), -- South Mine - Neutral Control
(@CGUID+260, 51, 5), -- South Mine - Neutral Control
(@CGUID+261, 51, 5), -- South Mine - Neutral Control
(@CGUID+506, 51, 3), -- South Mine - Horde Control
(@CGUID+507, 51, 3), -- South Mine - Horde Control
(@CGUID+508, 51, 3), -- South Mine - Horde Control
(@CGUID+509, 51, 3), -- South Mine - Horde Control
(@CGUID+510, 51, 3), -- South Mine - Horde Control
(@CGUID+511, 51, 3), -- South Mine - Horde Control
(@CGUID+512, 51, 3), -- South Mine - Horde Control
(@CGUID+513, 51, 3), -- South Mine - Horde Control
(@CGUID+514, 51, 3), -- South Mine - Horde Control
(@CGUID+515, 51, 3), -- South Mine - Horde Control
(@CGUID+516, 51, 3), -- South Mine - Horde Control
(@CGUID+517, 51, 3), -- South Mine - Horde Control
(@CGUID+518, 51, 3), -- South Mine - Horde Control
(@CGUID+519, 51, 3), -- South Mine - Horde Control
(@CGUID+520, 51, 3), -- South Mine - Horde Control
(@CGUID+521, 51, 3), -- South Mine - Horde Control
(@CGUID+522, 51, 3), -- South Mine - Horde Control
(@CGUID+523, 51, 3), -- South Mine - Horde Control
(@CGUID+524, 51, 3), -- South Mine - Horde Control
(@CGUID+525, 51, 3), -- South Mine - Horde Control
(@CGUID+526, 51, 3), -- South Mine - Horde Control
(@CGUID+527, 51, 3), -- South Mine - Horde Control
(@CGUID+528, 51, 3), -- South Mine - Horde Control
(@CGUID+529, 51, 3), -- South Mine - Horde Control
(@CGUID+530, 51, 3), -- South Mine - Horde Control
(@CGUID+531, 51, 3), -- South Mine - Horde Control
(@CGUID+532, 51, 3), -- South Mine - Horde Control
(@CGUID+533, 51, 3), -- South Mine - Horde Control
(@CGUID+534, 51, 3), -- South Mine - Horde Control
(@CGUID+535, 51, 3), -- South Mine - Horde Control
(@CGUID+536, 51, 3), -- South Mine - Horde Control
(@CGUID+537, 51, 3), -- South Mine - Horde Control
(@CGUID+538, 51, 3), -- South Mine - Horde Control
(@CGUID+539, 51, 3), -- South Mine - Horde Control
(@CGUID+540, 51, 3), -- South Mine - Horde Control
(@CGUID+541, 51, 3), -- South Mine - Horde Control
(@CGUID+542, 51, 3), -- South Mine - Horde Control
(@CGUID+543, 51, 3), -- South Mine - Horde Control
(@CGUID+544, 51, 3), -- South Mine - Horde Control
(@CGUID+646, 51, 3), -- South Mine - Horde Control
(@CGUID+647, 51, 3), -- South Mine - Horde Control
(@CGUID+648, 51, 3), -- South Mine - Horde Control
(@CGUID+649, 51, 3), -- South Mine - Horde Control
(@CGUID+650, 51, 3), -- South Mine - Horde Control
(@CGUID+651, 51, 3), -- South Mine - Horde Control
(@CGUID+652, 51, 3), -- South Mine - Horde Control
(@CGUID+653, 51, 3), -- South Mine - Horde Control
(@CGUID+654, 51, 3), -- South Mine - Horde Control
(@CGUID+655, 51, 3), -- South Mine - Horde Control
(@CGUID+656, 51, 3), -- South Mine - Horde Control
(@CGUID+657, 51, 3), -- South Mine - Horde Control
(@CGUID+658, 51, 3), -- South Mine - Horde Control
(@CGUID+659, 51, 3), -- South Mine - Horde Control
(@CGUID+660, 51, 3), -- South Mine - Horde Control
(@CGUID+661, 51, 3), -- South Mine - Horde Control
(@CGUID+662, 51, 3), -- South Mine - Horde Control
(@CGUID+663, 51, 3), -- South Mine - Horde Control
(@CGUID+664, 51, 3), -- South Mine - Horde Control
(@CGUID+665, 51, 3), -- South Mine - Horde Control
(@CGUID+666, 51, 3), -- South Mine - Horde Control
(@CGUID+667, 51, 3), -- South Mine - Horde Control
(@CGUID+668, 51, 3), -- South Mine - Horde Control
(@CGUID+669, 51, 3), -- South Mine - Horde Control
(@CGUID+670, 51, 3), -- South Mine - Horde Control
(@CGUID+671, 51, 3), -- South Mine - Horde Control
(@CGUID+672, 51, 3), -- South Mine - Horde Control
(@CGUID+673, 51, 3), -- South Mine - Horde Control
(@CGUID+674, 51, 3), -- South Mine - Horde Control
(@CGUID+675, 51, 3), -- South Mine - Horde Control
(@CGUID+676, 51, 3), -- South Mine - Horde Control
(@CGUID+677, 51, 3), -- South Mine - Horde Control
(@CGUID+678, 51, 3), -- South Mine - Horde Control
(@CGUID+679, 51, 3), -- South Mine - Horde Control
(@CGUID+680, 51, 3), -- South Mine - Horde Control
(@CGUID+681, 51, 3), -- South Mine - Horde Control
(@CGUID+682, 51, 3), -- South Mine - Horde Control
(@CGUID+683, 51, 3), -- South Mine - Horde Control
(@CGUID+684, 51, 3), -- South Mine - Horde Control
(@CGUID+685, 51, 3), -- South Mine - Horde Control
(@CGUID+686, 51, 3), -- South Mine - Horde Control
(@CGUID+687, 51, 3), -- South Mine - Horde Control
(@CGUID+688, 51, 3), -- South Mine - Horde Control
(@CGUID+689, 51, 3), -- South Mine - Horde Control
(@CGUID+690, 51, 3), -- South Mine - Horde Control
(@CGUID+691, 51, 3), -- South Mine - Horde Control
(@CGUID+692, 51, 3), -- South Mine - Horde Control
(@CGUID+693, 51, 3), -- South Mine - Horde Control
(@CGUID+694, 51, 3), -- South Mine - Horde Control
(@CGUID+695, 51, 3), -- South Mine - Horde Control
(@CGUID+466, 51, 1), -- South Mine - Alliance Control
(@CGUID+467, 51, 1), -- South Mine - Alliance Control
(@CGUID+468, 51, 1), -- South Mine - Alliance Control
(@CGUID+469, 51, 1), -- South Mine - Alliance Control
(@CGUID+470, 51, 1), -- South Mine - Alliance Control
(@CGUID+471, 51, 1), -- South Mine - Alliance Control
(@CGUID+472, 51, 1), -- South Mine - Alliance Control
(@CGUID+473, 51, 1), -- South Mine - Alliance Control
(@CGUID+474, 51, 1), -- South Mine - Alliance Control
(@CGUID+475, 51, 1), -- South Mine - Alliance Control
(@CGUID+476, 51, 1), -- South Mine - Alliance Control
(@CGUID+477, 51, 1), -- South Mine - Alliance Control
(@CGUID+478, 51, 1), -- South Mine - Alliance Control
(@CGUID+479, 51, 1), -- South Mine - Alliance Control
(@CGUID+480, 51, 1), -- South Mine - Alliance Control
(@CGUID+481, 51, 1), -- South Mine - Alliance Control
(@CGUID+482, 51, 1), -- South Mine - Alliance Control
(@CGUID+483, 51, 1), -- South Mine - Alliance Control
(@CGUID+484, 51, 1), -- South Mine - Alliance Control
(@CGUID+485, 51, 1), -- South Mine - Alliance Control
(@CGUID+486, 51, 1), -- South Mine - Alliance Control
(@CGUID+487, 51, 1), -- South Mine - Alliance Control
(@CGUID+488, 51, 1), -- South Mine - Alliance Control
(@CGUID+489, 51, 1), -- South Mine - Alliance Control
(@CGUID+490, 51, 1), -- South Mine - Alliance Control
(@CGUID+491, 51, 1), -- South Mine - Alliance Control
(@CGUID+492, 51, 1), -- South Mine - Alliance Control
(@CGUID+493, 51, 1), -- South Mine - Alliance Control
(@CGUID+494, 51, 1), -- South Mine - Alliance Control
(@CGUID+495, 51, 1), -- South Mine - Alliance Control
(@CGUID+496, 51, 1), -- South Mine - Alliance Control
(@CGUID+497, 51, 1), -- South Mine - Alliance Control
(@CGUID+498, 51, 1), -- South Mine - Alliance Control
(@CGUID+499, 51, 1), -- South Mine - Alliance Control
(@CGUID+500, 51, 1), -- South Mine - Alliance Control
(@CGUID+501, 51, 1), -- South Mine - Alliance Control
(@CGUID+502, 51, 1), -- South Mine - Alliance Control
(@CGUID+503, 51, 1), -- South Mine - Alliance Control
(@CGUID+504, 51, 1), -- South Mine - Alliance Control
(@CGUID+701, 51, 1), -- South Mine - Alliance Control
(@CGUID+702, 51, 1), -- South Mine - Alliance Control
(@CGUID+703, 51, 1), -- South Mine - Alliance Control
(@CGUID+704, 51, 1), -- South Mine - Alliance Control
(@CGUID+705, 51, 1), -- South Mine - Alliance Control
(@CGUID+706, 51, 1), -- South Mine - Alliance Control
(@CGUID+707, 51, 1), -- South Mine - Alliance Control
(@CGUID+708, 51, 1), -- South Mine - Alliance Control
(@CGUID+709, 51, 1), -- South Mine - Alliance Control
(@CGUID+710, 51, 1), -- South Mine - Alliance Control
(@CGUID+711, 51, 1), -- South Mine - Alliance Control
(@CGUID+712, 51, 1), -- South Mine - Alliance Control
(@CGUID+713, 51, 1), -- South Mine - Alliance Control
(@CGUID+714, 51, 1), -- South Mine - Alliance Control
(@CGUID+715, 51, 1), -- South Mine - Alliance Control
(@CGUID+716, 51, 1), -- South Mine - Alliance Control
(@CGUID+717, 51, 1), -- South Mine - Alliance Control
(@CGUID+718, 51, 1), -- South Mine - Alliance Control
(@CGUID+719, 51, 1), -- South Mine - Alliance Control
(@CGUID+720, 51, 1), -- South Mine - Alliance Control
(@CGUID+721, 51, 1), -- South Mine - Alliance Control
(@CGUID+722, 51, 1), -- South Mine - Alliance Control
(@CGUID+723, 51, 1), -- South Mine - Alliance Control
(@CGUID+724, 51, 1), -- South Mine - Alliance Control
(@CGUID+725, 51, 1), -- South Mine - Alliance Control
(@CGUID+726, 51, 1), -- South Mine - Alliance Control
(@CGUID+727, 51, 1), -- South Mine - Alliance Control
(@CGUID+728, 51, 1), -- South Mine - Alliance Control
(@CGUID+729, 51, 1), -- South Mine - Alliance Control
(@CGUID+730, 51, 1), -- South Mine - Alliance Control
(@CGUID+731, 51, 1), -- South Mine - Alliance Control
(@CGUID+732, 51, 1), -- South Mine - Alliance Control
(@CGUID+733, 51, 1), -- South Mine - Alliance Control
(@CGUID+734, 51, 1), -- South Mine - Alliance Control
(@CGUID+735, 51, 1), -- South Mine - Alliance Control
(@CGUID+736, 51, 1), -- South Mine - Alliance Control
(@CGUID+737, 51, 1), -- South Mine - Alliance Control
(@CGUID+738, 51, 1), -- South Mine - Alliance Control
(@CGUID+739, 51, 1), -- South Mine - Alliance Control
(@CGUID+740, 51, 1), -- South Mine - Alliance Control
(@CGUID+741, 51, 1), -- South Mine - Alliance Control
(@CGUID+742, 51, 1), -- South Mine - Alliance Control
(@CGUID+743, 51, 1), -- South Mine - Alliance Control
(@CGUID+744, 51, 1), -- South Mine - Alliance Control
(@CGUID+745, 51, 1), -- South Mine - Alliance Control
(@CGUID+746, 51, 1), -- South Mine - Alliance Control
(@CGUID+747, 51, 1), -- South Mine - Alliance Control
(@CGUID+748, 51, 1), -- South Mine - Alliance Control
(@CGUID+749, 51, 1), -- South Mine - Alliance Control
(@CGUID+750, 51, 1), -- South Mine - Alliance Control
(@CGUID+1144, 52, 0), -- Alliance Marshal - Dunbaldar South
(@CGUID+1142, 53, 0), -- Alliance Marshal - Dunbaldar North
(@CGUID+1146, 54, 0), -- Alliance Marshal - Icewing Bunker
(@CGUID+1149, 55, 0), -- Alliance Marshal - Stoneheart Bunker
(@CGUID+288, 60, 0), -- Stormpike Herald - That Guy Who Yells All The Time
(@CGUID+290, 60, 0), -- Frostwolf Herald - That Guy Who Yells All The Time
(@CGUID+1156, 56, 0), -- Horde Marshal - Iceblood Tower
(@CGUID+1161, 57, 0), -- Horde Marshal - Towerpoint
(@CGUID+1154, 58, 0), -- Horde Marshal - East Frostwolf Tower
(@CGUID+1163, 59, 0), -- Horde Marshal - West Frostwolf Tower
(@CGUID+284, 61, 0), -- Alliance - Boss
(@CGUID+280, 62, 0); -- Horde - Boss

-- INSERT INTO `creature_spawn_entry` (`guid`, `entry`) VALUES

INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 603, 30, -1594.43, -410.107, 81.4242, 0.945338, 300, 300, 0, 0, 0, 0), -- Grimtooth
(@CGUID+2, 2225, 30, -1235.314, -340.7767, 60.50882, 3.316126, 430, 430, 0, 0, 0, 0), -- Zora Guthrek
(@CGUID+3, 3343, 30, -1244.016, -323.795, 60.99969, 5.218534, 430, 430, 0, 0, 0, 0), -- Grelkor
(@CGUID+4, 3625, 30, -1235.164, -332.3018, 60.2761, 2.96706, 430, 430, 0, 0, 0, 0), -- Rarck
(@CGUID+5, 4255, 30, 587.3031, -42.82568, 37.56148, 5.235988, 430, 430, 0, 0, 0, 0), -- Brogus Thunderbrew
(@CGUID+6, 4257, 30, 643.6354, -58.39871, 41.74047, 4.729842, 430, 430, 0, 0, 0, 0), -- Lana Thunderbrew
(@CGUID+7, 5134, 30, 591.4639, -44.45204, 37.61656, 5.654867, 430, 430, 0, 0, 0, 0), -- Jonivera Farmountain
(@CGUID+8, 5135, 30, 608.515, -33.3935, 42.00032, 5.410521, 430, 430, 0, 0, 0, 0), -- Svalbrad Farmountain
(@CGUID+9, 5139, 30, 617.6557, -32.0701, 42.71676, 4.066617, 430, 430, 0, 0, 0, 0), -- Kurdrum Barleybeard
-- (@CGUID+10 - 11
(@CGUID+12, 10364, 30, -1183.761, -268.2953, 72.8233, 3.281219, 430, 430, 0, 0, 0, 0), -- Yaelika Farclaw
(@CGUID+13, 10367, 30, -1187.895, -275.0548, 73.00099, 3.630285, 430, 430, 0, 0, 0, 0), -- Shrye Ragefist
-- (@CGUID+14 - 20
(@CGUID+21, 10982, 30, -940.892, -241.793, 66.3806, 5.90868, 430, 430, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+22, 10982, 30, -951.955, -197.5, 77.212, 5.63741, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+23, 10982, 30, -944.837, -199.608, 77.0737, 4.97419, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+24, 10982, 30, -933.494, -209.063, 73.7803, 5.88176, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+25, 10982, 30, -929.666, -201.308, 73.7032, 5.02655, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+26, 10982, 30, -978.997, -249.356, 65.4345, 5.05464, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+27, 10982, 30, -974.565, -224.828, 69.5858, 4.88846, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+28, 10982, 30, -946.514, -259.239, 66.0874, 3.78132, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+29, 10982, 30, -918.402, -250.439, 69.5271, 2.21352, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+30, 10982, 30, -910.14, -229.959, 72.9279, 0.27677, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
(@CGUID+31, 10982, 30, -851.563, -88.6527, 68.5983, 3.61896, 120, 120, 0, 0, 0, 0), -- Whitewhisker Vermin
-- (@CGUID+32 - 35
(@CGUID+36, 10987, 30, 783.105, -343.73, 61.4101, 5.48663, 430, 430, 5, 0, 0, 1), -- Irondeep Trogg
(@CGUID+37, 10987, 30, 821.69, -452.461, 48.7652, 1.26777, 430, 430, 5, 0, 0, 1), -- Irondeep Trogg
(@CGUID+38, 10987, 30, 837.619, -367.155, 48.1319, 3.11575, 430, 430, 5, 0, 0, 1), -- Irondeep Trogg
(@CGUID+39, 10987, 30, 889.7, -337.33, 67.4076, 0.519866, 430, 430, 5, 0, 0, 1), -- Irondeep Trogg
(@CGUID+40, 10987, 30, 863.518, -396.507, 61.8274, 5.80034, 430, 430, 5, 0, 0, 1), -- Irondeep Trogg
(@CGUID+41, 10987, 30, 826.406, -329.67, 64.293, 5.88491, 430, 430, 5, 0, 0, 1), -- Irondeep Trogg
(@CGUID+42, 10987, 30, 971.671, -442.657, 57.6951, 3.1765, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+43, 10987, 30, 969.979, -457.148, 58.1119, 4.5204, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+44, 10987, 30, 958.692, -333.477, 63.2276, 5.77704, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+45, 10987, 30, 957.113, -325.92, 61.7589, 1.13446, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+46, 10987, 30, 948.25, -448.268, 56.9009, 5.60251, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+47, 10987, 30, 934.727, -385.802, 63.0344, 3.75246, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+48, 10987, 30, 931.751, -403.458, 59.6737, 5.63741, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+49, 10987, 30, 931.146, -359.666, 66.0294, 3.9619, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+50, 10987, 30, 929.702, -412.401, 56.8776, 5.89921, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+51, 10987, 30, 926.849, -379.074, 63.5286, 2.0944, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+52, 10987, 30, 921.972, -358.597, 66.4313, 2.93215, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+53, 10987, 30, 921.449, -341.981, 67.1264, 3.4383, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+54, 10987, 30, 921.1, -395.812, 60.4615, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+55, 10987, 30, 919.274, -394.986, 60.3478, 2.71696, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+56, 10987, 30, 916.852, -393.891, 60.1726, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+57, 10987, 30, 914.568, -326.21, 66.1733, 2.25147, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+58, 10987, 30, 913.064, -395.773, 60.1364, 4.41568, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+59, 10987, 30, 909.246, -474.576, 58.2067, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+60, 10987, 30, 909.246, -474.576, 58.2901, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+61, 10987, 30, 907.209, -428.267, 59.8065, 1.8675, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+62, 10987, 30, 905.973, -459.528, 58.7594, 1.37189, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+63, 10987, 30, 905.067, -396.074, 60.2085, 5.07891, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+64, 10987, 30, 901.809, -457.709, 59.0116, 3.52557, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+65, 10987, 30, 900.962, -427.44, 59.0842, 1.50098, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+66, 10987, 30, 897.929, -471.742, 59.7729, 2.54818, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+67, 10987, 30, 893.376, -343.171, 68.1499, 5.35816, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+68, 10987, 30, 890.584, -406.049, 61.1925, 5.67232, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+69, 10987, 30, 888.208, -332.564, 68.148, 1.93732, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+70, 10987, 30, 887.647, -391.537, 61.8734, 1.37881, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+71, 10987, 30, 885.109, -343.338, 67.0867, 3.78979, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+72, 10987, 30, 881.618, -419.948, 53.5228, 0.593412, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+73, 10987, 30, 878.675, -345.36, 66.1052, 3.45651, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+74, 10987, 30, 877.127, -351.8, 66.5296, 5.74213, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+75, 10987, 30, 876.778, -345.97, 65.7724, 3.45262, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+76, 10987, 30, 874.577, -414.786, 52.7817, 1.67552, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+77, 10987, 30, 868.247, -343.136, 64.9894, 1.6057, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+78, 10987, 30, 859.03, -367.231, 47.4655, 0.0174533, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+79, 10987, 30, 857.513, -351.817, 65.1867, 4.39823, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+80, 10987, 30, 852.632, -372.416, 48.1657, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+81, 10987, 30, 849.86, -340.944, 66.2447, 0.401426, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+82, 10987, 30, 847.99, -386.287, 60.9277, 2.32374, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+83, 10987, 30, 847.601, -423.072, 50.0852, 4.57276, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+84, 10987, 30, 847.135, -411.307, 50.2106, 1.5708, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+85, 10987, 30, 835.077, -379.418, 48.2755, 5.93412, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+86, 10987, 30, 834.87, -453.304, 47.9075, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+87, 10987, 30, 834.634, -365.981, 62.8801, 1.32645, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+88, 10987, 30, 834.354, -355.526, 48.1491, 6.07375, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+89, 10987, 30, 833.702, -327.506, 65.0439, 0.331613, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+90, 10987, 30, 833.151, -374.228, 63.0938, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+91, 10987, 30, 831.711, -346.785, 47.2975, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Trogg
(@CGUID+98, 10991, 30, -1543.57, -485.147, 71.3851, 5.09775, 430, 430, 5, 0, 0, 1), -- Wildpaw Gnoll
(@CGUID+99, 10991, 30, -1666.59, -419.099, 45.5899, 5.27671, 430, 430, 5, 0, 0, 1), -- Wildpaw Gnoll
(@CGUID+100, 10991, 30, -1484.03, -437.682, 69.8575, 4.13699, 430, 430, 5, 0, 0, 1), -- Wildpaw Gnoll
(@CGUID+101, 10991, 30, -1498.23, -434.779, 70.2211, 4.26458, 430, 430, 5, 0, 0, 1), -- Wildpaw Gnoll
(@CGUID+102, 11600, 30, 928.414, -340.23, 65.3032, 2.15247, 430, 430, 5, 0, 0, 1), -- Irondeep Shaman
(@CGUID+103, 11600, 30, 824.696, -402.976, 48.2669, 2.43507, 430, 430, 5, 0, 0, 1), -- Irondeep Shaman
(@CGUID+104, 11600, 30, 955.812, -440.302, 55.3411, 3.19395, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+105, 11600, 30, 937.378, -377.816, 65.3919, 3.56047, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+106, 11600, 30, 925.059, -331.347, 65.7564, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+107, 11600, 30, 922.918, -396.634, 60.3942, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+108, 11600, 30, 909.99, -462.154, 59.0811, 3.7001, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+109, 11600, 30, 907.893, -388.787, 61.7923, 5.74213, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+110, 11600, 30, 898.801, -437.105, 58.5266, 0.959931, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+111, 11600, 30, 884.237, -407.597, 61.566, 0.820305, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+112, 11600, 30, 880.744, -344.683, 66.4086, 3.4644, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+113, 11600, 30, 876.047, -341.857, 65.8743, 4.45059, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+114, 11600, 30, 874.674, -402.077, 61.7573, 0.26341, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+115, 11600, 30, 871.914, -404.209, 62.1269, 6.06163, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+116, 11600, 30, 871.606, -403.665, 62.0795, 0.765774, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+117, 11600, 30, 871.561, -404.114, 62.1297, 0.00981727, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+118, 11600, 30, 871.528, -404.248, 62.1455, 0.498032, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+119, 11600, 30, 871.493, -404.122, 62.1331, 5.65727, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+120, 11600, 30, 871.282, -403.843, 62.1108, 0.788382, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+121, 11600, 30, 868.294, -392.395, 61.4772, 4.38685, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+122, 11600, 30, 868.256, -392.363, 61.4803, 0.732738, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+123, 11600, 30, 867.804, -392.51, 61.5089, 2.30167, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+124, 11600, 30, 867.612, -392.371, 61.524, 2.86149, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+125, 11600, 30, 858.593, -439.614, 50.2184, 0.872665, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+126, 11600, 30, 851.471, -362.52, 47.314, 4.06662, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+127, 11600, 30, 846.939, -347.279, 66.2876, 0.942478, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+128, 11600, 30, 842.08, -421.775, 48.2659, 1.0821, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+129, 11600, 30, 838.358, -371.212, 63.3299, 4.04916, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+130, 11600, 30, 827.57, -417.483, 48.4538, 1.49237, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+131, 11600, 30, 827.012, -457.397, 48.9331, 2.35619, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+132, 11600, 30, 825.535, -322.373, 63.9357, 4.76475, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+133, 11600, 30, 867.635, -443.605, 51.3347, 1.38626, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+134, 11600, 30, 957.293, -455.039, 56.7395, 5.79449, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+135, 11600, 30, 950.077, -326.672, 61.6552, 5.48033, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+136, 11600, 30, 936.692, -356.78, 65.9835, 2.75762, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+137, 11600, 30, 926.475, -419.345, 56.1833, 2.0944, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+138, 11600, 30, 924.729, -397.453, 60.213, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+139, 11600, 30, 902.195, -475.891, 58.312, 1.39626, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+140, 11600, 30, 897.464, -338.758, 68.1715, 2.94961, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+141, 11600, 30, 884.237, -407.597, 61.566, 0.820305, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+142, 11600, 30, 882.517, -344.111, 66.7887, 3.46962, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+143, 11600, 30, 881.437, -400.254, 61.2028, 0.263427, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+144, 11600, 30, 880.156, -400.678, 61.3113, 3.41373, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+145, 11600, 30, 877.989, -418.051, 52.9753, 4.46804, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+146, 11600, 30, 871.212, -404.12, 62.1433, 3.6554, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+147, 11600, 30, 871.036, -404.119, 62.2237, 4.50295, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+148, 11600, 30, 857.396, -395.766, 61.263, 4.78684, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+149, 11600, 30, 857.276, -395.395, 61.2418, 0.0845553, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+150, 11600, 30, 857.231, -394.577, 61.2174, 1.96817, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+151, 11600, 30, 857.108, -395.682, 61.2317, 4.87022, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+152, 11600, 30, 856.709, -395.28, 61.1814, 2.54913, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+153, 11600, 30, 850.922, -390.399, 60.8771, 2.85405, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+154, 11600, 30, 847.556, -388.228, 60.9438, 2.56872, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+155, 11600, 30, 842.031, -384.663, 61.6028, 2.56871, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+156, 11600, 30, 832.035, -389.301, 47.5567, 2.11185, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+157, 11600, 30, 827.415, -419.468, 48.3322, 1.49232, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+158, 11600, 30, 826.402, -349.454, 47.2722, 1.51844, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+159, 11600, 30, 817.83, -455.715, 48.4207, 0.925025, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+160, 11600, 30, 808.953, -325.964, 52.4043, 3.01942, 120, 120, 0, 0, 0, 0), -- Irondeep Shaman
(@CGUID+161, 11602, 30, 922.715, -405.011, 58.128, 4.89692, 430, 430, 0, 0, 0, 0), -- Irondeep Skullthumper
(@CGUID+162, 11603, 30, -865.648, -63.2401, 71.4081, 3.1746, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+163, 11603, 30, -916.427, -148.357, 62.1725, 2.57609, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+164, 11603, 30, -899.952, -55.7846, 72.681, 3.33092, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+165, 11603, 30, -856.01, -144.563, 61.7379, 0.224681, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+166, 11603, 30, -904.397, -143.921, 75.9872, 1.22522, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+167, 11603, 30, -854.975, -110.849, 64.2129, 3.09682, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+168, 11603, 30, -943.309, -125.085, 78.3111, 1.75608, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+169, 11603, 30, -954.231, -169.515, 78.0482, 1.96266, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+170, 11603, 30, -901.977, -82.8394, 74.4376, 5.23297, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+171, 11603, 30, -869.969, -95.7836, 66.7666, 1.39643, 430, 430, 5, 0, 0, 1), -- Whitewhisker Digger
(@CGUID+172, 11603, 30, -917.648, -46.8922, 77.0872, 5.27089, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+173, 11603, 30, -912.689, -45.4494, 76.2277, 4.60767, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+174, 11603, 30, -905.455, -84.5179, 75.3642, 3.29867, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+175, 11603, 30, -904.332, -111.509, 75.5925, 2.47837, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+176, 11603, 30, -904.27, -160.419, 61.9876, 3.61192, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+177, 11603, 30, -904.023, -90.4558, 75.3706, 3.40339, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+178, 11603, 30, -978.678, -37.3136, 75.8364, 2.84489, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+179, 11603, 30, -973.076, -36.5013, 77.5047, 1.0821, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+180, 11603, 30, -963.951, -87.734, 81.5555, 0.575959, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+181, 11603, 30, -961.941, -90.7252, 81.6629, 0.820305, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+182, 11603, 30, -957.623, -186.582, 66.6021, 1.95477, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+183, 11603, 30, -952.476, -179.778, 78.6771, 4.5204, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+184, 11603, 30, -950.427, -115.007, 79.6127, 3.68264, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+185, 11603, 30, -950.25, -151.95, 79.4598, -1.81423, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+186, 11603, 30, -950.169, -188.099, 66.6184, 5.55015, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+187, 11603, 30, -949.944, -142.977, 80.5382, 2.70526, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+188, 11603, 30, -947.854, -170.5, 79.7618, 0.942478, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+189, 11603, 30, -946.738, -139.567, 80.0904, 2.3911, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+190, 11603, 30, -945.503, -65.0654, 79.7907, 5.02655, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+191, 11603, 30, -943.678, -110.986, 80.2557, 0.959931, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+192, 11603, 30, -942.993, -56.9881, 79.8915, 5.65487, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+193, 11603, 30, -938.197, -155.838, 61.3111, 1.65806, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+194, 11603, 30, -930.488, -214.524, 72.1431, 2.1236, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+195, 11603, 30, -929.947, -154.449, 61.5084, 1.67552, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+196, 11603, 30, -927.412, -135.313, 61.1987, 3.29867, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+197, 11603, 30, -920.677, -156.859, 62.8033, 3.15306, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+198, 11603, 30, -916.75, -136.094, 62.2357, 0.0698132, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+199, 11603, 30, -915.319, -132.718, 62.562, 1.16984, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+200, 11603, 30, -913.589, -146.794, 76.9366, 1.8675, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+201, 11603, 30, -907.572, -148.937, 76.6898, 4.76475, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+202, 11603, 30, -902.02, -64.6174, 73.9707, 1.19169, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+203, 11603, 30, -899.489, -61.7252, 73.2498, 5.09636, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+204, 11603, 30, -894.792, -127.141, 75.3834, 6.14356, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+205, 11603, 30, -892.408, -162.525, 64.1212, 2.69884, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+206, 11603, 30, -892.326, -123.158, 76.0318, 5.5676, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+207, 11603, 30, -888.468, -148.462, 61.8012, 1.65806, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+208, 11603, 30, -883.268, -159.738, 63.5311, 5.20108, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+209, 11603, 30, -877.76, -118.07, 65.215, 2.94961, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+210, 11603, 30, -876.792, -128.646, 64.1045, 3.40339, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+211, 11603, 30, -874.901, -36.6579, 69.4246, 2.00713, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+212, 11603, 30, -874.856, -151.351, 62.7537, 3.57875, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+213, 11603, 30, -872.135, -150.08, 62.7513, 3.57201, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+214, 11603, 30, -870.288, -149.217, 62.5413, 3.56624, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+215, 11603, 30, -870.03, -6.27443, 70.3867, 2.3911, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+216, 11603, 30, -869.023, -82.2118, 69.5848, 3.22886, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+217, 11603, 30, -866.354, -40.2455, 70.842, 0.0698132, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+218, 11603, 30, -865.305, -152.302, 63.5044, 4.86947, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+219, 11603, 30, -861.926, -79.0519, 71.4178, 0.20944, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+220, 11603, 30, -857.292, -152.277, 63.2114, 4.18879, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+221, 11603, 30, -853.357, -0.696194, 72.0655, 0.994838, 120, 120, 0, 0, 0, 0), -- Whitewhisker Digger
(@CGUID+222, 11604, 30, -844.764, -92.6998, 68.6054, 3.46716, 430, 430, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+223, 11604, 30, -954.622, -110.958, 80.7911, 6.24828, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+224, 11604, 30, -951.477, -53.9647, 80.0235, 5.32325, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+225, 11604, 30, -946.812, -126.04, 78.8601, 5.15265, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+226, 11604, 30, -940.689, -140.707, 79.9225, 2.79253, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+227, 11604, 30, -933.954, -159.632, 60.778, 2.56563, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+228, 11604, 30, -922.537, -130.291, 61.3756, 4.95674, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+229, 11604, 30, -915.862, -151.74, 76.9427, 0.942478, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+230, 11604, 30, -888.321, -159.831, 62.5303, 1.20428, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+231, 11604, 30, -874.361, -42.4751, 69.4316, 0.785398, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+232, 11604, 30, -873.19, -50.4899, 70.0568, -2.41288, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+233, 11604, 30, -868.511, -148.386, 62.3547, 3.57875, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+234, 11604, 30, -868.44, -121.649, 64.5056, 3.33358, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+235, 11604, 30, -868.324, -77.7196, 71.4768, 5.41052, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+236, 11604, 30, -859.846, -19.6549, 70.7304, 1.97222, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+237, 11604, 30, -828.05, -150.508, 62.2019, 2.14675, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+238, 11604, 30, -826.254, -58.6911, 72.0041, 3.68264, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+239, 11604, 30, -976.086, -44.1775, 76.029, 1.46608, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+240, 11604, 30, -971.864, -87.4223, 81.4954, 5.8294, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+241, 11604, 30, -966.551, -74.1111, 80.0243, 4.2129, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+242, 11604, 30, -958.509, -173.652, 77.9013, 6.24828, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+243, 11604, 30, -951.511, -181.242, 65.529, 4.39823, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+244, 11604, 30, -940.967, -186.243, 77.698, 1.28164, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+245, 11604, 30, -930.004, -65.0898, 79.077, 0.0581657, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+246, 11604, 30, -920.864, -40.2009, 78.256, 5.16617, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+247, 11604, 30, -919.089, -148.021, 62.0317, 2.59327, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+248, 11604, 30, -901.516, -116.329, 75.6876, 0.471239, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+249, 11604, 30, -897.864, -84.4348, 74.083, 3.00197, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+250, 11604, 30, -897.617, -52.0457, 71.9503, 4.36332, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+251, 11604, 30, -894.891, -153.951, 61.6827, 3.23569, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+252, 11604, 30, -893.933, -111.625, 75.6591, 4.22536, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+253, 11604, 30, -883.265, -152.854, 61.8384, 0.0941087, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+254, 11604, 30, -868.293, -147.243, 62.1097, 3.2056, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+255, 11604, 30, -867.501, -11.8709, 70.018, 6.14356, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+256, 11604, 30, -866.699, -147.54, 62.1646, 3.57878, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+257, 11604, 30, -866.566, -91.1916, 67.4414, 4.56707, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+258, 11604, 30, -857.272, -141.142, 61.7356, 4.17134, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+259, 11604, 30, -847.446, -98.0061, 68.5131, 3.24631, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+260, 11604, 30, -837.026, -140.729, 62.5141, 5.51524, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+261, 11604, 30, -824.204, -65.053, 72.3381, 3.01942, 120, 120, 0, 0, 0, 0), -- Whitewhisker Geomancer
(@CGUID+262, 11605, 30, -857.71, -91.4395, 68.5389, 6.08983, 430, 430, 0, 0, 0, 0), -- Whitewhisker Overseer
-- (@CGUID+263
(@CGUID+264, 11657, 30, 865.5541, -438.7354, 50.73334, 0.3233085, 430, 430, 0, 0, 0, 0), -- Morloch
-- (@CGUID+265 - 267
(@CGUID+268, 11677, 30, -848.9024, -92.93099, 68.63249, 3.333579, 430, 430, 0, 0, 0, 0), -- Taskmaster Snivvle
-- (@CGUID+269 - 279
(@CGUID+280, 11946, 30, -1370.883, -220.2078, 98.50992, 5.131268, 120, 120, 0, 0, 0, 0), -- Drek'Thar
-- (@CGUID+281
(@CGUID+282, 11947, 30, -545.2297, -165.3499, 57.01448, 6.003932, 86400, 86400, 0, 0, 0, 0), -- Captain Galvangar
-- (@CGUID+283
(@CGUID+284, 11948, 30, 722.4296, -10.99816, 50.70463, 3.420845, 120, 120, 0, 0, 0, 0), -- Vanndar Stormpike
-- (@CGUID+285
(@CGUID+286, 11949, 30, -57.78906, -286.5968, 15.64791, 6.021386, 86400, 86400, 0, 0, 0, 0), -- Captain Balinda Stonehearth
-- (@CGUID+287
(@CGUID+288, 11997, 30, 930.498, -520.7551, 93.7334, 1.832596, 120, 120, 0, 0, 0, 0), -- Stormpike Herald
-- (@CGUID+289
(@CGUID+290, 11998, 30, -1483.7078, -697.6837, 47.0681, 2.042022, 490, 490, 0, 0, 0, 0), -- Frostwolf Herald
-- (@CGUID+291 - 298
(@CGUID+299, 12050, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+300, 12050, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+301, 12050, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+302, 12050, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+303, 12050, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+304, 12050, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+305, 12050, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+306, 12050, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+307, 12050, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+308, 12050, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+309, 12050, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+310, 12050, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+311, 12050, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+312, 12050, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+313, 12050, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+314, 12050, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+315, 12050, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+316, 12050, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+317, 12050, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+318, 12050, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+319, 12050, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+320, 12050, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+321, 12050, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+322, 12050, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+323, 12050, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+324, 12050, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+325, 12050, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+326, 12050, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 0, 0, 0, 0), -- Stormpike Defender
(@CGUID+327, 12051, 30, -747.5397, -346.3601, 66.77458, 0.171959, 430, 430, 0, 0, 0, 2), -- Frostwolf Legionnaire
(@CGUID+328, 12051, 30, -1218.4, -301.2, 68.3, 0.8, 430, 430, 0, 0, 0, 2), -- Frostwolf Legionnaire
(@CGUID+329, 14285, 30, -1369.2, -539.982, 55.0697, 1.70821, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard	// 14285,14282 in this section not Sniff
(@CGUID+330, 14285, 30, -1365.98, -538.793, 54.1439, 1.72784, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+331, 14285, 30, -1375.79, -533.335, 55.2052, 6.06324, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+332, 14285, 30, -1374.2, -530.111, 54.1728, 6.05538, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+333, 14285, 30, -1423.32, -591.371, 52.3361, 2.90985, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+334, 14285, 30, -1425.19, -596.139, 51.62, 2.57212, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+335, 14285, 30, -1442.45, -589.847, 51.2054, 6.17708, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+336, 14285, 30, -1442.47, -594.734, 51.1442, 0.447586, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+337, 14285, 30, -1448.26, -613.943, 51.3533, 0.632191, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+338, 14285, 30, -1451.7, -609.035, 51.3421, 0.632196, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+339, 14285, 30, -1447.89, -602.657, 51.2134, 4.48457, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+340, 14285, 30, -1452.09, -601.524, 51.2353, 4.97937, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+341, 14285, 30, -1509.09, -708.758, 48.1612, 5.67053, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+342, 14285, 30, -1504.33, -715.092, 48.4673, 1.87313, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+343, 14285, 30, -1502, -713.391, 47.8395, 2.19514, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+344, 14285, 30, -1506.96, -706.502, 47.7388, 5.31317, 430, 430, 0, 0, 0, 0), -- Frostwolf Battleguard
(@CGUID+345, 14285, 30, -1491.89, -701.584, 46.8155, 0.820728, 430, 430, 0, 0, 0, 2), -- Frostwolf Battleguard
(@CGUID+346, 14282, 30, -1494.16, -701.661, 46.8447, 0.793239, 300, 300, 0, 0, 0, 0), -- Frostwolf Bloodhound
(@CGUID+347, 14282, 30, -1492, -703.365, 46.8902, 0.793239, 300, 300, 0, 0, 0, 0), -- Frostwolf Bloodhound
-- (@CGUID+348 - 354
(@CGUID+355, 12053, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+356, 12053, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+357, 12053, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+358, 12053, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+359, 12053, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+360, 12053, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+361, 12053, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+362, 12053, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+363, 12053, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+364, 12053, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+365, 12053, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+366, 12053, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+367, 12053, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+368, 12053, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+369, 12053, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+370, 12053, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+371, 12053, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+372, 12053, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+373, 12053, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+374, 12053, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+375, 12053, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+376, 12053, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+377, 12053, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+378, 12053, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+379, 12053, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+380, 12053, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+381, 12053, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+382, 12053, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 0, 0, 0, 0), -- Frostwolf Guardian
(@CGUID+383, 12096, 30, 587.6331, -45.98156, 37.5438, 5.811946, 430, 430, 0, 0, 0, 0), -- Stormpike Quartermaster
(@CGUID+384, 12097, 30, -1293.787, -194.4072, 72.43979, 5.846853, 430, 430, 0, 0, 0, 0), -- Frostwolf Quartermaster
(@CGUID+385, 12121, 30, -1376.312, -219.3085, 99.45462, 4.607669, 1785, 1785, 0, 0, 0, 0), -- Drakan
(@CGUID+386, 12122, 30, -1366.196, -216.0742, 99.45422, 5.462881, 1785, 1785, 0, 0, 0, 0), -- Duros
(@CGUID+387, 12127, 30, 303.1592, -380.0963, 0.7728219, 3.231725, 300, 300, 0, 0, 0, 2), -- Stormpike Guardsman
-- (@CGUID+388, 12127, 30, 303.0243, -378.1007, 1.021304, 3.231545, 300, 300, 0, 0, 0, 0), -- Stormpike Guardsman maybe substitues @CGUID+642,@CGUID+643 at some point or was duplicate of @CGUID+387
(@CGUID+389, 12127, 30, 494.7951, -342.0404, -1.140102, 0.6951302, 300, 300, 0, 0, 0, 2), -- Stormpike Guardsman
(@CGUID+390, 12127, 30, 493.494, -340.5215, -1.045044, 0.6952695, 300, 300, 0, 0, 0, 0), -- Stormpike Guardsman
(@CGUID+391, 12127, 30, 697.8643, -433.238, 62.79142, 1.657762, 300, 300, 0, 0, 0, 2), -- Stormpike Guardsman
(@CGUID+392, 12127, 30, 695.8718, -433.4117, 62.85433, 1.736655, 300, 300, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+393 - 399
(@CGUID+400, 13078, 30, 880.2361, -444.5867, 54.60632, 2.460914, 120, 120, 0, 0, 0, 0), -- Umi Thorson
(@CGUID+401, 13079, 30, 879.2206, -443.2573, 54.64777, 1.832596, 120, 120, 0, 0, 0, 0), -- Keetar
(@CGUID+402, 13080, 30, 955.812, -440.302, 55.3411, 3.19395, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+403, 13080, 30, 937.378, -377.816, 65.3919, 3.56047, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+404, 13080, 30, 925.059, -331.347, 65.7564, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+405, 13080, 30, 922.918, -396.634, 60.3942, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+406, 13080, 30, 909.99, -462.154, 59.0811, 3.7001, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+407, 13080, 30, 907.893, -388.787, 61.7923, 5.74213, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+408, 13080, 30, 898.801, -437.105, 58.5266, 0.959931, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+409, 13080, 30, 884.237, -407.597, 61.566, 0.820305, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+410, 13080, 30, 880.744, -344.683, 66.4086, 3.4644, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+411, 13080, 30, 876.047, -341.857, 65.8743, 4.45059, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+412, 13080, 30, 874.674, -402.077, 61.7573, 0.26341, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+413, 13080, 30, 871.914, -404.209, 62.1269, 6.06163, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+414, 13080, 30, 871.606, -403.665, 62.0795, 0.765774, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+415, 13080, 30, 871.561, -404.114, 62.1297, 0.00981727, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+416, 13080, 30, 871.528, -404.248, 62.1455, 0.498032, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+417, 13080, 30, 871.493, -404.122, 62.1331, 5.65727, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+418, 13080, 30, 871.282, -403.843, 62.1108, 0.788382, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+419, 13080, 30, 868.294, -392.395, 61.4772, 4.38685, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+420, 13080, 30, 868.256, -392.363, 61.4803, 0.732738, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+421, 13080, 30, 867.804, -392.51, 61.5089, 2.30167, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+422, 13080, 30, 867.612, -392.371, 61.524, 2.86149, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+423, 13080, 30, 858.593, -439.614, 50.2184, 0.872665, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+424, 13080, 30, 851.471, -362.52, 47.314, 4.06662, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+425, 13080, 30, 846.939, -347.279, 66.2876, 0.942478, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+426, 13080, 30, 842.08, -421.775, 48.2659, 1.0821, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+427, 13080, 30, 838.358, -371.212, 63.3299, 4.04916, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+428, 13080, 30, 827.57, -417.483, 48.4538, 1.49237, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+429, 13080, 30, 827.012, -457.397, 48.9331, 2.35619, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+430, 13080, 30, 825.535, -322.373, 63.9357, 4.76475, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+431, 13080, 30, 867.635, -443.605, 51.3347, 1.38626, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+432, 13080, 30, 957.293, -455.039, 56.7395, 5.79449, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+433, 13080, 30, 950.077, -326.672, 61.6552, 5.48033, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+434, 13080, 30, 936.692, -356.78, 65.9835, 2.75762, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+435, 13080, 30, 926.475, -419.345, 56.1833, 2.0944, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+436, 13080, 30, 924.729, -397.453, 60.213, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+437, 13080, 30, 902.195, -475.891, 58.312, 1.39626, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+438, 13080, 30, 897.464, -338.758, 68.1715, 2.94961, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+439, 13080, 30, 884.237, -407.597, 61.566, 0.820305, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+440, 13080, 30, 882.517, -344.111, 66.7887, 3.46962, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+441, 13080, 30, 881.437, -400.254, 61.2028, 0.263427, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+442, 13080, 30, 880.156, -400.678, 61.3113, 3.41373, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+443, 13080, 30, 877.989, -418.051, 52.9753, 4.46804, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+444, 13080, 30, 871.212, -404.12, 62.1433, 3.6554, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+445, 13080, 30, 871.036, -404.119, 62.2237, 4.50295, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+446, 13080, 30, 857.396, -395.766, 61.263, 4.78684, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+447, 13080, 30, 857.276, -395.395, 61.2418, 0.0845553, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+448, 13080, 30, 857.231, -394.577, 61.2174, 1.96817, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+449, 13080, 30, 857.108, -395.682, 61.2317, 4.87022, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+450, 13080, 30, 856.709, -395.28, 61.1814, 2.54913, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+451, 13080, 30, 850.922, -390.399, 60.8771, 2.85405, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+452, 13080, 30, 847.556, -388.228, 60.9438, 2.56872, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+453, 13080, 30, 842.031, -384.663, 61.6028, 2.56871, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+454, 13080, 30, 832.035, -389.301, 47.5567, 2.11185, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+455, 13080, 30, 827.415, -419.468, 48.3322, 1.49232, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+456, 13080, 30, 826.402, -349.454, 47.2722, 1.51844, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+457, 13080, 30, 817.83, -455.715, 48.4207, 0.925025, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
(@CGUID+458, 13080, 30, 808.953, -325.964, 52.4043, 3.01942, 120, 120, 0, 0, 0, 0), -- Irondeep Guard
-- (@CGUID+459
(@CGUID+460, 13086, 30, -849.4902, -93.53114, 68.59335, 3.700098, 120, 120, 0, 0, 0, 0), -- Aggi Rumblestomp
-- (@CGUID+461
(@CGUID+462, 13088, 30, -849.4163, -93.42789, 68.51978, 3.228859, 430, 430, 0, 0, 0, 0), -- Masha Swiftcut
(@CGUID+463, 13089, 30, -963.547, -210.22, 69.1687, 4.40689, 430, 430, 5, 0, 0, 1), -- Coldmine Guard
(@CGUID+464, 13089, 30, -970.628, -204.141, 68.7334, 4.6625, 430, 430, 5, 0, 0, 1), -- Coldmine Guard
(@CGUID+465, 13096, 30, -956.217, -190.857, 66.2534, 1.21015, 430, 430, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+466, 13096, 30, -954.622, -110.958, 80.7911, 6.24828, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+467, 13096, 30, -951.477, -53.9647, 80.0235, 5.32325, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+468, 13096, 30, -946.812, -126.04, 78.8601, 5.15265, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+469, 13096, 30, -940.689, -140.707, 79.9225, 2.79253, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+470, 13096, 30, -933.954, -159.632, 60.778, 2.56563, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+471, 13096, 30, -922.537, -130.291, 61.3756, 4.95674, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+472, 13096, 30, -915.862, -151.74, 76.9427, 0.942478, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+473, 13096, 30, -888.321, -159.831, 62.5303, 1.20428, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+474, 13096, 30, -874.361, -42.4751, 69.4316, 0.785398, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+475, 13096, 30, -873.19, -50.4899, 70.0568, -2.41288, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+476, 13096, 30, -868.511, -148.386, 62.3547, 3.57875, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+477, 13096, 30, -868.44, -121.649, 64.5056, 3.33358, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+478, 13096, 30, -868.324, -77.7196, 71.4768, 5.41052, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+479, 13096, 30, -859.846, -19.6549, 70.7304, 1.97222, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+480, 13096, 30, -828.05, -150.508, 62.2019, 2.14675, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+481, 13096, 30, -826.254, -58.6911, 72.0041, 3.68264, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+482, 13096, 30, -976.086, -44.1775, 76.029, 1.46608, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+483, 13096, 30, -971.864, -87.4223, 81.4954, 5.8294, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+484, 13096, 30, -966.551, -74.1111, 80.0243, 4.2129, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+485, 13096, 30, -958.509, -173.652, 77.9013, 6.24828, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+486, 13096, 30, -951.511, -181.242, 65.529, 4.39823, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+487, 13096, 30, -940.967, -186.243, 77.698, 1.28164, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+488, 13096, 30, -930.004, -65.0898, 79.077, 0.0581657, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+489, 13096, 30, -920.864, -40.2009, 78.256, 5.16617, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+490, 13096, 30, -919.089, -148.021, 62.0317, 2.59327, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+491, 13096, 30, -901.516, -116.329, 75.6876, 0.471239, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+492, 13096, 30, -897.864, -84.4348, 74.083, 3.00197, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+493, 13096, 30, -897.617, -52.0457, 71.9503, 4.36332, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+494, 13096, 30, -894.891, -153.951, 61.6827, 3.23569, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+495, 13096, 30, -893.933, -111.625, 75.6591, 4.22536, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+496, 13096, 30, -883.265, -152.854, 61.8384, 0.0941087, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+497, 13096, 30, -868.293, -147.243, 62.1097, 3.2056, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+498, 13096, 30, -867.501, -11.8709, 70.018, 6.14356, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+499, 13096, 30, -866.699, -147.54, 62.1646, 3.57878, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+500, 13096, 30, -866.566, -91.1916, 67.4414, 4.56707, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+501, 13096, 30, -857.272, -141.142, 61.7356, 4.17134, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+502, 13096, 30, -847.446, -98.0061, 68.5131, 3.24631, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+503, 13096, 30, -837.026, -140.729, 62.5141, 5.51524, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+504, 13096, 30, -824.204, -65.053, 72.3381, 3.01942, 120, 120, 0, 0, 0, 0), -- Coldmine Explorer
(@CGUID+505, 13097, 30, -987.358, -262.496, 65.3914, 0.510012, 430, 430, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+506, 13097, 30, -954.622, -110.958, 80.7911, 6.24828, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+507, 13097, 30, -951.477, -53.9647, 80.0235, 5.32325, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+508, 13097, 30, -946.812, -126.04, 78.8601, 5.15265, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+509, 13097, 30, -940.689, -140.707, 79.9225, 2.79253, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+510, 13097, 30, -933.954, -159.632, 60.778, 2.56563, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+511, 13097, 30, -922.537, -130.291, 61.3756, 4.95674, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+512, 13097, 30, -915.862, -151.74, 76.9427, 0.942478, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+513, 13097, 30, -888.321, -159.831, 62.5303, 1.20428, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+514, 13097, 30, -874.361, -42.4751, 69.4316, 0.785398, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+515, 13097, 30, -873.19, -50.4899, 70.0568, -2.41288, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+516, 13097, 30, -868.511, -148.386, 62.3547, 3.57875, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+517, 13097, 30, -868.44, -121.649, 64.5056, 3.33358, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+518, 13097, 30, -868.324, -77.7196, 71.4768, 5.41052, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+519, 13097, 30, -859.846, -19.6549, 70.7304, 1.97222, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+520, 13097, 30, -828.05, -150.508, 62.2019, 2.14675, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+521, 13097, 30, -826.254, -58.6911, 72.0041, 3.68264, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+522, 13097, 30, -976.086, -44.1775, 76.029, 1.46608, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+523, 13097, 30, -971.864, -87.4223, 81.4954, 5.8294, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+524, 13097, 30, -966.551, -74.1111, 80.0243, 4.2129, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+525, 13097, 30, -958.509, -173.652, 77.9013, 6.24828, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+526, 13097, 30, -951.511, -181.242, 65.529, 4.39823, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+527, 13097, 30, -940.967, -186.243, 77.698, 1.28164, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+528, 13097, 30, -930.004, -65.0898, 79.077, 0.0581657, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+529, 13097, 30, -920.864, -40.2009, 78.256, 5.16617, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+530, 13097, 30, -919.089, -148.021, 62.0317, 2.59327, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+531, 13097, 30, -901.516, -116.329, 75.6876, 0.471239, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+532, 13097, 30, -897.864, -84.4348, 74.083, 3.00197, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+533, 13097, 30, -897.617, -52.0457, 71.9503, 4.36332, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+534, 13097, 30, -894.891, -153.951, 61.6827, 3.23569, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+535, 13097, 30, -893.933, -111.625, 75.6591, 4.22536, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+536, 13097, 30, -883.265, -152.854, 61.8384, 0.0941087, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+537, 13097, 30, -868.293, -147.243, 62.1097, 3.2056, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+538, 13097, 30, -867.501, -11.8709, 70.018, 6.14356, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+539, 13097, 30, -866.699, -147.54, 62.1646, 3.57878, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+540, 13097, 30, -866.566, -91.1916, 67.4414, 4.56707, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+541, 13097, 30, -857.272, -141.142, 61.7356, 4.17134, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+542, 13097, 30, -847.446, -98.0061, 68.5131, 3.24631, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+543, 13097, 30, -837.026, -140.729, 62.5141, 5.51524, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+544, 13097, 30, -824.204, -65.053, 72.3381, 3.01942, 120, 120, 0, 0, 0, 0), -- Coldmine Surveyor
(@CGUID+545, 13099, 30, 955.812, -440.302, 55.3411, 3.19395, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+546, 13099, 30, 937.378, -377.816, 65.3919, 3.56047, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+547, 13099, 30, 925.059, -331.347, 65.7564, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+548, 13099, 30, 922.918, -396.634, 60.3942, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+549, 13099, 30, 909.99, -462.154, 59.0811, 3.7001, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+550, 13099, 30, 907.893, -388.787, 61.7923, 5.74213, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+551, 13099, 30, 898.801, -437.105, 58.5266, 0.959931, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+552, 13099, 30, 884.237, -407.597, 61.566, 0.820305, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+553, 13099, 30, 880.744, -344.683, 66.4086, 3.4644, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+554, 13099, 30, 876.047, -341.857, 65.8743, 4.45059, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+555, 13099, 30, 874.674, -402.077, 61.7573, 0.26341, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+556, 13099, 30, 871.914, -404.209, 62.1269, 6.06163, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+557, 13099, 30, 871.606, -403.665, 62.0795, 0.765774, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+558, 13099, 30, 871.561, -404.114, 62.1297, 0.00981727, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+559, 13099, 30, 871.528, -404.248, 62.1455, 0.498032, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+560, 13099, 30, 871.493, -404.122, 62.1331, 5.65727, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+561, 13099, 30, 871.282, -403.843, 62.1108, 0.788382, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+562, 13099, 30, 868.294, -392.395, 61.4772, 4.38685, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+563, 13099, 30, 868.256, -392.363, 61.4803, 0.732738, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+564, 13099, 30, 867.804, -392.51, 61.5089, 2.30167, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+565, 13099, 30, 867.612, -392.371, 61.524, 2.86149, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+566, 13099, 30, 858.593, -439.614, 50.2184, 0.872665, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+567, 13099, 30, 851.471, -362.52, 47.314, 4.06662, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+568, 13099, 30, 846.939, -347.279, 66.2876, 0.942478, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+569, 13099, 30, 842.08, -421.775, 48.2659, 1.0821, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+570, 13099, 30, 838.358, -371.212, 63.3299, 4.04916, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+571, 13099, 30, 827.57, -417.483, 48.4538, 1.49237, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+572, 13099, 30, 827.012, -457.397, 48.9331, 2.35619, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+573, 13099, 30, 825.535, -322.373, 63.9357, 4.76475, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+574, 13099, 30, 867.635, -443.605, 51.3347, 1.38626, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+575, 13099, 30, 957.293, -455.039, 56.7395, 5.79449, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+576, 13099, 30, 950.077, -326.672, 61.6552, 5.48033, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+577, 13099, 30, 936.692, -356.78, 65.9835, 2.75762, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+578, 13099, 30, 926.475, -419.345, 56.1833, 2.0944, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+579, 13099, 30, 924.729, -397.453, 60.213, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+580, 13099, 30, 902.195, -475.891, 58.312, 1.39626, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+581, 13099, 30, 897.464, -338.758, 68.1715, 2.94961, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+582, 13099, 30, 884.237, -407.597, 61.566, 0.820305, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+583, 13099, 30, 882.517, -344.111, 66.7887, 3.46962, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+584, 13099, 30, 881.437, -400.254, 61.2028, 0.263427, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+585, 13099, 30, 880.156, -400.678, 61.3113, 3.41373, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+586, 13099, 30, 877.989, -418.051, 52.9753, 4.46804, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+587, 13099, 30, 871.212, -404.12, 62.1433, 3.6554, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+588, 13099, 30, 871.036, -404.119, 62.2237, 4.50295, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+589, 13099, 30, 857.396, -395.766, 61.263, 4.78684, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+590, 13099, 30, 857.276, -395.395, 61.2418, 0.0845553, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+591, 13099, 30, 857.231, -394.577, 61.2174, 1.96817, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+592, 13099, 30, 857.108, -395.682, 61.2317, 4.87022, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+593, 13099, 30, 856.709, -395.28, 61.1814, 2.54913, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+594, 13099, 30, 850.922, -390.399, 60.8771, 2.85405, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+595, 13099, 30, 847.556, -388.228, 60.9438, 2.56872, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+596, 13099, 30, 842.031, -384.663, 61.6028, 2.56871, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+597, 13099, 30, 832.035, -389.301, 47.5567, 2.11185, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+598, 13099, 30, 827.415, -419.468, 48.3322, 1.49232, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+599, 13099, 30, 826.402, -349.454, 47.2722, 1.51844, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+600, 13099, 30, 817.83, -455.715, 48.4207, 0.925025, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+601, 13099, 30, 808.953, -325.964, 52.4043, 3.01942, 120, 120, 0, 0, 0, 0), -- Irondeep Explorer
(@CGUID+602, 13116, 30, 643.3094, 37.69201, 69.06236, 1.570796, 120, 120, 0, 0, 0, 0), -- Alliance Spirit Guide
(@CGUID+603, 13116, 30, 672.9843, -367.5333, 29.86406, 5.183628, 120, 120, 0, 0, 0, 0), -- Alliance Spirit Guide
(@CGUID+604, 13116, 30, 73.26048, -488.1827, 48.88459, 4.764749, 120, 120, 0, 0, 0, 0), -- Alliance Spirit Guide
(@CGUID+605, 13116, 30, -160.6382, 18.41368, 77.21405, 1.37881, 120, 120, 0, 0, 0, 0), -- Alliance Spirit Guide
(@CGUID+606, 13116, 30, -540.7137, -397.2314, 50.10065, 5.5676, 120, 120, 0, 0, 0, 0), -- Alliance Spirit Guide
(@CGUID+607, 13116, 30, -1089.898, -268.6404, 57.1036, 1.53589, 120, 120, 0, 0, 0, 0), -- Alliance Spirit Guide
(@CGUID+608, 13116, 30, -1488.143, -329.2055, 100.8532, 5.267793, 120, 120, 0, 0, 0, 0), -- Alliance Spirit Guide
(@CGUID+609, 13117, 30, 643.3094, 37.69201, 69.06236, 1.570796, 120, 120, 0, 0, 0, 0), -- Horde Spirit Guide
(@CGUID+610, 13117, 30, 673.1029, -367.5822, 29.86406, 5.166174, 120, 120, 0, 0, 0, 0), -- Horde Spirit Guide
(@CGUID+611, 13117, 30, 73.26048, -488.1827, 48.88459, 4.764749, 120, 120, 0, 0, 0, 0), -- Horde Spirit Guide
(@CGUID+612, 13117, 30, -160.6382, 18.41368, 77.21405, 1.37881, 120, 120, 0, 0, 0, 0), -- Horde Spirit Guide
(@CGUID+613, 13117, 30, -540.7137, -397.2314, 50.10065, 5.5676, 120, 120, 0, 0, 0, 0), -- Horde Spirit Guide
(@CGUID+614, 13117, 30, -1089.447, -268.9552, 57.08559, 1.570796, 120, 120, 0, 0, 0, 0), -- Horde Spirit Guide
(@CGUID+615, 13117, 30, -1489.474, -329.7788, 100.8793, 3.577925, 120, 120, 0, 0, 0, 0), -- Horde Spirit Guide
-- (@CGUID+616 - 628
(@CGUID+629, 13176, 30, -1251.503, -316.3269, 62.65648, 5.026548, 6300, 6300, 0, 0, 0, 0), -- Smith Regzar
(@CGUID+630, 13179, 30, 210.875, -357.3596, 56.45859, 5.67232, 430, 430, 0, 0, 0, 0), -- Wing Commander Guse -> Moves to -1331.997, -331.2427, 91.26306, 1.500983
(@CGUID+631, 13180, 30, 320.4858, -502.6451, 71.23212, 5.934119, 430, 430, 0, 0, 0, 0), -- Wing Commander Jeztor -> Moves to -1334.989, -330.9367, 91.22141, 0.2617994
(@CGUID+632, 13181, 30, 674.4692, -144.5338, 63.73538, 5.61996, 2250, 2250, 0, 0, 0, 0), -- Wing Commander Mulverick -> Moves to -1332.092, -328.9088, 91.26306, 1.902409
(@CGUID+633, 13216, 30, 569.9832, -94.99924, 37.94191, 1.396263, 430, 430, 0, 0, 0, 0), -- Gaelden Hammersmith
(@CGUID+634, 13218, 30, -1244.924, -308.9155, 63.2525, 1.623156, 430, 430, 0, 0, 0, 0), -- Grunnda Wolfheart
(@CGUID+635, 13236, 30, -1319.564, -342.6753, 60.34038, 1.204277, 6300, 6300, 0, 0, 0, 0), -- Primalist Thurloga -> Moves to -360.3185, -133.3459, 26.50991, 5.585053
(@CGUID+636, 13257, 30, 647.6097, -61.15484, 41.74047, 4.24115, 6300, 6300, 0, 0, 0, 0), -- Murgot Deepforge
(@CGUID+637, 13284, 30, -1317.614, -342.8535, 60.37259, 2.478368, 430, 430, 0, 0, 0, 0), -- Frostwolf Shaman
(@CGUID+638, 13284, 30, -1319.314, -344.4753, 60.38251, 1.727876, 430, 430, 0, 0, 0, 0), -- Frostwolf Shaman
(@CGUID+639, 13284, 30, -1321.641, -343.7296, 60.48333, 1.012291, 430, 430, 0, 0, 0, 0), -- Frostwolf Shaman
(@CGUID+640, 14283, 30, 940.2, -512.4, 94.1, 3.6, 300, 300, 0, 0, 0, 0), -- Stormpike Owl
(@CGUID+641, 14283, 30, 937.2, -507.8, 93.9, 3.6, 300, 300, 0, 0, 0, 0), -- Stormpike Owl
(@CGUID+642, 14283, 30, 305.8, -378.8, 0.2, 3.14, 300, 300, 0, 0, 0, 0), -- Stormpike Owl
(@CGUID+643, 14283, 30, 305.8, -381.3, 0.1, 3.14, 300, 300, 0, 0, 0, 0), -- Stormpike Owl
-- (@CGUID+640 - 643
(@CGUID+644, 13316, 30, -968.23, -254.995, 65.8186, 5.01636, 430, 430, 5, 0, 0, 1), -- Coldmine Peon
(@CGUID+645, 13316, 30, -970.389, -223.088, 68.4555, 5.98594, 430, 430, 5, 0, 0, 1), -- Coldmine Peon
(@CGUID+646, 13316, 30, -917.648, -46.8922, 77.0872, 5.27089, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+647, 13316, 30, -912.689, -45.4494, 76.2277, 4.60767, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+648, 13316, 30, -905.455, -84.5179, 75.3642, 3.29867, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+649, 13316, 30, -904.332, -111.509, 75.5925, 2.47837, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+650, 13316, 30, -904.27, -160.419, 61.9876, 3.61192, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+651, 13316, 30, -904.023, -90.4558, 75.3706, 3.40339, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+652, 13316, 30, -978.678, -37.3136, 75.8364, 2.84489, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+653, 13316, 30, -973.076, -36.5013, 77.5047, 1.0821, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+654, 13316, 30, -963.951, -87.734, 81.5555, 0.575959, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+655, 13316, 30, -961.941, -90.7252, 81.6629, 0.820305, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+656, 13316, 30, -957.623, -186.582, 66.6021, 1.95477, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+657, 13316, 30, -952.476, -179.778, 78.6771, 4.5204, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+658, 13316, 30, -950.427, -115.007, 79.6127, 3.68264, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+659, 13316, 30, -950.25, -151.95, 79.4598, -1.81423, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+660, 13316, 30, -950.169, -188.099, 66.6184, 5.55015, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+661, 13316, 30, -949.944, -142.977, 80.5382, 2.70526, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+662, 13316, 30, -947.854, -170.5, 79.7618, 0.942478, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+663, 13316, 30, -946.738, -139.567, 80.0904, 2.3911, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+664, 13316, 30, -945.503, -65.0654, 79.7907, 5.02655, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+665, 13316, 30, -943.678, -110.986, 80.2557, 0.959931, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+666, 13316, 30, -942.993, -56.9881, 79.8915, 5.65487, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+667, 13316, 30, -938.197, -155.838, 61.3111, 1.65806, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+668, 13316, 30, -930.488, -214.524, 72.1431, 2.1236, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+669, 13316, 30, -929.947, -154.449, 61.5084, 1.67552, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+670, 13316, 30, -927.412, -135.313, 61.1987, 3.29867, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+671, 13316, 30, -920.677, -156.859, 62.8033, 3.15306, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+672, 13316, 30, -916.75, -136.094, 62.2357, 0.0698132, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+673, 13316, 30, -915.319, -132.718, 62.562, 1.16984, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+674, 13316, 30, -913.589, -146.794, 76.9366, 1.8675, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+675, 13316, 30, -907.572, -148.937, 76.6898, 4.76475, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+676, 13316, 30, -902.02, -64.6174, 73.9707, 1.19169, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+677, 13316, 30, -899.489, -61.7252, 73.2498, 5.09636, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+678, 13316, 30, -894.792, -127.141, 75.3834, 6.14356, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+679, 13316, 30, -892.408, -162.525, 64.1212, 2.69884, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+680, 13316, 30, -892.326, -123.158, 76.0318, 5.5676, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+681, 13316, 30, -888.468, -148.462, 61.8012, 1.65806, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+682, 13316, 30, -883.268, -159.738, 63.5311, 5.20108, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+683, 13316, 30, -877.76, -118.07, 65.215, 2.94961, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+684, 13316, 30, -876.792, -128.646, 64.1045, 3.40339, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+685, 13316, 30, -874.901, -36.6579, 69.4246, 2.00713, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+686, 13316, 30, -874.856, -151.351, 62.7537, 3.57875, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+687, 13316, 30, -872.135, -150.08, 62.7513, 3.57201, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+688, 13316, 30, -870.288, -149.217, 62.5413, 3.56624, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+689, 13316, 30, -870.03, -6.27443, 70.3867, 2.3911, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+690, 13316, 30, -869.023, -82.2118, 69.5848, 3.22886, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+691, 13316, 30, -866.354, -40.2455, 70.842, 0.0698132, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+692, 13316, 30, -865.305, -152.302, 63.5044, 4.86947, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+693, 13316, 30, -861.926, -79.0519, 71.4178, 0.20944, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+694, 13316, 30, -857.292, -152.277, 63.2114, 4.18879, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+695, 13316, 30, -853.357, -0.696194, 72.0655, 0.994838, 120, 120, 0, 0, 0, 0), -- Coldmine Peon
(@CGUID+696, 13317, 30, -946.072, -54.0555, 79.8627, 3.79263, 430, 430, 5, 0, 0, 1), -- Coldmine Miner
(@CGUID+697, 13317, 30, -859.583, -11.9699, 70.8221, 2.01683, 430, 430, 5, 0, 0, 1), -- Coldmine Miner
(@CGUID+698, 13317, 30, -964.497, -93.9877, 81.4219, 5.02074, 430, 430, 5, 0, 0, 1), -- Coldmine Miner
(@CGUID+699, 13317, 30, -947.939, -181.602, 64.8921, 3.99765, 430, 430, 5, 0, 0, 1), -- Coldmine Miner
(@CGUID+700, 13317, 30, -897.423, -113.117, 75.4753, 5.50678, 430, 430, 5, 0, 0, 1), -- Coldmine Miner
(@CGUID+701, 13317, 30, -917.648, -46.8922, 77.0872, 5.27089, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+702, 13317, 30, -912.689, -45.4494, 76.2277, 4.60767, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+703, 13317, 30, -905.455, -84.5179, 75.3642, 3.29867, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+704, 13317, 30, -904.332, -111.509, 75.5925, 2.47837, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+705, 13317, 30, -904.27, -160.419, 61.9876, 3.61192, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+706, 13317, 30, -904.023, -90.4558, 75.3706, 3.40339, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+707, 13317, 30, -978.678, -37.3136, 75.8364, 2.84489, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+708, 13317, 30, -973.076, -36.5013, 77.5047, 1.0821, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+709, 13317, 30, -963.951, -87.734, 81.5555, 0.575959, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+710, 13317, 30, -961.941, -90.7252, 81.6629, 0.820305, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+711, 13317, 30, -957.623, -186.582, 66.6021, 1.95477, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+712, 13317, 30, -952.476, -179.778, 78.6771, 4.5204, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+713, 13317, 30, -950.427, -115.007, 79.6127, 3.68264, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+714, 13317, 30, -950.25, -151.95, 79.4598, -1.81423, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+715, 13317, 30, -950.169, -188.099, 66.6184, 5.55015, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+716, 13317, 30, -949.944, -142.977, 80.5382, 2.70526, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+717, 13317, 30, -947.854, -170.5, 79.7618, 0.942478, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+718, 13317, 30, -946.738, -139.567, 80.0904, 2.3911, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+719, 13317, 30, -945.503, -65.0654, 79.7907, 5.02655, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+720, 13317, 30, -943.678, -110.986, 80.2557, 0.959931, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+721, 13317, 30, -942.993, -56.9881, 79.8915, 5.65487, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+722, 13317, 30, -938.197, -155.838, 61.3111, 1.65806, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+723, 13317, 30, -930.488, -214.524, 72.1431, 2.1236, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+724, 13317, 30, -929.947, -154.449, 61.5084, 1.67552, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+725, 13317, 30, -927.412, -135.313, 61.1987, 3.29867, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+726, 13317, 30, -920.677, -156.859, 62.8033, 3.15306, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+727, 13317, 30, -916.75, -136.094, 62.2357, 0.0698132, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+728, 13317, 30, -915.319, -132.718, 62.562, 1.16984, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+729, 13317, 30, -913.589, -146.794, 76.9366, 1.8675, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+730, 13317, 30, -907.572, -148.937, 76.6898, 4.76475, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+731, 13317, 30, -902.02, -64.6174, 73.9707, 1.19169, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+732, 13317, 30, -899.489, -61.7252, 73.2498, 5.09636, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+733, 13317, 30, -894.792, -127.141, 75.3834, 6.14356, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+734, 13317, 30, -892.408, -162.525, 64.1212, 2.69884, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+735, 13317, 30, -892.326, -123.158, 76.0318, 5.5676, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+736, 13317, 30, -888.468, -148.462, 61.8012, 1.65806, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+737, 13317, 30, -883.268, -159.738, 63.5311, 5.20108, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+738, 13317, 30, -877.76, -118.07, 65.215, 2.94961, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+739, 13317, 30, -876.792, -128.646, 64.1045, 3.40339, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+740, 13317, 30, -874.901, -36.6579, 69.4246, 2.00713, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+741, 13317, 30, -874.856, -151.351, 62.7537, 3.57875, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+742, 13317, 30, -872.135, -150.08, 62.7513, 3.57201, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+743, 13317, 30, -870.288, -149.217, 62.5413, 3.56624, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+744, 13317, 30, -870.03, -6.27443, 70.3867, 2.3911, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+745, 13317, 30, -869.023, -82.2118, 69.5848, 3.22886, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+746, 13317, 30, -866.354, -40.2455, 70.842, 0.0698132, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+747, 13317, 30, -865.305, -152.302, 63.5044, 4.86947, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+748, 13317, 30, -861.926, -79.0519, 71.4178, 0.20944, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+749, 13317, 30, -857.292, -152.277, 63.2114, 4.18879, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
(@CGUID+750, 13317, 30, -853.357, -0.696194, 72.0655, 0.994838, 120, 120, 0, 0, 0, 0), -- Coldmine Miner
-- (@CGUID+751 - 755
(@CGUID+756, 13326, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+757, 13326, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+758, 13326, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+759, 13326, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+760, 13326, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+761, 13326, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+762, 13326, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+763, 13326, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+764, 13326, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+765, 13326, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+766, 13326, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+767, 13326, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+768, 13326, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+769, 13326, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+770, 13326, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+771, 13326, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+772, 13326, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+773, 13326, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+774, 13326, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+775, 13326, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+776, 13326, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+777, 13326, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+778, 13326, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+779, 13326, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+780, 13326, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+781, 13326, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+782, 13326, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+783, 13326, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 5, 0, 0, 1), -- Seasoned Defender
(@CGUID+784, 13328, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+785, 13328, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+786, 13328, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+787, 13328, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+788, 13328, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+789, 13328, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+790, 13328, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+791, 13328, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+792, 13328, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+793, 13328, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+794, 13328, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+795, 13328, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+796, 13328, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+797, 13328, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+798, 13328, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+799, 13328, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+800, 13328, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+801, 13328, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+802, 13328, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+803, 13328, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+804, 13328, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+805, 13328, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+806, 13328, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+807, 13328, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+808, 13328, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+809, 13328, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+810, 13328, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
(@CGUID+811, 13328, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 5, 0, 0, 1), -- Seasoned Guardian
-- (@CGUID+812 - 815
(@CGUID+816, 13331, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+817, 13331, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+818, 13331, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+819, 13331, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+820, 13331, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+821, 13331, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+822, 13331, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+823, 13331, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+824, 13331, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+825, 13331, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+826, 13331, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+827, 13331, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+828, 13331, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+829, 13331, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+830, 13331, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+831, 13331, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+832, 13331, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+833, 13331, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+834, 13331, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+835, 13331, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+836, 13331, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+837, 13331, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+838, 13331, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+839, 13331, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+840, 13331, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+841, 13331, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+842, 13331, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+843, 13331, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 5, 0, 0, 1), -- Veteran Defender
(@CGUID+844, 13332, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+845, 13332, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+846, 13332, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+847, 13332, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+848, 13332, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+849, 13332, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+850, 13332, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+851, 13332, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+852, 13332, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+853, 13332, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+854, 13332, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+855, 13332, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+856, 13332, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+857, 13332, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+858, 13332, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+859, 13332, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+860, 13332, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+861, 13332, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+862, 13332, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+863, 13332, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+864, 13332, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+865, 13332, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+866, 13332, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+867, 13332, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+868, 13332, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+869, 13332, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+870, 13332, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
(@CGUID+871, 13332, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 5, 0, 0, 1), -- Veteran Guardian
-- (@CGUID+872
(@CGUID+873, 13358, 30, 569.3947, -101.0635, 52.82956, 5.305801, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+874, 13358, 30, 574.8497, -92.98416, 52.5869, 5.951573, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+875, 13358, 30, 575.4115, -83.59695, 52.36259, 6.265732, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+876, 13358, 30, 571.3523, -75.6582, 52.47898, 0.5235988, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+877, 13358, 30, 667.6901, -121.7611, 64.1092, 2.200822, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+878, 13358, 30, 662.2532, -129.105, 64.17944, 2.069839, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+879, 13358, 30, 661.2094, -138.8774, 64.22514, 4.275775, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+880, 13358, 30, 665.4814, -146.8566, 64.12708, 3.075164, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+881, 13358, 30, 226.3107, -369.1876, 57.05086, 5.986479, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+882, 13358, 30, 191.36, -369.899, 57.1524, 3.24631, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+883, 13358, 30, 215.518, -384.019, 56.9889, 5.09636, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+884, 13358, 30, 199.625, -382.177, 56.8691, 4.08407, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+885, 13358, 30, -172.851, -452.366, 40.8725, 3.31829, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+886, 13358, 30, -147.147, -435.053, 40.8022, 0.599238, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+887, 13358, 30, -169.456, -440.325, 40.985, 2.59101, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+888, 13358, 30, -163.494, -434.904, 41.0725, 1.84174, 120, 120, 0, 0, 0, 0), -- Stormpike Bowman
(@CGUID+889, 13359, 30, -573.5216, -271.8542, 75.00776, 3.999893, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+890, 13359, 30, -565.6158, -269.0514, 74.99518, 5.026548, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+891, 13359, 30, -562.8245, -261.0871, 74.9898, 5.95157, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+892, 13359, 30, -569.1758, -254.4456, 74.87714, 0.820305, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+893, 13359, 30, -762.7337, -371.2397, 90.87794, 5.427974, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+894, 13359, 30, -758.4671, -361.4209, 90.88779, 0.4575799, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+895, 13359, 30, -773.6427, -354.9776, 90.87726, 2.548181, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+896, 13359, 30, -772.9677, -373.499, 90.93112, 4.537856, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+897, 13359, 30, -1296.943, -308.4302, 107.3566, 1.713484, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+898, 13359, 30, -1292.781, -317.9507, 107.4113, 6.003932, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+899, 13359, 30, -1292.87, -316.9934, 113.8544, 0.03490658, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+900, 13359, 30, -1296.395, -308.9451, 113.8452, 1.27409, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+901, 13359, 30, -1300.62, -275.9303, 114.1352, 4.685695, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+902, 13359, 30, -1288.263, -264.9863, 107.6954, 5.556268, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+903, 13359, 30, -1286.344, -265.084, 114.1718, 5.969026, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+904, 13359, 30, -1292.327, -273.1024, 114.2346, 4.499137, 120, 120, 0, 0, 0, 0), -- Frostwolf Bowman
(@CGUID+905, 13396, 30, 971.671, -442.657, 57.6951, 3.1765, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+906, 13396, 30, 969.979, -457.148, 58.1119, 4.5204, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+907, 13396, 30, 958.692, -333.477, 63.2276, 5.77704, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+908, 13396, 30, 957.113, -325.92, 61.7589, 1.13446, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+909, 13396, 30, 948.25, -448.268, 56.9009, 5.60251, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+910, 13396, 30, 934.727, -385.802, 63.0344, 3.75246, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+911, 13396, 30, 931.751, -403.458, 59.6737, 5.63741, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+912, 13396, 30, 931.146, -359.666, 66.0294, 3.9619, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+913, 13396, 30, 929.702, -412.401, 56.8776, 5.89921, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+914, 13396, 30, 926.849, -379.074, 63.5286, 2.0944, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+915, 13396, 30, 921.972, -358.597, 66.4313, 2.93215, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+916, 13396, 30, 921.449, -341.981, 67.1264, 3.4383, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+917, 13396, 30, 921.1, -395.812, 60.4615, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+918, 13396, 30, 919.274, -394.986, 60.3478, 2.71696, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+919, 13396, 30, 916.852, -393.891, 60.1726, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+920, 13396, 30, 914.568, -326.21, 66.1733, 2.25147, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+921, 13396, 30, 913.064, -395.773, 60.1364, 4.41568, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+922, 13396, 30, 909.246, -474.576, 58.2067, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+923, 13396, 30, 909.246, -474.576, 58.2901, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+924, 13396, 30, 907.209, -428.267, 59.8065, 1.8675, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+925, 13396, 30, 905.973, -459.528, 58.7594, 1.37189, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+926, 13396, 30, 905.067, -396.074, 60.2085, 5.07891, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+927, 13396, 30, 901.809, -457.709, 59.0116, 3.52557, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+928, 13396, 30, 900.962, -427.44, 59.0842, 1.50098, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+929, 13396, 30, 897.929, -471.742, 59.7729, 2.54818, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+930, 13396, 30, 893.376, -343.171, 68.1499, 5.35816, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+931, 13396, 30, 890.584, -406.049, 61.1925, 5.67232, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+932, 13396, 30, 888.208, -332.564, 68.148, 1.93732, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+933, 13396, 30, 887.647, -391.537, 61.8734, 1.37881, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+934, 13396, 30, 885.109, -343.338, 67.0867, 3.78979, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+935, 13396, 30, 881.618, -419.948, 53.5228, 0.593412, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+936, 13396, 30, 878.675, -345.36, 66.1052, 3.45651, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+937, 13396, 30, 877.127, -351.8, 66.5296, 5.74213, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+938, 13396, 30, 876.778, -345.97, 65.7724, 3.45262, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+939, 13396, 30, 874.577, -414.786, 52.7817, 1.67552, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+940, 13396, 30, 868.247, -343.136, 64.9894, 1.6057, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+941, 13396, 30, 859.03, -367.231, 47.4655, 0.0174533, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+942, 13396, 30, 857.513, -351.817, 65.1867, 4.39823, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+943, 13396, 30, 852.632, -372.416, 48.1657, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+944, 13396, 30, 849.86, -340.944, 66.2447, 0.401426, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+945, 13396, 30, 847.99, -386.287, 60.9277, 2.32374, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+946, 13396, 30, 847.601, -423.072, 50.0852, 4.57276, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+947, 13396, 30, 847.135, -411.307, 50.2106, 1.5708, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+948, 13396, 30, 835.077, -379.418, 48.2755, 5.93412, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+949, 13396, 30, 834.87, -453.304, 47.9075, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+950, 13396, 30, 834.634, -365.981, 62.8801, 1.32645, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+951, 13396, 30, 834.354, -355.526, 48.1491, 6.07375, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+952, 13396, 30, 833.702, -327.506, 65.0439, 0.331613, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+953, 13396, 30, 833.151, -374.228, 63.0938, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+954, 13396, 30, 831.711, -346.785, 47.2975, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Miner
(@CGUID+955, 13397, 30, 754.204, -322.754, 57.4426, 5.20939, 430, 430, 5, 0, 0, 1), -- Irondeep Peon
(@CGUID+956, 13397, 30, 774.243, -320.466, 54.4848, 2.67149, 430, 430, 5, 0, 0, 1), -- Irondeep Peon
(@CGUID+957, 13397, 30, 971.671, -442.657, 57.6951, 3.1765, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+958, 13397, 30, 969.979, -457.148, 58.1119, 4.5204, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+959, 13397, 30, 958.692, -333.477, 63.2276, 5.77704, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+960, 13397, 30, 957.113, -325.92, 61.7589, 1.13446, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+961, 13397, 30, 948.25, -448.268, 56.9009, 5.60251, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+962, 13397, 30, 934.727, -385.802, 63.0344, 3.75246, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+963, 13397, 30, 931.751, -403.458, 59.6737, 5.63741, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+964, 13397, 30, 931.146, -359.666, 66.0294, 3.9619, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+965, 13397, 30, 929.702, -412.401, 56.8776, 5.89921, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+966, 13397, 30, 926.849, -379.074, 63.5286, 2.0944, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+967, 13397, 30, 921.972, -358.597, 66.4313, 2.93215, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+968, 13397, 30, 921.449, -341.981, 67.1264, 3.4383, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+969, 13397, 30, 921.1, -395.812, 60.4615, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+970, 13397, 30, 919.274, -394.986, 60.3478, 2.71696, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+971, 13397, 30, 916.852, -393.891, 60.1726, 2.71695, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+972, 13397, 30, 914.568, -326.21, 66.1733, 2.25147, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+973, 13397, 30, 913.064, -395.773, 60.1364, 4.41568, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+974, 13397, 30, 909.246, -474.576, 58.2067, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+975, 13397, 30, 909.246, -474.576, 58.2901, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+976, 13397, 30, 907.209, -428.267, 59.8065, 1.8675, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+977, 13397, 30, 905.973, -459.528, 58.7594, 1.37189, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+978, 13397, 30, 905.067, -396.074, 60.2085, 5.07891, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+979, 13397, 30, 901.809, -457.709, 59.0116, 3.52557, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+980, 13397, 30, 900.962, -427.44, 59.0842, 1.50098, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+981, 13397, 30, 897.929, -471.742, 59.7729, 2.54818, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+982, 13397, 30, 893.376, -343.171, 68.1499, 5.35816, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+983, 13397, 30, 890.584, -406.049, 61.1925, 5.67232, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+984, 13397, 30, 888.208, -332.564, 68.148, 1.93732, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+985, 13397, 30, 887.647, -391.537, 61.8734, 1.37881, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+986, 13397, 30, 885.109, -343.338, 67.0867, 3.78979, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+987, 13397, 30, 881.618, -419.948, 53.5228, 0.593412, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+988, 13397, 30, 878.675, -345.36, 66.1052, 3.45651, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+989, 13397, 30, 877.127, -351.8, 66.5296, 5.74213, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+990, 13397, 30, 876.778, -345.97, 65.7724, 3.45262, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+991, 13397, 30, 874.577, -414.786, 52.7817, 1.67552, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+992, 13397, 30, 868.247, -343.136, 64.9894, 1.6057, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+993, 13397, 30, 859.03, -367.231, 47.4655, 0.0174533, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+994, 13397, 30, 857.513, -351.817, 65.1867, 4.39823, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+995, 13397, 30, 852.632, -372.416, 48.1657, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+996, 13397, 30, 849.86, -340.944, 66.2447, 0.401426, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+997, 13397, 30, 847.99, -386.287, 60.9277, 2.32374, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+998, 13397, 30, 847.601, -423.072, 50.0852, 4.57276, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+999, 13397, 30, 847.135, -411.307, 50.2106, 1.5708, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+1000, 13397, 30, 835.077, -379.418, 48.2755, 5.93412, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+1001, 13397, 30, 834.87, -453.304, 47.9075, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+1002, 13397, 30, 834.634, -365.981, 62.8801, 1.32645, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+1003, 13397, 30, 834.354, -355.526, 48.1491, 6.07375, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+1004, 13397, 30, 833.702, -327.506, 65.0439, 0.331613, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+1005, 13397, 30, 833.151, -374.228, 63.0938, 3.66519, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
(@CGUID+1006, 13397, 30, 831.711, -346.785, 47.2975, 0.226893, 120, 120, 0, 0, 0, 0), -- Irondeep Peon
-- (@CGUID+1007
(@CGUID+1008, 13421, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1009, 13421, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1010, 13421, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1011, 13421, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1012, 13421, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1013, 13421, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1014, 13421, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1015, 13421, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1016, 13421, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1017, 13421, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1018, 13421, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1019, 13421, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1020, 13421, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1021, 13421, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1022, 13421, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1023, 13421, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1024, 13421, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1025, 13421, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1026, 13421, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1027, 13421, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1028, 13421, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1029, 13421, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1030, 13421, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1031, 13421, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1032, 13421, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1033, 13421, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1034, 13421, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 5, 0, 0, 1), -- Champion Guardian
(@CGUID+1035, 13421, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 5, 0, 0, 1), -- Champion Guardian
-- (@CGUID+1036 - 1037
(@CGUID+1038, 13422, 30, 635.17, -29.5594, 46.5056, 4.81711, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1039, 13422, 30, 642.488, -32.9437, 46.365, 4.67748, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1040, 13422, 30, 642.326, -27.9442, 46.9211, 4.59022, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1041, 13422, 30, 635.945, -33.6171, 45.7164, 4.97419, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1042, 13422, 30, 669.272, -297.304, 30.291, 4.66604, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1043, 13422, 30, 674.08, -292.328, 30.4817, 0.0918785, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1044, 13422, 30, 667.01, -288.532, 29.8809, 1.81583, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1045, 13422, 30, 664.153, -294.042, 30.2851, 3.28531, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1046, 13422, 30, 81.7027, -406.135, 47.7843, 0.598464, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1047, 13422, 30, 78.1431, -409.215, 48.0401, 5.05953, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1048, 13422, 30, 73.4135, -407.035, 46.7527, 3.34736, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1049, 13422, 30, 78.2258, -401.859, 46.4202, 2.05852, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1050, 13422, 30, -207.412, -110.616, 78.7959, 2.43251, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1051, 13422, 30, -197.95, -112.205, 78.5686, 6.22441, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1052, 13422, 30, -202.709, -116.829, 78.4358, 5.13742, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1053, 13422, 30, -202.059, -108.314, 78.5783, 5.91968, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1054, 13422, 30, -615.501, -393.802, 60.4299, 3.06147, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1055, 13422, 30, -608.513, -392.717, 62.5724, 2.06323, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1056, 13422, 30, -609.769, -400.072, 60.7174, 5.22367, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1057, 13422, 30, -616.093, -398.293, 60.5628, 3.73613, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1058, 13422, 30, -1077.7, -340.21, 55.4682, 6.25569, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1059, 13422, 30, -1082.74, -333.821, 54.7962, 2.05459, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1060, 13422, 30, -1090.66, -341.267, 54.6768, 3.27746, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1061, 13422, 30, -1081.58, -344.63, 55.256, 4.75636, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1062, 13422, 30, -1408.95, -311.69, 89.2536, 4.49954, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1063, 13422, 30, -1407.15, -305.323, 89.1993, 2.86827, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1064, 13422, 30, -1400.64, -304.3, 89.7008, 1.0595, 120, 120, 5, 0, 0, 1), -- Champion Defender
(@CGUID+1065, 13422, 30, -1400.4, -311.35, 89.3028, 4.99434, 120, 120, 5, 0, 0, 1), -- Champion Defender
-- (@CGUID+1066 - 1073
(@CGUID+1074, 13437, 30, -1303.375, -267.9886, 91.9538, 2.243448, 430, 430, 2, 0, 0, 1), -- Wing Commander Ichman -> Moves to 571.852, -55.7213, 38.1109, 0.3665192
(@CGUID+1075, 13438, 30, -768.864, -360.9263, 68.63197, 1.064651, 430, 430, 0, 0, 0, 0), -- Wing Commander Slidore -> Moves to 569.9629, -42.02181, 37.75815, 4.276057
(@CGUID+1076, 13439, 30, -1219.253, -353.1674, 57.75129, 4.485496, 430, 430, 0, 0, 0, 0), -- Wing Commander Vipore -> Moves to 568.0287, -48.54899, 38.50815, 4.031711
(@CGUID+1077, 13441, 30, -1248.786, -636.0178, 52.63483, 0.9599311, 6300, 6300, 0, 0, 0, 0), -- Frostwolf Wolf Rider Commander
(@CGUID+1078, 13442, 30, 729.2002, -78.81201, 51.6335, 3.979351, 430, 430, 0, 0, 0, 0), -- Arch Druid Renferal
(@CGUID+1079, 13443, 30, 724.7677, -84.16422, 51.6335, 0.7330383, 490, 490, 0, 0, 0, 0), -- Druid of the Grove
(@CGUID+1080, 13443, 30, 725.5536, -79.49734, 51.6335, 5.270895, 490, 490, 0, 0, 0, 0), -- Druid of the Grove
(@CGUID+1081, 13443, 30, 729.1176, -82.87132, 51.6335, 2.530727, 490, 490, 0, 0, 0, 0), -- Druid of the Grove
-- (@CGUID+1082 - 1083
(@CGUID+1084, 13447, 30, 596.6795, -83.06326, 38.97698, 6.248279, 490, 490, 0, 0, 0, 0), -- Corporal Noreg Stormpike
(@CGUID+1085, 13448, 30, -1212.107, -261.7742, 73.41485, 5.794493, 430, 430, 0, 0, 0, 0), -- Sergeant Yazra Bloodsnarl
-- (@CGUID+1086 - 1098
(@CGUID+1099, 13577, 30, 600.0322, -2.924751, 42.07877, 5.009095, 6300, 6300, 0, 0, 0, 0), -- Stormpike Ram Rider Commander
(@CGUID+1100, 13616, 30, -1244.961, -637.9991, 52.63655, 1.919862, 490, 490, 0, 0, 0, 0), -- Frostwolf Stable Master
(@CGUID+1101, 13617, 30, 610.2391, -21.84538, 43.27198, 4.904375, 490, 490, 0, 0, 0, 0), -- Stormpike Stable Master
-- (@CGUID+1102 - 1107
(@CGUID+1108, 13797, 30, 613.4215, -150.7637, 33.45171, 5.550147, 6300, 6300, 0, 0, 0, 0), -- Mountaineer Boombellow
(@CGUID+1109, 13798, 30, -1213.91, -370.619, 56.44551, 0.8377581, 6300, 6300, 0, 0, 0, 0), -- Jotek
-- (@CGUID+1110 - 1114
(@CGUID+1115, 14185, 30, -1271.211, -335.5542, 62.44618, 5.759586, 490, 490, 0, 0, 0, 0), -- Najak Hexxen
(@CGUID+1116, 14186, 30, -1268.641, -332.6885, 62.73878, 5.288348, 430, 430, 0, 0, 0, 0), -- Ravak Grimtotem
(@CGUID+1117, 14187, 30, 648.3634, -65.2233, 41.74047, 3.124139, 490, 490, 0, 0, 0, 0), -- Athramanis
(@CGUID+1118, 14188, 30, 648.2379, -67.89307, 41.74046, 2.600541, 490, 490, 0, 0, 0, 0), -- Dirk Swindle
-- (@CGUID+1119
(@CGUID+1120, 14282, 30, -742.189, -342.6332, 66.68878, 3.270886, 430, 430, 0, 0, 0, 0), -- Frostwolf Bloodhound
(@CGUID+1121, 14282, 30, -740.704, -346.2681, 66.88144, 3.333045, 430, 430, 0, 0, 0, 0), -- Frostwolf Bloodhound
(@CGUID+1122, 14282, 30, -1221.709, -301.6313, 67.55232, 0.8282489, 430, 430, 0, 0, 0, 0), -- Frostwolf Bloodhound
(@CGUID+1123, 14282, 30, -1218.688, -304.2487, 67.83616, 0.826811, 430, 430, 0, 0, 0, 0), -- Frostwolf Bloodhound
(@CGUID+1124, 14284, 30, 776.83, -496.3589, 99.70737, 2.513274, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1125, 14284, 30, 773.6514, -497.4816, 99.04083, 2.111848, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1126, 14284, 30, 776.6208, -487.7754, 99.40494, 3.508112, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1127, 14284, 30, 773.0414, -485.532, 98.8613, 4.223697, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1128, 14284, 30, 884.7385, -497.8078, 96.9043, 3.01942, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1129, 14284, 30, 883.6002, -500.6165, 96.84996, 2.251475, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1130, 14284, 30, 936.3436, -511.4911, 93.79216, 3.610045, 430, 430, 0, 0, 0, 2), -- Stormpike Battleguard
(@CGUID+1131, 14284, 30, 876.6663, -503.8515, 96.70679, 0.03490658, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1132, 14284, 30, 878.9206, -508.4962, 96.79261, 1.151917, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1133, 14284, 30, 866.8444, -505.8405, 96.53249, 2.460914, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1134, 14284, 30, 863.1136, -508.1444, 96.55193, 2.007129, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1135, 14284, 30, 857.8161, -491.9267, 96.91924, 4.869469, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1136, 14284, 30, 854.2764, -494.2414, 96.80172, 5.445427, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1137, 14284, 30, 936.852, -504.9757, 94.22932, 5.72468, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1138, 14284, 30, 939.4198, -502.7771, 94.58874, 5.148721, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1139, 14284, 30, 947.4122, -509.9817, 95.10983, 2.827433, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1140, 14284, 30, 949.0997, -506.9129, 95.42369, 3.316126, 430, 430, 0, 0, 0, 0), -- Stormpike Battleguard
(@CGUID+1141, 13816, 30, 704.3499, -22.90712, 50.21867, 0.7853982, 300, 300, 0, 0, 0, 0), -- Prospector Stonehewer
(@CGUID+1142, 14762, 30, 723.0579, -14.15484, 50.70463, 3.403392, 120, 120, 0, 0, 0, 0), -- Dun Baldar North Marshal
-- (@CGUID+1143
(@CGUID+1144, 14763, 30, 721.1042, -7.641547, 50.70463, 3.455752, 120, 120, 0, 0, 0, 0), -- Dun Baldar South Marshal
-- (@CGUID+1145
(@CGUID+1146, 14764, 30, 715.691, -4.722331, 50.21867, 3.473205, 120, 120, 0, 0, 0, 0), -- Icewing Marshal
-- (@CGUID+1147 - 1148
(@CGUID+1149, 14765, 30, 720.046, -19.9413, 50.21867, 3.368485, 120, 120, 0, 0, 0, 0), -- Stonehearth Marshal
-- (@CGUID+1150 - 1153
(@CGUID+1154, 14772, 30, -1368.085, -219.5863, 98.50992, 5.113815, 120, 120, 0, 0, 0, 0), -- East Frostwolf Warmaster
-- (@CGUID+1155
(@CGUID+1156, 14773, 30, -1376.09, -226.2954, 98.50992, 5.166174, 490, 490, 0, 0, 0, 0), -- Iceblood Warmaster
-- (@CGUID+1157 - 1160
(@CGUID+1161, 14776, 30, -1363.059, -220.0305, 98.48016, 5.113815, 490, 490, 0, 0, 0, 0), -- Tower Point Warmaster
-- (@CGUID+1162
(@CGUID+1163, 14777, 30, -1373.695, -222.2029, 98.50992, 5.148721, 120, 120, 0, 0, 0, 0), -- West Frostwolf Warmaster
-- Horde Side
(@CGUID+1775, 11837, 30, -1617.95, -391.549, 55.137, 0.834304, 300, 300, 2, 0, 0, 1), -- Wildpaw Shaman
(@CGUID+1776, 11837, 30, -1566.16, -397.12, 65.3396, 2.36521, 300, 300, 2, 0, 0, 1), -- Wildpaw Shaman
(@CGUID+1777, 11838, 30, -1612.24, -439.036, 80.0545, 5.37574, 300, 300, 2, 0, 0, 1), -- Wildpaw Mystic
(@CGUID+1778, 11838, 30, -1553.82, -342.933, 64.4159, 4.31570, 300, 300, 2, 0, 0, 1), -- Wildpaw Mystic
(@CGUID+1779, 11839, 30, -1565.21, -479.676, 59.2293, 2.06611, 300, 300, 2, 0, 0, 1), -- Wildpaw Brute
(@CGUID+1780, 11839, 30, -1477.04, -475.236, 69.4457, 5.29207, 300, 300, 2, 0, 0, 1), -- Wildpaw Brute
(@CGUID+1781, 11839, 30, -1646.17, -446.101, 49.8023, 1.17457, 300, 300, 2, 0, 0, 1), -- Wildpaw Brute
(@CGUID+1782, 11839, 30, -1550.729, -377.5234, 64.4669, 3.231004, 300, 300, 2, 0, 0, 1), -- Wildpaw Brute
(@CGUID+1783, 11839, 30, -1573.18, -361.9825, 64.19695, 0.2793322, 300, 300, 2, 0, 0, 1), -- Wildpaw Brute
(@CGUID+1784, 11840, 30, -1592.95, -408.627, 81.4215, 0.95002, 300, 300, 2, 0, 0, 1), -- Wildpaw Alpha
(@CGUID+1785, 11840, 30, -1568.06, -446.271, 67.846, 3.46805, 300, 300, 2, 0, 0, 1), -- Wildpaw Alpha
(@CGUID+1786, 11840, 30, -1485.83, -426.824, 70.3539, 5.26827, 300, 300, 2, 0, 0, 1), -- Wildpaw Alpha
(@CGUID+1787, 11840, 30, -1550.894, -361.3882, 66.58133, 4.401934, 300, 300, 2, 0, 0, 1), -- Wildpaw Alpha
(@CGUID+1788, 11840, 30, -1538.105, -358.4388, 64.60719, 0.359198, 300, 300, 2, 0, 0, 1), -- Wildpaw Alpha
(@CGUID+1789, 10981, 30, -560.1038, -206.945, 58.39366, 4.071974, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1790, 10981, 30, -846.1333, -304.4787, 55.54105, 0.1553828, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1791, 10981, 30, -556.5867, -484.5356, 79.01884, 1.686195, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1792, 10981, 30, -487.1731, -188.3546, 56.58683, 1.055011, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1793, 10981, 30, -1094.51, -336.004, 54.6334, 3.63206, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1794, 10981, 30, -1316.4, -517.62, 52.4308, 2.97414, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1795, 10981, 30, -1048.64, -496.647, 45.477, 5.87303, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1796, 10981, 30, -380.387, -123.127, 25.7814, 0.329259, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1797, 10981, 30, -1207.55, -546.59, 52.184, 0.663117, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1798, 10981, 30, -426.1, -132.265, 24.4058, 1.58416, 300, 300, 5, 0, 0, 1), -- Frostwolf
(@CGUID+1799, 10981, 30, -857.527, -463.559, 47.8953, 0.262911, 300, 300, 5, 0, 0, 1), -- Frostwolf
-- Alliance Side
(@CGUID+1801, 11675, 30, 314.3878, -318.4957, -28.1123, 5.203387, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1802, 11675, 30, 434.3255, -40.99554, -0.419651, 1.316094, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1803, 11675, 30, 268.5983, 80.66288, 20.71787, 3.257379, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1804, 11675, 30, 232.3547, 82.85602, 17.91818, 2.255911, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1805, 11675, 30, 34.39055, 67.21788, -0.9751591, 2.273348, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1806, 11675, 30, 163.8064, 147.8498, 3.819191, 5.859236, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1807, 11675, 30, 109.3353, 97.65831, 3.510561, 4.42323, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1808, 11675, 30, 37.90408, 165.3339, 11.84925, 6.132656, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1809, 11675, 30, 52.3411, 162.9613, 10.97228, 4.815434, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1810, 11675, 30, -2.001899, 82.30241, 19.39505, 4.61733, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1811, 11675, 30, -14.36056, 32.73905, 16.92469, 0.3786411, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1812, 11675, 30, 44.56627, -10.88285, -4.096216, 6.085869, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1813, 11675, 30, 25.09579, 46.23475, 0.7573166, 2.512801, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1814, 11675, 30, 98.59017, 131.549, 3.582083, 0.8587602, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1815, 11675, 30, 11.60883, 15.9375, -2.578961, 4.660029, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1816, 11675, 30, 52.33084, 25.23378, -4.096216, 3.276753, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1817, 11675, 30, 153.4918, 67.63511, 7.110601, 0.08209656, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1818, 11675, 30, 195.1936, 96.18621, 16.96146, 0.4845817, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1819, 11675, 30, 308.9774, 12.46494, 2.297565, 2.615062, 300, 300, 2, 0, 0, 1), -- Snowblind Windcaller
(@CGUID+1820, 11678, 30, 480.3402, -112.5019, 8.697767, 0.1214466, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1821, 11678, 30, 437.4614, -120.2882, 4.125473, 0.2549357, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1822, 11678, 30, 328.3768, -300.6425, -42.86325, 2.55359, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1823, 11678, 30, 384.0323, -299.1599, -42.40996, 4.246119, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1824, 11678, 30, 377.7203, -126.1482, -14.38102, 6.18717, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1825, 11678, 30, 487.7982, -146.7828, 18.20642, 4.288023, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1826, 11678, 30, 173.9194, 172.6678, 2.568547, 3.154335, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1827, 11678, 30, 10.24924, 91.01688, 0.6920544, 2.119113, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1828, 11678, 30, 96.3074, 135.207, 3.289783, -0.8273408, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1829, 11678, 30, 71.20975, 23.5625, -4.096216, 2.312681, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1830, 11678, 30, 16.20116, 8.98386, -3.2075, 5.284942, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1831, 11678, 30, -4.335072, 128.2781, 10.5636, 6.009277, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1832, 11678, 30, 60.19041, 42.65273, -4.096216, 1.816057, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1833, 11678, 30, 67.26015, 181.5951, 6.897262, 6.100744, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1834, 11678, 30, 149.369, 185.0151, 4.766237, 2.841442, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1835, 11678, 30, 33.71573, 96.70155, 21.96731, 3.776461, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1836, 11678, 30, 163.4309, 146.9783, 3.823561, 5.167928, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1837, 11678, 30, 173.6141, 128.6605, 8.42202, 5.378272, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1838, 11678, 30, 205.1207, 101.6429, 15.60503, 0.826135, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1839, 11678, 30, 109.583, 86.3827, 3.3918, 5.41992, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher
(@CGUID+1840, 11678, 30, 268.2318, -185.6966, -42.89143, 1.319387, 300, 300, 2, 0, 0, 1), -- Snowblind Ambusher (maybe one of these outside spawns has movement)
(@CGUID+1841, 10986, 30, 268.412, 25.2247, 21.1351, 0.763612, 300, 300, 2, 0, 0, 1), -- Snowblind Harpy
(@CGUID+1842, 10986, 30, 138.475, 149.01, 2.36104, 0.991863, 300, 300, 2, 0, 0, 1), -- Snowblind Harpy
(@CGUID+1843, 10986, 30, 267.8507, -313.2709, -18.41218, 3.425254, 300, 300, 2, 0, 0, 1), -- Snowblind Harpy
(@CGUID+1844, 10986, 30, 424.9368, -52.59122, -6.162855, 1.795768, 300, 300, 2, 0, 0, 1), -- Snowblind Harpy
(@CGUID+1845, 10986, 30, 449.6369, -35.48276, -0.544651, 2.790872, 300, 300, 2, 0, 0, 1), -- Snowblind Harpy
(@CGUID+1846, 10986, 30, 296.1165, -78.50062, -38.20281, 4.062625, 300, 300, 2, 0, 0, 1), -- Snowblind Harpy
(@CGUID+1889, 10990, 30, 388.4401, -348.0952, -29.40919, 3.853816, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1890, 10990, 30, -55.27079, -193.2281, 20.25704, 6.147561, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1891, 10990, 30, 110.7836, -326.1621, 38.77223, 0.4819155, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1892, 10990, 30, 227.7531, -426.6706, 40.42906, 4.059813, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1893, 10990, 30, 165.6006, -407.0249, 43.06815, 2.961075, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1894, 10990, 30, 516.5001, -477.6863, 59.44366, 0.5538325, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1895, 10990, 30, 484.6909, -455.8784, 41.91766, 5.944675, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1896, 10990, 30, 288.7804, -296.1509, -33.01368, 2.552045, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1897, 10990, 30, 408.2635, -307.4206, -42.8623, 5.600191, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1898, 10990, 30, -59.22929, -190.0344, 20.87272, 1.909222, 300, 300, 5, 0, 0, 1), -- Alterac Ram
(@CGUID+1899, 13959, 30, 40.82042, 103.9332, 21.93791, 4.171337, 300, 300, 0, 0, 0, 2), -- Alterac Yeti
-- Triggers and misc
(@CGUID+1979, 14026, 30, 216.6146, -377.9462, 62.60545, 5.009095, 300, 300, 0, 0, 0, 0), -- Trigger Guse
(@CGUID+1980, 14027, 30, 666.4675, -132.4711, 70.048, 0.08726646, 300, 300, 0, 0, 0, 0), -- Trigger Mulverick
(@CGUID+1981, 14028, 30, 320.4, -502.6, 71.2, 0, 300, 300, 0, 0, 0, 0), -- Trigger Mulverick
(@CGUID+1982, 14029, 30, -1303.992, -266.8175, 114.3625, 6.091199, 300, 300, 0, 0, 0, 0), -- Trigger Ichman
(@CGUID+1983, 14030, 30, -762.5497, -346.8925, 91.063, 4.799655, 300, 300, 0, 0, 0, 0), -- Trigger Slidore
(@CGUID+1984, 14031, 30, -1225.05, -350.431, 57.7918, 3.595378, 300, 300, 0, 0, 0, 0), -- Trigger Vipore
(@CGUID+1985, 13756, 30, 705.0177, -19.47488, 91.8856, 2.181662, 300, 300, 0, 0, 0, 0), -- PvP Graveyard Credit Marker
(@CGUID+1986, 13756, 30, 703.3907, -18.96691, 91.46259, 4.118977, 300, 300, 0, 0, 0, 0), -- PvP Graveyard Credit Marker
(@CGUID+1987, 13778, 30, 704.947, -18.67008, 91.93361, 2.670354, 300, 300, 0, 0, 0, 0), -- PvP Tower Credit Marker
(@CGUID+1988, 13778, 30, 704.5838, -18.19016, 91.8703, 6.265732, 300, 300, 0, 0, 0, 0), -- PvP Tower Credit Marker
(@CGUID+1989, 13796, 30, 704.1282, -17.59928, 91.78996, 3.839724, 300, 300, 0, 0, 0, 0), -- PvP Mine Credit Marker

(@CGUID+1991, 23472, 30, 5190.468, 2906.853, 410.2329, 5.375614, 300, 300, 0, 0, 0, 0), -- World Trigger (Large AOI, Not Immune PC/NPC)
(@CGUID+1992, 19871, 30, 5276.769, 3051.355, 438.5827, 3.211406, 300, 300, 0, 0, 0, 0), -- World Trigger (Not Immune NPC)
(@CGUID+1993, 19871, 30, 5159.208, 2938.436, 439.9297, 0.6457718, 300, 300, 0, 0, 0, 0), -- World Trigger (Not Immune NPC)
(@CGUID+1994, 15214, 30, 1623.939, -96.56581, 12.50112, 4.485496, 300, 300, 0, 0, 0, 0), -- Invisible Stalker
(@CGUID+1995, 23472, 30, 1441.079, -240.5939, 35.34715, 4.031711, 300, 300, 0, 0, 0, 0), -- World Trigger (Large AOI, Not Immune PC/NPC)
(@CGUID+1996, 23472, 30, 1193.757, 69.94054, 58.1295, 2.495821, 300, 300, 0, 0, 0, 0), -- World Trigger (Large AOI, Not Immune PC/NPC)
(@CGUID+1997, 15214, 30, 1230.2, -67.94097, 83.77162, 4.08407, 300, 300, 0, 0, 0, 0), -- Invisible Stalker
(@CGUID+1998, 23472, 30, 1043.523, -87.85069, 87.19695, 2.96706, 300, 300, 0, 0, 0, 0), -- World Trigger (Large AOI, Not Immune PC/NPC)
(@CGUID+1999, 23472, 30, 1227.886, -235.4575, 60.11116, 3.403392, 300, 300, 0, 0, 0, 0), -- World Trigger (Large AOI, Not Immune PC/NPC)
(@CGUID+2000, 22515, 30, 711.0102, -13.61388, 50.21867, 4.276057, 300, 300, 0, 0, 0, 0), -- World Trigger
(@CGUID+2001, 14848, 30, 699.2739, -17.63607, 90.39349, 3.473205, 300, 300, 0, 0, 0, 0), -- Herald
(@CGUID+2002, 14848, 30, -1357.466, -253.098, 120.9885, 5.131268, 300, 300, 0, 0, 0, 0), -- Herald
(@CGUID+2003, 14848, 30, -539.2852, -168.2434, 115.0156, 1.53589, 300, 300, 2, 0, 0, 1), -- Herald
(@CGUID+2004, 14848, 30, -48.4094, -288.8058, 55.51976, 0.1745329, 300, 300, 2, 0, 0, 1); -- Herald

-- (@CGUID+XXX, 12051, 30, -783.0477, -343.5128, 65.79632, 6.272885, 300, 300, 0, 0, 0, 0), -- Frostwolf Legionnaire
-- Potential Prenerf Spawns Spawn Locations !Wrong Entrys!
-- (@CGUID+281, 11947, 30, -544.134, -167.923, 57.0122, 6.28171, 1785, 1785, 0, 0, 0, 0), -- Captain Galvangar
-- (@CGUID+283, 11948, 30, 702.065, -16.4507, 50.1353, 0.293762, 6300, 6300, 0, 0, 0, 0), -- Vanndar Stormpike
-- (@CGUID+285, 11949, 30, -33.1637, -291.26, 15.0786, 3.00156, 6300, 6300, 0, 0, 0, 0), -- Captain Balinda Stonehearth
-- (@CGUID+287, 11997, 30, 780.729, -496.835, 100.255, 1.37743, 490, 490, 0, 0, 0, 0), -- Stormpike Herald
-- (@CGUID+289, 11997, 30, -1539.03, -763.518, -0.000621079, 1.17101, 120, 120, 0, 0, 0, 0), -- Stormpike Herald
-- (@CGUID+291, 12047, 30, 101.43, -390.854, 45.1353, 0.351658, 1290, 1290, 5, 0, 0, 1), -- Stormpike Mountaineer
-- (@CGUID+292, 12050, 30, -46.1047, -277.776, 15.5645, 1.36669, 430, 430, 5, 0, 0, 1), -- Stormpike Defender
-- (@CGUID+293, 12050, 30, -29.4629, -280.476, 15.5645, 1.47032, 430, 430, 5, 0, 0, 1), -- Stormpike Defender
-- (@CGUID+294, 12050, 30, -7.22618, -289.707, 15.5641, 4.65556, 430, 430, 5, 0, 0, 1), -- Stormpike Defender
-- (@CGUID+295, 12050, 30, -49.9033, -299.553, 15.5645, 4.57782, 430, 430, 5, 0, 0, 1), -- Stormpike Defender
-- (@CGUID+296, 12050, 30, -9.20146, -300.879, 15.5641, 1.43395, 430, 430, 5, 0, 0, 1), -- Stormpike Defender
-- (@CGUID+297, 12050, 30, -33.2382, -302.798, 15.5645, 4.49147, 430, 430, 5, 0, 0, 1), -- Stormpike Defender
-- (@CGUID+298, 12050, 30, -49.6288, -288.507, 15.5645, 6.05312, 430, 430, 5, 0, 0, 1), -- Stormpike Defender
-- (@CGUID+328, 12051, 30, -536.28, -182.784, 57.9519, 4.85222, 430, 430, 5, 0, 0, 1), -- Frostwolf Legionnaire
-- (@CGUID+329, 12051, 30, -524.859, -159.15, 57.9469, 0.461474, 430, 430, 5, 0, 0, 1), -- Frostwolf Legionnaire
-- (@CGUID+330, 12051, 30, -504.289, -187.986, 57.8778, 5.87226, 430, 430, 5, 0, 0, 1), -- Frostwolf Legionnaire
-- (@CGUID+331, 12051, 30, -555.052, -160.853, 57.9569, 5.95878, 430, 430, 5, 0, 0, 1), -- Frostwolf Legionnaire
-- (@CGUID+332, 12051, 30, -545.042, -150.999, 57.9568, 4.92368, 430, 430, 5, 0, 0, 1), -- Frostwolf Legionnaire
-- (@CGUID+333, 12052, 30, -461.106, -355.693, 31.0315, 5.24885, 430, 430, 5, 0, 0, 1), -- Frostwolf Warrior
-- (@CGUID+334, 12052, 30, -491.932, -338.25, 32.315, 2.65704, 430, 430, 5, 0, 0, 1), -- Frostwolf Warrior
-- (@CGUID+335, 12053, 30, -1286.08, -292.165, 89.4414, 0.13892, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+336, 12053, 30, -1209.79, -258.971, 72.807, 6.04762, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+337, 12053, 30, -1419.36, -322.491, 89.0562, 0.54054, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+338, 12053, 30, -1336.7, -292.145, 90.9146, 3.28446, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+339, 12053, 30, -1290.83, -267.808, 114.151, 0.155989, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+340, 12053, 30, -1159.49, -356.846, 51.8699, 0.276326, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+341, 12053, 30, -1304.12, -270.546, 114.139, 3.52747, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+342, 12053, 30, -1421.74, -318.38, 89.1177, 0.516545, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+343, 12053, 30, -500.359, -177.578, 57.8746, 5.89323, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+344, 12053, 30, -1162.4, -352.024, 51.857, 3.45484, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+345, 12053, 30, -1304.99, -265.518, 114.151, 3.2484, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+346, 12053, 30, -1222.15, -362.484, 57.8358, 4.79095, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+347, 12053, 30, -1357.27, -289.823, 91.5309, 5.21118, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+348, 12053, 30, -1161.1, -348.035, 52.0591, 6.07008, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+349, 12053, 30, -1314.1, -265.656, 91.6178, 3.33955, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+350, 12053, 30, -1217.35, -361.464, 57.2907, 4.81431, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+351, 12053, 30, -1207.97, -249.112, 73.0852, 5.84621, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+352, 12053, 30, -1312.64, -276.64, 91.2948, 3.51738, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+353, 12053, 30, -1344.07, -284.766, 91.1725, 4.98263, 430, 430, 5, 0, 0, 1), -- Frostwolf Guardian
-- (@CGUID+399, 12127, 30, 627.704, -272.228, 30.1336, 4.89551, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+395, 12127, 30, 645.945, -270.983, 30.1329, 4.85466, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+388, 12127, 30, 624.473, -232.804, 37.4727, 0.151753, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+390, 12127, 30, 637.596, -230.508, 37.508, 3.31479, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+396, 12127, 30, 618.011, -191.652, 38.715, 0.171264, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+397, 12127, 30, 631.399, -189.692, 38.713, 3.286891, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+393, 12127, 30, 660.406, -36.6379, 49.5487, 3.33393, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+394, 12127, 30, 656.257, -22.3926, 49.5618, 3.3598, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+398, 12127, 30, 717.607, -0.564321, 50.6213, 3.63749, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+389, 12127, 30, 723.955, -21.5371, 50.6213, 3.47103, 430, 430, 0, 0, 0, 0), -- Stormpike Guardsman
-- (@CGUID+616, 13137, 30, -627.388, -394.103, 58.9819, 3.66855, 490, 490, 0, 0, 0, 0), -- Lieutenant Rugba
-- (@CGUID+617, 13138, 30, 121.041, -369.637, 43.1245, 4.79702, 490, 490, 0, 0, 0, 0), -- Lieutenant Spencer
-- (@CGUID+618, 13139, 30, -151.683, -440.279, 40.3853, 4.28611, 1785, 1785, 0, 0, 0, 0), -- Commander Randolph
-- (@CGUID+619, 13140, 30, -537.417, -168.788, 57.0112, 2.93509, 180, 180, 0, 0, 0, 0), -- Commander Dardosh
-- (@CGUID+620, 13143, 30, -621.193, -357.858, 56.1206, 4.77595, 490, 490, 0, 0, 0, 0), -- Lieutenant Stronghoof
-- (@CGUID+621, 13144, 30, -540.745, -173.477, 57.0112, 1.34339, 430, 430, 0, 0, 0, 0), -- Lieutenant Vol'talar
-- (@CGUID+622, 13145, 30, -481.07, -358.03, 28.0431, 0.869456, 430, 430, 0, 0, 0, 0), -- Lieutenant Grummus
-- (@CGUID+623, 13146, 30, -587.534, -319.762, 48.3816, 4.31599, 430, 430, 0, 0, 0, 0), -- Lieutenant Murp
-- (@CGUID+624, 13147, 30, -540.778, -162.662, 56.9975, 5.62241, 430, 430, 0, 0, 0, 0), -- Lieutenant Lewis
-- (@CGUID+625, 13151, 30, -325.452, -631.495, 121.554, 0.624377, 490, 490, 0, 0, 0, 0), -- Syndicate Master Ryson
-- (@CGUID+626, 13152, 30, -1300.72, -276.136, 91.9405, 1.45977, 1785, 1785, 0, 0, 0, 0), -- Commander Malgor
-- (@CGUID+627, 13153, 30, -1426.91, -328.852, 89.1526, 0.972695, 1785, 1785, 0, 0, 0, 0), -- Commander Mulfort
-- (@CGUID+628, 13154, 30, -768.671, -363.85, 90.8949, 1.07916, 6300, 6300, 0, 0, 0, 0), -- Commander Louis Philips
-- (@CGUID+639, 13296, 30, 68.5699, -235.037, 16.3447, 4.04218, 430, 430, 0, 0, 0, 0), -- Lieutenant Largent - faction mounted
-- (@CGUID+640, 13297, 30, -32.8321, -288.675, 15.0786, 2.91902, 430, 430, 0, 0, 0, 0), -- Lieutenant Stouthandle - faction mounted
-- (@CGUID+641, 13298, 30, 84.0297, -260.126, 19.8222, 5.08283, 490, 490, 0, 0, 0, 0), -- Lieutenant Greywand - faction mounted
-- (@CGUID+642, 13299, 30, 79.9676, -236.94, 17.2992, 5.40877, 430, 430, 0, 0, 0, 0), -- Lieutenant Lonadin - faction mounted
-- (@CGUID+643, 13300, 30, -40.902, -480.168, 44.8062, 2.83775, 490, 490, 0, 0, 0, 0), -- Lieutenant Mancuso - faction mounted
-- (@CGUID+751, 13318, 30, 688.857, -131.356, 63.6662, 3.37343, 490, 490, 0, 0, 0, 0), -- Commander Mortimer - faction mounted
-- (@CGUID+752, 13319, 30, 672.59, -296.524, 30.3936, 2.74624, 180, 180, 0, 0, 0, 0), -- Commander Duffy
-- (@CGUID+753, 13320, 30, 196.835, -362.732, 49.2677, 5.87039, 1785, 1785, 0, 0, 0, 0), -- Commander Karl Philips
-- (@CGUID+754, 13325, 30, 99.9783, -312.868, 34.4257, 5.25954, 430, 430, 0, 0, 0, 0), -- Seasoned Mountaineer
-- (@CGUID+812, 13331, 30, 676.381, -31.9315, 50.6192, 1.8439, 610, 610, 5, 0, 0, 1), -- Veteran Defender
-- (@CGUID+813, 13331, 30, 704.814, -38.8323, 50.6213, 1.93984, 610, 610, 5, 0, 0, 1), -- Veteran Defender
-- (@CGUID+814, 13331, 30, 692.081, 3.14777, 50.6212, 5.80163, 610, 610, 5, 0, 0, 1), -- Veteran Defender
-- (@CGUID+815, 13331, 30, 671.829, -17.7163, 50.6192, 5.09153, 610, 610, 5, 0, 0, 1), -- Veteran Defender
-- (@CGUID+872, 13335, 30, 141.547, -367.192, 45.7941, 5.92711, 430, 430, 0, 0, 0, 0), -- Veteran Mountaineer
-- (@CGUID+1036, 13422, 30, 700.033, -13.9355, 50.1353, 0.238083, 430, 430, 5, 0, 0, 1), -- Champion Defender
-- (@CGUID+1037, 13422, 30, 701.632, -19.6478, 50.1353, 0.423632, 430, 430, 5, 0, 0, 1), -- Champion Defender
-- (@CGUID+1066, 13425, 30, -1189.04, -355.773, 53.2966, 5.8898, 430, 430, 5, 0, 0, 1), -- Champion Legionnaire
-- (@CGUID+1067, 13425, 30, -1186.78, -351.523, 53.1589, 5.94942, 430, 430, 5, 0, 0, 1), -- Champion Legionnaire
-- (@CGUID+1068, 13426, 30, -53.9927, -495.938, 44.0359, 2.64533, 430, 430, 5, 0, 0, 1), -- Champion Mountaineer
-- (@CGUID+1069, 13426, 30, -96.1053, -533.749, 45.0986, 3.73703, 430, 430, 5, 0, 0, 1), -- Champion Mountaineer
-- (@CGUID+1070, 13428, 30, -285.642, -136.171, 13.043, 2.66582, 430, 430, 5, 0, 0, 1), -- Champion Warrior
-- (@CGUID+1071, 13428, 30, -260.623, -154.529, 13.1007, 4.98033, 430, 430, 5, 0, 0, 1), -- Champion Warrior
-- (@CGUID+1072, 13428, 30, -273.385, -156.281, 13.1007, 4.90028, 430, 430, 5, 0, 0, 1), -- Champion Warrior
-- (@CGUID+1073, 13428, 30, -269.546, -147.809, 13.1007, 2.23385, 430, 430, 5, 0, 0, 1), -- Champion Warrior
-- (@CGUID+1083, 13446, 30, -157.781, -437.912, 33.2796, 4.65672, 1785, 1785, 0, 0, 0, 0), -- Field Marshal Teravaine - -256.5013, -415.4905, 17.6300 https://www.wowhead.com/npc=13446/field-marshal-teravaine#comments
-- (@CGUID+1086, 13525, 30, -1196.46, -346.499, 53.4791, 5.62613, 490, 490, 5, 0, 0, 1), -- Seasoned Commando
-- (@CGUID+1087, 13525, 30, -1199.71, -349.066, 53.4791, 4.95451, 490, 490, 5, 0, 0, 1), -- Seasoned Commando
-- (@CGUID+1088, 13536, 30, -852.528, -86.9663, 68.5141, 4.09034, 430, 430, 5, 0, 0, 1), -- Champion Coldmine Guard
-- (@CGUID+1089, 13536, 30, -991.148, -261.651, 66.0805, 0.262641, 430, 430, 5, 0, 0, 1), -- Champion Coldmine Guard
-- (@CGUID+1090, 13539, 30, -850.343, -89.4953, 68.4799, 4.39584, 430, 430, 0, 0, 0, 0), -- Champion Coldmine Surveyor
-- (@CGUID+1091, 13545, 30, 956.458, -448.21, 56.8632, 2.54315, 430, 430, 0, 0, 0, 0), -- Champion Irondeep Raider
-- (@CGUID+1092, 13546, 30, -988.586, -259.484, 65.4644, 0.350703, 430, 430, 0, 0, 0, 0), -- Seasoned Coldmine Explorer
-- (@CGUID+1093, 13548, 30, -1028.56, -362.431, 54.1992, 5.09292, 430, 430, 0, 0, 0, 0), -- Champion Coldmine Explorer
-- (@CGUID+1094, 13551, 30, -1009.55, -353.443, 56.559, 4.82275, 430, 430, 0, 0, 0, 0), -- Champion Coldmine Invader
-- (@CGUID+1095, 13554, 30, 883.625, -445.019, 54.5971, 2.45391, 430, 430, 5, 0, 0, 1), -- Champion Irondeep Guard
-- (@CGUID+1096, 13554, 30, 875.561, -448.312, 54.601, 1.37729, 430, 430, 5, 0, 0, 1), -- Champion Irondeep Guard
-- (@CGUID+1097, 13557, 30, 880.271, -448.096, 54.7362, 2.05484, 430, 430, 0, 0, 0, 0), -- Champion Irondeep Surveyor
-- (@CGUID+1098, 13576, 30, 662.116, -285.804, 29.7976, 3.05254, 490, 490, 0, 0, 0, 0), -- Stormpike Ram Rider
-- (@CGUID+1102, 13618, 30, -1253.72, -605.134, 55.3862, 3.10635, 430, 430, 5, 0, 0, 1), -- Stabled Frostwolf
-- (@CGUID+1103, 13618, 30, -1268.26, -598.099, 55.3862, 6.17373, 430, 430, 5, 0, 0, 1), -- Stabled Frostwolf
-- (@CGUID+1104, 13618, 30, -1269.19, -609.817, 55.3277, 6.16468, 430, 430, 5, 0, 0, 1), -- Stabled Frostwolf
-- (@CGUID+1105, 13618, 30, -1267.93, -592.807, 55.3891, 6.23267, 430, 430, 5, 0, 0, 1), -- Stabled Frostwolf
-- (@CGUID+1106, 13676, 30, 2.63958, -437.79, 44.5915, 4.18745, 430, 430, 5, 0, 0, 1), -- Stabled Alterac Ram
-- (@CGUID+1107, 13676, 30, -6.28015, -451.074, 44.5915, 1.00879, 430, 430, 5, 0, 0, 1), -- Stabled Alterac Ram
-- (@CGUID+1110, 13959, 30, 2.18374, 160.637, 10.0215, 0.044756, 430, 430, 5, 0, 0, 1), -- Alterac Yeti
-- (@CGUID+1111, 13959, 30, 32.104, 61.6575, -0.485879, 1.75298, 430, 430, 5, 0, 0, 1), -- Alterac Yeti
-- (@CGUID+1112, 13959, 30, 148.343, 66.2234, 6.05096, 5.92035, 430, 430, 5, 0, 0, 1), -- Alterac Yeti
-- (@CGUID+1113, 13959, 30, 71.0416, 187.098, 7.40629, 4.71952, 430, 430, 5, 0, 0, 1), -- Alterac Yeti
-- (@CGUID+1114, 13959, 30, 92.5633, 133.908, 3.28235, 5.27716, 430, 430, 5, 0, 0, 1), -- Alterac Yeti

-- positions corrupted in sniff should be around X: -1389 at horde entrance
-- (@CGUID+1139, 14285, 30, -889.322, -543.784, 55.6655, 2.53483, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1140, 14285, 30, -819.7, -658.118, 53.002, 0.538491, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1141, 14285, 30, -734.548, -699.039, 51.1097, 0.293001, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1142, 14285, 30, -875.008, -559.704, 57.06, 5.32652, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1143, 14285, 30, -853.968, -574.578, 57.895, 3.53729, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1144, 14285, 30, -757.815, -673.444, 52.2337, 4.96346, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1145, 14285, 30, -836.914, -624.471, 54.0821, 1.32866, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1146, 14285, 30, -878.21, -535.002, 54.9482, 1.81071, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1147, 14285, 30, -726.635, -695.739, 51.2789, 3.64901, 2100, 2100, 5, 0, 0, 1), -- Frostwolf Battleguard
-- (@CGUID+1141, 14762, 30, 685.306, -126.185, 63.6432, 4.14633, 490, 490, 0, 0, 0, 0), -- Dun Baldar North Marshal
-- (@CGUID+1143, 14763, 30, 544.579, -93.9946, 44.8191, 0.575999, 490, 490, 0, 0, 0, 0), -- Dun Baldar South Marshal
-- (@CGUID+1145, 14764, 30, 199.209, -375.104, 49.2677, 0.701491, 490, 490, 0, 0, 0, 0), -- Icewing Marshal
-- (@CGUID+1147, 14765, 30, -33.6845, -294.281, 15.0786, 3.12152, 490, 490, 0, 0, 0, 0), -- Stonehearth Marshal
-- (@CGUID+1148, 14765, 30, 717.721, -11.2483, 50.1353, 3.37397, 490, 490, 0, 0, 0, 0), -- Stonehearth Marshal
-- (@CGUID+1150, 14766, 30, 701.885, -11.9266, 50.1353, 5.65734, 490, 490, 0, 0, 0, 0), -- Iceblood Marshal
-- (@CGUID+1151, 14768, 30, 704.404, -20.9202, 50.1353, 1.16734, 490, 490, 0, 0, 0, 0), -- East Frostwolf Marshal
-- (@CGUID+1152, 14769, 30, 715.594, -4.80602, 50.1353, 4.17049, 490, 490, 0, 0, 0, 0), -- West Frostwolf Marshal
-- (@CGUID+1153, 14772, 30, -1351.56, -214.173, 99.3702, 3.88358, 430, 430, 0, 0, 0, 0), -- East Frostwolf Warmaster
-- (@CGUID+1155, 14773, 30, -1353.58, -211.316, 99.3709, 4.20155, 490, 490, 0, 0, 0, 0), -- Iceblood Warmaster
-- (@CGUID+1157, 14774, 30, -1388.15, -223.224, 99.3699, 5.94314, 490, 490, 0, 0, 0, 0), -- Icewing Warmaster
-- (@CGUID+1158, 14775, 30, -1274.52, -220.848, 72.3495, 5.95713, 490, 490, 0, 0, 0, 0), -- Stonehearth Warmaster
-- (@CGUID+1159, 14775, 30, -1237.06, -260.505, 73.3262, 1.98056, 490, 490, 0, 0, 0, 0), -- Stonehearth Warmaster
-- (@CGUID+1160, 14776, 30, -1384.57, -214.123, 99.3711, 5.60385, 490, 490, 0, 0, 0, 0), -- Tower Point Warmaster
-- (@CGUID+1162, 14777, 30, -1388.38, -226.065, 99.3698, 6.22783, 430, 430, 0, 0, 0, 0), -- West Frostwolf Warmaster
-- (@CGUID+1164, 14943, 30, 633.803, -299.425, 30.1336, 3.46924, 490, 490, 0, 0, 0, 0), -- Guse's War Rider

-- TBC+
UPDATE `creature` SET `spawnMask` = 1 WHERE `map` = 30;

-- WOTLK+

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES
(@OGUID+136, 63, 0), -- Alliance - Captain Dead
(@OGUID+137, 63, 0), -- Alliance - Captain Dead
(@OGUID+138, 63, 0), -- Alliance - Captain Dead
(@OGUID+139, 63, 0), -- Alliance - Captain Dead
(@OGUID+140, 63, 0), -- Alliance - Captain Dead
(@OGUID+146, 63, 0), -- Alliance - Captain Dead
(@OGUID+147, 63, 0), -- Alliance - Captain Dead
(@OGUID+148, 63, 0), -- Alliance - Captain Dead
(@OGUID+149, 63, 0), -- Alliance - Captain Dead
(@OGUID+150, 63, 0), -- Alliance - Captain Dead
(@OGUID+191, 254, 0), -- Doors
(@OGUID+192, 254, 0), -- Doors
(@OGUID+28, 8, 1), -- Dunbaldar North - Alliance Control
(@OGUID+32, 8, 1), -- Dunbaldar North - Alliance Control
(@OGUID+179, 8, 2), -- Dunbaldar North - Horde Assaulted
(@OGUID+183, 8, 2), -- Dunbaldar North - Horde Assaulted
(@OGUID+67, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+68, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+69, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+70, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+71, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+72, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+73, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+74, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+75, 8, 3), -- Dunbaldar North - Horde Control
(@OGUID+27, 7, 1), -- Dunbaldar South - Alliance Control
(@OGUID+31, 7, 1), -- Dunbaldar South - Alliance Control
(@OGUID+178, 7, 2), -- Dunbaldar South - Horde Assaulted
(@OGUID+182, 7, 2), -- Dunbaldar South - Horde Assaulted
(@OGUID+57, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+58, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+59, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+60, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+61, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+62, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+63, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+64, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+65, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+66, 7, 3), -- Dunbaldar South - Horde Control
(@OGUID+156, 0, 0), -- Firstaid Station - Alliance Assaulted
(@OGUID+20, 0, 1), -- Firstaid Station - Alliance Control
(@OGUID+163, 0, 2), -- Firstaid Station - Horde Assaulted
(@OGUID+13, 0, 3), -- Firstaid Station - Horde Control
(@OGUID+37, 13, 0), -- Frostwolf east Tower - Alliance Assaulted
(@OGUID+188, 13, 0), -- Frostwolf east Tower - Alliance Assaulted
(@OGUID+116, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+117, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+118, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+119, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+120, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+121, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+122, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+123, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+124, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+125, 13, 1), -- Frostwolf east Tower - Alliance Control
(@OGUID+41, 13, 3), -- Frostwolf east Tower - Horde Control
(@OGUID+45, 13, 3), -- Frostwolf east Tower - Horde Control
(@OGUID+161, 5, 0), -- Frostwolf Grave - Alliance Assaulted
(@OGUID+25, 5, 1), -- Frostwolf Grave - Alliance Control
(@OGUID+168, 5, 2), -- Frostwolf Grave - Horde Assaulted
(@OGUID+18, 5, 3), -- Frostwolf Grave - Horde Control
(@OGUID+162, 6, 0), -- Frostwolf Hut - Alliance Assaulted
(@OGUID+26, 6, 1), -- Frostwolf Hut - Alliance Control
(@OGUID+169, 6, 2), -- Frostwolf Hut - Horde Assaulted
(@OGUID+19, 6, 3), -- Frostwolf Hut - Horde Control
(@OGUID+38, 14, 0), -- Frostwolf west Tower - Alliance Assaulted
(@OGUID+189, 14, 0), -- Frostwolf west Tower - Alliance Assaulted
(@OGUID+126, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+127, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+128, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+129, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+130, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+131, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+132, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+133, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+134, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+135, 14, 1), -- Frostwolf west Tower - Alliance Control
(@OGUID+42, 14, 3), -- Frostwolf west Tower - Horde Control
(@OGUID+46, 14, 3), -- Frostwolf west Tower - Horde Control
(@OGUID+141, 64, 0), -- Horde - Captain Dead
(@OGUID+142, 64, 0), -- Horde - Captain Dead
(@OGUID+143, 64, 0), -- Horde - Captain Dead
(@OGUID+144, 64, 0), -- Horde - Captain Dead
(@OGUID+145, 64, 0), -- Horde - Captain Dead
(@OGUID+151, 64, 0), -- Horde - Captain Dead
(@OGUID+152, 64, 0), -- Horde - Captain Dead
(@OGUID+153, 64, 0), -- Horde - Captain Dead
(@OGUID+154, 64, 0), -- Horde - Captain Dead
(@OGUID+155, 64, 0), -- Horde - Captain Dead
(@OGUID+160, 4, 0), -- Iceblood Grave - Alliance Assaulted
(@OGUID+24, 4, 1), -- Iceblood Grave - Alliance Control
(@OGUID+167, 4, 2), -- Iceblood Grave - Horde Assaulted
(@OGUID+17, 4, 3), -- Iceblood Grave - Horde Control
(@OGUID+35, 11, 0), -- Iceblood Tower - Alliance Assaulted
(@OGUID+186, 11, 0), -- Iceblood Tower - Alliance Assaulted
(@OGUID+96, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+97, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+98, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+99, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+100, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+101, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+102, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+103, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+104, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+105, 11, 1), -- Iceblood Tower - Alliance Control
(@OGUID+39, 11, 3), -- Iceblood Tower - Horde Control
(@OGUID+43, 11, 3), -- Iceblood Tower - Horde Control
(@OGUID+29, 9, 1), -- Icewing Bunker - Alliance Control
(@OGUID+33, 9, 1), -- Icewing Bunker - Alliance Control
(@OGUID+180, 9, 2), -- Icewing Bunker - Horde Assaulted
(@OGUID+184, 9, 2), -- Icewing Bunker - Horde Assaulted
(@OGUID+76, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+77, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+78, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+79, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+80, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+81, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+82, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+83, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+84, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+85, 9, 3), -- Icewing Bunker - Horde Control
(@OGUID+159, 3, 0), -- Snowfall Grave - Alliance Assaulted
(@OGUID+170, 3, 0), -- Snowfall Grave - Alliance Assaulted
(@OGUID+171, 3, 0), -- Snowfall Grave - Alliance Assaulted
(@OGUID+172, 3, 0), -- Snowfall Grave - Alliance Assaulted
(@OGUID+173, 3, 0), -- Snowfall Grave - Alliance Assaulted
(@OGUID+23, 3, 1), -- Snowfall Grave - Alliance Control
(@OGUID+49, 3, 1), -- Snowfall Grave - Alliance Control
(@OGUID+50, 3, 1), -- Snowfall Grave - Alliance Control
(@OGUID+51, 3, 1), -- Snowfall Grave - Alliance Control
(@OGUID+52, 3, 1), -- Snowfall Grave - Alliance Control
(@OGUID+166, 3, 2), -- Snowfall Grave - Horde Assaulted
(@OGUID+174, 3, 2), -- Snowfall Grave - Horde Assaulted
(@OGUID+175, 3, 2), -- Snowfall Grave - Horde Assaulted
(@OGUID+176, 3, 2), -- Snowfall Grave - Horde Assaulted
(@OGUID+177, 3, 2), -- Snowfall Grave - Horde Assaulted
(@OGUID+16, 3, 3), -- Snowfall Grave - Horde Control
(@OGUID+53, 3, 3), -- Snowfall Grave - Horde Control
(@OGUID+54, 3, 3), -- Snowfall Grave - Horde Control
(@OGUID+55, 3, 3), -- Snowfall Grave - Horde Control
(@OGUID+56, 3, 3), -- Snowfall Grave - Horde Control
(@OGUID+190, 3, 5), -- Snowfall Grave - Neutral Control
(@OGUID+30, 10, 1), -- Stoneheart Bunker - Alliance Control
(@OGUID+34, 10, 1), -- Stoneheart Bunker - Alliance Control
(@OGUID+181, 10, 2), -- Stoneheart Bunker - Horde Assaulted
(@OGUID+185, 10, 2), -- Stoneheart Bunker - Horde Assaulted
(@OGUID+86, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+87, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+88, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+89, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+90, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+91, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+92, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+93, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+94, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+95, 10, 3), -- Stoneheart Bunker - Horde Control
(@OGUID+158, 2, 0), -- Stoneheart Grave - Alliance Assaulted
(@OGUID+22, 2, 1), -- Stoneheart Grave - Alliance Control
(@OGUID+165, 2, 2), -- Stoneheart Grave - Horde Assaulted
(@OGUID+15, 2, 3), -- Stoneheart Grave - Horde Control
(@OGUID+157, 1, 0), -- Stormpike Grave - Alliance Assaulted
(@OGUID+21, 1, 1), -- Stormpike Grave - Alliance Control
(@OGUID+164, 1, 2), -- Stormpike Grave - Horde Assaulted
(@OGUID+14, 1, 3), -- Stormpike Grave - Horde Control
(@OGUID+36, 12, 0), -- Tower Point - Alliance Assaulted
(@OGUID+187, 12, 0), -- Tower Point - Alliance Assaulted
(@OGUID+106, 12, 1), -- Tower Point - Alliance Control
(@OGUID+107, 12, 1), -- Tower Point - Alliance Control
(@OGUID+108, 12, 1), -- Tower Point - Alliance Control
(@OGUID+109, 12, 1), -- Tower Point - Alliance Control
(@OGUID+110, 12, 1), -- Tower Point - Alliance Control
(@OGUID+111, 12, 1), -- Tower Point - Alliance Control
(@OGUID+112, 12, 1), -- Tower Point - Alliance Control
(@OGUID+113, 12, 1), -- Tower Point - Alliance Control
(@OGUID+114, 12, 1), -- Tower Point - Alliance Control
(@OGUID+115, 12, 1), -- Tower Point - Alliance Control
(@OGUID+40, 12, 3), -- Tower Point - Horde Control
(@OGUID+44, 12, 3); -- Tower Point - Horde Control

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 2413, 30, 41.16716, -426.8661, 44.68277, 2.783799, 0, 0, 0, 0, 120, 120, 0, 1), -- Wooden Chair
(@OGUID+2, 2413, 30, 39.09879, -425.7462, 44.68799, -0.6195922, 0, 0, 0, 0, 120, 120, 0, 1), -- Wooden Chair
(@OGUID+3, 2413, 30, 25.758, -425.837, 47.6369, -1.98095, 0, 0, 0, 0, 120, 120, 0, 1), -- Wooden Chair
(@OGUID+4, 2413, 30, 27.6786, -427.69, 47.6369, -2.67908, 0, 0, 0, 0, 120, 120, 0, 1), -- Wooden Chair
(@OGUID+5, 2413, 30, 25.2482, -433.104, 47.6369, 2.38237, 0, 0, 0, 0, 120, 120, 0, 1), -- Wooden Chair
(@OGUID+6, 112192, 30, -155.405, -440.24, 33.2862, 2.34747, 0, 0, 0, 0, 120, 120, 0, 1), -- Chair
(@OGUID+7, 112192, 30, -150.787, -459.829, 26.4163, 0.558507, 0, 0, 0, 0, 120, 120, 0, 1), -- Chair
(@OGUID+8, 112192, 30, -153.748, -438.639, 33.2862, -2.88852, 0, 0, 0, 0, 120, 120, 0, 1), -- Chair
(@OGUID+9, 112192, 30, -149.057, -461.089, 26.4163, 1.38754, 0, 0, 0, 0, 120, 120, 0, 1), -- Chair
(@OGUID+10, 112192, 30, -168.342, -458.4, 33.2862, -0.445059, 0, 0, 0, 0, 120, 120, 0, 1), -- Chair
(@OGUID+11, 112192, 30, -142.968, -444.076, 26.4163, -2.23402, 0, 0, 0, 0, 120, 120, 0, 1), -- Chair
(@OGUID+12, 112192, 30, -145.341, -444.846, 26.4163, -0.05236, 0, 0, 0, 0, 120, 120, 0, 1), -- Chair
(@OGUID+13, 178364, 30, 638.592, -32.422, 46.0608, -1.62316, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+14, 178364, 30, 669.007, -294.078, 30.2909, 2.77507, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+15, 178364, 30, 77.8013, -404.7, 46.7549, -0.872665, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+16, 178364, 30, -202.6227,-112.5515,78.49015,-1.256636, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+17, 178364, 30, -611.962, -396.17, 60.8351, 2.53682, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+18, 178364, 30, -1082.45, -346.823, 54.9219, -1.53589, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+19, 178364, 30, -1402.21, -307.431, 89.4424, 0.191986, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+20, 178365, 30, 638.592, -32.422, 46.0608, -1.62316, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+21, 178365, 30, 669.007, -294.078, 30.2909, 2.77507, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+22, 178365, 30, 77.8013, -404.7, 46.7549, -0.872665, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+23, 178365, 30, -202.6227,-112.5515,78.49015,-1.256636, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+24, 178365, 30, -611.962, -396.17, 60.8351, 2.53682, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+25, 178365, 30, -1082.45, -346.823, 54.9219, -1.53589, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+26, 178365, 30, -1402.21, -307.431, 89.4424, 0.191986, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+27, 178925, 30, 553.779, -78.6566, 51.9378, -1.22173, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+28, 178925, 30, 674.001, -143.125, 63.6615, 0.994838, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+29, 178925, 30, 203.281, -360.366, 56.3869, -0.925024, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+30, 178925, 30, -152.437, -441.758, 40.3982, -1.95477, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
(@OGUID+31, 178927, 30, 557.2267, -86.85205, 62.1767, -0.244346, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance A1 Tower Banner BIG
(@OGUID+32, 178927, 30, 679.339, -136.468, 73.9626, -2.16421, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance A1 Tower Banner BIG
(@OGUID+33, 178927, 30, 208.973, -365.971, 66.7409, -0.244346, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance A1 Tower Banner BIG
(@OGUID+34, 178927, 30, -155.832, -449.401, 52.7306, 0.610865, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance A1 Tower Banner BIG
(@OGUID+35, 178940, 30, -571.88, -262.777, 75.0087, -0.802851, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+36, 178940, 30, -768.907, -363.71, 90.8949, 1.07991, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+37, 178940, 30, -1302.9, -316.981, 113.867, 2.00713, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+38, 178940, 30, -1297.5, -266.767, 114.15, 3.31044, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+39, 178943, 30, -571.88, -262.777, 75.0087, -0.802851, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+40, 178943, 30, -768.907, -363.71, 90.8949, 1.07991, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+41, 178943, 30, -1302.9, -316.981, 113.867, 2.00713, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+42, 178943, 30, -1297.5, -266.767, 114.15, 3.31044, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
(@OGUID+43, 178955, 30, -572.329, -262.476, 88.6496, -0.575959, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde H1 Tower Banner BIG
(@OGUID+44, 178955, 30, -768.199, -363.105, 104.537, 0.10472, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde H1 Tower Banner BIG
(@OGUID+45, 178955, 30, -1302.84, -316.582, 127.516, 0.122173, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde H1 Tower Banner BIG
(@OGUID+46, 178955, 30, -1297.87, -266.762, 127.796, 0.0698132, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde H1 Tower Banner BIG
(@OGUID+47, 179024, 30, 63.2712, 5.83762, -4.09622, 2.21657, 0, 0, 0, 0, 120, 120, 100, 1), -- Stormpike Banner
(@OGUID+48, 179025, 30, -1551.88, -364.188, 65.5934, -1.95477, 0, 0, 0, 0, 120, 120, 100, 1), -- Frostwolf Banner
(@OGUID+49, 179044, 30, -191.153, -129.868, 78.5595, -1.25664, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Banner BIG
(@OGUID+50, 179044, 30, -201.282, -134.319, 78.6753, -0.942478, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Banner BIG
(@OGUID+51, 179044, 30, -215.981, -91.4101, 80.8702, -1.74533, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Banner BIG
(@OGUID+52, 179044, 30, -200.465, -96.418, 79.7587, 1.36136, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Banner BIG
(@OGUID+53, 179064, 30, -190.941, -129.8694, 78.93259, -1.064651, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Banner BIG
(@OGUID+54, 179064, 30, -201.4437, -134.4444, 78.93211, -0.8552116, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Banner BIG
(@OGUID+55, 179064, 30, -215.741, -90.99729, 80.08942, 1.169371, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Banner BIG
(@OGUID+56, 179064, 30, -200.4294, -96.50825, 79.75236, 1.343904, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Banner BIG
(@OGUID+57, 179065, 30, 562.632, -88.1815, 61.993, 0.383972, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+58, 179065, 30, 562.523, -74.5028, 37.9474, -0.0523599, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+59, 179065, 30, 558.097, -70.9842, 52.4876, 0.820305, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+60, 179065, 30, 578.167, -71.8191, 38.1514, 2.72271, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+61, 179065, 30, 556.028, -94.9242, 44.8191, 3.05433, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+62, 179065, 30, 572.451, -94.3655, 37.9443, -1.72788, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+63, 179065, 30, 549.263, -79.3645, 44.8191, 0.436332, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+64, 179065, 30, 543.513, -94.4006, 52.4819, 0.0349066, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+65, 179065, 30, 572.149, -93.7862, 52.5726, 0.541052, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+66, 179065, 30, 582.162, -81.2375, 37.9216, 0.0872665, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+67, 179065, 30, 664.797, -143.65, 64.1784, -0.453786, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+68, 179065, 30, 664.505, -139.452, 49.6696, -0.0349067, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+69, 179065, 30, 676.067, -124.319, 49.6726, -1.01229, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+70, 179065, 30, 693.004, -144.025, 64.1755, 2.44346, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+71, 179065, 30, 661.175, -117.691, 49.645, 1.91986, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+72, 179065, 30, 684.423, -146.582, 63.6662, 0.994838, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+73, 179065, 30, 682.791, -127.769, 62.4155, 1.09956, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+74, 179065, 30, 674.576, -147.101, 56.5425, -1.6057, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+75, 179065, 30, 655.719, -126.673, 49.8138, 2.80998, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+76, 179065, 30, 231.5031, -356.6881, 42.37038, 0.296706, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+77, 179065, 30, 224.9886, -348.1752, 42.5607, 1.500983, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+78, 179065, 30, 205.7818, -351.3352, 56.8998, 1.012291, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+79, 179065, 30, 196.6049, -369.1871, 56.39142, 2.460914, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+80, 179065, 30, 210.6188, -376.9375, 49.26771, 2.86234, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+81, 179065, 30, 209.6469, -352.632, 42.39587, -0.6981319, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+82, 179065, 30, 220.65, -368.1324, 42.39781, -0.2617996, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+83, 179065, 30, 224.6821, -374.0315, 57.06791, 0.541052, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+84, 179065, 30, 200.2596, -359.9676, 49.26771, -2.897247, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+85, 179065, 30, 196.6188, -378.0163, 56.91305, 1.012291, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+86, 179065, 30, -155.4875, -437.3559, 33.27962, 2.600541, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+87, 179065, 30, -163.4411, -454.1876, 33.27962, 1.937315, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+88, 179065, 30, -143.9772, -445.1482, 26.40972, -1.867502, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+89, 179065, 30, -135.764, -464.7083, 26.38227, 2.251475, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+90, 179065, 30, -154.0755, -466.929, 41.06355, -1.867502, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+91, 179065, 30, -149.9082, -460.3317, 26.40835, -2.094395, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+92, 179065, 30, -151.6378, -439.5213, 40.37969, 0.4363323, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+93, 179065, 30, -131.301, -454.9045, 26.57706, 2.932153, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+94, 179065, 30, -171.291, -444.6835, 40.92113, 2.303835, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+95, 179065, 30, -143.5915, -439.7497, 40.92749, -1.727876, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+96, 179065, 30, -572.667, -267.923, 56.8542, 2.35619, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+97, 179065, 30, -561.021, -262.689, 68.4589, 1.37881, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+98, 179065, 30, -572.538, -262.649, 88.6197, 1.8326, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+99, 179065, 30, -574.77, -251.45, 74.9422, -1.18682, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+100, 179065, 30, -578.625, -267.571, 68.4696, 0.506145, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+101, 179065, 30, -571.476, -257.234, 63.3223, 3.10669, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+102, 179065, 30, -566.035, -273.907, 52.9582, -0.890118, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+103, 179065, 30, -580.948, -259.77, 68.4696, 1.46608, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+104, 179065, 30, -568.318, -267.1, 75.0008, 1.01229, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+105, 179065, 30, -559.621, -268.597, 52.8986, 0.0523599, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+106, 179065, 30, -776.072, -368.046, 84.3558, 2.63545, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+107, 179065, 30, -777.564, -368.521, 90.6701, 1.72788, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+108, 179065, 30, -765.461, -357.711, 90.888, 0.314159, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+109, 179065, 30, -768.763, -362.735, 104.612, 1.81514, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+110, 179065, 30, -760.356, -358.896, 84.3558, 2.1293, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+111, 179065, 30, -771.967, -352.838, 84.3484, 1.74533, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+112, 179065, 30, -773.333, -364.653, 79.2351, -1.64061, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+113, 179065, 30, -764.109, -366.069, 70.0934, 0.383972, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+114, 179065, 30, -767.103, -350.737, 68.7933, 2.80998, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+115, 179065, 30, -760.115, -353.845, 68.8633, 1.79769, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+116, 179065, 30, -1304.87, -304.525, 91.8366, -0.680679, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+117, 179065, 30, -1301.77, -310.974, 95.8252, 0.907571, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+118, 179065, 30, -1305.58, -320.625, 102.166, -0.558505, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+119, 179065, 30, -1294.27, -323.468, 113.893, -1.67552, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+120, 179065, 30, -1302.65, -317.192, 127.487, 2.30383, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+121, 179065, 30, -1293.89, -313.478, 107.328, 1.6057, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+122, 179065, 30, -1312.41, -312.999, 107.328, 1.5708, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+123, 179065, 30, -1311.57, -308.08, 91.7666, -1.85005, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+124, 179065, 30, -1314.7, -322.131, 107.36, 0.645772, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+125, 179065, 30, -1304.6, -310.754, 113.859, -0.401426, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+126, 179065, 30, -1308.24, -273.26, 92.0514, -0.139626, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+127, 179065, 30, -1302.26, -262.858, 95.9269, 0.418879, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+128, 179065, 30, -1297.28, -267.773, 126.756, 2.23402, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+129, 179065, 30, -1299.08, -256.89, 114.108, -2.44346, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+130, 179065, 30, -1303.41, -268.237, 114.151, -1.23918, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+131, 179065, 30, -1304.43, -273.682, 107.612, 0.244346, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+132, 179065, 30, -1309.53, -265.951, 92.1418, -2.49582, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+133, 179065, 30, -1295.55, -263.865, 105.033, 0.925024, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+134, 179065, 30, -1294.71, -281.466, 107.664, -1.50098, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+135, 179065, 30, -1289.69, -259.521, 107.612, -2.19912, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+136, 179065, 30, -3.409288, -306.2875, 33.33995, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+137, 179065, 30, -48.61903, -266.9165, 47.81679, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+138, 179065, 30, -62.94738, -286.212, 66.72883, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+139, 179065, 30, -5.051324, -325.323, 38.85361, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+140, 179065, 30, -64.26768, -289.4115, 33.46896, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+141, 179065, 30, -517.053, -200.429, 80.759, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+142, 179065, 30, -514.361, -163.864, 104.163, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+143, 179065, 30, -568.04, -188.707, 81.55, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+144, 179065, 30, -501.775, -151.581, 81.2027, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+145, 179065, 30, -509.975, -191.652, 83.2978, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Roaring Flame
(@OGUID+146, 179066, 30, -64.4987, -289.3301, 33.46157, -2.827433, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+147, 179066, 30, -5.980252, -326.1439, 38.85382, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+148, 179066, 30, -2.678928, -306.9978, 33.41654, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+149, 179066, 30, -60.25, -309.2321, 50.24081, -1.466077, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+150, 179066, 30, -48.79406, -266.5331, 47.79163, 2.443461, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+151, 179066, 30, -524.276, -199.6, 82.8733, -1.46608, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+152, 179066, 30, -518.196, -173.085, 102.43, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+153, 179066, 30, -500.732, -145.358, 88.5337, 2.44346, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+154, 179066, 30, -501.084, -150.784, 80.8506, 0, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+155, 179066, 30, -518.309, -163.963, 102.521, 2.96706, 0, 0, 0, 0, 0, 0, 0, 0), -- Smoke Emitter, Large AOI, scale 2
(@OGUID+156, 179286, 30, 638.592, -32.422, 46.0608, -1.62316, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+157, 179286, 30, 669.007, -294.078, 30.2909, 2.77507, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+158, 179286, 30, 77.8013, -404.7, 46.7549, -0.872665, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+159, 179286, 30, -202.6227,-112.5515,78.49015,-1.256636, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+160, 179286, 30, -611.962, -396.17, 60.8351, 2.53682, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+161, 179286, 30, -1082.45, -346.823, 54.9219, -1.53589, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+162, 179286, 30, -1402.21, -307.431, 89.4424, 0.191986, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+163, 179287, 30, 638.592, -32.422, 46.0608, -1.62316, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+164, 179287, 30, 669.2953, -294.0375, 30.28969, -0.3665193, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+165, 179287, 30, 77.8013, -404.7, 46.7549, -0.872665, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+166, 179287, 30, -202.6227,-112.5515,78.49015,-1.256636, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+167, 179287, 30, -611.962, -396.17, 60.8351, 2.53682, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+168, 179287, 30, -1082.45, -346.823, 54.9219, -1.53589, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+169, 179287, 30, -1402.21, -307.431, 89.4424, 0.191986, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+170, 179424, 30, -191.153, -129.868, 78.5595, -1.25664, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Pre-Banner BIG
(@OGUID+171, 179424, 30, -201.282, -134.319, 78.6753, -0.942478, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Pre-Banner BIG
(@OGUID+172, 179424, 30, -215.981, -91.4101, 80.8702, -1.74533, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Pre-Banner BIG
(@OGUID+173, 179424, 30, -200.465, -96.418, 79.7587, 1.36136, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Alliance Graveyard Mid Pre-Banner BIG
(@OGUID+174, 179425, 30, -191.153, -129.868, 78.5595, -1.25664, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Pre-Banner BIG
(@OGUID+175, 179425, 30, -201.282, -134.319, 78.6753, -0.942478, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Pre-Banner BIG
(@OGUID+176, 179425, 30, -215.981, -91.4101, 80.8702, -1.74533, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Pre-Banner BIG
(@OGUID+177, 179425, 30, -200.465, -96.418, 79.7587, 1.36136, 0, 0, 0, 0, 60, 60, 0, 0), -- [PH] Horde Graveyard Mid Pre-Banner BIG
(@OGUID+178, 179435, 30, 553.8216, -78.76752, 51.93868, -1.064651, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+179, 179435, 30, 674.001, -143.125, 63.6615, 0.994838, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+180, 179435, 30, 203.281, -360.366, 56.3869, -0.925024, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+181, 179435, 30, -152.437, -441.758, 40.3982, -1.95477, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
(@OGUID+182, 179436, 30, 555.8476, -84.41515, 64.43967, 3.124139, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde A1 Tower Pre-Banner BIG
(@OGUID+183, 179436, 30, 679.339, -136.468, 73.9626, -2.16421, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde A1 Tower Pre-Banner BIG
(@OGUID+184, 179436, 30, 208.973, -365.971, 66.7409, -0.244346, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde A1 Tower Pre-Banner BIG
(@OGUID+185, 179436, 30, -155.832, -449.401, 52.7306, 0.610865, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Horde A1 Tower Pre-Banner BIG
(@OGUID+186, 179446, 30, -572.329, -262.476, 88.6496, -0.575959, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance H1 Tower Pre-Banner BIG
(@OGUID+187, 179446, 30, -768.199, -363.105, 104.537, 0.10472, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance H1 Tower Pre-Banner BIG
(@OGUID+188, 179446, 30, -1302.84, -316.582, 127.516, 0.122173, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance H1 Tower Pre-Banner BIG
(@OGUID+189, 179446, 30, -1297.87, -266.762, 127.796, 0.0698132, 0, 0, 0, 0, 0, 0, 0, 0), -- [PH] Alliance H1 Tower Pre-Banner BIG
(@OGUID+190, 180418, 30, -202.6107,-112.778,78.48716,-1.151916, 0, 0, 0, 0, 0, 0, 100, 1), -- Snowfall Banner
(@OGUID+191, 180424, 30, 780.487, -493.024, 99.9553, 3.0976, 0, 0, 0, 0, 60, 60, 100, 1), -- Alterac Valley Gate
(@OGUID+192, 180424, 30, -1375.19, -538.981, 55.2824, 0.72178, 0, 0, 0, 0, 60, 60, 100, 1), -- Alterac Valley Gate
(@OGUID+193, 180654, 30, 713.369, -457.524, 68.5122, 0.173563, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+194, 180654, 30, 663.165, -258.335, 14.6348, 4.77835, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+195, 180654, 30, 383.217, -370.09, -18.2239, 5.40746, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+196, 180654, 30, 441.107, -243.111, -19.4384, 1.38779, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+197, 180654, 30, 319.974, -177.098, -30.7619, 2.12292, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+198, 180654, 30, 290.743, -90.8554, -39.989, 1.69881, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+199, 180654, 30, 331.946, -4.27387, -2.21438, 0.661298, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+200, 180654, 30, 269.75, 40.629, 20.6186, 2.64521, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+201, 180654, 30, 393.96, -126.64, -8.37789, 5.64857, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+202, 180654, 30, 510.265, -79.9827, 13.2593, 0.951894, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+203, 180654, 30, 382.65, -257.878, -40.0292, 3.81624, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+204, 180654, 30, 292.685, -404.206, 16.4788, 0.0730329, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+205, 180654, 30, 187.871, -347.493, 49.9014, 0.794812, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+206, 180654, 30, 107.732, -259.346, 25.1696, 0.524635, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+207, 180654, 30, 6.7223, -350.19, 18.5508, 4.91501, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+208, 180654, 30, -30.5515, -393.019, 22.7206, 4.90951, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+209, 180654, 30, -60.9539, -491.516, 45.2524, 3.47538, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+210, 180654, 30, -131.512, -559.269, 47.5295, 3.56884, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+211, 180654, 30, -171.517, -474.433, 28.6923, 2.25487, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+212, 180654, 30, -275.328, -460.374, 28.3529, 2.90518, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+213, 180654, 30, -341.738, -352.906, 10.0064, 1.94463, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+214, 180654, 30, -374.579, -238.116, 14.4059, 2.3177, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+215, 180654, 30, -377.27, -134.087, 26.4231, 0.201835, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+216, 180654, 30, -416.699, -43.0144, 35.6197, 2.37582, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+217, 180654, 30, -268.635, -28.047, 41.0637, 2.0915, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+218, 180654, 30, -170.045, -95.8946, 35.1276, 4.58907, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+219, 180654, 30, -107.962, -147.486, 20.0322, 1.25898, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+220, 180654, 30, -35.2907, -188.867, 21.9315, 6.22191, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+221, 180654, 30, -332.611, -243.971, 14.2602, 0.685642, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+222, 180654, 30, -391.983, -319.717, 19.2212, 2.61144, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+223, 180654, 30, -453.542, -349.82, 33.1161, 4.78385, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+224, 180654, 30, -529.263, -363.65, 34.1552, 3.17928, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+225, 180654, 30, -469.793, -441.135, 37.7274, 5.88655, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+226, 180654, 30, -588.135, -284.45, 54.6961, 2.1889, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+227, 180654, 30, -598.035, -355.309, 61.6211, 4.64798, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+228, 180654, 30, -687.065, -354.415, 60.9971, 2.15277, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+229, 180654, 30, -727.579, -313.932, 64.9773, 3.01513, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+230, 180654, 30, -761.414, -392.392, 79.5707, 4.00709, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+231, 180654, 30, -906.423, -336.417, 55.4283, 2.59023, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+232, 180654, 30, -903.362, -493.481, 46.2971, 4.24585, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+233, 180654, 30, -917.213, -574.985, 65.2434, 4.13276, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+234, 180654, 30, -934.978, -526.52, 54.9837, 2.61223, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+235, 180654, 30, -1024.04, -427.249, 51.7721, 2.35069, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+236, 180654, 30, -1168.4, -441.957, 58.9765, 2.36404, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+237, 180654, 30, -1148.24, -370.189, 55.1857, 1.47026, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+238, 180654, 30, -1098.88, -287.895, 58.3042, 2.60987, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+239, 180654, 30, -1023.15, -266.23, 63.7499, 1.09798, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+240, 180654, 30, -952.973, -216.597, 70.0072, 5.94389, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+241, 180654, 30, -898.396, -279.974, 64.4548, 6.26433, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+242, 180654, 30, -812.467, -263.533, 61.2332, 0.308656, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+243, 180654, 30, -826.867, -206.29, 81.1801, 2.66564, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+244, 180654, 30, -751.005, -304.337, 67.9169, 0.265461, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+245, 180654, 30, -774.599, -276.901, 79.6937, 1.20087, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+246, 180654, 30, -1027.96, -345.436, 57.9763, 3.28846, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+247, 180654, 30, -1085.46, -416.242, 53.1229, 3.69529, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+248, 180654, 30, -1083.35, -524.103, 49.6222, 4.05972, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+249, 180654, 30, -1084.97, -637.372, 57.0936, 5.79388, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+250, 180654, 30, -1174.9, -651.996, 64.9471, 3.50366, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+251, 180654, 30, -1239.32, -587.034, 52.7883, 2.33813, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+252, 180654, 30, -1300.5, -579.354, 60.908, 2.54861, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+253, 180654, 30, -1356.81, -540.745, 54.1318, 4.59536, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+254, 180654, 30, -1385.98, -466.664, 49.9666, 4.12098, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+255, 180654, 30, -1331.21, -395.291, 50.6683, 2.29729, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+256, 180654, 30, -1262.1, -436.518, 57.4549, 3.07954, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+257, 180654, 30, -1290.14, -423.533, 65.2731, 4.787, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+258, 180654, 30, -1194.3, -414.699, 58.366, 0.177496, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+259, 180654, 30, -1154.95, -293.355, 39.1069, 4.95272, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+260, 180654, 30, -970.251, -309.063, 65.5942, 5.90305, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+261, 180654, 30, -811.955, -345.576, 53.6397, 0.328295, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+262, 180654, 30, -663.423, -398.289, 60.754, 0.713925, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+263, 180654, 30, -551.439, -418.423, 55.5601, 4.96371, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+264, 180654, 30, -465.786, -398.398, 28.1647, 1.58415, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+265, 180654, 30, -172.513, -399.726, 15.8117, 5.72634, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+266, 180654, 30, -99.5573, -376.942, 15.8158, 1.60378, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+267, 180654, 30, -32.7714, -523.832, 47.5873, 6.02479, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+268, 180654, 30, 7.6156, -433.974, 45.3332, 1.86375, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+269, 180654, 30, 84.1501, -465.508, 49.1185, 6.10647, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+270, 180654, 30, 64.5926, -440.894, 49.684, 3.01828, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+271, 180654, 30, 136.004, -320.534, 49.1353, 5.28808, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+272, 180654, 30, 256.619, -450.356, 49.4244, 0.402907, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+273, 180654, 30, 491.954, -316.141, -12.9273, 0.0981722, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+274, 180654, 30, 588.82, -348.094, 32.6343, 4.10684, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+275, 180654, 30, 649.332, -273.921, 31.1966, 1.18831, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+276, 180654, 30, 596.836, -114.791, 41.8419, 2.13864, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+277, 180654, 30, 694.055, -108.678, 51.906, 6.12139, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+278, 180654, 30, 604.648, -43.066, 40.3963, 1.75144, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+279, 180654, 30, 659.018, -4.70805, 55.5548, 0.571768, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+280, 180654, 30, 652.94, 33.3443, 70.3421, 1.17574, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+281, 180654, 30, 541.548, -62.9618, 37.852, 4.2168, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+282, 180654, 30, 558.834, -6.05473, 45.4063, 2.06403, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+283, 180654, 30, 489.569, 13.109, 24.3065, 2.8565, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+284, 180654, 30, 414.552, -36.1106, 0.967913, 4.02281, 0, 0, 0, 0, 600, 600, 100, 1), -- Hardpacked Snowdrift
(@OGUID+285, 178684, 30, 649.2648, -59.11024, 41.54757, -2.687807, 0, 0, 0, 0, 0, 0, 100, 1), -- Forge
(@OGUID+286, 178685, 30, 646.2073, -57.24284, 41.65868, -0.1570794, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+287, 179384, 30, 560.8342, -75.42657, 37.9558, 0.7853977, 0, 0, 0, 0, 0, 0, 100, 1), -- Chair
(@OGUID+288, 179385, 30, 550.678, -79.82339, 44.8257, -3.097959, 0, 0, 0, 0, 0, 0, 100, 1), -- Chair
(@OGUID+289, 179386, 30, 568.3257, -89.49924, 37.9558, 1.396264, 0, 0, 0, 0, 0, 0, 100, 1), -- Chair
(@OGUID+290, 179387, 30, 550.5966, -77.52127, 44.8257, -2.050763, 0, 0, 0, 0, 0, 0, 100, 1), -- Chair
(@OGUID+291, 179388, 30, 570.4194, -89.05669, 37.9558, 2.225296, 0, 0, 0, 0, 0, 0, 100, 1), -- Chair
(@OGUID+292, 179389, 30, 555.5166, -101.5895, 44.8257, 0.3926987, 0, 0, 0, 0, 0, 0, 100, 1), -- Chair
(@OGUID+293, 179390, 30, 561.8506, -73.14806, 37.9558, -1.396262, 0, 0, 0, 0, 0, 0, 100, 1), -- Chair
(@OGUID+294, 179391, 30, 548.6824, -100.8462, 44.81912, 1.466078, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+295, 179392, 30, 552.4286, -102.7644, 44.81912, 2.46964, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+296, 179393, 30, 549.4721, -101.5473, 44.81912, 1.160644, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+297, 179394, 30, 550.3475, -101.6985, 44.81912, 1.596975, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+298, 179395, 30, 551.2714, -102.2258, 44.81912, 0.8988435, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+299, 179396, 30, 553.9467, -103.3469, 44.81912, -0.1919862, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+300, 179397, 30, 553.7253, -102.396, 44.81912, 0.1570797, 0, 0, 0, 0, 0, 0, 100, 1), -- Anvil
(@OGUID+301, 179437, 30, 618.7482, -52.11258, 42.11218, -0.06981307, 0, 0, 0, 0, 0, 0, 100, 1), -- Wanted: ORCS!

(@OGUID+401, 178785, 30, 949.8772, -458.1977, 56.48738, 0.3141593, 0, 0, 0, 0, 300, 600, 100, 1), -- Irondeep Supplies
(@OGUID+402, 178785, 30, 900.3499, -479.024, 58.35533, 0.1221731, 0, 0, 0, 0, 300, 600, 100, 1), -- Irondeep Supplies
(@OGUID+403, 178785, 30, 817.5092, -457.3312, 48.46665, 2.076942, 0, 0, 0, 0, 300, 600, 100, 1), -- Irondeep Supplies

-- Comment Objective Gos for now as they require gameobject_battleground
-- (@OGUID+XXX, 179308, 30, 78.38553, -405.4505, 46.60544, -0.8552116, 0, 0, 0, 0, 0, 0, 100, 1), -- Contested Banner
-- (@OGUID+XXX, 180102, 30, 669.2953, -294.0375, 30.28969, -0.3665193, 0, 0, 0, 0, 0, 0, 100, 1), -- Neutral Banner Aura
-- (@OGUID+XXX, 180102, 30, -611.5228, -396.819, 60.85839, -0.03490669, 0, 0, 0, 0, 0, 0, 100, 1), -- Neutral Banner Aura
-- (@OGUID+XXX, 180102, 30, 77.80132, -404.6999, 46.75493, -0.8726647, 0, 0, 0, 0, 0, 0, 100, 1), -- Neutral Banner Aura
-- (@OGUID+XXX, 180102, 30, 78.38553, -405.4505, 46.60544, -0.8552116, 0, 0, 0, 0, 0, 0, 100, 1), -- Neutral Banner Aura
-- (@OGUID+XXX, 180423, 30, 555.8476, -84.41515, 64.43967, 3.124139, 0, 0, 0, 0, 0, 0, 100, 1), -- Neutral Banner Aura, Large
-- (@OGUID+XXX, 178389, 30, 669.0073, -294.0783, 30.29091, 2.775074, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
-- (@OGUID+XXX, 180100, 30, 669.0073, -294.0783, 30.29091, 2.775074, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner Aura
-- (@OGUID+XXX, 178925, 30, 553.7794, -78.65658, 51.93779, -1.22173, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner
-- (@OGUID+XXX, 180100, 30, 77.50445, -404.5873, 46.78254, 2.286381, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner Aura
-- (@OGUID+XXX, 178932, 30, 679.3392, -136.4678, 73.96262, -2.164208, 0, 0, 0, 0, 0, 0, 100, 1), -- [PH] Alliance A2 Tower Banner BIG
-- (@OGUID+XXX, 180421, 30, 557.2267, -86.85205, 62.1767, -0.244346, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner Aura, Large
-- (@OGUID+XXX, 180100, 30, 638.5921, -32.42204, 46.06084, -1.623156, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner Aura
-- (@OGUID+XXX, 180421, 30, 679.3392, -136.4678, 73.96262, -2.164208, 0, 0, 0, 0, 0, 0, 100, 1), -- Alliance Banner Aura, Large
-- (@OGUID+XXX, 178932, 30, 679.3392, -136.4678, 73.96262, -2.164208, 0, 0, 0, 0, 0, 0, 100, 1), -- [PH] Alliance A2 Tower Banner BIG
-- (@OGUID+XXX, 178945, 30, -768.0873, -362.6661, 90.89486, 1.117011, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
-- (@OGUID+XXX, 179483, 30, -612.6716, -396.6933, 60.85839, 3.089233, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
-- (@OGUID+XXX, 179436, 30, 555.8476, -84.41515, 64.43967, 3.124139, 0, 0, 0, 0, 0, 0, 100, 1), -- [PH] Horde A1 Tower Pre-Banner BIG
-- (@OGUID+XXX, 179440, 30, 677.5917, -139.0343, 76.21964, -1.989675, 0, 0, 0, 0, 0, 0, 100, 1), -- [PH] Horde A2 Tower Pre-Banner BIG
-- (@OGUID+XXX, 180101, 30, -1082.529, -346.567, 54.97712, -1.553343, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner Aura
-- (@OGUID+XXX, 180101, 30, -612.6716, -396.6933, 60.85839, 3.089233, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner Aura
-- (@OGUID+XXX, 180101, 30, -202.6227, -112.5515, 78.49015, -1.256637, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner Aura
-- (@OGUID+XXX, 180101, 30, 77.79785, -404.6955, 46.91283, -0.8552116, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner Aura
-- (@OGUID+XXX, 178946, 30, -571.8796, -262.7768, 75.00867, -0.8028515, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner
-- (@OGUID+XXX, 180422, 30, -768.199, -363.1053, 104.5372, 0.1047198, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner Aura, Large
-- (@OGUID+XXX, 178957, 30, -768.199, -363.1053, 104.5372, 0.1047198, 0, 0, 0, 0, 0, 0, 100, 1), -- [PH] Horde H3 Tower Banner BIG
-- (@OGUID+XXX, 180422, 30, -572.3289, -262.4763, 88.64957, -0.5759585, 0, 0, 0, 0, 0, 0, 100, 1), -- Horde Banner Aura, Large
-- (@OGUID+XXX, 178958, 30, -572.3289, -262.4763, 88.64957, -0.5759585, 0, 0, 0, 0, 0, 0, 100, 1), -- [PH] Horde H4 Tower Banner BIG
--
(@OGUID+992, 177261, 30, -1290.274, -172.4705, 72.18534, 3.06302, 0, 0, 0, 0, 0, 0, 100, 1), -- Brazier -> Spawns Campfire 2061
(@OGUID+993, 177262, 30, -1286.249, -184.4801, 71.8334, -2.05076, 0, 0, 0, 0, 0, 0, 100, 1), -- Campfire -> Spawns Campfire 2061
-- (@OGUID+994
(@OGUID+995, 177409, 30, -1215.592, -371.9459, 56.5293, 0.3577935, 0, 0, 0, 0, 0, 0, 100, 1), -- Brazier -> Spawns Campfire 2061
(@OGUID+996, 22205, 30, 50.64006, -421.1664, 44.73254, -0.008751923, 0, 0, 0, 0, 0, 0, 100, 1), -- Dwarven Fire -> Spawns Campfire 2061
(@OGUID+997, 177410, 30, -1241.247, -345.115, 59.68674, 0.3577935, 0, 0, 0, 0, 0, 0, 100, 1), -- Brazier -> Spawns Campfire 2061
(@OGUID+998, 177408, 30, -743.4266, -398.242, 76.42656, 0.8726642, 0, 0, 0, 0, 0, 0, 100, 1), -- Bonfire -> Spawns Bonfire Damage 2066
(@OGUID+999, 177411, 30, -1202.805, -271.5985, 72.58054, 0.3577935, 0, 0, 0, 0, 0, 0, 100, 1); -- Brazier -> Spawns Campfire 2061

-- TBC+
UPDATE `gameobject` SET `spawnMask` = 1 WHERE `map` = 30;

-- WOTLK+

-- ======
-- EVENTS
-- ======

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+193, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+194, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+195, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+196, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+197, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+198, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+199, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+200, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+201, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+202, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+203, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+204, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+205, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+206, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+207, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+208, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+209, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+210, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+211, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+212, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+213, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+214, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+215, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+216, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+217, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+218, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+219, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+220, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+221, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+222, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+223, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+224, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+225, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+226, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+227, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+228, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+229, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+230, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+231, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+232, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+233, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+234, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+235, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+236, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+237, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+238, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+239, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+240, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+241, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+242, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+243, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+244, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+245, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+246, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+247, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+248, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+249, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+250, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+251, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+252, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+253, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+254, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+255, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+256, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+257, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+258, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+259, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+260, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+261, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+262, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+263, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+264, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+265, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+266, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+267, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+268, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+269, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+270, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+271, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+272, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+273, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+274, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+275, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+276, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+277, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+278, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+279, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+280, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+281, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+282, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+283, 2), -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)
(@OGUID+284, 2); -- Hardpacked Snowdrift (Feast of Winter Veil - Main Event)

-- INSERT INTO `game_event_creature` (`guid`, `event`) VALUES

-- INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES

-- =======
-- POOLING
-- =======

-- INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@PGUID+1, 25, 'Hardpacked Snowdrift (180654)');

-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES

-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES

INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
(180654, @PGUID+1, 0, 'Hardpacked Snowdrift (180654)');

-- =========
-- DBSCRIPTS
-- =========

-- INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
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


