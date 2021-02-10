-- set LFG primary quests daily
UPDATE `quest_template` SET `QuestFlags` = `QuestFlags` | 4096 WHERE `entry` IN
    (SELECT `firstQuestId` FROM `lfg_dungeon_rewards` WHERE `otherQuestId` != 0);