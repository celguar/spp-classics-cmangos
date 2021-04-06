/* DBScriptData
DBName: Auchindoun - Auchenai Crypts
DBScriptName: -
DB%Complete: 85
DBComment:
* add ss.32460 for 18726, not for 18778 which casts 32459 by script in 1sec interval
* @CGUID+23 and @CGUID+24 channeling should stack on @CGUID+158
* Recheck Flying Raging Soul / Cosmetic Raging Soul - Spawns and Pathing 
EndDBScriptData */

SET @CGUID := 5580000; -- creatures
SET @OGUID := 5580000; -- gameobjects
SET @PGUID := 49500; -- pools

-- =========
-- CREATURES
-- =========

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(@CGUID+9, 1, 70.4428, -5.52704, -0.081998, 3.14475, 0, 0),
(@CGUID+9, 2, 68.8033, -9.17252, -0.095647, 3.96549, 0, 0),
(@CGUID+9, 3, 68.5866, -26.2573, -0.063077, 4.69513, 0, 0),
(@CGUID+9, 4, 70.6502, -28.8836, -0.064496, 5.56849, 0, 0),
(@CGUID+9, 5, 97.332, -29.0043, -0.038368, 0.037717, 0, 0),
(@CGUID+9, 6, 100.607, -25.0518, -0.034154, 1.02889, 0, 0),
(@CGUID+9, 7, 100.853, -9.91002, 0.092635, 1.53469, 0, 0),
(@CGUID+9, 8, 96.6178, -5.09689, -0.064114, 2.29495, 0, 0),
(@CGUID+11, 1, 239.482, -69.9902, 26.5912, 0, 0, 0),
(@CGUID+11, 2, 239.466, -100.007, 26.5912, 0, 0, 0),
(@CGUID+11, 3, 239.365, -125.633, 26.5912, 0, 0, 0),
(@CGUID+11, 4, 239.716, -100.183, 26.5912, 0, 0, 0),
(@CGUID+11, 5, 239.764, -70.1469, 26.5912, 0, 0, 0),
(@CGUID+11, 6, 239.557, -45.5533, 26.5912, 0, 0, 0),
(@CGUID+13, 1, -146.241, -362.348, 26.5907, 0, 0, 0),
(@CGUID+13, 2, -146.111, -341.64, 26.5907, 0, 0, 0),
(@CGUID+13, 3, -143.813, -348.902, 26.5907, 0, 0, 0),
(@CGUID+13, 4, -143.79, -363.792, 26.5907, 0, 0, 0),
(@CGUID+13, 5, -143.978, -380.805, 26.5907, 0, 0, 0),
(@CGUID+13, 6, -138.339, -385.452, 26.5907, 0, 0, 0),
(@CGUID+13, 7, -120.94, -385.288, 26.5891, 0, 0, 0),
(@CGUID+13, 8, -104.938, -385.534, 26.5891, 0, 0, 0),
(@CGUID+13, 9, -110.419, -387.719, 26.5891, 0, 0, 0),
(@CGUID+13, 10, -121.804, -387.763, 26.5891, 0, 0, 0),
(@CGUID+13, 11, -137.504, -387.664, 26.5891, 0, 0, 0),
(@CGUID+13, 12, -145.998, -380.364, 26.5896, 0, 0, 0),
(@CGUID+15, 1, 347.036, 69.5177, 9.61356, 100, 0, 0),
(@CGUID+15, 2, 345.288, 74.3537, 9.61512, 100, 0, 0),
(@CGUID+15, 3, 345.595, 89.1576, 9.62088, 100, 0, 0),
(@CGUID+15, 4, 349.788, 99.0143, 9.62279, 100, 0, 0),
(@CGUID+15, 5, 348.517, 107.245, 9.62514, 100, 0, 0),
(@CGUID+15, 6, 348.951, 114.055, 9.61723, 100, 0, 0),
(@CGUID+15, 7, 350.478, 107.565, 9.62483, 100, 0, 0),
(@CGUID+15, 8, 352.441, 99.1107, 9.62547, 100, 0, 0),
(@CGUID+15, 9, 348.928, 88.9461, 9.62212, 100, 0, 0),
(@CGUID+15, 10, 348.099, 79.5178, 9.62149, 100, 0, 0),
(@CGUID+15, 11, 351.593, 69.7604, 9.61397, 100, 0, 0),
(@CGUID+17, 1, 211.25, -32.5531, 26.5913, 0, 0, 0),
(@CGUID+17, 2, 206.558, -29.6245, 26.5913, 0, 0, 0),
(@CGUID+17, 3, 206.846, 2.9624, 26.6089, 0, 0, 0),
(@CGUID+17, 4, 208.449, 29.0183, 26.6237, 0, 0, 0),
(@CGUID+17, 5, 214.47, 31.2264, 26.6401, 0, 0, 0),
(@CGUID+17, 6, 237.969, 31.8593, 26.6358, 0, 0, 0),
(@CGUID+17, 7, 267.278, 32.2465, 13.432, 0, 0, 0),
(@CGUID+17, 8, 269.743, 29.0039, 13.4276, 0, 0, 0),
(@CGUID+17, 9, 269.483, 20.9772, 13.3957, 0, 0, 0),
(@CGUID+17, 10, 269.795, -1.88818, -0.066842, 0, 0, 0),
(@CGUID+17, 11, 269.028, 12.9737, 7.30811, 0, 0, 0),
(@CGUID+17, 12, 269.102, 22.2329, 13.419, 0, 0, 0),
(@CGUID+17, 13, 268.701, 29.0391, 13.432, 0, 0, 0),
(@CGUID+17, 14, 265.437, 32.5422, 13.4303, 0, 0, 0),
(@CGUID+17, 15, 246.648, 32.3708, 20.9473, 0, 0, 0),
(@CGUID+17, 16, 235.326, 32.1635, 26.6343, 0, 0, 0),
(@CGUID+17, 17, 214.469, 32.5403, 26.6329, 0, 0, 0),
(@CGUID+17, 18, 207.544, 25.8809, 26.6183, 0, 0, 0),
(@CGUID+17, 19, 207.02, 2.82084, 26.6086, 0, 0, 0),
(@CGUID+17, 20, 208.547, -29.5215, 26.591, 0, 0, 0),
(@CGUID+17, 21, 213.394, -33.2204, 26.591, 0, 0, 0),
(@CGUID+17, 22, 239.78, -32.5393, 26.594, 0, 0, 0),
(@CGUID+18, 1, 100.78, 8.34866, 0.160511, 4.84983, 0, 0),
(@CGUID+18, 2, 95.9644, 3.92051, -0.099093, 3.88693, 0, 0),
(@CGUID+18, 3, 71.2327, 4.84142, -0.090976, 3.07719, 0, 0),
(@CGUID+18, 4, 68.339, 8.11337, -0.097064, 2.29493, 0, 0),
(@CGUID+18, 5, 69.5207, 14.0001, -0.056235, 1.83155, 0, 0),
(@CGUID+18, 6, 69.2525, 26.6497, -0.123079, 1.55116, 0, 0),
(@CGUID+18, 7, 71.2453, 29.5185, -0.116317, 0.963682, 0, 0),
(@CGUID+18, 8, 98.258, 28.9546, -0.120986, 6.23999, 0, 0),
(@CGUID+18, 9, 100.633, 24.0382, -0.021694, 5.16242, 0, 0),
(@CGUID+23, 1, 132.2567, -19.23857, 6.386281, 0.01745329, 5000, 1849301),
(@CGUID+24, 1, 136.688, -26.0343, 9.386496, 0.6457718, 5000, 1849301),
(@CGUID+32, 1, 148.445, 30.7565, -0.10329, 3.184, 0, 0),
(@CGUID+32, 2, 144.748, 35.2066, 1.81657, 2.47164, 0, 0),
(@CGUID+32, 3, 154.812, 37.0526, 3.32337, 0.671508, 0, 0),
(@CGUID+32, 4, 152.26, 39.0965, 4.25969, 2.49599, 30000, 1849701),
(@CGUID+32, 5, 153.46, 36.7801, 3.10079, 5.2386, 0, 0),
(@CGUID+32, 6, 144.473, 30.8718, -0.101362, 3.97568, 0, 0),
(@CGUID+32, 7, 133.689, 29.9309, -0.108321, 3.14473, 0, 0),
(@CGUID+32, 8, 130.662, 26.6505, -0.127513, 3.96625, 0, 0),
(@CGUID+32, 9, 130.611, 10.2899, 0.148114, 4.71395, 0, 0),
(@CGUID+32, 10, 130.72, -1.40306, -0.012503, 4.81606, 0, 0),
(@CGUID+32, 11, 128.658, -2.39713, 0.060023, 3.59084, 0, 0),
(@CGUID+32, 12, 126.596, -4.0005, 0.177076, 3.73456, 0, 0),
(@CGUID+32, 13, 125.665, -2.92913, 0.098741, 2.26351, 8000, 0),
(@CGUID+32, 14, 125.665, -2.92913, 0.098741, 2.26351, 30000, 1849701),
(@CGUID+32, 15, 136.891, 4.36495, -0.129042, 0.593754, 0, 0),
(@CGUID+32, 16, 158.484, 3.73787, -0.127465, 6.2392, 0, 0),
(@CGUID+32, 17, 162.95, 8.04022, -0.127465, 0.81288, 0, 0),
(@CGUID+32, 18, 163.105, 27.0841, -0.059237, 1.63441, 0, 0),
(@CGUID+32, 19, 159.258, 30.1414, -0.10936, 2.47007, 0, 0),
(@CGUID+34, 1, 222.88, 13.8903, -0.075499, 3.05599, 10000, 0),
(@CGUID+34, 2, 238.567, 14.1287, -0.066652, 5.68, 10000, 0),
(@CGUID+39, 1, 102.866, -162.857, 14.9086, 0, 0, 0),
(@CGUID+39, 2, 74.6199, -162.925, 15.5006, 0, 0, 0),
(@CGUID+39, 3, 44.3247, -162.931, 15.0019, 0, 0, 0),
(@CGUID+39, 4, 74.9605, -163.193, 15.494, 0, 0, 0),
(@CGUID+39, 5, 103.282, -163.015, 14.8936, 0, 0, 0),
(@CGUID+39, 6, 142.787, -163.311, 12.5674, 0, 0, 0),
(@CGUID+39, 7, 167.955, -163.422, 26.3869, 0, 0, 0),
(@CGUID+39, 8, 143.145, -163.496, 12.564, 0, 0, 0),
(@CGUID+56, 1, 126.177, 27.9481, -0.0451297, 5.28835, 4000, 1855601),
(@CGUID+56, 2, 130.413, 14.816, -0.128968, 4.73591, 0, 0),
(@CGUID+56, 3, 133.132, 0.717417, -0.128914, 5.1286, 0, 0),
(@CGUID+56, 4, 143.315, -5.41157, 1.58459, 5.92184, 0, 0),
(@CGUID+56, 5, 158.808, -6.77153, 1.31353, 5.84487, 0, 0),
(@CGUID+56, 6, 163.114, -11.3245, 1.29405, 5.18357, 0, 0),
(@CGUID+56, 7, 166.81, -15.4839, 2.5976, 5.37599, 2000, 1),
(@CGUID+57, 1, 170.213, -18.6788, 1.89394, 6.12611, 4000, 1855601),
(@CGUID+57, 2, 184.873, -19.2238, -0.123683, 0.673793, 0, 0),
(@CGUID+57, 3, 192.66, -5.28754, -0.120491, 1.47881, 0, 0),
(@CGUID+57, 4, 193.01, 4.14019, -0.120491, 1.76234, 0, 0),
(@CGUID+57, 5, 190.2, 11.8762, -0.121558, 1.31317, 0, 0),
(@CGUID+57, 6, 191.501, 15.6137, 2.23181, 1.85266, 2000, 1),
(@CGUID+58, 1, 234.88, -118.767, 26.6746, 0.628318, 4000, 1855601),
(@CGUID+58, 2, 234.39, -90.9739, 26.5913, 1.40655, 0, 0),
(@CGUID+58, 3, 235.578, -85.3769, 26.5913, 1.70814, 0, 0),
(@CGUID+58, 4, 232.895, -74.7759, 26.5913, 1.64609, 2000, 1),
(@CGUID+59, 1, 254.086, 16.2811, 1.2111, 3.9968, 4000, 1855601),
(@CGUID+59, 2, 248.956, 13.8873, -0.0516049, 4.57014, 0, 0),
(@CGUID+59, 3, 247.572, -5.56347, -0.05535, 4.1853, 0, 0),
(@CGUID+59, 4, 240.99, -13.6141, -0.0627278, 4.28347, 0, 0),
(@CGUID+59, 5, 239.211, -17.6737, -0.0641297, 4.53873, 0, 0),
(@CGUID+59, 6, 241.667, -27.1563, -0.0669469, 5.4537, 0, 0),
(@CGUID+59, 7, 244.899, -29.4505, 2.24718, 5.77571, 2000, 1),
(@CGUID+60, 1, 129.825, 23.4731, -0.128527, 0, 0, 0),
(@CGUID+60, 2, 130.773, 9.24298, -0.12908, 0, 0, 0),
(@CGUID+60, 3, 137.655, -6.95471, 1.55496, 0, 0, 0),
(@CGUID+60, 4, 141.784, -8.56258, 2.20093, 0, 0, 0),
(@CGUID+60, 5, 154.28, -8.94985, 2.31843, 0, 0, 0),
(@CGUID+60, 6, 161.355, -13.9388, 1.12359, 0, 0, 0),
(@CGUID+60, 7, 165.427, -18.7034, 2.87921, 5.38784, 30000, 1855606),
(@CGUID+60, 8, 133.081, -14.5739, 3.9868, 0, 0, 0),
(@CGUID+60, 9, 132.859, -24.0738, 8.15998, 0, 0, 0),
(@CGUID+60, 10, 136.058, -31.3779, 12.0841, 0, 0, 0),
(@CGUID+60, 11, 150.872, -36.6916, 13.5886, 0, 0, 0),
(@CGUID+60, 12, 161.659, -39.9997, 12.3656, 6.16381, 30000, 1855607),
(@CGUID+61, 1, 103.362, -167.144, 14.8752, 0, 0, 0),
(@CGUID+61, 2, 92.2411, -168.086, 15.2795, 0, 0, 0),
(@CGUID+61, 3, 79.6217, -173.368, 15.352, 3.2492, 180000, 1855609),
(@CGUID+62, 1, 219.741, -0.675325, 28.203, 0, 0, 0),
(@CGUID+62, 2, 219.792, -4.76663, 26.8361, 0, 0, 0),
(@CGUID+62, 3, 217.358, -11.594, 25.4282, 0, 0, 0),
(@CGUID+62, 4, 218.272, -19.8373, 24.1715, 0, 0, 0),
(@CGUID+62, 5, 218.662, -23.4493, 23.8279, 0, 0, 0),
(@CGUID+62, 6, 220.474, -25.3684, 25.3681, 0, 0, 0),
(@CGUID+62, 7, 219.946, -29.8736, 26.8982, 0, 0, 0),
(@CGUID+62, 8, 249.729, -31.8743, 26.6054, 0, 0, 0),
(@CGUID+62, 9, 267.403, -32.7667, 26.5914, 0, 0, 0),
(@CGUID+62, 10, 277.982, -32.4806, 26.5914, 0.019631, 240000, 1855612),
(@CGUID+63, 1, 103.51, -31.6612, 2.18704, 1.36136, 4000, 1855701),
(@CGUID+63, 2, 104.433, -26.1661, -0.0697232, 1.6325, 0, 0),
(@CGUID+63, 3, 102.222, -12.2622, 0.17732, 1.4675, 0, 0),
(@CGUID+63, 4, 105.19, -1.24617, -0.0426896, 1.56018, 0, 0),
(@CGUID+63, 5, 104.13, 9.48964, 0.251931, 1.71947, 0, 0),
(@CGUID+63, 6, 103.15, 15.0193, -0.0717281, 1.56396, 0, 0),
(@CGUID+63, 7, 106.842, 21.3685, 0.224192, 0.659183, 0, 0),
(@CGUID+63, 8, 112.74, 22.792, -0.0508767, 0.164383, 2000, 1),
(@CGUID+64, 1, -138.909, -205.619, 26.6743, 2.75762, 4000, 1855701),
(@CGUID+64, 2, -140.285, -181.608, 26.5911, 1.47598, 0, 0),
(@CGUID+64, 3, -138.759, -174.98, 26.5916, 1.22465, 0, 0),
(@CGUID+64, 4, -136.741, -171.113, 26.5926, 0.732993, 0, 0),
(@CGUID+64, 5, -133.77, -169.383, 26.591, 0.248402, 0, 0),
(@CGUID+64, 6, -129.733, -169.142, 26.5893, 0.223269, 2000, 1),
(@CGUID+65, 1, 186.351, -184.605, 26.6173, 1.58635, 4000, 1855701),
(@CGUID+65, 2, 186.827, -139.192, 26.5154, 2.37055, 2000, 1),
(@CGUID+66, 1, 265.723, -167.4, 26.6746, 3.64774, 4000, 1855701),
(@CGUID+66, 2, 255.79, -172.018, 26.5913, 3.93556, 0, 0),
(@CGUID+66, 3, 248.786, -179.103, 29.9438, 3.71048, 0, 0),
(@CGUID+66, 4, 242.514, -182.389, 28.7502, 3.35077, 0, 0),
(@CGUID+66, 5, 237.058, -182.979, 26.5913, 3.06253, 0, 0),
(@CGUID+66, 6, 231.523, -180.122, 26.5913, 3.28951, 0, 0),
(@CGUID+66, 7, 227.297, -181.833, 26.5913, 3.6987, 0, 0),
(@CGUID+66, 8, 222.569, -185.367, 26.5913, 3.92565, 2000, 1),
(@CGUID+67, 1, 178.208, -8.37331, -0.748543, 0, 0, 0),
(@CGUID+67, 2, 192.227, 2.29999, -0.120996, 0, 0, 0),
(@CGUID+67, 3, 191.193, 14.8093, 1.52797, 1.54724, 30000, 1855604),
(@CGUID+67, 4, 248.941, 8.89292, -0.049169, 0, 0, 0),
(@CGUID+67, 5, 245.233, 0.881873, -0.053473, 0, 0, 0),
(@CGUID+67, 6, 237.602, -9.95962, -0.089788, 0, 0, 0),
(@CGUID+67, 7, 227.509, -14.377, 3.02301, 3.31596, 30000, 1855605),
(@CGUID+68, 1, 51.3806, -156.691, 15.2135, 0, 0, 0),
(@CGUID+68, 2, 31.5568, -158.001, 14.3307, 0, 0, 0),
(@CGUID+68, 3, 25.3965, -156.892, 13.8555, 3.13688, 180000, 1855608),
(@CGUID+69, 1, 242.429, -144.49, 26.6118, 0, 0, 0),
(@CGUID+69, 2, 225.061, -146.547, 26.5915, 0, 0, 0),
(@CGUID+69, 3, 219.352, -154.711, 26.5915, 0, 0, 0),
(@CGUID+69, 4, 217.615, -162.978, 26.5915, 0, 0, 0),
(@CGUID+69, 5, 219.621, -171.307, 26.5915, 0, 0, 0),
(@CGUID+69, 6, 223.668, -177.367, 26.5915, 0, 0, 0),
(@CGUID+69, 7, 230.066, -182.124, 26.5915, 0, 0, 0),
(@CGUID+69, 8, 233.654, -185.381, 26.5915, 0, 0, 0),
(@CGUID+69, 9, 234.627, -187.683, 26.6824, 5.09646, 120000, 1855610),
(@CGUID+69, 10, 238.415, -179.568, 26.5913, 100, 0, 0),
(@CGUID+69, 11, 231.578, -179.229, 26.5913, 100, 0, 0),
(@CGUID+69, 12, 226.351, -181.556, 26.5913, 100, 0, 0),
(@CGUID+69, 13, 223.909, -186.291, 26.5913, 100, 120000, 1855611),
(@CGUID+70, 1, 235.888, 37.0713, 26.69, 6.23082, 4000, 1855801),
(@CGUID+70, 2, 239.259, 37.7349, 26.6029, 0.0645036, 0, 0),
(@CGUID+70, 3, 256.93, 38.6263, 13.3965, 0.0095253, 0, 0),
(@CGUID+70, 4, 269.565, 37.909, 13.4, 5.97698, 0, 0),
(@CGUID+70, 5, 272.876, 36.4516, 13.4071, 5.51203, 0, 0),
(@CGUID+70, 6, 274.621, 31.0997, 13.4011, 4.88842, 0, 0),
(@CGUID+70, 7, 274.341, 20.9334, 13.395, 4.73348, 0, 0),
(@CGUID+70, 8, 274.476, 2.9775, -0.0701511, 4.74526, 2000, 1),
(@CGUID+71, 1, 127.675, -9.82014, 0.992616, 4.74729, 4000, 1855801),
(@CGUID+71, 2, 129.718, -18.8049, 5.70304, 4.75462, 0, 0),
(@CGUID+71, 3, 130.379, -25.2794, 8.45543, 5.11433, 0, 0),
(@CGUID+71, 4, 133.553, -30.3262, 11.2518, 5.57378, 0, 0),
(@CGUID+71, 5, 139.812, -33.5707, 13.4815, 5.96333, 0, 0),
(@CGUID+71, 6, 162.159, -39.9172, 12.2277, 5.94841, 2000, 1),
(@CGUID+72, 1, -150.584, -157.274, 26.6739, 2.11185, 4000, 1855801),
(@CGUID+72, 2, -149.429, -185.735, 26.5896, 4.56091, 0, 0),
(@CGUID+72, 3, -150.932, -204.497, 26.5896, 4.51771, 2000, 1),
(@CGUID+73, 1, 63.4074, -175.264, 15.4378, 6.14356, 4000, 1855801),
(@CGUID+73, 2, 64.7937, -157.134, 15.3266, 1.75359, 0, 0),
(@CGUID+73, 3, 63.5111, -153.674, 15.2878, 2.37484, 0, 0),
(@CGUID+73, 4, 60.752, -151.984, 15.3325, 2.9953, 0, 0),
(@CGUID+73, 5, 58.266, -151.812, 15.3223, 3.70452, 0, 0),
(@CGUID+73, 6, 54.7178, -154.831, 15.2635, 3.49953, 0, 0),
(@CGUID+73, 7, 37.6081, -157.491, 14.737, 3.13589, 0, 0),
(@CGUID+73, 8, 33.8367, -155.836, 14.4978, 2.64423, 2000, 1),
(@CGUID+74, 1, 163.42, -22.1445, 3.9893, 3.50811, 4000, 1855801),
(@CGUID+74, 2, 161.65, -24.0089, 3.37202, 3.68489, 0, 0),
(@CGUID+74, 3, 155.926, -27.0396, 7.4329, 3.21914, 0, 0),
(@CGUID+74, 4, 148.549, -26.228, 9.19468, 3.24506, 0, 0),
(@CGUID+74, 5, 132.089, -33.6267, 12.8042, 3.71394, 0, 0),
(@CGUID+74, 6, 126.817, -37.1354, 12.2635, 3.73358, 2000, 1),
(@CGUID+75, 1, 219.379, 0.330607, 28.4107, 3.90954, 4000, 1855801),
(@CGUID+75, 2, 214.701, -6.09303, 27.1319, 4.23051, 0, 0),
(@CGUID+75, 3, 212.107, -14.6145, 27.3325, 4.67976, 0, 0),
(@CGUID+75, 4, 212.901, -23.2855, 26.8425, 5.13371, 0, 0),
(@CGUID+75, 5, 216.698, -27.9429, 26.5917, 5.67642, 0, 0),
(@CGUID+75, 6, 224.025, -30.2683, 27.3426, 0.171554, 0, 0),
(@CGUID+75, 7, 251.498, -29.3868, 26.6004, 6.11557, 0, 0),
(@CGUID+75, 8, 274.178, -32.1791, 26.5917, 6.2216, 2000, 1),
(@CGUID+76, 1, 182.658, -140.555, 26.481, 2.25148, 4000, 1855801),
(@CGUID+76, 2, 180.946, -148.912, 26.3075, 4.15175, 0, 0),
(@CGUID+76, 3, 173.12, -151.982, 26.3432, 3.34908, 0, 0),
(@CGUID+76, 4, 161.632, -153.271, 25.9648, 3.1221, 0, 0),
(@CGUID+76, 5, 145.97, -152.706, 13.7712, 3.13306, 2000, 1),
(@CGUID+77, 1, 60.7609, 14.7143, 3.0138, 4.57276, 4000, 1855901),
(@CGUID+77, 2, 60.937, -19.7396, 2.79726, 4.91534, 2000, 1),
(@CGUID+78, 1, 108.474, -168.082, 14.7663, 4.03171, 4000, 1855901),
(@CGUID+78, 2, 93.5499, -166.973, 15.2408, 0, 0, 0),
(@CGUID+78, 3, 87.3811, -167.817, 15.2925, 0, 0, 0),
(@CGUID+78, 4, 83.1063, -169.717, 15.299, 0, 0, 0),
(@CGUID+78, 5, 80.6213, -173.26, 15.3327, 0, 2000, 1),
(@CGUID+79, 1, 252.857, -143.331, 31.5224, 3.94444, 4000, 1855901),
(@CGUID+79, 2, 239.474, -140.565, 26.592, 0, 0, 0),
(@CGUID+79, 3, 232.99, -142.095, 26.5913, 0, 0, 0),
(@CGUID+79, 4, 226.853, -145.607, 26.5924, 0, 0, 0),
(@CGUID+79, 5, 223.005, -149.411, 26.5913, 0, 0, 0),
(@CGUID+79, 6, 219.412, -156.105, 26.5913, 0, 0, 0),
(@CGUID+79, 7, 218.315, -163.06, 26.5913, 0, 0, 0),
(@CGUID+79, 8, 219.385, -170.84, 26.5913, 0, 0, 0),
(@CGUID+79, 9, 222.656, -177.147, 26.5913, 0, 0, 0),
(@CGUID+79, 10, 229.725, -182.67, 26.5913, 0, 0, 0),
(@CGUID+79, 11, 233.935, -186.756, 26.5913, 0, 0, 0),
(@CGUID+79, 12, 235.006, -191.854, 26.5913, 0, 2000, 1),
(@CGUID+80, 1, 244.796, -108.798, 26.6746, 5.41052, 4000, 1855901),
(@CGUID+80, 2, 244.18, -83.3991, 26.5913, 0, 0, 0),
(@CGUID+80, 3, 244.243, -61.4379, 26.5913, 1.7439, 2000, 1),
(@CGUID+81, 1, -133.752, -394.29, 26.5895, 3.94444, 4000, 1855901),
(@CGUID+81, 2, -149.727, -393.6, 26.5896, 0, 0, 0),
(@CGUID+81, 3, -151.597, -388.018, 26.5896, 0, 0, 0),
(@CGUID+81, 4, -151.722, -368.615, 26.5891, 0, 2000, 1),
(@CGUID+82, 1, 61.6461, 14.3518, 2.72275, 3.56513, 0, 0),
(@CGUID+82, 2, 60.8672, -0.027434, -0.156324, 0, 0, 0),
(@CGUID+82, 3, 61.8067, -18.512, 2.50957, 4.81135, 30000, 1855602),
(@CGUID+82, 4, 103.139, -25.0153, -0.053496, 0, 0, 0),
(@CGUID+82, 5, 101.822, -13.794, 0.162897, 0, 0, 0),
(@CGUID+82, 6, 103.285, 12.8828, -0.099057, 0, 0, 0),
(@CGUID+82, 7, 103.49, 18.5206, 0.124781, 0, 0, 0),
(@CGUID+82, 8, 109.09, 22.2497, 0.136722, 0, 0, 0),
(@CGUID+82, 9, 115.251, 22.515, -0.129131, 0.030629, 30000, 1855603),
(@CGUID+139, 1, -49.5313, -384.348, 26.5866, 0, 0, 0),
(@CGUID+139, 2, -43.3234, -388.675, 26.5852, 0, 0, 0),
(@CGUID+139, 3, -49.4948, -384.557, 26.5857, 0, 0, 0),
(@CGUID+139, 4, -51.8242, -371.816, 26.5857, 0, 0, 0),
(@CGUID+139, 5, -50.149, -362.456, 26.598, 0, 0, 0),
(@CGUID+139, 6, -51.5602, -371.933, 26.586, 0, 0, 0),
(@CGUID+141, 1, 17.7547, -409.4, 26.5852, 0, 0, 0),
(@CGUID+141, 2, 28.659, -408.99, 26.5871, 0, 0, 0),
(@CGUID+141, 3, 28.7313, -400.716, 26.5842, 0, 0, 0),
(@CGUID+141, 4, 28.9641, -409.005, 26.5868, 0, 0, 0),
(@CGUID+141, 5, 17.7235, -409.554, 26.5868, 0, 0, 0),
(@CGUID+141, 6, 7.51309, -409.564, 26.5839, 0, 0, 0),
(@CGUID+142, 1, -20.0318, -137.465, 43.2731, 6.1988, 0, 0),
(@CGUID+142, 2, 72.2387, -139.227, 41.0532, 0.0098567, 2000, 0),
(@CGUID+143, 1, 25.589, -434.98, 46.7206, 4.67513, 2000, 0),
(@CGUID+143, 2, 25.6421, -339.964, 45.4259, 1.45108, 2000, 0),
(@CGUID+144, 1, 146.815, -46.1878, 25.3337, 2.0794, 2000, 0),
(@CGUID+144, 2, 147.271, 46.17, 24.4082, 1.29006, 2000, 0),
(@CGUID+145, 1, 93.4215, -196.428, 32.1182, 0.0294966, 0, 0),
(@CGUID+145, 2, 91.0446, -196.97, 29.245, 0.0294966, 0, 0),
(@CGUID+145, 3, 148.97, -195.776, 26.3242, 0.0294966, 0, 0),
(@CGUID+146, 1, 228.025, -154.651, 42.4524, 0, 0, 0),
(@CGUID+146, 2, 225.331, -160.48, 42.9246, 0, 0, 0),
(@CGUID+146, 3, 226.264, -167.052, 43.6191, 0, 0, 0),
(@CGUID+146, 4, 228.999, -171.227, 44.0913, 0, 0, 0),
(@CGUID+146, 5, 234.165, -174.739, 44.6191, 0, 0, 0),
(@CGUID+146, 6, 240.23, -175.168, 44.758, 0, 0, 0),
(@CGUID+146, 7, 245.8, -173.596, 44.8362, 0, 0, 0),
(@CGUID+146, 8, 250.734, -170.353, 44.8918, 0, 0, 0),
(@CGUID+146, 9, 253.153, -164.773, 44.4473, 0, 0, 0),
(@CGUID+146, 10, 251.409, -158.43, 43.8496, 0, 0, 0),
(@CGUID+146, 11, 247.624, -153.522, 43.1682, 0, 0, 0),
(@CGUID+146, 12, 241.587, -149.266, 42.4738, 0, 0, 0),
(@CGUID+146, 13, 236.165, -148.947, 42.2238, 0, 0, 0),
(@CGUID+146, 14, 231.145, -151.021, 42.196, 0, 0, 0),
(@CGUID+147, 1, -22.8491, -341.315, 52.3623, 4.63425, 2000, 0),
(@CGUID+147, 2, -22.9796, -434.141, 52.2505, 1.60654, 2000, 0),
-- Cosmetic Raging Soul (18778)
(@CGUID+148, 1, 145.692, -44.3438, 24.1929, 1.6776, 0, 0),
(@CGUID+148, 2, 146.112, 44.5067, 24.9555, 1.44198, 0, 0),
(@CGUID+153, 1, 163.575, -195.819, 44.6346, 3.10702, 2000, 0),
(@CGUID+153, 2, 85.3807, -193.596, 32.9652, 3.09916, 2000, 0),
(@CGUID+154, 1, 72.3599, -139.243, 43.314, 3.06775, 5000, 0),
(@CGUID+154, 2, -15.3524, -131.667, 41.8842, 3.12273, 2000, 0),
(@CGUID+155, 1, -22.606, -431.96, 51.8957, 1.68544, 2000, 0),
(@CGUID+155, 2, -23.1827, -343.781, 52.2056, 1.54015, 2000, 0),
(@CGUID+156, 1, 25.3586, -432.834, 46.1591, 1.35559, 2000, 0),
(@CGUID+156, 2, 25.9022, -344.431, 46.2485, 1.60691, 2000, 0),
(@CGUID+158, 1, 141.6882, -17.80097, 9.308136, 2.129302, 1000, 1877801);

