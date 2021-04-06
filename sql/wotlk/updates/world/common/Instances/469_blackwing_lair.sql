/* DBScriptData
DBName: Blackwing Lair
DBScriptName: instance_blackwing_lair
DB%Complete: 75
DBComment:
EndDBScriptData */

SET @CGUID := 4690000; -- creatures
SET @OGUID := 4690000; -- gameobjects
SET @PGUID := 47300; -- pools

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+14, 1, -7514.660156, -915.672974, 457.576141, 3.736127, 0, 0),
(@CGUID+14, 2, -7522.407227, -921.590881, 457.576141, 2.953870, 9*1000, 1247101),
(@CGUID+14, 3, -7516.440918, -931.687744, 457.576141, 3.792673, 10*1000, 0),
(@CGUID+14, 4, -7522.407227, -921.590881, 457.576141, 2.953870, 0, 0),
(@CGUID+14, 5, -7505.688965, -910.193970, 457.576141, 1.669752, 8*1000, 0),
(@CGUID+15, 1, -7490.720215, -880.021973, 464.983002, 5.248651, 10*1000, 0),
(@CGUID+15, 2, -7481.521973, -874.042603, 464.983002, 0.481284, 0, 0),
(@CGUID+15, 3, -7470.077148, -877.378235, 464.983002, 0.126284, 0, 0),
(@CGUID+15, 4, -7458.394531, -869.081665, 464.983002, 0.715333, 0, 0),
(@CGUID+15, 5, -7450.747559, -870.677246, 464.983856, 1.184211, 9*1000, 1247101),
(@CGUID+15, 6, -7458.394531, -869.081665, 464.983002, 0.715333, 0, 0),
(@CGUID+15, 7, -7470.077148, -877.378235, 464.983002, 0.126284, 0, 0),
(@CGUID+15, 8, -7481.521973, -874.042603, 464.983002, 0.481284, 0, 0),
(@CGUID+17, 1, -7413.560059, -900.291992, 464.983002, 0.223660, 0, 0),
(@CGUID+17, 2, -7421.991211, -906.056030, 464.983002, 3.690406, 0, 0),
(@CGUID+17, 3, -7403.992188, -930.876709, 464.983002, 5.342885, 0, 0),
(@CGUID+17, 4, -7399.454102, -932.370972, 464.983002, 6.206038, 10*1000, 0),
(@CGUID+17, 5, -7403.992188, -930.876709, 464.983002, 5.342885, 0, 0),
(@CGUID+17, 6, -7421.991211, -906.056030, 464.983002, 3.690406, 0, 0),
(@CGUID+17, 7, -7413.560059, -900.291992, 464.983002, 0.223660, 9*1000, 1247101),
(@CGUID+19, 1, -7440.379883, -962.318970, 464.983978, 4.340725, 0, 0),
(@CGUID+19, 2, -7436.921875, -954.072327, 464.984283, 1.303589, 0, 0),
(@CGUID+19, 3, -7453.783203, -930.033630, 464.984283, 2.606565, 0, 0),
(@CGUID+19, 4, -7463.512695, -931.216797, 464.984283, 3.183048, 10*1000, 0),
(@CGUID+19, 5, -7453.783203, -930.033630, 464.984283, 2.606565, 0, 0),
(@CGUID+19, 6, -7436.921875, -954.072327, 464.984283, 1.303589, 0, 0),
(@CGUID+19, 7, -7440.379883, -962.318970, 464.983978, 4.340725, 9*1000, 1247101),
(@CGUID+20, 1, -7701.18, -1089.75, 449.118, 100, 0, 0),
(@CGUID+20, 2, -7693.23, -1096.28, 449.123, 100, 0, 0),
(@CGUID+20, 3, -7687.57, -1104.84, 449.119, 100, 0, 0),
(@CGUID+20, 4, -7680.34, -1118.28, 449.107, 100, 0, 0),
(@CGUID+20, 5, -7670.01, -1119.68, 449.152, 100, 0, 0),
(@CGUID+20, 6, -7658.76, -1114.88, 449.159, 100, 0, 0),
(@CGUID+20, 7, -7665.08, -1108.27, 449.15, 100, 0, 0),
(@CGUID+20, 8, -7671.08, -1100.43, 449.142, 100, 0, 0),
(@CGUID+20, 9, -7678.17, -1087.58, 449.135, 100, 0, 0),
(@CGUID+20, 10, -7672.32, -1084.58, 449.147, 100, 0, 0),
(@CGUID+20, 11, -7661.63, -1091.06, 449.163, 100, 0, 0),
(@CGUID+20, 12, -7651.39, -1110.78, 449.174, 100, 0, 0),
(@CGUID+20, 13, -7644.75, -1097.22, 449.164, 100, 0, 0),
(@CGUID+20, 14, -7639.31, -1088.74, 449.164, 100, 0, 0),
(@CGUID+20, 15, -7646.05, -1079.42, 449.164, 100, 0, 0),
(@CGUID+20, 16, -7639.31, -1088.74, 449.164, 100, 0, 0),
(@CGUID+20, 17, -7644.75, -1097.22, 449.164, 100, 0, 0),
(@CGUID+20, 18, -7651.39, -1110.78, 449.174, 100, 0, 0),
(@CGUID+20, 19, -7661.63, -1091.06, 449.163, 100, 0, 0),
(@CGUID+20, 20, -7672.32, -1084.58, 449.147, 100, 0, 0),
(@CGUID+20, 21, -7678.17, -1087.58, 449.135, 100, 0, 0),
(@CGUID+20, 22, -7671.08, -1100.43, 449.142, 100, 0, 0),
(@CGUID+20, 23, -7665.08, -1108.27, 449.15, 100, 0, 0),
(@CGUID+20, 24, -7658.76, -1114.88, 449.159, 100, 0, 0),
(@CGUID+20, 25, -7670.01, -1119.68, 449.152, 100, 0, 0),
(@CGUID+20, 26, -7680.34, -1118.28, 449.107, 100, 0, 0),
(@CGUID+20, 27, -7687.57, -1104.84, 449.119, 100, 0, 0),
(@CGUID+20, 28, -7693.23, -1096.28, 449.123, 100, 0, 0),
(@CGUID+20, 29, -7701.18, -1089.75, 449.118, 100, 0, 0),
(@CGUID+20, 30, -7712.01, -1073.58, 445.176, 100, 0, 0),
(@CGUID+23, 1, -7610.64, -984.548, 440.202, 100, 0, 0),
(@CGUID+23, 2, -7620.45, -985.011, 440.036, 100, 0, 0),
(@CGUID+23, 3, -7624.83, -986.701, 440.016, 100, 0, 0),
(@CGUID+23, 4, -7634.97, -989.994, 440.263, 100, 0, 0),
(@CGUID+23, 5, -7644.41, -979.606, 440.263, 100, 0, 0),
(@CGUID+23, 6, -7649.09, -972.294, 440.267, 100, 0, 0),
(@CGUID+23, 7, -7626, -977.404, 440.035, 100, 0, 0),
(@CGUID+23, 8, -7622.68, -987.74, 440.021, 100, 0, 0),
(@CGUID+23, 9, -7636.27, -1000.11, 440.263, 100, 0, 0),
(@CGUID+23, 10, -7637.4, -1010.43, 439.987, 100, 0, 0),
(@CGUID+23, 11, -7647.33, -1011.35, 439.986, 100, 0, 0),
(@CGUID+23, 12, -7658.34, -1002.13, 439.986, 100, 0, 0),
(@CGUID+23, 13, -7661.77, -988.569, 439.986, 100, 0, 0),
(@CGUID+23, 14, -7649.55, -984.355, 440.263, 100, 0, 0),
(@CGUID+23, 15, -7637.2, -978.46, 439.992, 100, 0, 0),
(@CGUID+23, 16, -7634.49, -969.407, 440.025, 100, 0, 0),
(@CGUID+23, 17, -7626.36, -967.776, 440.059, 100, 0, 0),
(@CGUID+23, 18, -7619.71, -975.417, 440.273, 100, 0, 0),
(@CGUID+23, 19, -7614.9, -986.836, 440.052, 100, 0, 0),
(@CGUID+23, 20, -7619.72, -993.668, 440.017, 100, 0, 0),
(@CGUID+23, 21, -7626.13, -996.64, 440.263, 100, 0, 0),
(@CGUID+23, 22, -7632.96, -996.521, 440.263, 100, 0, 0),
(@CGUID+23, 23, -7653.35, -993.444, 439.987, 100, 0, 0),
(@CGUID+23, 24, -7632.96, -996.521, 440.263, 100, 0, 0),
(@CGUID+23, 25, -7626.13, -996.64, 440.263, 100, 0, 0),
(@CGUID+23, 26, -7619.72, -993.668, 440.017, 100, 0, 0),
(@CGUID+23, 27, -7614.9, -986.836, 440.052, 100, 0, 0),
(@CGUID+23, 28, -7619.71, -975.417, 440.273, 100, 0, 0),
(@CGUID+23, 29, -7626.25, -967.696, 440.312, 100, 0, 0),
(@CGUID+23, 30, -7634.49, -969.407, 440.025, 100, 0, 0),
(@CGUID+23, 31, -7637.2, -978.46, 439.992, 100, 0, 0),
(@CGUID+23, 32, -7649.55, -984.355, 440.263, 100, 0, 0),
(@CGUID+23, 33, -7661.77, -988.569, 439.986, 100, 0, 0),
(@CGUID+23, 34, -7658.34, -1002.13, 439.986, 100, 0, 0),
(@CGUID+23, 35, -7647.33, -1011.35, 439.986, 100, 0, 0),
(@CGUID+23, 36, -7637.4, -1010.43, 439.987, 100, 0, 0),
(@CGUID+23, 37, -7636.27, -1000.11, 440.263, 100, 0, 0),
(@CGUID+23, 38, -7622.68, -987.74, 440.021, 100, 0, 0),
(@CGUID+23, 39, -7626, -977.404, 440.035, 100, 0, 0),
(@CGUID+23, 40, -7649.09, -972.294, 440.267, 100, 0, 0),
(@CGUID+23, 41, -7644.41, -979.606, 440.263, 100, 0, 0),
(@CGUID+23, 42, -7634.97, -989.994, 440.263, 100, 0, 0),
(@CGUID+23, 43, -7624.83, -986.701, 440.016, 100, 0, 0),
(@CGUID+23, 44, -7620.45, -985.011, 440.036, 100, 0, 0),
(@CGUID+23, 45, -7610.64, -984.548, 440.202, 100, 0, 0),
(@CGUID+23, 46, -7595.67, -988.994, 440.091, 100, 0, 0),
(@CGUID+26, 1, -7695.1, -1052.93, 440.674, 100, 0, 0),
(@CGUID+26, 2, -7679.78, -1047.46, 440.219, 100, 0, 0),
(@CGUID+26, 3, -7683.87, -1038.3, 440.374, 100, 0, 0),
(@CGUID+26, 4, -7690.04, -1030.21, 440.384, 100, 0, 0),
(@CGUID+26, 5, -7696.85, -1024.06, 440.433, 100, 0, 0),
(@CGUID+26, 6, -7699.01, -1015.98, 440.373, 100, 0, 0),
(@CGUID+26, 7, -7704.31, -1004.79, 440.165, 100, 0, 0),
(@CGUID+26, 8, -7700.94, -1000.52, 440.174, 100, 0, 0),
(@CGUID+26, 9, -7698.79, -993.429, 440.137, 100, 0, 0),
(@CGUID+26, 10, -7691.95, -996.889, 440.191, 100, 0, 0),
(@CGUID+26, 11, -7682.15, -1002.88, 439.984, 100, 0, 0),
(@CGUID+26, 12, -7674.75, -1001.64, 440.23, 100, 0, 0),
(@CGUID+26, 13, -7674.32, -1009.23, 440.247, 100, 0, 0),
(@CGUID+26, 14, -7667.7, -1013.72, 440.267, 100, 0, 0),
(@CGUID+26, 15, -7663.99, -1021.79, 440.29, 100, 0, 0),
(@CGUID+26, 16, -7660.58, -1033.68, 440.176, 100, 0, 0),
(@CGUID+26, 17, -7672.2, -1040.59, 440.19, 100, 0, 0),
(@CGUID+26, 18, -7677.88, -1033.48, 439.982, 100, 0, 0),
(@CGUID+26, 19, -7682.6, -1022.21, 439.982, 100, 0, 0),
(@CGUID+26, 20, -7692.39, -1018.37, 440.269, 100, 0, 0),
(@CGUID+26, 21, -7700.77, -1021.95, 440.495, 100, 0, 0),
(@CGUID+26, 22, -7705.21, -1015.37, 440.444, 100, 0, 0),
(@CGUID+26, 23, -7700.77, -1021.95, 440.495, 100, 0, 0),
(@CGUID+26, 24, -7692.39, -1018.37, 440.269, 100, 0, 0),
(@CGUID+26, 25, -7682.6, -1022.21, 439.982, 100, 0, 0),
(@CGUID+26, 26, -7677.88, -1033.48, 439.982, 100, 0, 0),
(@CGUID+26, 27, -7672.2, -1040.59, 440.19, 100, 0, 0),
(@CGUID+26, 28, -7660.58, -1033.68, 440.176, 100, 0, 0),
(@CGUID+26, 29, -7663.99, -1021.79, 440.29, 100, 0, 0),
(@CGUID+26, 30, -7667.7, -1013.72, 440.267, 100, 0, 0),
(@CGUID+26, 31, -7674.32, -1009.23, 440.247, 100, 0, 0),
(@CGUID+26, 32, -7674.75, -1001.64, 440.23, 100, 0, 0),
(@CGUID+26, 33, -7682.15, -1002.88, 439.984, 100, 0, 0),
(@CGUID+26, 34, -7691.95, -996.889, 440.191, 100, 0, 0),
(@CGUID+26, 35, -7698.79, -993.429, 440.137, 100, 0, 0),
(@CGUID+26, 36, -7700.94, -1000.52, 440.174, 100, 0, 0),
(@CGUID+26, 37, -7704.31, -1004.79, 440.165, 100, 0, 0),
(@CGUID+26, 38, -7699.01, -1015.98, 440.373, 100, 0, 0),
(@CGUID+26, 39, -7696.85, -1024.06, 440.433, 100, 0, 0),
(@CGUID+26, 40, -7690.04, -1030.21, 440.384, 100, 0, 0),
(@CGUID+26, 41, -7683.87, -1038.3, 440.374, 100, 0, 0),
(@CGUID+26, 42, -7679.78, -1047.46, 440.219, 100, 0, 0),
(@CGUID+26, 43, -7695.1, -1052.93, 440.674, 100, 0, 0),
(@CGUID+26, 44, -7711.69, -1063.99, 445.176, 100, 0, 0),
(@CGUID+44, 1, -7516.770020, -918.172974, 457.575989, 2.239943, 10*1000, 0),
(@CGUID+44, 2, -7507.151855, -911.683411, 457.575989, 1.775773, 0, 1246101),
(@CGUID+45, 1, -7459.910156, -871.228027, 464.983002, 0.594382, 0, 0),
(@CGUID+45, 2, -7471.843262, -879.743896, 464.983002, 3.201117, 0, 0),
(@CGUID+45, 3, -7476.855957, -879.560974, 464.983002, 3.524701, 10*1000, 0),
(@CGUID+45, 5, -7471.843262, -879.743896, 464.983002, 3.201117, 0, 0),
(@CGUID+45, 6, -7459.910156, -871.228027, 464.983002, 0.594382, 0, 0),
(@CGUID+45, 7, -7456.350586, -866.346436, 464.984528, 1.374277, 0, 1246101),
(@CGUID+46, 1, -7409.779785, -927.672974, 464.983002, 5.239215, 10*1000, 0),
(@CGUID+46, 2, -7420.489746, -912.846130, 464.983002, 2.141603, 0, 1246101),
(@CGUID+47, 1, -7449.359863, -932.479004, 464.983002, 1.968039, 10*1000, 0),
(@CGUID+47, 2, -7437.153320, -949.930298, 464.983002, 5.298911, 0, 1246101),
(@CGUID+48, 1, -7498.000000, -1037.510010, 449.242004, 3.782838, 0, 0),
(@CGUID+48, 2, -7530.563965, -1058.321289, 449.242004, 0.583127, 5*1000, 0),
(@CGUID+48, 3, -7498.000000, -1037.510010, 449.242004, 0.559570, 20*1000, 0),
(@CGUID+48, 4, -7491.047363, -1032.294189, 449.242004, 0.559570, 0, 1246101),
(@CGUID+52, 1, -7515.290039, -972.690002, 449.242004, 5.255889, 0, 0),
(@CGUID+52, 2, -7526.435059, -972.025879, 449.242004, 2.119793, 20*1000, 0),
(@CGUID+52, 3, -7530.816406, -983.255432, 449.242004, 3.828818, 20*1000, 0),
(@CGUID+52, 4, -7515.290039, -972.690002, 449.242004, 5.255889, 0, 1246101),
(@CGUID+65, 1, -7680.62, -1110.73, 449.126, 100, 0, 0),
(@CGUID+65, 2, -7648.96, -1087.89, 449.164, 100, 0, 0),
(@CGUID+66, 1, -7633.58, -1053.72, 449.164, 100, 0, 0),
(@CGUID+66, 2, -7591.82, -1076.51, 449.164, 100, 0, 0),
(@CGUID+67, 1, -7705.59, -1013.9, 440.401, 100, 0, 0),
(@CGUID+67, 2, -7670.4, -1038.78, 440.197, 100, 0, 0),
(@CGUID+68, 1, -7624.98, -1078.78, 449.164, 100, 0, 0),
(@CGUID+68, 2, -7609.39, -1084.48, 449.164, 100, 0, 0),
(@CGUID+68, 3, -7624.98, -1078.78, 449.164, 100, 0, 0),
(@CGUID+68, 4, -7651.04, -1056.83, 449.172, 100, 0, 0),
(@CGUID+69, 1, -7633.23, -1007.72, 440.262, 100, 0, 0),
(@CGUID+69, 2, -7667.67, -987.11, 439.986, 100, 0, 0),
(@CGUID+70, 1, -7625.61, -1049.31, 449.164, 100, 0, 0),
(@CGUID+70, 2, -7608.66, -1082.75, 449.164, 100, 0, 0),
(@CGUID+70, 3, -7625.61, -1049.31, 449.164, 100, 0, 0),
(@CGUID+70, 4, -7624.89, -1036.41, 449.164, 100, 0, 0),
(@CGUID+71, 1, -7605.95, -984.189, 440.111, 100, 0, 0),
(@CGUID+71, 2, -7640.56, -967.494, 440.29, 100, 0, 0),
(@CGUID+72, 1, -7653.81, -979.409, 440.263, 100, 0, 0),
(@CGUID+72, 2, -7619.22, -999.321, 440.287, 100, 0, 0),
(@CGUID+73, 1, -7676.08, -1015.52, 439.983, 100, 0, 0),
(@CGUID+73, 2, -7668.89, -1020.34, 440.279, 100, 0, 0),
(@CGUID+73, 3, -7676.08, -1015.52, 439.983, 100, 0, 0),
(@CGUID+73, 4, -7696.82, -1004.11, 440.216, 100, 0, 0),
(@CGUID+74, 1, -7631.94, -1078.19, 449.164, 100, 0, 0),
(@CGUID+74, 2, -7642.19, -1059.9, 449.165, 100, 0, 0),
(@CGUID+74, 3, -7631.94, -1078.19, 449.164, 100, 0, 0),
(@CGUID+74, 4, -7629.75, -1102.86, 449.164, 100, 0, 0),
(@CGUID+75, 1, -7664.98, -1005.61, 440.254, 100, 0, 0),
(@CGUID+75, 2, -7684.11, -996.917, 440.204, 100, 0, 0),
(@CGUID+75, 3, -7664.98, -1005.61, 440.254, 100, 0, 0),
(@CGUID+75, 4, -7647.92, -1020.32, 440.232, 100, 0, 0),
(@CGUID+343, 1, -7526.199707, -1055.150757, 449.242218, 5.39919, 10*1000, 0),
(@CGUID+343, 2, -7505.534668, -1040.631714, 449.242218, 0.570566, 0, 0),
(@CGUID+343, 3, -7501.283691, -1041.707275, 449.242218, 6.073851, 9*1000, 1247101),
(@CGUID+343, 4, -7505.534668, -1040.631714, 449.242218, 0.570566, 0, 0),
(@CGUID+344, 1, -7531.121094, -974.014465, 449.239990, 2.143344, 15*1000, 0),
(@CGUID+344, 2, -7539.890137, -980.114990, 449.239990, 2.588665, 9*1000, 1247101);

