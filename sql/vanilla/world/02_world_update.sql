-- Fix Staghelm Point (Silithus) exploration
UPDATE `achievement_criteria_dbc` SET `Asset_Id`='1022' WHERE  `ID`=1472;
-- Delete new zones from exploration
-- EK
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=1550;
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=1551;
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=1796;
-- Kalimdor
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=1600;
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=1601;
-- Ruins of Scarlet Enclave
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=8749;
-- Add Pathfinder Achievement for exploring old world
-- Set World Explorer achievement to wrath
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=46;
-- ghostlands
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=858;
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_enGB`, `Title_Lang_koKR`, `Title_Lang_frFR`, `Title_Lang_deDE`, `Title_Lang_enCN`, `Title_Lang_zhCN`, `Title_Lang_enTW`, `Title_Lang_zhTW`, `Title_Lang_esES`, `Title_Lang_esMX`, `Title_Lang_ruRU`, `Title_Lang_ptPT`, `Title_Lang_ptBR`, `Title_Lang_itIT`, `Title_Lang_Unk`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_enUS`, `Reward_Lang_enGB`, `Reward_Lang_koKR`, `Reward_Lang_frFR`, `Reward_Lang_deDE`, `Reward_Lang_enCN`, `Reward_Lang_zhCN`, `Reward_Lang_enTW`, `Reward_Lang_zhTW`, `Reward_Lang_esES`, `Reward_Lang_esMX`, `Reward_Lang_ruRU`, `Reward_Lang_ptPT`, `Reward_Lang_ptBR`, `Reward_Lang_itIT`, `Reward_Lang_Unk`, `Reward_Lang_Mask`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES
(47, -1, -1, 0, 'Pathfinder', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 'Explore Eastern Kingdoms and Kalimdor.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 97, 50, 5, 0, 3720, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('93', '47', '8', '42', '1', 'Eastern Kingdoms', '16712190', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('92', '47', '8', '43', '1', 'Kalimdor', '16712190', '2');
-- Fix INVALID CRITERIA in Explore due to wrong order
-- EK
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='13' WHERE  `ID`=1291;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='14' WHERE  `ID`=1292;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='15' WHERE  `ID`=1293;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='16' WHERE  `ID`=1294;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='17' WHERE  `ID`=1295;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='18' WHERE  `ID`=1297;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='19' WHERE  `ID`=1298;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='20' WHERE  `ID`=1282;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='21' WHERE  `ID`=1296;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='22' WHERE  `ID`=1286;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='4' WHERE  `ID`=1489;
-- Kalimdor
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='5' WHERE  `ID`=1490;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='6' WHERE  `ID`=1491;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='7' WHERE  `ID`=1492;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='8' WHERE  `ID`=1493;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='9' WHERE  `ID`=1494;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='20' WHERE  `ID`=1495;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='11' WHERE  `ID`=1496;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='10' WHERE  `ID`=1495;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='12' WHERE  `ID`=1497;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='13' WHERE  `ID`=1498;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='14' WHERE  `ID`=1499;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='15' WHERE  `ID`=1500;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='16' WHERE  `ID`=1501;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='17' WHERE  `ID`=1502;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='18' WHERE  `ID`=1503;
-- Make PvP Rank achievements normal and superceded
-- UPDATE `achievement_dbc` SET `Supercedes`='442' WHERE  `ID`=470;
-- UPDATE `achievement_dbc` SET `Supercedes`='470' WHERE  `ID`=471;
-- UPDATE `achievement_dbc` SET `Supercedes`='471' WHERE  `ID`=441;
-- UPDATE `achievement_dbc` SET `Supercedes`='441' WHERE  `ID`=440;
-- UPDATE `achievement_dbc` SET `Supercedes`='440' WHERE  `ID`=439;

-- Add Custom 6 Bank Slots achievement
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`, `Reward_Lang_Mask`) VALUES ('548', '-1', '-1', 'Bank You Very Much', 'Buy 6 additional bank slots.', '92', '10', '11', '2', '16712174');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Flags`, `Ui_Order`) VALUES ('751', '548', '45', '6', 'Purchase 6 bank slots', '16712190', '1', '1');
-- Lock out 7 Bank Slots to wrath
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=546;
-- Cenarius Circle and Refuge reputation lock to tbc+
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=953;

-- Emblem achievements are for wotlk
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID` IN (4785,4784,4729,4730,3838,3839,3840,3841,3842,3843,3844,3876,4316);

-- Champ of Frozen Wastes
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1658;

-- Glory of Wotlk PvE
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=2136;
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=2137;
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=2138;

-- Visit Barbershop
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=545;

-- Grand Master Proffs (wotlk)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID` IN (125,130,135,734,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427);
-- Master Proffs (tbc)
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID` IN (124,129,134,733);
-- Master Angler (booty bay or wotlk stuff)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=306;

-- Grand Master in 2 proff
-- lock wotlk achievement
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=735;
-- add new
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`, `Minimum_Criteria`) VALUES ('737', '-1', '-1', 'Working Overtime', 'Become an Artisan in two professions.', '169', '10', '6', '2840', '2');
-- add new criteria
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (9, 737, 40, 171, 6, 0, 0, 0, 0, 'Alchemy', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 1);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (10, 737, 40, 164, 6, 0, 0, 0, 0, 'Blacksmithing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 2);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (11, 737, 40, 333, 6, 0, 0, 0, 0, 'Enchanting', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 3);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (12, 737, 40, 202, 6, 0, 0, 0, 0, 'Engineering', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 4);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (13, 737, 40, 182, 6, 0, 0, 0, 0, 'Herbalism', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 5);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (14, 737, 40, 165, 6, 0, 0, 0, 0, 'Leatherworking', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 6);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (15, 737, 40, 186, 6, 0, 0, 0, 0, 'Mining', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 7);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (16, 737, 40, 393, 6, 0, 0, 0, 0, 'Skinning', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 8);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (17, 737, 40, 197, 6, 0, 0, 0, 0, 'Tailoring', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 2, 0, 0, 0, 9);

-- Skills to pay the bills (grand master fish, first aid, cook)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=730;

-- First Aid
-- Stock Up (frost bandage)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=137;
-- Replace Stock up
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`) VALUES ('138', '-1', '-1', 'Bandage Dispenser', 'Create 500 Heavy Runecloth Bandages.', '172', '10', '6', '1621');
-- criteria
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Flags`, `Ui_Order`) VALUES ('1833', '138', '29', '18630', '500', 'Create 500 Heavy Runecloth Bandages', '16712190', '1', '1');
-- criteria data
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES ('1833', '0', '0');
-- Ultimate Triage (frost bandage)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=141;
-- Replace
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`) VALUES ('142', '-1', '-1', 'Medic!', 'Use a Heavy Runecloth Bandage to heal another player or yourself with less than 5% health.', '172', '10', '7', '3840');
-- criteria
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Flags`, `Ui_Order`) VALUES ('6801', '142', '110', '18610', '1', 'First Aid Below 5%', '16712190', '2', '1');
-- criteria data
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES ('6801', '3', '5');

-- COOKING
-- tbc
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID` IN (1800);
-- wotlk achievements
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID` IN (1563,3296,2002,2001,2000,1999,1998,1801,1801,1784,1781,1782,1783,1777,1778,1779,906,877,1780);

