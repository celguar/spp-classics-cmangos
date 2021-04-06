/* DBScriptData
DBName: Ragefire Chasm
DBScriptName: -
DB%Complete: 75
DBComment:
EndDBScriptData */

SET @CGUID := 3890000; -- creatures
SET @OGUID := 3890000; -- gameobjects
SET @PGUID := 47000; -- pools

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+9, 1, -181.511, -32.0671, -44.4307, 0, 0, 0),
(@CGUID+9, 2, -221.219, -34.6647, -55.1581, 0, 0, 0),
(@CGUID+9, 3, -234.375, -36.3667, -55.6602, 0, 0, 0),
(@CGUID+9, 4, -275.309, -42.0123, -60.8065, 0, 0, 0),
(@CGUID+9, 5, -285.274, -54.131, -60.8063, 0, 0, 0),
(@CGUID+9, 6, -238.683, -36.774, -56.6927, 0, 0, 0),
(@CGUID+9, 7, -193.859, -35.3221, -46.097, 0, 0, 0),
(@CGUID+9, 8, -149.454, -33.8753, -35.323, 0, 0, 0),
(@CGUID+9, 9, -175.779, -29.6884, -43.6287, 0, 0, 0),
(@CGUID+15, 1, -215.446, -15.9344, -61.8032, 0, 0, 0),
(@CGUID+15, 2, -217.678, -11.7211, -61.8032, 0, 0, 0),
(@CGUID+15, 3, -277.55, -8.92806, -62.5484, 0, 0, 0),
(@CGUID+15, 4, -287.392, -23.6887, -59.9511, 0, 0, 0),
(@CGUID+15, 5, -264.358, -6.31967, -63.8809, 0, 0, 0),
(@CGUID+15, 6, -216.811, -11.1588, -61.8043, 0, 0, 0),
(@CGUID+41, 1, -287.744, -73.9324, -60.5234, 0, 0, 0),
(@CGUID+41, 2, -284.397, -91.3588, -61.9013, 0, 0, 0),
(@CGUID+41, 3, -260.868, -92.4423, -61.2886, 0, 0, 0),
(@CGUID+41, 4, -254.199, -62.2292, -62.0023, 0, 0, 0),
(@CGUID+41, 5, -232.557, -61.1359, -61.1316, 0, 0, 0),
(@CGUID+41, 6, -194.496, -74.0477, -62.0186, 0, 1000, 0),
(@CGUID+41, 7, -224.723, -64.9015, -61.2864, 0, 0, 0),
(@CGUID+41, 8, -240.409, -58.2346, -61.8446, 0, 0, 0),
(@CGUID+41, 9, -255.443, -64.3157, -62.0471, 0, 0, 0),
(@CGUID+41, 10, -260.802, -92.8847, -61.3218, 0, 0, 0),
(@CGUID+41, 11, -282.256, -93.1549, -61.9012, 0, 0, 0),
(@CGUID+51, 1, -176.762, 11.7284, -31.6117, 0.155953, 0, 0),
(@CGUID+51, 2, -190.166, 10.9667, -33.0618, 3.22686, 0, 0),
(@CGUID+51, 3, -210.648, 7.87269, -39.8187, 3.18916, 0, 0),
(@CGUID+51, 4, -230.782, 9.0604, -44.4237, 3.03836, 0, 0),
(@CGUID+51, 5, -257.486, 7.90906, -49.87, 3.17267, 0, 0),
(@CGUID+51, 6, -277.67, 8.30601, -49.0795, 3.20801, 0, 0),
(@CGUID+51, 7, -286.82, 7.69739, -46.2229, 3.20801, 0, 0),
(@CGUID+51, 8, -298.657, 5.29958, -48.0252, 3.39179, 0, 0),
(@CGUID+51, 9, -303.916, 0.147967, -49.7325, 4.02718, 0, 0),
(@CGUID+51, 10, -293.624, 7.59828, -47.0034, 0.427703, 0, 0),
(@CGUID+51, 11, -280.864, 9.03737, -47.8212, 0.121398, 0, 0),
(@CGUID+51, 12, -265.063, 9.36602, -49.8266, 0.046786, 0, 0),
(@CGUID+51, 13, -247.208, 8.66721, -48.9012, 6.25693, 0, 0),
(@CGUID+51, 14, -233.341, 8.45427, -44.4523, 6.25693, 0, 0),
(@CGUID+51, 15, -216.121, 6.63711, -41.6912, 6.14619, 0, 0),
(@CGUID+51, 16, -204.445, 7.92862, -37.4818, 0.217217, 0, 0),
(@CGUID+51, 17, -192.818, 10.4947, -33.4114, 0.217217, 0, 0),
(@CGUID+51, 18, -172.941, 14.3137, -30.7882, 0.217217, 0, 0),
(@CGUID+51, 19, -161.6, 14.8526, -27.2189, 0.046785, 0, 0),
(@CGUID+51, 20, -147.478, 11.5309, -22.3629, 6.04723, 0, 0),
(@CGUID+51, 21, -135.908, 8.74903, -20.8654, 6.04723, 0, 0),
(@CGUID+51, 22, -124.215, 10.9816, -19.9281, 0.192869, 0, 0),
(@CGUID+51, 23, -116.619, 15.0944, -18.8846, 0.49839, 0, 0),
(@CGUID+51, 24, -111.628, 24.9273, -18.6011, 1.08587, 0, 0),
(@CGUID+51, 25, -108.915, 36.6246, -18.0731, 1.33091, 0, 0),
(@CGUID+51, 26, -114.503, 21.4459, -18.8557, 4.38297, 0, 0),
(@CGUID+51, 27, -118.88, 14.3031, -19.0844, 4.1018, 0, 0),
(@CGUID+51, 28, -131.828, 8.81858, -20.8654, 3.55045, 0, 0),
(@CGUID+51, 29, -144.715, 9.21781, -21.8423, 3.11063, 0, 0),
(@CGUID+51, 30, -161.281, 12.4744, -27.4041, 2.97632, 0, 0),
(@CGUID+51, 31, -170.005, 13.6925, -30.0021, 3.08706, 0, 0),
(@CGUID+98, 1, -203.927, 99.1463, -25.4809, 1.10078, 0, 0),
(@CGUID+98, 2, -200.74, 104.201, -25.1381, 1.10078, 0, 0),
(@CGUID+98, 3, -198.066, 115.548, -23.217, 1.29791, 0, 0),
(@CGUID+98, 4, -195.291, 126.656, -22.168, 1.30027, 0, 0),
(@CGUID+98, 5, -192.549, 136.545, -24.1064, 1.30027, 0, 0),
(@CGUID+98, 6, -190.259, 144.95, -25.2199, 1.22487, 0, 0),
(@CGUID+98, 7, -193.47, 134.133, -23.458, 4.48035, 0, 0),
(@CGUID+98, 8, -196.29, 123.736, -22.179, 4.55103, 0, 0),
(@CGUID+98, 9, -199.336, 113.159, -23.7528, 4.44029, 0, 0),
(@CGUID+98, 10, -199.643, 106.426, -24.8865, 4.73482, 0, 0),
(@CGUID+98, 11, -205.093, 98.0147, -25.4833, 4.09157, 0, 0),
(@CGUID+102, 1, -214.025, 91.2148, -25.0186, 3.71773, 0, 0),
(@CGUID+102, 2, -219.007, 90.5475, -25.0186, 3.27476, 0, 0),
(@CGUID+102, 3, -229.367, 92.7477, -23.1312, 2.93233, 0, 0),
(@CGUID+102, 4, -235.891, 93.102, -21.7277, 3.16637, 0, 0),
(@CGUID+102, 5, -246.583, 91.6992, -23.5772, 3.23942, 0, 0),
(@CGUID+102, 6, -254.38, 92.4157, -25.0184, 3.02029, 0, 0),
(@CGUID+102, 7, -245.579, 91.7263, -23.2418, 6.26634, 0, 0),
(@CGUID+102, 8, -236.893, 92.4553, -21.7166, 0.024783, 0, 0),
(@CGUID+102, 9, -231.24, 92.8211, -22.4395, 6.27027, 0, 0),
(@CGUID+102, 10, -222.659, 90.784, -25.0184, 6.0158, 0, 0),
(@CGUID+102, 11, -217.698, 89.1509, -25.0184, 6.04093, 0, 0),
(@CGUID+102, 12, -209.44, 94.6833, -25.2915, 0.590271, 0, 0),
(@CGUID+107, 1, -263.519, 150.466, -18.9955, 0, 0, 0),
(@CGUID+107, 2, -275.879, 148.999, -22.2309, 0, 0, 0),
(@CGUID+107, 3, -283.074, 148.146, -25.4312, 0, 0, 0),
(@CGUID+107, 4, -275.879, 148.999, -22.2309, 0, 0, 0),
(@CGUID+107, 5, -263.519, 150.466, -18.9955, 0, 0, 0),
(@CGUID+107, 6, -247.886, 140.202, -18.5693, 0, 0, 0),
(@CGUID+107, 7, -225.044, 153.121, -19.0445, 0, 0, 0),
(@CGUID+107, 8, -212.734, 154.857, -21.4755, 0, 0, 0),
(@CGUID+107, 9, -199.5, 155.408, -25.2446, 0, 0, 0),
(@CGUID+107, 10, -212.734, 154.857, -21.4755, 0, 0, 0),
(@CGUID+107, 11, -225.044, 153.121, -19.0445, 0, 0, 0),
(@CGUID+107, 12, -240.889, 165.027, -18.5517, 0, 0, 0);