DELETE FROM creature_movement_template WHERE entry IN (10162,11583,11983,13996,14601);
INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(10162, 0, 1, 169.33, -444.8, 121.98, 6.27848, 0, 0),
(10162, 0, 2, 161.91, -444.92, 121.98, 3.28768, 0, 0),

(11583, 0, 1, -7348.85, -1495.13, 552.515, 100, 0, 0),
(11583, 0, 2, -7348.54, -1494.18, 552.515, 100, 0, 0),
(11583, 0, 3, -7392.87, -1475.7, 544.619, 100, 0, 0),
(11583, 0, 4, -7423.42, -1437.66, 535.314, 100, 0, 0),
(11583, 0, 5, -7445.25, -1402.11, 523.842, 100, 0, 0),
(11583, 0, 6, -7460.38, -1372.6, 513.092, 100, 0, 0),
(11583, 0, 7, -7479.81, -1331.76, 498.759, 100, 0, 0),
(11583, 0, 8, -7492.58, -1295.35, 488.091, 100, 0, 0),
(11583, 0, 9, -7502, -1256.5, 476.758, 100, 20000, 0),

(11983, 0, 1, -7443.8, -908.338, 465.355, 100, 0, 0),
(11983, 0, 2, -7458.05, -889.8, 465.217, 100, 0, 0),
(11983, 0, 3, -7481.37, -906.587, 465.228, 100, 0, 0),
(11983, 0, 4, -7507.17, -922.419, 457.856, 100, 0, 0),
(11983, 0, 5, -7495.89, -939.483, 457.856, 100, 0, 0),
(11983, 0, 6, -7475.22, -969.278, 449.776, 100, 0, 0),
(11983, 0, 7, -7483.98, -998.087, 449.079, 100, 0, 0),
(11983, 0, 8, -7513.29, -1020.49, 448.906, 100, 0, 0),
(11983, 0, 9, -7483.98, -998.087, 449.079, 100, 0, 0),
(11983, 0, 10, -7475.22, -969.278, 449.776, 100, 0, 0),
(11983, 0, 11, -7495.77, -939.653, 457.895, 100, 0, 0),
(11983, 0, 12, -7507.17, -922.419, 457.856, 100, 0, 0),
(11983, 0, 13, -7481.39, -906.596, 465.227, 100, 0, 0),
(11983, 0, 14, -7458.05, -889.8, 465.217, 100, 0, 0),
(11983, 0, 15, -7443.95, -908.115, 465.328, 100, 0, 0),
(11983, 0, 16, -7418.69, -947.728, 464.981, 100, 0, 0),