-- FISHING
-- tbc
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID` IN (144,726,905,1225,1243,1257,1836,1837);
-- wotlk
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID` IN (1516,1517,1957,1958,2094,2095,2096,3217,3218);
-- TODO copy 1257 achievement with removed 1 criteroa that is TBC

-- QUESTS
-- Daily quest tbc
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID` IN (97,759,973,974,975,976,977,1525,1526,31,759);
-- Nesingwary
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=941;
-- Nagrand + Zul Drak arena
-- TODO Separate for tbc
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1576;
-- Loremaster
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1681;
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1682;

-- FIRST REALM
-- First BE 80
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=1405;

-- PVP
-- Kill every class - remove DK and fix order
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=2359;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='1' WHERE  `ID`=2360;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='2' WHERE  `ID`=2361;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='3' WHERE  `ID`=2362;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='4' WHERE  `ID`=2363;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='5' WHERE  `ID`=2364;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='6' WHERE  `ID`=2365;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='7' WHERE  `ID`=2366;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='8' WHERE  `ID`=2367;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='9' WHERE  `ID`=2368;
-- Kill every race - remove blood elf
UPDATE `achievement_dbc` SET `Description_Lang_enUS`='Get an honorable, killing blow on four different races.' WHERE  `ID`=246;
UPDATE `achievement_dbc` SET `Description_Lang_enUS`='Get an honorable, killing blow on four different races.' WHERE  `ID`=1005;
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=2369;
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=2374;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='1' WHERE  `ID`=2370;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='2' WHERE  `ID`=2371;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='3' WHERE  `ID`=2372;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='4' WHERE  `ID`=2373;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='1' WHERE  `ID`=2375;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='2' WHERE  `ID`=2376;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='3' WHERE  `ID`=2377;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='4' WHERE  `ID`=2378;
-- Kill in every city - remove tbc cities
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=6639;
DELETE FROM `achievement_criteria_dbc` WHERE  `ID`=6634;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='3' WHERE  `ID`=6640;
UPDATE `achievement_criteria_dbc` SET `Ui_Order`='2' WHERE  `ID`=6635;
-- Kill Blood elf leader
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=613;
-- Kill Draenei leader
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=618;
-- Kill Varian
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=615;
-- New Achievement Kill Bolvar (classic)
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `IconID`, `Reward_Lang_Mask`) VALUES ('620', '0', '0', 'Do I smell fire?', '16712190', 'Kill Highlord Bolvar Fordragon.', '16712190', '95', '10', '26', '3671', '16712174');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('5204', '620', '0', '1748', '1', 'Highlord Bolvar Fordragon', '2', '1');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES ('5204', '0', '0');
-- Grizzled Veteran (wotlk)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=2016;
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=2017;
-- Kill Enemy Leaders - set to tbc+
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=619;
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=614;
-- New achievement Kill Enemy Leaders (classic)
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `IconID`, `Reward_Lang_Mask`) VALUES ('702', '0', '-1', 'For The Horde!', '16712190', 'Slay the leaders of the Alliance.', '16712190', '95', '20', '30', '1703', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('574', '702', '8', '620', '0', 'Do I smell fire?', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('575', '702', '8', '616', '0', 'Death to the King!', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('576', '702', '8', '617', '0', 'Immortal No More', '0', '3');
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `IconID`, `Reward_Lang_Mask`) VALUES ('703', '1', '-1', 'For The Alliance!', '16712190', 'Slay the leaders of the Horde.', '16712190', '95', '20', '25', '1704', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('577', '703', '8', '610', '0', 'Death to the Warchief!', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('578', '703', '8', '611', '0', 'Bleeding Bloodhoof', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('579', '703', '8', '612', '0', 'Downing the Dark Lady', '0', '3');

-- PVE
-- Naxxramas
-- Achievement Kill KT
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`, `Minimum_Criteria`) VALUES ('715', '-1', 'Naxxramas', 'Defeat Kel\'Thuzad', '14808', '10', '26', '4075', '1');
-- Move Leeroy Achievement after Naxx
UPDATE `achievement_dbc` SET `Ui_Order`='27' WHERE  `ID`=2188;
-- criteria
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('593', '715', '15990', '1', 'Kel\'Thuzad', '2', '1');
-- add Naxx to Classic Raider
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Description_Lang_enUS`, `Ui_Order`) VALUES ('4008', '1285', '8', '715', 'Naxxramas', '6');
-- tbc achievements
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID` IN (4476,4477,4478);

