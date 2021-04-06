/* DBScriptData
DBName: Hellfire Citadel - Hellfire Ramparts
DBScriptName: instance_ramparts
DB%Complete: 85
DBComment:
* pat towards omor must be resniffed, they should walk in sync, current spawn position prevents this (need creature_groups for better pathing behavior)
EndDBScriptData */

SET @CGUID := 5430000; -- creatures
SET @OGUID := 5430000; -- gameobjects
SET @PGUID := 48200; -- pools

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+2, 1, -1270, 1642.56, 91.6092, 3.55975, 0, 0),
(@CGUID+2, 2, -1232.97, 1662.94, 92.4019, 0.464499, 0, 0),
(@CGUID+4, 1, -1337.58, 1676.92, 91.7461, 2.14132, 0, 0),
(@CGUID+4, 2, -1358.19, 1701.99, 84.6861, 2.40209, 0, 0),
(@CGUID+4, 3, -1337.58, 1676.92, 91.7461, 2.14132, 0, 0),
(@CGUID+4, 4, -1324.93, 1661.38, 93.0835, 5.34654, 0, 0),
(@CGUID+17, 1, -1276.92, 1640.51, 91.6726, 2.69188, 22000, 1173),
(@CGUID+17, 2, -1276.52, 1638.6, 91.6777, 4.62397, 0, 0),
(@CGUID+17, 3, -1278.69, 1636.47, 91.6955, 3.85742, 0, 0),
(@CGUID+17, 4, -1282.16, 1637.86, 91.706, 2.761, 0, 0),
(@CGUID+17, 5, -1282.55, 1639.29, 91.7032, 1.84051, 0, 0),
(@CGUID+17, 6, -1282.15, 1640.54, 91.6982, 1.23026, 26000, 1173),
(@CGUID+17, 7, -1283.46, 1638.84, 91.7092, 4.3852, 0, 0),
(@CGUID+17, 8, -1281.31, 1635.72, 91.7092, 5.35595, 0, 0),
(@CGUID+17, 9, -1277.05, 1636.46, 91.6883, 0.177039, 0, 0),
(@CGUID+17, 10, -1276.07, 1639.22, 91.6735, 1.16271, 0, 0),
(@CGUID+19, 1, -1315.75, 1601.66, 91.7501, 4.33494, 0, 0),
(@CGUID+19, 2, -1305.9, 1593.47, 91.7652, 5.82091, 0, 0),
(@CGUID+19, 3, -1287.94, 1599.52, 91.7758, 0.217098, 0, 0),
(@CGUID+19, 4, -1279.58, 1616.86, 91.7583, 1.37478, 0, 0),
(@CGUID+19, 5, -1288.32, 1631.62, 91.7501, 2.00938, 0, 0),
(@CGUID+19, 6, -1302.75, 1628.88, 91.7496, 3.65086, 0, 0),
(@CGUID+19, 7, -1315.75, 1601.66, 91.7501, 4.33494, 0, 0),
(@CGUID+19, 8, -1305.9, 1593.47, 91.7652, 5.82091, 0, 0),
(@CGUID+19, 9, -1287.94, 1599.52, 91.7758, 0.217098, 0, 0),
(@CGUID+19, 10, -1279.58, 1616.86, 91.7583, 1.37478, 0, 0),
(@CGUID+19, 11, -1288.32, 1631.62, 91.7501, 2.00938, 7000, 1726401),
(@CGUID+19, 12, -1302.75, 1628.88, 91.7496, 3.65086, 0, 0),
(@CGUID+19, 13, -1315.75, 1601.66, 91.7501, 4.33494, 0, 0),
(@CGUID+19, 14, -1305.9, 1593.47, 91.7652, 5.82091, 0, 0),
(@CGUID+19, 15, -1287.94, 1599.52, 91.7758, 0.217098, 0, 0),
(@CGUID+19, 16, -1279.58, 1616.86, 91.7583, 1.37478, 0, 0),
(@CGUID+19, 17, -1288.32, 1631.62, 91.7501, 2.00938, 0, 0),
(@CGUID+19, 18, -1302.75, 1628.88, 91.7496, 3.65086, 0, 0),
(@CGUID+20, 1, -1257.71, 1651, 67.9137, 1.8753, 5000, 0),
(@CGUID+20, 2, -1267.74, 1662.96, 68.787, 2.40937, 0, 0),
(@CGUID+20, 3, -1249, 1629.44, 68.5386, 4.67525, 0, 0),
(@CGUID+20, 4, -1246.77, 1593.07, 68.5191, 4.23935, 0, 0),
(@CGUID+21, 1, -1334.42, 1660.69, 68.7547, 3.5409, 0, 0),
(@CGUID+21, 2, -1326.84, 1663.61, 68.8289, 0.341192, 0, 0),
(@CGUID+21, 3, -1313.2, 1668.25, 66.2427, 0.20846, 0, 0),
(@CGUID+21, 4, -1290.07, 1673.45, 68.5136, 6.26309, 0, 0),
(@CGUID+21, 5, -1279.85, 1671.76, 68.6955, 5.967, 0, 0),
(@CGUID+21, 6, -1288.67, 1672.97, 68.656, 2.98955, 0, 0),
(@CGUID+21, 7, -1306.05, 1669.69, 65.6492, 3.2668, 0, 0),
(@CGUID+21, 8, -1324.36, 1664.25, 68.4431, 3.34927, 0, 0),
(@CGUID+23, 1, -1286.36, 1548.92, 68.593, 5.79388, 2000, 0),
(@CGUID+23, 2, -1272.54, 1542.24, 68.5645, 1.1561, 3000, 0),
(@CGUID+23, 3, -1292.4, 1552.03, 68.6046, 5.77817, 3000, 0),
(@CGUID+24, 1, -1240.97, 1446.21, 68.5984, 5.1549, 30000, 1173),
(@CGUID+24, 2, -1243.09, 1449.52, 68.5958, 2.20101, 0, 0),
(@CGUID+24, 3, -1241.51, 1455.69, 68.5882, 1.3732, 0, 0),
(@CGUID+24, 4, -1234.59, 1458.39, 68.5809, 0.293282, 0, 0),
(@CGUID+24, 5, -1227.2, 1454.88, 68.5809, 5.80049, 0, 0),
(@CGUID+24, 6, -1218.59, 1446.96, 68.5853, 5.53974, 0, 0),
(@CGUID+24, 7, -1197.95, 1448.35, 68.497, 0.169974, 0, 0),
(@CGUID+24, 8, -1192.06, 1447.4, 68.4697, 6.12329, 0, 0),
(@CGUID+24, 9, -1188.54, 1445.09, 68.4572, 5.70232, 0, 0),
(@CGUID+24, 10, -1185.8, 1437.97, 68.4558, 5.09992, 30000, 1173),
(@CGUID+24, 11, -1193.05, 1445.75, 68.4767, 2.2984, 0, 0),
(@CGUID+24, 12, -1201.56, 1449.2, 68.5109, 2.75708, 0, 0),
(@CGUID+24, 13, -1216.51, 1449.78, 68.5786, 3.04532, 0, 0),
(@CGUID+24, 14, -1229.94, 1452.14, 68.5853, 2.97149, 0, 0),
(@CGUID+24, 15, -1238.79, 1454.29, 68.5876, 2.95028, 0, 0),
(@CGUID+24, 16, -1242.89, 1451.69, 68.5929, 3.70741, 0, 0),
(@CGUID+25, 1, -1157.34, 1475.44, 68.4187, 0.224954, 27000, 1173),
(@CGUID+25, 2, -1160.04, 1474.68, 68.4217, 3.44744, 0, 0),
(@CGUID+25, 3, -1169.9, 1462.82, 68.4243, 4.04199, 0, 0),
(@CGUID+25, 4, -1175.9, 1453.44, 68.4261, 4.12131, 0, 0),
(@CGUID+25, 5, -1178.3, 1454.4, 68.4302, 2.761, 0, 0),
(@CGUID+25, 6, -1187.27, 1461.73, 68.4486, 2.48533, 0, 0),
(@CGUID+25, 7, -1187.33, 1464.84, 68.451, 1.58997, 0, 0),
(@CGUID+25, 8, -1183.45, 1471.54, 68.451, 1.04648, 0, 0),
(@CGUID+25, 9, -1186.24, 1473.29, 68.4563, 2.59371, 0, 0),
(@CGUID+25, 10, -1189.62, 1473.59, 68.4611, 3.05239, 27000, 1173),
(@CGUID+25, 11, -1185.84, 1472.15, 68.4565, 5.77458, 0, 0),
(@CGUID+25, 12, -1183.75, 1469.04, 68.4518, 5.30334, 0, 0),
(@CGUID+25, 13, -1188.46, 1461.63, 68.4513, 4.03178, 0, 0),
(@CGUID+25, 14, -1176.02, 1453.01, 68.4282, 5.80992, 0, 0),
(@CGUID+25, 15, -1172.34, 1456.6, 68.4252, 0.616868, 0, 0),
(@CGUID+25, 16, -1164.67, 1468.12, 68.4238, 0.999357, 0, 0),
(@CGUID+25, 17, -1161.06, 1474.41, 68.4238, 0.891757, 0, 0),
(@CGUID+84, 1, -1169.96, 1474.88, 68.4357, 1.14308, 0, 0),
(@CGUID+84, 2, -1170.63, 1511.93, 68.4449, 1.63161, 0, 0),
(@CGUID+84, 3, -1196.09, 1540.39, 68.4821, 2.35102, 0, 0),
(@CGUID+84, 4, -1170.63, 1511.93, 68.4449, 1.63161, 0, 0),
(@CGUID+84, 5, -1169.96, 1474.88, 68.4357, 1.14308, 0, 0),
(@CGUID+84, 6, -1181.54, 1452.92, 68.4353, 1.39127, 0, 0),
(@CGUID+85, 1, -1365.65, 1790.68, 106.545, 0, 0, 0),
(@CGUID+85, 2, -1413.47, 1807.31, 106.545, 0, 0, 0),
(@CGUID+85, 3, -1470.59, 1768.05, 106.545, 0, 0, 0),
(@CGUID+85, 4, -1480.63, 1730.59, 106.545, 0, 0, 0),
(@CGUID+85, 5, -1461.54, 1696.49, 106.545, 0, 0, 0),
(@CGUID+85, 6, -1424.05, 1679.86, 106.545, 0, 0, 0),
(@CGUID+85, 7, -1403.16, 1696.94, 106.545, 0, 0, 0),
(@CGUID+85, 8, -1378.89, 1718.07, 106.545, 0, 0, 0),
(@CGUID+85, 9, -1363.3, 1736.06, 106.545, 0, 0, 0),
(@CGUID+85, 10, -1354.95, 1766.59, 106.545, 0, 0, 0),
(@CGUID+89, 1, -1292.36, 1540.43, 68.5946, 1.10731, 0, 0),
(@CGUID+89, 2, -1282.12, 1555.41, 68.5931, 0.937666, 0, 0),
(@CGUID+89, 3, -1269.72, 1570.64, 68.613, 0.862268, 0, 0),
(@CGUID+89, 4, -1283.81, 1552.44, 68.5924, 4.09497, 0, 0),
(@CGUID+89, 5, -1293.9, 1538.24, 68.5943, 4.09497, 0, 0),
(@CGUID+89, 6, -1293.64, 1523.46, 68.5913, 4.72957, 0, 0),
(@CGUID+89, 7, -1285.84, 1503.83, 68.5807, 5.11127, 0, 0),
(@CGUID+89, 8, -1263.85, 1479.5, 68.5757, 5.44742, 0, 0),
(@CGUID+89, 9, -1247.75, 1466.51, 68.5773, 5.59272, 0, 0),
(@CGUID+89, 10, -1232.82, 1458.5, 68.5782, 5.79064, 0, 0),
(@CGUID+89, 11, -1210.74, 1453.07, 68.5486, 6.04197, 0, 0),
(@CGUID+89, 12, -1228.86, 1458.19, 68.5776, 2.953, 0, 0),
(@CGUID+89, 13, -1244.22, 1466.45, 68.5761, 2.64827, 0, 0),
(@CGUID+89, 14, -1260.87, 1481.05, 68.5715, 2.3883, 0, 0),
(@CGUID+89, 15, -1275.45, 1494.73, 68.5715, 2.3883, 0, 0),
(@CGUID+89, 16, -1283.63, 1505.74, 68.5756, 2.35453, 0, 0),
(@CGUID+89, 17, -1289.75, 1518.26, 68.5811, 2.10791, 0, 0),
(@CGUID+89, 18, -1294.24, 1535.83, 68.5937, 1.85266, 0, 0);

