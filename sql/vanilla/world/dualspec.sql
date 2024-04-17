SET @ENTRY := 100601;

DELETE FROM creature_template WHERE entry IN (@ENTRY);
INSERT INTO creature_template (Entry, Name, SubName, MinLevel, MaxLevel, ModelId1, ModelId2, ModelId3, ModelId4, Faction, Scale, Family, CreatureType, InhabitType, RegenerateStats, RacialLeader, NpcFlags, UnitFlags, DynamicFlags, ExtraFlags, CreatureTypeFlags, SpeedWalk, SpeedRun, Detection, CallForHelp, Pursuit, Leash, Timeout, UnitClass, `Rank`, HealthMultiplier, PowerMultiplier, DamageMultiplier, DamageVariance, ArmorMultiplier, ExperienceMultiplier, MinLevelHealth, MaxLevelHealth, MinLevelMana, MaxLevelMana, MinMeleeDmg, MaxMeleeDmg, MinRangedDmg, MaxRangedDmg, Armor, MeleeAttackPower, RangedAttackPower, MeleeBaseAttackTime, RangedBaseAttackTime, DamageSchool, MinLootGold, MaxLootGold, LootId, PickpocketLootId, SkinningLootId, KillCredit1, KillCredit2, MechanicImmuneMask, SchoolImmuneMask, ResistanceHoly, ResistanceFire, ResistanceNature, ResistanceFrost, ResistanceShadow, ResistanceArcane, PetSpellDataId, MovementType, TrainerType, TrainerSpell, TrainerClass, TrainerRace, TrainerTemplateId, VendorTemplateId, EquipmentTemplateId, GossipMenuId, AIName) VALUES
(@ENTRY,'Dual Specialization Crystal','','1','1','11659','11659','11659','11659','35','1','0','7','3','3','0','1','0','0','0','0','1','1.14286','20','0','0','0','0','1','0','1','1','1','1','1','1','42','42','0','0','2','2','0','0','7','11','0','2000','2000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','');

DELETE FROM locales_creature WHERE entry IN (@ENTRY);
INSERT INTO locales_creature (Entry, name_loc6) VALUES (@ENTRY, 'Cristal de Doble Especialización');

DELETE FROM creature WHERE id IN (@ENTRY);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`) VALUES (@ENTRY, 0, 1, -8988.56, 849.754, 29.621, 2.27687, 25, 25, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`) VALUES (@ENTRY, 1, 1, 1471.63, -4216.46, 58.9942, 4.35778, 25, 25, 0, 0);

SET @STRING_ENTRY := 12000;
DELETE FROM `mangos_string` WHERE `entry` BETWEEN  @STRING_ENTRY AND @STRING_ENTRY+21;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc6`) VALUES
(@STRING_ENTRY, 'Dual Specialization allows you to quickly switch between two different talent builds and action bars.', 'La doble especialización te permite cambiar rápidamente entre dos construcciones de talento y barras de acción diferentes.'),
(@STRING_ENTRY+1, 'The cost is ', 'El precio es '),
(@STRING_ENTRY+2, 'Change my specialization.', 'Cambiar mi especialización.'),
(@STRING_ENTRY+3, 'You don\'t have enough money to unlock dual specialization.', 'No tienes suficiente dinero para desbloquear la doble especialización.'),
(@STRING_ENTRY+4, 'Are you sure you would like to activate your second specialization for ', '¿Estás seguro de que te gustaría activar tu segunda especialización por '),
(@STRING_ENTRY+5, ' gold? This will allow you to quickly switch between two different talent builds and action bars.', ' de oro? Esto te permitirá cambiar rápidamente entre dos construcciones de talento y barras de acción diferentes.'),
(@STRING_ENTRY+6, 'You are already on that spec.', 'Ya estás en esa especialización.'),
(@STRING_ENTRY+7, '[Activate] ', '[Activar] '),
(@STRING_ENTRY+8, '[Rename] ', '[Renombrar] '),
(@STRING_ENTRY+9, 'Unnamed', 'Sin nombre'),
(@STRING_ENTRY+10, ' (active)', ' (activa)'),
(@STRING_ENTRY+11, 'You are in combat and cannot switch spec at this time.', 'Estás en combate y no puedes cambiar de especialización en este momento.'),
(@STRING_ENTRY+12, 'You must exit the instance to re-spec.', 'Debe salir de la estancia para cambiar la especialización.'),
(@STRING_ENTRY+13, 'You are mounted and cannot switch spec at this time.', 'Está montado y no puede cambiar la especialización en este momento.'),
(@STRING_ENTRY+14, 'You are dead and cannot switch spec at this time.', 'Estás muerto y no puedes cambiar la especialización en este momento.'),
(@STRING_ENTRY+15, 'You must unlock the dual talent specialization feature first.', 'Primero debe desbloquear la función de doble especialización.'),
(@STRING_ENTRY+16, 'Current level is less than ten - you cannot switch spec at this time.', 'El nivel actual es inferior a diez y no puedes cambiar de especialización en este momento.'),
(@STRING_ENTRY+17, '|cFF0041FF[Activate] ', '|cFF0041FF[Activar] '),
(@STRING_ENTRY+18, '|cFFCC00CC[Rename] ', '|cFFCC00CC[Renombrar] '),
(@STRING_ENTRY+19, 'Are you sure you wish to switch your talent specialization? It will log you out from the world.', '¿Estás seguro de que deseas cambiar su especialización? Te desconectará del mundo.'),
(@STRING_ENTRY+20, 'Purchase Dual Talent Specialization', 'Comprar doble especialización de talentos'),
(@STRING_ENTRY+21, 'Can not create dual spec item!', '¡No se puede crear un artículo de doble especialización!');

SET @TEXT_ID := 50700;
DELETE FROM `npc_text` WHERE `ID` BETWEEN @TEXT_ID AND @TEXT_ID+1;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@TEXT_ID, 'Dual Specialization allows you to quickly switch between two different talent builds and action bars. It requires logout to switch specialization.'),
(@TEXT_ID+1, 'Dual Specialization allows you to quickly switch between two different talent builds and action bars. It requires logout to switch specialization.');

DELETE FROM `locales_npc_text` WHERE `entry` BETWEEN @TEXT_ID AND @TEXT_ID+1;
INSERT INTO `locales_npc_text` (`entry`, `text0_0_loc6`) VALUES
(@TEXT_ID, 'La doble especialización te permite cambiar rápidamente entre dos ramas de talentos y barras de acción diferentes. Requiere cerrar sesión para cambiar de especialización.'),
(@TEXT_ID+1, 'La doble especialización te permite cambiar rápidamente entre dos ramas de talentos y barras de acción diferentes. Requiere cerrar sesión para cambiar de especialización.');

-- item
-- UPDATE `item_template` SET `ScriptName`='item_custom_dualspec' WHERE `entry`=17731;