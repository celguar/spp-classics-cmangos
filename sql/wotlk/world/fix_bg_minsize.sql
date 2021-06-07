-- Fix BGs require full team to start
UPDATE `battleground_template` SET `MinPlayersPerTeam`='20' WHERE  `id`=1;
UPDATE `battleground_template` SET `MinPlayersPerTeam`='5' WHERE  `id`=2;
UPDATE `battleground_template` SET `MinPlayersPerTeam`='8' WHERE  `id`=3;
UPDATE `battleground_template` SET `MinPlayersPerTeam`='8' WHERE  `id`=7;
UPDATE `battleground_template` SET `MinPlayersPerTeam`='8' WHERE  `id`=9;