-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(@CGUID+16, 0, 0, 1, 0, 173, 0, NULL), -- Bonechewer Hungerer
(@CGUID+27, 0, 0, 2, 16, 0, 0, NULL), -- Bleeding Hollow Darkcaster
(@CGUID+42, 0, 0, 1, 16, 0, 0, NULL), -- Bleeding Hollow Archer
(@CGUID+46, 0, 0, 0, 0, 0, 0, NULL), -- Bleeding Hollow Archer
(@CGUID+47, 0, 0, 0, 0, 0, 0, NULL), -- Bleeding Hollow Archer
(@CGUID+91, 0, 0, 1, 16, 0, 0, '8734'), -- Bleeding Hollow Scryer
(@CGUID+92, 0, 0, 1, 16, 0, 0, '8734'), -- Bleeding Hollow Scryer
(@CGUID+93, 0, 0, 1, 16, 0, 0, '8734'), -- Bleeding Hollow Scryer
(@CGUID+94, 0, 0, 1, 16, 0, 0, '8734'), -- Bleeding Hollow Scryer
(@CGUID+95, 0, 0, 1, 16, 0, 0, '8734'), -- Bleeding Hollow Scryer
(@CGUID+96, 0, 0, 1, 16, 0, 0, '8734'), -- Bleeding Hollow Scryer
(@CGUID+97, 0, 0, 1, 16, 0, 0, '8734'), -- Bleeding Hollow Scryer
(@CGUID+98, 0, 0, 1, 16, 0, 0, '8734'); -- Bleeding Hollow Scryer

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(17259, 0, 0, 1, 16, 0, 0, NULL), -- Bonechewer Hungerer
(17264, 0, 0, 1, 16, 0, 0, '18950'), -- Bonechewer Ravener
(17269, 0, 0, 1, 16, 0, 0, NULL), -- Bleeding Hollow Darkcaster
(17270, 0, 0, 2, 16, 0, 0, NULL), -- Bleeding Hollow Archer
(17271, 0, 0, 1, 16, 0, 0, NULL), -- Bonechewer Destroyer
(17280, 0, 0, 1, 16, 0, 0, '18950'), -- Shattered Hand Warhound
(17306, 0, 0, 1, 16, 0, 0, NULL), -- Watchkeeper Gargolmar
(17307, 0, 0, 1, 16, 0, 0, NULL), -- Vazruden the Herald
(17308, 0, 0, 1, 16, 0, 0, NULL), -- Omor the Unscarred
(17309, 0, 0, 1, 16, 0, 0, NULL), -- Hellfire Watcher
(17455, 0, 0, 1, 16, 0, 0, '18950'), -- Bonechewer Beastmaster
(17517, 0, 0, 1, 16, 0, 0, NULL); -- Hellfire Sentry

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+7, @CGUID+6, 1155), -- Bonechewer Hungerer -> Bonechewer Hungerer
(@CGUID+18, @CGUID+8, 1155), -- Bonechewer Hungerer -> Bonechewer Hungerer
(@CGUID+27, @CGUID+51, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+40, @CGUID+51, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+101, @CGUID+51, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+102, @CGUID+51, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+64, @CGUID+20, 1679), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+65, @CGUID+20, 1679), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+38, @CGUID+48, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+39, @CGUID+48, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+103, @CGUID+48, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+104, @CGUID+48, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+26, @CGUID+49, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+44, @CGUID+49, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+105, @CGUID+49, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+106, @CGUID+49, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+10, @CGUID+9, 1155), -- Bonechewer Hungerer -> Bonechewer Hungerer
(@CGUID+68, @CGUID+9, 1155), -- Shattered Hand Warhound -> Bonechewer Hungerer
(@CGUID+69, @CGUID+9, 1155), -- Shattered Hand Warhound -> Bonechewer Hungerer
(@CGUID+91, @CGUID+82, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+92, @CGUID+82, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+93, @CGUID+82, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+94, @CGUID+82, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+52, @CGUID+23, 1155), -- Bonechewer Destroyer -> Bonechewer Beastmaster
(@CGUID+53, @CGUID+23, 1155), -- Bonechewer Destroyer -> Bonechewer Beastmaster
(@CGUID+30, @CGUID+16, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Hungerer
(@CGUID+35, @CGUID+16, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Hungerer
(@CGUID+54, @CGUID+16, 1155), -- Bonechewer Destroyer -> Bonechewer Hungerer
(@CGUID+80, @CGUID+89, 1679), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+81, @CGUID+89, 1679), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+12, @CGUID+11, 1155), -- Bonechewer Hungerer -> Bonechewer Hungerer
(@CGUID+70, @CGUID+11, 1155), -- Shattered Hand Warhound -> Bonechewer Hungerer
(@CGUID+71, @CGUID+11, 1155), -- Shattered Hand Warhound -> Bonechewer Hungerer
(@CGUID+13, @CGUID+55, 1155), -- Bonechewer Hungerer -> Bonechewer Destroyer
(@CGUID+31, @CGUID+55, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+72, @CGUID+55, 1155), -- Shattered Hand Warhound -> Bonechewer Destroyer
(@CGUID+73, @CGUID+55, 1155), -- Shattered Hand Warhound -> Bonechewer Destroyer
(@CGUID+78, @CGUID+22, 1155), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+79, @CGUID+22, 1155), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+107, @CGUID+108, 1155), -- Bonechewer Destroyer -> Bonechewer Destroyer
(@CGUID+36, @CGUID+56, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+37, @CGUID+56, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+46, @CGUID+57, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+47, @CGUID+57, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+74, @CGUID+57, 1155), -- Shattered Hand Warhound -> Bonechewer Destroyer
(@CGUID+75, @CGUID+57, 1155), -- Shattered Hand Warhound -> Bonechewer Destroyer
(@CGUID+15, @CGUID+14, 1155), -- Bonechewer Hungerer -> Bonechewer Hungerer
(@CGUID+95, @CGUID+83, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+96, @CGUID+83, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+97, @CGUID+83, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+98, @CGUID+83, 1155), -- Bleeding Hollow Scryer -> Bonechewer Ripper
(@CGUID+59, @CGUID+58, 1155), -- Bonechewer Destroyer -> Bonechewer Destroyer
(@CGUID+62, @CGUID+19, 1679), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+67, @CGUID+19, 1679), -- Shattered Hand Warhound -> Bonechewer Ravener
(@CGUID+1, @CGUID+50, 1155), -- Bonechewer Hungerer -> Bonechewer Destroyer
(@CGUID+32, @CGUID+50, 1155), -- Bleeding Hollow Darkcaster -> Bonechewer Destroyer
(@CGUID+63, @CGUID+50, 1155), -- Shattered Hand Warhound -> Bonechewer Destroyer
(@CGUID+76, @CGUID+50, 1155), -- Shattered Hand Warhound -> Bonechewer Destroyer
(@CGUID+42, @CGUID+60, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+43, @CGUID+60, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+41, @CGUID+61, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+45, @CGUID+61, 1155), -- Bleeding Hollow Archer -> Bonechewer Destroyer
(@CGUID+17, @CGUID+29, 1155), -- Bonechewer Hungerer -> Bleeding Hollow Darkcaster
(@CGUID+28, @CGUID+29, 1155), -- Bleeding Hollow Darkcaster -> Bleeding Hollow Darkcaster
(@CGUID+66, @CGUID+29, 1155), -- Shattered Hand Warhound -> Bleeding Hollow Darkcaster
(@CGUID+77, @CGUID+29, 1155), -- Shattered Hand Warhound -> Bleeding Hollow Darkcaster
(@CGUID+3, @CGUID+2, 1679), -- Bonechewer Hungerer -> Bonechewer Hungerer
(@CGUID+34, @CGUID+33, 1155), -- Bleeding Hollow Darkcaster -> Bleeding Hollow Darkcaster
(@CGUID+5, @CGUID+4, 1679), -- Bonechewer Hungerer -> Bonechewer Hungerer
(@CGUID+100, @CGUID+99, 1155); -- Hellfire Sentry -> Hellfire Sentry

REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(17280, 543, 17455, 4352, 50), -- Shattered Hand Warhound -> Bonechewer Beastmaster
(17309, 543, 17306, 1671, 0), -- Hellfire Watcher -> Watchkeeper Gargolmar
(17517, 543, 17536, 133, 0), -- Hellfire Sentry -> Nazan
(17540, 543, 17308, 12304, 0); -- Fiendish Hound -> Omor the Unscarred

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 17259, 543, 3, -1295.73, 1585.1, 91.8061, 1.69297, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+2, 17259, 543, 3, -1264.72, 1645, 92.2821, 3.58973, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Hungerer
(@CGUID+3, 17259, 543, 3, -1263.24, 1641.83, 92.1805, 3.58973, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+4, 17259, 543, 3, -1324.93, 1661.38, 93.0835, 5.34654, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Hungerer
(@CGUID+5, 17259, 543, 3, -1328.64, 1658.68, 93.0325, 5.43294, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+6, 17259, 543, 3, -1329.57, 1667.08, 68.7185, 3.63029, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+7, 17259, 543, 3, -1326.74, 1659.26, 69.0985, 3.49066, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+8, 17259, 543, 3, -1285.47, 1678.21, 68.6203, 6.14356, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+9, 17259, 543, 3, -1253.03, 1592.4, 68.5577, 5.81228, 7200, 7200, 5, 0, 0, 1), -- Bonechewer Hungerer
(@CGUID+10, 17259, 543, 3, -1260.65, 1580.48, 68.6319, 6.11701, 7200, 7200, 5, 0, 0, 1), -- Bonechewer Hungerer
(@CGUID+11, 17259, 543, 3, -1229.04, 1474.72, 68.5588, 3.75217, 7200, 7200, 5, 0, 0, 1), -- Bonechewer Hungerer
(@CGUID+12, 17259, 543, 3, -1218.31, 1465.47, 68.565, 4.08753, 7200, 7200, 5, 0, 0, 1), -- Bonechewer Hungerer
(@CGUID+13, 17259, 543, 3, -1206.34, 1440.36, 68.5478, 2.25364, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+14, 17259, 543, 3, -1207.63, 1533.99, 68.5564, 0.599592, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+15, 17259, 543, 3, -1216.72, 1544.74, 68.5586, 0.832852, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+16, 17259, 543, 3, -1293.19, 1493.8, 68.6832, 3.50811, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+17, 17259, 543, 3, -1276.92, 1640.51, 91.6726, 2.69189, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Hungerer
(@CGUID+18, 17259, 543, 3, -1286.73, 1669.91, 68.9444, 6.10865, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Hungerer
(@CGUID+19, 17264, 543, 3, -1309.77, 1619.39, 91.7513, 4.32237, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Ravener
(@CGUID+20, 17264, 543, 3, -1257.71, 1651, 67.9137, 1.8753, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Ravener
(@CGUID+21, 17264, 543, 3, -1323.23, 1663.07, 68.4011, 3.48722, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Ravener
(@CGUID+22, 17264, 543, 3, -1171.39, 1442.44, 68.4135, 2.39422, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Ravener
(@CGUID+23, 17455, 543, 3, -1286.36, 1548.92, 68.593, 5.79388, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Beastmaster
(@CGUID+24, 17264, 543, 3, -1240.97, 1446.21, 68.5984, 5.1549, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Ravener
(@CGUID+25, 17264, 543, 3, -1157.34, 1475.44, 68.4187, 0.224954, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Ravener
(@CGUID+26, 17269, 543, 3, -1241, 1622.44, 68.4931, 2.30468, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+27, 17269, 543, 3, -1273.19, 1654.71, 69.2056, 1.0472, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+28, 17269, 543, 3, -1298.65, 1638.98, 91.8292, 3.9968, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+29, 17269, 543, 3, -1288.11, 1637.25, 91.816, 4.95674, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+30, 17269, 543, 3, -1283.25, 1485.41, 68.5938, 0.617646, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+31, 17269, 543, 3, -1196.94, 1433.03, 68.515, 1.74941, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+32, 17269, 543, 3, -1298.88, 1584.61, 91.7838, 1.40698, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+33, 17269, 543, 3, -1168.73, 1699.03, 91.4946, 3.62259, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+34, 17269, 543, 3, -1162.51, 1689.34, 91.6866, 3.57468, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+35, 17269, 543, 3, -1288.3, 1487.43, 68.5968, 0.583221, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+36, 17269, 543, 3, -1180.56, 1480.53, 68.4566, 2.0133, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+37, 17269, 543, 3, -1181.91, 1486.2, 68.462, 4.02078, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+38, 17270, 543, 3, -1244.37, 1648.46, 67.5068, 2.29683, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+39, 17270, 543, 3, -1246.53, 1642.22, 68.0499, 3.52755, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+40, 17270, 543, 3, -1268.79, 1650.25, 69.0301, 0.488692, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+41, 17270, 543, 3, -1314.25, 1622.67, 91.8317, 6.23082, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+42, 17270, 543, 3, -1270.92, 1627.81, 91.7535, 3.1765, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+43, 17270, 543, 3, -1270.05, 1622.27, 91.7561, 3.29867, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+44, 17270, 543, 3, -1239.48, 1614.78, 68.4823, 4.2564, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+45, 17270, 543, 3, -1320.28, 1612.95, 91.7477, 5.46592, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+46, 17270, 543, 3, -1148.55, 1497.48, 68.4854, 3.08923, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+47, 17270, 543, 3, -1148.28, 1511.81, 68.4805, 0.0349066, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+48, 17271, 543, 3, -1246.51, 1645.73, 67.7504, 2.82305, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+49, 17271, 543, 3, -1242.17, 1617.33, 68.5032, 3.57232, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+50, 17271, 543, 3, -1297.74, 1588.57, 91.8306, 4.74729, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+51, 17271, 543, 3, -1269.61, 1653.95, 69.0822, 0.785398, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+52, 17271, 543, 3, -1277.48, 1537.32, 68.5684, 1.78475, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+53, 17271, 543, 3, -1271.42, 1539.57, 68.5593, 1.24911, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+54, 17271, 543, 3, -1281.22, 1479.85, 68.5982, 0.0929992, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+55, 17271, 543, 3, -1199.86, 1441.04, 68.5164, 1.17371, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+56, 17271, 543, 3, -1185.22, 1483.93, 68.4648, 5.58294, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+57, 17271, 543, 3, -1150.4, 1503.62, 68.4036, 3.05239, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+58, 17271, 543, 3, -1264.6, 1589, 92.3484, 5.67012, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+59, 17271, 543, 3, -1259.27, 1596.98, 92.0051, 5.76594, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+60, 17271, 543, 3, -1273.79, 1624.37, 91.694, 3.03589, 7200, 7200, 5, 0, 0, 1), -- Bonechewer Destroyer
(@CGUID+61, 17271, 543, 3, -1316.16, 1616.67, 91.7485, 5.5044, 7200, 7200, 5, 0, 0, 1), -- Bonechewer Destroyer
(@CGUID+62, 17280, 543, 3, -1311.65, 1620.14, 91.7513, 4.32394, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+63, 17280, 543, 3, -1301.86, 1587.45, 91.8652, 1.37881, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+64, 17280, 543, 3, -1254.69, 1651.98, 67.6227, 1.89886, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+65, 17280, 543, 3, -1261.15, 1649.92, 68.245, 1.80854, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+66, 17280, 543, 3, -1296.52, 1636.16, 91.8307, 0.506145, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+67, 17280, 543, 3, -1307.94, 1618.83, 91.7515, 4.36804, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+68, 17280, 543, 3, -1255.54, 1588.99, 68.5629, 6.26231, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+69, 17280, 543, 3, -1257.71, 1584.01, 68.5609, 5.76829, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+70, 17280, 543, 3, -1227.07, 1471.13, 68.562, 3.83778, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+71, 17280, 543, 3, -1222.93, 1468.08, 68.5654, 4.0891, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+72, 17280, 543, 3, -1201.71, 1434.41, 68.5346, 1.3143, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+73, 17280, 543, 3, -1194.15, 1438.93, 68.4923, 2.04158, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+74, 17280, 543, 3, -1156.34, 1491.98, 68.4241, 3.12779, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+75, 17280, 543, 3, -1157.2, 1485.66, 68.4256, 3.49928, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+76, 17280, 543, 3, -1293.46, 1589.14, 91.7699, 1.78947, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+77, 17280, 543, 3, -1292.4, 1637.55, 91.7452, 4.7732, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+78, 17280, 543, 3, -1177.68, 1443.05, 68.4213, 2.95107, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+79, 17280, 543, 3, -1172.91, 1448.22, 68.4196, 2.30547, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+80, 17280, 543, 3, -1290.56, 1536.05, 68.5896, 1.85287, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+81, 17280, 543, 3, -1297.28, 1534.1, 68.6081, 1.85287, 7200, 7200, 0, 0, 0, 0), -- Shattered Hand Warhound
(@CGUID+82, 17281, 543, 3, -1267.93, 1556.92, 68.5736, 1.77075, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Ripper
(@CGUID+83, 17281, 543, 3, -1238.83, 1559.07, 91.0681, 2.32836, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Ripper
(@CGUID+84, 17306, 543, 3, -1181.54, 1452.92, 68.4353, 1.39127, 86400, 86400, 0, 0, 0, 2), -- Watchkeeper Gargolmar
(@CGUID+85, 17307, 543, 3, -1365.65, 1790.68, 106.545, 2.55632, 7200, 7200, 0, 0, 0, 2), -- Vazruden the Herald
(@CGUID+86, 17308, 543, 3, -1122.34, 1718.41, 89.4315, 3.75246, 86400, 86400, 0, 0, 0, 0), -- Omor the Unscarred
(@CGUID+87, 17309, 543, 3, -1184.73, 1453.48, 68.4394, 1.17214, 7200, 7200, 0, 0, 0, 0), -- Hellfire Watcher
(@CGUID+88, 17309, 543, 3, -1178.8, 1452.27, 68.4308, 1.41011, 7200, 7200, 0, 0, 0, 0), -- Hellfire Watcher
(@CGUID+89, 17264, 543, 3, -1294.11, 1535.6, 68.5949, 1.86208, 7200, 7200, 0, 0, 0, 2), -- Bonechewer Ravener
(@CGUID+90, 22515, 543, 3, -1453.2988, 1733.9381, 87.31018, 0.76794, 300, 300, 0, 0, 0, 0), -- World Trigger
(@CGUID+91, 17478, 543, 3, -1265.38, 1554.34, 68.566, 2.2323, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+92, 17478, 543, 3, -1271.47, 1555.48, 68.5755, 0.812823, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+93, 17478, 543, 3, -1270.34, 1559.27, 68.5807, 5.53254, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+94, 17478, 543, 3, -1264.59, 1557.86, 68.5696, 3.46171, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+95, 17478, 543, 3, -1237.93, 1556.28, 90.9586, 1.83423, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+96, 17478, 543, 3, -1235.93, 1560.57, 91.0161, 3.5574, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+97, 17478, 543, 3, -1239.73, 1562.47, 91.0423, 4.93039, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+98, 17478, 543, 3, -1241.81, 1558.06, 91.1129, 0.345116, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Scryer
(@CGUID+99, 17517, 543, 3, -1383.39, 1711.82, 82.7961, 5.67232, 7200, 7200, 0, 0, 0, 0), -- Hellfire Sentry
(@CGUID+100, 17517, 543, 3, -1372.56, 1724.31, 82.967, 5.3058, 7200, 7200, 0, 0, 0, 0), -- Hellfire Sentry
(@CGUID+101, 17270, 543, 3, -1273.19, 1654.71, 69.2056, 1.0472, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+102, 17269, 543, 3, -1268.79, 1650.25, 69.0301, 0.488692, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+103, 17269, 543, 3, -1244.37, 1648.46, 67.5068, 2.29683, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+104, 17269, 543, 3, -1246.53, 1642.22, 68.0499, 3.52755, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+105, 17269, 543, 3, -1239.48, 1614.78, 68.4823, 4.2564, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Darkcaster
(@CGUID+106, 17270, 543, 3, -1241, 1622.44, 68.4931, 2.30468, 7200, 7200, 0, 0, 0, 0), -- Bleeding Hollow Archer
(@CGUID+107, 17271, 543, 3, -1159.13, 1457.56, 68.4082, 2.78812, 7200, 7200, 0, 0, 0, 0), -- Bonechewer Destroyer
(@CGUID+108, 17271, 543, 3, -1155.26, 1464.11, 68.407, 3.40466, 7200, 7200, 0, 0, 0, 0); -- Bonechewer Destroyer

-- Worker Equipment
UPDATE `creature` SET `equipment_id` = 52512 WHERE `guid` IN (@CGUID+16,@CGUID+17); -- Bonechewer Hungerer 17259
UPDATE `creature` SET `equipment_id` = 52513 WHERE `guid` IN (@CGUID+24,@CGUID+25); -- Bonechewer Ravener 17264

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 184179, 543, 3, -1357.39, 1636.75, 65.543, 1.01586, 0, 0, 0, 0, 0, 0, 0, 0), -- Doodad_InstancePortal_PurpleDifficulty01
(@OGUID+2, 184180, 543, 3, -1357.4, 1636.72, 65.5564, 1.01896, 0, 0, 0, 0, 0, 0, 0, 0), -- Doodad_InstancePortal_PurpleDifficultyIcon01
(@OGUID+3, 185168, 543, 1, -1429.8098, 1772.9159, 82.0765, 5.044002, 0, 0, -0.5807028, 0.81411564, -600, -600, 100, 1), -- Reinforced Fel Iron Chest
(@OGUID+4, 185169, 543, 2, -1429.8098, 1772.9159, 82.0765, 5.044002, 0, 0, -0.5807028, 0.81411564, -600, -600, 100, 1), -- Reinforced Fel Iron Chest
(@OGUID+5, 184930, 543, 1, -1203.092, 1430.389, 68.54727, 1.518436, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Fel Iron Chest
(@OGUID+6, 184931, 543, 1, -1203.092, 1430.389, 68.54727, 1.518436, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Fel Iron Chest
(@OGUID+7, 184940, 543, 2, -1203.092, 1430.389, 68.54727, 1.518436, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+8, 184941, 543, 2, -1203.092, 1430.389, 68.54727, 1.518436, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+9, 184930, 543, 1, -1297.503, 1582.332, 91.78211, 0.9075702, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Fel Iron Chest
(@OGUID+10, 184931, 543, 1, -1297.503, 1582.332, 91.78211, 0.9075702, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Fel Iron Chest
(@OGUID+11, 184940, 543, 2, -1297.503, 1582.332, 91.78211, 0.9075702, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+12, 184941, 543, 2, -1297.503, 1582.332, 91.78211, 0.9075702, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+13, 181734, 543, 3, -1166.2717, 1453.7053, 68.51827, 1.0522249, 0, 0, 0.50217533, 0.8647658, 300, 300, 100, 1), -- Campfire
(@OGUID+14, 181735, 543, 3, -1189.4822, 1437.6259, 68.46415, 1.0522249, 0, 0, 0.50217533, 0.8647658, 300, 300, 100, 1), -- Bonfire
(@OGUID+15, 181736, 543, 3, -1218.0891, 1441.1973, 68.64153, 2.4979556, 0, 0, 0.9486618, 0.31629226, 300, 300, 100, 1), -- Campfire
(@OGUID+16, 181737, 543, 3, -1143.0717, 1508.3219, 68.58932, 1.4167924, 0, 0, 0.65061665, 0.7594063, 300, 300, 100, 1), -- Campfire
(@OGUID+17, 181738, 543, 3, -1136.574, 1507.0183, 68.372444, 1.4167924, 0, 0, 0.65061665, 0.7594063, 300, 300, 100, 1); -- Meat Rack

-- ======
-- EVENTS
-- ======

-- INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
-- INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES

-- =======
-- POOLING
-- =======

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
(@PGUID+91, @PGUID+90, 0, 'Hellfire Ramparts - Chest - #1'),
(@PGUID+92, @PGUID+90, 0, 'Hellfire Ramparts - Chest - #2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@PGUID+1, 1, 'Hellfire Ramparts - Bleeding Hollow Archer/Darkcaster - Pool 1'),
(@PGUID+2, 1, 'Hellfire Ramparts - Bleeding Hollow Archer/Darkcaster - Pool 2'),
(@PGUID+3, 1, 'Hellfire Ramparts - Bleeding Hollow Archer/Darkcaster - Pool 3'),
(@PGUID+4, 1, 'Hellfire Ramparts - Bleeding Hollow Archer/Darkcaster - Pool 4'),
(@PGUID+5, 1, 'Hellfire Ramparts - Bleeding Hollow Archer/Darkcaster - Pool 5'),
(@PGUID+6, 1, 'Hellfire Ramparts - Bleeding Hollow Archer/Darkcaster - Pool 6'),
(@PGUID+90, 1, 'Hellfire Ramparts - Master Chest Pool'),
(@PGUID+91, 1, 'Hellfire Ramparts - Chest - #1'),
(@PGUID+92, 1, 'Hellfire Ramparts - Chest - #2');

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@CGUID+27, @PGUID+1, 0, 'Hellfire Ramparts - Bleeding Hollow Darkcaster - Pool 1'),
(@CGUID+101, @PGUID+1, 0, 'Hellfire Ramparts - Bleeding Hollow Archer - Pool 1'),
(@CGUID+40, @PGUID+2, 0, 'Hellfire Ramparts - Bleeding Hollow Archer - Pool 2'),
(@CGUID+102, @PGUID+2, 0, 'Hellfire Ramparts - Bleeding Hollow Darkcaster - Pool 2'),
(@CGUID+38, @PGUID+3, 0, 'Hellfire Ramparts - Bleeding Hollow Archer - Pool 3'),
(@CGUID+103, @PGUID+3, 0, 'Hellfire Ramparts - Bleeding Hollow Darkcaster - Pool 3'),
(@CGUID+39, @PGUID+4, 0, 'Hellfire Ramparts - Bleeding Hollow Archer - Pool 4'),
(@CGUID+104, @PGUID+4, 0, 'Hellfire Ramparts - Bleeding Hollow Darkcaster - Pool 4'),
(@CGUID+44, @PGUID+5, 0, 'Hellfire Ramparts - Bleeding Hollow Archer - Pool 5'),
(@CGUID+105, @PGUID+5, 0, 'Hellfire Ramparts - Bleeding Hollow Darkcaster - Pool 5'),
(@CGUID+26, @PGUID+6, 0, 'Hellfire Ramparts - Bleeding Hollow Darkcaster - Pool 6'),
(@CGUID+106, @PGUID+6, 0, 'Hellfire Ramparts - Bleeding Hollow Archer - Pool 6');

-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@OGUID+5, @PGUID+91, 0, 'Hellfire Ramparts - Solid Fel Iron Chest (184930)'),
(@OGUID+6, @PGUID+91, 0, 'Hellfire Ramparts - Bound Fel Iron Chest (184931)'),
(@OGUID+7, @PGUID+91, 0, 'Hellfire Ramparts - Bound Adamantite Chest (184940)'),
(@OGUID+8, @PGUID+91, 0, 'Hellfire Ramparts - Solid Adamantite Chest (184941)'),
(@OGUID+9, @PGUID+92, 0, 'Hellfire Ramparts - Solid Fel Iron Chest (184930)'),
(@OGUID+10, @PGUID+92, 0, 'Hellfire Ramparts - Bound Fel Iron Chest (184931)'),
(@OGUID+11, @PGUID+92, 0, 'Hellfire Ramparts - Bound Adamantite Chest (184940)'),
(@OGUID+12, @PGUID+92, 0, 'Hellfire Ramparts - Solid Adamantite Chest (184941)');

-- INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- =========
-- DBSCRIPTS
-- =========

DELETE FROM dbscripts_on_creature_movement WHERE id=1726401;
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1726401, 0, 0, 0, 0, 0, 17269, @CGUID+29, 17, 2000020035, 0, 0, 0, 0, 0, 0, 0, 'Bonechewer Ravener (Hellfire Ramparts) - Yell At Bleeding Hollow Darkcaster'),
(1726401, 4000, 0, 0, 0, 0, 17269, @CGUID+29, 19, 2000020036, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Darkcaster (Hellfire Ramparts) - Yell At Bonechewer Ravener');

DELETE FROM `dbscript_string` WHERE `entry` IN (2000020035,2000020036);
INSERT INTO `dbscript_string` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `broadcast_text_id`, `comment`) VALUES
(2000020035, 'You there!  Keep a close watch on these ramparts, intruders could approach at any time!', 0, 1, 0, 25, 13695, 'Bonechewer Ravener in Hellfire Ramparts'),
(2000020036, 'Yes sir!  I will not fail the Fel Horde!', 0, 1, 0, 66, 13989, 'Bleeding Hollow Darkcaster in Hellfire Ramparts');

-- INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_template_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_relay` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_event` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_spell` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_start` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_end` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscript_random_templates` (`id`, `type`, `target_id`, `chance`, `comments`) VALUES


