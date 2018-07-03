var subtypeCache = PlayerStats.subtypeCache;
var activeCache = PlayerStats.activeCache;
	
	//subtypes
ds_list_clear(subtypeCache);
var cache = ComboCache.playerOffhandSubtype;
var subID = ds_map_find_first(cache);
while subID != undefined
{
	if subtype_get_stat(subID,offhandSubtypeStats.offhandType) == weapon_get_stat(PlayerStats.currentOffhandID,weaponStats.type) && scr_player_subtype_get(subID,ownedSubtypeStats.enabled) == true
	{
		var idToReplace = scr_player_subtype_get(subID,ownedSubtypeStats.enabledIndex);
		if subtypeCache[| idToReplace] != undefined show_debug_message("PlayerStats.subtypeCache index "+string(idToReplace)+"has been inapropriately declared.");
		subtypeCache[| idToReplace] = subID;
	}
	subID = ds_map_find_next(cache,subID);
}

	//actives
ds_list_clear(activeCache);
var cache = ComboCache.playerActiveAbility;
var subID = ds_map_find_first(cache);
while subID != undefined
{
	if activeAbility_get_stat(subID,activeAbilityStats.offhandType) == weapon_get_stat(PlayerStats.currentOffhandID,weaponStats.type) && scr_player_active_get(subID,ownedActiveStats.enabled) == true
	{
		var idToReplace = scr_player_active_get(subID,ownedActiveStats.enabledIndex);
		if activeCache[| idToReplace] != undefined show_debug_message("PlayerStats.activeCache index "+string(idToReplace)+"has been inapropriately declared.");
		activeCache[| idToReplace] = subID;
	}
	subID = ds_map_find_next(cache,subID);
}

		//shiftDown
			//subtypes
for(var i = 0; i < ds_list_size(subtypeCache); i++)
{
	if subtypeCache[| i] == undefined ds_list_delete(subtypeCache,i);
}
for(var i = 0; i < ds_list_size(subtypeCache); i++)
{
	scr_player_subtype_manage(subtypeCache[| i],ownedSubtypeStats.enabledIndex,i);
}

			//actives
for(var i = 0; i < ds_list_size(activeCache); i++)
{
	if activeCache[| i] == undefined ds_list_delete(activeCache,i);
}
for(var i = 0; i < ds_list_size(activeCache); i++)
{
	scr_player_active_manage(activeCache[| i],ownedActiveStats.enabledIndex,i);
}

		//auto-enable then re-check if empty
var restart = false;
if ds_list_size(subtypeCache) == 0
{
	var defaultSub = class_get_stat(weapon_get_stat(PlayerStats.currentOffhandID,weaponStats.type),weaponClassStats.defaultSubtype);
	scr_player_subtype_manage(defaultSub,ownedSubtypeStats.enabled, true);
	scr_player_subtype_manage(defaultSub,ownedSubtypeStats.enabledIndex, 0);
	restart = true;
}
if ds_list_size(activeCache) == 0
{
	var defaultAct = class_get_stat(weapon_get_stat(PlayerStats.currentOffhandID,weaponStats.type),weaponClassStats.defaultActive);
	scr_player_active_manage(defaultAct,ownedActiveStats.enabled, true);
	scr_player_active_manage(defaultAct,ownedActiveStats.enabledIndex, 0);
	restart = true;
}

if restart scr_player_update_offhand_caches();