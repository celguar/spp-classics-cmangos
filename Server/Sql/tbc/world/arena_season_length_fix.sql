-- Fix Arena Season ending while server is running
UPDATE `game_event` SET `length`='2592000', `schedule_type`='0' WHERE  `entry` IN(53,54,55,56);