-- GENERAL
-- Riding skill flying
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=890;
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=892;
-- Higher Learning (wotlk)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1956;
-- wotlk achievements
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID` IN (2076,2078,2081,2084,2097,2557,2716);
-- Master of Arms (wotlk)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=705;
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`, `Minimum_Criteria`) VALUES ('930', '-1', '-1', 'Master of Arms', '16712190', 'Raise four weapon skills to 300.', '16712190', '92', '10', '9', '0', '279', '16712190', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1759', '930', '7', '44', '300', 'Axes', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1760', '930', '7', '45', '300', 'Bows', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1761', '930', '7', '226', '300', 'Crossbows', '0', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1769', '930', '7', '173', '300', 'Daggers', '0', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1774', '930', '7', '46', '300', 'Guns', '0', '5');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1790', '930', '7', '54', '300', 'Maces', '0', '6');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1796', '930', '7', '229', '300', 'Polearms', '0', '7');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1797', '930', '7', '136', '300', 'Staves', '0', '8');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1798', '930', '7', '43', '300', 'Swords', '0', '9');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1948', '930', '7', '172', '300', 'Two-Handed Axes', '0', '10');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1967', '930', '7', '55', '300', 'Two-Handed Swords', '0', '11');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1968', '930', '7', '160', '300', 'Two-Handed Maces', '0', '12');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1969', '930', '7', '162', '300', 'Unarmed', '0', '13');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1970', '930', '7', '228', '300', 'Wands', '0', '14');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1972', '930', '7', '176', '300', 'Thrown', '0', '15');
-- Did Somebody Order a Knuckle Sandwich? (wotlk)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=16;
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('935', '-1', '-1', 'Did Somebody Order a Knuckle Sandwich?', '16712190', 'Raise your unarmed skill to 300.', '16712190', '92', '10', '10', '0', '1997', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1973', '935', '7', '162', '300', 'Unarmed skill raised to 300', '1', '1');
-- Epic (wotlk)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=556;
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('936', '-1', '-1', 'Epic', '16712190', 'Equip an epic item in every slot with a minimum item level of 65.', '16712190', '92', '25', '31', '0', '2808', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1974', '936', '49', '0', '1', 'Head', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1975', '936', '49', '1', '1', 'Neck', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1976', '936', '49', '2', '1', 'Shoulder', '0', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1977', '936', '49', '4', '1', 'Chest', '0', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1978', '936', '49', '5', '1', 'Waist', '0', '5');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1979', '936', '49', '6', '1', 'Legs', '0', '6');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1980', '936', '49', '7', '1', 'Feet', '0', '7');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1981', '936', '49', '8', '1', 'Wrist', '0', '8');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1982', '936', '49', '9', '1', 'Hands', '0', '9');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1983', '936', '49', '10', '1', 'Left Ring', '0', '10');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1984', '936', '49', '12', '1', 'First Trinket', '0', '12');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1985', '936', '49', '14', '1', 'Cloak', '0', '14');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1986', '936', '49', '15', '1', 'Weapon', '0', '15');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1987', '936', '49', '17', '1', 'Ranged', '0', '16');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1988', '936', '49', '11', '1', 'Right Ring', '0', '11');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1989', '936', '49', '13', '1', 'Second Trinket', '0', '13');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1974', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1975', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1976', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1977', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1978', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1979', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1980', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1981', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1982', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1983', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1984', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1985', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1986', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1987', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1988', '19', '65', '4');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1989', '19', '65', '4');
-- Superior (wotlk)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=557;
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('954', '-1', '-1', 'Superior', '16712190', 'Equip an superior item in every slot with a minimum item level of 57.', '16712190', '92', '10', '32', '0', '133', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1990', '954', '49', '0', '1', 'Head', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1994', '954', '49', '1', '1', 'Neck', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1995', '954', '49', '2', '1', 'Shoulder', '0', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1996', '954', '49', '4', '1', 'Chest', '0', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2018', '954', '49', '5', '1', 'Waist', '0', '5');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2019', '954', '49', '6', '1', 'Legs', '0', '6');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2021', '954', '49', '7', '1', 'Feet', '0', '7');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2025', '954', '49', '8', '1', 'Wrist', '0', '8');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2026', '954', '49', '9', '1', 'Hands', '0', '9');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2027', '954', '49', '10', '1', 'Left Ring', '0', '10');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2028', '954', '49', '12', '1', 'First Trinket', '0', '12');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2029', '954', '49', '14', '1', 'Cloak', '0', '14');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2038', '954', '49', '15', '1', 'Weapon', '0', '15');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2047', '954', '49', '17', '1', 'Ranged', '0', '16');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2088', '954', '49', '11', '1', 'Right Ring', '0', '11');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('2089', '954', '49', '13', '1', 'Second Trinket', '0', '13');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1990', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1994', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1995', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('1996', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2018', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2019', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2021', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2025', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2026', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2027', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2028', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2029', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2038', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2047', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2088', '19', '57', '3');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES ('2089', '19', '57', '3');

-- REPUTATION
-- Argent Champion (Wotlk faction)
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=945;
-- The Diplomat (TBC factions)
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=942;
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=943;
-- Ambassador Achievement
-- ALLIANCE
-- old achievement set patch to tbc+
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=948;
-- new achievement (Agent of the Alliance)
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`) VALUES ('1001', '1', '-1', 'Agent of the Alliance', 'Earn exalted reputation with 4 home cities.', '201', '10', '11', '3375');
-- new criteria
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('5', '1001', '46', '72', '42000', 'Exalted Stormwind', '16712190', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('6', '1001', '46', '47', '42000', 'Exalted Ironforge', '16712190', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('7', '1001', '46', '69', '42000', 'Exalted Darnassus', '16712190', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('8', '1001', '46', '54', '42000', 'Exalted Gnomeregan Exiles', '16712190', '4');
-- HORDE
-- old achievement set patch to tbc+
UPDATE `achievement_dbc` SET `patch`='1' WHERE  `ID`=762;
-- new achievement (Agent of the Horde)
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`) VALUES ('1002', '0', '-1', 'Agent of the Horde', 'Earn exalted reputation with 4 home cities.', '201', '10', '10', '3374');
-- new criteria
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('1', '1002', '46', '76', '42000', 'Exalted Orgrimmar', '16712190', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('2', '1002', '46', '81', '42000', 'Exalted Thunder Bluff', '16712190', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('3', '1002', '46', '68', '42000', 'Exalted Undercity', '16712190', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Ui_Order`) VALUES ('4', '1002', '46', '530', '42000', 'Exalted Darkspear Trolls', '16712190', '4');

-- WORLD EVENTS
-- Halloween
-- A Mask for All Occasions
-- old achievement set patch to tbc+
UPDATE `achievement_dbc` SET `patch`='1' WHERE `ID`=284;
-- new achievement
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Description_Lang_enUS`, `Category`, `Points`, `Ui_Order`, `IconID`) VALUES ('982', '-1', '-1', 'A Mask for All Occasions', 'Collect the 16 unique Flimsy Masks listed below.', '158', '20', '22', '2953');
-- new criteria
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1799, 982, 36, 20562, 1, 0, 0, 0, 0, 'Flimsy Female Dwarf Mask', '', 16712190, 0, 0, 0, 0, 1);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1836, 982, 36, 20392, 1, 0, 0, 0, 0, 'Flimsy Female Gnome Mask', '', 16712190, 0, 0, 0, 0, 2);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1845, 982, 36, 20565, 1, 0, 0, 0, 0, 'Flimsy Female Human Mask', '', 16712190, 0, 0, 0, 0, 3);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1861, 982, 36, 20563, 1, 0, 0, 0, 0, 'Flimsy Female Nightelf Mask', '', 16712190, 0, 0, 0, 0, 4);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1862, 982, 36, 20569, 1, 0, 0, 0, 0, 'Flimsy Female Orc Mask', '', 16712190, 0, 0, 0, 0, 5);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1864, 982, 36, 20571, 1, 0, 0, 0, 0, 'Flimsy Female Tauren Mask', '', 16712190, 0, 0, 0, 0, 6);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1865, 982, 36, 20567, 1, 0, 0, 0, 0, 'Flimsy Female Troll Mask', '', 16712190, 0, 0, 0, 0, 7);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1866, 982, 36, 20574, 1, 0, 0, 0, 0, 'Flimsy Female Undead Mask', '', 16712190, 0, 0, 0, 0, 8);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1876, 982, 36, 20561, 1, 0, 0, 0, 0, 'Flimsy Male Dwarf Mask', '', 16712190, 0, 0, 0, 0, 9);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1885, 982, 36, 20391, 1, 0, 0, 0, 0, 'Flimsy Male Gnome Mask', '', 16712190, 0, 0, 0, 0, 10);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1895, 982, 36, 20566, 1, 0, 0, 0, 0, 'Flimsy Male Human Mask', '', 16712190, 0, 0, 0, 0, 11);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1897, 982, 36, 20564, 1, 0, 0, 0, 0, 'Flimsy Male Nightelf Mask', '', 16712190, 0, 0, 0, 0, 12);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1898, 982, 36, 20570, 1, 0, 0, 0, 0, 'Flimsy Male Orc Mask', '', 16712190, 0, 0, 0, 0, 13);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1900, 982, 36, 20572, 1, 0, 0, 0, 0, 'Flimsy Male Tauren Mask', '', 16712190, 0, 0, 0, 0, 14);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1928, 982, 36, 20568, 1, 0, 0, 0, 0, 'Flimsy Male Troll Mask', '', 16712190, 0, 0, 0, 0, 15);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Start_Event`, `Start_Asset`, `Fail_Event`, `Fail_Asset`, `Description_Lang_enUS`, `Description_Lang_Unk`, `Description_Lang_Mask`, `Flags`, `Timer_Start_Event`, `Timer_Asset_Id`, `Timer_Time`, `Ui_Order`) VALUES (1929, 982, 36, 20573, 1, 0, 0, 0, 0, 'Flimsy Male Undead Mask', '', 16712190, 0, 0, 0, 0, 16);

-- TBC+ achievements
UPDATE `achievement_dbc` SET `patch`='1' WHERE `ID` IN (255,288,289,291,292,963,965,966,967,968,969,970,971,972,981,1261);

-- Winter Veil
-- TBC+ achievements
UPDATE `achievement_dbc` SET `patch`='1' WHERE `ID` IN (277,1295,1687,1688,1690,4436);

-- Custom
-- Ironman Challenge
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `IconID`, `Reward_Lang_Mask`) VALUES ('704', '-1', '-1', 'I Can\'t Believe You Have Done That!', '16712190', 'Reach max level without dying once.', '16712190', '81', '0', '161', '3582', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('580', '704', '5', '0', '100', 'Reach max level without dying once.', '0', '1');

-- Kalimdor Quests Achievements
-- (Horde) Durotar + Valley of Trials + Ragefire Chasm
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('716', '0', '-1', 'Durotar Loremaster', '16712190', 'Complete 46 quests in Durotar.', '16712190', '14861', '10', '6', '136', '3532', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('581', '716', '11', '14', '46', 'Durotar', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('582', '716', '11', '363', '46', 'Valley of Trials', '3', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('583', '716', '11', '2437', '46', 'Ragefire Chasm', '3', '3');
-- (Horde) Mulgore + Red Cloud Mesa
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('717', '0', '-1', 'Mulgore Loremaster', '16712190', 'Complete 35 quests in Mulgore.', '16712190', '14861', '10', '7', '136', '3562', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('584', '717', '11', '215', '35', 'Mulgore', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('704', '717', '11', '220', '35', 'Red Cloud Mesa', '3', '2');
-- (Horde) The Barrens + Wailing Caverns + Razorfen Kraul + Razorfen Downs
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('718', '0', '-1', 'The Barrens Loremaster', '16712190', 'Complete 98 quests in The Barrens.', '16712190', '14861', '10', '8', '136', '3547', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('585', '718', '11', '17', '98', 'The Barrens', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('586', '718', '11', '718', '98', 'Wailing Caverns', '3', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('587', '718', '11', '1717', '98', 'Razorfen Kraul', '3', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('588', '718', '11', '722', '98', 'Razorfen Downs', '3', '4');
-- (Horde) Thousand Needles
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('719', '0', '-1', 'Thousand Needles Loremaster', '16712190', 'Complete 52 quests in Thousand Needles.', '16712190', '14861', '10', '9', '136', '3580', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('589', '719', '11', '400', '52', 'Thousand Needles', '3', '1');
-- (Horde) Tanaris + Zul'Farrak
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('720', '0', '-1', 'Tanaris Loremaster', '16712190', 'Complete 76 quests in Tanaris.', '16712190', '14861', '10', '10', '136', '3577', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('590', '720', '11', '440', '76', 'Tanaris', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('591', '720', '11', '978', '76', 'Zul\'Farrak', '3', '1');
-- (Horde) Un'Goro Crater
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('721', '0', '-1', 'Un\'Goro Crater Loremaster', '16712190', 'Complete 41 quests in Un\'Goro Crater.', '16712190', '14861', '10', '11', '136', '3588', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('627', '721', '11', '490', '41', 'Un\'Goro Crater', '3', '1');
-- (Horde) Silithus
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('722', '0', '-1', 'Silithus Loremaster', '16712190', 'Complete 88 quests in Silithus.', '16712190', '14861', '10', '12', '136', '3567', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('628', '722', '11', '1377', '88', 'Silithus', '3', '1');
-- (Horde) Stonetalon Mountains
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('723', '0', '-1', 'Stonetalon Mountains Loremaster', '16712190', 'Complete 25 quests in Stonetalon Mountains.', '16712190', '14861', '10', '13', '136', '3578', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('629', '723', '11', '406', '25', 'Stonetalon Mountains', '3', '1');
-- (Horde) Dustwallow Marsh
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('724', '0', '-1', 'Dustwallow Marsh Loremaster', '16712190', 'Complete 30 quests in Dustwallow Marsh.', '16712190', '14861', '10', '14', '136', '3534', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('630', '724', '11', '15', '30', 'Dustwallow Marsh', '3', '1');
-- (Horde) Ashenvale + Blackfathom Deeps
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('738', '0', '-1', 'Ashenvale Loremaster', '16712190', 'Complete 29 quests in Ashenvale.', '16712190', '14861', '10', '15', '136', '3543', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('631', '738', '11', '331', '29', 'Ashenvale', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('632', '738', '11', '719', '29', 'Blackfathom Deeps', '3', '2');
-- (Horde) Feralas + Dire Maul
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('739', '0', '-1', 'Feralas Loremaster', '16712190', 'Complete 54 quests in Feralas.', '16712190', '14861', '10', '16', '136', '3539', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('633', '739', '11', '357', '54', 'Feralas', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('634', '739', '11', '2557', '54', 'Dire Maul', '3', '2');
-- (Horde) Desolace + Maraudon
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('740', '0', '-1', 'Desolace Loremaster', '16712190', 'Complete 38 quests in Desolace.', '16712190', '14861', '10', '17', '136', '3530', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('635', '740', '11', '405', '38', 'Desolace', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('636', '740', '11', '2100', '38', 'Maraudon', '3', '2');
-- (Horde) Felwood
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('741', '0', '-1', 'Felwood Loremaster', '16712190', 'Complete 54 quests in Felwood.', '16712190', '14861', '10', '18', '136', '3538', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('637', '741', '11', '361', '54', 'Felwood', '3', '1');
-- (Horde) Winterspring
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('742', '0', '-1', 'Winterspring Loremaster', '16712190', 'Complete 34 quests in Winterspring.', '16712190', '14861', '10', '19', '136', '3587', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('638', '742', '11', '618', '34', 'Winterspring', '3', '1');
-- (Horde) Azshara
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('743', '0', '-1', 'Azshara Loremaster', '16712190', 'Complete 26 quests in Azshara.', '16712190', '14861', '10', '20', '136', '3544', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('639', '743', '11', '16', '26', 'Azshara', '3', '1');
-- (Horde) old Kalimdor Lorenmaster achievement set patch to wotlk+
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1680;
-- (Horde) new Kalimdor Lorenmaster achievement
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('744', '0', '-1', 'Loremaster of Kalimdor', '16712190', 'Complete the quests in all zones of Kalimdor.', '16712190', '14861', '10', '21', '0', '3491', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('640', '744', '8', '716', '0', 'Durotar', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('642', '744', '8', '717', '0', 'Mulgore', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('643', '744', '8', '718', '0', 'The Barrens', '0', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('644', '744', '8', '719', '0', 'Thousand Needles', '0', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('647', '744', '8', '720', '0', 'Tanaris', '0', '5');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('649', '744', '8', '721', '0', 'Un\'Goro', '0', '6');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('650', '744', '8', '722', '0', 'Silithus', '0', '7');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('658', '744', '8', '723', '0', 'Stonetalon Mountains', '0', '8');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('659', '744', '8', '724', '0', 'Dustwallow Marsh', '0', '9');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('660', '744', '8', '738', '0', 'Ashenvale', '0', '10');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('661', '744', '8', '739', '0', 'Feralas', '0', '11');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('662', '744', '8', '740', '0', 'Desolace', '0', '12');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('663', '744', '8', '741', '0', 'Felwood', '0', '13');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('664', '744', '8', '742', '0', 'Winterspring', '0', '14');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('665', '744', '8', '743', '0', 'Azshara', '0', '15');

-- (Alliance) The Barrens + Wailing Caverns + Razorfen Kraul + Razorfen Downs
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('745', '1', '-1', 'The Barrens Loremaster', '16712190', 'Complete 25 quests in The Barrens.', '16712190', '14861', '10', '6', '136', '3547', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('666', '745', '11', '17', '25', 'The Barrens', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('667', '745', '11', '718', '25', 'Wailing Caverns', '3', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('668', '745', '11', '1717', '25', 'Razorfen Kraul', '3', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('669', '745', '11', '722', '25', 'Razorfen Downs', '3', '4');
-- (Alliance) Thousand Needles
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('746', '1', '-1', 'Thousand Needles Loremaster', '16712190', 'Complete 31 quests in Thousand Needles.', '16712190', '14861', '10', '7', '136', '3580', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('670', '746', '11', '400', '31', 'Thousand Needles', '3', '1');
-- (Alliance) Tanaris + Zul'Farrak
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('747', '1', '-1', 'Tanaris Loremaster', '16712190', 'Complete 75 quests in Tanaris.', '16712190', '14861', '10', '8', '136', '3577', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('671', '747', '11', '440', '75', 'Tanaris', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('672', '747', '11', '978', '75', 'Zul\'Farrak', '3', '1');
-- (Alliance) Un'Goro Crater
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('748', '1', '-1', 'Un\'Goro Crater Loremaster', '16712190', 'Complete 41 quests in Un\'Goro Crater.', '16712190', '14861', '10', '9', '136', '3588', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('673', '748', '11', '490', '41', 'Un\'Goro Crater', '3', '1');
-- (Alliance) Silithus
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('749', '1', '-1', 'Silithus Loremaster', '16712190', 'Complete 86 quests in Silithus.', '16712190', '14861', '10', '10', '136', '3567', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('674', '749', '11', '1377', '86', 'Silithus', '3', '1');
-- (Alliance) Stonetalon Mountains
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('751', '1', '-1', 'Stonetalon Mountains Loremaster', '16712190', 'Complete 20 quests in Stonetalon Mountains.', '16712190', '14861', '10', '11', '136', '3578', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('675', '751', '11', '406', '20', 'Stonetalon Mountains', '3', '1');
-- (Alliance) Dustwallow Marsh
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('754', '1', '-1', 'Dustwallow Marsh Loremaster', '16712190', 'Complete 23 quests in Dustwallow Marsh.', '16712190', '14861', '10', '12', '136', '3534', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('676', '754', '11', '15', '23', 'Dustwallow Marsh', '3', '1');
-- (Alliance) Ashenvale + Blackfathom Deeps
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('755', '1', '-1', 'Ashenvale Loremaster', '16712190', 'Complete 44 quests in Ashenvale.', '16712190', '14861', '10', '13', '136', '3543', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('677', '755', '11', '331', '44', 'Ashenvale', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('678', '755', '11', '719', '44', 'Blackfathom Deeps', '3', '2');
-- (Alliance) Feralas + Dire Maul
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('756', '1', '-1', 'Feralas Loremaster', '16712190', 'Complete 60 quests in Feralas.', '16712190', '14861', '10', '14', '136', '3539', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('679', '756', '11', '357', '60', 'Feralas', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('680', '756', '11', '2557', '60', 'Dire Maul', '3', '2');
-- (Alliance) Desolace + Maraudon
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('757', '1', '-1', 'Desolace Loremaster', '16712190', 'Complete 40 quests in Desolace.', '16712190', '14861', '10', '15', '136', '3530', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('681', '757', '11', '405', '40', 'Desolace', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('682', '757', '11', '2100', '40', 'Maraudon', '3', '2');
-- (Alliance) Felwood
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('758', '1', '-1', 'Felwood Loremaster', '16712190', 'Complete 53 quests in Felwood.', '16712190', '14861', '10', '16', '136', '3538', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('683', '758', '11', '361', '53', 'Felwood', '3', '1');
-- (Alliance) Winterspring
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('785', '1', '-1', 'Winterspring Loremaster', '16712190', 'Complete 40 quests in Winterspring.', '16712190', '14861', '10', '17', '136', '3587', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('684', '785', '11', '618', '40', 'Winterspring', '3', '1');
-- (Alliance) Azshara
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('786', '1', '-1', 'Azshara Loremaster', '16712190', 'Complete 20 quests in Azshara.', '16712190', '14861', '10', '18', '136', '3544', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('685', '786', '11', '16', '20', 'Azshara', '3', '1');
-- (Alliance) Darkshore
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('787', '1', '-1', 'Darkshore Loremaster', '16712190', 'Complete 62 quests in Darkshore.', '16712190', '14861', '10', '19', '136', '3553', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('686', '787', '11', '148', '62', 'Darkshore', '3', '1');
-- (Alliance) Teldrassil + Shadowglen
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('788', '1', '-1', 'Teldrassil Loremaster', '16712190', 'Complete 40 quests in Teldrassil.', '16712190', '14861', '10', '20', '136', '3528', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('687', '788', '11', '141', '40', 'Teldrassil', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('688', '788', '11', '188', '40', 'Shadowglen', '3', '2');
-- (Alliance) old Kalimdor Lorenmaster achievement set patch to wotlk+
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1678;
-- (Alliance) new Kalimdor Lorenmaster achievement
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('789', '1', '-1', 'Loremaster of Kalimdor', '16712190', 'Complete the quests in all zones of Kalimdor.', '16712190', '14861', '10', '21', '0', '3491', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('689', '789', '8', '745', '0', 'The Barrens', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('690', '789', '8', '746', '0', 'Thousand Needles', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('691', '789', '8', '747', '0', 'Tanaris', '0', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('692', '789', '8', '748', '0', 'Un\'Goro', '0', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('693', '789', '8', '749', '0', 'Silithus', '0', '5');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('694', '789', '8', '751', '0', 'Stonetalon Mountains', '0', '6');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('695', '789', '8', '754', '0', 'Dustwallow Marsh', '0', '7');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('696', '789', '8', '755', '0', 'Ashenvale', '0', '8');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('697', '789', '8', '756', '0', 'Feralas', '0', '9');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('698', '789', '8', '757', '0', 'Desolace', '0', '10');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('699', '789', '8', '758', '0', 'Felwood', '0', '11');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('700', '789', '8', '785', '0', 'Winterspring', '0', '12');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('701', '789', '8', '786', '0', 'Azshara', '0', '13');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('702', '789', '8', '787', '0', 'Darkshore', '0', '14');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('703', '789', '8', '788', '0', 'Teldrassil', '0', '15');

-- Eastern Kingdoms Quests Achievements
-- (Horde) Tirisfal Glades + Deathknell + Scarlet Monastery
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('790', '0', '-1', 'Tirisfal Glades Loremaster', '16712190', 'Complete 45 quests in Tirisfal Glades.', '16712190', '14861', '10', '22', '136', '3570', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('705', '790', '11', '85', '45', 'Tirisfal Glades', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('706', '790', '11', '154', '45', 'Deathknell', '3', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('715', '790', '11', '796', '45', 'Scarlet Monastery', '3', '3');
-- (Horde) Western Plaguelands + Scholomance
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('791', '0', '-1', 'Western Plaguelands Loremaster', '16712190', 'Complete 60 quests in Western Plaguelands.', '16712190', '14861', '10', '23', '136', '3571', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('716', '791', '11', '28', '60', 'Western Plaguelands', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('717', '791', '11', '2057', '60', 'Scholomance', '3', '2');
-- (Horde) Eastern Plaguelands + Stratholme
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('792', '0', '-1', 'Eastern Plaguelands Loremaster', '16712190', 'Complete 96 quests in Eastern Plaguelands.', '16712190', '14861', '10', '24', '136', '3535', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('718', '792', '11', '139', '96', 'Eastern Plaguelands', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('719', '792', '11', '2017', '96', 'Stratholme', '3', '2');
-- (Horde) Silverpine Forest + Shadowfang Keep
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('793', '0', '-1', 'Silverpine Forest Loremaster', '16712190', 'Complete 38 quests in Silverpine Forest.', '16712190', '14861', '10', '25', '136', '3576', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('720', '793', '11', '130', '38', 'Silverpine Forest', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('743', '793', '11', '209', '38', 'Shadowfang Keep', '3', '2');
-- (Horde) Hinterlands
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('794', '0', '-1', 'The Hinterlands Loremaster', '16712190', 'Complete 27 quests in The Hinterlands.', '16712190', '14861', '10', '26', '136', '3556', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('800', '794', '11', '47', '27', 'The Hinterlands', '3', '1');
-- (Horde) Hillsbrad Foothills
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('795', '0', '-1', 'Hillsbrad Foothills Loremaster', '16712190', 'Complete 33 quests in Hillsbrad Foothills.', '16712190', '14861', '10', '27', '136', '3555', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('801', '795', '11', '267', '33', 'Hillsbrad Foothills', '3', '1');
-- (Horde) Arathi Highlands
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('810', '0', '-1', 'Arathi Highlands Loremaster', '16712190', 'Complete 31 quests in Arathi Highlands.', '16712190', '14861', '10', '28', '136', '3542', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('802', '810', '11', '45', '31', 'Arathi Highlands', '3', '1');
-- (Horde) Badlands + Uldaman
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('813', '0', '-1', 'Badlands Loremaster', '16712190', 'Complete 31 quests in Badlands.', '16712190', '14861', '10', '29', '136', '3546', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('803', '813', '11', '3', '31', 'Badlands', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('804', '813', '11', '1337', '31', 'Uldaman', '3', '2');
-- (Horde) Searing Gorge + Blackrock Depths
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('814', '0', '-1', 'Searing Gorge Loremaster', '16712190', 'Complete 43 quests in Searing Gorge.', '16712190', '14861', '10', '30', '136', '3566', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('805', '814', '11', '51', '43', 'Searing Gorge', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('806', '814', '11', '1584', '43', 'Blackrock Depths', '3', '2');
-- (Horde) Burning Steppes
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('815', '0', '-1', 'Burning Steppes Loremaster', '16712190', 'Complete 10 quests in Burning Steppes.', '16712190', '14861', '10', '31', '136', '3552', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('807', '815', '11', '46', '10', 'Burning Steppes', '3', '1');
-- (Horde) Swamp of Sorrows + Sunken Temple
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('816', '0', '-1', 'Swamp of Sorrows Loremaster', '16712190', 'Complete 21 quests in Swamp of Sorrows.', '16712190', '14861', '10', '32', '136', '3569', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('808', '816', '11', '8', '21', 'Swamp of Sorrows', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('809', '816', '11', '1417', '21', 'Sunken Temple', '3', '2');
-- (Horde) Blasted Lands
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('817', '0', '-1', 'Blasted Lands Loremaster', '16712190', 'Complete 21 quests in Blasted Lands.', '16712190', '14861', '10', '33', '136', '3550', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('810', '817', '11', '4', '21', 'Blasted Lands', '3', '1');
-- (Horde) Stranglethorn Vale
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('818', '0', '-1', 'Stranglethorn Vale Loremaster', '16712190', 'Complete 66 quests in Stranglethorn Vale.', '16712190', '14861', '10', '34', '136', '3568', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('811', '818', '11', '33', '66', 'Stranglethorn Vale', '3', '1');
-- (Horde) old Eastern Kingdoms Lorenmaster achievement set patch to wotlk+
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1677;
-- (Horde) new Eastern Kingdoms Lorenmaster achievement
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('819', '0', '-1', 'Loremaster of Eastern Kingdoms', '16712190', 'Complete the quests in all zones of Eastern Kingdoms.', '16712190', '14861', '10', '35', '0', '3490', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('812', '819', '8', '790', '0', 'Tirisfal Glades', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('813', '819', '8', '791', '0', 'Western Plaguelands', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('814', '819', '8', '792', '0', 'Eastern Plaguelands', '0', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('815', '819', '8', '793', '0', 'Silverpine Forest', '0', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('816', '819', '8', '794', '0', 'The Hinterlands', '0', '5');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('817', '819', '8', '795', '0', 'Hillsbrad Foothills', '0', '6');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('818', '819', '8', '810', '0', 'Arathi Highlands', '0', '7');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('819', '819', '8', '813', '0', 'Badlands', '0', '8');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('820', '819', '8', '814', '0', 'Searing Gorge', '0', '9');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('821', '819', '8', '815', '0', 'Burning Steppes', '0', '10');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('997', '819', '8', '816', '0', 'Swamp of Sorrows', '0', '11');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('998', '819', '8', '817', '0', 'Blasted Lands', '0', '12');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('999', '819', '8', '818', '0', 'Stranglethorn Vale', '0', '13');

-- (Alliance) Western Plaguelands + Scholomance
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('820', '1', '-1', 'Western Plaguelands Loremaster', '16712190', 'Complete 60 quests in Western Plaguelands.', '16712190', '14861', '10', '22', '136', '3571', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1000', '820', '11', '28', '60', 'Western Plaguelands', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1001', '820', '11', '2057', '60', 'Scholomance', '3', '2');
-- (Alliance) Eastern Plaguelands + Stratholme
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('821', '1', '-1', 'Eastern Plaguelands Loremaster', '16712190', 'Complete 92 quests in Eastern Plaguelands.', '16712190', '14861', '10', '23', '136', '3535', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1002', '821', '11', '139', '92', 'Eastern Plaguelands', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1600', '821', '11', '2017', '92', 'Stratholme', '3', '2');
-- (Alliance) Hinterlands
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('822', '1', '-1', 'The Hinterlands Loremaster', '16712190', 'Complete 13 quests in The Hinterlands.', '16712190', '14861', '10', '24', '136', '3556', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1601', '822', '11', '47', '13', 'The Hinterlands', '3', '1');
-- (Alliance) Hillsbrad Foothills
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('823', '1', '-1', 'Hillsbrad Foothills Loremaster', '16712190', 'Complete 11 quests in Hillsbrad Foothills.', '16712190', '14861', '10', '25', '136', '3555', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1602', '823', '11', '267', '11', 'Hillsbrad Foothills', '3', '1');
-- (Alliance) Arathi Highlands
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('824', '1', '-1', 'Arathi Highlands Loremaster', '16712190', 'Complete 22 quests in Arathi Highlands.', '16712190', '14861', '10', '26', '136', '3542', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1637', '824', '11', '45', '22', 'Arathi Highlands', '3', '1');
-- (Alliance) Alterac Mountains
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('825', '1', '-1', 'Alterac Mountains Loremaster', '16712190', 'Complete 11 quests in Alterac Mountains.', '16712190', '14861', '10', '27', '136', '3541', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1640', '825', '11', '36', '11', 'Alterac Mountains', '3', '1');
-- (Alliance) Wetlands
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('826', '1', '-1', 'Wetlands Loremaster', '16712190', 'Complete 34 quests in Wetlands.', '16712190', '14861', '10', '28', '136', '3573', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1642', '826', '11', '11', '34', 'Wetlands', '3', '1');
-- (Alliance) Loch Modan
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('827', '1', '-1', 'Loch Modan Loremaster', '16712190', 'Complete 34 quests in Loch Modan.', '16712190', '14861', '10', '29', '136', '3558', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1643', '827', '11', '38', '34', 'Loch Modan', '3', '1');
-- (Alliance) Dun Morogh + Coldridge Valley + Gnomeregan
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('828', '1', '-1', 'Dun Morogh Loremaster', '16712190', 'Complete 53 quests in Dun Morogh.', '16712190', '14861', '10', '30', '136', '3531', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1644', '828', '11', '38', '53', 'Dun Morogh', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1645', '828', '11', '132', '53', 'Coldridge Valley', '3', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1646', '828', '11', '721', '53', 'Gnomeregan', '3', '3');
-- (Alliance) Badlands + Uldaman
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('831', '1', '-1', 'Badlands Loremaster', '16712190', 'Complete 42 quests in Badlands.', '16712190', '14861', '10', '31', '136', '3546', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1660', '831', '11', '3', '42', 'Badlands', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1661', '831', '11', '1337', '42', 'Uldaman', '3', '2');
-- (Alliance) Searing Gorge + Blackrock Depths
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('832', '1', '-1', 'Searing Gorge Loremaster', '16712190', 'Complete 48 quests in Searing Gorge.', '16712190', '14861', '10', '32', '136', '3566', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1662', '832', '11', '51', '48', 'Searing Gorge', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1663', '832', '11', '1584', '48', 'Blackrock Depths', '3', '2');
-- (Alliance) Burning Steppes
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('833', '1', '-1', 'Burning Steppes Loremaster', '16712190', 'Complete 18 quests in Burning Steppes.', '16712190', '14861', '10', '33', '136', '3552', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1664', '833', '11', '46', '18', 'Burning Steppes', '3', '1');
-- (Alliance) Elwynn Forest + Northshire Valley + The Stockade
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('834', '1', '-1', 'Elwynn Forest Loremaster', '16712190', 'Complete 45 quests in Elwynn Forest.', '16712190', '14861', '10', '34', '136', '3536', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1665', '834', '11', '12', '45', 'Elwynn Forest', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1666', '834', '11', '9', '45', 'Northshire Valley', '3', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1676', '834', '11', '717', '45', 'The Stockade', '3', '3');
-- (Alliance) Redridge Mountains
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('835', '1', '-1', 'Redridge Mountains Loremaster', '16712190', 'Complete 31 quests in Redridge Mountains.', '16712190', '14861', '10', '35', '136', '3565', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1677', '835', '11', '44', '31', 'Redridge Mountains', '3', '1');
-- (Alliance) Westfall + The Deadmines
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('836', '1', '-1', 'Westfall Loremaster', '16712190', 'Complete 34 quests in Westfall.', '16712190', '14861', '10', '36', '136', '3572', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1678', '836', '11', '40', '34', 'Westfall', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1680', '836', '11', '1581', '34', 'The Deadmines', '3', '2');
-- (Alliance) Duskwood
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('874', '1', '-1', 'Duskwood Loremaster', '16712190', 'Complete 61 quests in Duskwood.', '16712190', '14861', '10', '37', '136', '3533', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1681', '874', '11', '10', '61', 'Duskwood', '3', '1');
-- (Alliance) Swamp of Sorrows + Sunken Temple
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('895', '1', '-1', 'Swamp of Sorrows Loremaster', '16712190', 'Complete 14 quests in Swamp of Sorrows.', '16712190', '14861', '10', '38', '136', '3569', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1682', '895', '11', '8', '14', 'Swamp of Sorrows', '3', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1683', '895', '11', '1417', '14', 'Sunken Temple', '3', '2');
-- (Alliance) Blasted Lands
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('904', '1', '-1', 'Blasted Lands Loremaster', '16712190', 'Complete 20 quests in Blasted Lands.', '16712190', '14861', '10', '39', '136', '3550', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1684', '904', '11', '4', '20', 'Blasted Lands', '3', '1');
-- (Alliance) Stranglethorn Vale
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('920', '1', '-1', 'Stranglethorn Vale Loremaster', '16712190', 'Complete 70 quests in Stranglethorn Vale.', '16712190', '14861', '10', '40', '136', '3568', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1685', '920', '11', '33', '70', 'Stranglethorn Vale', '3', '1');
-- (Alliance) old Eastern Kingdoms Lorenmaster achievement set patch to wotlk+
UPDATE `achievement_dbc` SET `patch`='2' WHERE  `ID`=1676;
-- (Alliance) new Eastern Kingdoms Lorenmaster achievement
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Reward_Lang_Mask`) VALUES ('929', '1', '-1', 'Loremaster of Eastern Kingdoms', '16712190', 'Complete the quests in all zones of Eastern Kingdoms.', '16712190', '14861', '10', '41', '0', '3490', '16712190');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1686', '929', '8', '820', '0', 'Western Plaguelands', '0', '1');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1687', '929', '8', '821', '0', 'Eastern Plaguelands', '0', '2');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1709', '929', '8', '822', '0', 'The Hinterlands', '0', '3');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1710', '929', '8', '823', '0', 'Hillsbrad Foothills', '0', '4');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1711', '929', '8', '824', '0', 'Arathi Highlands', '0', '5');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1712', '929', '8', '825', '0', 'Wetlands', '0', '6');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1730', '929', '8', '827', '0', 'Loch Modan', '0', '7');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1748', '929', '8', '828', '0', 'Dun Morogh', '0', '8');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1749', '929', '8', '831', '0', 'Badlands', '0', '9');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1750', '929', '8', '832', '0', 'Searing Gorge', '0', '10');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1751', '929', '8', '833', '0', 'Burning Steppes', '0', '11');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1752', '929', '8', '834', '0', 'Elwynn Forest', '0', '12');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1753', '929', '8', '835', '0', 'Redridge Mountains', '0', '13');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1754', '929', '8', '836', '0', 'Westfall', '0', '14');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1755', '929', '8', '874', '0', 'Duskwood', '0', '15');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1756', '929', '8', '895', '0', 'Swamp of Sorrows', '0', '16');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1757', '929', '8', '904', '0', 'Blasted Lands', '0', '17');
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES ('1758', '929', '8', '920', '0', 'Stranglethorn Vale', '0', '18');

