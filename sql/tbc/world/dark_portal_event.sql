SET @PROUD1 := (SELECT max(guid)+1 FROM creature);
SET @PROUD2 := (SELECT max(guid)+2 FROM creature);

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (@PROUD1, 19942, 0, 1, 0, 19942, -11817.1, -3228.75, -30.5221, 0.67268, 25, 25, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (@PROUD2, 19942, 0, 1, 0, 0, -11797.6, -3193.6, -28.7019, 3.04064, 25, 25, 0, 0, 0, 0, 0, 0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES ('42457', '-100');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES ('2723', '-100');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES ('2724', '-100');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES ('2725', '-100');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (@PROUD1, '-100');
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (@PROUD2, '100');
UPDATE `creature_template` SET `Faction`='1767' WHERE  `Entry`=19322;
