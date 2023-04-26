-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.26 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table wotlkrealmd.f_posts
DROP TABLE IF EXISTS `f_posts`;
CREATE TABLE IF NOT EXISTS `f_posts` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` varchar(12) NOT NULL,
  `poster_id` int(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(15) DEFAULT NULL,
  `poster_character_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `posted` int(10) unsigned NOT NULL DEFAULT '0',
  `edited` int(10) unsigned DEFAULT NULL,
  `edited_by` varchar(30) DEFAULT NULL,
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table wotlkrealmd.f_posts: 12 rows
/*!40000 ALTER TABLE `f_posts` DISABLE KEYS */;
INSERT INTO `f_posts` (`post_id`, `poster`, `poster_id`, `poster_ip`, `poster_character_id`, `message`, `posted`, `edited`, `edited_by`, `topic_id`) VALUES
  (1, 'SPP Team', 0, '::1', 0, ' - Performance tweaks<br />\r\n - Cmangos AhBot added<br />\r\n - Update locales<br />\r\n - Fix bot stand while drinking<br />\r\n - Fix reset strategies on login<br />\r\n - Use healthstone instead of potion of available<br />\r\n - Random bots appear in different zones faster<br />\r\n - Temporary increase bot speed by 10% until fix<br />\r\n - Fix bots following while dead<br />\r\n - Disable Druid bots auto Prowl until fix<br />\r\n - Druid bots should now remove form to buff<br />\r\n - Fix auto/trainer learning of spells in tbc/wotlk<br />\r\n - Option to sync bots max level players level<br />\r\n - Hunter bots use melee if enemy is close or no ammo<br />\r\n - Hunter bots say if they are low on ammo<br />\r\n - &quot;ammo&quot; command to check ammunition<br />\r\n - <b>[Vanilla]</b> LFG using Meeting Stones<br />\r\n - <b>[Vanilla]</b> Random bots use LFG<br />\r\n - <b>[Wotlk]</b> Fix bots not confirming in LFG<br />\r\n - <i>Other fixes</i>', 1632615396, NULL, NULL, 1),
  (2, 'SPP Team', 0, '::1', 0, ' - <b>[Wotlk]</b> Fix bots not confirming in LFG', 1632615416, NULL, NULL, 2),
  (3, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Latest CMaNGOS update<br />\r\n - <b>[Core]</b> Many fixes from CMaNGOS (quests, scripts, etc)<br />\r\n - <b>[Bots]</b> BG tactics for 3 vanilla BGs (Thanks to vmangos)<br />\r\n - <b>[Bots]</b> Tweaks fot bots auto questing<br />\r\n - <b>[Bots]</b> Fix several crashes<br />\r\n - <b>[Bots]</b> Tweak bots responsiveness in combat<br />\r\n - <b>[Bots]</b> Fix bots not attacking back in pvp<br />\r\n - <b>[Bots]</b> Fix shaman bots not having totems<br />\r\n - <b>[Bots]</b> Fix random bots missing bags<br />\r\n - <b>[Bots]</b> Fix random bot number not going more than 1.5k<br />\r\n - <i>Other fixes</i>', 1632615455, NULL, NULL, 3),
  (4, 'SPP Team', 0, '::1', 0, ' - <b>[DB]</b>   Update localisations<br />\r\n - <b>[Bots]</b> Fix BG bots not joining (wotlk)<br />\r\n - <b>[Bots]</b> Fix bot glitchy follow movement<br />\r\n - <b>[Bots]</b> Fix possible crash<br />\r\n - <b>[Bots]</b> Fix arena season ending (tbc)<br />\r\n - <b>[Bots]</b> Fix warrior charge<br />\r\n - <b>[Bots]</b> Fix many random bots being dead<br />\r\n - <b>[Bots]</b> Invite command to join bot group<br />\r\n - <i>Other fixes</i>', 1632615492, NULL, NULL, 4),
  (5, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Fix Arathi Basin base graveyard<br />\r\n - <b>[Core]</b> Fix AV mines neutral state<br />\r\n - <b>[Core]</b> Fix rare crash (wotlk)<br />\r\n - <b>[Bots]</b> Fix Guild charter sign (vanilla)<br />\r\n - <b>[Bots]</b> Tweak WSG pathing<br />\r\n - <b>[Bots]</b> Make flag carriers less likely to fight<br />\r\n - <b>[Bots]</b> Fix hidden cloak/helm<br />\r\n - <b>[Bots]</b> Fix bots always detecting stealth<br />\r\n - <b>[Bots]</b> Fix bots always turning to enemy<br />\r\n - <i>Other fixes</i>', 1632615530, NULL, NULL, 5),
  (6, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Fix one of wotlk crashes<br />\r\n - <b>[Bots]</b> Tweak warrior rotation/talents<br />\r\n - <b>[Bots]</b> Slower bots login (less lags after start)<br />\r\n - <b>[Bots]</b> Fix bots flying mounts<br />\r\n - <b>[Bots]</b> Performance tweaks<br />\r\n - <b>[Bots]</b> Tweak bots approaching target<br />\r\n - <b>[Bots]</b> Tweak bots fleeing<br />\r\n - <b>[Bots]</b> Many tweaks for bot automation<br />\r\n - <i>Other fixes</i>', 1632615563, NULL, NULL, 6),
  (7, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Add fixes from CMaNGOS<br />\r\n - <b>[Core]</b> Fix one more crash<br />\r\n - <b>[Bots]</b> Bots no longer auto teleport to master<br />\r\n - <b>[Bots]</b> Fix Hunter low ammo notification<br />\r\n - <b>[Bots]</b> Fix bots stuck at GY<br />\r\n - <b>[Bots]</b> Improve bot automation<br />\r\n - <b>[Launcher]</b> Fix installation<br />\r\n - <i>Other fixes</i>', 1632615598, NULL, NULL, 7),
  (8, 'SPP Team', 0, '::1', 0, ' - <b>[Bots]</b> Many improvements for random/self bot<br />\r\n - <b>[Bots]</b> Bot following tweaks<br />\r\n - <b>[Bots]</b> Fix mount if far from master<br />\r\n - <b>[Bots]</b> Tweak movement in combat<br />\r\n - <b>[Bots]</b> Save custom talent link<br />\r\n - <b>[Bots]</b> Priest AI tweaks<br />\r\n - <b>[Bots]</b> Fix some crashes<br />\r\n - <b>[Bots]</b> Tweak DPS bots threat calculation<br />\r\n - <b>[Bots]</b> Tweak bots flee mechanic<br />\r\n - <b>[Launcher]</b> Do not close DB if server is running<br />\r\n - <i>Other fixes</i>', 1632615634, NULL, NULL, 8),
  (9, 'SPP Team', 0, '::1', 0, ' - <b>[Wotlk]</b> - Fix crash in LFG<br />\r\n - <b>[Bots]</b> Fix low level priests not healing<br />\r\n - <b>[Bots]</b> Fix alt bots not rolling for BoP items<br />\r\n - <b>[Bots]</b> Fix using Hearthstone by use command<br />\r\n - <b>[Bots]</b> Performance tweaks<br />\r\n - <b>[Bots]</b> Random bots have more free will<br />\r\n - <i>Other fixes</i>', 1632615660, NULL, NULL, 9),
  (10, 'SPP Team', 0, '::1', 0, ' - <b>[Bots]</b> Fix couple of crashes<br />\r\n - <b>[Bots]</b> Improve bots traveling<br />\r\n - <i>Other fixes</i>', 1632615681, NULL, NULL, 10),
  (11, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Fix crashes<br />\r\n - <b>[Bots]</b> Fix bots attacking random mobs<br />\r\n - <b>[Bots]</b> Reduce free action radius in dungeons<br />\r\n - <b>[Bots]</b> Random bots create and manage guilds<br />\r\n - <b>[Bots]</b> Improve bot traveling<br />\r\n - <b>[Bots]</b> Performance tweaks<br />\r\n - <i>Other fixes</i>', 1632615713, NULL, NULL, 11),
  (12, 'SPP Team', 0, '::1', 0, ' - <b>[Bots]</b> Fix bots stuck at inns<br />\r\n - <b>[Bots]</b> Fix Armory<br />\r\n - <b>[Bots]</b> Fix webpage registration<br />', 1632832745, NULL, NULL, 12),
  (13, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Fix several crashes<br />\r\n - <b>[Core]</b> Instant taxi config<br />\r\n - <b>[Core]</b> Chars/Bots on taxi are visible from afar<br />\r\n - <b>[Core]</b> Allow signing guild/arena petitions by same account bots<br />\r\n - <b>[Bots]</b> Many tweaks for random/self bot automation<br />\r\n - <b>[Bots]</b> Less random actions with real player<br />\r\n - <b>[Bots]</b> Speed up random bot character creation<br />\r\n - <b>[Bots]</b> Tweak performance with many random bots<br />\r\n - <b>[Bots]</b> Bots now use TBC LFG Tool<br />\r\n - <b>[Bots]</b> Bots have 20 second logout delay in open world<br />\r\n - <b>[Bots]</b> Fix some cases of bots being stuck for several seconds<br />\r\n - <b>[Bots]</b> Fix bots not attacking mobs with threat strategy enabled<br />\r\n - <b>[Bots]</b> Random arena teams now have random rating<br />\r\n - <b>[Bots]</b> Fix bots decline invite if very far away<br />\r\n - <b>[Bots]</b> Random bots now accept any loot type if same guild or player is gm<br />\r\n - <b>[Bots]</b> Less often random emotes and phrases<br />\r\n - <b>[Bots]</b> Tweak BG/Arena queues<br />\r\n - <b>[Bots]</b> Fix Mangosbot addon crash if DK is on account<br />\r\n - <b>[Bots]</b> Fix bots number dropping after some time<br />\r\n - <i>Other fixes</i>', 1637666235, NULL, NULL, 13),
  (14, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Tweak performance<br />\r\n - <b>[Core]</b> Fix some Eye of the Storm bugs<br />\r\n - <b>[Core]</b> Save new items, killed bosses, achievements to show on armory<br />\r\n - <b>[Bots]</b> Eye of the Storm bots logic<br />\r\n - <b>[Bots]</b> Tweak random bots items<br />\r\n - <b>[Bots]</b> Bots in your BG subgroup follow you if you have more honor points<br />\r\n - <b>[Bots]</b> Bots in your friends list are always active<br />\r\n - <b>[Bots]</b> Random arena teams got their max rating raised to 2700<br />\r\n - <b>[Bots]</b> Fix random bots not having mounts<br />\r\n - <b>[Bots]</b> Do not offer duel in non-pvp areas<br />\r\n - <b>[Bots]</b> Fix bots leaving battlegrounds<br />\r\n - <u>Other fixes</u>', 1640372652, NULL, NULL, 14),
  (34, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Update core to latest CMaNGOS<br />\r\n - <b>[Core]</b> Often client crash in BGs in WotLK should be fixed<br />\r\n - <b>[Core]</b> Several crashes fixed<br />\r\n - <b>[Bots]</b> Improve performance with bots<br />\r\n - <b>[Bots]</b> Many improvements to bots rpg activities<br />\r\n - <b>[Bots]</b> Bots queue all BGs (except SotA) if auto BG is enabled<br />\r\n - <b>[Bots]</b> Numerous crashes fixed<br />\r\n - <b>[Bots]</b> Attack tapped target if it''s attacking the group<br />\r\n - <b>[Bots]</b> Priests fear is moved to cc strategy<br />\r\n - <b>[Bots]</b> Fixed high lvl enemy bots teleport to starting areas<br />\r\n - <b>[Bots]</b> Add more configs for bots inviting other bot/player<br />\r\n - <b>[Bots]</b> Added dynamic mob respawn config for bots<br />\r\n - <b>[Bots]</b> Fixed bots in vanila missing enchants<br />\r\n - <b>[Bots]</b> Add config for max ilvl and exluded items of random gear<br />\r\n - <b>[Bots]</b> Many other fixes<br />\r\n - <b>[Website]</b> Fixed selecting expansion when registering account<br />\r\n - <b>[Website]</b> Fixed website not working with more than 1 realms<br />\r\n - <u>Other fixes</u>', 1679184000, NULL, NULL, 34),
  (35, 'SPP Team', 0, '::1', 0, ' - <b>[Core]</b> Achievements system added for vanilla version<br />\r\n - <b>[Core]</b> Added dual spec to vanilla & tbc (npc is in mage quarters)<br />\r\n - <b>[Core]</b> Added training dummies to vanilla & tbc<br />\r\n - <b>[Core]</b> Added a lot of items mined from new clients<br />\r\n - <b>[Bots]</b> Add spell immune config to make bots immune to certain spells<br />\r\n - <b>[Bots]</b> Many improvements to bots rpg activities<br />\r\n - <b>[Bots]</b> Fix bot guilds getting too big<br />\r\n - <b>[Bots]</b> Improvements to guard and follow strategies<br />\r\n - <b>[Bots]</b> Fix rogue bots idling in stealth<br />\r\n - <b>[Bots]</b> Added bot cheat to make bots not lose item durability<br />\r\n - <b>[Bots]</b> Tweakes to random gear<br />\r\n - <b>[Bots]</b> Tweaks to bg logic<br />\r\n - <b>[Bots]</b> Hunter bots now use flare on stealthed targets<br />\r\n - <b>[Bots]</b> Fix spam when bot learns spells<br />\r\n - <b>[Bots]</b> Add support for teleport spells to move around<br />\r\n - <b>[Bots]</b> Add .bot equip=sync command to give bot items close to your ilvl<br />\r\n - <b>[Bots]</b> Many improvements to mage rotations<br />\r\n - <b>[Bots]</b> Bots now auto use self res abilities<br />\r\n - <b>[Bots]</b> Bots now use grenades again<br />\r\n - <b>[Bots]</b> Fix bots CC their current target<br />\r\n - <b>[Bots]</b> Fix bots ignoring their pet being attacked<br />\r\n - <b>[Bots]</b> Add "focus heal Name" command to focus healing on someone<br />\r\n - <u>Other fixes</u>', 1682467200, NULL, NULL, 35);
/*!40000 ALTER TABLE `f_posts` ENABLE KEYS */;

-- Dumping structure for table wotlkrealmd.f_topics
DROP TABLE IF EXISTS `f_topics`;
CREATE TABLE IF NOT EXISTS `f_topics` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_poster` varchar(12) NOT NULL,
  `topic_poster_id` int(8) unsigned NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `topic_posted` int(10) unsigned NOT NULL DEFAULT '0',
  `last_post` int(10) unsigned NOT NULL DEFAULT '0',
  `last_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_poster` varchar(200) DEFAULT NULL,
  `num_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_replies` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `redirect_url` varchar(200) DEFAULT NULL,
  `forum_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table wotlkrealmd.f_topics: 12 rows
/*!40000 ALTER TABLE `f_topics` DISABLE KEYS */;
INSERT INTO `f_topics` (`topic_id`, `topic_poster`, `topic_poster_id`, `topic_name`, `topic_posted`, `last_post`, `last_post_id`, `last_poster`, `num_views`, `num_replies`, `closed`, `sticky`, `redirect_url`, `forum_id`) VALUES
  (1, 'SPP Team', 0, 'Update 06.04.2021', 1632615396, 1632615396, 1, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (2, 'SPP Team', 0, 'Update 22.04.2021', 1632615416, 1632615416, 2, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (3, 'SPP Team', 0, 'Update 07.06.2021', 1632615455, 1632615455, 3, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (4, 'SPP Team', 0, 'Update 15.06.2021', 1632615492, 1632615492, 4, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (5, 'SPP Team', 0, 'Update 22.06.2021', 1632615530, 1632615530, 5, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (6, 'SPP Team', 0, 'Update 20.07.2021', 1632615563, 1632615563, 6, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (7, 'SPP Team', 0, 'Update 30.07.2021', 1632615598, 1632615598, 7, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (8, 'SPP Team', 0, 'Update 30.08.2021', 1632615634, 1632615634, 8, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (9, 'SPP Team', 0, 'Update 10.09.2021', 1632615660, 1632615660, 9, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (10, 'SPP Team', 0, 'Update 15.09.2021', 1632615681, 1632615681, 10, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (11, 'SPP Team', 0, 'Update 26.09.2021', 1632615713, 1632615713, 11, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (12, 'SPP Team', 0, 'Hotfix 28.09.2021', 1632832745, 1632832745, 12, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (13, 'SPP Team', 0, 'Update 23.11.2021', 1637666235, 1637666235, 13, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (14, 'SPP Team', 0, 'Update 24.12.2021', 1640372652, 1640372652, 14, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (34, 'SPP Team', 0, 'Update 19.03.2023', 1679184000, 1679184000, 34, 'SPP Team', 1, 1, 0, 0, NULL, 1),
  (35, 'SPP Team', 0, 'Update 26.04.2023', 1682467200, 1682467200, 35, 'SPP Team', 1, 1, 0, 0, NULL, 1);
/*!40000 ALTER TABLE `f_topics` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;