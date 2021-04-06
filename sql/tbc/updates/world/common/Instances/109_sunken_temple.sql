/* DBScriptData
DBName: Sunken Temple
DBScriptName: instance_sunken_temple
DB%Complete: 80
DBComment:
* probably movement missing e.g @CGUID+6, @CGUID+9, @CGUID+23, @CGUID+24, @CGUID+54, @CGUID+64, @CGUID+70, @CGUID+108
* movement missing for entry 5720 + 5721 + 8580 in circle clockwise
* Hazzas (Leader) & Morphaz should fly nearly synchronized, so i guess they should share path and/or should be linked. Or Spawnpositions & Waypointorder or Speeds needs adjustments
EndDBScriptData */

SET @CGUID := 1090000; -- creatures
SET @OGUID := 1090000; -- gameobjects
SET @PGUID := 45800; -- pools

-- =========
-- CREATURES
-- =========

-- INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES

DELETE FROM creature_movement_template WHERE entry IN (5708,5719,5722,8497);
INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(5708, 0, 1, -369.26, 94.5071, -148.802, 100, 0, 0),
(5708, 0, 2, -375.62, 119.789, -148.802, 100, 0, 0),
(5708, 0, 3, -383.225, 143.882, -148.802, 100, 0, 0),
(5708, 0, 4, -418.907, 179.624, -148.802, 100, 0, 0),
(5708, 0, 5, -466.908, 193.609, -148.82, 100, 0, 0),
(5708, 0, 6, -517.159, 180.646, -148.803, 100, 0, 0),
(5708, 0, 7, -552.931, 144.953, -148.71, 100, 0, 0),
(5708, 0, 8, -565.644, 96.3409, -148.802, 100, 0, 0),
(5708, 0, 9, -552.367, 46.1019, -148.802, 100, 0, 0),
(5708, 0, 10, -536.557, 28.4847, -148.802, 100, 0, 0),
(5708, 0, 11, -517.331, 10.7796, -148.773, 100, 0, 0),
(5708, 0, 12, -467.412, -2.85782, -148.802, 100, 0, 0),
(5708, 0, 13, -418.226, 10.4559, -148.755, 100, 0, 0),
(5708, 0, 14, -382.245, 46.9143, -148.802, 100, 0, 0),
(5708, 0, 15, -374.001, 71.9398, -148.802, 100, 0, 0),
(5719, 0, 1, -644.219, 58.4874, -90.8341, 1.57404, 0, 5),
(5719, 0, 2, -644.331, 136.016, -90.8297, 3.20482, 0, 0),
(5719, 0, 3, -674.273, 134.121, -90.8297, 4.72107, 0, 0),
(5719, 0, 4, -673.602, 56.772, -90.8339, 6.27551, 0, 0),
(5719, 0, 5, -643.732, 56.5426, -90.8339, 6.27551, 0, 0),
(5722, 0, 1, -644.27, 74.3273, -90.8327, 1.57404, 0, 5),
(5722, 0, 2, -644.468, 135.471, -90.8296, 3.22119, 0, 0),
(5722, 0, 3, -673.758, 133.936, -90.8296, 4.71017, 0, 0),
(5722, 0, 4, -673.928, 57.2586, -90.8338, 6.27006, 0, 0),
(5722, 0, 5, -643.802, 56.8631, -90.8338, 1.57403, 0, 0),
(8497, 0, 1, -420.629, 276.682, -90.827, 3.1722, 0, 0),
(8497, 0, 2, -446.197, 275.329, -90.674, 3.1722, 1000, 849701),
(8497, 1, 1, -512.015, 276.134, -90.827, 6.2808, 0, 0),
(8497, 1, 2, -489.960, 275.129, -90.751, 6.2808, 1000, 849701);

-- INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(5226, 0, 0, 1, 16, 0, 0, '8601'), -- Murk Worm
(5228, 0, 0, 1, 16, 0, 0, NULL), -- Saturated Ooze
(5256, 0, 0, 1, 16, 0, 0, NULL), -- Atal'ai Warrior
(5259, 0, 0, 1, 16, 0, 0, NULL), -- Atal'ai Witch Doctor
(5263, 0, 0, 1, 16, 0, 0, NULL), -- Mummified Atal'ai
(5267, 0, 0, 1, 16, 0, 0, '8876'), -- Unliving Atal'ai
(5269, 0, 0, 1, 16, 0, 0, NULL), -- Atal'ai Priest
(5270, 0, 0, 1, 16, 0, 0, NULL), -- Atal'ai Corpse Eater
(5271, 0, 0, 1, 16, 0, 0, NULL), -- Atal'ai Deathwalker
(5273, 0, 0, 1, 16, 0, 0, NULL), -- Atal'ai High Priest
(5277, 0, 0, 1, 16, 0, 0, '12099'), -- Nightmare Scalebane
(5280, 0, 0, 1, 16, 0, 0, NULL), -- Nightmare Wyrmkin
(5283, 0, 0, 1, 16, 0, 0, NULL), -- Nightmare Wanderer
(5291, 0, 0, 1, 16, 0, 0, NULL), -- Hakkari Frostwing
(5708, 0, 0, 1, 16, 0, 0, NULL), -- Spawn of Hakkar
(5709, 0, 0, 1, 16, 0, 0, '8876'), -- Shade of Eranikus
(5710, 0, 0, 1, 16, 0, 0, NULL), -- Jammal'an the Prophet
(5711, 0, 0, 1, 16, 0, 0, NULL), -- Ogom the Wretched
(5712, 0, 0, 1, 16, 0, 0, NULL), -- Zolo
(5713, 0, 0, 1, 16, 0, 0, NULL), -- Gasher
(5714, 0, 0, 1, 16, 0, 0, NULL), -- Loro
(5715, 0, 0, 1, 16, 0, 0, NULL), -- Hukku
(5716, 0, 0, 1, 16, 0, 0, NULL), -- Zul'Lor
(5717, 0, 0, 1, 16, 0, 0, NULL), -- Mijan
(5719, 0, 0, 1, 16, 0, 0, NULL), -- Morphaz
(5722, 0, 0, 1, 16, 0, 0, NULL), -- Hazzas
(8311, 0, 0, 1, 16, 0, 0, NULL), -- Slime Maggot
(8318, 0, 0, 1, 16, 0, 0, NULL), -- Atal'ai Slave
(8319, 0, 0, 1, 16, 0, 0, NULL), -- Nightmare Whelp
(8384, 0, 0, 1, 16, 0, 0, NULL), -- Deep Lurker
(15593, 0, 0, 1, 16, 0, 0, '25824'); -- Elder Starsong

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+113, @CGUID+103, 3), -- Nightmare Wyrmkin -> Nightmare Scalebane
(@CGUID+118, @CGUID+103, 3), -- Nightmare Wanderer -> Nightmare Scalebane
(@CGUID+265, @CGUID+103, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+261, @CGUID+260, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+262, @CGUID+260, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+263, @CGUID+260, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+264, @CGUID+260, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+283, @CGUID+108, 515), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+284, @CGUID+108, 515), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+285, @CGUID+124, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+286, @CGUID+124, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+268, @CGUID+106, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+269, @CGUID+106, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+274, @CGUID+106, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+275, @CGUID+106, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+121, @CGUID+106, 3), -- Nightmare Wanderer -> Nightmare Scalebane
(@CGUID+270, @CGUID+119, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+271, @CGUID+119, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+272, @CGUID+119, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+273, @CGUID+119, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+279, @CGUID+122, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+280, @CGUID+122, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+281, @CGUID+122, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+282, @CGUID+122, 3), -- Nightmare Whelp -> Nightmare Wanderer
(@CGUID+267, @CGUID+266, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+276, @CGUID+266, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+277, @CGUID+266, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+278, @CGUID+266, 3), -- Nightmare Whelp -> Nightmare Whelp
(@CGUID+105, @CGUID+104, 3), -- Nightmare Scalebane -> Nightmare Scalebane
(@CGUID+123, @CGUID+104, 3), -- Nightmare Wanderer -> Nightmare Scalebane
(@CGUID+114, @CGUID+97, 3), -- Nightmare Wanderer -> Nightmare Scalebane
(@CGUID+115, @CGUID+97, 3), -- Nightmare Wanderer -> Nightmare Scalebane
(@CGUID+110, @CGUID+97, 3), -- Nightmare Wyrmkin -> Nightmare Scalebane
(@CGUID+120, @CGUID+109, 515), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+125, @CGUID+109, 515), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+100, @CGUID+99, 3), -- Nightmare Scalebane -> Nightmare Scalebane
(@CGUID+117, @CGUID+99, 3), -- Nightmare Wanderer -> Nightmare Scalebane
(@CGUID+249, @CGUID+98, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+250, @CGUID+98, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+251, @CGUID+98, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+252, @CGUID+98, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+116, @CGUID+98, 3), -- Nightmare Wanderer -> Nightmare Scalebane
(@CGUID+257, @CGUID+102, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+258, @CGUID+102, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+259, @CGUID+102, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+112, @CGUID+102, 3), -- Nightmare Wyrmkin -> Nightmare Scalebane
(@CGUID+253, @CGUID+101, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+254, @CGUID+101, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+255, @CGUID+101, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+256, @CGUID+101, 3), -- Nightmare Whelp -> Nightmare Scalebane
(@CGUID+111, @CGUID+101, 3), -- Nightmare Wyrmkin -> Nightmare Scalebane
(@CGUID+87, @CGUID+55, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
(@CGUID+88, @CGUID+55, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
(@CGUID+83, @CGUID+57, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
(@CGUID+84, @CGUID+57, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
-- (@CGUID+77, @CGUID+58, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
-- (@CGUID+78, @CGUID+58, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
-- (@CGUID+56, @CGUID+96, 3), -- Mummified Atal'ai -> Atal'ai High Priest
-- (@CGUID+60, @CGUID+96, 3), -- Mummified Atal'ai -> Atal'ai High Priest
-- (@CGUID+91, @CGUID+96, 3), -- Atal'ai Deathwalker -> Atal'ai High Priest
-- (@CGUID+86, @CGUID+96, 3), -- Atal'ai Deathwalker -> Atal'ai High Priest
-- (@CGUID+79, @CGUID+95, 3), -- Atal'ai Deathwalker -> Atal'ai High Priest
-- (@CGUID+89, @CGUID+95, 3), -- Atal'ai Deathwalker -> Atal'ai High Priest
-- (@CGUID+90, @CGUID+95, 3), -- Atal'ai Deathwalker -> Atal'ai High Priest
-- (@CGUID+82, @CGUID+69, 3), -- Atal'ai Deathwalker -> Atal'ai Priest
-- (@CGUID+92, @CGUID+69, 3), -- Atal'ai Deathwalker -> Atal'ai Priest
-- (@CGUID+93, @CGUID+69, 3), -- Atal'ai Deathwalker -> Atal'ai Priest
(@CGUID+80, @CGUID+59, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
(@CGUID+81, @CGUID+59, 3), -- Atal'ai Deathwalker -> Mummified Atal'ai
(@CGUID+85, @CGUID+94, 3), -- Atal'ai Deathwalker -> Atal'ai Deathwalker
(@CGUID+226, @CGUID+41, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+244, @CGUID+41, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+75, @CGUID+41, 3), -- Atal'ai Corpse Eater -> Atal'ai Witch Doctor
(@CGUID+66, @CGUID+41, 3), -- Unliving Atal'ai -> Atal'ai Witch Doctor
(@CGUID+224, @CGUID+49, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+225, @CGUID+49, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+236, @CGUID+49, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+237, @CGUID+49, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+68, @CGUID+49, 3), -- Unliving Atal'ai -> Atal'ai Witch Doctor
(@CGUID+71, @CGUID+70, 3), -- Atal'ai Corpse Eater -> Atal'ai Corpse Eater
(@CGUID+35, @CGUID+70, 3), -- Atal'ai Witch Doctor -> Atal'ai Corpse Eater
(@CGUID+216, @CGUID+53, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+217, @CGUID+53, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+243, @CGUID+53, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+74, @CGUID+53, 3), -- Atal'ai Corpse Eater -> Atal'ai Witch Doctor
(@CGUID+218, @CGUID+30, 3), -- Atal'ai Slave -> Atal'ai Warrior
(@CGUID+219, @CGUID+30, 3), -- Atal'ai Slave -> Atal'ai Warrior
(@CGUID+72, @CGUID+30, 3), -- Atal'ai Corpse Eater -> Atal'ai Warrior
(@CGUID+73, @CGUID+30, 3), -- Atal'ai Corpse Eater -> Atal'ai Warrior
(@CGUID+210, @CGUID+43, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+229, @CGUID+43, 3), -- Atal'ai Slave -> Atal'ai Witch Doctor
(@CGUID+44, @CGUID+43, 3), -- Atal'ai Witch Doctor -> Atal'ai Witch Doctor
(@CGUID+196, @CGUID+303, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+197, @CGUID+303, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+198, @CGUID+303, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+199, @CGUID+303, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+304, @CGUID+303, 3), -- Deep Lurker -> Deep Lurker
(@CGUID+200, @CGUID+305, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+201, @CGUID+305, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+19, @CGUID+305, 3), -- Saturated Ooze -> Deep Lurker
(@CGUID+145, @CGUID+287, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+147, @CGUID+287, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+170, @CGUID+287, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+146, @CGUID+1, 3), -- Slime Maggot -> Murk Worm
(@CGUID+195, @CGUID+1, 3), -- Slime Maggot -> Murk Worm
(@CGUID+11, @CGUID+1, 3), -- Murk Worm -> Murk Worm
(@CGUID+153, @CGUID+290, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+154, @CGUID+290, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+155, @CGUID+290, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+156, @CGUID+290, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+291, @CGUID+290, 3), -- Deep Lurker -> Deep Lurker
(@CGUID+151, @CGUID+288, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+152, @CGUID+288, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+289, @CGUID+288, 3), -- Deep Lurker -> Deep Lurker
(@CGUID+159, @CGUID+292, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+160, @CGUID+292, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+161, @CGUID+292, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+162, @CGUID+292, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+163, @CGUID+292, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+157, @CGUID+2, 3), -- Slime Maggot -> Murk Worm
(@CGUID+158, @CGUID+2, 3), -- Slime Maggot -> Murk Worm
(@CGUID+3, @CGUID+2, 3), -- Murk Worm -> Murk Worm
(@CGUID+164, @CGUID+293, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+165, @CGUID+293, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+166, @CGUID+293, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+167, @CGUID+293, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+168, @CGUID+293, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+14, @CGUID+13, 3), -- Saturated Ooze -> Deep Lurker
(@CGUID+169, @CGUID+4, 3), -- Murk Worm -> Murk Worm
(@CGUID+204, @CGUID+307, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+205, @CGUID+307, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+206, @CGUID+307, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+207, @CGUID+307, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+202, @CGUID+306, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+203, @CGUID+306, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+12, @CGUID+306, 3), -- Murk Worm -> Deep Lurker
(@CGUID+171, @CGUID+5, 3), -- Slime Maggot -> Murk Worm
(@CGUID+193, @CGUID+5, 3), -- Slime Maggot -> Murk Worm
(@CGUID+194, @CGUID+5, 3), -- Slime Maggot -> Murk Worm
(@CGUID+10, @CGUID+5, 3), -- Murk Worm -> Murk Worm
(@CGUID+189, @CGUID+301, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+190, @CGUID+301, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+191, @CGUID+301, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+192, @CGUID+301, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+179, @CGUID+296, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+180, @CGUID+296, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+181, @CGUID+296, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+297, @CGUID+296, 3), -- Deep Lurker -> Deep Lurker
(@CGUID+175, @CGUID+295, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+176, @CGUID+295, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+177, @CGUID+295, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+178, @CGUID+295, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+172, @CGUID+294, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+173, @CGUID+294, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+174, @CGUID+294, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+182, @CGUID+298, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+183, @CGUID+298, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+184, @CGUID+298, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+185, @CGUID+299, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+186, @CGUID+299, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+187, @CGUID+299, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+188, @CGUID+299, 3), -- Slime Maggot -> Deep Lurker
(@CGUID+8, @CGUID+7, 3), -- Murk Worm -> Murk Worm
(@CGUID+18, @CGUID+7, 3); -- Saturated Ooze -> Murk Worm

REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(5277, 109, 5709, 1, 0), -- Nightmare Scalebane -> Shade of Eranikus
(5280, 109, 5709, 1, 0), -- Nightmare Wyrmkin -> Shade of Eranikus
(5283, 109, 5709, 1, 0), -- Nightmare Wanderer -> Shade of Eranikus
(5711, 109, 5710, 3, 0), -- Ogom the Wretched -> Jammal'an the Prophet
(5719, 109, 5709, 1, 0), -- Morphaz -> Shade of Eranikus
(5719, 109, 5722, 3, 0), -- Morphaz -> Hazzas
(5722, 109, 5709, 1, 0), -- Hazzas -> Shade of Eranikus
(8319, 109, 5709, 1, 0); -- Nightmare Whelp -> Shade of Eranikus

INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 5226, 109, -491.134, 141.045, -148.742, 2.54743, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+2, 5226, 109, -501.895, 52.2439, -148.744, 4.71197, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+3, 5226, 109, -491.895, 46.3545, -148.743, 3.41607, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+4, 5226, 109, -398.737, 33.2352, -148.802, 4.22267, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+5, 5226, 109, -286.726, 117.319, -173.003, 5.52842, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+6, 5226, 109, -328.677, 133.218, -156.731, 2.07267, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+7, 5226, 109, -463.148, 92.9039, -189.73, 0.109954, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+8, 5226, 109, -467.428, 96.7557, -189.73, 3.79191, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+9, 5226, 109, -306.301, 95.8346, -172.98, 3.15259, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+10, 5226, 109, -288.895, 108.466, -173.003, 2.81487, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+11, 5226, 109, -502.89, 134.435, -148.742, 0.854892, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+12, 5226, 109, -417.444, 88.5238, -148.743, 0.361671, 7200, 7200, 0, 0, 0, 0), -- Murk Worm
(@CGUID+13, 5228, 109, -434.107, 53.8109, -148.742, 4.15671, 7200, 7200, 0, 0, 0, 0), -- Saturated Ooze
(@CGUID+14, 5228, 109, -446.256, 43.6092, -148.744, 5.58535, 7200, 7200, 0, 0, 0, 0), -- Saturated Ooze
(@CGUID+15, 5228, 109, -494.243, 141.354, -172.939, 5.34383, 7200, 7200, 0, 0, 0, 0), -- Saturated Ooze
(@CGUID+16, 5228, 109, -495.708, 51.8927, -173.313, 0.8922, 7200, 7200, 0, 0, 0, 0), -- Saturated Ooze
(@CGUID+17, 5228, 109, -440.719, 53.7378, -173.655, 4.04951, 7200, 7200, 0, 0, 0, 0), -- Saturated Ooze
(@CGUID+18, 5228, 109, -469.266, 104.372, -189.73, 2.66565, 7200, 7200, 0, 0, 0, 0), -- Saturated Ooze
(@CGUID+19, 5228, 109, -442.549, 144.445, -148.743, 5.47225, 7200, 7200, 0, 0, 0, 0), -- Saturated Ooze
(@CGUID+20, 5256, 109, -436.797, 2.26111, -53.9463, 0.797142, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+21, 5256, 109, -442.327, 5.6199, -53.9463, 0.0376612, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+22, 5256, 109, -553.639, 62.564, -53.9463, 4.97037, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+23, 5256, 109, -560.695, 109.257, -53.9463, 5.22798, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+24, 5256, 109, -412.033, 176.179, -53.9463, 5.23434, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+25, 5256, 109, -374.577, 108.976, -53.9463, 0.332726, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+26, 5256, 109, -483.288, 183.85, -53.9463, 1.3809, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+27, 5256, 109, -481.784, 193.587, -53.9463, 5.30475, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+28, 5256, 109, -550.794, 130.856, -53.9465, 1.49243, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+29, 5256, 109, -555.874, 82.1068, -53.9465, 3.32405, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+30, 5256, 109, -522.858, 9.78118, -53.9463, 1.44928, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Warrior
(@CGUID+31, 5259, 109, -376.555, 5.47187, -148.677, 1.41801, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+32, 5259, 109, -366.303, 20.705, -148.657, 4.0923, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+33, 5259, 109, -367.58, 90.78, -131.849, 5.97881, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+34, 5259, 109, -397.505, 141.699, -131.857, 6.03913, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+35, 5259, 109, -394.658, 29.7623, -53.9463, 2.3483, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+36, 5259, 109, -432.846, 9.76502, -53.9463, 4.27489, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+37, 5259, 109, -552.984, 56.1326, -53.9463, 1.87433, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+38, 5259, 109, -559.291, 58.8837, -53.9463, 6.2812, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+39, 5259, 109, -446.649, 191.083, -53.9463, 5.62382, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+40, 5259, 109, -438.791, 185.074, -53.9463, 2.89071, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+41, 5259, 109, -350.239, 4.82687, -69.3923, 2.37323, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+42, 5259, 109, -606.221, 46.1259, -69.3528, 5.56428, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+43, 5259, 109, -329.324, 141.748, -69.4879, 2.60411, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+44, 5259, 109, -345.302, 145.317, -69.4879, 0.606829, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+45, 5259, 109, -394.009, 152.572, -53.9463, 6.06647, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+46, 5259, 109, -393.419, 159.956, -53.9463, 5.27019, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+47, 5259, 109, -475.607, 189.167, -53.9463, 0.63006, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+48, 5259, 109, -523.055, 172.089, -54.0949, 3.22816, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+49, 5259, 109, -570.254, 190.228, -69.4013, 4.66544, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+50, 5259, 109, -556.395, 140.93, -53.9465, 4.95453, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+51, 5259, 109, -558.828, 128.91, -53.9465, 0.650548, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+52, 5259, 109, -602.902, 55.1722, -69.3528, 5.53965, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+53, 5259, 109, -480.794, 4.1161, -53.9463, 3.61227, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+54, 5259, 109, -371.111, 73.6491, -53.9455, 1.95193, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Witch Doctor
(@CGUID+55, 5263, 109, -492.77, -54.5658, -90.8275, 5.42032, 7200, 7200, 0, 0, 0, 0), -- Mummified Atal'ai
(@CGUID+56, 5263, 109, -477.877, -93.8933, -90.8275, 0.220976, 7200, 7200, 0, 0, 0, 0), -- Mummified Atal'ai
(@CGUID+57, 5263, 109, -482.958, -116.101, -90.8275, 2.75782, 7200, 7200, 0, 0, 0, 0), -- Mummified Atal'ai
(@CGUID+58, 5263, 109, -467.583, -76.3734, -90.8275, 0.146237, 7200, 7200, 0, 0, 0, 0), -- Mummified Atal'ai
(@CGUID+59, 5263, 109, -447.073, -52.2468, -90.8275, 5.03312, 7200, 7200, 0, 0, 0, 0), -- Mummified Atal'ai
(@CGUID+60, 5263, 109, -466.663, -97.4965, -90.8275, 0.122803, 7200, 7200, 0, 0, 0, 0), -- Mummified Atal'ai
(@CGUID+61, 5267, 109, -373.987, 8.44981, -148.719, 1.63792, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+62, 5267, 109, -367.467, 83.5495, -131.849, 0.520293, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+63, 5267, 109, -397.082, 144.273, -131.857, 5.92995, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+64, 5267, 109, -380.837, 143.681, -53.9463, 4.85938, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+65, 5267, 109, -442.403, 187.482, -53.9463, 3.01794, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+66, 5267, 109, -362.514, 3.44433, -69.3923, 0.64142, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+67, 5267, 109, -524.792, 175.692, -54.0949, 3.12527, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+68, 5267, 109, -578.509, 184.885, -69.4013, 4.43217, 7200, 7200, 0, 0, 0, 0), -- Unliving Atal'ai
(@CGUID+69, 5269, 109, -448.423, -91.5326, -90.8275, 5.98973, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Priest
(@CGUID+70, 5270, 109, -400.084, 30.8435, -53.9463, 4.07932, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Corpse Eater
(@CGUID+71, 5270, 109, -396.341, 35.9445, -53.9463, 4.07932, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Corpse Eater
(@CGUID+72, 5270, 109, -530.902, 21.5278, -53.9463, 5.97527, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Corpse Eater
(@CGUID+73, 5270, 109, -521.466, 22.2492, -53.9463, 4.55947, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Corpse Eater
(@CGUID+74, 5270, 109, -475.277, 0.586998, -53.9463, 0.0261377, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Corpse Eater
(@CGUID+75, 5270, 109, -359.358, 6.96094, -69.3923, 1.15946, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Corpse Eater
(@CGUID+76, 5270, 109, -380.9, 48.948, -53.9455, 4.39688, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Corpse Eater
(@CGUID+77, 5271, 109, -476.251, -80.8728, -90.8275, 0.275089, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+78, 5271, 109, -476.669, -74.2078, -90.8275, 0.0630307, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+79, 5271, 109, -459.757, -74.6776, -90.8275, 5.61186, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+80, 5271, 109, -442.985, -53.7109, -90.8275, 3.67469, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+81, 5271, 109, -449.691, -55.0559, -90.8275, 5.98769, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+82, 5271, 109, -448.944, -93.9112, -90.8275, 6.11177, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+83, 5271, 109, -488.346, -116.971, -90.8275, 0.749854, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+84, 5271, 109, -486.837, -112.27, -90.8275, 4.87075, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+85, 5271, 109, -440.499, -120.2, -90.8275, 2.34569, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+86, 5271, 109, -466.791, -92.1131, -90.8274, 6.26874, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+87, 5271, 109, -487.119, -54.2088, -90.8281, 3.87692, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+88, 5271, 109, -491.812, -61.1224, -90.8281, 1.33301, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+89, 5271, 109, -450.099, -74.562, -90.8274, 0.0975781, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+90, 5271, 109, -449.994, -79.4681, -90.8274, 0.0975781, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+91, 5271, 109, -477.84, -97.6526, -90.8275, 0.113043, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+92, 5271, 109, -457.172, -90.0466, -90.8275, 0.131107, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+93, 5271, 109, -457.244, -97.7436, -90.8275, 6.16061, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+94, 5271, 109, -444.604, -116.482, -90.8275, 2.26697, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Deathwalker
(@CGUID+95, 5273, 109, -459.898, -77.7837, -90.8275, 6.26499, 7200, 7200, 0, 0, 0, 0), -- Atal'ai High Priest
(@CGUID+96, 5273, 109, -466.5, -94.7733, -90.8275, 6.212, 7200, 7200, 0, 0, 0, 0), -- Atal'ai High Priest
(@CGUID+97, 5277, 109, -502.226, 161.997, -90.8876, 5.24682, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+98, 5277, 109, -598.944, 99.2307, -90.8849, 1.0031, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+99, 5277, 109, -542.652, 94.2902, -90.8689, 0.0582671, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+100, 5277, 109, -543.298, 101.722, -90.8697, 0.0504134, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+101, 5277, 109, -543.934, -72.9843, -90.8326, 3.44334, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+102, 5277, 109, -529.762, 10.1713, -90.8782, 6.17628, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+103, 5277, 109, -293.655, 80.4138, -91.4671, 2.16369, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+104, 5277, 109, -422.242, 156.176, -90.8708, 4.17668, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+105, 5277, 109, -436.859, 164.875, -90.866, 4.16098, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+106, 5277, 109, -420.452, 15.5113, -90.8588, 2.17262, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+107, 5277, 109, -498.945, 37.5312, -90.9851, 0.39055, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+108, 5277, 109, -433.421, 127.433, -90.9162, 4.91028, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+109, 5277, 109, -511.852, 125.178, -91.3058, 4.54586, 7200, 7200, 0, 0, 0, 0), -- Nightmare Scalebane
(@CGUID+110, 5280, 109, -511.836, 156.322, -90.8862, 5.19577, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wyrmkin
(@CGUID+111, 5280, 109, -561.332, -66.583, -90.8419, 5.882, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wyrmkin
(@CGUID+112, 5280, 109, -524.726, 16.4706, -90.8805, 4.6212, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wyrmkin
(@CGUID+113, 5280, 109, -301.045, 77.3152, -91.4671, 0.365127, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wyrmkin
(@CGUID+114, 5283, 109, -507.281, 159.062, -90.8874, 5.26646, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+115, 5283, 109, -497.614, 164.865, -90.8902, 5.23897, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+116, 5283, 109, -587.545, 92.7379, -90.8894, 3.17708, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+117, 5283, 109, -542.852, 86.9069, -90.8667, 0.0111437, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+118, 5283, 109, -293.544, 74.1209, -91.4671, 1.51573, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+119, 5283, 109, -459.465, 70.2193, -92.9899, 0.92493, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+120, 5283, 109, -502.888, 122.757, -90.6196, 5.14026, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+121, 5283, 109, -431.212, 8.95485, -90.8681, 1.28512, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+122, 5283, 109, -474.494, 130.007, -91.3932, 3.5884, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+123, 5283, 109, -431.411, 163.683, -90.8687, 4.19556, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+124, 5283, 109, -433.442, 73.5839, -90.9951, 2.69153, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+125, 5283, 109, -516.074, 124.92, -91.2108, 4.82409, 7200, 7200, 0, 0, 0, 0), -- Nightmare Wanderer
(@CGUID+126, 5291, 109, -399.046, 209.403, -90.8796, 3.34538, 7200, 7200, 0, 0, 0, 0), -- Hakkari Frostwing
(@CGUID+127, 5291, 109, -378.717, 251.202, -90.8439, 2.56862, 7200, 7200, 0, 0, 0, 0), -- Hakkari Frostwing
(@CGUID+128, 5291, 109, -380.593, 270.517, -90.83, 3.83625, 7200, 7200, 0, 0, 0, 0), -- Hakkari Frostwing
(@CGUID+129, 5291, 109, -488.499, 273.113, -90.7271, 5.83116, 7200, 7200, 0, 0, 0, 0), -- Hakkari Frostwing
(@CGUID+130, 5291, 109, -471.309, 297.133, -90.6995, 5.01434, 7200, 7200, 0, 0, 0, 0), -- Hakkari Frostwing
(@CGUID+131, 5291, 109, -555.544, 270.643, -90.8346, 5.27195, 7200, 7200, 0, 0, 0, 0), -- Hakkari Frostwing
(@CGUID+132, 5291, 109, -535.628, 203.112, -90.9058, 1.4667, 7200, 7200, 0, 0, 0, 0), -- Hakkari Frostwing
(@CGUID+133, 5708, 109, -369.819, 85.5733, -148.802, 3.21424, 1000000, 1000000, 0, 0, 0, 2), -- Spawn of Hakkar
(@CGUID+134, 5709, 109, -658.379, -35.7623, -90.8352, 1.57592, 1000000, 1000000, 0, 0, 0, 0), -- Shade of Eranikus
(@CGUID+135, 5710, 109, -425.894, -86.0747, -88.224, 3.11157, 1000000, 1000000, 0, 0, 0, 0), -- Jammal'an the Prophet
(@CGUID+136, 5711, 109, -425.694, -93.5241, -88.224, 2.51817, 1000000, 1000000, 0, 0, 0, 0), -- Ogom the Wretched
(@CGUID+137, 5712, 109, -528.646, 130.163, -66.7533, 5.66229, 1000000, 1000000, 0, 0, 0, 0), -- Zolo
(@CGUID+138, 5713, 109, -527.969, 59.4516, -66.7188, 0.397759, 1000000, 1000000, 0, 0, 0, 0), -- Gasher
(@CGUID+139, 5714, 109, -466.655, 24.4261, -66.7908, 1.5515, 1000000, 1000000, 0, 0, 0, 0), -- Loro
(@CGUID+140, 5715, 109, -405.506, 60.4569, -67.0678, 2.57409, 1000000, 1000000, 0, 0, 0, 0), -- Hukku
(@CGUID+141, 5716, 109, -467.396, 165.997, -66.7027, 4.7096, 1000000, 1000000, 0, 0, 0, 0), -- Zul'Lor
(@CGUID+142, 5717, 109, -406.189, 131.068, -66.9138, 3.68072, 1000000, 1000000, 0, 0, 0, 0), -- Mijan
(@CGUID+143, 5719, 109, -667.59, 103.111, -90.8313, 6.18358, 1000000, 1000000, 0, 0, 0, 2), -- Morphaz
(@CGUID+144, 5722, 109, -667.359, 80.803, -90.8326, 0.112455, 1000000, 1000000, 0, 0, 0, 2), -- Hazzas
(@CGUID+145, 8311, 109, -506.616, 183.867, -147.307, 1.93089, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+146, 8311, 109, -490.377, 149.741, -147.768, 3.69646, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+147, 8311, 109, -510.948, 181.021, -148.802, 6.10999, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+148, 8311, 109, -546.35, 151.003, -147.526, 4.48893, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+149, 8311, 109, -555.539, 131.459, -148.802, 0.993906, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+150, 8311, 109, -533.006, 115.369, -148.805, 2.70607, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+151, 8311, 109, -517.782, 98.4696, -148.742, 3.21658, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+152, 8311, 109, -524.655, 90.3218, -148.743, 1.44944, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+153, 8311, 109, -562.351, 101.242, -148.802, 1.35204, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+154, 8311, 109, -568.104, 106.208, -148.802, 5.94583, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+155, 8311, 109, -558.676, 107.74, -147.236, 2.93383, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+156, 8311, 109, -566.167, 104.666, -148.802, 0.725287, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+157, 8311, 109, -490.3, 42.7803, -148.744, 2.90556, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+158, 8311, 109, -499.616, 46.49, -148.744, 0.113466, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+159, 8311, 109, -520.316, 26.81, -148.802, 4.21953, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+160, 8311, 109, -519.67, 16.1979, -147.236, 2.69036, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+161, 8311, 109, -522.688, 18.6743, -148.802, 6.27964, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+162, 8311, 109, -527.713, 20.5194, -148.802, 1.79422, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+163, 8311, 109, -526.129, 15.5934, -148.802, 2.11938, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+164, 8311, 109, -434.003, 1.58256, -148.802, 0.782628, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+165, 8311, 109, -425.072, 9.87226, -148.802, 2.36521, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+166, 8311, 109, -431.558, 8.57298, -148.802, 0.821899, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+167, 8311, 109, -433.708, 7.27427, -148.802, 0.947562, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+168, 8311, 109, -426.633, 3.14311, -148.802, 2.9896, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+169, 8311, 109, -398.828, 26.548, -148.802, 3.30533, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+170, 8311, 109, -505.355, 180.341, -148.802, 1.9144, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+171, 8311, 109, -301.759, 115.811, -173.003, 0.450819, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+172, 8311, 109, -513.666, 120.161, -173.293, 0.628289, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+173, 8311, 109, -510.294, 114.76, -174.013, 0.925957, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+174, 8311, 109, -509.183, 125.616, -173.458, 3.47065, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+175, 8311, 109, -463.926, 156.711, -172.294, 4.63305, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+176, 8311, 109, -471.406, 150.717, -172.939, 5.11999, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+177, 8311, 109, -466.626, 145.242, -173.551, 3.13686, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+178, 8311, 109, -461.322, 145.554, -173.521, 2.12763, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+179, 8311, 109, -424.676, 122.525, -173.485, 0.439019, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+180, 8311, 109, -418.175, 120.787, -172.939, 2.04909, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+181, 8311, 109, -422.839, 117.392, -173.622, 1.20478, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+182, 8311, 109, -507.2, 67.0389, -173.854, 3.48009, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+183, 8311, 109, -513.006, 69.0376, -173.357, 1.54015, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+184, 8311, 109, -508.668, 61.9109, -173.368, 2.67427, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+185, 8311, 109, -474.082, 44.395, -173.589, 1.47105, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+186, 8311, 109, -478.183, 41.077, -173.081, 1.37051, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+187, 8311, 109, -484.906, 47.7435, -173.594, 4.62442, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+188, 8311, 109, -480.789, 47.3489, -173.862, 3.38742, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+189, 8311, 109, -402.951, 95.0555, -172.932, 4.60008, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+190, 8311, 109, -409.898, 94.0353, -172.938, 1.41765, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+191, 8311, 109, -404.685, 89.4919, -172.932, 2.41039, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+192, 8311, 109, -398.033, 93.8167, -172.932, 0.596907, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+193, 8311, 109, -295.638, 111.639, -173.003, 1.25585, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+194, 8311, 109, -301.55, 109.374, -173.003, 0.313375, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+195, 8311, 109, -498.664, 140.685, -148.743, 6.18775, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+196, 8311, 109, -413.007, 176.775, -148.802, 5.58064, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+197, 8311, 109, -407.55, 170.645, -147.236, 3.29984, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+198, 8311, 109, -404.538, 162.317, -148.802, 2.86159, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+199, 8311, 109, -406.115, 168.452, -148.802, 2.86159, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+200, 8311, 109, -444.126, 140.309, -148.741, 1.05361, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+201, 8311, 109, -439.041, 144.648, -147.602, 5.47225, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+202, 8311, 109, -415.212, 99.3122, -147.77, 5.45891, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+203, 8311, 109, -413.32, 91.8947, -148.742, 4.31616, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+204, 8311, 109, -376.929, 84.2918, -148.802, 4.8675, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+205, 8311, 109, -375.648, 85.2238, -148.802, 0.980567, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+206, 8311, 109, -372.954, 87.8929, -147.426, 5.07171, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+207, 8311, 109, -371.254, 81.8927, -147.738, 6.25452, 7200, 7200, 0, 0, 0, 0), -- Slime Maggot
(@CGUID+208, 8318, 109, -367.639, 12.3524, -148.713, 1.81071, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+209, 8318, 109, -375.791, 12.885, -148.793, 1.31984, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+210, 8318, 109, -329.908, 149.089, -69.4878, 2.67134, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+211, 8318, 109, -378.075, 141.524, -53.9463, 4.75178, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+212, 8318, 109, -382.535, 141.908, -53.9463, 4.7832, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+213, 8318, 109, -381.674, 55.3761, -53.9463, 0.998201, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+214, 8318, 109, -438.797, 8.83912, -53.9463, 5.81977, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+215, 8318, 109, -430.725, 3.5262, -53.9463, 1.63673, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+216, 8318, 109, -481.333, -0.0372205, -53.9463, 0.266214, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+217, 8318, 109, -486.34, 6.38944, -53.9463, 3.60416, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+218, 8318, 109, -529.98, 24.9148, -53.9463, 5.97527, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+219, 8318, 109, -529.816, 18.2607, -53.9463, 2.16687, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+220, 8318, 109, -557.775, 61.763, -53.9463, 4.79208, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+221, 8318, 109, -557.19, 54.4363, -53.9463, 4.79208, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+222, 8318, 109, -438.18, 189.796, -53.9463, 3.10119, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+223, 8318, 109, -444.5, 185.774, -53.9463, 2.84594, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+224, 8318, 109, -578.458, 179.905, -69.4013, 3.89918, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+225, 8318, 109, -572.55, 187.132, -69.4013, 4.07982, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+226, 8318, 109, -356.844, 13.1748, -69.3923, 4.61004, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+227, 8318, 109, -601.994, 52.978, -69.3528, 5.3216, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+228, 8318, 109, -596.574, 44.2668, -69.3528, 2.95519, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+229, 8318, 109, -338.75, 143.612, -69.4879, 2.08416, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+230, 8318, 109, -388.048, 158.154, -53.9463, 5.62754, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+231, 8318, 109, -394.102, 156.187, -53.9463, 5.62754, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+232, 8318, 109, -478.726, 188.278, -53.9463, 3.33497, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+233, 8318, 109, -483.168, 189.219, -53.9463, 3.25722, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+234, 8318, 109, -521.721, 176.216, -54.0949, 3.62871, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+235, 8318, 109, -526.877, 167.686, -54.0949, 2.548, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+236, 8318, 109, -578.834, 193.659, -69.4013, 4.69292, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+237, 8318, 109, -574.913, 189.46, -69.4013, 4.64187, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+238, 8318, 109, -559.446, 136.579, -53.9465, 0.682749, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+239, 8318, 109, -552.025, 135.648, -53.9465, 0.792705, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+240, 8318, 109, -557.234, 133.695, -53.9465, 0.81234, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+241, 8318, 109, -596.048, 45.1776, -69.3528, 5.53965, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+242, 8318, 109, -603.445, 51.9793, -69.3528, 5.53965, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+243, 8318, 109, -481.459, -4.11243, -53.9463, 0.0402737, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+244, 8318, 109, -359.015, -3.4845, -69.3923, 1.82862, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+245, 8318, 109, -380.064, 43.3977, -53.9455, 4.25551, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+246, 8318, 109, -385.074, 49.8669, -53.9455, 4.25551, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+247, 8318, 109, -367.877, 78.0381, -53.9455, 1.95193, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+248, 8318, 109, -374.295, 77.534, -53.9455, 1.46891, 7200, 7200, 0, 0, 0, 0), -- Atal'ai Slave
(@CGUID+249, 8319, 109, -599.345, 87.0457, -90.8871, 0.311951, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+250, 8319, 109, -605.791, 97.6143, -90.8848, 5.9676, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+251, 8319, 109, -597.511, 84.3774, -90.8899, 2.34299, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+252, 8319, 109, -588.77, 97.1348, -90.8871, 3.40642, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+253, 8319, 109, -541.35, -67.5494, -90.8367, 2.08617, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+254, 8319, 109, -556.189, -75.0474, -90.8371, 1.78458, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+255, 8319, 109, -561.843, -75.0713, -90.8384, 0.712507, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+256, 8319, 109, -556.717, -58.0294, -90.844, 5.50344, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+257, 8319, 109, -516.262, -5.21464, -90.8829, 2.1197, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+258, 8319, 109, -512.418, 4.69133, -90.8829, 4.82933, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+259, 8319, 109, -517.08, 8.97851, -90.8829, 0.603882, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+260, 8319, 109, -409.042, 87.9432, -91.1964, 0.466443, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+261, 8319, 109, -404.823, 98.7564, -91.0953, 2.43858, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+262, 8319, 109, -398.212, 91.0003, -90.9189, 2.43072, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+263, 8319, 109, -391.624, 98.5669, -90.8776, 0.33371, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+264, 8319, 109, -385.835, 91.1061, -90.8747, 3.69522, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+265, 8319, 109, -288.008, 76.4924, -91.4671, 2.98836, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+266, 8319, 109, -500.911, 57.4209, -91.417, 1.4378, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+267, 8319, 109, -504.523, 62.5946, -91.4398, 0.431703, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+268, 8319, 109, -425.666, 25.6628, -90.8678, 2.11245, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+269, 8319, 109, -414.779, 22.272, -90.8588, 2.42583, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+270, 8319, 109, -458.554, 77.423, -93.6562, 4.09951, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+271, 8319, 109, -452.109, 70.0397, -92.5483, 3.32589, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+272, 8319, 109, -457.126, 64.4411, -91.9397, 1.41031, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+273, 8319, 109, -464.338, 74.5981, -93.5441, 5.78026, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+274, 8319, 109, -436.735, 21.87, -90.8716, 2.18097, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+275, 8319, 109, -420.157, 33.1005, -90.8658, 2.14327, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+276, 8319, 109, -506.202, 65.4164, -91.4387, 4.70553, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+277, 8319, 109, -504.561, 76.132, -90.8308, 4.03873, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+278, 8319, 109, -496.09, 75.8476, -91.3849, 1.91344, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+279, 8319, 109, -472.142, 123.972, -92.615, 3.37247, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+280, 8319, 109, -481.148, 123.774, -91.8459, 2.99626, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+281, 8319, 109, -480.66, 129.907, -91.2338, 6.23525, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+282, 8319, 109, -472.985, 134.801, -91.024, 5.11055, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+283, 8319, 109, -423.83, 121.451, -91.4011, 3.00176, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+284, 8319, 109, -435.116, 117.833, -91.0713, 1.7412, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+285, 8319, 109, -438.66, 69.3605, -91.1803, 1.80403, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+286, 8319, 109, -431.067, 78.404, -91.0223, 2.7465, 7200, 7200, 0, 0, 0, 0), -- Nightmare Whelp
(@CGUID+287, 8384, 109, -510.957, 186.878, -148.802, 5.14474, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+288, 8384, 109, -521.151, 90.4728, -148.741, 2.20734, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+289, 8384, 109, -521.044, 102.285, -148.743, 3.88653, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+290, 8384, 109, -569.687, 101.871, -148.802, 6.16495, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+291, 8384, 109, -563.259, 109.207, -148.802, 4.29571, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+292, 8384, 109, -527.568, 18.2762, -148.802, 0.469254, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+293, 8384, 109, -430.339, 4.36264, -148.802, 0.998612, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+294, 8384, 109, -515.758, 123.722, -172.939, 5.88575, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+295, 8384, 109, -468.431, 151.671, -172.939, 5.08858, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+296, 8384, 109, -415.387, 117.089, -172.939, 2.93816, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+297, 8384, 109, -421.219, 125.943, -172.939, 4.51681, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+298, 8384, 109, -516.026, 66.2658, -172.939, 0.0455403, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+299, 8384, 109, -466.495, 39.6715, -172.939, 4.24194, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+300, 8384, 109, -425.686, 88.5654, -176.075, 0.649529, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+301, 8384, 109, -405.939, 99.1431, -172.934, 5.87635, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+302, 8384, 109, -372.958, 90.3818, -172.937, 0.592196, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+303, 8384, 109, -412.017, 168.428, -148.802, 1.38111, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+304, 8384, 109, -418.784, 171.724, -148.802, 6.15084, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+305, 8384, 109, -434.538, 137.705, -148.742, 2.60241, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+306, 8384, 109, -411.052, 100.104, -148.743, 5.08113, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+307, 8384, 109, -373.072, 77.3239, -148.802, 1.41254, 7200, 7200, 0, 0, 0, 0), -- Deep Lurker
(@CGUID+308, 15593, 109, -415.042, 7.16811, -90.854, 2.2162, 25, 25, 0, 0, 0, 0); -- Elder Starsong

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 148418, 109, -435.417, 248.872, -90.8275, 2.40799, 0, 0, 0.933479, 0.358632, 180, 180, 100, 1), -- Eternal Flame
(@OGUID+2, 148419, 109, -499.066, 248.605, -90.8275, 0.659252, 0, 0, 0.323689, 0.946163, 180, 180, 100, 1), -- Eternal Flame
(@OGUID+3, 148420, 109, -499.108, 303.472, -90.8275, 5.535, 0, 0, 0.365427, -0.93084, 180, 180, 100, 1), -- Eternal Flame
(@OGUID+4, 148421, 109, -434.857, 303.821, -90.8264, 3.84954, 0, 0, 0.938003, -0.346627, 180, 180, 100, 1), -- Eternal Flame
(@OGUID+5, 148512, 109, -634.352, -51.915, -90.8352, 2.11185, 0, 0, 0.870356, 0.492424, 120, 120, 0, 1), -- Essence Font
(@OGUID+6, 148830, 109, -515.553, 95.2582, -148.74, -1.50098, 0, 0, 0.681998, -0.731354, 180, 180, 100, 1), -- Atal'ai Statue
(@OGUID+7, 148831, 109, -419.849, 94.4837, -148.74, 1.53589, 0, 0, 0.694658, 0.71934, 180, 180, 100, 1), -- Atal'ai Statue
(@OGUID+8, 148832, 109, -491.4, 135.97, -148.74, -2.68781, 0, 0, 0.97437, -0.224951, 180, 180, 100, 1), -- Atal'ai Statue
(@OGUID+9, 148833, 109, -491.491, 53.4818, -148.74, -0.610865, 0, 0, 0.300706, -0.953717, 180, 180, 100, 1), -- Atal'ai Statue
(@OGUID+10, 148834, 109, -443.855, 136.101, -148.74, 2.53073, 0, 0, 0.953717, 0.300706, 180, 180, 100, 1), -- Atal'ai Statue
(@OGUID+11, 148835, 109, -443.417, 53.8312, -148.74, 0.471239, 0, 0, 0.233445, 0.97237, 180, 180, 100, 1), -- Atal'ai Statue
(@OGUID+12, 148836, 109, -420.848, 94.7487, -174.196, 3.14159, 0, 0, 1, 0, 120, 120, 0, 1), -- Altar of Hakkar
(@OGUID+13, 148838, 109, -476.2693, 94.41199, -189.7297, 1.588249, 0, 0, 0, 0, -43200, -43200, 0, 1), -- Idol of Hakkar
(@OGUID+14, 148883, 109, -515.68, 95.1875, -148.74, -0.139624, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light SMALL (DND)
(@OGUID+15, 148883, 109, -419.627, 94.2566, -148.74, 2.04204, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light SMALL (DND)
(@OGUID+16, 148883, 109, -491.417, 136.021, -148.74, 0.872664, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light SMALL (DND)
(@OGUID+17, 148883, 109, -491.569, 53.2322, -148.74, -2.33874, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light SMALL (DND)
(@OGUID+18, 148883, 109, -443.952, 136.128, -148.74, 0.209439, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light SMALL (DND)
(@OGUID+19, 148883, 109, -443.355, 53.7631, -148.74, 2.37364, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light SMALL (DND)
(@OGUID+20, 148937, 109, -491.682, 52.1352, -173.66, -2.426, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light BIG (DND)
(@OGUID+21, 148937, 109, -414.995, 94.9034, -172.939, -0.139624, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light BIG (DND)
(@OGUID+22, 148937, 109, -443.315, 137.201, -173.656, 0.209439, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light BIG (DND)
(@OGUID+23, 148937, 109, -492.192, 137.129, -173.643, -2.33874, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light BIG (DND)
(@OGUID+24, 148937, 109, -516.554, 94.296, -173.651, -2.426, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light BIG (DND)
(@OGUID+25, 148937, 109, -442.858, 52.5523, -173.662, 2.04204, 0, 0, 0, 1, -43200, -43200, 255, 1), -- Atal'ai Light BIG (DND)
(@OGUID+26, 148998, 109, -451.389, 272.707, -90.8275, 2.49582, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+27, 148998, 109, -467.622, 290.573, -90.8275, 0.523598, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+28, 148998, 109, -477.915, 285.49, -90.8275, -1.97222, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+29, 148998, 109, -456.843, 261.305, -90.8275, 0.715585, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+30, 148998, 109, -467.861, 257.761, -90.8275, -3.12412, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+31, 148998, 109, -456.914, 286.912, -90.8275, 1.09956, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+32, 148998, 109, -482.814, 271.267, -90.8275, -0.017452, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+33, 148998, 109, -476.698, 260.68, -90.8275, -1.23918, 0, 0, 0, 1, -1800, -1800, 255, 1), -- Evil God Summoning Circle
(@OGUID+34, 149431, 109, -518.154, -85.2353, -74.488, 3.14159, 0, 0, 1, 0, 180, 180, 255, 1), -- forcefield
(@OGUID+35, 149432, 109, -518.381, 276.621, -90.8977, 3.14159, 0, 0, 1, 0, 180, 180, 100, 0), -- DOOR1
(@OGUID+36, 149433, 109, -415.713, 276.621, -90.8977, 3.14159, 0, 0, 1, 0, 180, 180, 100, 0), -- DOOR2
(@OGUID+37, 177484, 109, -515.0457, 95.14713, -148.74, 2.740162, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+38, 177484, 109, -420.1555, 94.37312, -148.7402, -2.321287, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+39, 177484, 109, -490.9691, 135.7142, -148.74, 0.2268925, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+40, 177484, 109, -491.3964, 53.57865, -148.7404, -0.4712385, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+41, 177484, 109, -444.4482, 136.1064, -148.7402, 0.3316107, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+42, 177484, 109, -443.55, 53.9243, -148.7402, 0.9075702, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+43, 177485, 109, -515.0457, 95.14713, -148.74, 2.740162, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+44, 177485, 109, -420.1555, 94.37312, -148.7402, -2.321287, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+45, 177485, 109, -490.9691, 135.7142, -148.74, 0.2268925, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+46, 177485, 109, -491.3964, 53.57865, -148.7404, -0.4712385, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+47, 177485, 109, -444.4482, 136.1064, -148.7402, 0.3316107, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+48, 177485, 109, -443.55, 53.9243, -148.7402, 0.9075702, 0, 0, 0, 0, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+49, 148422, 109, -467.09, 276.58, -90.47, 0, 0, 0, 0, 0, 180, 180, 0, 1), -- Evil God Spell Focus (DND)
(@OGUID+50, 148837, 109, -490.969, 135.714, -148.74, 0.226892, 0, 0, 0, 1, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+51, 148837, 109, -420.155, 94.3731, -148.74, -2.32129, 0, 0, 0, 1, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+52, 148837, 109, -515.046, 95.1471, -148.74, 2.74016, 0, 0, 0, 1, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+53, 148837, 109, -491.396, 53.5787, -148.74, -0.471238, 0, 0, 0, 1, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+54, 148837, 109, -443.55, 53.9243, -148.74, 0.90757, 0, 0, 0, 1, 180, 180, 255, 1), -- Atal'ai Statue
(@OGUID+55, 148837, 109, -444.448, 136.106, -148.74, 0.331611, 0, 0, 0, 1, 180, 180, 255, 1); -- Atal'ai Statue

-- ======
-- EVENTS
-- ======

INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(@CGUID+308, 7); -- Elder Starsong (Lunar Festival)

-- INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES

-- =======
-- POOLING
-- =======

-- INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@PGUID+0, 1, 'Atal\'ai Statue (Group 1)'),
(@PGUID+1, 1, 'Atal\'ai Statue (Group 2)'),
(@PGUID+2, 1, 'Atal\'ai Statue (Group 3)'),
(@PGUID+3, 1, 'Atal\'ai Statue (Group 4)'),
(@PGUID+4, 1, 'Atal\'ai Statue (Group 5)'),
(@PGUID+5, 1, 'Atal\'ai Statue (Group 6)');

-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@OGUID+37, @PGUID+0, 0, 'Atal\'ai Statue (Group 1)'),
(@OGUID+43, @PGUID+0, 0, 'Atal\'ai Statue (Group 1)'),
(@OGUID+52, @PGUID+0, 0, 'Atal\'ai Statue (Group 1)'),
(@OGUID+38, @PGUID+1, 0, 'Atal\'ai Statue (Group 2)'),
(@OGUID+44, @PGUID+1, 0, 'Atal\'ai Statue (Group 2)'),
(@OGUID+51, @PGUID+1, 0, 'Atal\'ai Statue (Group 2)'),
(@OGUID+39, @PGUID+2, 0, 'Atal\'ai Statue (Group 3)'),
(@OGUID+45, @PGUID+2, 0, 'Atal\'ai Statue (Group 3)'),
(@OGUID+50, @PGUID+2, 0, 'Atal\'ai Statue (Group 3)'),
(@OGUID+40, @PGUID+3, 0, 'Atal\'ai Statue (Group 4)'),
(@OGUID+46, @PGUID+3, 0, 'Atal\'ai Statue (Group 4)'),
(@OGUID+53, @PGUID+3, 0, 'Atal\'ai Statue (Group 4)'),
(@OGUID+41, @PGUID+4, 0, 'Atal\'ai Statue (Group 5)'),
(@OGUID+47, @PGUID+4, 0, 'Atal\'ai Statue (Group 5)'),
(@OGUID+55, @PGUID+4, 0, 'Atal\'ai Statue (Group 5)'),
(@OGUID+42, @PGUID+5, 0, 'Atal\'ai Statue (Group 6)'),
(@OGUID+48, @PGUID+5, 0, 'Atal\'ai Statue (Group 6)'),
(@OGUID+54, @PGUID+5, 0, 'Atal\'ai Statue (Group 6)');

-- INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- =========
-- DBSCRIPTS
-- =========

INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(849701, 0, 20, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Switch to idle movement'),
(849701, 2000, 15, 12623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nightmare Suppressor - Cast Suppression on Shade of Hakkar');
-- INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_go_template_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_relay` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_event` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_spell` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES

DELETE FROM dbscripts_on_gossip WHERE id=1288;
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1288, 1000, 9, @OGUID+14, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'AtalarionStatues S - rough script, details missing'),
(1288, 11000, 9, @OGUID+15, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'AtalarionStatues N'),
(1288, 22000, 9, @OGUID+16, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'AtalarionStatues SW'),
(1288, 33000, 9, @OGUID+17, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'AtalarionStatues SE'),
(1288, 44000, 9, @OGUID+18, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'AtalarionStatues NW'),
(1288, 55000, 9, @OGUID+19, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'AtalarionStatues NE');

-- INSERT INTO `dbscripts_on_quest_start` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscripts_on_quest_end` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- INSERT INTO `dbscript_string` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
-- INSERT INTO `dbscript_random_templates` (`id`, `type`, `target_id`, `chance`, `comments`) VALUES


