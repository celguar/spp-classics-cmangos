-- Fix Snowfall GY Horde Spirit Guide not spawned when captured
UPDATE `creature_battleground` SET `event2`='3' WHERE  `guid`=150390;
-- Fix Snowfall GY Alliance Spirit Guide linked to wrong GY
UPDATE `creature_battleground` SET `event1`='3' WHERE  `guid`=150383;
-- Fix Horde Cave Spirit Guide being in 2.4 + position
UPDATE `creature` SET `position_x`='-818.557', `position_y`='-619,255', `position_z`='54,0388', `orientation`='2,527235' WHERE  `guid`=150395;
-- Fix Snowfall Alliance Contested flag not being usable by Horde
UPDATE `gameobject_template` SET `flags`='0' WHERE  `entry`=179286;
UPDATE `gameobject_template` SET `flags`='32' WHERE  `entry`=179424;
UPDATE `gameobject_template` SET `flags`='32' WHERE  `entry`=179425;
