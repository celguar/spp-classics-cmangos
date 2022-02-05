-- add spell script for removing fire barrier after Felmyst kill
INSERT INTO `spell_scripts` (`Id`, `ScriptName`) VALUES ('46650', 'spell_break_fire');
-- make kalecgos visible from further distance to be able to see spell that removes fire barrier
UPDATE `creature_template` SET `visibilityDistanceType`='3' WHERE  `Entry`=24844;
