SET @TEXT_ID := 50800;
DELETE FROM `npc_text` WHERE `ID` in (@TEXT_ID, @TEXT_ID+1, @TEXT_ID+2);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@TEXT_ID, "Ah, $N, it appears our journey has brought us to this crucial point. Let's review your attributes to ensure you are prepared for the challenges ahead."),
(@TEXT_ID+1, "Are you sure you want to unlearn all your attributes?"),
(@TEXT_ID+2, "Interesting... Reducing your attributes will make your experience more challenging. Are you sure?");

DELETE FROM `locales_npc_text` WHERE `entry` in (@TEXT_ID, @TEXT_ID+1, @TEXT_ID+2);
INSERT INTO `locales_npc_text` (`entry`, `text0_0_loc6`) VALUES
(@TEXT_ID, "Ah, $N, parece que nuestro viaje nos ha llevado a este punto crucial. Revisemos tus atributos para asegurarnos de que estas preparados para los desafíos que se avecinan."),
(@TEXT_ID+1, "¿Estás seguro de que quieres reiniciar todos tus atributos?"),
(@TEXT_ID+2, "Interesante... Reducir tus atributos hará que tu experiencia sea más desafiante. ¿Estas seguro?");

SET @STRING_ENTRY := 12100;
DELETE FROM `mangos_string` WHERE `entry` BETWEEN  @STRING_ENTRY AND @STRING_ENTRY+29;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc6`) VALUES 
(@STRING_ENTRY, '|cffffff00Manual attributes are disabled.', '|cffffff00Los atributos manuales están deshabilitados.'),
(@STRING_ENTRY+1, '|cffffff00You have lost these attributes: %s', '|cffffff00Has perdido estos atributos: %s'),
(@STRING_ENTRY+2, 'Strength', 'Fuerza'),
(@STRING_ENTRY+3, 'Agility', 'Agilidad'),
(@STRING_ENTRY+4, 'Stamina', 'Aguante'),
(@STRING_ENTRY+5, 'Intellect', 'Intelecto'),
(@STRING_ENTRY+6, 'Spirit', 'Espiritu'),
(@STRING_ENTRY+7, '|cffffff00Points Available: |cff00ff00%u|cffffff00 (Cost: |cffffff00%s|cffffff00)', '|cffffff00Puntos disponibles: |cff00ff00%u|cffffff00 (Coste: |cffffff00%s|cffffff00)'),
(@STRING_ENTRY+8, '|cffffff00Current Attributes:\n%s', '|cffffff00Atributos Actuales:\n%s'),
(@STRING_ENTRY+9, '(|cff00ff00%s|cffffff00 modifier)', '(|cff00ff00%s|cffffff00 modificador)'),
(@STRING_ENTRY+10, '|cffffff00Suggested Attributes:\n%s', '|cffffff00Atributos Sugeridos:\n%s'),
(@STRING_ENTRY+11, '|cffffff00You have changed your attribute modifier to |cff00ff00%s|cffffff00', '|cffffff00Has cambiado el modificador de atributos a |cff00ff00%s|cffffff00'),
(@STRING_ENTRY+12, '(disabled)', '(deshabilitado)'),
(@STRING_ENTRY+13, '|cffffa0a0You have no attribute points left', '|cffffa0a0No tienes mas puntos de atributos'),
(@STRING_ENTRY+14, '|cffffa0a0You don\'t have enough gold', '|cffffa0a0No tienes suficiente dinero'),
(@STRING_ENTRY+15, '|cffffff00You have gained |cff00ff00+%u |cffffff00%s. |cff00ff00%u|cffffff00 points left. (|cffffff00%s|cffffff00 spent)', '|cffffff00Has ganado |cff00ff00+%u |cffffff00%s. |cff00ff00%u|cffffff00 puntos restantes. (|cffffff00%s|cffffff00 gastados)'),
(@STRING_ENTRY+16, '|cffffff00Your attributes have been reset. You have |cff00ff00%u|cffffff00 points available', '|cffffff00Se han reiniciado tus atributos. Tienes |cff00ff00%u|cffffff00 puntos disponibles'),
(@STRING_ENTRY+17, '%u experience gained', '%u experiencia ganada'),
(@STRING_ENTRY+18, '|cffffff00You have %u attribute points available.\n|cffffff00Speak with your class trainer to use them.', '|cffffff00Tienes %u puntos de atributos disponibles.\n|cffffff00Habla con tu entrenador de clase para usarlos.'),
(@STRING_ENTRY+19, '%s gained', '%s ganado'),
(@STRING_ENTRY+20, '%u reputation gained', '%u reputación ganada'),
(@STRING_ENTRY+21, '%s completed', '%s completado'),
(@STRING_ENTRY+22, 'Manage attributes', 'Administrar atributos'),
(@STRING_ENTRY+23, 'Check current attributes', 'Ver atributos actuales'),
(@STRING_ENTRY+24, 'Improve %s', 'Mejorar %s'),
(@STRING_ENTRY+25, 'Unlearn all attributes', 'Reiniciar todos los atributos'),
(@STRING_ENTRY+26, 'I am sure I do want to unlearn all attributes', 'Estoy seguro que quiero reiniciar mis atributos'),
(@STRING_ENTRY+27, 'Temporarily reduce attributes', 'Reducir los atributos temporalmente'),
(@STRING_ENTRY+28, 'Remove attribute reductions', 'Quitar reducción de atributos'),
(@STRING_ENTRY+29, 'Reduce by %s', 'Reducir un %s');