INSERT INTO `creature_movement_template` (`entry`, `pathId`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(18371, 0, 1, -24.40752, -163.4984, 26.1806, 0, 10000, 0),
(18371, 0, 2, -63.11897, -162.7913, 26.52851, 0, 10000, 0);

INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(@CGUID+3, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+4, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+5, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+6, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+7, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+8, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+12, 0, 8, 0, 0, 68, 0, NULL), -- Auchenai Soulpriest
(@CGUID+15, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+19, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+20, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+21, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+22, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+25, 0, 8, 0, 0, 68, 0, NULL), -- Auchenai Vindicator
(@CGUID+26, 0, 8, 0, 0, 68, 0, NULL), -- Auchenai Vindicator
(@CGUID+28, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+29, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+30, 0, 8, 0, 0, 68, 0, NULL), -- creature_spawn_entry
(@CGUID+31, 0, 8, 0, 0, 68, 0, NULL), -- Auchenai Monk
(@CGUID+33, 0, 0, 1, 0, 375, 0, NULL), -- Auchenai Monk
(@CGUID+36, 0, 8, 0, 0, 68, 0, NULL), -- Auchenai Monk
(@CGUID+37, 0, 0, 1, 0, 375, 0, NULL), -- Auchenai Monk
(@CGUID+38, 0, 0, 1, 0, 375, 0, NULL), -- Auchenai Monk
(@CGUID+40, 0, 0, 1, 0, 375, 0, NULL), -- Auchenai Monk
(@CGUID+41, 0, 8, 0, 0, 68, 0, NULL); -- creature_spawn_entry

REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(18506,  0, 0, 1, 16, 0, 0, '35841 35850'), -- Raging Soul
(18521, 0, 0, 1, 16, 0, 0, '10095'), -- Raging Skeleton
(18524, 0, 0, 1, 16, 0, 0, '32885'), -- Angered Skeleton
(18559, 0, 0, 0, 0, 0, 0, '31748'), -- Phasing Stalker
(18700, 0, 0, 0, 0, 0, 0, '19818'); -- Reanimated Bones

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(@CGUID+3, @CGUID+4, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+6, @CGUID+5, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+20, @CGUID+8, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+19, @CGUID+22, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+21, @CGUID+7, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+23, @CGUID+24, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+29, @CGUID+28, 1155), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+15, @CGUID+31, 1155), -- Auchenai Soulpriest -> Auchenai Monk
(@CGUID+25, @CGUID+34, 1155), -- Auchenai Vindicator -> Auchenai Monk
(@CGUID+41, @CGUID+30, 1155), -- Auchenai Monk -> Auchenai Vindicator
(@CGUID+16, @CGUID+17, 1679), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+35, @CGUID+11, 1679), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+12, @CGUID+36, 1155), -- Auchenai Soulpriest -> Auchenai Monk
(@CGUID+26, @CGUID+36, 1155), -- Auchenai Vindicator -> Auchenai Monk
(@CGUID+10, @CGUID+39, 1679), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+27, @CGUID+39, 1679), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+40, @CGUID+38, 1155), -- Auchenai Monk -> Auchenai Monk
(@CGUID+33, @CGUID+37, 1155), -- Auchenai Monk -> Auchenai Monk
(@CGUID+46, @CGUID+51, 1155), -- Raging Skeleton -> Angered Skeleton
(@CGUID+47, @CGUID+51, 1155), -- Raging Skeleton -> Angered Skeleton
(@CGUID+50, @CGUID+51, 1155), -- Angered Skeleton -> Angered Skeleton
(@CGUID+45, @CGUID+44, 1155), -- Raging Skeleton -> Raging Skeleton
(@CGUID+48, @CGUID+44, 1155), -- Angered Skeleton -> Raging Skeleton
(@CGUID+49, @CGUID+44, 1155), -- Angered Skeleton -> Raging Skeleton
(@CGUID+52, @CGUID+44, 1155), -- Angered Skeleton -> Raging Skeleton
(@CGUID+42, @CGUID+43, 1155), -- Raging Skeleton -> Raging Skeleton
(@CGUID+53, @CGUID+43, 1155), -- Angered Skeleton -> Raging Skeleton
(@CGUID+54, @CGUID+43, 1155), -- Angered Skeleton -> Raging Skeleton
(@CGUID+55, @CGUID+43, 1155), -- Angered Skeleton -> Raging Skeleton
(@CGUID+14, @CGUID+13, 1679), -- creature_spawn_entry -> creature_spawn_entry
(@CGUID+83, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+84, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+85, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+86, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+88, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+89, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+90, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+91, @CGUID+139, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+92, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+93, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+96, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+98, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+99, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+100, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+101, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+102, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+103, @CGUID+94, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+87, @CGUID+138, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+95, @CGUID+138, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+97, @CGUID+138, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+105, @CGUID+138, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+125, @CGUID+138, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+126, @CGUID+138, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+127, @CGUID+138, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+104, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+106, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+107, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+108, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+109, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+110, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+111, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+112, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+113, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+114, @CGUID+140, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+115, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+116, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+117, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+118, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+119, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+120, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+121, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+122, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+123, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+124, @CGUID+141, 1155), -- Reanimated Bones -> Auchenai Necromancer
(@CGUID+129, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+130, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+131, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+132, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+133, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+134, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+135, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+136, @CGUID+128, 1155), -- Reanimated Bones -> Reanimated Bones
(@CGUID+137, @CGUID+128, 1155); -- Reanimated Bones -> Reanimated Bones

-- REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES

INSERT INTO `creature_spawn_entry` (`guid`, `entry`) VALUES
(@CGUID+3, 18493), (@CGUID+3, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+4, 18493), (@CGUID+4, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+5, 18493), (@CGUID+5, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+6, 18493), (@CGUID+6, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+7, 18493), (@CGUID+7, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+8, 18493), (@CGUID+8, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+9, 18493), (@CGUID+9, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+10, 18493), (@CGUID+10, 18495), (@CGUID+10, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk
(@CGUID+11, 18493), (@CGUID+11, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+12, 18493), (@CGUID+12, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+13, 18493), (@CGUID+13, 18495), (@CGUID+13, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk
(@CGUID+14, 18493), (@CGUID+14, 18495), (@CGUID+14, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk
(@CGUID+15, 18493), (@CGUID+15, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+16, 18493), (@CGUID+16, 18495), (@CGUID+16, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk
(@CGUID+17, 18493), (@CGUID+17, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+18, 18493), (@CGUID+18, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+19, 18493), (@CGUID+19, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+20, 18493), (@CGUID+20, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+21, 18493), (@CGUID+21, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+22, 18493), (@CGUID+22, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+23, 18493), (@CGUID+23, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+24, 18493), (@CGUID+24, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+25, 18493), (@CGUID+25, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+26, 18493), (@CGUID+26, 18495), (@CGUID+26, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk
(@CGUID+27, 18493), (@CGUID+27, 18495), (@CGUID+27, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk
(@CGUID+28, 18493), (@CGUID+28, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+29, 18493), (@CGUID+29, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+30, 18493), (@CGUID+30, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+35, 18495), (@CGUID+35, 18497), -- Auchenai Vindicator, Auchenai Monk
(@CGUID+36, 18493), (@CGUID+36, 18495), (@CGUID+36, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk
(@CGUID+39, 18493), (@CGUID+39, 18495), -- (@CGUID+39, 18497), -- Auchenai Soulpriest, Auchenai Vindicator, Auchenai Monk								// commented due to x3 Monk combo
(@CGUID+41, 18493), (@CGUID+41, 18495), -- Auchenai Soulpriest, Auchenai Vindicator
(@CGUID+56, 18556), (@CGUID+56, 18557), (@CGUID+56, 18558), (@CGUID+56, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+57, 18556), (@CGUID+57, 18557), -- Phasing Soldier, Phasing Cleric
(@CGUID+58, 18556), (@CGUID+58, 18557), (@CGUID+58, 18558), (@CGUID+58, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+59, 18556), (@CGUID+59, 18557), (@CGUID+59, 18558), (@CGUID+59, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+60, 18556), (@CGUID+60, 18557), (@CGUID+60, 18558), (@CGUID+60, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+61, 18556), (@CGUID+61, 18557), (@CGUID+61, 18558), (@CGUID+61, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+62, 18556), (@CGUID+62, 18557), (@CGUID+62, 18558), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer
(@CGUID+63, 18556), (@CGUID+63, 18557), (@CGUID+63, 18558), (@CGUID+63, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+64, 18556), (@CGUID+64, 18557), (@CGUID+64, 18558), (@CGUID+64, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+65, 18556), (@CGUID+65, 18557), (@CGUID+65, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Stalker
(@CGUID+66, 18556), (@CGUID+66, 18557), (@CGUID+66, 18558), (@CGUID+66, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+67, 18556), (@CGUID+67, 18557), (@CGUID+67, 18558), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer
(@CGUID+68, 18556), (@CGUID+68, 18557), (@CGUID+68, 18558), (@CGUID+68, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+69, 18556), (@CGUID+69, 18557), (@CGUID+69, 18558), (@CGUID+69, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+70, 18556), (@CGUID+70, 18557), (@CGUID+70, 18558), (@CGUID+70, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+71, 18556), (@CGUID+71, 18557), (@CGUID+71, 18558), (@CGUID+71, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+72, 18556), (@CGUID+72, 18557), (@CGUID+72, 18558), (@CGUID+72, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+73, 18556), (@CGUID+73, 18557), (@CGUID+73, 18558), (@CGUID+73, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+74, 18556), (@CGUID+74, 18557), (@CGUID+74, 18558), (@CGUID+74, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+75, 18556), (@CGUID+75, 18557), (@CGUID+75, 18558), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer
(@CGUID+76, 18556), (@CGUID+76, 18557), (@CGUID+76, 18558), (@CGUID+76, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+77, 18556), (@CGUID+77, 18557), (@CGUID+77, 18558), (@CGUID+77, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+78, 18556), (@CGUID+78, 18557), (@CGUID+78, 18558), (@CGUID+78, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+79, 18556), (@CGUID+79, 18557), (@CGUID+79, 18558), (@CGUID+79, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+80, 18556), (@CGUID+80, 18557), (@CGUID+80, 18558), (@CGUID+80, 18559), -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker
(@CGUID+81, 18556), (@CGUID+81, 18559), -- Phasing Soldier, Phasing Stalker
(@CGUID+82, 18556), (@CGUID+82, 18557), (@CGUID+82, 18558), (@CGUID+82, 18559); -- Phasing Soldier, Phasing Cleric, Phasing Sorcerer, Phasing Stalker

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `DeathState`, `MovementType`) VALUES
(@CGUID+1, 18371, 558, 3, -50.9133, -163.133, 26.3687, 0.0185413, 86400, 86400, 0, 0, 0, 2), -- Shirrak the Dead Watcher
(@CGUID+2, 18373, 558, 3, 66.76575, -388.3454, 26.6733, 2.932153, 86400, 86400, 0, 0, 0, 0), -- Exarch Maladaar
(@CGUID+3, 0, 558, 3, 81.64183, -8.102726, 0.01928834, 4.520403, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+4, 0, 558, 3, 77.84399, -8.144547, 0.02005134, 4.468043, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+5, 0, 558, 3, 85.36028, 8.430236, 0.01832034, 1.413717, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+6, 0, 558, 3, 89.77869, 8.615493, 0.01932934, 1.48353, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+7, 0, 558, 3, 122.3884, 3.71186, -0.04624767, 4.101524, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+8, 0, 558, 3, 87.4967, -38.87351, 4.34452, 4.537856, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+9, 0, 558, 3, 79.825, -5.11753, -0.086953, 3.16281, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+10, 0, 558, 3, 130.674, -160.664, 12.7517, 3.29239, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+11, 0, 558, 3, 239.385, -49.6785, 26.5912, 4.59379, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+12, 0, 558, 3, 225.4602, -163.3877, 26.67463, 6.056293, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+13, 0, 558, 3, -145.786, -376.33, 26.5915, 1.57631, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+14, 0, 558, 3, -143.096, -376.454, 26.5918, 1.53389, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+15, 0, 558, 3, 189.5546, -3.356299, 0.08177434, 1.58825, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+16, 0, 558, 3, 238.24, -31.651, 26.7127, 3.1251, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+17, 0, 558, 3, 235.574, -31.607, 27.0868, 3.1251, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+18, 0, 558, 3, 100.802, 17.3231, -0.08737, 4.59852, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+19, 0, 558, 3, 78.38407, 39.29659, 4.345016, 1.396263, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+20, 0, 558, 3, 92.49681, -39.03551, 4.344501, 4.520403, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+21, 0, 558, 3, 117.8884, -4.552255, 0.05047834, 0.8726646, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+22, 0, 558, 3, 85.71856, 39.33675, 4.344902, 1.48353, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+23, 0, 558, 3, 132.2567, -19.23857, 6.386281, 0.01745329, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+24, 0, 558, 3, 136.688, -26.0343, 9.386496, 0.6457718, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+25, 0, 558, 3, 230.3863, 19.43298, 0.01958133, 1.413717, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+26, 0, 558, 3, 227.6582, -170.5806, 26.67463, 0.5235988, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+27, 0, 558, 3, 130.644, -164.902, 12.7534, 3.1251, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+28, 0, 558, 3, 139.1312, 39.38498, 4.344155, 1.466077, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+29, 0, 558, 3, 148.6592, 39.4251, 4.344099, 1.308997, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+30, 0, 558, 3, 242.325, -15.56781, 0.02191534, 0.8203048, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+31, 18497, 558, 3, 187.0043, 4.800222, -0.03852867, 4.956735, 7200, 7200, 0, 0, 0, 0), -- Auchenai Monk
(@CGUID+32, 18497, 558, 3, 160.192, 30.6168, -0.106432, 2.94838, 7200, 7200, 0, 0, 0, 2), -- Auchenai Monk
(@CGUID+33, 18497, 558, 3, -122.5634, -166.7359, 26.67193, 0.06981317, 7200, 7200, 0, 0, 0, 0), -- Auchenai Monk
(@CGUID+34, 18497, 558, 3, 238.134, 14.236, -0.064787, 5.69414, 7200, 7200, 0, 0, 0, 2), -- Auchenai Monk
(@CGUID+35, 0, 558, 3, 239.401, -46.9768, 26.5912, 4.87575, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+36, 0, 558, 3, 227.6597, -155.1209, 26.67463, 5.358161, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+37, 18497, 558, 3, -127.4433, -159.4812, 26.6723, 6.056293, 7200, 7200, 0, 0, 0, 0), -- Auchenai Monk
(@CGUID+38, 18497, 558, 3, 21.78426, -160.7699, 13.6514, 3.071779, 7200, 7200, 0, 0, 0, 0), -- Auchenai Monk
(@CGUID+39, 0, 558, 3, 129.002, -162.865, 12.8844, 3.22092, 7200, 7200, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+40, 18497, 558, 3, 25.24369, -166.9502, 13.94017, 2.792527, 7200, 7200, 0, 0, 0, 0), -- Auchenai Monk
(@CGUID+41, 0, 558, 3, 247.7906, -9.666943, 0.02644934, 3.926991, 7200, 7200, 0, 0, 0, 0), -- creature_spawn_entry
(@CGUID+42, 18521, 558, 3, -130.67, -304.513, 26.3778, 4.64171, 7200, 7200, 3, 0, 0, 1), -- Raging Skeleton
(@CGUID+43, 18521, 558, 3, -139.069, -300, 26.423, 2.3884, 7200, 7200, 3, 0, 0, 1), -- Raging Skeleton
(@CGUID+44, 18521, 558, 3, -170.374, -276.212, 31.4869, 0.13509, 7200, 7200, 3, 0, 0, 1), -- Raging Skeleton
(@CGUID+45, 18521, 558, 3, -151.848, -285.093, 25.5828, 5.93604, 7200, 7200, 3, 0, 0, 1), -- Raging Skeleton
(@CGUID+46, 18521, 558, 3, -127.825, -250.383, 26.3497, 2.68292, 7200, 7200, 3, 0, 0, 1), -- Raging Skeleton
(@CGUID+47, 18521, 558, 3, -142.841, -251.909, 26.7593, 1.6784, 7200, 7200, 3, 0, 0, 1), -- Raging Skeleton
(@CGUID+48, 18524, 558, 3, -159.087, -278.098, 26.6175, 0.132734, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+49, 18524, 558, 3, -160.005, -269.389, 26.6046, 0.969183, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+50, 18524, 558, 3, -138.643, -256.87, 26.7506, 0.600831, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+51, 18524, 558, 3, -134.852, -247.899, 26.4308, 2.02083, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+52, 18524, 558, 3, -161.238, -285.689, 26.5989, 4.20424, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+53, 18524, 558, 3, -131.805, -313.267, 28.2328, 5.39962, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+54, 18524, 558, 3, -127.905, -294.348, 27.0713, 3.02771, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+55, 18524, 558, 3, -140.272, -310.587, 26.591, 6.26355, 7200, 7200, 3, 0, 0, 1), -- Angered Skeleton
(@CGUID+56, 0, 558, 3, 126.177, 27.9481, -0.0451297, 5.28835, 60, 60, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+57, 0, 558, 3, 170.213, -18.6788, 1.89394, 6.12611, 60, 60, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+58, 0, 558, 3, 234.88, -118.767, 26.6746, 0.628318, 60, 60, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+59, 0, 558, 3, 254.086, 16.2811, 1.2111, 3.9968, 60, 60, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+60, 0, 558, 3, 126.307, 33.2078, -0.113875, 4.8467, 60, 60, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+61, 0, 558, 3, 119.912, -167.935, 13.5053, 3.2492, 60, 60, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+62, 0, 558, 3, 218.466, 3.71303, 29.0994, 4.74537, 60, 60, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+63, 0, 558, 3, 103.51, -31.6612, 2.18704, 1.36136, 90, 90, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+64, 0, 558, 3, -138.909, -205.619, 26.6743, 2.75762, 90, 90, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+65, 0, 558, 3, 186.351, -184.605, 26.6173, 1.58635, 90, 90, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+66, 0, 558, 3, 265.723, -167.4, 26.6746, 3.64774, 90, 90, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+67, 0, 558, 3, 169.078, -17.6317, 2.71439, 0.86237, 90, 90, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+68, 0, 558, 3, 68.5056, -155.576, 15.346, 3.13688, 90, 90, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+69, 0, 558, 3, 249.466, -144.105, 29.6535, 2.93661, 90, 90, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+70, 0, 558, 3, 235.888, 37.0713, 26.69, 6.23082, 180, 180, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+71, 0, 558, 3, 127.675, -9.82014, 0.992616, 4.74729, 180, 180, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+72, 0, 558, 3, -150.584, -157.274, 26.6739, 2.11185, 180, 180, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+73, 0, 558, 3, 63.4074, -175.264, 15.4378, 6.14356, 180, 180, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+74, 0, 558, 3, 163.42, -22.1445, 3.9893, 3.50811, 180, 180, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+75, 0, 558, 3, 219.379, 0.330607, 28.4107, 3.90954, 180, 180, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+76, 0, 558, 3, 182.658, -140.555, 26.481, 2.25148, 180, 180, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+77, 0, 558, 3, 60.7609, 14.7143, 3.0138, 4.57276, 120, 120, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+78, 0, 558, 3, 108.474, -168.082, 14.7663, 4.03171, 120, 120, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+79, 0, 558, 3, 252.857, -143.331, 31.5224, 3.94444, 120, 120, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+80, 0, 558, 3, 244.796, -108.798, 26.6746, 5.41052, 120, 120, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+81, 0, 558, 3, -133.752, -394.29, 26.5895, 5.35807, 120, 120, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+82, 0, 558, 3, 61.6461, 14.3518, 2.72275, 3.56513, 120, 120, 0, 0, 0, 2), -- creature_spawn_entry
(@CGUID+83, 18700, 558, 3, -57.0486, -374.216, 26.5868, 1.60693, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+84, 18700, 558, 3, -44.5335, -365.745, 26.5908, 5.09724, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+85, 18700, 558, 3, -56.3714, -381.359, 26.5864, 3.30182, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+86, 18700, 558, 3, -65.8798, -377.71, 26.5866, 4.88361, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+87, 18700, 558, 3, -27.7304, -408.642, 26.5899, 3.1306, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+88, 18700, 558, 3, -44.8718, -377.895, 26.5849, 4.98336, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+89, 18700, 558, 3, -54.8159, -365.368, 26.5916, 1.39252, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+90, 18700, 558, 3, -66.7684, -370.037, 26.5861, 6.22586, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+91, 18700, 558, 3, -76.0561, -370.413, 26.589, 4.74303, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+92, 18700, 558, 3, -52.0016, -394.904, 27.852, 4.64956, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+93, 18700, 558, 3, -43.8139, -398.606, 26.8131, 2.95703, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+94, 18700, 558, 3, -45.2643, -405.537, 28.3561, 2.7434, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+95, 18700, 558, 3, -35.0918, -419.816, 26.6244, 3.91914, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+96, 18700, 558, 3, -49.2886, -410.637, 27.7131, 1.68233, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+97, 18700, 558, 3, -33.8195, -400.51, 24.5188, 1.48362, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+98, 18700, 558, 3, -55.6147, -402.252, 30.4692, 1.82999, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+99, 18700, 558, 3, -61.0021, -402.608, 29.1614, 6.15988, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+100, 18700, 558, 3, -58.1212, -408.04, 29.1461, 5.94626, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+101, 18700, 558, 3, -50.7328, -404.122, 30.2531, 6.11747, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+102, 18700, 558, 3, -47.5823, -395.32, 27.5912, 3.84139, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+103, 18700, 558, 3, -57.9303, -397.836, 27.9686, 3.90501, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+104, 18700, 558, 3, -30.2942, -352.082, 28.9472, 1.97372, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+105, 18700, 558, 3, -29.1455, -393.659, 20.9314, 2.7379, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+106, 18700, 558, 3, -19.5043, -358.348, 26.595, 5.59204, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+107, 18700, 558, 3, -18.7407, -379.276, 19.4103, 1.38937, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+108, 18700, 558, 3, -21.9765, -372.255, 23.4079, 1.95878, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+109, 18700, 558, 3, -15.0821, -371.851, 23.7102, 0.629103, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+110, 18700, 558, 3, -26.0298, -359.786, 26.5971, 1.05479, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+111, 18700, 558, 3, -37.3924, -352.116, 28.9245, 2.12529, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+112, 18700, 558, 3, -27.7575, -366.652, 26.5848, 2.78031, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+113, 18700, 558, 3, -18.7104, -373.63, 22.3553, 1.45613, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+114, 18700, 558, 3, -12.9123, -361.958, 26.5824, 1.89046, 7200, 7200, 0, 0, 0, 0), -- Reanimated Bones
(@CGUID+115, 18700, 558, 3, 11.6286, -416.595, 26.5875, 4.78858, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+116, 18700, 558, 3, 3.63836, -413.637, 26.5823, 4.74695, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+117, 18700, 558, 3, 7.24032, -398.062, 19.641, 1.85354, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+118, 18700, 558, 3, 7.06263, -402.78, 23.2532, 6.03657, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+119, 18700, 558, 3, 29.4933, -413.012, 26.5905, 4.2278, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+120, 18700, 558, 3, 32.388, -403.328, 26.584, 5.84022, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+121, 18700, 558, 3, 12.8757, -404.708, 24.7579, 5.47109, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+122, 18700, 558, 3, 21.4153, -402.563, 23.2173, 0.610259, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+123, 18700, 558, 3, 22.944, -397.048, 24.381, 2.03419, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+124, 18700, 558, 3, 23.342, -416.118, 26.5983, 0.175933, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+125, 18700, 558, 3, -18.1263, -405.396, 25.3244, 5.70121, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+126, 18700, 558, 3, -10.0026, -402.247, 22.8378, 0.231695, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+127, 18700, 558, 3, -8.65687, -396.45, 19.4094, 1.97999, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+128, 18700, 558, 3, 17.9402, -381.513, 20.5501, 4.52233, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+129, 18700, 558, 3, 22.4457, -377.248, 23.9979, 1.7648, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+130, 18700, 558, 3, 21.13, -370.713, 24.6083, 1.57552, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+131, 18700, 558, 3, 13.1984, -369.914, 25.2534, 1.30849, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+132, 18700, 558, 3, 6.13705, -374.024, 22.0521, 3.85867, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+133, 18700, 558, 3, 2.98452, -366.832, 26.5822, 1.24408, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+134, 18700, 558, 3, 14.3194, -360.835, 26.6053, 0.44062, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+135, 18700, 558, 3, 22.9908, -361.364, 26.6062, 0.315742, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+136, 18700, 558, 3, 31.5531, -364.96, 27.9252, 0.190078, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+137, 18700, 558, 3, 35.8048, -367.576, 30.2166, 5.2339, 7200, 7200, 3, 0, 0, 1), -- Reanimated Bones
(@CGUID+138, 18702, 558, 3, -23.3478, -410.1846, 26.6766, 2.984513, 7200, 7200, 0, 0, 0, 0), -- Auchenai Necromancer
(@CGUID+139, 18702, 558, 3, -52.2851, -371.333, 26.586, 4.76973, 7200, 7200, 0, 0, 0, 2), -- Auchenai Necromancer
(@CGUID+140, 18702, 558, 3, -20.65882, -365.6899, 26.66656, 2.96706, 7200, 7200, 0, 0, 0, 0), -- Auchenai Necromancer
(@CGUID+141, 18702, 558, 3, 8.02662, -409.494, 26.5837, 0.0345117, 7200, 7200, 0, 0, 0, 2), -- Auchenai Necromancer
(@CGUID+142, 18726, 558, 3, 72.2387, -139.227, 41.1505, 0.79309, 7200, 7200, 0, 0, 0, 2), -- Flying Raging Soul
(@CGUID+143, 18726, 558, 3, 25.6421, -339.964, 45.4259, 4.85502, 7200, 7200, 0, 0, 0, 2), -- Flying Raging Soul
(@CGUID+144, 18726, 558, 3, 147.271, 46.17, 24.4082, 3.30403, 7200, 7200, 0, 0, 0, 2), -- Flying Raging Soul
(@CGUID+145, 18726, 558, 3, 148.97, -195.776, 26.3242, 3.02073, 7200, 7200, 0, 0, 0, 2), -- Flying Raging Soul
(@CGUID+146, 18726, 558, 3, 228.234, -154.235, 39.6051, 4.20328, 7200, 7200, 0, 0, 0, 2), -- Flying Raging Soul
(@CGUID+147, 18726, 558, 3, -23.6042, -384.012, 52.4464, 1.56208, 7200, 7200, 0, 0, 0, 2), -- Flying Raging Soul
(@CGUID+148, 18778, 558, 3, 146.9538, -43.67898, 25.32883, 4.657265, 7200, 7200, 0, 0, 0, 2), -- Cosmetic Raging Soul
(@CGUID+149, 18506, 558, 3, 74.744, -156.728, 15.4168, 5.9299, 600, 600, 0, 0, 0, 0), -- Raging Soul
(@CGUID+150, 18506, 558, 3, 18.5364, -169.422, 13.2419, 0.652, 600, 600, 0, 0, 0, 0), -- Raging Soul
(@CGUID+151, 18506, 558, 3, 44.54099, -162.2908, 15.00108, 0.1835147, 600, 600, 0, 0, 0, 0), -- Raging Soul
(@CGUID+153, 18778, 558, 3, 145.692, -44.3438, 24.1929, 1.6776, 7200, 7200, 0, 0, 0, 2), -- Cosmetic Raging Soul
(@CGUID+154, 18778, 558, 3, 163.575, -195.819, 44.6346, 3.10702, 7200, 7200, 0, 0, 0, 2), -- Cosmetic Raging Soul
(@CGUID+155, 18778, 558, 3, 72.3599, -139.243, 43.314, 3.06775, 7200, 7200, 0, 0, 0, 2), -- Cosmetic Raging Soul
(@CGUID+156, 18778, 558, 3, -22.606, -431.96, 51.8957, 1.68544, 7200, 7200, 0, 0, 0, 2), -- Cosmetic Raging Soul
-- RE-USE 157
(@CGUID+158, 18778, 558, 3, 141.6882, -17.80097, 9.308136, 2.129302, 7200, 7200, 0, 0, 0, 2), -- Cosmetic Raging Soul
(@CGUID+159, 18506, 558, 3, 113.8355, -167.1436, 14.15542, 0.146318, 600, 600, 0, 0, 0, 0), -- Raging Soul
(@CGUID+160, 18506, 558, 3, 59.21491, -162.1531, 15.33739, 2.990962, 600, 600, 0, 0, 0, 0), -- Raging Soul
(@CGUID+161, 18766, 558, 3, 113.5894, -132.9443, -139.5885, 2.722714, 7200, 7200, 0, 0, 0, 0), -- Pool of Souls
(@CGUID+162, 18766, 558, 3, 40.78951, -191.9622, -139.5885, 3.892084, 7200, 7200, 0, 0, 0, 0), -- Pool of Souls
(@CGUID+163, 18766, 558, 3, 113.8102, -191.401, -139.5886, 2.9147, 7200, 7200, 0, 0, 0, 0), -- Pool of Souls
(@CGUID+164, 18766, 558, 3, 40.49611, -134.3122, -139.5885, 5.742133, 7200, 7200, 0, 0, 0, 0), -- Pool of Souls
(@CGUID+165, 14881, 558, 3, 47.92502, -19.67967, -0.1900515, 0.5066516, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+166, 14881, 558, 3, 99.90002, 41.08219, 4.300655, 3.753183, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+167, 14881, 558, 3, 248.7818, 26.70579, 0.01202033, 3.811768, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+168, 14881, 558, 3, 241.2808, -89.22566, 26.63534, 3.179858, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+169, 14881, 558, 3, 278.0475, -162.8453, 26.67462, 4.041707, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+170, 14881, 558, 3, 263.9539, -165.2596, 26.5913, 2.248354, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+171, 14881, 558, 3, 240.1609, -199.0526, 26.5913, 6.216994, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+172, 14881, 558, 3, -101.168, -171.1774, 26.66554, 3.085481, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+173, 14881, 558, 3, -140.7499, -227.4957, 26.59159, 6.24673, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+174, 14881, 558, 3, -174.0774, -309.9147, 26.77208, 3.826468, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+175, 14881, 558, 3, -125.2373, -320.5455, 28.96155, 5.428397, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+176, 14881, 558, 3, -100.257, -394.9611, 26.59012, 2.071474, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+177, 14881, 558, 3, 49.78981, -369.1593, 26.66824, 0.1211321, 900, 900, 2, 0, 0, 1), -- Spider
(@CGUID+178, 14881, 558, 3, 38.73653, -427.7219, 30.96711, 3.599014, 900, 900, 2, 0, 0, 1); -- Spider

-- ===========
-- GAMEOBJECTS
-- ===========

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@OGUID+1, 181278, 558, 3, 238.1105, -21.57134, -0.103546, 1.97222, 0, 0, 0.8338852, 0.5519379, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+2, 181278, 558, 3, -170.729, -270.2203, 31.63038, 4.607672, 0, 0, -0.743144, 0.6691315, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+3, 181278, 558, 3, 11.43081, -382.6463, 19.41117, 3.68265, 0, 0, -0.9636297, 0.267241, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+4, 181556, 558, 3, -153.854, -290.5263, 24.57888, 5.427975, 0, 0, -0.4146929, 0.9099615, 86400, 86400, 255, 1), -- Adamantite Deposit
(@OGUID+5, 181556, 558, 3, 254.1934, -152.5304, 31.18292, 5.445428, 0, 0, -0.4067364, 0.9135455, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+6, 181569, 558, 3, 213.9826, -2.980433, 27.15875, 0.6632232, 0, 0, 0.3255672, 0.9455189, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+7, 183441, 558, 3, 62.69307, -398.407, 29.66395, 5.323256, 0, 0, -0.4617481, 0.8870111, 120, 120, 100, 1), -- Soul Mirror
(@OGUID+8, 183441, 558, 3, 40.87143, 12.57517, 4.040081, 2.809975, 0, 0, 0.9862852, 0.1650499, 120, 120, 100, 1), -- Soul Mirror
(@OGUID+9, 184191, 558, 2, -28.73179, 0.08934584, -0.1205667, 6.255642, 0, 0, -0.01377106, 0.9999052, 0, 0, 0, 0), -- Instance_Portal_Difficulty_1
(@OGUID+10, 184192, 558, 1, -28.73179, 0.08934584, -0.1205667, 6.255642, 0, 0, -0.01377106, 0.9999052, 0, 0, 0, 0), -- Instance_Portal_Difficulty_0
(@OGUID+11, 183441, 558, 3, -110.0298, -269.6933, 34.96054, 4.729844, 0, 0, -0.7009087, 0.7132511, 120, 120, 100, 1), -- Soul Mirror
(@OGUID+12, 181278, 558, 3, 81.37183, 39.97037, 4.26169, 2.460913, 0, 0, 0.9426413, 0.3338076, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+13, 181278, 558, 3, 94.1284, -41.63251, 4.261362, 2.530723, 0, 0, 0.9537163, 0.3007079, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+14, 181278, 558, 3, 142.3764, 42.36301, 4.261193, 3.944446, 0, 0, -0.9205046, 0.3907318, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+15, 181278, 558, 3, 147.044, -17.30462, 7.978113, 5.148723, 0, 0, -0.5372992, 0.8433917, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+16, 181278, 558, 3, 227.2913, 19.90919, -0.064963, 2.373644, 0, 0, 0.9271832, 0.3746083, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+17, 181278, 558, 3, 228.8909, -161.9393, 26.5913, 5.096362, 0, 0, -0.5591927, 0.8290377, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+18, 181278, 558, 3, -131.8954, -251.1024, 26.41008, 1.710422, 0, 0, 0.7547092, 0.6560594, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+19, 181278, 558, 3, -125.7593, -306.7307, 26.83068, 4.886924, 0, 0, -0.642787, 0.766045, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+20, 181278, 558, 3, -57.6584, -360.2921, 26.6024, 5.585054, 0, 0, -0.34202, 0.9396927, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+21, 181278, 558, 3, -51.59011, -414.0334, 26.58849, 3.752462, 0, 0, -0.9537163, 0.3007079, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+22, 181278, 558, 3, -18.58161, -360.2785, 26.58882, 3.857183, 0, 0, -0.9366713, 0.3502098, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+23, 181278, 558, 3, 23.0257, -347.8315, 30.97245, 0.4014249, 0, 0, 0.1993675, 0.9799248, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+24, 181278, 558, 3, 29.30264, -409.0062, 26.58651, 5.427975, 0, 0, -0.4146929, 0.9099615, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+25, 181556, 558, 3, 93.35276, -393.1155, 27.12383, 5.270896, 0, 0, -0.4848089, 0.8746201, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+26, 181556, 558, 3, 177.4723, -9.883485, -0.765356, 6.108654, 0, 0, -0.08715534, 0.9961947, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+27, 181556, 558, 3, 213.9826, -2.980433, 27.15875, 0.6632232, 0, 0, 0.3255672, 0.9455189, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+28, 181556, 558, 3, -154.2153, -256.8246, 24.38399, 5.148723, 0, 0, -0.5372992, 0.8433917, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+29, 181556, 558, 3, 173.9158, 17.96067, -1.269871, 6.003934, 0, 0, -0.1391726, 0.9902682, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+30, 181556, 558, 3, 225.6951, -15.2342, 3.6775, 0, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+31, 181556, 558, 3, 119.3374, 12.9238, -1.999392, 0.5235979, 0, 0, 0.2588186, 0.9659259, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+32, 181556, 558, 3, 241.2551, -184.8669, 28.4516, 0, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+33, 181556, 558, 3, -133.9016, -287.2106, 25.89139, 1.239183, 0, 0, 0.5807028, 0.8141156, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+34, 181556, 558, 3, 217.0418, 18.01212, 1.78935, 5.916668, 0, 0, -0.1822348, 0.983255, 86400, 86400, 100, 1), -- Adamantite Deposit
(@OGUID+35, 181569, 558, 3, 173.9158, 17.96067, -1.269871, 6.003934, 0, 0, -0.1391726, 0.9902682, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+36, 181569, 558, 3, -154.2153, -256.8246, 24.38399, 5.148723, 0, 0, -0.5372992, 0.8433917, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+37, 181569, 558, 3, 241.2551, -184.8669, 28.4516, 0, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Rich Adamantite Deposit
(@OGUID+38, 181569, 558, 3, -133.9016, -287.2106, 25.89139, 1.239183, 0, 0, 0.5807028, 0.8141156, 86400, 86400, 100, 1), -- Rich Adamantite Deposit
(@OGUID+39, 181569, 558, 3, 177.4723, -9.883485, -0.765356, 6.108654, 0, 0, -0.08715534, 0.9961947, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+40, 181569, 558, 3, 217.0418, 18.01212, 1.78935, 5.916668, 0, 0, -0.1822348, 0.983255, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+41, 181557, 558, 3, 217.0418, 18.01212, 1.78935, 5.916668, 0, 0, -0.1822348, 0.983255, 86400, 86400, 255, 1), -- Khorium
(@OGUID+42, 184936, 558, 3, 230.8704, -165.3993, 26.5913, 2.705255, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+43, 184937, 558, 3, 230.8704, -165.3993, 26.5913, 2.705255, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+44, 184936, 558, 3, -58.44398, -414.7479, 26.58382, 2.565632, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+45, 184937, 558, 3, -58.44398, -414.7479, 26.58382, 2.565632, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+46, 181569, 558, 3, 254.1934, -152.5304, 31.18292, 5.445428, 0, 0, -0.4067364, 0.9135455, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+47, 181569, 558, 3, -153.854, -290.5263, 24.57888, 5.427975, 0, 0, -0.4146929, 0.9099615, 86400, 86400, 255, 1), -- Rich Adamantite Deposit
(@OGUID+48, 181278, 558, 3, 31.04075, -359.3029, 26.59848, 5.619962, 0, 0, -0.3255672, 0.9455189, 86400, 86400, 100, 1), -- Ancient Lichen
(@OGUID+49, 184936, 558, 3, 239.61, -19.80, -0.06, 1.58, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+50, 184937, 558, 3, 239.61, -19.80, -0.06, 1.58, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Solid Adamantite Chest
(@OGUID+51, 184936, 558, 3, 145.96, 41.68, 4.26, 4.70, 0, 0, 0, 0, 86400, 86400, 100, 1), -- Bound Adamantite Chest
(@OGUID+52, 184937, 558, 3, 145.96, 41.68, 4.26, 4.70, 0, 0, 0, 0, 86400, 86400, 100, 1); -- Solid Adamantite Chest

-- ======
-- EVENTS
-- ======

INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `modelid`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
(@CGUID+2, 0, 22802, 0, 0, 0, 2); -- Exarch Maladaar (Feast of Winter Veil - Main Event)

-- INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
-- INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES

-- =======
-- POOLING
-- =======

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
(@PGUID+53, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #1'),
(@PGUID+54, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #2'),
(@PGUID+55, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #3'),
(@PGUID+56, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #4'),
(@PGUID+57, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #5'),
(@PGUID+58, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #6'),
(@PGUID+59, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit / Khorium - #7'),
(@PGUID+60, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #8'),
(@PGUID+61, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #9'),
(@PGUID+91, @PGUID+90, 0, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #1'),
(@PGUID+92, @PGUID+90, 0, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #2'),
(@PGUID+93, @PGUID+90, 0, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #3'),
(@PGUID+94, @PGUID+90, 0, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #4');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@PGUID+51, 5, 'Auchenai Crypts - Master Ancient Lichen (181278) Pool'),
(@PGUID+52, 3, 'Auchenai Crypts - Master Mineral Pool'),
(@PGUID+53, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #1'),
(@PGUID+54, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #2'),
(@PGUID+55, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #3'),
(@PGUID+56, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #4'),
(@PGUID+57, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #5'),
(@PGUID+58, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #6'),
(@PGUID+59, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit / Khorium - #7'),
(@PGUID+60, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #8'),
(@PGUID+61, 1, 'Auchenai Crypts - Adamantite Deposit / Rich Adamantite Deposit - #9'),
(@PGUID+90, 1, 'Auchenai Crypts - Master Chest Pool'),
(@PGUID+91, 1, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #1'),
(@PGUID+92, 1, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #2'),
(@PGUID+93, 1, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #3'),
(@PGUID+94, 1, 'Auchenai Crypts - Bound / Solid Adamantite Chest - #4');

-- INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@OGUID+1, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+2, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+3, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+12, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+13, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+14, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+15, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+16, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+17, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+18, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+19, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+20, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+21, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+22, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+23, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+24, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+48, @PGUID+51, 0, 'Auchenai Crypts - Ancient Lichen (181278)'),
(@OGUID+25, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit (181556)'),
(@OGUID+30, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit (181556)'),
(@OGUID+31, @PGUID+52, 0, 'Auchenai Crypts - Adamantite Deposit (181556)'),
(@OGUID+6, @PGUID+53, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #1'),
(@OGUID+27, @PGUID+53, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #1'),
(@OGUID+26, @PGUID+54, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #2'),
(@OGUID+39, @PGUID+54, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #2'),
(@OGUID+28, @PGUID+55, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #3'),
(@OGUID+36, @PGUID+55, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #3'),
(@OGUID+29, @PGUID+56, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #4'),
(@OGUID+35, @PGUID+56, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #4'),
(@OGUID+32, @PGUID+57, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #5'),
(@OGUID+37, @PGUID+57, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #5'),
(@OGUID+33, @PGUID+58, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #6'),
(@OGUID+38, @PGUID+58, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #6'),
(@OGUID+34, @PGUID+59, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #7'),
(@OGUID+40, @PGUID+59, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #7'),
(@OGUID+41, @PGUID+59, 0, 'Auchenai Crypts - Khorium (181557) - #7'),
(@OGUID+5, @PGUID+60, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #8'),
(@OGUID+46, @PGUID+60, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #8'),
(@OGUID+4, @PGUID+61, 0, 'Auchenai Crypts - Adamantite Deposit (181556) - #9'),
(@OGUID+47, @PGUID+61, 0, 'Auchenai Crypts - Rich Adamantite Deposit (181569) - #9'),
(@OGUID+42, @PGUID+91, 0, 'Auchenai Crypts - Bound Adamantite Chest (184936) - #1'),
(@OGUID+43, @PGUID+91, 0, 'Auchenai Crypts - Solid Adamantite Chest (184937) - #1'),
(@OGUID+44, @PGUID+92, 0, 'Auchenai Crypts - Bound Adamantite Chest (184936) - #2'),
(@OGUID+45, @PGUID+92, 0, 'Auchenai Crypts - Solid Adamantite Chest (184937) - #2'),
(@OGUID+49, @PGUID+93, 0, 'Auchenai Crypts - Bound Adamantite Chest (184936) - #3'),
(@OGUID+50, @PGUID+93, 0, 'Auchenai Crypts - Solid Adamantite Chest (184937) - #3'),
(@OGUID+51, @PGUID+94, 0, 'Auchenai Crypts - Bound Adamantite Chest (184936) - #4'),
(@OGUID+52, @PGUID+94, 0, 'Auchenai Crypts - Solid Adamantite Chest (184937) - #4');

-- INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES

-- =========
-- DBSCRIPTS
-- =========

DELETE FROM dbscripts_on_creature_movement WHERE id IN (8336004,8336007,8336701,8336903,8336907,8337007,8337013,8337403,8338003,8338309,8338313,10131510);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1877801,1849701,1855601,1855701,1855801,1855901,1855602,1855603,1849301,1855604,1855605,1855606,1855607,1855608,1855609,1855610,1855611,1855612);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1849301, 3000, 15, 32930, 0, 0, 18778, @CGUID+158, 17, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Blue Beam'),
(1849301, 5000, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pause Waypoints'),
--
(1849701, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Auchenai Monk - Set Stand State Kneel'),
(1849701, 29000, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Auchenai Monk - Set Stand State Stand'),
--
(1855601, 1000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Soldier - Cast Phase In'),
(1855601, 4000, 14, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Soldier - Remove Phase In'),
(1855602, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Stalker Invisible'),
(1855602, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855602, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 102.75, -32.9438, 2.43739, 1.5496, 'Teleport Phasing Stalker To New Location'),
(1855602, 26000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855602, 26000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855602, 27000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Stalker Visible'),
(1855603, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Stalker Invisible'),
(1855603, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855603, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 61.6461, 14.3518, 2.72275, 3.56513, 'Teleport Phasing Stalker To Original Spawn Location'),
(1855603, 26000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855603, 26000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855603, 27000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Stalker Visible'),
(1855604, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Invisible'),
(1855604, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855604, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 253.711, 13.7156, 0.741836, 3.9325, 'Teleport Phasing Cleric To New Location'),
(1855604, 26000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore faction'),
(1855604, 26000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855604, 27000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Visible'),
(1855605, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Invisible'),
(1855605, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 169.078, -17.6317, 2.71439, 0.86237, 'Teleport Phasing Cleric To Original Spawn Location'),
(1855605, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855605, 26000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855605, 26000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855605, 27000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Visible'),
(1855606, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Soldier Invisible'),
(1855606, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855606, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 129.739, -8.92777, 0.819057, 1.72631, 'Teleport Phasing Soldier To New Location'),
(1855606, 26000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855606, 26000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855606, 27000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Soldier Visible'),
(1855607, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Soldier Invisible'),
(1855607, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855607, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 126.307, 33.2078, -0.113875, 4.8467, 'Teleport Phasing Soldier To Original Spawn Location'),
(1855607, 26000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855607, 26000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855607, 27000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Soldier Visible'),
(1855608, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Invisible'),
(1855608, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 68.5056, -155.576, 15.346, 3.13688, 'Teleport Phasing Cleric To Spawn Location'),
(1855608, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855608, 176000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855608, 176000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855608, 177000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Visible'),
(1855609, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Soldier Invisible'),
(1855609, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 119.912, -167.935, 13.5053, 3.2492, 'Teleport Phasing Soldier To Spawn Location'),
(1855609, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855609, 176000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855609, 176000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855609, 177000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Soldier Visible'),
(1855610, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Invisible'),
(1855610, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 243.299, -180.867, 28.6406, 2.88163, 'Teleport Phasing Cleric To Next Location'),
(1855610, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855610, 116000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855610, 116000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855610, 117000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Visible'),
(1855611, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Invisible'),
(1855611, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855611, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 249.466, -144.105, 29.6535, 2.93661, 'Teleport Phasing Cleric To Spawn Location'),
(1855611, 116000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855611, 116000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855611, 117000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Cleric Visible'),
(1855612, 0, 15, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Warrior Invisible'),
(1855612, 2000, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 218.466, 3.71303, 29.0994, 4.74537, 'Teleport Phasing Warrior To Spawn Location'),
(1855612, 2000, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Temp Friendly Faction'),
(1855612, 236000, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Restore Faction'),
(1855612, 236000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Phase-In'),
(1855612, 237000, 14, 10032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Turn Phasing Warrior Visible'),
--
(1855701, 1000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Cleric - Cast Phase In'),
(1855701, 4000, 14, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Cleric - Remove Phase In'),
--
(1855801, 1000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Sorcerer - Cast Phase In'),
(1855801, 4000, 14, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Sorcerer - Remove Phase In'),
--
(1855901, 1000, 15, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Stalker - Cast Phase In'),
(1855901, 4000, 14, 33422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phasing Stalker - Remove Phase In'),
--
(1877801, 0, 15, 32459, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cosmetic Raging Soul - Cast Raging Soul Visual');

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


