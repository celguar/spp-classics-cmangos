SET @Entry := 190010;

DELETE FROM `creature_template` WHERE `entry` = @Entry;

INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `name`, `subname`, `GossipMenuId`, `minlevel`, `maxlevel`, `faction`, `NpcFlags`, `scale`, `rank`, `DamageSchool`, `MeleeBaseAttackTime`, `RangedBaseAttackTime`, `unitClass`, `unitFlags`, `CreatureType`, `CreatureTypeFlags`, `lootid`, `PickpocketLootId`, `SkinningLootId`, `AIName`, `MovementType`, `RacialLeader`, `RegenerateStats`, `MechanicImmuneMask`, `ExtraFlags`) VALUES
(@Entry, 2240, 0, "Magister Stellaria", "Transmogrifier", 0, 60, 60, 35, 1, 1, 0, 0, 2000, 0, 1, 0, 7, 138936390, 0, 0, 0, '', 0, 0, 1, 0, 0);

DELETE FROM `creature` WHERE `id` = @Entry;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`) VALUES (@Entry, 0, 1, -8999.00000000000000000000, 851.19100000000000000000, 29.62100000000000000000, 3.88538000000000000000, 25, 25, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`) VALUES (@Entry, 1, 1, 1467.40000000000000000000, -4226.33000000000000000000, 58.99390000000000000000, 1.19063000000000000000, 25, 25, 0, 0);

SET @TEXT_ID := 601083;

DELETE FROM `npc_text` WHERE `ID` BETWEEN @TEXT_ID AND @TEXT_ID+5;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@TEXT_ID, 'Transmogrification allows you to change how your items look like without changing the stats of the items.\r\nItems used in transmogrification are no longer refundable, tradeable and are bound to you.\r\n\r\nNot everything can be transmogrified with eachother.\r\nRestrictions include but are not limited to:\r\nOnly armor and weapons can be transmogrified\r\nGuns, bows and crossbows can be transmogrified with eachother\r\nFishing poles can not be transmogrified\r\nYou must be able to equip both items used in the process.\r\n\r\nTransmogrifications stay on your items as long as you own them.\r\nIf you try to put the item in guild bank or mail it to someone else, the transmogrification is stripped.\r\n\r\nYou can also remove transmogrifications for free at the transmogrifier.'),
(@TEXT_ID+1, 'You can save your own transmogrification sets.\r\n\r\nTo save, first you must transmogrify your equipped items.\r\nThen when you go to the set management menu and go to save set menu,\r\nall items you have transmogrified are displayed so you see what you are saving.\r\nIf you think the set is fine, you can click to save the set and name it as you wish.\r\n\r\nTo use a set you can click the saved set in the set management menu and then select use set.\r\nIf the set has a transmogrification for an item that is already transmogrified, the old transmogrification is lost.\r\nNote that same transmogrification restrictions apply when trying to use a set as in normal transmogrification.\r\n\r\nTo delete a set you can go to the set\'s menu and select delete set.'),
(@TEXT_ID+2, 'Select desired look for this slot.'),
(@TEXT_ID+3, 'Check price and click Confirm to change item look!'),
(@TEXT_ID+4, 'This item is already transmogrified.\r\nClick Remove to restore original look!'),
(@TEXT_ID+5, 'This item is already transmogrified.\r\nClick Remove to restore original look,\r\n\or select a different one!');

DELETE FROM `locales_npc_text` WHERE `entry` BETWEEN @TEXT_ID AND @TEXT_ID+5;
INSERT INTO `locales_npc_text` (`entry`, `text0_0_loc6`) VALUES
(@TEXT_ID, 'La transfiguración te permite cambiar la apariencia de tus artículos sin cambiar las estadísticas de los artículos.\r\nLos artículos usados en la transfiguración ya no son reembolsables, intercambiables y están vinculados a ti.\r\n\r\nNo todo se puede transfigurar entre sí.\r\nLas restricciones incluyen, pero no se limitan a:\r\nSolo se pueden transfigurar armaduras y armas\r\nArmas, arcos y ballestas se pueden transfigurar entre sí \r\nLas cañas de pescar no se pueden transfigurar.\r\nDebes poder equipar los dos elementos utilizados en el proceso.\r\n\r\nLas transfiguraciones permanecen en tus elementos mientras los poseas.\r\nSi intentas poner el elemento en el banco del gremio o enviarlo por correo a otra persona, la transfiguración se elimina.\r\n\r\nTambién puedes eliminar las transfiguraciones de forma gratuita en el transfigurador.'),
(@TEXT_ID+1, 'Puedes guardar tus propios conjuntos de transfiguración.\r\n\r\nPara guardar, primero debes transfigurar tus objetos equipados.\r\nLuego, cuando vayas al menú de administración de conjunto y vayas al menú Guardar conjunto,\r\nse mostrarán todos los elementos que has transfigurado para que veas lo que estás guardando.\r\nSi crees que el conjunto está bien, puedes hacer clic para guardarlo y nombrarlo como quieras.\r\n\r\nPara usar un conjunto, puedes hacer clic en el conjunto guardado en el configurar el menú de administración y luego seleccionar usar conjunto.\r\nSi el conjunto tiene una transfiguración para un elemento que ya está transfigurado, la transfiguración anterior se pierde.\r\nTenga en cuenta que se aplican las mismas restricciones de transfiguración cuando intenta usar un conjunto como en la transfiguración normal.\r\n\r\nPara eliminar un conjunto, puede ir al menú del conjunto y seleccionar eliminar conjunto.'),
(@TEXT_ID+2, 'Selecciona el aspecto deseado para esta ranura.'),
(@TEXT_ID+3, '¡Consulta el precio y haga clic en Confirmar para cambiar el aspecto del artículo!'),
(@TEXT_ID+4, 'Este elemento ya está transfigurado.\r\n¡Haz clic en Quitar para restaurar el aspecto original!'),
(@TEXT_ID+5, 'Este elemento ya está transfigurado.\r\nHaz clic en Quitar para restaurar el aspecto original,\r\n\o selecciona uno diferente.');

