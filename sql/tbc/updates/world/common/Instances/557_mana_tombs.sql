/* DBScriptData
DBName: Auchindoun - Mana-Tombs
DBScriptName: -
DB%Complete: 85
DBComment:
EndDBScriptData */

SET @CGUID := 5570000; -- creatures
SET @OGUID := 5570000; -- gameobjects
SET @PGUID := 49400; -- pools

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+47, 1, -68.4671, -16.5295, -0.946325, 1.00453, 0, 0),
(@CGUID+47, 2, -50.0854, 1.97216, -0.948157, 0.717857, 0, 0),
(@CGUID+47, 3, -38.5007, 3.36018, -0.954319, 6.24392, 0, 0),
(@CGUID+47, 4, -48.6085, -1.04486, -0.950053, 3.52408, 0, 0),
(@CGUID+47, 5, -67.1109, -20.188, -0.953261, 3.84138, 0, 0),
(@CGUID+47, 6, -66.9051, -30.807, -0.953261, 4.68569, 0, 0),
(@CGUID+47, 7, -69.5803, -18.5848, -0.953261, 1.29512, 0, 0),
(@CGUID+70, 1, -308.329, 4.39094, 16.6836, 6.11042, 0, 0),
(@CGUID+70, 2, -291.197, 3.89066, 16.7884, 0.000807, 0, 0),
(@CGUID+70, 3, -262.375, 5.20316, 16.7856, 0.172808, 0, 0),
(@CGUID+70, 4, -282.805, 4.64257, 16.7864, 3.19581, 0, 0),
(@CGUID+70, 5, -298.492, 4.56114, 16.7887, 3.18403, 0, 0),
(@CGUID+70, 6, -320.538, 8.03506, 16.7917, 3.00731, 0, 0),
(@CGUID+75, 1, -51.1677, -88.944, -2.04667, 2.13158, 0, 0),
(@CGUID+75, 2, -56.08, -84.4303, -2.10972, 2.55883, 0, 0),
(@CGUID+75, 3, -61.3633, -84.3612, -1.81563, 3.21857, 0, 0),
(@CGUID+75, 4, -70.5759, -85.0718, -2.11637, 3.21857, 0, 0),
(@CGUID+75, 5, -77.9965, -82.3342, -1.88259, 2.78817, 0, 0),
(@CGUID+75, 6, -81.9147, -83.0498, -1.94223, 3.32224, 0, 0),
(@CGUID+75, 7, -87.0246, -92.3296, -1.95846, 4.16262, 0, 0),
(@CGUID+75, 8, -90.2182, -103.755, -0.800048, 4.41316, 0, 0),
(@CGUID+75, 9, -77.9137, -107.509, -0.441177, 5.85908, 0, 0),
(@CGUID+75, 10, -67.7309, -109.059, -0.392731, 0.040848, 0, 0),
(@CGUID+75, 11, -58.6939, -107.919, -0.67805, 0.218348, 0, 0),
(@CGUID+75, 12, -51.6266, -105.093, -0.101909, 0.589056, 0, 0),
(@CGUID+75, 13, -48.2706, -98.235, -0.692868, 1.03124, 0, 0),
(@CGUID+91, 1, -57.5143, -221.873, 0.05455, 2.71827, 0, 0),
(@CGUID+91, 2, -76.2576, -223.04, -0.142771, 3.16752, 0, 0),
(@CGUID+91, 3, -60.0163, -219.235, 0.126113, 0.137454, 0, 0),
(@CGUID+91, 4, -37.6652, -223.11, -0.352581, 6.25335, 0, 0),
(@CGUID+105, 1, -373.131, -218.537, -0.959388, 4.52861, 0, 0),
(@CGUID+105, 2, -373.105, -238.094, -0.957918, 4.74538, 0, 0),
(@CGUID+105, 3, -373.159, -219.322, -0.957918, 1.57708, 0, 0),
(@CGUID+105, 4, -373.284, -199.4, -0.957918, 1.57708, 0, 0),
(@CGUID+105, 5, -373.354, -188.369, -0.960164, 1.57708, 0, 0),
(@CGUID+105, 6, -373.279, -198.468, -0.960164, 4.76266, 0, 0),
(@CGUID+117, 1, -107.135, -214.479, -1.00393, 6.02559, 0, 0),
(@CGUID+117, 2, -124.756, -213.821, -0.111925, 2.94683, 0, 0),
(@CGUID+117, 3, -132.259, -210.266, -0.475064, 2.73556, 0, 0),
(@CGUID+117, 4, -143.641, -225.131, -0.669352, 4.04324, 0, 0),
(@CGUID+117, 5, -134.662, -214.177, -0.48754, 0.850602, 0, 0),
(@CGUID+117, 6, -128.114, -210.812, -0.29519, 0.446908, 0, 0),
(@CGUID+129, 1, -207.482, -208.05, 1.21497, 4.82001, 0, 0),
(@CGUID+129, 2, -208.388, -222.004, -0.755589, 4.79409, 0, 0),
(@CGUID+129, 3, -213.647, -246.964, -0.955485, 4.42103, 0, 0),
(@CGUID+129, 4, -209.359, -237.864, -0.955485, 1.2166, 0, 0),
(@CGUID+129, 5, -208.284, -226.69, -0.955485, 1.57003, 0, 0),
(@CGUID+129, 6, -211.068, -212.156, 0.600003, 1.8622, 0, 0),
(@CGUID+129, 7, -220.308, -203.289, -0.034487, 2.38606, 0, 0),
(@CGUID+129, 8, -229.036, -196.609, -1.08687, 2.45989, 0, 0),
(@CGUID+129, 9, -237.224, -191.676, -0.953153, 2.79447, 0, 0),
(@CGUID+129, 10, -221.731, -200.68, -0.205754, 5.69416, 0, 0),
(@CGUID+129, 11, -208.58, -208.257, 1.09395, 5.58735, 0, 0),
(@CGUID+133, 1, -363.095, -166.467, -0.958735, 1.09721, 0, 0),
(@CGUID+133, 2, -363.858, -160.312, -0.958735, 1.69411, 0, 0),
(@CGUID+133, 3, -367.381, -155.692, -0.958735, 2.22269, 0, 0),
(@CGUID+133, 4, -372.034, -153.512, -0.958735, 2.70335, 0, 0),
(@CGUID+133, 5, -377.024, -154.472, -0.958735, 3.33167, 0, 0),
(@CGUID+133, 6, -380.718, -157.007, -0.956973, 3.74322, 0, 0),
(@CGUID+133, 7, -383.756, -161.811, -0.949288, 4.14848, 0, 0),
(@CGUID+133, 8, -383.116, -167.868, -0.958527, 4.81764, 0, 0),
(@CGUID+133, 9, -379.09, -172.278, -0.958527, 5.45224, 0, 0),
(@CGUID+133, 10, -374.542, -174.996, -0.958527, 5.74441, 0, 0),
(@CGUID+133, 11, -369.525, -175.13, -0.958527, 6.25649, 0, 0),
(@CGUID+133, 12, -365.398, -172.63, -0.958527, 0.358937, 0, 0),
(@CGUID+166, 1, -213.174, -248.978, -0.977498, 1.18755, 0, 0),
(@CGUID+166, 2, -203.93, -237.499, -0.957305, 0.862392, 0, 0),
(@CGUID+166, 3, -204.707, -221.252, -0.649856, 1.70434, 0, 0),
(@CGUID+166, 4, -207.851, -208.513, 1.16599, 1.7601, 0, 0),
(@CGUID+166, 5, -205.224, -221.322, -0.658456, 4.61659, 0, 0),
(@CGUID+166, 6, -203.462, -239.905, -0.955492, 4.54826, 0, 0),
(@CGUID+167, 1, -106.529, -218.153, -0.671122, 5.28417, 0, 0),
(@CGUID+167, 2, -94.9212, -226.041, -0.365311, 5.73813, 0, 0),
(@CGUID+167, 3, -82.499, -234.901, -0.048239, 5.68159, 0, 0),
(@CGUID+167, 4, -88.9317, -230.329, 0.31296, 2.60754, 0, 0),
(@CGUID+167, 5, -99.2986, -218.81, -1.17585, 2.35857, 0, 0),
(@CGUID+167, 6, -118.682, -203.117, -1.17595, 2.36092, 0, 0),
(@CGUID+168, 1, -282.774, -182.071, -1.04198, 3.00101, 0, 0),
(@CGUID+168, 2, -271.283, -159.754, -2.22956, 0.965257, 0, 0),
(@CGUID+168, 3, -259.347, -158.022, -1.06405, 0.14373, 0, 0),
(@CGUID+168, 4, -272.184, -160.583, -2.30457, 3.59556, 0, 0),
(@CGUID+168, 5, -285.075, -184.305, -1.03008, 4.29613, 0, 0),
(@CGUID+168, 6, -260.98, -183.951, -0.665579, 0.036133, 0, 0),
(@CGUID+169, 1, -279.342, 13.4469, 18.1128, 0.950355, 0, 0),
(@CGUID+169, 2, -272.79, 25.3689, 21.7845, 1.24959, 0, 0),
(@CGUID+169, 3, -268.572, 31.4666, 24.3607, 0.832545, 0, 0),
(@CGUID+169, 4, -274.577, 21.3575, 20.511, 4.24353, 0, 0),
(@CGUID+169, 5, -284.049, 7.4308, 16.7873, 3.93251, 0, 0),
(@CGUID+169, 6, -284.896, -0.247323, 16.7873, 4.77524, 0, 0),
(@CGUID+169, 7, -285.129, -6.24572, 16.6856, 4.78702, 0, 0),
(@CGUID+169, 8, -285.54, 0.26651, 16.7874, 1.54647, 0, 0),
(@CGUID+170, 1, -248.044, 8.94805, 16.785, 3.15026, 0, 0),
(@CGUID+170, 2, -217.958, 9.05456, 16.7878, 6.25808, 0, 0),
(@CGUID+170, 3, -197.048, 9.2896, 16.7714, 6.23295, 0, 0),
(@CGUID+170, 4, -216.399, 9.11772, 16.7874, 3.10863, 0, 0),
(@CGUID+172, 1, -381.532, -63.9462, -0.95873, 1.02968, 0, 0),
(@CGUID+172, 2, -373.859, -58.4536, -0.95873, 0.552938, 0, 0),
(@CGUID+172, 3, -370.031, -58.3934, -0.963069, 0.015725, 0, 0),
(@CGUID+172, 4, -366.174, -60.1933, -0.960014, 5.84652, 0, 0),
(@CGUID+172, 5, -363.401, -64.3568, -0.960014, 5.58734, 0, 0),
(@CGUID+172, 6, -360.455, -71.6346, -0.960014, 5.03756, 0, 0),
(@CGUID+172, 7, -363.839, -63.4913, -0.960014, 2.11431, 0, 0),
(@CGUID+172, 8, -370.398, -58.5865, -0.961497, 2.49994, 0, 0),
(@CGUID+172, 9, -380.132, -60.454, -0.96026, 3.33246, 0, 0),
(@CGUID+172, 10, -385.05, -66.7028, -0.96026, 4.04561, 0, 0),
(@CGUID+172, 11, -385.156, -72.6797, -0.96026, 4.90719, 0, 0),
(@CGUID+173, 1, -379.085, -154.941, -0.958729, 0, 0, 0),
(@CGUID+173, 2, -386.025, -163.728, -0.957604, 0, 0, 0),
(@CGUID+173, 3, -376.866, -179.806, -0.967805, 0, 0, 0),
(@CGUID+173, 4, -360.753, -170.636, -0.959199, 0, 0, 0),
(@CGUID+173, 5, -365.623, -154.894, -0.959199, 0, 0, 0);

-- INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

-- INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(18309, 0, 0, 1, 16, 0, 0, NULL), -- Ethereal Scavenger
(18311, 0, 0, 1, 16, 0, 0, NULL), -- Ethereal Crypt Raider
(18312, 0, 0, 1, 16, 0, 0, NULL), -- Ethereal Spellbinder
(18313, 0, 0, 1, 16, 0, 0, NULL), -- Ethereal Sorcerer
(18314, 0, 0, 1, 16, 0, 0, NULL), -- Nexus Stalker
(18315, 0, 0, 1, 16, 0, 0, NULL), -- Ethereal Theurgist
(18317, 0, 0, 1, 16, 0, 0, NULL), -- Ethereal Priest
(18331, 0, 0, 1, 16, 0, 0, '16592'), -- Ethereal Darkcaster
(18341, 0, 0, 1, 16, 0, 0, NULL), -- Pandemonius
(18343, 0, 0, 1, 16, 0, 0, NULL), -- Tavarok
(18344, 0, 0, 1, 16, 0, 0, NULL), -- Nexus-Prince Shaffar
(18431, 0, 0, 1, 16, 0, 0, '32368'), -- Ethereal Beacon
(19306, 0, 0, 1, 16, 0, 0, NULL), -- Mana Leech
(19307, 0, 0, 1, 16, 0, 0, NULL); -- Nexus Terror

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+41, @CGUID+48, 1155), -- Ethereal Scavenger -> Ethereal Crypt Raider
(@CGUID+40, @CGUID+47, 1679), -- Ethereal Scavenger -> Ethereal Crypt Raider
(@CGUID+49, @CGUID+50, 1155), -- Ethereal Crypt Raider -> Ethereal Crypt Raider
(@CGUID+51, @CGUID+74, 1155), -- Ethereal Crypt Raider -> Ethereal Sorcerer
(@CGUID+52, @CGUID+74, 1155), -- Ethereal Crypt Raider -> Ethereal Sorcerer
(@CGUID+74, @CGUID+135, 1), -- Ethereal Sorcerer -> Pandemonius
(@CGUID+43, @CGUID+54, 1155), -- Ethereal Scavenger -> Ethereal Crypt Raider
(@CGUID+76, @CGUID+54, 1155), -- Ethereal Sorcerer -> Ethereal Crypt Raider
(@CGUID+54, @CGUID+135, 1), -- Ethereal Crypt Raider -> Pandemonius
(@CGUID+42, @CGUID+73, 1155), -- creature_spawn_entry -> Ethereal Sorcerer
(@CGUID+73, @CGUID+135, 1), -- Ethereal Sorcerer -> Pandemonius
(@CGUID+56, @CGUID+75, 1679), -- Ethereal Crypt Raider -> Ethereal Sorcerer
(@CGUID+75, @CGUID+135, 1), -- Ethereal Sorcerer -> Pandemonius
(@CGUID+53, @CGUID+77, 1155), -- Ethereal Crypt Raider -> Ethereal Sorcerer
(@CGUID+55, @CGUID+77, 1155), -- Ethereal Crypt Raider -> Ethereal Sorcerer
(@CGUID+77, @CGUID+135, 1), -- Ethereal Sorcerer -> Pandemonius
(@CGUID+60, @CGUID+90, 1155), -- Ethereal Crypt Raider -> creature_spawn_entry
(@CGUID+46, @CGUID+89, 1155), -- Ethereal Scavenger -> Ethereal Sorcerer
(@CGUID+59, @CGUID+89, 1155), -- Ethereal Crypt Raider -> Ethereal Sorcerer
(@CGUID+119, @CGUID+89, 1155), -- Ethereal Priest -> Ethereal Sorcerer
(@CGUID+121, @CGUID+92, 1155), -- Ethereal Priest -> Ethereal Sorcerer
(@CGUID+122, @CGUID+92, 1155), -- Ethereal Priest -> Ethereal Sorcerer
(@CGUID+84, @CGUID+112, 1155), -- Ethereal Sorcerer -> Ethereal Priest
(@CGUID+85, @CGUID+112, 1155), -- Ethereal Sorcerer -> Ethereal Priest
(@CGUID+120, @CGUID+91, 1679), -- Ethereal Priest -> Ethereal Sorcerer
(@CGUID+155, @CGUID+154, 1155), -- Mana Leech -> Mana Leech
(@CGUID+156, @CGUID+154, 1155), -- Mana Leech -> Mana Leech
(@CGUID+157, @CGUID+154, 1155), -- Mana Leech -> Mana Leech
(@CGUID+158, @CGUID+154, 1155), -- Mana Leech -> Mana Leech
(@CGUID+160, @CGUID+159, 1155), -- Mana Leech -> Mana Leech
(@CGUID+161, @CGUID+159, 1155), -- Mana Leech -> Mana Leech
(@CGUID+88, @CGUID+45, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+116, @CGUID+45, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+118, @CGUID+117, 1679), -- creature_spawn_entry -> Ethereal Priest
(@CGUID+83, @CGUID+110, 1155), -- creature_spawn_entry -> Ethereal Priest
(@CGUID+111, @CGUID+110, 1155), -- Ethereal Priest -> Ethereal Priest
(@CGUID+87, @CGUID+86, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+115, @CGUID+86, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+44, @CGUID+106, 1155), -- Ethereal Scavenger -> Ethereal Priest
(@CGUID+80, @CGUID+106, 1155), -- Ethereal Sorcerer -> Ethereal Priest
(@CGUID+127, @CGUID+106, 1155), -- Ethereal Darkcaster -> Ethereal Priest
(@CGUID+128, @CGUID+129, 1679), -- creature_spawn_entry -> Ethereal Darkcaster
(@CGUID+82, @CGUID+132, 1155), -- Ethereal Sorcerer -> Ethereal Darkcaster
(@CGUID+109, @CGUID+132, 1155), -- Ethereal Priest -> Ethereal Darkcaster
(@CGUID+134, @CGUID+114, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+152, @CGUID+151, 1155), -- Mana Leech -> Mana Leech
(@CGUID+153, @CGUID+151, 1155), -- Mana Leech -> Mana Leech
(@CGUID+81, @CGUID+108, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+131, @CGUID+108, 1155), -- Ethereal Darkcaster -> creature_spawn_entry
(@CGUID+130, @CGUID+107, 1155), -- Ethereal Darkcaster -> creature_spawn_entry
(@CGUID+126, @CGUID+125, 1155), -- Ethereal Darkcaster -> Ethereal Darkcaster
(@CGUID+93, @CGUID+105, 1679), -- Nexus Stalker -> creature_spawn_entry
(@CGUID+94, @CGUID+105, 1679), -- Nexus Stalker -> creature_spawn_entry
(@CGUID+163, @CGUID+162, 1155), -- Mana Leech -> Mana Leech
(@CGUID+164, @CGUID+162, 1155), -- Mana Leech -> Mana Leech
(@CGUID+97, @CGUID+133, 1679), -- creature_spawn_entry -> Nexus Stalker
(@CGUID+78, @CGUID+123, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+79, @CGUID+124, 1155), -- Ethereal Sorcerer -> Ethereal Darkcaster
(@CGUID+95, @CGUID+101, 1155), -- Nexus Stalker -> creature_spawn_entry
(@CGUID+96, @CGUID+101, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+64, @CGUID+99, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+66, @CGUID+65, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+100, @CGUID+65, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+63, @CGUID+62, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+98, @CGUID+62, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+58, @CGUID+57, 1155), -- Ethereal Crypt Raider -> Ethereal Crypt Raider
(@CGUID+61, @CGUID+57, 1155), -- Ethereal Spellbinder -> Ethereal Crypt Raider
(@CGUID+113, @CGUID+57, 1155), -- Ethereal Priest -> Ethereal Crypt Raider
(@CGUID+69, @CGUID+70, 1679), -- Ethereal Spellbinder -> Ethereal Spellbinder
(@CGUID+72, @CGUID+71, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+104, @CGUID+71, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+67, @CGUID+102, 1155), -- Ethereal Spellbinder -> Ethereal Theurgist
(@CGUID+68, @CGUID+102, 1155), -- Ethereal Spellbinder -> Ethereal Theurgist
(@CGUID+103, @CGUID+102, 1155), -- Ethereal Theurgist -> Ethereal Theurgist
(@CGUID+147, @CGUID+146, 1155), -- Mana Leech -> Mana Leech
(@CGUID+148, @CGUID+146, 1155), -- Mana Leech -> Mana Leech
(@CGUID+149, @CGUID+146, 1155), -- Mana Leech -> Mana Leech
(@CGUID+150, @CGUID+146, 1155), -- Mana Leech -> Mana Leech
(@CGUID+142, @CGUID+141, 1155), -- Mana Leech -> Mana Leech
(@CGUID+143, @CGUID+141, 1155), -- Mana Leech -> Mana Leech
(@CGUID+144, @CGUID+141, 1155), -- Mana Leech -> Mana Leech
(@CGUID+145, @CGUID+141, 1155), -- Mana Leech -> Mana Leech
(@CGUID+169, @CGUID+137, 1), -- Nexus Terror -> Nexus-Prince Shaffar
(@CGUID+170, @CGUID+137, 1), -- Nexus Terror -> Nexus-Prince Shaffar
(@CGUID+146, @CGUID+137, 1), -- Mana Leech -> Nexus-Prince Shaffar
(@CGUID+141, @CGUID+137, 1), -- Mana Leech -> Nexus-Prince Shaffar
(@CGUID+102, @CGUID+137, 1), -- Ethereal Theurgist -> Nexus-Prince Shaffar
(@CGUID+70, @CGUID+137, 1), -- Ethereal Spellbinder -> Nexus-Prince Shaffar
(@CGUID+71, @CGUID+137, 1); -- creature_spawn_entry -> Nexus-Prince Shaffar

REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(18430, 557, 18344, 4097, 0), -- Ethereal Apprentice -> Nexus-Prince Shaffar
(18431, 557, 18344, 1159, 0); -- Ethereal Beacon -> Nexus-Prince Shaffar

INSERT INTO `creature_spawn_entry` (`guid`, `entry`) VALUES
(@CGUID+42, 18309), (@CGUID+42, 18311), -- Ethereal Scavenger, Ethereal Crypt Raider
(@CGUID+45, 18309), (@CGUID+45, 18313), -- Ethereal Scavenger, Ethereal Sorcerer
(@CGUID+62, 18312), (@CGUID+62, 18314), -- Ethereal Spellbinder, Nexus Stalker
(@CGUID+63, 18312), (@CGUID+63, 18314), -- Ethereal Spellbinder, Nexus Stalker
(@CGUID+64, 18312), (@CGUID+64, 18331), -- Ethereal Spellbinder, Ethereal Darkcaster
(@CGUID+65, 18312), (@CGUID+65, 18314), -- Ethereal Spellbinder, Nexus Stalker
(@CGUID+66, 18312), (@CGUID+66, 18314), -- Ethereal Spellbinder, Nexus Stalker
(@CGUID+69, 18312), (@CGUID+69, 18315), -- Ethereal Spellbinder, Ethereal Theurgist
(@CGUID+71, 18312), (@CGUID+71, 18315), -- Ethereal Spellbinder, Ethereal Theurgist
(@CGUID+72, 18312), (@CGUID+72, 18315), -- Ethereal Spellbinder, Ethereal Theurgist
(@CGUID+78, 18314), (@CGUID+78, 18331), -- Ethereal Sorcerer, Ethereal Darkcaster
(@CGUID+81, 18313), (@CGUID+81, 18317), -- Ethereal Sorcerer, Ethereal Priest
(@CGUID+83, 18311), (@CGUID+83, 18313), -- Ethereal Crypt Raider, Ethereal Sorcerer
(@CGUID+86, 18313), (@CGUID+86, 18317), -- Ethereal Sorcerer, Ethereal Priest
(@CGUID+87, 18313), (@CGUID+87, 18317), -- Ethereal Sorcerer, Ethereal Priest
(@CGUID+88, 18313), (@CGUID+88, 18317), -- Ethereal Sorcerer, Ethereal Priest
(@CGUID+90, 18311), (@CGUID+90, 18313), -- Ethereal Crypt Raider, Ethereal Sorcerer
(@CGUID+96, 18314), (@CGUID+96, 18331), -- Nexus Stalker, Ethereal Darkcaster
(@CGUID+97, 18314), (@CGUID+97, 18331), -- Nexus Stalker, Ethereal Darkcaster
(@CGUID+98, 18312), (@CGUID+98, 18314), -- Ethereal Spellbinder, Nexus Stalker
(@CGUID+99, 18312), (@CGUID+99, 18314), -- Ethereal Spellbinder, Nexus Stalker
(@CGUID+100, 18312), (@CGUID+100, 18314), -- Ethereal Spellbinder, Nexus Stalker
(@CGUID+101, 18314), (@CGUID+101, 18315), (@CGUID+101, 18331), -- Nexus Stalker, Ethereal Theurgist, Ethereal Darkcaster
(@CGUID+104, 18312), (@CGUID+104, 18315), -- Ethereal Spellbinder, Ethereal Theurgist
(@CGUID+105, 18313), (@CGUID+105, 18317), (@CGUID+105, 18331), -- Ethereal Sorcerer, Ethereal Priest, Ethereal Darkcaster
(@CGUID+107, 18317), (@CGUID+107, 18331), -- Ethereal Priest, Ethereal Darkcaster
(@CGUID+108, 18317), (@CGUID+108, 18331), -- Ethereal Priest, Ethereal Darkcaster
(@CGUID+113, 18312), (@CGUID+113, 18317), -- Ethereal Spellbinder, Ethereal Priest
(@CGUID+114, 18317), (@CGUID+114, 18331), -- Ethereal Priest, Ethereal Darkcaster
(@CGUID+115, 18313), (@CGUID+115, 18317), -- Ethereal Sorcerer, Ethereal Priest
(@CGUID+116, 18313), (@CGUID+116, 18317), -- Ethereal Sorcerer, Ethereal Priest
(@CGUID+118, 18313), (@CGUID+118, 18317), -- Ethereal Sorcerer, Ethereal Priest
(@CGUID+123, 18314), (@CGUID+123, 18331), -- Nexus Stalker, Ethereal Darkcaster
(@CGUID+128, 18311), (@CGUID+128, 18313), (@CGUID+128, 18331), -- Ethereal Crypt Raider, Ethereal Sorcerer, Ethereal Darkcaster
(@CGUID+134, 18313), (@CGUID+134, 18331); -- Ethereal Sorcerer, Ethereal Darkcaster

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 3300, 557, 3, -167.945, -219.049, -0.955184, 2.24635, 7200, 7200, 5, 0, 0, 1), -- Adder
(@CGUID+2, 3300, 557, 3, -64.9214, -152.803, -0.954621, 5.24954, 7200, 7200, 5, 0, 0, 1), -- Adder
(@CGUID+3, 4075, 557, 3, -132.436, -235.061, -0.837656, 2.61799, 7200, 7200, 0, 0, 0, 0), -- Rat
(@CGUID+4, 4075, 557, 3, -106.434, -221.349, -0.327391, 1.56844, 7200, 7200, 5, 0, 0, 1), -- Rat
(@CGUID+5, 4075, 557, 3, -109.154, -245.159, -0.877707, 2.00713, 7200, 7200, 0, 0, 0, 0), -- Rat
(@CGUID+6, 4075, 557, 3, -80.9963, -247.669, -0.981655, 3.095, 7200, 7200, 3, 0, 0, 1), -- Rat
(@CGUID+7, 4076, 557, 3, -28.6643, -1.36396, -0.954327, 2.99347, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+8, 4076, 557, 3, -58.7712, -112.638, -0.643656, 1.29869, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+9, 4076, 557, 3, -90.8603, -57.1547, -0.899749, 0.695749, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+10, 4076, 557, 3, -55.284, -65.2501, -0.583655, 5.39547, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+11, 4076, 557, 3, -357.006, -58.2662, -0.958768, 1.45726, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+12, 4076, 557, 3, -260.138, -12.721, 16.7853, 2.51056, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+13, 4076, 557, 3, -313.069, 29.6364, 16.7887, 4.75044, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+14, 4076, 557, 3, -223.753, 36.9397, 16.8765, 5.02907, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+15, 4076, 557, 3, -52.7426, -248.427, -0.342114, 5.71542, 7200, 7200, 3, 0, 0, 1), -- Roach
(@CGUID+16, 4076, 557, 3, -78.0714, -203.72, -2.18549, 0.510209, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+17, 4076, 557, 3, -31.8792, -200.34, -0.096381, 2.06846, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+18, 4076, 557, 3, -293.38, 36.0122, 16.8706, 0.872665, 7200, 7200, 0, 0, 0, 0), -- Roach
(@CGUID+19, 4076, 557, 3, -316.03, -6.83241, 16.8607, 2.68775, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+20, 4076, 557, 3, -210.438, -15.8727, 16.9463, 2.46178, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+21, 4076, 557, 3, -117.197, -197.153, -0.876427, 1.85005, 7200, 7200, 0, 0, 0, 0), -- Roach
(@CGUID+22, 4076, 557, 3, -383.227, -34.5537, -0.587377, 1.38789, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+23, 4076, 557, 3, -44.6584, -227.59, -0.23824, 0.56071, 7200, 7200, 5, 0, 0, 1), -- Roach
(@CGUID+24, 14881, 557, 3, -57.6287, -11.5832, -0.950267, 3.20032, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+25, 14881, 557, 3, -393.544, -67.5723, -1.00932, 2.98987, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+26, 14881, 557, 3, -349.628, -227.574, -0.958779, 4.06159, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+27, 14881, 557, 3, -368.572, -236.88, -0.956436, 5.09738, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+28, 14881, 557, 3, -381.3, -174.79, -0.95342, 1.86325, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+29, 14881, 557, 3, -284.135, -172.869, -2.02379, 1.41923, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+30, 14881, 557, 3, -305.686, -187.61, -0.630343, 3.63029, 7200, 7200, 0, 0, 0, 0), -- Spider
(@CGUID+31, 14881, 557, 3, -256.133, -187.711, -0.904484, 4.0228, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+32, 14881, 557, 3, -97.7995, -41.5142, 16.7875, 5.6583, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+33, 14881, 557, 3, -110.774, 12.0316, 16.7932, 5.03552, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+34, 14881, 557, 3, -357.909, -174.616, -0.963162, 5.4589, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+35, 14881, 557, 3, -359.879, -129.787, -0.875448, 4.72984, 7200, 7200, 0, 0, 0, 0), -- Spider
(@CGUID+36, 14881, 557, 3, -397.591, -141.71, -0.875414, 2.58309, 7200, 7200, 0, 0, 0, 0), -- Spider
(@CGUID+37, 14881, 557, 3, -380.746, -118.221, -0.958706, 2.85805, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+38, 14881, 557, 3, -199.944, -230.552, -0.955697, 2.56202, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+39, 14881, 557, 3, -94.1764, -13.9732, 16.7906, 2.03256, 7200, 7200, 5, 0, 0, 1), -- Spider
(@CGUID+40, 18309, 557, 3, -66.9724, -20.2131, -0.95298, 1.33097, 7200, 7200, 0, 0, 0, 0), -- Ethereal Scavenger
(@CGUID+41, 18309, 557, 3, -48.3093, -5.9904, -0.862044, 0.366519, 7200, 7200, 0, 0, 0, 0), -- Ethereal Scavenger
(@CGUID+42, 0, 557, 3, -108.347, -92.963, -0.525856, 2.61019, 7200, 7200, 3, 0, 0, 1), -- creature_spawn_entry
(@CGUID+43, 18309, 557, 3, -97.8913, -59.8778, -0.80451, 3.32374, 7200, 7200, 3, 0, 0, 1), -- Ethereal Scavenger
(@CGUID+44, 18309, 557, 3, -188.778, -226.132, -0.872381, 6.16101, 7200, 7200, 0, 0, 0, 0), -- Ethereal Scavenger
(@CGUID+45, 0, 557, 3, -104.22, -232.65, 1.24996, 1.16937, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+46, 18309, 557, 3, -61.5001, -188.772, -1.46905, 1.76278, 7200, 7200, 0, 0, 0, 0), -- Ethereal Scavenger
(@CGUID+47, 18311, 557, 3, -70.0874, -19.6834, -0.947276, 1.26261, 7200, 7200, 0, 0, 0, 2), -- Ethereal Crypt Raider
(@CGUID+48, 18311, 557, 3, -54.2197, 3.48241, -0.863073, 0.10472, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+49, 18311, 557, 3, -71.1583, -41.0175, -0.870978, 1.309, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+50, 18311, 557, 3, -63.4184, -41.5546, -0.871005, 1.8326, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+51, 18311, 557, 3, -63.6561, -60.9781, -0.083704, 1.78024, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+52, 18311, 557, 3, -72.6442, -60.9713, -0.966841, 1.6057, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+53, 18311, 557, 3, -43.3006, -97.6103, -1.64936, 1.83806, 7200, 7200, 5, 0, 0, 1), -- Ethereal Crypt Raider
(@CGUID+54, 18311, 557, 3, -93.0082, -56.5336, -0.907013, 6.24652, 7200, 7200, 3, 0, 0, 1), -- Ethereal Crypt Raider
(@CGUID+55, 18311, 557, 3, -32.2717, -92.2206, -0.213944, 4.29137, 7200, 7200, 5, 0, 0, 1), -- Ethereal Crypt Raider
(@CGUID+56, 18311, 557, 3, -45.8928, -91.9961, -2.05578, 3.6214, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+57, 18311, 557, 3, -376.534, -42.4344, -0.875429, 5.18363, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+58, 18311, 557, 3, -368.995, -43.6087, -0.87543, 4.13643, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+59, 18311, 557, 3, -69.126, -192.387, -1.93268, 1.5708, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+60, 18311, 557, 3, -62.6304, -171.056, -0.872021, 1.69297, 7200, 7200, 0, 0, 0, 0), -- Ethereal Crypt Raider
(@CGUID+61, 18312, 557, 3, -375.576, -37.7328, -0.875593, 4.85202, 7200, 7200, 0, 0, 0, 0), -- Ethereal Spellbinder
(@CGUID+62, 0, 557, 3, -355.1946, -75.69616, -0.9481525, 4.090406, 7200, 7200, 3, 0, 0, 1), -- creature_spawn_entry
(@CGUID+63, 0, 557, 3, -350.154, -70.4616, -0.975357, 0.499545, 7200, 7200, 3, 0, 0, 1), -- creature_spawn_entry
(@CGUID+64, 0, 557, 3, -376.577, -112.053, -0.875482, 4.99164, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+65, 0, 557, 3, -388.684, -62.1238, -0.875438, 5.81195, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+66, 0, 557, 3, -396.181, -68.5921, -0.875436, 6.19592, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+67, 18312, 557, 3, -251.152, 12.3595, 17.035, 3.63029, 7200, 7200, 0, 0, 0, 0), -- Ethereal Spellbinder
(@CGUID+68, 18312, 557, 3, -253.225, 5.28209, 16.8681, 2.61799, 7200, 7200, 0, 0, 0, 0), -- Ethereal Spellbinder
(@CGUID+69, 18312, 557, 3, -318.932, 12.1766, 16.9666, 6.14262, 7200, 7200, 0, 0, 0, 0), -- Ethereal Spellbinder
(@CGUID+70, 18312, 557, 3, -321.008, 8.03572, 16.7936, 6.17011, 7200, 7200, 0, 0, 0, 2), -- Ethereal Spellbinder
(@CGUID+71, 0, 557, 3, -283.411, -8.19136, 16.6854, 5.96874, 7200, 7200, 3, 0, 0, 1), -- creature_spawn_entry
(@CGUID+72, 0, 557, 3, -282.122, -13.5559, 16.685, 3.09364, 7200, 7200, 3, 0, 0, 1), -- creature_spawn_entry
(@CGUID+73, 18313, 557, 3, -93.9981, -104.636, -0.740739, 1.11713, 7200, 7200, 5, 0, 0, 1), -- Ethereal Sorcerer
(@CGUID+74, 18313, 557, 3, -67.7227, -67.2675, -0.763696, 1.37881, 7200, 7200, 0, 0, 0, 0), -- Ethereal Sorcerer
(@CGUID+75, 18313, 557, 3, -46.7438, -97.7815, -0.929652, 2.09157, 7200, 7200, 0, 0, 0, 2), -- Ethereal Sorcerer
(@CGUID+76, 18313, 557, 3, -92.2927, -66.7266, -1.65868, 0.693752, 7200, 7200, 3, 0, 0, 1), -- Ethereal Sorcerer
(@CGUID+77, 18313, 557, 3, -39.1131, -94.6985, -1.49129, 0.564044, 7200, 7200, 5, 0, 0, 1), -- Ethereal Sorcerer
(@CGUID+78, 0, 557, 3, -395.757, -168.362, -0.875432, 0.523599, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+79, 18313, 557, 3, -353.883, -174.866, -0.875439, 2.79253, 7200, 7200, 0, 0, 0, 0), -- Ethereal Sorcerer
(@CGUID+80, 18313, 557, 3, -189.265, -218.946, -0.872109, 0.05236, 7200, 7200, 0, 0, 0, 0), -- Ethereal Sorcerer
(@CGUID+81, 0, 557, 3, -255.713, -184.388, -0.868398, 6.10865, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+82, 18313, 557, 3, -215.436, -223.383, -0.872229, 0.069813, 7200, 7200, 0, 0, 0, 0), -- Ethereal Sorcerer
(@CGUID+83, 0, 557, 3, -115.255, -199.527, -1.26219, 4.92183, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+84, 18313, 557, 3, -37.6795, -230.105, -0.206448, 3.51569, 7200, 7200, 5, 0, 0, 1), -- Ethereal Sorcerer
(@CGUID+85, 18313, 557, 3, -34.144, -223.416, -0.250586, 2.74732, 7200, 7200, 5, 0, 0, 1), -- Ethereal Sorcerer
(@CGUID+86, 0, 557, 3, -149.215, -228.594, -0.737461, 6.24828, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+87, 0, 557, 3, -149.423, -216.702, -0.696873, 6.0912, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+88, 0, 557, 3, -95.4604, -239.609, 0.136311, 1.25664, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+89, 18313, 557, 3, -71.2226, -188.406, -1.73088, 1.53589, 7200, 7200, 0, 0, 0, 0), -- Ethereal Sorcerer
(@CGUID+90, 0, 557, 3, -72.2145, -171.142, -0.872516, 1.27409, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+91, 18313, 557, 3, -38.5613, -226.18, -0.325425, 2.92719, 7200, 7200, 0, 0, 0, 2), -- Ethereal Sorcerer
(@CGUID+92, 18313, 557, 3, -32.9747, -197.769, -0.282741, 5.79297, 7200, 7200, 5, 0, 0, 1), -- Ethereal Sorcerer
(@CGUID+93, 18314, 557, 3, -370.804, -197.49, -0.959255, 4.77872, 7200, 7200, 0, 0, 0, 0), -- Nexus Stalker
(@CGUID+94, 18314, 557, 3, -375.406, -197.664, -0.959906, 4.71003, 7200, 7200, 0, 0, 0, 0), -- Nexus Stalker
(@CGUID+95, 18314, 557, 3, -370.222, -132.95, -0.87542, 3.92699, 7200, 7200, 0, 0, 0, 0), -- Nexus Stalker
(@CGUID+96, 0, 557, 3, -376.182, -133.235, -0.875428, 4.57276, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+97, 0, 557, 3, -363.697, -173.34, -0.958735, 0.732784, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+98, 0, 557, 3, -355.889, -64.566, -0.973143, 1.59343, 7200, 7200, 3, 0, 0, 1), -- creature_spawn_entry
(@CGUID+99, 0, 557, 3, -370.63, -111.675, -0.875497, 4.5204, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+100, 0, 557, 3, -389.196, -73.2266, -0.875436, 5.96903, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+101, 0, 557, 3, -372.96, -128.455, -0.875433, 4.60767, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+102, 18315, 557, 3, -258.087, 13.0255, 17.1581, 3.63029, 7200, 7200, 0, 0, 0, 0), -- Ethereal Theurgist
(@CGUID+103, 18315, 557, 3, -259.228, 2.10484, 16.8695, 2.60054, 7200, 7200, 0, 0, 0, 0), -- Ethereal Theurgist
(@CGUID+104, 0, 557, 3, -277.118, -4.83042, 16.6846, 5.82539, 7200, 7200, 3, 0, 0, 1), -- creature_spawn_entry
(@CGUID+105, 0, 557, 3, -373.487, -200.457, -0.958741, 4.71823, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+106, 18317, 557, 3, -181.468, -229.24, -0.871819, 0.453786, 7200, 7200, 0, 0, 0, 0), -- Ethereal Priest
(@CGUID+107, 0, 557, 3, -256.122, -159.776, -0.9532, 3.05443, 7200, 7200, 5, 0, 0, 1), -- creature_spawn_entry
(@CGUID+108, 0, 557, 3, -252.497, -188.106, -0.867767, 6.26573, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+109, 18317, 557, 3, -221.111, -229.191, -0.870442, 0.05236, 7200, 7200, 0, 0, 0, 0), -- Ethereal Priest
(@CGUID+110, 18317, 557, 3, -111.255, -196.593, -1.08792, 4.41568, 7200, 7200, 0, 0, 0, 0), -- Ethereal Priest
(@CGUID+111, 18317, 557, 3, -120.675, -197.878, -0.815505, 5.42797, 7200, 7200, 0, 0, 0, 0), -- Ethereal Priest
(@CGUID+112, 18317, 557, 3, -27.9476, -219.871, 0.127813, 2.02268, 7200, 7200, 5, 0, 0, 1), -- Ethereal Priest
(@CGUID+113, 18317, 557, 3, -370.425, -37.1676, -0.875545, 4.45059, 7200, 7200, 0, 0, 0, 0), -- Ethereal Priest
(@CGUID+114, 0, 557, 3, -220.07, -177.662, -0.980976, 0.867449, 7200, 7200, 4, 0, 0, 1), -- creature_spawn_entry
(@CGUID+115, 0, 557, 3, -156.482, -222.924, -0.871843, 0, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+116, 0, 557, 3, -103.364, -240.135, 0.547421, 1.0821, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+117, 18317, 557, 3, -123.452, -211.153, -0.155386, 0.221979, 7200, 7200, 0, 0, 0, 2), -- Ethereal Priest
(@CGUID+118, 0, 557, 3, -124.242, -214.734, -0.073988, 5.89521, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+119, 18317, 557, 3, -64.7507, -193.183, -1.75949, 1.69297, 7200, 7200, 0, 0, 0, 0), -- Ethereal Priest
(@CGUID+120, 18317, 557, 3, -37.7229, -222.832, -0.349562, 2.99589, 7200, 7200, 0, 0, 0, 0), -- Ethereal Priest
(@CGUID+121, 18317, 557, 3, -39.049, -199.532, -0.14847, 5.71687, 7200, 7200, 5, 0, 0, 1), -- Ethereal Priest
(@CGUID+122, 18317, 557, 3, -29.0415, -198.211, -0.237882, 5.72736, 7200, 7200, 5, 0, 0, 1), -- Ethereal Priest
(@CGUID+123, 0, 557, 3, -391.753, -171.917, -0.875433, 0.122173, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+124, 18331, 557, 3, -351.811, -168.769, -0.875438, 3.64774, 7200, 7200, 0, 0, 0, 0), -- Ethereal Darkcaster
(@CGUID+125, 18331, 557, 3, -299.195, -205.596, -1.43628, 0.471239, 7200, 7200, 0, 0, 0, 0), -- Ethereal Darkcaster
(@CGUID+126, 18331, 557, 3, -294.206, -203.307, -1.90027, 0.767945, 7200, 7200, 0, 0, 0, 0), -- Ethereal Darkcaster
(@CGUID+127, 18331, 557, 3, -181.588, -217.674, -0.871864, 5.96903, 7200, 7200, 0, 0, 0, 0), -- Ethereal Darkcaster
(@CGUID+128, 0, 557, 3, -211.961, -206.11, 0.783887, 5.36979, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+129, 18331, 557, 3, -209.475, -204.015, 1.09204, 5.53188, 7200, 7200, 0, 0, 0, 2), -- Ethereal Darkcaster
(@CGUID+130, 18331, 557, 3, -247.868, -155.745, -0.95344, 5.41272, 7200, 7200, 4, 0, 0, 1), -- Ethereal Darkcaster
(@CGUID+131, 18331, 557, 3, -252.239, -178.32, -0.869823, 5.67232, 7200, 7200, 0, 0, 0, 0), -- Ethereal Darkcaster
(@CGUID+132, 18331, 557, 3, -220.62, -217.393, -0.578685, 0.017453, 7200, 7200, 0, 0, 0, 0), -- Ethereal Darkcaster
(@CGUID+133, 18314, 557, 3, -365.002, -171.794, -0.958768, 0.555512, 7200, 7200, 0, 0, 0, 2), -- Nexus Stalker
(@CGUID+134, 0, 557, 3, -213.82, -182.69, -0.726174, 2.51996, 7200, 7200, 4, 0, 0, 1), -- creature_spawn_entry
(@CGUID+135, 18341, 557, 3, -70.6545, -123.28, -1.27934, 1.42393, 86400, 86400, 5, 0, 0, 1), -- Pandemonius
(@CGUID+136, 18343, 557, 3, -321.7171, -222.1826, -0.7776347, 0.3665192, 86400, 86400, 0, 0, 0, 0), -- Tavarok
(@CGUID+137, 18344, 557, 3, -184.3657, 9.333467, 16.81743, 2.949606, 86400, 86400, 0, 0, 0, 0), -- Nexus-Prince Shaffar
(@CGUID+138, 18431, 557, 3, -179.433, 9.06982, 16.7108, 5.13499, 7200, 7200, 3, 0, 0, 1), -- Ethereal Beacon
(@CGUID+139, 18431, 557, 3, -187.271, 15.3965, 16.7227, 1.21272, 7200, 7200, 3, 0, 0, 1), -- Ethereal Beacon
(@CGUID+140, 18431, 557, 3, -188.619, 5.124, 16.771, 3.24971, 7200, 7200, 3, 0, 0, 1), -- Ethereal Beacon
(@CGUID+141, 19306, 557, 3, -227.722, -7.84817, 17.0254, 1.4391, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+142, 19306, 557, 3, -223.528, -7.16711, 16.7343, 5.29432, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+143, 19306, 557, 3, -222.373, -9.60735, 16.7198, 1.84962, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+144, 19306, 557, 3, -222.044, -2.65712, 17.127, 2.81858, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+145, 19306, 557, 3, -218.428, -7.09061, 16.7351, 4.11056, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+146, 19306, 557, 3, -228.266, 27.6937, 17.4812, 1.76408, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+147, 19306, 557, 3, -225.287, 29.535, 16.8096, 3.85384, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+148, 19306, 557, 3, -222.826, 27.6137, 16.8019, 2.15511, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+149, 19306, 557, 3, -219.396, 30.1998, 16.8002, 5.08662, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+150, 19306, 557, 3, -222.662, 19.0589, 17.0274, 4.67522, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+151, 19306, 557, 3, -235.101, -175.894, -0.953743, 2.07142, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+152, 19306, 557, 3, -237.909, -173.929, -0.953745, 2.57018, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+153, 19306, 557, 3, -226.888, -175.681, -1.08653, 5.70626, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+154, 19306, 557, 3, -14.7249, -228.225, 2.0624, 3.07177, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+155, 19306, 557, 3, -8.77906, -227.244, 1.90264, 3.63575, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+156, 19306, 557, 3, -13.7841, -219.52, 0.561817, 2.60924, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+157, 19306, 557, 3, -8.2826, -216.339, 1.06373, 3.07125, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+158, 19306, 557, 3, -3.38083, -221.256, 1.82014, 4.50011, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+159, 19306, 557, 3, -52.1267, -243.826, -0.643876, 2.82645, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+160, 19306, 557, 3, -60.3636, -237.137, -0.279891, 0.925377, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+161, 19306, 557, 3, -59.1449, -246.561, -0.479103, 4.95654, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+162, 19306, 557, 3, -376.279, -216.61, -0.957973, 1.53744, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+163, 19306, 557, 3, -380.248, -211.073, -0.958662, 1.91085, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+164, 19306, 557, 3, -379.218, -222.014, -0.958474, 1.06264, 7200, 7200, 3, 0, 0, 1), -- Mana Leech
(@CGUID+165, 19307, 557, 3, -370.539, -91.8821, -0.958763, 5.80378, 7200, 7200, 5, 0, 0, 1), -- Nexus Terror
(@CGUID+166, 19307, 557, 3, -207.631, -258.483, -0.964534, 1.57884, 7200, 7200, 0, 0, 0, 2), -- Nexus Terror
(@CGUID+167, 19307, 557, 3, -115.799, -204.359, -1.28942, 2.40573, 7200, 7200, 0, 0, 0, 2), -- Nexus Terror
(@CGUID+168, 19307, 557, 3, -261.64, -185.142, -0.560481, 2.92994, 7200, 7200, 0, 0, 0, 2), -- Nexus Terror
(@CGUID+169, 19307, 557, 3, -285.065, 0.591321, 16.7863, 1.21974, 7200, 7200, 0, 0, 0, 2), -- Nexus Terror
(@CGUID+170, 19307, 557, 3, -227.458, 8.95172, 16.7867, 3.20759, 7200, 7200, 0, 0, 0, 2), -- Nexus Terror
(@CGUID+171, 19307, 557, 3, -372.193, 6.12651, 7.91805, 5.22501, 7200, 7200, 5, 0, 0, 1), -- Nexus Terror
(@CGUID+172, 19307, 557, 3, -384.325, -69.7276, -0.958768, 4.28878, 7200, 7200, 0, 0, 0, 2), -- Nexus Terror
(@CGUID+173, 19307, 557, 3, -372.748, -147.504, -0.979576, 1.17386, 7200, 7200, 5, 0, 0, 1), -- Nexus Terror
-- RE-USE 174 - 175
(@CGUID+176, 22927, 557, 2, 7.911558, -223.0178, -0.6344747, 4.223697, 7200, 7200, 0, 0, 0, 0), -- Ethereum Prisoner (Dungeon Energy Ball)
(@CGUID+177, 22927, 557, 2, -235.7885, -13.0054, 17.13969, 5.323254, 7200, 7200, 0, 0, 0, 0); -- Ethereum Prisoner (Dungeon Energy Ball)

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 181278, 557, 3, -283.552, -10.902, 16.685, 1.78024, 0, 0, 0.777147, 0.629319, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+2, 181278, 557, 3, -284.8429, -166.5485, -2.71548, 4.520403, 0, 0, -0.7716246, 0.6360782, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+3, 181278, 557, 3, -379.2326, -219.0941, -0.957844, 4.76475, 0, 0, -0.6883545, 0.7253745, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+4, 181278, 557, 3, -105.5518, -58.94052, -0.821702, 5.462882, 0, 0, -0.3987484, 0.9170604, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+5, 181556, 557, 3, -269.0356, 42.94153, 30.25974, 5.846854, 0, 0, -0.2164392, 0.9762961, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+6, 181556, 557, 3, -354.6415, -150.5468, 3.433386, 5.305802, 0, 0, -0.469471, 0.8829479, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+7, 181569, 557, 3, -269.0356, 42.94153, 30.25974, 5.846854, 0, 0, -0.2164392, 0.9762961, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+8, 181569, 557, 3, -245.6427, -3.169594, 15.06843, 5.969027, 0, 0, -0.1564341, 0.9876884, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+9, 183850, 557, 3, -373.15, -73.353, -0.958765, 0.191986, 0, 0, 0, 0, 3, 3, 100, 1), -- Consortium Transporter
(@OGUID+10, 183877, 557, 3, -355.2968, -64.47669, 0.437066, 3.857183, 0, 0, -0.9366713, 0.3502098, 7200, 7200, 255, 1), -- Ethereal Transporter Control Panel
(@OGUID+11, 184193, 557, 2, 6.456772, 0.9883103, -0.9543309, 3.129874, 0, 0, 0.9999828, 0.005859375, 0, 0, 0, 0), -- Instance_Portal_Difficulty_1
(@OGUID+12, 184194, 557, 1, 6.456772, 0.9883103, -0.9543309, 3.129874, 0, 0, 0.9999828, 0.005859375, 0, 0, 0, 0), -- Instance_Portal_Difficulty_0
(@OGUID+13, 181557, 557, 3, -245.6427, -3.169594, 15.06843, 5.969027, 0, 0, -0.1564341, 0.9876884, 86400, 86400, 255, 1), -- Khorium Vein
(@OGUID+14, 181557, 557, 3, -329.14605712890625, -161.168899536132812, 0.197860002517700195, 2.897245407104492187, 0, 0, 0.99254608154296875, 0.121869951486587524, 86400, 86400, 255, 1), -- Khorium Vein
(@OGUID+15, 185460, 557, 2, 7.909665, -223.0374, -0.934313, 1.97222, 0, 0, 0.8338852, 0.5519379, 7200, 7200, 255, 1), -- Ethereum Prison Base Group (Global)
(@OGUID+16, 185460, 557, 2, -235.8613, -12.97968, 17.05966, 1.553341, 0, 0, 0.7009087, 0.7132511, 600000, 600000, 255, 1), -- Ethereum Prison Base Group (Global)
(@OGUID+17, 185519, 557, 2, 7.941054, -223.0367, -0.936042, 6.03884, 0, 0, -0.1218691, 0.9925462, 86400, 86400, 0, 1), -- Mana-Tombs Stasis Chamber
(@OGUID+18, 185522, 557, 2, -235.7991, -13.00704, 17.05684, 1.361356, 0, 0, 0.6293201, 0.7771462, 600000, 600000, 100, 1), -- Shaffar's Stasis Chamber
(@OGUID+19, 181278, 557, 3, -350.4831, -60.33467, -0.974565, 0.9250238, 0, 0, 0.4461975, 0.8949345, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+20, 181278, 557, 3, -378.636, -241.6978, -0.956422, 4.118979, 0, 0, -0.882947, 0.4694727, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+21, 181278, 557, 3, -217.4846, -6.147508, 16.72746, 5.916668, 0, 0, -0.1822348, 0.983255, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+22, 181278, 557, 3, -291.3778, -206.4567, -2.542638, 4.206246, 0, 0, -0.8616285, 0.5075394, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+23, 181278, 557, 3, -96.5428, -121.953, 7.6393, 0.6649, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+24, 181278, 557, 3, -9.82288, -224.3066, 2.188424, 0.7155849, 0, 0, 0.3502073, 0.9366722, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+25, 181278, 557, 3, -110.7221, -193.4379, -1.061779, 0, 0, 0, 0, 1, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+26, 181278, 557, 3, -107.263, -249.694, -0.657617, 4.956738, 0, 0, -0.6156607, 0.7880114, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+27, 181278, 557, 3, -228.7831, -221.5956, -1.109034, 5.201083, 0, 0, -0.5150375, 0.8571676, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+28, 181278, 557, 3, -254.4572, -177.2186, -0.953286, 3.298687, 0, 0, -0.9969168, 0.07846643, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+29, 181278, 557, 3, -305.061, -169.813, 9.736, 4.5251, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+30, 181278, 557, 3, -353.5976, -179.4321, -0.966642, 1.117009, 0, 0, 0.5299187, 0.8480484, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+31, 181278, 557, 3, -400.5605, -172.3332, -0.98123, 3.508117, 0, 0, -0.9832544, 0.182238, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+32, 181278, 557, 3, -367.2534, -132.6776, -0.966903, 1.588249, 0, 0, 0.7132502, 0.7009096, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+33, 181278, 557, 3, -389.428, -50.9376, -0.9781, 5.7346, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+34, 181278, 557, 3, -380.959, -25.2826, -0.96, 5.4323, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+35, 181278, 557, 3, -255.5816, 3.049842, 16.78491, 4.485497, 0, 0, -0.782608, 0.6225148, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+36, 181278, 557, 3, -220.6831, 29.12672, 16.73167, 4.153885, 0, 0, -0.8746195 , 0.4848101, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+37, 181556, 557, 3, -417.1501, -166.7938, 0.833513, 0.122173, 0, 0, 0.06104851, 0.9981348, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+38, 181556, 557, 3, -245.6427, -3.169594, 15.06843, 5.969027, 0, 0, -0.1564341, 0.9876884, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+39, 181556, 557, 3, -329.1461, -161.1689, 0.19786, 2.897245, 0, 0, 0.9925461, 0.12187, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+40, 181556, 557, 3, -358.6431, -85.63693, 2.846204, 3.874631, 0, 0, -0.9335804, 0.358368, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+41, 181556, 557, 3, -390.3648681640625, -85.07049560546875, 2.39504408836364746, 4.660029888153076171, 0, 0, -0.72537422180175781, 0.688354730606079101, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+42, 181556, 557, 3, -417.15, -77.53868, 1.158793, 0.1396245, 0, 0, 0.06975555, 0.9975641, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+43, 181556, 557, 3, -384.7737, -146.4997, 3.060746, 5.183629, 0, 0, -0.5224981, 0.8526405, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+44, 181556, 557, 3, -369.378082275390625, -242.43310546875, 1.877009987831115722, 2.844882726669311523, 0, 0, 0.989015579223632812, 0.147811368107795715, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+45, 181556, 557, 3, -300.680054, -265.250977, -0.9956, 0, 0, 0, 0, 0, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+46, 181556, 557, 3, -306.768, 18.03365, 15.93403, 5.497789, 0, 0, -0.3826828, 0.9238798, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+47, 181556, 557, 3, -329.14605712890625, -161.168899536132812, 0.197860002517700195, 2.897245407104492187, 0, 0, 0.99254608154296875, 0.121869951486587524, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+48, 181569, 557, 3, -329.1461, -161.1689, 0.19786, 2.897245, 0, 0, 0.9925461, 0.12187, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+49, 181569, 557, 3, -417.1501, -166.7938, 0.833513, 0.122173, 0, 0, 0.06104851, 0.9981348, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+50, 181569, 557, 3, -329.14605712890625, -161.168899536132812, 0.197860002517700195, 2.897245407104492187, 0, 0, 0.99254608154296875, 0.121869951486587524, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+51, 181569, 557, 3, -306.768, 18.03365, 15.93403, 5.497789, 0, 0, -0.3826828, 0.9238798, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+52, 181557, 557, 3, -269.0356, 42.94153, 30.25974, 5.846854, 0, 0, -0.2164392, 0.9762961, 86400, 86400, 255, 1), -- Khorium Vein
(@OGUID+53, 181557, 557, 3, -306.768, 18.03365, 15.93403, 5.497789, 0, 0, -0.3826828, 0.9238798, 86400, 86400, 255, 1), -- Khorium Vein
(@OGUID+54, 181278, 557, 3, -379.9556, -41.42834, -0.967236, 4.084071, 0, 0, -0.8910065, 0.4539906, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+55, 181278, 557, 3, -256.0322, -152.7793, -0.953339, 0.6457717, 0, 0, 0.3173046, 0.9483237, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+56, 181278, 557, 3, -95.34675, -108.3567, -0.842384, 1.623156, 0, 0, 0.7253742, 0.6883547, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+57, 184934, 557, 1, -31.40896, -99.78729, 0.923387, 2.303831, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Fel Iron Chest
(@OGUID+58, 184935, 557, 1, -31.40896, -99.78729, 0.923387, 2.303831, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Fel Iron Chest
(@OGUID+59, 184934, 557, 1, -99.06686, -55.79686, -0.919465, -0.8726639, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Fel Iron Chest
(@OGUID+60, 184935, 557, 1, -99.06686, -55.79686, -0.919465, -0.8726639, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Fel Iron Chest
(@OGUID+61, 184934, 557, 1, -259.6258, -187.1173, -0.687503, 0.5934101, 0, 0, 0.2923708, 0.956305, 86400, 86400, 100, 1), -- Bound Fel Iron Chest
(@OGUID+62, 184935, 557, 1, -259.6258, -187.1173, -0.687503, 0.5934101, 0, 0, 0.2923708, 0.956305, 86400, 86400, 100, 1), -- Solid Fel Iron Chest
(@OGUID+63, 184934, 557, 1, -396.6851, -172.0011, -0.976236, 0.4363316, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Fel Iron Chest
(@OGUID+64, 184935, 557, 1, -396.6851, -172.0011, -0.976236, 0.4363316, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Fel Iron Chest
(@OGUID+65, 184936, 557, 2, -259.6258, -187.1173, -0.687503, 0.5934101, 0, 0, 0.2923708, 0.956305, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+66, 184937, 557, 2, -259.6258, -187.1173, -0.687503, 0.5934101, 0, 0, 0.2923708, 0.956305, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+67, 184936, 557, 2, -7.030846, -221.2169, 1.849148, 0.8377574, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+68, 184937, 557, 2, -7.030846, -221.2169, 1.849148, 0.8377574, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+69, 184936, 557, 2, -104.1061, -245.6414, -0.189249, 1.117009, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+70, 184937, 557, 2, -104.1061, -245.6414, -0.189249, 1.117009, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+71, 184936, 557, 2, -227.9113, -225.7269, -0.952425, 0.2443456, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+72, 184937, 557, 2, -227.9113, -225.7269, -0.952425, 0.2443456, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+73, 184936, 557, 2, -393.554, -60.86067, -0.982428, 6.03884, 0, 0, -0.1218691, 0.9925462, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+74, 184937, 557, 2, -393.554, -60.86067, -0.982428, 6.03884, 0, 0, -0.1218691, 0.9925462, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+75, 181569, 557, 3, -369.378082275390625, -242.43310546875, 1.877009987831115722, 2.844882726669311523, 0, 0, 0.989015579223632812, 0.147811368107795715, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+76, 181569, 557, 3, -390.3648681640625, -85.07049560546875, 2.39504408836364746, 4.660029888153076171, 0, 0, -0.72537422180175781, 0.688354730606079101, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+77, 181556, 557, 3, -329.14605712890625, -69.7390060424804687, 0.956256985664367675, 3.316144466400146484, 0, 0, -0.99619388580322265, 0.087165042757987976, 86400, 86400, 255, 1); -- Adamantite Deposit

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
(@PGUID+21, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #8'),
(@PGUID+23, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit / Khorium - #1'),
(@PGUID+24, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #2'),
(@PGUID+25, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #3'),
(@PGUID+26, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #4'),
(@PGUID+27, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit / Khorium - #5'),
(@PGUID+28, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #6'),
(@PGUID+29, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #7'),
(@PGUID+31, @PGUID+30, 0, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #1'),
(@PGUID+32, @PGUID+30, 0, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #2'),
(@PGUID+33, @PGUID+30, 0, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #3'),
(@PGUID+34, @PGUID+30, 0, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #4'),
(@PGUID+41, @PGUID+40, 0, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #1'),
(@PGUID+42, @PGUID+40, 0, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #2'),
(@PGUID+43, @PGUID+40, 0, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #3'),
(@PGUID+44, @PGUID+40, 0, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #4'),
(@PGUID+45, @PGUID+40, 0, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #5');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@PGUID+20, 4, 'Mana-Tombs - Ancient Lichen (181278)'),
(@PGUID+21, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #8'),
(@PGUID+22, 3, 'Mana-Tombs - Master Mineral Pool'),
(@PGUID+23, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit / Khorium - #1'),
(@PGUID+24, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #2'),
(@PGUID+25, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #3'),
(@PGUID+26, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #4'),
(@PGUID+27, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit / Khorium - #5'),
(@PGUID+28, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #6'),
(@PGUID+29, 1, 'Mana-Tombs - Adamantite Deposit / Rich Adamantite Deposit - #7'),
(@PGUID+30, 1, 'Mana-Tombs (Normal) - Master Chest Pool'),
(@PGUID+31, 1, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #1'),
(@PGUID+32, 1, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #2'),
(@PGUID+33, 1, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #3'),
(@PGUID+34, 1, 'Mana-Tombs (Normal) - Bound / Solid Adamantite Chest #4'),
(@PGUID+40, 1, 'Mana-Tombs (Heroic) - Master Chest Pool'),
(@PGUID+41, 1, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #1'),
(@PGUID+42, 1, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #2'),
(@PGUID+43, 1, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #3'),
(@PGUID+44, 1, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #4'),
(@PGUID+45, 1, 'Mana-Tombs (Heroic) - Bound / Solid Adamantite Chest #5');

-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES

-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@OGUID+1, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+2, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+3, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+4, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+19, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+20, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+21, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+22, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+23, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+24, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+25, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+26, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+27, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+28, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+29, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+30, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+31, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+32, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+33, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+34, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+35, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+36, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+54, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+55, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+56, @PGUID+20, 0, 'Mana-Tombs - Ancient Lichen (181278)'),
(@OGUID+41, @PGUID+21, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #8'),
(@OGUID+76, @PGUID+21, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #8'),
(@OGUID+6, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit (181556)'),
(@OGUID+40, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit (181556)'),
(@OGUID+42, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit (181556)'),
(@OGUID+43, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit (181556)'),
(@OGUID+45, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit (181556)'),
(@OGUID+77, @PGUID+22, 0, 'Mana-Tombs - Adamantite Deposit (181556)'),
(@OGUID+5, @PGUID+23, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #1'),
(@OGUID+7, @PGUID+23, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #1'),
(@OGUID+52, @PGUID+23, 0, 'Mana-Tombs - Khorium Vein (181557) - #1'),
(@OGUID+8, @PGUID+24, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #2'),
(@OGUID+13, @PGUID+24, 0, 'Mana-Tombs - Khorium Vein (181557) - #2'),
(@OGUID+38, @PGUID+24, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #2'),
(@OGUID+37, @PGUID+25, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #3'),
(@OGUID+49, @PGUID+25, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #3'),
(@OGUID+39, @PGUID+26, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #4'),
(@OGUID+48, @PGUID+26, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #4'),
(@OGUID+46, @PGUID+27, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #5'),
(@OGUID+51, @PGUID+27, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #5'),
(@OGUID+53, @PGUID+27, 0, 'Mana-Tombs - Khorium Vein (181557) - #5'),
(@OGUID+14, @PGUID+28, 0, 'Mana-Tombs - Khorium Vein (181557) - #6'),
(@OGUID+47, @PGUID+28, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #6'),
(@OGUID+50, @PGUID+28, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #6'),
(@OGUID+44, @PGUID+29, 0, 'Mana-Tombs - Adamantite Deposit (181556) - #7'),
(@OGUID+75, @PGUID+29, 0, 'Mana-Tombs - Rich Adamantite Deposit (181569) - #7'),
(@OGUID+57, @PGUID+31, 0, 'Mana-Tombs (Normal) - Bound Fel Iron Chest (184934) - #1'),
(@OGUID+58, @PGUID+31, 0, 'Mana-Tombs (Normal) - Solid Fel Iron Chest (184935) - #1'),
(@OGUID+59, @PGUID+32, 0, 'Mana-Tombs (Normal) - Bound Fel Iron Chest (184934) - #2'),
(@OGUID+60, @PGUID+32, 0, 'Mana-Tombs (Normal) - Solid Fel Iron Chest (184935) - #2'),
(@OGUID+61, @PGUID+33, 0, 'Mana-Tombs (Normal) - Bound Fel Iron Chest (184934) - #3'),
(@OGUID+62, @PGUID+33, 0, 'Mana-Tombs (Normal) - Solid Fel Iron Chest (184935) - #3'),
(@OGUID+63, @PGUID+34, 0, 'Mana-Tombs (Normal) - Bound Fel Iron Chest (184934) - #4'),
(@OGUID+64, @PGUID+34, 0, 'Mana-Tombs (Normal) - Solid Fel Iron Chest (184935) - #4'),
(@OGUID+65, @PGUID+41, 0, 'Mana-Tombs - Bound Adamantite Chest (184936) - #1'),
(@OGUID+66, @PGUID+41, 0, 'Mana-Tombs - Solid Adamantite Chest (184937) - #1'),
(@OGUID+67, @PGUID+42, 0, 'Mana-Tombs - Bound Adamantite Chest (184936) - #2'),
(@OGUID+68, @PGUID+42, 0, 'Mana-Tombs - Solid Adamantite Chest (184937) - #2'),
(@OGUID+69, @PGUID+43, 0, 'Mana-Tombs - Bound Adamantite Chest (184936) - #3'),
(@OGUID+70, @PGUID+43, 0, 'Mana-Tombs - Solid Adamantite Chest (184937) - #3'),
(@OGUID+71, @PGUID+44, 0, 'Mana-Tombs - Bound Adamantite Chest (184936) - #4'),
(@OGUID+72, @PGUID+44, 0, 'Mana-Tombs - Solid Adamantite Chest (184937) - #4'),
(@OGUID+73, @PGUID+45, 0, 'Mana-Tombs - Bound Adamantite Chest (184936) - #5'),
(@OGUID+74, @PGUID+45, 0, 'Mana-Tombs - Solid Adamantite Chest (184937) - #5');

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


