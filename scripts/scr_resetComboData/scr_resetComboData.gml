///@arg weaponClass(ENUM)
var class = argument0;

with PlayerStats
{
		//initialize and/or deligate major caches to local variables
	if classComboCache[? class] == undefined
		classComboCache[? class] = ds_map_create();
	var cache = classComboCache[? class];

		//initialize and/or deligate minor class caches to local variables
	if cache[? weaponComboTypes.groundCombo] == undefined					//ground combos
		cache[? weaponComboTypes.groundCombo] = ds_list_create();
	var GCCache = cache[? weaponComboTypes.groundCombo];
	if cache[? weaponComboTypes.groundFinisher] == undefined				//ground finishers
		cache[? weaponComboTypes.groundFinisher] = ds_list_create();
	var GFCache = cache[? weaponComboTypes.groundFinisher];
	if cache[? weaponComboTypes.aerialCombo] == undefined					//aerial combos
		cache[? weaponComboTypes.aerialCombo] = ds_list_create();
	var ACCache = cache[? weaponComboTypes.aerialCombo];
	if cache[? weaponComboTypes.aerialFinisher] == undefined				//aerial finishers
		cache[? weaponComboTypes.aerialFinisher] = ds_list_create();
	var AFCache = cache[? weaponComboTypes.aerialFinisher];

		//get intended combo cache sizes, also save sizes to player stats to preserve and make locating easier THIS CODE WILL CHANGE
	if GCS == noone GCS = ds_map_create();
	if GFS == noone GFS = ds_map_create();
	if ACS == noone ACS = ds_map_create();
	if AFS == noone AFS = ds_map_create();
	GCS[? class] = class_get_stat(class,weaponClassStats.groundComboLength)+GCSMod;
	GFS[? class] = class_get_stat(class,weaponClassStats.groundFinisherLength)+GFSMod;
	ACS[? class] = class_get_stat(class,weaponClassStats.aerialComboLength)+ACSMod;
	AFS[? class] = class_get_stat(class,weaponClassStats.aerialFinisherLength)+AFSMod;

		//alter caches data (defaults and removes) for the normal 4
			//ground combos
				//cut down to needed size
	while ds_list_size(GCCache) > GCS[? class] && !ds_list_size(GCCache) == 0 ds_list_delete(GCCache,ds_list_size(GCCache)-1)
				//check if all defined, if not, set to default as defined in ComboCache
	for (var i = 0; i < GCS[? class]; i++)
	{
		if GCCache[| i] == undefined GCCache[| i] = class_get_stat(class,weaponClassStats.groundComboDefault);
	}
			//ground finishers
				//cut down to needed size
	while ds_list_size(GFCache) > GFS[? class] && !ds_list_size(GFCache) == 0 ds_list_delete(GFCache,ds_list_size(GFCache)-1)
				//check if all defined, if not, set to default as defined in ComboCache
	for (var i = 0; i < GFS[? class]; i++)
	{
		if GFCache[| i] == undefined GFCache[| i] = class_get_stat(class,weaponClassStats.groundFinisherDefault);
	}
			//aerial combos
				//cut down to needed size
	while ds_list_size(ACCache) > ACS[? class] && !ds_list_size(ACCache) == 0 ds_list_delete(ACCache,ds_list_size(ACCache)-1)
				//check if all defined, if not, set to default as defined in ComboCache
	for (var i = 0; i < ACS[? class]; i++)
	{
		if ACCache[| i] == undefined ACCache[| i] = class_get_stat(class,weaponClassStats.aerialComboDefault);
	}
			//aerial finishers
				//cut down to needed size
	while ds_list_size(AFCache) > AFS[? class] && !ds_list_size(AFCache) == 0 ds_list_delete(AFCache,ds_list_size(AFCache)-1)
				//check if all defined, if not, set to default as defined in ComboCache
	for (var i = 0; i < AFS[? class]; i++)
	{
		if AFCache[| i] == undefined AFCache[| i] = class_get_stat(class,weaponClassStats.aerialFinisherDefault);
	}
}