SET @STRING_ENTRY := 11100;

DELETE FROM `mangos_string` WHERE `entry` BETWEEN  @STRING_ENTRY+0 AND @STRING_ENTRY+46;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc6`) VALUES
(@STRING_ENTRY+0, 'Item successfully transmogrified.', 'Objeto transfigurado con éxito.'),
(@STRING_ENTRY+1, 'Equipment slot is empty.', 'La ranura del equipo está vacía.'),
(@STRING_ENTRY+2, 'Invalid source item selected.', 'Se ha seleccionado un objeto de origen no válido.'),
(@STRING_ENTRY+3, 'Source item does not exist.', 'El objeto de origen no existe.'),
(@STRING_ENTRY+4, 'Destination item does not exist.', 'El objeto destino no existe.'),
(@STRING_ENTRY+5, 'Selected items are invalid.', 'Los objetos seleccionados no son válidos.'),
(@STRING_ENTRY+6, 'You don''t have  enough money.', 'No tienes suficiente dinero.'),
(@STRING_ENTRY+7, 'You don''t have enough tokens.', 'No tienes suficientes fichas.'),
(@STRING_ENTRY+8, 'Destination item already has this transmogrification.', 'El objeto de destino ya tiene esta transfiguración.'),
(@STRING_ENTRY+9, 'All your transmogrifications were removed.', 'Se eliminaron todas tus transfiguraciones.'),
(@STRING_ENTRY+10, 'Item transmogrifications were removed.', 'Se eliminaron las transfiguraciones de objetos.'),
(@STRING_ENTRY+11, 'No transmogrification found.', 'No se encontró transfiguración.'),
(@STRING_ENTRY+12, 'No transmogrification found on this item.', 'No se ha encontrado transfiguración en este artículo.'),
(@STRING_ENTRY+13, 'Invalid name inserted.', 'Nombre no válido insertado.'),
(@STRING_ENTRY+14, 'Showing transmogrifieded items, relog to update the current area.', 'Mostrando objetos transfigurados, vuelva a iniciar sesión para actualizar el área actual.'),
(@STRING_ENTRY+15, 'Hiding transmogrifieded items, relog to update the current area.', 'Ocultando objetos transfigurados, volver a iniciar sesión para actualizar el área actual.'),
(@STRING_ENTRY+16, 'The selected Item is not suitable for transmogrification.', 'El artículo seleccionado no es adecuado para la transfiguración.'),
(@STRING_ENTRY+17, 'The selected Item cannot be used for transmogrification of the target player.', 'El elemento seleccionado no se puede usar para la transfiguración del jugador objetivo.'),
(@STRING_ENTRY+18, 'You have no suitable items in your inventory.', 'No tiene artículos adecuados en tu inventario.'),
(@STRING_ENTRY+19, 'Remove: ', 'Quitar: '),
(@STRING_ENTRY+20, '< [Back]', '< [Atras]'),
(@STRING_ENTRY+21, '< [Main Menu]', '< [Menu Principal]'),
(@STRING_ENTRY+22, 'Before: ', 'Antes: '), 
(@STRING_ENTRY+23, 'After:', 'Despues: '),
(@STRING_ENTRY+24, 'Cost is ', 'El precio es '),
(@STRING_ENTRY+25, 'Confirm', 'Confirmar'),
(@STRING_ENTRY+26, 'Your item: ', 'Tu objeto: '),
(@STRING_ENTRY+27, 'Transmog: ', 'Transfiguración'),
(@STRING_ENTRY+28, 'Possible transmogrifications:', 'Posible transfiguraciones:'),
(@STRING_ENTRY+29, 'Options:', 'Opciones:'),
(@STRING_ENTRY+30, 'How does transmogrification work?:', '¿Como funciona la transfiguración?'),
(@STRING_ENTRY+31, 'Head', 'Cabeza'),
(@STRING_ENTRY+32, 'Shoulders', 'Hombros'),
(@STRING_ENTRY+33, 'Shirt', 'Camisa'),
(@STRING_ENTRY+34, 'Chest', 'Pecho'),
(@STRING_ENTRY+35, 'Waist', 'Cintura'),
(@STRING_ENTRY+36, 'Legs', 'Piernas'),
(@STRING_ENTRY+37, 'Feet', 'Pies'),
(@STRING_ENTRY+38, 'Wrists', 'Muñeca'),
(@STRING_ENTRY+39, 'Hands', 'Manos'),
(@STRING_ENTRY+40, 'Back', 'Espalda'),
(@STRING_ENTRY+41, 'Main Hand', 'Mano Principal'),
(@STRING_ENTRY+42, 'Off Hand', 'Mano Secundaria'),
(@STRING_ENTRY+43, 'Ranged', 'A Distancia'),
(@STRING_ENTRY+44, 'Tabard', 'Tabardo'),
(@STRING_ENTRY+45, 'Remove all transmogrifications', 'Quitar todas las transfiguraciones'),
(@STRING_ENTRY+46, 'Transmogrify %s', 'Transfigurar %s');
