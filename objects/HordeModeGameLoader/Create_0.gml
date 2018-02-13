var tmpID = 14;
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
tmpID--; controllers[tmpID] = HordeModeController;

event_inherited();

scr_playerCache_basicPlayerSetup();

#region Horde Mode controller Setup
with HordeModeController
{
	waveCache = ds_list_create();
	var waveNum = -1;
	var cache = noone;
	
	#region wave 1
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objZombie] = 12;
	#endregion
	#region wave 2
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objZombie] = 7;
	cache[? objServantLantern] = 4;
	#endregion
	#region wave 3
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objZombie] = 6;
	cache[? objServantLantern] = 8;
	#endregion
	#region wave 4
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objServantGuard] = 3;
	#endregion
	#region wave 5
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objServantGuard] = 3;
	cache[? objServantLantern] = 7;
	#endregion
	#region wave 6
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objSanguineConnoisseur] = 1;
	#endregion
	#region wave 7
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objSanguineConnoisseur] = 2;
	#endregion
	#region wave 8
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objZombie] = 32;
	#endregion
	#region wave 9
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objSanguineConnoisseur] = 2;
	cache[? objZombie] = 5;
	#endregion
	#region wave 10
	waveNum++;
	waveCache[| waveNum] = ds_map_create();
	cache = waveCache[| waveNum];
	
	cache[? objBloodHound] = 1;
	#endregion
}
#endregion