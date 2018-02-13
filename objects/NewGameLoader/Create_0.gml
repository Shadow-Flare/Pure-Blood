var tmpID = 13;
tmpID--; controllers[tmpID] = ConsoleManager;
tmpID--; controllers[tmpID] = HudManager;
tmpID--; controllers[tmpID] = TargetManager;
tmpID--; controllers[tmpID] = PlayerStats;
tmpID--; controllers[tmpID] = MapManager;
tmpID--; controllers[tmpID] = AudioCache;
tmpID--; controllers[tmpID] = ItemCache;
tmpID--; controllers[tmpID] = AbilityCache;
tmpID--; controllers[tmpID] = LootCache;
tmpID--; controllers[tmpID] = RoomCache;
tmpID--; controllers[tmpID] = ComboCache;
tmpID--; controllers[tmpID] = InputManager;
tmpID--; controllers[tmpID] = EffectsManager;

event_inherited();

scr_playerCache_basicPlayerSetup();