-- FEATS OF STRENGTH
-- Realm first achievements
-- WoTLK achievements
UPDATE `achievement_dbc` SET `patch`='2' WHERE `ID` IN (456,457,458,459,460,461,462,463,464,465,466,467,1400,1402,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1463,3117,3259,4078,4576);

-- New realm first vanilla achievements
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (983, -1, -1, 0, 'Realm First! Level 60', 16712190, 'First person on the realm to achieve level 60.', 16712190, 81, 0, 1, 256, 3273, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (18, 983, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (984, -1, -1, 0, 'Realm First! Level 60 Rogue', 16712190, 'First rogue on the realm to achieve level 60.', 16712190, 81, 0, 11, 256, 1834, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (19, 984, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (19, 21, 4, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (985, -1, -1, 0, 'Realm First! Level 60 Warrior', 16712190, 'First warrior on the realm to achieve level 60.', 16712190, 81, 0, 10, 256, 1462, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (20, 985, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (20, 21, 1, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (986, -1, -1, 0, 'Realm First! Level 60 Mage', 16712190, 'First mage on the realm to achieve level 60.', 16712190, 81, 0, 9, 256, 2832, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (21, 986, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (21, 21, 8, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (987, -1, -1, 0, 'Realm First! Level 60 Hunter', 16712190, 'First hunter on the realm to achieve level 60.', 16712190, 81, 0, 7, 256, 2831, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (22, 987, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (22, 21, 3, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (988, -1, -1, 0, 'Realm First! Level 60 Warlock', 16712190, 'First warlock on the realm to achieve level 60.', 16712190, 81, 0, 6, 256, 155, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (23, 988, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (23, 21, 9, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (989, -1, -1, 0, 'Realm First! Level 60 Priest', 16712190, 'First priest on the realm to achieve level 60.', 16712190, 81, 0, 5, 256, 1523, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (24, 989, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (24, 21, 5, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (990, -1, -1, 0, 'Realm First! Level 60 Paladin', 16712190, 'First paladin on the realm to achieve level 60.', 16712190, 81, 0, 4, 256, 25, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (25, 990, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (25, 21, 2, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (991, -1, -1, 0, 'Realm First! Level 60 Druid', 16712190, 'First druid on the realm to achieve level 60.', 16712190, 81, 0, 3, 256, 261, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (26, 991, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (26, 21, 11, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (992, -1, -1, 0, 'Realm First! Level 60 Shaman', 16712190, 'First shaman on the realm to achieve level 60.', 16712190, 81, 0, 2, 256, 38, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (27, 992, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (27, 21, 7, 0);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (993, -1, -1, 0, 'Realm First! Level 60 Gnome', 16712190, 'First gnome on the realm to achieve level 60.', 16712190, 81, 0, 12, 256, 3283, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (28, 993, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (28, 21, 0, 7);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (994, -1, -1, 0, 'Realm First! Level 60 Dwarf', 16712190, 'First dwarf on the realm to achieve level 60.', 16712190, 81, 0, 15, 256, 3286, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (29, 994, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (29, 21, 0, 3);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (995, -1, -1, 0, 'Realm First! Level 60 Human', 16712190, 'First human on the realm to achieve level 60.', 16712190, 81, 0, 16, 256, 3325, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (30, 995, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (30, 21, 0, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (996, -1, -1, 0, 'Realm First! Level 60 Night Elf', 16712190, 'First night elf on the realm to achieve level 60.', 16712190, 81, 0, 17, 256, 3288, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (31, 996, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (31, 21, 0, 4);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (997, -1, -1, 0, 'Realm First! Level 60 Orc', 16712190, 'First orc on the realm to achieve level 60.', 16712190, 81, 0, 18, 256, 3289, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (32, 997, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (32, 21, 0, 2);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (998, -1, -1, 0, 'Realm First! Level 60 Tauren', 16712190, 'First tauren on the realm to achieve level 60.', 16712190, 81, 0, 19, 256, 3326, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (33, 998, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (33, 21, 0, 6);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (999, -1, -1, 0, 'Realm First! Level 60 Troll', 16712190, 'First troll on the realm to achieve level 60.', 16712190, 81, 0, 20, 256, 3291, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (42, 999, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (42, 21, 0, 8);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1000, -1, -1, 0, 'Realm First! Level 60 Forsaken', 16712190, 'First forsaken on the realm to achieve level 60.', 16712190, 81, 0, 21, 256, 3292, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (43, 1000, 5, 0, 60, 'Level to 60', 2, 1);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`) VALUES (43, 21, 0, 5);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1003, -1, -1, 0, 'Realm First! Artisan Blacksmith', 16712190, 'First person on the realm to achieve 300 skill in blacksmithing.', 16712190, 81, 0, 23, 256, 335, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (44, 1003, 7, 164, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1004, -1, -1, 0, 'Realm First! Artisan Alchemist', 16712190, 'First person on the realm to achieve 300 skill in alchemy.', 16712190, 81, 0, 22, 256, 339, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (45, 1004, 7, 171, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1013, -1, -1, 0, 'Realm First! Cooking Artisan', 16712190, 'First person on the realm to achieve 300 skill in cooking.', 16712190, 81, 0, 24, 256, 1467, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (46, 1013, 7, 185, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1016, -1, -1, 0, 'Realm First! Artisan Enchanter', 16712190, 'First person on the realm to achieve 300 skill in enchanting.', 16712190, 81, 0, 25, 256, 578, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (47, 1016, 7, 333, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1018, -1, -1, 0, 'Realm First! Artisan Engineer', 16712190, 'First person on the realm to achieve 300 skill in engineering.', 16712190, 81, 0, 26, 256, 333, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (48, 1018, 7, 202, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1019, -1, -1, 0, 'Realm First! First Aid Artisan', 16712190, 'First person on the realm to achieve 300 skill in first aid.', 16712190, 81, 0, 27, 256, 504, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (49, 1019, 7, 129, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1046, -1, -1, 0, 'Realm First! Artisan Angler', 16712190, 'First person on the realm to achieve 300 skill in fishing.', 16712190, 81, 0, 28, 256, 580, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (50, 1046, 7, 356, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1048, -1, -1, 0, 'Realm First! Artisan Herbalist', 16712190, 'First person on the realm to achieve 300 skill in herbalism.', 16712190, 81, 0, 29, 256, 345, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (51, 1048, 7, 182, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1049, -1, -1, 0, 'Realm First! Artisan Leatherworker', 16712190, 'First person on the realm to achieve 300 skill in leatherworking.', 16712190, 81, 0, 32, 256, 346, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (52, 1049, 7, 165, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1050, -1, -1, 0, 'Realm First! Artisan Miner', 16712190, 'First person on the realm to achieve 300 skill in mining.', 16712190, 81, 0, 33, 256, 336, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (53, 1050, 7, 186, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1051, -1, -1, 0, 'Realm First! Artisan Skinner', 16712190, 'First person on the realm to achieve 300 skill in skinning.', 16712190, 81, 0, 34, 256, 736, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (54, 1051, 7, 393, 300, 'Skill to 300', 2, 1);
INSERT INTO `achievement_dbc` (`ID`, `Faction`, `Instance_Id`, `Supercedes`, `Title_Lang_enUS`, `Title_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_Mask`, `Category`, `Points`, `Ui_Order`, `Flags`, `IconID`, `Minimum_Criteria`, `Shares_Criteria`, `patch`) VALUES (1052, -1, -1, 0, 'Realm First! Artisan Tailor', 16712190, 'First person on the realm to achieve 300 skill in tailoring.', 16712190, 81, 0, 35, 256, 341, 0, 0, 0);
INSERT INTO `achievement_criteria_dbc` (`ID`, `Achievement_Id`, `Type`, `Asset_Id`, `Quantity`, `Description_Lang_enUS`, `Flags`, `Ui_Order`) VALUES (55, 1052, 7, 197, 300, 'Skill to 300', 2, 1);