(13996, 0, 1, -7466.55, -1015.38, 408.566, 6.02879, 0, 0),
(13996, 0, 2, -7453.62, -1019.73, 408.57, 5.64238, 0, 0),
(13996, 0, 3, -7443.76, -1031.75, 408.613, 5.3455, 0, 0),
(13996, 0, 4, -7436.59, -1037.8, 408.646, 1.43971, 0, 0),
(13996, 0, 5, -7433.49, -1032.99, 408.641, 1.7256, 0, 0),
(13996, 0, 6, -7436.15, -1025.96, 414.025, 1.98478, 0, 0),
(13996, 0, 7, -7441.49, -1017.68, 423.096, 2.1827, 0, 0),
(13996, 0, 8, -7443.33, -1015.06, 423.666, 2.1827, 0, 0),
(13996, 0, 9, -7456.49, -996.301, 423.666, 2.1827, 0, 0),
(13996, 0, 10, -7483.34, -962.278, 423.809, 2.63038, 0, 0),
(13996, 0, 11, -7488.85, -962.927, 423.693, 3.54929, 0, 0),
(13996, 0, 12, -7506.71, -972.992, 423.607, 3.50924, 0, 0),
(13996, 0, 13, -7514.11, -974.566, 423.477, 3.04035, 0, 0),
(13996, 0, 14, -7519.98, -969.585, 423.429, 2.28873, 0, 0),
(13996, 0, 15, -7526.96, -961.592, 427.805, 2.28873, 1, 1),

(13996, 1, 1, -7487.86, -1036.58, 408.562, 4.01652, 0, 0),
(13996, 1, 2, -7490.35, -1046.43, 408.571, 4.754, 0, 0),
(13996, 1, 3, -7478.75, -1064.94, 408.633, 5.27001, 0, 0),
(13996, 1, 4, -7483.2, -1069.96, 408.636, 3.40626, 0, 0),
(13996, 1, 5, -7491.67, -1062.21, 415.998, 2.15748, 0, 0),
(13996, 1, 6, -7496.75, -1054.78, 423.665, 2.24309, 0, 0),
(13996, 1, 7, -7512.88, -1032.64, 423.665, 2.20539, 0, 0),
(13996, 1, 8, -7531.46, -1007.4, 423.665, 2.20539, 0, 0),
(13996, 1, 9, -7534.84, -997.096, 423.764, 1.10269, 0, 0),
(13996, 1, 10, -7520.4, -979.642, 423.502, 0.994302, 0, 0),
(13996, 1, 11, -7519.79, -976.306, 423.433, 2.06087, 0, 0),
(13996, 1, 12, -7526.15, -964.647, 426.48, 1.98547, 0, 0),
(13996, 1, 13, -7529.9, -959.013, 427.93, 2.16926, 1, 1),

-- Ebonroc
(14601, 0, 1, -7358.19, -994.32, 477.167, 3.72812, 0, 0),
(14601, 0, 2, -7368.8, -983.092, 477.167, 2.40158, 0, 0),
(14601, 0, 3, -7378.3, -977.789, 477.168, 3.53177, 0, 0),
(14601, 0, 4, -7392.39, -983.383, 476.911, 3.53177, 0, 0),
(14601, 0, 5, -7405.91, -987.83, 473.768, 2.80606, 0, 0),
(14601, 0, 6, -7418.1, -976.627, 469.941, 1.4646, 0, 0),
(14601, 0, 7, -7414.41, -963.303, 466.541, 2.05993, 180000, 0),
(14601, 0, 8, -7418.1, -976.627, 469.941, 1.4646, 0, 0),
(14601, 0, 9, -7405.91, -987.83, 473.768, 2.80606, 0, 0),
(14601, 0, 10, -7392.39, -983.383, 476.911, 3.53177, 0, 0),
(14601, 0, 11, -7378.3, -977.789, 477.168, 3.53177, 0, 0),
(14601, 0, 12, -7368.8, -983.092, 477.167, 2.40158, 0, 0),
(14601, 0, 13, -7358.19, -994.32, 477.167, 3.72812, 10, 1460101);

INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(@CGUID+1, 0, 5, 1, 0, 0, 0, NULL); -- Lord Victor Nefarius

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(10162, 0, 0, 1, 0, 0, 0, NULL), -- Lord Victor Nefarius
(11981, 0, 0, 1, 16, 0, 0, NULL), -- Flamegor
(11983, 0, 0, 1, 16, 0, 0, NULL), -- Firemaw
(12017, 0, 0, 1, 16, 0, 0, NULL), -- Broodlord Lashlayer
(12434, 0, 0, 1, 16, 0, 0, NULL), -- Monster Generator (Blackwing)
(12435, 0, 0, 1, 0, 0, 0, '18943'), -- Razorgore the Untamed
(12457, 0, 0, 1, 0, 0, 0, NULL), -- Blackwing Spellbinder
(12458, 0, 0, 1, 16, 0, 0, NULL), -- Blackwing Taskmaster
(12459, 0, 0, 1, 0, 0, 0, NULL), -- Blackwing Warlock
(12460, 0, 0, 1, 0, 0, 0, '19818 22276 22282'), -- Death Talon Wyrmguard
(12461, 0, 0, 1, 0, 0, 0, '22276'), -- Death Talon Overseer
(12463, 0, 0, 1, 0, 0, 0, NULL), -- Death Talon Flamescale
(12464, 0, 0, 1, 0, 0, 0, NULL), -- Death Talon Seether
(12465, 0, 0, 1, 0, 0, 0, NULL), -- Death Talon Wyrmkin
(12467, 0, 0, 1, 0, 0, 0, '22436 22440'), -- Death Talon Captain
(12468, 0, 0, 1, 16, 0, 0, NULL), -- Death Talon Hatcher
(12557, 0, 0, 1, 0, 0, 0, '18950'), -- Grethok the Controller
(13020, 0, 0, 1, 0, 0, 0, NULL), -- Vaelastrasz the Corrupt
(13976, 0, 7, 1, 16, 0, 0, NULL), -- Tortured Drake
(13996, 0, 0, 1, 0, 133, 0, NULL), -- Blackwing Technician
(14020, 0, 0, 1, 16, 0, 0, NULL), -- Chromaggus
(14022, 0, 0, 1, 16, 0, 0, NULL), -- Corrupted Red Whelp
(14023, 0, 0, 1, 16, 0, 0, NULL), -- Corrupted Green Whelp
(14024, 0, 0, 1, 16, 0, 0, NULL), -- Corrupted Blue Whelp
(14025, 0, 0, 1, 16, 0, 0, NULL), -- Corrupted Bronze Whelp
(14401, 0, 0, 1, 0, 69, 0, NULL), -- Master Elemental Shaper Krixix
(14449, 0, 0, 1, 16, 0, 0, NULL), -- Blackwing Orb Trigger
(14456, 0, 0, 1, 0, 0, 0, NULL), -- Blackwing Guardsman
(14459, 0, 0, 1, 16, 0, 0, NULL), -- Nefarian's Troops
(14601, 0, 0, 1, 16, 0, 0, NULL), -- Ebonroc
(16604, 0, 0, 1, 16, 0, 0, NULL); -- Blackwing Spell Marker

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+21, @CGUID+20, 512), -- Blackwing Taskmaster -> Blackwing Taskmaster
(@CGUID+22, @CGUID+20, 512), -- Blackwing Taskmaster -> Blackwing Taskmaster
(@CGUID+24, @CGUID+23, 512), -- Blackwing Taskmaster -> Blackwing Taskmaster
(@CGUID+25, @CGUID+23, 512), -- Blackwing Taskmaster -> Blackwing Taskmaster
(@CGUID+27, @CGUID+26, 512), -- Blackwing Taskmaster -> Blackwing Taskmaster
(@CGUID+28, @CGUID+26, 512), -- Blackwing Taskmaster -> Blackwing Taskmaster
(@CGUID+92, @CGUID+95, 1155), -- Blackwing Technician -> Blackwing Technician
(@CGUID+93, @CGUID+97, 1155), -- Blackwing Technician -> Blackwing Technician
(@CGUID+94, @CGUID+97, 1155), -- Blackwing Technician -> Blackwing Technician
(@CGUID+95, @CGUID+89, 9344), -- Blackwing Technician -> Vaelastrasz the Corrupt
(@CGUID+96, @CGUID+95, 1155), -- Blackwing Technician -> Blackwing Technician
(@CGUID+97, @CGUID+89, 9344), -- Blackwing Technician -> Vaelastrasz the Corrupt
(@CGUID+42, @CGUID+41, 143), -- Death Talon Wyrmguard -> Death Talon Wyrmguard
(@CGUID+43, @CGUID+41, 143), -- Death Talon Wyrmguard -> Death Talon Wyrmguard
(@CGUID+339, @CGUID+136, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+340, @CGUID+136, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+143, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+144, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+145, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+146, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+147, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+148, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+149, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+150, @CGUID+142, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+48, @CGUID+142, 3), -- Death Talon Overseer -> Blackwing Technician
(@CGUID+341, @CGUID+142, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+342, @CGUID+142, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+343, @CGUID+142, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+151, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+152, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+153, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+154, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+158, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+155, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+157, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+156, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+160, @CGUID+159, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+52, @CGUID+159, 3), -- Death Talon Overseer -> Blackwing Technician
(@CGUID+344, @CGUID+159, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+345, @CGUID+159, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+346, @CGUID+159, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+30, @CGUID+105, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+29, @CGUID+105, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+44, @CGUID+105, 3), -- Death Talon Overseer -> Blackwing Technician
(@CGUID+14, @CGUID+105, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+31, @CGUID+114, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+32, @CGUID+114, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+45, @CGUID+114, 3), -- Death Talon Overseer -> Blackwing Technician
(@CGUID+15, @CGUID+114, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+18, @CGUID+134, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+19, @CGUID+134, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+35, @CGUID+134, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+36, @CGUID+134, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+47, @CGUID+134, 3), -- Death Talon Overseer -> Blackwing Technician
(@CGUID+16, @CGUID+119, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+17, @CGUID+119, 3), -- Blackwing Spellbinder -> Blackwing Technician
(@CGUID+33, @CGUID+119, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+34, @CGUID+119, 3), -- Blackwing Warlock -> Blackwing Technician
(@CGUID+46, @CGUID+119, 3), -- Death Talon Overseer -> Blackwing Technician
(@CGUID+137, @CGUID+136, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+138, @CGUID+136, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+139, @CGUID+136, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+140, @CGUID+136, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+141, @CGUID+136, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+106, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+107, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+99, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+100, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+101, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+102, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+103, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+104, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+98, @CGUID+105, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+109, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+117, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+108, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+111, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+110, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+115, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+116, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+113, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+112, @CGUID+114, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+135, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+133, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+127, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+132, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+130, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+129, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+128, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+131, @CGUID+134, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+120, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+122, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+125, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+123, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+126, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+121, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+118, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+124, @CGUID+119, 143), -- Blackwing Technician -> Blackwing Technician
(@CGUID+49, @CGUID+40, 143), -- Death Talon Overseer -> Death Talon Wyrmguard
(@CGUID+50, @CGUID+40, 143), -- Death Talon Overseer -> Death Talon Wyrmguard
(@CGUID+51, @CGUID+40, 143), -- Death Talon Overseer -> Death Talon Wyrmguard
(@CGUID+37, @CGUID+39, 143), -- Death Talon Wyrmguard -> Death Talon Wyrmguard
(@CGUID+38, @CGUID+39, 143), -- Death Talon Wyrmguard -> Death Talon Wyrmguard
(@CGUID+53, @CGUID+63, 1027), -- Death Talon Flamescale -> Death Talon Captain
(@CGUID+56, @CGUID+63, 1027), -- Death Talon Seether -> Death Talon Captain
(@CGUID+60, @CGUID+63, 1027), -- Death Talon Wyrmkin -> Death Talon Captain
(@CGUID+57, @CGUID+63, 1027), -- Death Talon Seether -> Death Talon Captain
(@CGUID+59, @CGUID+63, 1027), -- Death Talon Wyrmkin -> Death Talon Captain
(@CGUID+55, @CGUID+64, 1027), -- Death Talon Flamescale -> Death Talon Captain
(@CGUID+54, @CGUID+64, 1027), -- Death Talon Flamescale -> Death Talon Captain
(@CGUID+61, @CGUID+64, 1027), -- Death Talon Wyrmkin -> Death Talon Captain
(@CGUID+62, @CGUID+64, 1027), -- Death Talon Wyrmkin -> Death Talon Captain
(@CGUID+58, @CGUID+64, 1027); -- Death Talon Seether -> Death Talon Captain

REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(12557, 469, 12435, 1159, 0), -- Grethok the Controller -> Razorgore the Untamed
(14456, 469, 12557, 1167, 0), -- Blackwing Guardsman -> Grethok the Controller
(14024, 469, 12017, 1024, 0), -- Corrupted Blue Whelp -> Broodlord Lashlayer
(14023, 469, 12017, 1024, 0), -- Corrupted Green Whelp -> Broodlord Lashlayer
(14025, 469, 12017, 1024, 0), -- Corrupted Bronze Whelp -> Broodlord Lashlayer
(14022, 469, 12017, 1024, 0), -- Corrupted Red Whelp -> Broodlord Lashlayer
(12467, 469, 12017, 1024, 0), -- Death Talon Captain -> Broodlord Lashlayer
(12458, 469, 12017, 1024, 0), -- Blackwing Taskmaster -> Broodlord Lashlayer
(12468, 469, 12017, 1024, 0); -- Death Talon Hatcher -> Broodlord Lashlayer

INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 10162, 469, -7588.27, -1261.92, 482.03, 0.610865, 604800, 604800, 0, 0, 0, 0), -- Lord Victor Nefarius
(@CGUID+2, 11981, 469, -7407.94, -1031.04, 477.35, 0.87, 604800, 604800, 5, 0, 0, 1), -- Flamegor
(@CGUID+3, 11983, 469, -7433.38, -923.829, 465.354, 2.16294, 604800, 604800, 0, 0, 0, 2), -- Firemaw
(@CGUID+4, 12017, 469, -7573.89, -1035.25, 449.248, 3.76991, 604800, 604800, 0, 0, 0, 0), -- Broodlord Lashlayer
(@CGUID+5, 12434, 469, -7623.09, -1094.06, 407.288, 1.44862, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+6, 12434, 469, -7548.46, -1041.98, 407.288, 2.02458, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+7, 12434, 469, -7568.61, -1012.67, 407.288, 1.51844, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+8, 12434, 469, -7643.39, -1064.69, 407.288, 1.71042, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+9, 12434, 469, -7583.08, -990.483, 407.282, 4.81711, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+10, 12434, 469, -7607.78, -1116.16, 407.282, 5.34071, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+11, 12434, 469, -7659.81, -1043.81, 407.282, 4.79965, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+12, 12434, 469, -7532.72, -1063.49, 407.282, 0.087266, 300, 300, 0, 0, 0, 0), -- Monster Generator (Blackwing)
(@CGUID+13, 12435, 469, -7571.7, -1088.25, 413.465, 2.16421, 604800, 604800, 0, 0, 0, 0), -- Razorgore the Untamed
(@CGUID+14, 12457, 469, -7514.66, -915.673, 457.743, 4.17682, 14400, 14400, 0, 0, 0, 2), -- Blackwing Spellbinder
(@CGUID+15, 12457, 469, -7490.72, -880.022, 464.983, 5.32325, 14400, 14400, 0, 0, 0, 2), -- Blackwing Spellbinder
(@CGUID+16, 12457, 469, -7411.74, -920.011, 464.983, 4.36365, 14400, 14400, 2, 0, 0, 1), -- Blackwing Spellbinder
(@CGUID+17, 12457, 469, -7413.56, -900.292, 464.983, 0.753603, 14400, 14400, 0, 0, 0, 2), -- Blackwing Spellbinder
(@CGUID+18, 12457, 469, -7448.26, -943.315, 464.983, 3.754815, 14400, 14400, 0, 0, 0, 0), -- Blackwing Spellbinder
(@CGUID+19, 12457, 469, -7440.38, -962.319, 465.01, 4.3018, 14400, 14400, 0, 0, 0, 2), -- Blackwing Spellbinder
(@CGUID+20, 12458, 469, -7710.56, -1074.25, 445.231, 5.25651, 600, 600, 0, 0, 0, 2), -- Blackwing Taskmaster
(@CGUID+21, 12458, 469, -7711.3, -1076.48, 445.26, 2.37365, 600, 600, 0, 0, 0, 0), -- Blackwing Taskmaster
(@CGUID+22, 12458, 469, -7714.44, -1074.78, 445.26, 5.88395, 600, 600, 0, 0, 0, 0), -- Blackwing Taskmaster
(@CGUID+23, 12458, 469, -7597.14, -987.723, 440.164, 2.91064, 600, 600, 0, 0, 0, 2), -- Blackwing Taskmaster
(@CGUID+24, 12458, 469, -7594.45, -991.831, 440.179, 3.00101, 600, 600, 0, 0, 0, 0), -- Blackwing Taskmaster
(@CGUID+25, 12458, 469, -7594.02, -987.55, 440.449, 3.05115, 600, 600, 0, 0, 0, 0), -- Blackwing Taskmaster
(@CGUID+26, 12458, 469, -7711.98, -1061.63, 445.257, 0.475976, 600, 600, 0, 0, 0, 2), -- Blackwing Taskmaster
(@CGUID+27, 12458, 469, -7708.62, -1064.7, 445.26, 1.7658, 600, 600, 0, 0, 0, 0), -- Blackwing Taskmaster
(@CGUID+28, 12458, 469, -7711.34, -1064.65, 445.26, 1.03316, 600, 600, 0, 0, 0, 0), -- Blackwing Taskmaster
(@CGUID+29, 12459, 469, -7519.72, -924.978, 457.576, 4.17771, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+30, 12459, 469, -7506.75, -908.368, 457.576, 3.9809, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+31, 12459, 469, -7485.52, -879.601, 464.983, 4.68566, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+32, 12459, 469, -7453.46, -867.442, 464.983, 3.94111, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+33, 12459, 469, -7419.66, -900.648, 464.983, 3.17421, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+34, 12459, 469, -7399.84, -935.079, 464.983, 5.60629, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+35, 12459, 469, -7458.91, -926.418, 464.983, 2.81263, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+36, 12459, 469, -7435.58, -959.662, 465.011, 0.042043, 14400, 14400, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+37, 12460, 469, -7388.2, -955.983, 465.047, 2.33874, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmguard
(@CGUID+38, 12460, 469, -7396.24, -961.435, 465.044, 2.25148, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmguard
(@CGUID+39, 12460, 469, -7405.67, -964.438, 465.031, 2.00713, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmguard
(@CGUID+40, 12460, 469, -7471.39, -988.327, 449.844, 5.53269, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmguard
(@CGUID+41, 12460, 469, -7435.86, -1052.22, 477.018, 0.750492, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmguard
(@CGUID+42, 12460, 469, -7450.36, -1032.99, 476.981, 0.506145, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmguard
(@CGUID+43, 12460, 469, -7446.95, -1044.77, 476.806, 0, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmguard
(@CGUID+44, 12461, 469, -7516.77, -918.173, 457.576, 3.22554, 14400, 14400, 0, 0, 0, 2), -- Death Talon Overseer
(@CGUID+45, 12461, 469, -7459.91, -871.228, 464.983, 0.829778, 14400, 14400, 0, 0, 0, 2), -- Death Talon Overseer
(@CGUID+46, 12461, 469, -7409.78, -927.673, 464.983, 5.12372, 14400, 14400, 0, 0, 0, 2), -- Death Talon Overseer
(@CGUID+47, 12461, 469, -7449.36, -932.479, 464.983, 1.94755, 14400, 14400, 0, 0, 0, 2), -- Death Talon Overseer
(@CGUID+48, 12461, 469, -7498, -1037.51, 449.242, 3.75923, 14400, 14400, 0, 0, 0, 2), -- Death Talon Overseer
(@CGUID+49, 12461, 469, -7461.63, -985.513, 449.782, 4.13643, 14400, 14400, 0, 0, 0, 0), -- Death Talon Overseer
(@CGUID+50, 12461, 469, -7467.69, -995.597, 449.325, 0.453786, 14400, 14400, 0, 0, 0, 0), -- Death Talon Overseer
(@CGUID+51, 12461, 469, -7459.26, -995.384, 449.785, 2.3911, 14400, 14400, 0, 0, 0, 0), -- Death Talon Overseer
(@CGUID+52, 12461, 469, -7515.29, -972.69, 449.242, 6.00786, 14400, 14400, 0, 0, 0, 2), -- Death Talon Overseer
(@CGUID+53, 12463, 469, -7591.24, -941.373, 428.301, 1.27409, 14400, 14400, 0, 0, 0, 0), -- Death Talon Flamescale
(@CGUID+54, 12463, 469, -7522.07, -924.434, 428.001, 2.07694, 14400, 14400, 0, 0, 0, 0), -- Death Talon Flamescale
(@CGUID+55, 12463, 469, -7534.13, -924.27, 428.045, 0.855211, 14400, 14400, 0, 0, 0, 0), -- Death Talon Flamescale
(@CGUID+56, 12464, 469, -7595.81, -931.231, 428.359, 0.20944, 14400, 14400, 0, 0, 0, 0), -- Death Talon Seether
(@CGUID+57, 12464, 469, -7576.75, -922.269, 428.383, 3.76991, 14400, 14400, 0, 0, 0, 0), -- Death Talon Seether
(@CGUID+58, 12464, 469, -7539.27, -905.861, 428.093, 5.91667, 14400, 14400, 0, 0, 0, 0), -- Death Talon Seether
(@CGUID+59, 12465, 469, -7572.26, -932.452, 428.302, 2.87979, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmkin
(@CGUID+60, 12465, 469, -7587.03, -916.311, 428.462, 5.0091, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmkin
(@CGUID+61, 12465, 469, -7517.52, -912.762, 428.026, 3.36848, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmkin
(@CGUID+62, 12465, 469, -7527.61, -904.831, 428.011, 4.45059, 14400, 14400, 0, 0, 0, 0), -- Death Talon Wyrmkin
(@CGUID+63, 12467, 469, -7580.13, -940.164, 428.259, 2.04204, 14400, 14400, 0, 0, 0, 0), -- Death Talon Captain
(@CGUID+64, 12467, 469, -7541.13, -917.746, 428.11, 0.05236, 14400, 14400, 0, 0, 0, 0), -- Death Talon Captain
(@CGUID+65, 12468, 469, -7655.51, -1100.16, 449.243, 3.54007, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+66, 12468, 469, -7592.86, -1075.23, 449.246, 2.65568, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+67, 12468, 469, -7673.25, -1039.96, 440.28, 2.46326, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+68, 12468, 469, -7649.78, -1057.55, 449.247, 5.57555, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+69, 12468, 469, -7668.59, -986.566, 440.329, 5.74399, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+70, 12468, 469, -7624.29, -1035.04, 449.244, 4.62018, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+71, 12468, 469, -7639.27, -968.392, 440.092, 5.84041, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+72, 12468, 469, -7620.51, -998.365, 440.319, 2.62407, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+73, 12468, 469, -7695.27, -1005.48, 440.297, 5.80156, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+74, 12468, 469, -7630.35, -1101.33, 449.246, 1.63947, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+75, 12468, 469, -7649.74, -1019.88, 440.318, 2.38942, 600, 600, 0, 0, 0, 2), -- Death Talon Hatcher
(@CGUID+76, 12557, 469, -7616.54, -1024.1, 413.465, 5.2709, 3520, 3520, 0, 0, 0, 0), -- Grethok the Controller
(@CGUID+77, 12999, 469, -7696.49, -1084.81, 449.201, 0.733038, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+78, 12999, 469, -7515.32, -1191.12, 476.883, 2.84489, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+79, 12999, 469, -7533.07, -1244.8, 476.883, 3.56047, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+80, 12999, 469, -7551.71, -1216.2, 476.883, 1.25664, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+81, 12999, 469, -7495.41, -1218.15, 476.883, 1.15192, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+82, 12999, 469, -7516, -1050.2, 476.638, 1.11701, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+83, 12999, 469, -7638.84, -1099.39, 449.164, 0.150772, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+84, 12999, 469, -7705.6, -1082.73, 447.127, 2.26887, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+85, 12999, 469, -7625.86, -980.584, 440.11, 3.75991, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+86, 12999, 469, -7639.1, -1090.77, 408.574, 4.99164, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+87, 12999, 469, -7591.69, -1264.38, 481.091, 1.309, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+88, 12999, 469, -7477.6, -1048.63, 426.738, 4.29351, 300, 300, 0, 0, 0, 0), -- World Invisible Trigger ( DO NOT DELETE)
(@CGUID+89, 13020, 469, -7483.79, -1015.99, 408.652, 4.69494, 604800, 604800, 0, 0, 0, 0), -- Vaelastrasz the Corrupt
(@CGUID+90, 13976, 469, -7344.75, -958.086, 481.685, 5.81195, 604800, 604800, 0, 0, 0, 0), -- Tortured Drake
(@CGUID+91, 13976, 469, -7393.3, -1070.78, 479.793, 3.22886, 604800, 604800, 0, 0, 0, 0), -- Tortured Drake
(@CGUID+92, 13996, 469, -7492.67, -1003.49, 408.652, 0.279253, 3520, 3520, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+93, 13996, 469, -7471.64, -1005.85, 408.648, 3.68265, 3520, 3520, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+94, 13996, 469, -7478.53, -996.153, 408.646, 4.64258, 3520, 3520, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+95, 13996, 469, -7486.45, -1025.62, 408.641, 1.23918, 3520, 3520, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+96, 13996, 469, -7490.95, -1014.89, 408.643, 0.663225, 3520, 3520, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+97, 13996, 469, -7474, -1020.49, 408.65, 2.82743, 3520, 3520, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+98, 13996, 469, -7509.21, -906.469, 457.659, 1.44862, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+99, 13996, 469, -7519.58, -932.073, 457.659, 3.71755, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+100, 13996, 469, -7523.42, -929.52, 457.659, 3.76991, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+101, 13996, 469, -7525.49, -924.404, 457.659, 3.63029, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+102, 13996, 469, -7526.44, -921.499, 457.659, 3.05433, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+103, 13996, 469, -7527.31, -919.01, 457.659, 2.21657, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+104, 13996, 469, -7524.24, -916.833, 457.659, 1.85005, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+105, 13996, 469, -7506.35, -904.139, 457.659, 2.09439, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+106, 13996, 469, -7514.63, -936.928, 457.659, 3.05433, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+107, 13996, 469, -7518.07, -933.761, 457.659, 5.14872, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+108, 13996, 469, -7488.13, -880.569, 465.067, 4.81711, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+109, 13996, 469, -7484.71, -886.083, 465.067, 3.36848, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+110, 13996, 469, -7472.84, -870.652, 465.067, 0.925025, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+111, 13996, 469, -7471.76, -871.89, 465.067, 1.37881, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+112, 13996, 469, -7453.61, -860.511, 465.067, 1.22173, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+113, 13996, 469, -7452.37, -863.403, 465.067, 0.279253, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+114, 13996, 469, -7448.91, -868.297, 465.067, 0.244346, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+115, 13996, 469, -7463.19, -867.522, 465.067, 2.60054, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+116, 13996, 469, -7464.36, -862.938, 465.067, 3.90954, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+117, 13996, 469, -7485.81, -883.083, 465.067, 3.85718, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+118, 13996, 469, -7411.48, -901.349, 465.067, 0.488692, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+119, 13996, 469, -7419.28, -895.444, 465.067, 0.907571, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+120, 13996, 469, -7398.45, -930.862, 465.067, 0.453786, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+121, 13996, 469, -7411.15, -909.451, 465.55, 6.24828, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+122, 13996, 469, -7396.76, -932.977, 465.067, 0.785398, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+123, 13996, 469, -7408.65, -917.047, 465.067, 0.418879, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+124, 13996, 469, -7396.33, -935.828, 465.067, 5.55015, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+125, 13996, 469, -7401.1, -918.476, 465.067, 1.91986, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+126, 13996, 469, -7411.39, -911.361, 465.067, 5.96903, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+127, 13996, 469, -7456.58, -950.893, 465.067, 3.76991, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+128, 13996, 469, -7440.32, -970.539, 465.067, 3.26377, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+129, 13996, 469, -7453.04, -954.129, 465.067, 3.61283, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+130, 13996, 469, -7460.6, -946.643, 465.067, 3.42085, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+131, 13996, 469, -7440.23, -966.863, 465.067, 2.9147, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+132, 13996, 469, -7459.17, -948.695, 465.067, 3.9968, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+133, 13996, 469, -7462.47, -937.057, 465.067, 3.14159, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+134, 13996, 469, -7443.55, -964.305, 465.067, 5.35816, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+135, 13996, 469, -7467.7, -927.494, 465.067, 4.53786, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+136, 13996, 469, -7550.72, -1043, 449.325, 3.50811, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+137, 13996, 469, -7551.43, -1040.67, 449.325, 3.08923, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+138, 13996, 469, -7550.22, -1038.97, 449.325, 2.60054, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+139, 13996, 469, -7546.59, -1013.29, 449.325, 0.663225, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+140, 13996, 469, -7550.8, -1014.48, 449.325, 1.18682, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+141, 13996, 469, -7547.72, -1014.95, 449.325, 2.11185, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+142, 13996, 469, -7523.28, -1060.82, 449.325, 4.72984, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+143, 13996, 469, -7521.06, -1058.83, 449.325, 5.51524, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+144, 13996, 469, -7517.85, -1056.92, 449.325, 5.51524, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+145, 13996, 469, -7514.51, -1054.34, 449.325, 5.74213, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+146, 13996, 469, -7513.05, -1051.5, 449.325, 5.53269, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+147, 13996, 469, -7510.62, -1049.56, 449.325, 5.5676, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+148, 13996, 469, -7508.79, -1046.54, 449.325, 5.67232, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+149, 13996, 469, -7504.52, -1043.61, 449.325, 5.84685, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+150, 13996, 469, -7496.73, -1040.82, 449.325, 4.13643, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+151, 13996, 469, -7541.99, -981.618, 449.325, 3.40339, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+152, 13996, 469, -7543.75, -979.348, 449.325, 3.14159, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+153, 13996, 469, -7541.6, -976.958, 449.325, 2.47837, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+154, 13996, 469, -7533.69, -972.008, 449.325, 2.19912, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+155, 13996, 469, -7527.01, -967.031, 449.325, 1.90241, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+156, 13996, 469, -7519.75, -962.466, 449.325, 2.44346, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+157, 13996, 469, -7523.22, -964.212, 449.325, 2.00713, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+158, 13996, 469, -7530.23, -969.405, 449.325, 2.46091, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+159, 13996, 469, -7535.72, -987.541, 449.325, 5.14872, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+160, 13996, 469, -7515.74, -960.099, 449.325, 1.88496, 14400, 14400, 0, 0, 0, 0), -- Blackwing Technician
(@CGUID+161, 14020, 469, -7515.34, -1029.62, 476.73, 5.33, 604800, 604800, 0, 0, 0, 0), -- Chromaggus
(@CGUID+162, 14022, 469, -7656.85, -975.14, 440.287, 0.418879, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+163, 14022, 469, -7673.17, -988.168, 440.308, 3.14742, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+164, 14022, 469, -7645.7, -1016.46, 440.304, 4.16073, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+165, 14022, 469, -7633.5, -1062.02, 449.247, 3.27687, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+166, 14022, 469, -7648.7, -1025.35, 440.26, 2.61548, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+167, 14022, 469, -7643.36, -1017.6, 440.309, 3.79791, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+168, 14022, 469, -7669.85, -1042.61, 440.23, 1.71042, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+169, 14022, 469, -7647.48, -1093.84, 449.247, 3.14159, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+170, 14022, 469, -7658.36, -1071.11, 449.247, 5.31475, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+171, 14022, 469, -7678.29, -1123.55, 449.099, 0.216448, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+172, 14022, 469, -7681.89, -998.11, 440.342, 4.88692, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+173, 14022, 469, -7624.56, -1038.27, 449.247, 3.21085, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+174, 14022, 469, -7618.44, -1038.33, 449.247, 2.84489, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+175, 14022, 469, -7622.55, -978.518, 440.129, 3.72757, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+176, 14022, 469, -7695.47, -1017.1, 440.395, 5.2588, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+177, 14022, 469, -7619.76, -1047.64, 449.247, 5.67232, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+178, 14022, 469, -7652.35, -992.23, 440.07, 3.03176, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+179, 14022, 469, -7708.75, -1082.18, 446.224, 0.642683, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+180, 14022, 469, -7693.29, -1094.91, 449.205, 3.07178, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+181, 14022, 469, -7634.62, -961.161, 440.345, 3.81743, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+182, 14022, 469, -7601.64, -1050.85, 449.247, 3.70621, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+183, 14022, 469, -7600.73, -1025.35, 449.247, 0.750492, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+184, 14022, 469, -7632.46, -1003.41, 440.346, 0.453786, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+185, 14022, 469, -7653.06, -1092.68, 449.247, 1.85338, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+186, 14022, 469, -7716.05, -1071.89, 445.26, 3.26629, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+187, 14022, 469, -7597.61, -1067.39, 449.247, 5.79449, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+188, 14022, 469, -7681.28, -1007.74, 440.067, 5.28509, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+189, 14022, 469, -7598.69, -1072.55, 449.247, 3.64272, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+190, 14022, 469, -7643.34, -997.209, 440.345, 4.27606, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+191, 14022, 469, -7676.78, -1036.71, 440.065, 1.70262, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+192, 14022, 469, -7582.47, -1062.96, 449.247, 1.5386, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+193, 14022, 469, -7574.83, -1066.29, 449.247, 0.474864, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+194, 14022, 469, -7645.29, -1001.86, 440.07, 2.67288, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+195, 14022, 469, -7695.45, -1029.21, 440.56, 6.20508, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+196, 14022, 469, -7705.58, -1088.98, 449.118, 0.130458, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+197, 14022, 469, -7703.89, -1056.78, 443.54, 5.68162, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+198, 14022, 469, -7644.6, -1102.49, 449.164, 2.22065, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+199, 14022, 469, -7654.64, -1113.16, 449.167, 2.68266, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+200, 14022, 469, -7657.92, -985.007, 440.07, 5.07652, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+201, 14022, 469, -7670.19, -1018.47, 440.282, 2.96706, 30, 30, 2, 0, 0, 1), -- Corrupted Red Whelp
(@CGUID+202, 14023, 469, -7621.75, -1068.85, 449.247, 4.53714, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+203, 14023, 469, -7666, -1036.99, 440.265, 3.9851, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+204, 14023, 469, -7641.1, -1015.7, 440.314, 3.86024, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+205, 14023, 469, -7667.06, -991.905, 440.069, 6.1524, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+206, 14023, 469, -7666.45, -1044.84, 440.189, 5.02655, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+207, 14023, 469, -7646.14, -1022.28, 440.289, 4.2302, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+208, 14023, 469, -7647.05, -1068.97, 449.247, 5.30056, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+209, 14023, 469, -7655.83, -1066.95, 449.247, 5.36204, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+210, 14023, 469, -7684.35, -1122.91, 449.081, 1.73246, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+211, 14023, 469, -7669.68, -1112.44, 449.14, 2.27857, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+212, 14023, 469, -7695.53, -1013.02, 440.098, 0.124663, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+213, 14023, 469, -7681.77, -992.085, 440.28, 4.78832, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+214, 14023, 469, -7641.78, -987.448, 440.346, 3.68265, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+215, 14023, 469, -7622.71, -1029.08, 449.247, 3.67982, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+216, 14023, 469, -7624.89, -1046.62, 449.247, 1.29154, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+217, 14023, 469, -7683.09, -1108.72, 449.222, 4.71761, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+218, 14023, 469, -7630.01, -1069.4, 449.247, 4.70007, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+219, 14023, 469, -7636.66, -963.865, 440.356, 3.59404, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+220, 14023, 469, -7618.11, -1059.93, 449.247, 0.819205, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+221, 14023, 469, -7602.88, -1031.5, 449.247, 4.53801, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+222, 14023, 469, -7629.85, -1001.31, 440.346, 2.27136, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+223, 14023, 469, -7719.53, -1067.46, 445.26, 6.11929, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+224, 14023, 469, -7594.8, -1086.24, 449.247, 3.61283, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+225, 14023, 469, -7673.18, -1009.97, 440.342, 1.91018, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+226, 14023, 469, -7687.76, -1025.21, 440.355, 5.03737, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+227, 14023, 469, -7639.89, -990.146, 440.346, 0.193068, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+228, 14023, 469, -7685.87, -1036.16, 440.467, 5.90017, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+229, 14023, 469, -7571, -1064.3, 449.247, 0.281585, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+230, 14023, 469, -7694.26, -1023.88, 440.464, 5.50751, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+231, 14023, 469, -7706.02, -1062.06, 445.176, 3.79242, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+232, 14023, 469, -7695.12, -1055.39, 440.674, 0.29069, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+233, 14023, 469, -7681.6, -1087.51, 449.209, 5.06145, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+234, 14023, 469, -7641.5, -1100.43, 449.164, 2.07355, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+235, 14023, 469, -7703.9, -1083.14, 447.703, 0.0948235, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+236, 14023, 469, -7674.31, -1026.79, 440.066, 1.86549, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+237, 14023, 469, -7665.73, -1009.91, 440.343, 2.20585, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+238, 14023, 469, -7667.65, -987.774, 440.069, 5.58975, 30, 30, 2, 0, 0, 1), -- Corrupted Green Whelp
(@CGUID+239, 14024, 469, -7652.4, -1052.16, 449.259, 3.24727, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+240, 14024, 469, -7632.09, -1015.39, 440.24, 4.29252, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+241, 14024, 469, -7659.83, -979.335, 440.315, 0.545102, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+242, 14024, 469, -7608.47, -1066.02, 449.247, 6.25989, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+243, 14024, 469, -7635.41, -1018.93, 440.244, 4.31024, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+244, 14024, 469, -7656.67, -1038.08, 440.189, 4.04103, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+245, 14024, 469, -7659.56, -1086.99, 449.247, 1.71367, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+246, 14024, 469, -7646.83, -1086.38, 449.247, 5.58312, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+247, 14024, 469, -7692.41, -1112.29, 449.083, 5.19745, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+248, 14024, 469, -7630.92, -1049.91, 449.247, 5.71655, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+249, 14024, 469, -7701.07, -1019.07, 440.55, 0.698132, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+250, 14024, 469, -7678.04, -998.592, 440.342, 3.02629, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+251, 14024, 469, -7688.92, -990.716, 440.197, 4.21918, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+252, 14024, 469, -7686.58, -1012.38, 440.066, 2.76825, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+253, 14024, 469, -7630.23, -1033.7, 449.247, 3.55355, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+254, 14024, 469, -7618.19, -989.43, 440.117, 4.2586, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+255, 14024, 469, -7616.03, -1044.02, 449.247, 4.45059, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+256, 14024, 469, -7693.18, -1100.67, 449.21, 5.08783, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+257, 14024, 469, -7662.24, -1080.32, 449.247, 5.8294, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+258, 14024, 469, -7602.56, -1016.52, 449.247, 6.24578, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+259, 14024, 469, -7635.01, -1087.5, 449.247, 4.97402, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+260, 14024, 469, -7642.42, -965.778, 440.297, 3.902, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+261, 14024, 469, -7606.54, -1020.91, 449.247, 6.05682, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+262, 14024, 469, -7627.33, -1009.28, 440.275, 0.466249, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+263, 14024, 469, -7607.43, -1041.7, 449.247, 6.03584, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+264, 14024, 469, -7710.71, -1066.49, 445.26, 5.07891, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+265, 14024, 469, -7678.43, -1018, 440.066, 5.5646, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+266, 14024, 469, -7592.26, -1079.79, 449.247, 4.91554, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+267, 14024, 469, -7653.86, -1010.09, 440.069, 1.64492, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+268, 14024, 469, -7631.21, -971.92, 440.114, 0.31893, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+269, 14024, 469, -7571.74, -1070.18, 449.247, 5.81579, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+270, 14024, 469, -7632.61, -1102.87, 449.247, 1.35165, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+271, 14024, 469, -7683.51, -1047.26, 440.364, 2.6953, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+272, 14024, 469, -7694.11, -1034.31, 440.603, 5.63692, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+273, 14024, 469, -7670.3, -1100.32, 449.144, 2.41785, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+274, 14024, 469, -7713.75, -1070.71, 445.176, 4.19547, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+275, 14024, 469, -7701.67, -1057.32, 442.867, 4.92621, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+276, 14024, 469, -7659.66, -1118.74, 449.156, 0.507403, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+277, 14024, 469, -7651.96, -981.664, 440.346, 5.50748, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+278, 14024, 469, -7671.18, -982.726, 440.255, 0.480707, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+279, 14024, 469, -7659.06, -995.701, 440.069, 2.66601, 30, 30, 2, 0, 0, 1), -- Corrupted Blue Whelp
(@CGUID+280, 14025, 469, -7638.1, -1016.86, 440.273, 4.80086, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+281, 14025, 469, -7661.5, -988.088, 440.07, 0.698132, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+282, 14025, 469, -7621.99, -1077.23, 449.247, 1.51844, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+283, 14025, 469, -7635.98, -1012.13, 440.314, 4.38317, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+284, 14025, 469, -7648.13, -1057.97, 449.247, 5.94139, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+285, 14025, 469, -7660, -1041.1, 440.189, 5.59405, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+286, 14025, 469, -7640.15, -1011.7, 440.069, 2.03926, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+287, 14025, 469, -7636.04, -1078.19, 449.247, 4.72424, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+288, 14025, 469, -7678.87, -1129.23, 449.082, 2.03995, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+289, 14025, 469, -7689.31, -1115.75, 449.084, 1.67343, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+290, 14025, 469, -7657.58, -1104.8, 449.165, 2.13463, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+291, 14025, 469, -7625.2, -1033.05, 449.247, 3.0248, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+292, 14025, 469, -7625.08, -1051.81, 449.247, 5.3396, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+293, 14025, 469, -7703.72, -1015.03, 440.505, 0.99207, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+294, 14025, 469, -7684.85, -993.854, 440.275, 3.90365, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+295, 14025, 469, -7627.4, -988.568, 440.086, 2.12817, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+296, 14025, 469, -7683.67, -1096.39, 449.191, 5.95087, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+297, 14025, 469, -7597.26, -1019.24, 449.247, 2.15864, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+298, 14025, 469, -7634.91, -956.022, 440.252, 4.61105, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+299, 14025, 469, -7632.52, -1008.38, 440.331, 5.70321, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+300, 14025, 469, -7640.47, -961.673, 440.261, 4.00054, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+301, 14025, 469, -7609.71, -1054.55, 449.247, 0.64257, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+302, 14025, 469, -7625.7, -1000.88, 440.346, 2.48907, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+303, 14025, 469, -7612.87, -1067.8, 449.247, 4.56942, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+304, 14025, 469, -7642.84, -1075.91, 449.247, 5.08971, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+305, 14025, 469, -7710.85, -1073.44, 445.26, 3.38397, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+306, 14025, 469, -7713.35, -1064.88, 445.26, 5.5676, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+307, 14025, 469, -7659.99, -1016.2, 440.343, 2.18282, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+308, 14025, 469, -7605.22, -1080.31, 449.247, 0.443425, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+309, 14025, 469, -7682.46, -1041.22, 440.43, 3.46438, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+310, 14025, 469, -7685.91, -1027.9, 440.355, 4.53605, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+311, 14025, 469, -7633.73, -980.541, 440.083, 5.24226, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+312, 14025, 469, -7565.33, -1067, 449.247, 6.05566, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+313, 14025, 469, -7636.82, -1099.29, 449.247, 2.60054, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+314, 14025, 469, -7689.85, -1044.19, 440.577, 1.32645, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+315, 14025, 469, -7688.77, -1048.17, 440.547, 0.77421, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+316, 14025, 469, -7644.24, -1110.22, 449.164, 5.09576, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+317, 14025, 469, -7671.53, -1082.71, 449.149, 4.83821, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+318, 14025, 469, -7699.41, -1090.67, 449.112, 3.44125, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+319, 14025, 469, -7711.81, -1078.94, 445.176, 4.77237, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+320, 14025, 469, -7665.29, -983.93, 440.324, 0.696732, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+321, 14025, 469, -7669.01, -1002.58, 440.343, 1.90241, 30, 30, 2, 0, 0, 1), -- Corrupted Bronze Whelp
(@CGUID+322, 14401, 469, -7398.46, -967.079, 465.055, 3.89208, 14400, 14400, 0, 0, 0, 0), -- Master Elemental Shaper Krixix
(@CGUID+323, 14449, 469, -7615.51, -1025.59, 413.465, 5.23599, 10, 10, 0, 0, 0, 0), -- Blackwing Orb Trigger
(@CGUID+324, 14456, 469, -7619.66, -1025.14, 413.465, 3.68265, 3520, 3520, 0, 0, 0, 0), -- Blackwing Guardsman
(@CGUID+325, 14456, 469, -7615.01, -1021.55, 413.465, 0.610865, 3520, 3520, 0, 0, 0, 0), -- Blackwing Guardsman
(@CGUID+326, 14459, 469, -7644.53, -1081.53, 408.574, 5.2709, 10, 10, 0, 0, 0, 0), -- Nefarian's Troops
(@CGUID+327, 14601, 469, -7358.19, -994.32, 477.35, 3.69, 604800, 604800, 0, 0, 0, 2), -- Ebonroc
(@CGUID+328, 16604, 469, -7571.81, -1058.2, 408.24, 5.74213, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+329, 16604, 469, -7532.15, -1062.56, 407.282, 4.72984, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+330, 16604, 469, -7566.78, -1095.09, 413.465, 4.71239, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+331, 16604, 469, -7595.42, -1053.45, 408.24, 3.89208, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+332, 16604, 469, -7607.38, -1115.99, 407.282, 4.92183, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+333, 16604, 469, -7619.05, -1048.82, 408.24, 0.680678, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+334, 16604, 469, -7659.47, -1043.87, 407.282, 1.65806, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+335, 16604, 469, -7592.7, -1029.95, 408.24, 5.32325, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+336, 16604, 469, -7626.67, -1009.63, 413.465, 3.19395, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+337, 16604, 469, -7599.65, -1077.8, 408.24, 3.54302, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
(@CGUID+338, 16604, 469, -7583.24, -990.03, 407.282, 2.89725, 10, 10, 0, 0, 0, 0), -- Blackwing Spell Marker
-- Pack 1 (first room, entrance)
(@CGUID+339, 12459, 469, -7547.44, -1041.23, 449.242, 3.03514, 604800, 604800, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+340, 12459, 469, -7547.4, -1017.41, 449.242, 1.7463, 604800, 604800, 2, 0, 0, 1), -- Blackwing Warlock
-- Pack 2 (first room, wall on the right)
(@CGUID+341, 12459, 469, -7494.59, -1037.94, 449.242, 3.61084, 604800, 604800, 2, 0, 0, 1), -- Blackwing Warlock
(@CGUID+342, 12459, 469, -7519.54, -1055.8, 449.242, 4.25801, 604800, 604800, 0, 0, 0, 0), -- Blackwing Warlock
(@CGUID+343, 12457, 469, -7526, -1055.04, 449.242, 5.39919, 604800, 604800, 0, 0, 0, 2), -- Blackwing Spellbinder
-- Pack 3 (first room, alcove on the left)
(@CGUID+344, 12457, 469, -7539.89, -980.115, 449.24, 2.57532, 604800, 604800, 0, 0, 0, 2), -- Blackwing Warlock
(@CGUID+345, 12459, 469, -7518.77, -967.764, 449.24, 1.41136, 604800, 604800, 3, 0, 0, 1), -- Blackwing Warlock
(@CGUID+346, 12459, 469, -7532.98, -978.992, 449.24, 5.66115, 604800, 604800, 3, 0, 0, 1); -- Blackwing Spellbinder

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 149045, 469, -6904.81, -1206.78, 178.512, 2.9845, 0, 0, 0.996917, 0.0784656, 180, 180, 255, 1), -- Scaffold Cars
(@OGUID+2, 149046, 469, -6900.42, -1339.33, 239.652, -2.88851, 0, 0, -0.992004, 0.126204, 180, 180, 255, 1), -- Scaffold Cars
(@OGUID+3, 153723, 469, -7752.4, -1155.65, 396.696, -2.94959, 0, 0, -0.995395, 0.0958539, 180, 180, 255, 1), -- Bonfire
(@OGUID+4, 161536, 469, -6756.73, -1166.7, 187.042, 1.31772, 0, 0, 0.612216, 0.790691, 180, 180, 255, 1), -- Quarry Gate
(@OGUID+5, 176964, 469, -7639.43, -1083.94, 408.528, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 100, 0), -- Portcullis
(@OGUID+6, 176965, 469, -7552.37, -1022.98, 408.528, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 100, 1), -- Portcullis
(@OGUID+7, 176966, 469, -7488.17, -1150.54, 476.712, 0.610865, 0, 0, 0.300706, 0.953717, 180, 180, 100, 0), -- Portcullis
(@OGUID+8, 177387, 469, -7537.94, -1009.43, 449.242, 5.34938, 0, 0, 0.450123, -0.892967, 250, 250, 0, 1), -- Alchemy Lab
(@OGUID+9, 177807, 469, -7628.32, -1044.57, 408.49, -0.174532, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+10, 177807, 469, -7577.84, -1035.97, 408.49, -1.11701, 0, 0, -0.529919, 0.848048, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+11, 177807, 469, -7572.49, -1095.03, 413.381, -2.86233, 0, 0, -0.990267, 0.139178, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+12, 177807, 469, -7597.53, -1094.54, 408.49, 2.37364, 0, 0, 0.927182, 0.37461, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+13, 177807, 469, -7586.36, -1024.43, 408.49, -2.93214, 0, 0, -0.994521, 0.104535, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+14, 177807, 469, -7588.84, -1053.79, 408.157, -1.72787, 0, 0, -0.760404, 0.64945, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+15, 177807, 469, -7568.62, -1086.58, 413.381, 0.855211, 0, 0, 0.414693, 0.909961, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+16, 177807, 469, -7599, -1044.77, 408.157, -1.02974, 0, 0, -0.492422, 0.870357, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+17, 177807, 469, -7594.37, -1102.9, 408.49, -0.90757, 0, 0, -0.438371, 0.898794, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+18, 177807, 469, -7576.92, -1083.69, 413.381, -2.89724, 0, 0, -0.992546, 0.121873, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+19, 177807, 469, -7619.76, -1058.94, 408.49, 1.81514, 0, 0, 0.78801, 0.615662, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+20, 177807, 469, -7563.15, -1088.71, 413.381, -0.453785, 0, 0, -0.224951, 0.97437, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+21, 177807, 469, -7580.8, -1067.29, 408.49, -2.9845, 0, 0, -0.996917, 0.0784656, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+22, 177807, 469, -7549.48, -1069.96, 408.49, -0.523598, 0, 0, -0.258819, 0.965926, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+23, 177807, 469, -7604.36, -1060.25, 408.157, -2.77507, 0, 0, -0.983255, 0.182237, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+24, 177807, 469, -7592.38, -1035.68, 408.157, 1.62316, 0, 0, 0.725376, 0.688353, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+25, 177807, 469, -7592.35, -1010.84, 408.49, -2.54818, 0, 0, -0.956305, 0.292372, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+26, 177807, 469, -7568.27, -1097.68, 413.381, 2.79252, 0, 0, 0.984807, 0.173652, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+27, 177807, 469, -7584.68, -1075.84, 408.49, 3.01941, 0, 0, 0.998134, 0.0610534, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+28, 177807, 469, -7618.1, -1069.33, 408.49, -1.32645, 0, 0, -0.615661, 0.788011, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+29, 177807, 469, -7554.42, -1061.5, 408.49, -2.28638, 0, 0, -0.909961, 0.414694, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+30, 177807, 469, -7609.94, -1035.11, 408.49, -1.93732, 0, 0, -0.824127, 0.566404, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+31, 177807, 469, -7626.69, -1011.71, 413.381, 0.226892, 0, 0, 0.113203, 0.993572, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+32, 177807, 469, -7569.38, -1079.73, 413.381, -2.68781, 0, 0, -0.97437, 0.22495, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+33, 177807, 469, -7611.6, -1020.32, 413.381, 3.08918, 0, 0, 0.999657, 0.0262033, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+34, 177807, 469, -7601.14, -1077.11, 408.218, -1.27409, 0, 0, -0.594823, 0.803857, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+35, 177807, 469, -7578.64, -1089.95, 413.381, 2.21656, 0, 0, 0.894933, 0.446202, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+36, 177807, 469, -7579.49, -1051.48, 408.157, 0.523598, 0, 0, 0.258819, 0.965926, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+37, 177807, 469, -7566, -1045.93, 408.49, 3.05433, 0, 0, 0.999048, 0.0436174, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+38, 177807, 469, -7564.89, -1058.87, 408.49, 2.28638, 0, 0, 0.909961, 0.414694, 604800, 604800, 100, 1), -- Black Dragon Egg
(@OGUID+39, 177808, 469, -7615.05, -1026.24, 413.381, -0.95993, 0, 0, -0.461748, 0.887011, 25, 25, 0, 1), -- Orb of Domination
(@OGUID+40, 177824, 469, -7615.12, -1026.3, 413.381, -0.95993, 0, 0, -0.461748, 0.887011, 180, 180, 255, 1), -- Altar
(@OGUID+41, 179104, 469, -7464.98, -1041.42, 411.971, 2.18166, 0, 0, 0.88701, 0.461749, 180, 180, 255, 1), -- Chair
(@OGUID+42, 179105, 469, -7466.62, -1042.56, 411.971, 2.18166, 0, 0, 0.88701, 0.461749, 180, 180, 255, 1), -- Chair
(@OGUID+43, 179106, 469, -7468.11, -1047.16, 411.971, 0.610865, 0, 0, 0.300706, 0.953717, 180, 180, 255, 1), -- Bench
(@OGUID+44, 179107, 469, -7459.67, -1041.25, 411.971, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 255, 1), -- Bench
(@OGUID+45, 179108, 469, -7464.78, -1048.65, 411.971, 2.18166, 0, 0, 0.88701, 0.461749, 180, 180, 255, 1), -- Bench
(@OGUID+46, 179109, 469, -7459.43, -1044.9, 411.971, 2.18166, 0, 0, 0.88701, 0.461749, 180, 180, 255, 1), -- Chair
(@OGUID+47, 179110, 469, -7618.74, -1009.88, 413.382, -1.63188, 0, 0, -0.72837, 0.685184, 180, 180, 255, 1), -- Chair
(@OGUID+48, 179111, 469, -7623.49, -1009.64, 413.382, -1.38754, 0, 0, -0.63944, 0.768841, 180, 180, 255, 1), -- Chair
(@OGUID+49, 179112, 469, -7628.56, -1012.67, 413.382, -0.532323, 0, 0, -0.26303, 0.964788, 180, 180, 255, 1), -- Chair
(@OGUID+50, 179113, 469, -7629.54, -1017.33, 413.382, -0.218166, 0, 0, -0.108867, 0.994056, 180, 180, 255, 1), -- Chair
(@OGUID+51, 179114, 469, -7627.56, -1009.03, 413.382, -0.916297, 0, 0, -0.442288, 0.896873, 180, 180, 255, 1), -- Bench
(@OGUID+52, 179115, 469, -7455.24, -1051.71, 480.03, 2.18166, 0, 0, 0.88701, 0.461749, 180, 180, 255, 0), -- Portcullis
(@OGUID+53, 179116, 469, -7506.29, -1043.16, 480.03, 0.610865, 0, 0, 0.300706, 0.953717, 180, 180, 100, 1), -- Portcullis
(@OGUID+54, 179117, 469, -7464, -1103.55, 480.03, 0.610865, 0, 0, 0.300706, 0.953717, 180, 180, 100, 1), -- Portcullis
(@OGUID+55, 179118, 469, -7588.27, -1261.92, 482.03, 0.610865, 0, 0, 0.300706, 0.953717, 180, 180, 255, 1), -- Throne
(@OGUID+56, 179119, 469, -7579.63, -912.661, 428.384, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 255, 1), -- Fire
(@OGUID+57, 179120, 469, -7592.78, -921.296, 428.426, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 255, 1), -- Fire
(@OGUID+58, 179121, 469, -7683.71, -1052.78, 440.643, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 255, 1), -- Fire
(@OGUID+59, 179122, 469, -7691.45, -1040.23, 440.685, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 255, 1), -- Fire
(@OGUID+60, 179148, 469, -7510.98, -1094.69, 476.554, 5.34071, 0, 0, -0.45399, 0.891007, 180, 180, 100, 1), -- Lever
(@OGUID+61, 179364, 469, -7531.22, -956.411, 428.252, -0.95993, 0, 0, -0.461748, 0.887011, 180, 180, 100, 1), -- Portcullis
(@OGUID+62, 179365, 469, -7568.43, -1031.59, 449.109, -2.53072, 0, 0, -0.953716, 0.300709, 180, 180, 100, 1), -- Portcullis
(@OGUID+63, 179784, 469, -7647.78, -1066.97, 449.164, 0.558504, 0, 0, 0.275637, 0.961262, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+64, 179784, 469, -7677.63, -994.426, 440.259, 0.383971, 0, 0, 0.190808, 0.981627, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+65, 179784, 469, -7653.69, -999.919, 439.986, 0.506145, 0, 0, 0.25038, 0.968148, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+66, 179784, 469, -7642.73, -1015.65, 440.245, 0.471238, 0, 0, 0.233445, 0.97237, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+67, 179784, 469, -7651.32, -1103.53, 449.164, 0.523598, 0, 0, 0.258819, 0.965926, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+68, 179784, 469, -7616.21, -997.084, 440.282, 0.209439, 0, 0, 0.104528, 0.994522, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+69, 179784, 469, -7709.17, -1017, 440.446, 0.471238, 0, 0, 0.233445, 0.97237, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+70, 179784, 469, -7637.64, -965.023, 440.275, 0.017452, 0, 0, 0.00872589, 0.999962, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+71, 179784, 469, -7626.95, -981.359, 440.023, 0.157079, 0, 0, 0.0784588, 0.996917, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+72, 179784, 469, -7572.59, -1062.57, 449.164, 0.541051, 0, 0, 0.267238, 0.963631, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+73, 179784, 469, -7677.68, -1095.24, 449.135, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+74, 179784, 469, -7713.14, -1060.04, 445.176, -1.18682, 0, 0, -0.559191, 0.829039, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+75, 179784, 469, -7691.26, -1002.38, 440.244, 0.418879, 0, 0, 0.207912, 0.978148, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+76, 179784, 469, -7665.26, -1113.61, 449.164, 0.523598, 0, 0, 0.258819, 0.965926, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+77, 179784, 469, -7640.29, -991.302, 440.263, 0.453785, 0, 0, 0.224951, 0.97437, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+78, 179784, 469, -7669.46, -1034.21, 440.244, 0.541051, 0, 0, 0.267238, 0.963631, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+79, 179784, 469, -7637.93, -1081.13, 449.164, 0.453785, 0, 0, 0.224951, 0.97437, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+80, 179784, 469, -7716.1, -1077.45, 445.176, 0.872664, 0, 0, 0.422618, 0.906308, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+81, 179784, 469, -7691.97, -1105.4, 449.13, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+82, 179784, 469, -7619.15, -1047.15, 449.164, 0.506145, 0, 0, 0.25038, 0.968148, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+83, 179784, 469, -7605.95, -1045.06, 449.164, 0.645772, 0, 0, 0.317305, 0.948324, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+84, 179784, 469, -7686.85, -1047.04, 440.371, 0.558504, 0, 0, 0.275637, 0.961262, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+85, 179784, 469, -7629.78, -1061.48, 449.164, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+86, 179784, 469, -7620.09, -1075.73, 449.164, 0.471238, 0, 0, 0.233445, 0.97237, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+87, 179784, 469, -7680.11, -1123.29, 449.105, 0.523598, 0, 0, 0.258819, 0.965926, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+88, 179784, 469, -7609.89, -1061.46, 449.164, 0.418879, 0, 0, 0.207912, 0.978148, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+89, 179784, 469, -7699.2, -1030.98, 440.588, 0.558504, 0, 0, 0.275637, 0.961262, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+90, 179784, 469, -7630.29, -1005.49, 440.262, 0.401425, 0, 0, 0.199368, 0.979925, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+91, 179784, 469, -7595.27, -1030.42, 449.164, 0.314158, 0, 0, 0.156434, 0.987688, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+92, 179784, 469, -7627.98, -1095.31, 449.164, 0.541051, 0, 0, 0.267238, 0.963631, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+93, 179784, 469, -7664.82, -984.057, 440.247, 0.314158, 0, 0, 0.156434, 0.987688, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+94, 179784, 469, -7680.51, -1018.7, 439.983, 0.558504, 0, 0, 0.275637, 0.961262, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+95, 179784, 469, -7667.54, -1008.34, 440.259, 0.523598, 0, 0, 0.258819, 0.965926, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+96, 179784, 469, -7656.67, -1024.32, 440.257, 0.506145, 0, 0, 0.25038, 0.968148, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+97, 179784, 469, -7595.77, -1080, 449.164, 0.558504, 0, 0, 0.275637, 0.961262, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+98, 179784, 469, -7593.78, -1063.45, 449.164, 0.471238, 0, 0, 0.233445, 0.97237, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+99, 179784, 469, -7650.9, -975.792, 440.263, 0.226892, 0, 0, 0.113203, 0.993572, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+100, 179784, 469, -7663.99, -1084.89, 449.164, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 255, 1), -- Suppression Device
(@OGUID+101, 180631, 469, -7545.93, -978.483, 449.213, 2.96704, 0, 0, 0.996194, 0.0871655, 180, 180, 255, 1), -- Alchemy Lab
(@OGUID+102, 180632, 469, -7554.89, -1039.86, 449.213, 2.96704, 0, 0, 0.996194, 0.0871655, 180, 180, 255, 1), -- Alchemy Lab
(@OGUID+103, 180667, 469, -7526.57, -924.776, 458.826, 0.558504, 0, 0, 0.275637, 0.961262, 180, 180, 255, 1); -- Draconic for Dummies

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

DELETE FROM dbscripts_on_creature_movement WHERE id IN (1246101,1247101,1460101);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1246101, 1000, 20, 1, 2, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - random movement'),
(1246101, 21000, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - waypoint movement'),
(1247101, 1000, 15, 23017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackwing Spellbinder - cast Arcane channeling'),
(1460101, 1000, 20, 1, 5, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - random movement'),
(1460101, 300000, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - waypoint movement');

-- INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES

DELETE FROM `dbscripts_on_go_template_use` WHERE `id` = 179148;
INSERT INTO `dbscripts_on_go_template_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(179148, 1000, 11, 0, 0, 0, 179116, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Open Chromaggus side door'),
(179148, 2000, 25, 1, 0, 0, 14020, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Set Chromaggus run = true'),
(179148, 3000, 3, 0, 0, 0, 14020, 70, 0, 0, 0, 0, 0, -7484.91, -1072.98, 476.55, 2.18, 'Move Chromaggus in the center of the room');

-- INSERT INTO `dbscripts_on_relay` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_event` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_spell` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_start` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_end` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscript_string` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
-- INSERT INTO `dbscript_random_templates` (`id`, `type`, `target_id`, `chance`, `comments`) VALUES


