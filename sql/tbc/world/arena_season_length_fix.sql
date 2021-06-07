-- Fix Arena Season ending while server is running
UPDATE `game_event` SET `length`='2592000' WHERE  `entry`=53;
UPDATE `game_event` SET `length`='2592000' WHERE  `entry`=54;
UPDATE `game_event` SET `length`='2592000' WHERE  `entry`=55;
UPDATE `game_event` SET `length`='2592000' WHERE  `entry`=56;