-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(@CGUID+9, 0, 0, 0, 0, 0, 0, NULL), -- Ragefire Trogg
(@CGUID+15, 0, 0, 0, 0, 0, 0, NULL), -- Ragefire Trogg
(@CGUID+41, 0, 0, 0, 0, 0, 0, NULL), -- Ragefire Shaman
(@CGUID+107, 0, 0, 0, 0, 0, 0, NULL); -- Searing Blade Enforcer

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(11318, 0, 0, 1, 16, 0, 0, NULL), -- Ragefire Trogg
(11319, 0, 0, 1, 16, 0, 0, NULL), -- Ragefire Shaman
(11320, 0, 0, 1, 16, 0, 0, NULL), -- Earthborer
(11321, 0, 0, 1, 16, 0, 0, NULL), -- Molten Elemental
(11322, 0, 0, 1, 16, 0, 0, NULL), -- Searing Blade Cultist
(11323, 0, 0, 1, 16, 0, 0, NULL), -- Searing Blade Enforcer
(11324, 0, 0, 1, 16, 0, 0, NULL), -- Searing Blade Warlock
(11517, 0, 0, 1, 16, 0, 0, NULL), -- Oggleflint
(11518, 0, 0, 1, 16, 0, 0, NULL), -- Jergosh the Invoker
(11519, 0, 0, 1, 16, 0, 0, NULL), -- Bazzalan
(11520, 0, 0, 1, 16, 0, 0, NULL), -- Taragaman the Hungerer
(11834, 0, 7, 1, 16, 0, 0, NULL); -- Maur Grimtotem

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+1, @CGUID+34, 3), -- Ragefire Trogg -> Ragefire Shaman
(@CGUID+3, @CGUID+32, 3), -- Ragefire Trogg -> Ragefire Shaman
(@CGUID+11, @CGUID+10, 3), -- Ragefire Trogg -> Ragefire Trogg
(@CGUID+14, @CGUID+13, 3), -- Ragefire Trogg -> Ragefire Trogg
(@CGUID+18, @CGUID+25, 3), -- Ragefire Trogg -> Ragefire Trogg
(@CGUID+22, @CGUID+43, 3), -- Ragefire Trogg -> Ragefire Shaman
(@CGUID+23, @CGUID+19, 3), -- Ragefire Trogg -> Ragefire Trogg
(@CGUID+24, @CGUID+43, 3), -- Ragefire Trogg -> Ragefire Shaman
(@CGUID+26, @CGUID+17, 3), -- Ragefire Trogg -> Ragefire Trogg
(@CGUID+27, @CGUID+40, 3), -- Ragefire Trogg -> Ragefire Shaman
(@CGUID+29, @CGUID+28, 3), -- Ragefire Trogg -> Ragefire Trogg
(@CGUID+30, @CGUID+32, 3), -- Ragefire Shaman -> Ragefire Shaman
(@CGUID+33, @CGUID+4, 3), -- Ragefire Shaman -> Ragefire Trogg
(@CGUID+36, @CGUID+7, 3), -- Ragefire Shaman -> Ragefire Trogg
(@CGUID+37, @CGUID+16, 3), -- Ragefire Shaman -> Ragefire Trogg
(@CGUID+38, @CGUID+19, 3), -- Ragefire Shaman -> Ragefire Trogg
(@CGUID+39, @CGUID+13, 3), -- Ragefire Shaman -> Ragefire Trogg
(@CGUID+42, @CGUID+17, 3), -- Ragefire Shaman -> Ragefire Trogg
(@CGUID+70, @CGUID+119, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+72, @CGUID+119, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+74, @CGUID+123, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+75, @CGUID+122, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+76, @CGUID+123, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+78, @CGUID+77, 3), -- Searing Blade Cultist -> Searing Blade Cultist
(@CGUID+79, @CGUID+122, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+81, @CGUID+82, 3), -- Searing Blade Cultist -> Searing Blade Cultist
(@CGUID+83, @CGUID+84, 3), -- Searing Blade Cultist -> Searing Blade Cultist
(@CGUID+86, @CGUID+126, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+87, @CGUID+126, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+89, @CGUID+128, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+90, @CGUID+88, 3), -- Searing Blade Cultist -> Searing Blade Cultist
(@CGUID+92, @CGUID+127, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+93, @CGUID+128, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+94, @CGUID+127, 3), -- Searing Blade Cultist -> Searing Blade Warlock
(@CGUID+95, @CGUID+96, 3), -- Searing Blade Cultist -> Searing Blade Cultist
(@CGUID+97, @CGUID+68, 3), -- Searing Blade Enforcer -> Searing Blade Cultist
(@CGUID+99, @CGUID+69, 3), -- Searing Blade Enforcer -> Searing Blade Cultist
(@CGUID+100, @CGUID+68, 3), -- Searing Blade Enforcer -> Searing Blade Cultist
(@CGUID+101, @CGUID+69, 3), -- Searing Blade Enforcer -> Searing Blade Cultist
(@CGUID+104, @CGUID+103, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+105, @CGUID+106, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+109, @CGUID+108, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+110, @CGUID+111, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+112, @CGUID+118, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+113, @CGUID+114, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+115, @CGUID+118, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+117, @CGUID+116, 3), -- Searing Blade Enforcer -> Searing Blade Enforcer
(@CGUID+120, @CGUID+71, 3), -- Searing Blade Warlock -> Searing Blade Cultist
(@CGUID+121, @CGUID+73, 3), -- Searing Blade Warlock -> Searing Blade Cultist
(@CGUID+124, @CGUID+77, 3), -- Searing Blade Warlock -> Searing Blade Cultist
(@CGUID+125, @CGUID+80, 3); -- Searing Blade Warlock -> Searing Blade Cultist

-- INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES

INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 11318, 389, -157.268, -21.7249, -57.2708, 5.39606, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+2, 11318, 389, -148.183, -52.4618, -57.7852, 2.93215, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+3, 11318, 389, -142.297, -6.18364, -53.1894, 0.975298, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+4, 11318, 389, -152.453, 3.90943, -40.59, 2.53152, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+5, 11318, 389, -162.128, -43.5051, -59.124, 2.21657, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+6, 11318, 389, -160.754, -65.051, -59.4342, 0.041957, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+7, 11318, 389, -154.037, 27.9676, -38.5669, 2.3911, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+8, 11318, 389, -200.409, -69.7984, -63.2233, 1.13289, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+9, 11318, 389, -181.511, -32.0671, -44.4307, 3.20698, 7200, 7200, 0, 1, 0, 2), -- Ragefire Trogg
(@CGUID+10, 11318, 389, -204.723, -1.24259, -61.6764, 3.33479, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+11, 11318, 389, -183.393, 2.79912, -56.8092, 5.4162, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+12, 11318, 389, -229.281, -59.7834, -61.3117, 4.95529, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+13, 11318, 389, -237.985, -40.3476, -56.2706, 1.3439, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+14, 11318, 389, -238.656, -31.5648, -56.6214, 5.07891, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+15, 11318, 389, -215.446, -15.9344, -61.8032, 1.9232, 7200, 7200, 0, 1, 0, 2), -- Ragefire Trogg
(@CGUID+16, 11318, 389, -217.669, -5.11624, -61.7999, 4.29193, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+17, 11318, 389, -277.036, -47.2743, -60.9321, 0.279253, 7200, 7200, 5, 0, 0, 1), -- Ragefire Trogg
(@CGUID+18, 11318, 389, -261.781, -5.76433, -63.9288, 0.762733, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+19, 11318, 389, -262.216, -29.8943, -60.6085, 4.76475, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+20, 11318, 389, -240.714, -8.03152, -61.5235, 0.060824, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+21, 11318, 389, -255.431, -66.4518, -62.1072, 1.43574, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+22, 11318, 389, -276.93, -63.3295, -60.3566, 1.58825, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+23, 11318, 389, -270.127, -31.8806, -60.6085, 5.11381, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+24, 11318, 389, -269.28, -60.0032, -60.3566, 2.26893, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+25, 11318, 389, -285.522, -20.8822, -60.4145, 3.38594, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+26, 11318, 389, -290.812, -47.0829, -60.89, 0.231919, 7200, 7200, 5, 0, 0, 1), -- Ragefire Trogg
(@CGUID+27, 11318, 389, -264.196, -92.5713, -61.7963, 2.57623, 7200, 7200, 2, 0, 0, 1), -- Ragefire Trogg
(@CGUID+28, 11318, 389, -300.512, -28.4078, -60.4574, 2.53073, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+29, 11318, 389, -306.314, -29.1276, -60.1744, 1.22173, 7200, 7200, 0, 0, 0, 0), -- Ragefire Trogg
(@CGUID+30, 11319, 389, -136.804, -3.84714, -53.0579, 5.37443, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+31, 11319, 389, -145.738, -57.7801, -58.4145, 2.6529, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+32, 11319, 389, -141.863, -18.6146, -54.7477, 0.715585, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+33, 11319, 389, -147.681, 0.443873, -39.1503, 5.74279, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+34, 11319, 389, -162.553, -26.8425, -57.8494, 4.35569, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+35, 11319, 389, -174.416, -65.4036, -57.8333, 1.31717, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+36, 11319, 389, -148.041, 27.1943, -38.8538, 3.74643, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+37, 11319, 389, -211.07, -7.25025, -61.8044, 4.81248, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+38, 11319, 389, -266.73, -28.0281, -60.6085, 5.02655, 7200, 7200, 0, 0, 0, 0), -- Ragefire Shaman
(@CGUID+39, 11319, 389, -253.886, -38.8841, -60.4593, 2.17095, 7200, 7200, 5, 0, 0, 1), -- Ragefire Shaman
(@CGUID+40, 11319, 389, -270.089, -96.8868, -61.9013, 4.87834, 7200, 7200, 2, 0, 0, 1), -- Ragefire Shaman
(@CGUID+41, 11319, 389, -287.744, -73.9324, -60.5234, 4.84725, 7200, 7200, 0, 1, 0, 2), -- Ragefire Shaman
(@CGUID+42, 11319, 389, -280.902, -49.179, -60.9322, 3.31393, 7200, 7200, 5, 0, 0, 1), -- Ragefire Shaman
(@CGUID+43, 11319, 389, -271.827, -64.4, -60.3566, 2.04204, 7200, 7200, 0, 0, 0, 0), -- Ragefire Shaman
(@CGUID+44, 11320, 389, -45.0298, -27.7645, -21.2917, 1.70311, 7200, 7200, 5, 0, 0, 1), -- Earthborer
(@CGUID+45, 11320, 389, -15.9865, -50.1693, -21.7804, 3.57792, 7200, 7200, 5, 0, 0, 1), -- Earthborer
(@CGUID+46, 11320, 389, -70.6122, -32.8292, -18.4872, 2.57425, 7200, 7200, 2, 0, 0, 1), -- Earthborer
(@CGUID+47, 11320, 389, -23.8034, -62.1556, -21.3704, 4.06767, 7200, 7200, 5, 0, 0, 1), -- Earthborer
(@CGUID+48, 11320, 389, -106.32, -37.6574, -30.0448, 5.36449, 7200, 7200, 5, 0, 0, 1), -- Earthborer
(@CGUID+49, 11320, 389, -129.135, -35.1578, -33.2627, 3.7001, 7200, 7200, 5, 0, 0, 1), -- Earthborer
(@CGUID+50, 11320, 389, -95.8062, 45.3441, -17.4092, 1.72232, 7200, 7200, 2, 0, 0, 1), -- Earthborer
(@CGUID+51, 11320, 389, -168.542, 13.3261, -29.6158, 0.190191, 7200, 7200, 0, 0, 0, 2), -- Earthborer
(@CGUID+52, 11320, 389, -272.518, 8.65636, -49.9972, 5.8991, 7200, 7200, 2, 0, 0, 1), -- Earthborer
(@CGUID+53, 11320, 389, -296.563, 7.55345, -47.5269, 1.92697, 7200, 7200, 3, 0, 0, 1), -- Earthborer
(@CGUID+54, 11320, 389, -125.112, 80.0961, -21.3202, 5.45818, 7200, 7200, 5, 0, 0, 1), -- Earthborer
(@CGUID+55, 11321, 389, -36.4604, -42.0863, -21.773, 0.809754, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+56, 11321, 389, -94.604, 54.1892, -17.9829, 5.00078, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+57, 11321, 389, -111.344, 52.0495, -18.6906, 5.17827, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+58, 11321, 389, -252.09, 7.15975, -50.0273, 4.56215, 7200, 7200, 3, 0, 0, 1), -- Molten Elemental
(@CGUID+59, 11321, 389, -208.558, 55.8574, -13.9447, 5.91302, 7200, 7200, 2, 0, 0, 1), -- Molten Elemental
(@CGUID+60, 11321, 389, -124.161, 63.9612, -21.2143, 3.13162, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+61, 11321, 389, -176.654, 75.2942, -21.8957, 0.992464, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+62, 11321, 389, -198.621, 60.1696, -13.8611, 0.541052, 7200, 7200, 2, 0, 0, 1), -- Molten Elemental
(@CGUID+63, 11321, 389, -144.941, 79.1501, -20.9783, 3.0239, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+64, 11321, 389, -111.204, 76.3607, -20.1425, 3.19314, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+65, 11321, 389, -127.906, 75.5442, -21.8833, 6.0452, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+66, 11321, 389, -85.7455, 97.3632, -7.39686, 2.99045, 7200, 7200, 3, 0, 0, 1), -- Molten Elemental
(@CGUID+67, 11321, 389, -74.6995, 89.9573, -7.32838, 2.48512, 7200, 7200, 5, 0, 0, 1), -- Molten Elemental
(@CGUID+68, 11322, 389, -210.008, 85.9401, -24.852, 3.58789, 7200, 7200, 1, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+69, 11322, 389, -193.884, 94.2191, -24.6305, 5.48868, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+70, 11322, 389, -269.254, 91.9884, -24.9291, 1.39626, 7200, 7200, 1, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+71, 11322, 389, -187.521, 153.224, -25.1366, 2.9147, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+72, 11322, 389, -265.208, 100.599, -24.9443, 2.75762, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+73, 11322, 389, -296.907, 146.956, -25.0033, 2.2928, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+74, 11322, 389, -300.145, 204.932, -25.1219, 2.83371, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+75, 11322, 389, -279.577, 210.296, -25.0184, 5.48262, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+76, 11322, 389, -294.636, 196.863, -25.415, 1.26676, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+77, 11322, 389, -224.395, 213.183, -24.9818, 1.76312, 7200, 7200, 1, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+78, 11322, 389, -229.394, 206.597, -24.7948, 5.65487, 7200, 7200, 1, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+79, 11322, 389, -275.823, 219.821, -25.0184, 0.090169, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+80, 11322, 389, -309.146, 224.228, -23.7467, 4.62512, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+81, 11322, 389, -301.24, 251.092, -13.0535, 1.22761, 7200, 7200, 5, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+82, 11322, 389, -293.292, 256.603, -14.8024, 3.12128, 7200, 7200, 5, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+83, 11322, 389, -340.183, 207.471, -21.4877, 0.777513, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+84, 11322, 389, -346.643, 213.994, -21.3899, 4.62512, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+85, 11322, 389, -342.315, 256.423, -7.97652, 3.64774, 7200, 7200, 5, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+86, 11322, 389, -372.27, 265.154, -4.84659, 3.80391, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+87, 11322, 389, -367.589, 254.246, -5.0474, 1.40766, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+88, 11322, 389, -369.356, 211.166, -21.801, 2.00713, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+89, 11322, 389, -360.933, 179.061, -22.1946, 0.722725, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+90, 11322, 389, -374.127, 201.24, -21.801, 4.50295, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+91, 11322, 389, -400.436, 216.18, -1.01054, 0.794809, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+92, 11322, 389, -387.038, 259.729, -4.84658, 3.08605, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+93, 11322, 389, -367.06, 173.695, -22.0076, 3.50908, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+94, 11322, 389, -392.023, 244.262, -4.84661, 2.50107, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Cultist
(@CGUID+95, 11322, 389, -385.157, 156.603, 7.7385, 0.844909, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+96, 11322, 389, -396.309, 150.828, 7.82184, 4.67748, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Cultist
(@CGUID+97, 11323, 389, -223.454, 87.2837, -24.9351, 5.93412, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+98, 11323, 389, -203.185, 99.4132, -25.4712, 4.40747, 7200, 7200, 0, 0, 0, 2), -- Searing Blade Enforcer
(@CGUID+99, 11323, 389, -195.347, 108.507, -24.2915, 4.36332, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+100, 11323, 389, -219.3, 94.5484, -24.9351, 5.42797, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+101, 11323, 389, -203.218, 107.389, -25, 5.32325, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+102, 11323, 389, -208.058, 95.3564, -25.3951, 3.84374, 7200, 7200, 0, 0, 0, 2), -- Searing Blade Enforcer
(@CGUID+103, 11323, 389, -198.964, 151.226, -25.1366, 0.907571, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+104, 11323, 389, -199.194, 159.015, -25.1366, 5.51524, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+105, 11323, 389, -257.459, 106.184, -24.9368, 3.85718, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+106, 11323, 389, -267.366, 110.757, -24.9361, 4.76475, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+107, 11323, 389, -263.519, 150.466, -18.9955, 0.106006, 7200, 7200, 0, 1, 0, 2), -- Searing Blade Enforcer
(@CGUID+108, 11323, 389, -283.586, 143.856, -25.2988, 2.44346, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+109, 11323, 389, -283.762, 152.501, -25.3249, 3.52556, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+110, 11323, 389, -237.417, 192.851, -24.3585, 0.645772, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+111, 11323, 389, -230.133, 191.085, -24.9191, 1.79769, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+112, 11323, 389, -329.782, 210.636, -19.9161, 0.820305, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+113, 11323, 389, -321.875, 247.56, -11.5076, 0.226893, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+114, 11323, 389, -318.951, 256.642, -11.5058, 5.21853, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+115, 11323, 389, -336.361, 224.257, -20.2678, 5.98648, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+116, 11323, 389, -404.929, 181.384, 6.57811, 1.91986, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+117, 11323, 389, -412.364, 177.342, 6.70869, 1.36136, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+118, 11323, 389, -334.419, 216.177, -20.6274, 0.357766, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Enforcer
(@CGUID+119, 11324, 389, -261.428, 94.8909, -24.9335, 3.9619, 7200, 7200, 4, 0, 0, 1), -- Searing Blade Warlock
(@CGUID+120, 11324, 389, -183.648, 160.15, -25.2199, 2.14356, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Warlock
(@CGUID+121, 11324, 389, -297.067, 154.025, -25.1295, 3.14651, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Warlock
(@CGUID+122, 11324, 389, -284.913, 216.073, -25.0184, 2.53073, 7200, 7200, 5, 0, 0, 1), -- Searing Blade Warlock
(@CGUID+123, 11324, 389, -299.173, 199.104, -24.7852, 3.08923, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Warlock
(@CGUID+124, 11324, 389, -231.167, 212.064, -24.9235, 5.09528, 7200, 7200, 1, 0, 0, 1), -- Searing Blade Warlock
(@CGUID+125, 11324, 389, -316.556, 222.633, -22.1718, 4.07439, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Warlock
(@CGUID+126, 11324, 389, -375.796, 256.279, -4.84658, 5.98416, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Warlock
(@CGUID+127, 11324, 389, -385.122, 239.621, -4.84661, 4.5914, 7200, 7200, 0, 0, 0, 0), -- Searing Blade Warlock
(@CGUID+128, 11324, 389, -367.19, 180.435, -22.1573, 1.02974, 7200, 7200, 2, 0, 0, 1), -- Searing Blade Warlock
(@CGUID+129, 11517, 389, -147.548, 38.7127, -38.8039, 4.39823, 36000, 36000, 0, 0, 0, 0), -- Oggleflint
(@CGUID+130, 11518, 389, -376.811, 209.224, -21.801, 5.91667, 36000, 36000, 0, 0, 0, 0), -- Jergosh the Invoker
(@CGUID+131, 11519, 389, -384.867, 146.045, 7.82184, 2.51327, 36000, 36000, 0, 0, 0, 0), -- Bazzalan
(@CGUID+132, 11520, 389, -244.743, 150.085, -18.7494, 4.28461, 36000, 36000, 0, 0, 0, 0), -- Taragaman the Hungerer
(@CGUID+133, 11834, 389, -148.075, 23.5742, -38.6318, 4.11898, 7200, 7200, 0, 0, 0, 0); -- Maur Grimtotem

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 175287, 389, 66.6137, 34.3891, -8.68421, 2.7838, 0, 0, 0.984041, 0.177944, 3600, 3600, 100, 1), -- Doodad_SmallBrazierPurple03
(@OGUID+2, 175288, 389, 17.9346, 52.2161, -11.1568, 2.7838, 0, 0, 0.984041, 0.177944, 3600, 3600, 100, 1), -- Doodad_SmallBrazierPurple05
(@OGUID+3, 175289, 389, 42.1618, 8.73129, 10.9549, 3.14159, 0, 0, 1, 0, 3600, 3600, 100, 1), -- Doodad_MediumBrazierPurple05
(@OGUID+4, 175290, 389, 25.4365, 6.90505, 11.0928, 2.87056, 0.023353, 0.002362, 0.990576, 0.134938, 3600, 3600, 100, 1), -- Doodad_MediumBrazierPurple06
(@OGUID+5, 175291, 389, 59.6263, 56.4047, -8.96765, 3.14159, 0, 0, 1, 0, 3600, 3600, 100, 1), -- Doodad_MediumBrazierPurple07
(@OGUID+6, 175292, 389, 39.1689, 52.8595, -3.46941, 3.14159, 0, 0, 1, 0, 3600, 3600, 100, 1), -- Doodad_MediumBrazierPurple08
(@OGUID+7, 175293, 389, 1.82074, 32.2247, -11.459, 3.14159, 0, 0, 1, 0, 3600, 3600, 100, 1), -- Doodad_MediumBrazierPurple09
(@OGUID+8, 175294, 389, 51.6565, 38.0719, -8.68831, 2.36492, 0, 0, 0.92554, 0.378649, 3600, 3600, 100, 1), -- Doodad_OrcSign_DarkfireEnclave
(@OGUID+9, 175298, 389, -4.42081, 120.719, 12.2467, 2.02458, 0, 0, 0.848048, 0.529919, 3600, 3600, 100, 1), -- Doodad_SmallBrazierPurple04
(@OGUID+10, 175305, 389, 2.43144, 65.4367, -9.98579, 3.14159, 0, 0, 1, 0, 3600, 3600, 100, 1), -- Doodad_MediumBrazierPurple10
(@OGUID+11, 175307, 389, 62.3991, 61.4202, -9.25621, 3.14159, 0, 0, 1, 0, 3600, 3600, 100, 1), -- Doodad_OrcSign_ShadowdeepReagents
(@OGUID+12, 175308, 389, 5.65531, 68.3387, -9.77679, -0.610865, 0, 0, -0.300706, 0.953717, 3600, 3600, 100, 1), -- Doodad_OrcSign_DarkEarth
(@OGUID+13, 175310, 389, 13.7698, 100.689, -1.96314, -2.54818, 0, 0, 0.956305, -0.292372, 3600, 3600, 100, 1), -- Doodad_MediumBrazierPurple13

-- TBC+ only (Paladin quest - The Path of the Adept 9692)
(@OGUID+100, 182024, 389, -370.133, 162.519, -21.1299, -1.29154, 0, 0, 0, 0, 3600, 3600, 100, 1); -- Blood Filled Orb

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

-- INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES

DELETE FROM `dbscripts_on_go_template_use` WHERE `id` = 182024;
INSERT INTO `dbscripts_on_go_template_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- TBC+ only (Paladin quest - The Path of the Adept 9692)
(182024, 0, 10, 17830, 30000, 0, 0, 0, 0, 0, 0, 0, 0, -368.557, 172.036, -21.784, 4.61, ''),
(182024, 1000, 0, 0, 0, 0, 17830, 10, 0, 2000020007, 0, 0, 0, 0, 0, 0, 0, '');

-- INSERT INTO `dbscripts_on_relay` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_event` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_spell` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_start` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_end` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES

DELETE FROM `dbscript_string` WHERE `entry` = 2000020007;
INSERT INTO `dbscript_string` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `broadcast_text_id`, `comment`) VALUES
-- TBC+ only (Paladin quest - The Path of the Adept 9692)
(2000020007, 'Insolent fool! You thought to steal Zelemar''s blood? You shall pay with your own!', 0, 1, 0, 0, 14406, '');

-- INSERT INTO `dbscript_random_templates` (`id`, `type`, `target_id`, `chance`, `comments`) VALUES


