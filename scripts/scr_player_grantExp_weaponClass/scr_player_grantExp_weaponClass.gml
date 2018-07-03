///@arg xp
///@arg weaponClass.ENUM
var xpToGrant = argument0;
var class = argument1;

var classCache = ComboCache.playerClass[? class];

if classCache[? playerClassStats.level] < ComboCache.weaponClassMaxLevel
{
	classCache[? playerClassStats.xp] += xpToGrant;
	if classCache[? playerClassStats.xp] >= classCache[? playerClassStats.xpNeeded]
	{
		var className = class_get_stat(class, weaponClassStats.name);
		message_feed_add(className+" Proficiency Up",noone);	//add symbols to this eventually.
		classCache[? playerClassStats.xp] -= classCache[? playerClassStats.xpNeeded];
		classCache[? playerClassStats.level]++;
		if classCache[? playerClassStats.level] == ComboCache.weaponClassMaxLevel
		{
			classCache[? playerClassStats.xpNeeded] = 0;
		}
		else
		{
			classCache[? playerClassStats.xpNeeded] = 30*power(1.5,classCache[? playerClassStats.level]);
		}

		with ComboCache
		{
			for (var index = ds_map_find_first(combo); index != undefined; index = ds_map_find_next(combo,index))
			{
				var classCheck = class == combo_get_stat(index, comboStats.class);
				var typeCheck = (combo_get_stat(index, comboStats.type) != weaponComboTypes.technical && combo_get_stat(index, comboStats.type) != weaponComboTypes.unique)
				var profCheck = combo_get_stat(index, comboStats.proficiencyTier) == classCache[? playerClassStats.level];
				var autoGrantCheck = combo_get_stat(index, comboStats.autoGrant);
				if classCheck && typeCheck && profCheck && autoGrantCheck
				{
					scr_player_combo_manage(index,true);
					var comboName = combo_get_stat(index, comboStats.name);
					message_feed_add(className+" combo "+comboName+" learnt!",noone);	//add symbols to this eventually?? probably will change this into some message that appears when pausing after aquirement
				}
			}
		}
	}
}