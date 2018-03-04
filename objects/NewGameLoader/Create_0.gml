var tmpID = 16;
tmpID--; controllers[tmpID] = ConsoleManager;
tmpID--; controllers[tmpID] = HudManager;
tmpID--; controllers[tmpID] = TargetManager;
tmpID--; controllers[tmpID] = PlayerStats;
tmpID--; controllers[tmpID] = MapManager;
tmpID--; controllers[tmpID] = DialogCache;
tmpID--; controllers[tmpID] = AudioCache;
tmpID--; controllers[tmpID] = ItemCache;
tmpID--; controllers[tmpID] = AbilityCache;
tmpID--; controllers[tmpID] = LootCache;
tmpID--; controllers[tmpID] = RoomCache;
tmpID--; controllers[tmpID] = ComboCache;
tmpID--; controllers[tmpID] = WorldCache;
tmpID--; controllers[tmpID] = InputManager;
tmpID--; controllers[tmpID] = EffectsManager;
tmpID--; controllers[tmpID] = CutsceneManager;

event_inherited();

scr_playerCache_basicPlayerSetup();