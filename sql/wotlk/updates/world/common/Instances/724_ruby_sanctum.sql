/* DBScriptData
DBName: The Ruby Sanctum
DBScriptName: instance_ruby_sanctum.sql
DB%Complete: 100%
DBComment: ReQ:
EndDBScriptData */

SET @CGUID := 7240000; -- creatures
SET @OGUID := 7240000; -- gameobjects
SET @PGUID := 52600;   -- pools

-- texts
-- 2000029400 - 2000029599 Reserved
SET @TGUID := 2000029400;



-- =========
-- CREATURES
-- =========

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
-- Crystal Channel Target 26712
(@CGUID+1,26712,724,15,1,0,0,3154.3455,366.57465,89.19946,1.62,604800,604800,0,0,4050,0,0,0),
-- General Zarithrian 39746
(@CGUID+2,39746,724,15,1,0,0,3049.7,528.125,89.5219,0,604800,604800,0,0,4141665,0,0,0),
-- Saviana Ragefire 39747
(@CGUID+3,39747,724,15,1,0,0,3151.39,636.852,78.7396,0,604800,604800,0,0,4183500,0,0,0),
-- Baltharus the Warborn 39751
(@CGUID+4,39751,724,15,1,0,0,3153.06,389.486,86.2596,5.63741,604800,604800,0,0,3486250,0,0,2),
-- Halion Controller 40146
(@CGUID+5,40146,724,15,33,0,0,3156.0374,533.2656,72.972046,0,604800,604800,0,0,0,0,0,0),
-- Charscale Invoker 40417
(@CGUID+6,40417,724,15,1,0,0,3093.093,438.811,78.59,0.538,604800,604800,0,0,539200,109920,0,0),
(@CGUID+7,40417,724,15,1,0,0,3238.503,618.094,78.686,1.812,604800,604800,0,0,539200,109920,0,0),
(@CGUID+8,40417,724,15,1,0,0,3088.506,434.934,78.639,0.538,604800,604800,0,0,539200,109920,0,0),
(@CGUID+9,40417,724,15,1,0,0,3280.63,596.832,83.3021,5.14872,604800,604800,0,0,539200,109920,0,0),
(@CGUID+10,40417,724,15,1,0,0,3268.57,589.602,83.3212,5.65487,604800,604800,0,0,539200,109920,0,0),
(@CGUID+11,40417,724,15,1,0,0,3246.88,620.167,78.787,2.33637,604800,604800,0,0,539200,109920,0,0),
(@CGUID+12,40417,724,15,1,0,0,3108.78,549.15,73.1245,5.00733,604800,604800,0,0,539200,109920,0,0),
(@CGUID+13,40417,724,15,1,0,0,3104.05,545.265,73.4996,5.00797,604800,604800,0,0,539200,109920,0,0),
(@CGUID+14,40417,724,15,1,0,0,3253.255,442.04,78.645,4.665,604800,604800,0,0,539200,109920,0,2), -- waypoints
(@CGUID+15,40417,724,15,1,0,0,3262.91,479.628,80.026,1.50098,604800,604800,0,0,539200,109920,0,0),
(@CGUID+16,40417,724,15,1,0,0,3248.99,481.622,80.5851,1.44862,604800,604800,0,0,539200,109920,0,0),
(@CGUID+17,40417,724,10,1,0,0,3256.13,450.198,78.5031,4.57509,604800,604800,0,0,539200,109920,0,0), -- 25 normal & 25 heroic
(@CGUID+18,40417,724,10,1,0,0,3086.98,447.786,78.5682,0.648862,604800,604800,0,0,539200,109920,0,0), -- 25 normal & 25 heroic
(@CGUID+19,40417,724,10,1,0,0,3083.47,442.524,78.499,0.684205,604800,604800,0,0,539200,109920,0,0), -- 25 normal & 25 heroic
(@CGUID+20,40417,724,10,1,0,0,3115.84,542.029,72.9214,4.96855,604800,604800,0,0,539200,109920,0,0), -- 25 normal & 25 heroic
(@CGUID+21,40417,724,10,1,0,0,3107.01,539.414,73.2172,4.83761,604800,604800,0,0,539200,109920,0,0), -- 25 normal & 25 heroic
(@CGUID+22,40417,724,10,1,0,0,3254.51,471.26,79.4358,1.50098,604800,604800,0,0,539200,109920,0,0), -- 25 normal & 25 heroic
(@CGUID+23,40417,724,10,1,0,0,3269.8,601.389,81.3356,5.37561,604800,604800,0,0,539200,109920,0,0), -- 25 normal & 25 heroic
-- Charscale Assaulter 40419
(@CGUID+24,40419,724,15,1,0,0,3084.11,451.236,78.8196,0.39066,604800,604800,0,0,674050,0,0,0),
(@CGUID+25,40419,724,15,1,0,0,3079.3,447.892,78.7029,0.050805,604800,604800,0,0,674050,0,0,0),
(@CGUID+26,40419,724,15,1,0,0,3240.49,624.401,78.7337,2.59941,604800,604800,0,0,674050,0,0,2), -- waypoints
(@CGUID+27,40419,724,5,1,0,0,3269.8,601.389,81.3356,5.37561,604800,604800,0,0,674050,0,0,0), -- 10 normal & 10 heroic only
(@CGUID+28,40419,724,15,1,0,0,3118.77,543.828,72.9687,5.00957,604800,604800,0,0,674050,0,0,0),
(@CGUID+29,40419,724,15,1,0,0,3114.88,548.556,72.9687,5.008,604800,604800,0,0,674050,0,0,0),
(@CGUID+30,40419,724,15,1,0,0,3258.04,445.905,78.5902,5.5941,604800,604800,0,0,674050,0,0,0),
(@CGUID+31,40419,724,15,1,0,0,3247.12,444.918,78.5594,5.72151,604800,604800,0,0,674050,0,0,0),
(@CGUID+32,40419,724,5,1,0,0,3254.51,471.26,79.4358,1.50098,604800,604800,0,0,674050,0,0,0), -- 10 normal & 10 heroic only
(@CGUID+33,40419,724,10,1,0,0,3243.83,629.163,78.6731,2.59941,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+34,40419,724,10,1,0,0,3248.57,625.497,78.7614,2.59941,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+35,40419,724,10,1,0,0,3249.31,449.717,78.3129,4.68566,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+36,40419,724,10,1,0,0,3086.53,437.953,78.5086,0.719548,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+37,40419,724,10,1,0,0,3092.96,441.288,78.5991,0.684205,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+38,40419,724,10,1,0,0,3102.2,538.308,73.8673,4.87295,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+39,40419,724,10,1,0,0,3099.91,544.587,74.0733,4.8651,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+40,40419,724,10,1,0,0,3241,479.047,79.287,1.052,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+41,40419,724,10,1,0,0,3269.97,472.232,79.1962,1.60017,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+42,40419,724,10,1,0,0,3282.6,604.626,81.8064,4.98523,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
(@CGUID+43,40419,724,10,1,0,0,3259.61,590.356,80.8389,5.44076,604800,604800,0,0,674050,0,0,0), -- 25 normal & 25 heroic
-- Charscale Elite 40421
(@CGUID+44,40421,724,15,1,0,0,3047.01,464.252,87.8004,5.39307,604800,604800,0,0,1078480,0,0,0),
(@CGUID+45,40421,724,15,1,0,0,3067.24,591.731,82.4366,0.523599,604800,604800,0,0,1078480,0,0,0),
(@CGUID+46,40421,724,15,1,0,0,3058.69,611.661,85.6763,0.383972,604800,604800,0,0,1078480,0,0,0),
(@CGUID+47,40421,724,15,1,0,0,3031.67,448.925,88.6927,5.70723,604800,604800,0,0,1078480,0,0,0),
-- Charscale Commander 40423
(@CGUID+48,40423,724,15,1,0,0,3111.12,541.491,73.0937,5.00846,604800,604800,0,0,1078480,0,0,2), -- waypoints
(@CGUID+49,40423,724,15,1,0,0,3089.43,443.955,78.6082,0.580961,604800,604800,0,0,1078480,0,0,2), -- waypoints
-- Sanctum Guardian Xerestrasza 40429
(@CGUID+50,40429,724,15,1,0,0,3155.54,342.392,84.5968,1.72788,604800,604800,0,0,1905120,7333248,0,0),
-- Ruby Drakonid 40626
(@CGUID+51,40626,724,15,1,0,0,3215.034,434.07986,77.056984,1.06,604800,604800,0,0,0,0,0,0),
(@CGUID+52,40626,724,15,1,0,0,3274.64,470.53125,79.08942,1.76,604800,604800,0,0,0,0,0,0),
(@CGUID+53,40626,724,15,1,0,0,3078.4653,580.24133,80.74751,1.06,604800,604800,0,0,0,0,0,0),
(@CGUID+54,40626,724,15,1,0,0,3040.665,414.59375,89.87042,1.24,604800,604800,0,0,0,0,0,0),
-- Ruby Drake 40627
(@CGUID+55,40627,724,15,1,0,0,3095.0703,660.4028,78.64549,2.216,604800,604800,0,0,0,0,0,0),
(@CGUID+56,40627,724,15,1,0,0,3097.803,348.783,87.73493,1.29,604800,604800,0,0,0,0,0,0),
(@CGUID+57,40627,724,15,1,0,0,3269.177,415.86633,77.599,1.71,604800,604800,0,0,0,0,0,0),
(@CGUID+58,40627,724,15,1,0,0,3206.5652,484.31076,72.98678,0,604800,604800,0,0,0,0,0,0),
-- Ruby Scalebane 40628
(@CGUID+59,40628,724,15,1,0,0,3142.3838,384.45486,86.60331,1.15,604800,604800,0,0,0,0,0,0),
(@CGUID+60,40628,724,15,1,0,0,3179.6216,375.1059,89.68778,1.047,604800,604800,0,0,0,0,0,0),
(@CGUID+61,40628,724,15,1,0,0,3312.697,590.4948,84.76355,3.96,604800,604800,0,0,0,0,0,0),
(@CGUID+62,40628,724,15,1,0,0,3228.986,486.8559,78.89106,1.04,604800,604800,0,0,0,0,0,0),
(@CGUID+63,40628,724,15,1,0,0,3058.6926,467.27432,82.50299,5.37,604800,604800,0,0,0,0,0,0),
-- Zarithrian Spawn Stalker 39794
(@CGUID+64,39794,724,15,1,0,0,3043.97,419.8802,87.03991,0,604800,604800,0,0,0,0,0,0),
(@CGUID+65,39794,724,15,1,0,0,3062.595,636.9983,82.73768,0,604800,604800,0,0,0,0,0,0),
(@CGUID+66,39794,724,10,1,0,0,3048.83,423.545,85.7415,0,604800,604800,0,0,0,0,0,0), -- 25 normal & 25 heroic
(@CGUID+67,39794,724,10,1,0,0,3069.56,634.741,80.7767,0,604800,604800,0,0,0,0,0,0); -- 25 normal & 25 heroic

-- Addons
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(39746,0,0,1,0,0,0,NULL),
(39747,0,0,1,0,0,0,NULL),
(39751,0,0,1,0,0,0,NULL),
(40001,0,0,1,0,0,0,74629),
(40135,0,0,1,0,0,0,74803),
(40417,0,0,1,0,0,0,NULL),
(40419,0,0,1,0,0,0,NULL),
(40421,0,0,1,0,0,0,NULL),
(40423,0,0,1,0,0,0,NULL),
(40429,0,0,1,0,0,0,NULL),
(40626,0,0,1,0,0,0,29266),
(40627,0,0,1,0,0,0,29266),
(40628,0,0,1,0,0,0,29266);

-- INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES

REPLACE INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
-- Baltharus the Warborn 39751
(39751,0,1,3153.06,389.486,86.2596,5.63741,100,3975101),
(39751,0,2,3153.06,389.486,86.2596,5.63741,100,3),
-- Orb Rotation Focus 40091
(40091,0,1,3189.9229,533.3542,73.037704,0,0,0),
(40091,0,2,3182.3152,513.42017,72.977104,0,0,0),
(40091,0,3,3177.1685,504.38022,72.727104,0,0,0),
(40091,0,4,3167.8784,496.83682,72.50312,0,0,0),
(40091,0,5,3152.2378,490.4705,72.62009,0,0,0),
(40091,0,6,3138.1736,499.30557,72.87009,0,0,0),
(40091,0,7,3126.8298,506.07986,72.955154,0,0,0),
(40091,0,8,3120.6797,515.3524,72.955154,0,0,0),
(40091,0,9,3113.711,533.5382,72.96869,0,0,0),
(40091,0,10,3117.5903,547.79517,72.96869,0,0,0),
(40091,0,11,3127.461,558.73956,72.96869,0,0,0),
(40091,0,12,3138.0417,567.9514,72.98305,0,0,0),
(40091,0,13,3154.0903,574.96356,72.98305,0,0,0),
(40091,0,14,3172.5652,567.49304,72.86058,0,0,0),
(40091,0,15,3181.981,555.8889,72.912704,0,0,0),
-- Sanctum Guardian Xerestrasza 40429
(40429,0,1,3155.54,342.39,84.59,1.88,1000,4042901),
(40429,0,2,3152.32,359.41,85.3,1.88,0,4042902),
(40429,0,3,3152.07,383.93,86.33,1.88,1000,4042903);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
-- @CGUID+49
(@CGUID+49,1,3103.27,453.02,76.1669,100,0,0),
(@CGUID+49,2,3108.31,456.607,73.5273,100,0,0),
(@CGUID+49,3,3125.23,467.658,72.172,100,0,0),
(@CGUID+49,4,3135.31,470.177,72.3358,100,0,0),
(@CGUID+49,5,3151.59,473.916,72.1636,100,0,0),
(@CGUID+49,6,3125.86,468.045,72.1565,100,0,0),
(@CGUID+49,7,3109.15,457.247,73.1827,100,0,0),
(@CGUID+49,8,3103.49,453.311,76.0002,100,0,0),
(@CGUID+49,9,3088.69,443.238,78.6341,100,0,0),
(@CGUID+49,10,3062.77,440.725,81.3819,100,0,0),
(@CGUID+49,11,3062.35,422.206,82.8136,100,0,0),
(@CGUID+49,12,3080.48,414.468,81.2414,100,0,0),
(@CGUID+49,13,3092.77,407.49,82.5253,100,0,0),
(@CGUID+49,14,3106.35,398.791,84.8449,100,0,0),
(@CGUID+49,15,3093,407.4,82.5604,100,0,0),
(@CGUID+49,16,3081.02,414.218,81.2243,100,0,0),
(@CGUID+49,17,3062.48,421.936,82.8223,100,0,0),
(@CGUID+49,18,3062.45,440.6,81.4685,100,0,0),
(@CGUID+49,19,3087.51,442.808,78.5996,100,0,0),
-- @CGUID+48
(@CGUID+48,1,3105.49,560.436,73.3521,100,0,0),
(@CGUID+48,2,3099.11,581.79,74.1737,100,0,0),
(@CGUID+48,3,3089.46,605.803,77.2488,100,0,0),
(@CGUID+48,4,3102.92,615.48,78.4669,100,0,0),
(@CGUID+48,5,3089.32,606.204,77.3106,100,0,0),
(@CGUID+48,6,3095.02,590.479,75.364,100,0,0),
(@CGUID+48,7,3099.32,581.671,74.1361,100,0,0),
(@CGUID+48,8,3104.41,564.418,73.3304,100,0,0),
(@CGUID+48,9,3111.79,539.934,72.989,100,0,0),
-- @CGUID+26
(@CGUID+26,1,3232.66,629.482,78.7012,100,0,0),
(@CGUID+26,2,3219.03,633.231,78.8808,100,0,0),
(@CGUID+26,3,3203.64,633.594,78.8666,100,0,0),
(@CGUID+26,4,3193.29,628.784,79.0425,100,0,0),
(@CGUID+26,5,3197.37,631.065,79.118,100,0,0),
(@CGUID+26,6,3202.84,633.439,78.901,100,0,0),
(@CGUID+26,7,3218.33,633.329,78.8941,100,0,0),
(@CGUID+26,8,3232.21,629.621,78.7005,100,0,0),
(@CGUID+26,9,3251.29,618.286,78.7574,100,0,0),
(@CGUID+26,10,3245.23,610.277,78.7262,100,0,0),
(@CGUID+26,11,3238.97,600.92,78.868,100,0,0),
(@CGUID+26,12,3233.13,593.025,78.8227,100,0,0),
(@CGUID+26,13,3222.65,580.698,78.4698,100,0,0),
(@CGUID+26,14,3232.98,592.927,78.8173,100,0,0),
(@CGUID+26,15,3242.19,605.58,78.799,100,0,0),
(@CGUID+26,16,3251.5,618.031,78.7511,100,0,0),
(@CGUID+26,17,3239.42,625.386,78.6925,100,0,0),
-- @CGUID+14
(@CGUID+14,1,3265.77,429.114,78.2996,100,0,0),
(@CGUID+14,2,3257.67,414.864,78.259,100,0,0),
(@CGUID+14,3,3248.59,399.322,78.4915,100,0,0),
(@CGUID+14,4,3241.12,393.289,80.3271,100,0,0),
(@CGUID+14,5,3228.72,386.81,83.2787,100,0,0),
(@CGUID+14,6,3211.22,387.929,85.0837,100,0,0),
(@CGUID+14,7,3227.99,386.62,83.4269,100,0,0),
(@CGUID+14,8,3240.32,392.844,80.3709,100,0,0),
(@CGUID+14,9,3248.65,398.884,78.5829,100,0,0),
(@CGUID+14,10,3257.47,414.327,78.2804,100,0,0),
(@CGUID+14,11,3265.66,428.348,78.2597,100,0,0),
(@CGUID+14,12,3253.81,438.775,78.6559,100,0,0),
(@CGUID+14,13,3242.8,448.731,78.1249,100,0,0),
(@CGUID+14,14,3226.37,450.861,75.2547,100,0,0),
(@CGUID+14,15,3215.9,451.862,72.8143,100,0,0),
(@CGUID+14,16,3202.39,455.587,72.8472,100,0,0),
(@CGUID+14,17,3215.68,451.935,72.7879,100,0,0),
(@CGUID+14,18,3225.77,450.96,75.1227,100,0,0),
(@CGUID+14,19,3242.6,448.865,78.1013,100,0,0),
(@CGUID+14,20,3249.35,448.352,78.4007,100,0,0),
(@CGUID+14,21,3253.42,439.139,78.6541,100,0,0);

INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(39814,724,39746,16+4096,0),
(39899,724,39751,16+4096,0),
(40001,724,39863,16+4096+8192,0),
(40041,724,39863,16+4096+8192,0),
(40042,724,39863,16+4096+8192,0),
(40043,724,39863,16+4096+8192,0),
(40044,724,39863,16+4096+8192,0),
(40055,724,39863,16+4096+8192,0),
(40081,724,40142,16+4096+8192,0),
(40083,724,40142,16+4096+8192,0),
(40091,724,40142,16+4096+8192,0),
(40100,724,40142,16+4096+8192,0),
(40135,724,40142,16+4096+8192,0),
(40468,724,40142,16+4096+8192,0),
(40469,724,40142,16+4096+8192,0),
(40681,724,39863,16+4096+8192,0),
(40683,724,39863,16+4096+8192,0);

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
-- 2x Charscale Invoker & 2x Charscale Assaulter linked to Charscale Commander
(@CGUID+6,@CGUID+49,1+2+512),
(@CGUID+8,@CGUID+49,1+2+512),
(@CGUID+24,@CGUID+49,1+2+512),
(@CGUID+25,@CGUID+49,1+2+512),
(@CGUID+18,@CGUID+49,1+2+512), -- 25 normal & 25 heroic
(@CGUID+19,@CGUID+49,1+2+512), -- 25 normal & 25 heroic
(@CGUID+36,@CGUID+49,1+2+512), -- 25 normal & 25 heroic
(@CGUID+37,@CGUID+49,1+2+512), -- 25 normal & 25 heroic
-- 2x Charscale Invoker & 2x Charscale Assaulter linked to Charscale Commander
(@CGUID+12,@CGUID+48,1+2+512),
(@CGUID+13,@CGUID+48,1+2+512),
(@CGUID+28,@CGUID+48,1+2+512),
(@CGUID+29,@CGUID+48,1+2+512),
(@CGUID+20,@CGUID+48,1+2+512), -- 25 normal & 25 heroic
(@CGUID+21,@CGUID+48,1+2+512), -- 25 normal & 25 heroic
(@CGUID+38,@CGUID+48,1+2+512), -- 25 normal & 25 heroic
(@CGUID+39,@CGUID+48,1+2+512), -- 25 normal & 25 heroic
-- 2x Charscale Invoker linked to Charscale Assaulter
(@CGUID+7,@CGUID+26,1+2+512),
(@CGUID+11,@CGUID+26,1+2+512),
(@CGUID+33,@CGUID+26,1+2+512), -- 25 normal & 25 heroic
(@CGUID+34,@CGUID+26,1+2+512), -- 25 normal & 25 heroic
-- 2x Charscale Assaulter linked to Charscale Invoker
(@CGUID+30,@CGUID+14,1+2+512),
(@CGUID+31,@CGUID+14,1+2+512),
(@CGUID+35,@CGUID+14,1+2+512), -- 25 normal & 25 heroic
(@CGUID+17,@CGUID+14,1+2+512), -- 25 normal & 25 heroic
-- 2x Charscale Invoker linked to Charscale Assaulter
(@CGUID+15,@CGUID+32,1+2),
(@CGUID+16,@CGUID+32,1+2),
-- 2x Charscale Invoker linked to Charscale Assaulter
(@CGUID+10,@CGUID+27,1+2),
(@CGUID+9,@CGUID+27,1+2);


-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
-- Fire Field 203005
(@OGUID+1,203005,724,15,1,3153.27,380.47,86.3611,1.79769,0,0,0.782607,0.622516,604800,604800,255,1),
-- Flame Walls 203006
(@OGUID+2,203006,724,15,1,3050.36,526.101,88.4061,-0.130899,0,0,-0.065403,0.997859,604800,604800,255,1),
-- Ruby Sanctum Halion Flame Ring 203007
(@OGUID+3,203007,724,15,1,3154.99,535.637,72.8887,3.14159,0,0,-1,0,604800,604800,255,0),
-- Burning Tree 203034
(@OGUID+4,203034,724,15,1,3187.96,586.766,73.563,-3.09303,0.0269089,0.00610161,-0.999321,0.0244177,604800,604800,255,1),
-- Burning Tree 203035
(@OGUID+5,203035,724,15,1,3190.34,486.561,71.1216,1.62702,-0.0320468,-0.0343475,0.725892,0.686203,604800,604800,255,1),
-- Burning Tree 203036
(@OGUID+6,203036,724,15,1,3117.12,589.134,71.3221,2.26086,0.021595,-0.0220261,0.904034,0.426347,604800,604800,255,1),
-- Burning Tree 203037
(@OGUID+7,203037,724,15,1,3108.75,484.34,71.6583,-2.23909,0,0,-0.899901,0.436093,604800,604800,255,1),
-- Halion Twilight Ring 203624
(@OGUID+8,203624,724,15,32,3157.37,533.995,72.8887,-1.4206,0,0,0,0,604800,604800,255,0),
-- Doodad_InstancePortal_Green_10Man01 204051
(@OGUID+9,204051,724,1,1,3285.26,533.114,92.2294,3.11539,0,0,0.999914,0.013102,180,180,255,1),
-- Doodad_InstancePortal_Green_10Man_Heroic01 204052
(@OGUID+10,204052,724,4,1,3285.26,533.114,92.2294,3.11539,0,0,0.999914,0.0131009,180,180,255,1),
-- Doodad_InstancePortal_Green_25Man01 204053
(@OGUID+11,204053,724,2,1,3285.26,533.114,92.2294,3.11539,0,0,0.999914,0.0131009,180,180,255,1),
-- Doodad_InstancePortal_Green_25Man_Heroic01 204054
(@OGUID+12,204054,724,8,1,3285.26,533.114,92.2294,3.11539,0,0,0.999914,0.0131009,180,180,255,1),
-- Twilight portal (phase 32) 202796
(@OGUID+13,202796,724,15,32,3141.747314453125, 510.810760498046875, 72.88869476318359375, 0, 0, 0, 0, 1, -7200, -7200, 255, 1),
(@OGUID+14,202796,724,15,32,3179.9697265625, 559.11114501953125, 72.84639739990234375, 0, 0, 0, 0, 1, -7200, -7200, 255, 1),
-- Twilight portal (phase 1) 202795
(@OGUID+15,202795,724,15,1,3142.150146484375, 559.6180419921875, 72.88871002197265625, 0, 0, 0, 0, 1, -7200, -7200, 255, 1),
(@OGUID+16,202795,724,15,1,3179.963623046875, 509.35589599609375, 72.8034820556640625, 0, 0, 0, 0, 1, -7200, -7200, 255, 1);



-- ======
-- EVENTS
-- ======

-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
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
DELETE FROM `dbscripts_on_creature_movement` WHERE `id` IN (3975101,4042901,4042902,4042903);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
-- Baltharus the Warborn 39751
(3975101,1,31,26712,30,0,0,0,0,0,0,0,0,0,0,0,0,'search for 26712'),
(3975101,100,15,76221,4,0,26712,35,1,0,0,0,0,0,0,0,0,'Cast Barrier Channel on target'),
-- Sanctum Guardian Xerestrasza 40429
(4042901,0,0,0,0,0,0,0,0,@TGUID+0,0,0,0,0,0,0,0,'Xerestrasza: 1st yell text'),
(4042902,0,0,0,0,0,0,0,0,@TGUID+1,0,0,0,0,0,0,0,'Xerestrasza: 2nd yell text'),
(4042903,0,0,0,0,0,0,0,0,@TGUID+2,0,0,0,0,0,0,0,'Xerestrasza: 3rd yell text'),
(4042903,100,20,0,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'Xerestrasza: stop movement'),
(4042903,7000,0,0,0,0,0,0,0,@TGUID+3,0,0,0,0,0,0,0,'Xerestrasza: 4th yell text'),
(4042903,18000,0,0,0,0,0,0,0,@TGUID+4,0,0,0,0,0,0,0,'Xerestrasza: 5th yell text'),
(4042903,28000,0,0,0,0,0,0,0,@TGUID+5,0,0,0,0,0,0,0,'Xerestrasza: 6th yell text'),
(4042903,38000,0,0,0,0,0,0,0,@TGUID+6,0,0,0,0,0,0,0,'Xerestrasza: 7th yell text'),
(4042903,47000,0,0,0,0,0,0,0,@TGUID+7,0,0,0,0,0,0,0,'Xerestrasza: 8th yell text'),
(4042903,54000,29,2,1,0,0,0,0x04,0,0,0,0,0,0,0,0,'Xerestrasza: set quest giver flag');

DELETE FROM `dbscript_string` WHERE `entry` BETWEEN @TGUID+0 AND @TGUID+7;
INSERT INTO `dbscript_string` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(@TGUID+0,'Thank you! I could not have held out for much longer.... A terrible thing has happened here.',17491,1,0,5,'Xerestrasza: say_epilogue_1'),
(@TGUID+1,'We believed the Sanctum was well-fortified, but we were not prepared for the nature of this assault.',17492,0,0,1,'Xerestrasza: say_epilogue_2'),
(@TGUID+2,'The Black dragonkin materialized from thin air, and set upon us before we could react.',17493,0,0,1,'Xerestrasza: say_epilogue_3'),
(@TGUID+3,'We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.',17494,0,0,1,'Xerestrasza: say_epilogue_4'),
(@TGUID+4,'They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the Sanctum.',17495,0,0,1,'Xerestrasza: say_epilogue_5'),
(@TGUID+5,'The commander of the forces on the ground here is a cruel brute named Zarithrian, but I fear there are greater powers at work.',17496,0,0,1,'Xerestrasza: say_epilogue_6'),
(@TGUID+6,'In their initial assault, I caught a glimpse of their true leader, a fearsome full-grown twilight dragon.',17497,0,0,1,'Xerestrasza: say_epilogue_7'),
(@TGUID+7,'I know not the extent of their plans, heroes, but I know this:  They cannot be allowed to succeed!',17498,0,0,5,'Xerestrasza: say_epilogue_8');

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
