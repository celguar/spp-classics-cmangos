# SPP Classics v2.0
 - Vanilla (1.12), The Burning Crusade (2.4.3) and WotLK (3.3.5) versions are supported
# Installation
-  **DO NOT** install this repack over old one. This update is not a "copy and replace old files" kind. 
-  Download the installer (if you haven't done this before) - **[SPP_Classics_V2.exe](https://github.com/celguar/spp-classics-cmangos/releases/download/v2.0/SPP_Classics_V2.exe)**.
 - Installer is a 7z self exctacting archive, it will extract "SPP_Classics V2" folder where you put it.
 - It is recommended to use SSD if you have one
 - Run it and click Extract
 - Open the unpacked SPP_Classics_V2 folder and run **Server_Update.bat** and *wait* for it to download all necessary files. (~300 MB).
 - After it is ready you will see Expansion selection menu.
 - Expansions are downloaded "per request", e.g. TBC files (maps/mmaps...) are only downloaded if you select TBC expansion.
 - Select desired expansion by typing expansion menu number and hit Enter. Expansion files will be downloaded and installed automatically.
 - **DO NOT** close the launcher during the process! I'm serious!
 - When its ready you will see Expansion menu, with "Start Servers (Win64)" and other options.
# Bot Addon
 - You can find latest Mangosbot Addon for WoW in SPP_Server/Addons folder. Copy Mangosbot folder in WoW/Interface/AddOns/
- When you start the game make sure "Load out-of-date Addons" is enabled in Addons list.
# Settings
 - Before you start, you can edit the Settings in SPP_Classics_V2/SPP_Server/Settings/%expansion%/ folder
# _**aiplayerbot.conf**_:
  ## Find these settings:
  AiPlayerbot.MinRandomBots = 1000
  AiPlayerbot.MaxRandomBots = 1000
  AiPlayerbot.RandomBotMinLevel = 1
  AiPlayerbot.RandomBotMaxLevel = 60

 - By default bot number is 1000. If you experience lag after 30+ minutes of running the server, try lowering bot number.
 - **Important!:** if you change bot number later, you will need to do "6 - Bots Menu -> Reset Random Bots" for changes to take effect.

  AiPlayerbot.SyncQuestWithPlayer = 0
 - If you set this to 1, bots in group will automatically complete & get reward from quest (If they have it) when you complete it.
 - E.g. you take quest to loot 10 items. You have 4 bots in group, they also take it. You loot 10 items, go back and complete the quest. Bots will complete it automatically and get rewards. So you won't have to loot 40 more items. Bots will ignore looting quest items.

  AiPlayerbot.AutoLearnTrainerSpells = 0
  AiPlayerbot.AutoLearnQuestSpells = 0
 - With this set to 1 bots will learn new spells/quest spells on levelup.
 - You can leave other settings unchanged.
# _**mangosd.conf**_:
 - here you can change XP and other rates. Look for "SERVER RATES" and change them if you want.
# Importing save from old SPP Classics repack (v1 2020 edition)
 - Follow this [guide](https://github.com/celguar/spp-classics/wiki/Importing-from-old-SPP-Classics-repack)
# Starting server
 - To start server, choose "Start Servers (Win64)" and wait for it to load.
 - It will take longer to boot for the first time, because random bot characters will be created. 
 - To create an account, choose option in the menu and follow the instructions.
 - To log in - edit realmlist.wtf file - "set realmlist 127.0.0.1"
# Shutting down
 - **DO NOT** close anything by pressing [X] "close" button in the upper-right corner. I'm serious!
 - Open the window with Expansion menu and choose "0 - Shutdown all servers" option. It will close everything automatically.
 - If you don't want any rollback after shutdown, do this instead:
 1) execute "saveall" command in mangosd.exe window (".saveall" if you do this in-game)
 2) execute "ser shut 1" (".ser shut 1") command and **wait** until mangosd.exe window **closes itself**
 3) choose "shutdown all servers"
# Starting server after shutdown
 - You can use Server_Update.bat to install any available updates & start the server.
 - Or you can use Server_Start.bat to start the server without checking for updates.
# Please, report any bug [here](https://github.com/celguar/mangosbot-bots/issues)
