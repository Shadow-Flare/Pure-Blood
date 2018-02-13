///@arg abilityType.ENUM
///@arg SECONDENUM
///@arg playerAbilityStat.ENUM
///@arg mod
var type = argument0;
var abilityID = argument1;
var statType = argument2;
var modifier = argument3;

with AbilityCache
{
		//initialize specific ability cache
	var abilityTypeCache = playerAbilities[? type];
	if (abilityTypeCache[? abilityID] == undefined)
	{
		abilityTypeCache[? abilityID] = ds_map_create();
	}
	var abilitySpecificCache = abilityTypeCache[? abilityID];
		//initialize stats
	if abilitySpecificCache[? playerAbilityStats.numberOwned] == undefined
	{
		abilitySpecificCache[? playerAbilityStats.numberOwned] = 0;
	}
	if abilitySpecificCache[? playerAbilityStats.numberActivated] == undefined
	{
		abilitySpecificCache[? playerAbilityStats.numberActivated] = 0;
	}
		//modify stat
	abilitySpecificCache[? statType] += modifier; 	
		//roundup
	switch statType
	{
		case playerAbilityStats.numberOwned:
			if abilitySpecificCache[? statType] <= 0
			{
				ds_map_destroy(abilitySpecificCache);
			}
			if abilitySpecificCache[? statType] > ability_get_data(type,abilityID,abilityStats.maxNum)
			{
				abilitySpecificCache[? statType] = ability_get_data(type,abilityID,abilityStats.maxNum);
			}
			break;
		case playerAbilityStats.numberActivated:
			abilitySpecificCache[? statType] = clamp(abilitySpecificCache[? statType],0,abilitySpecificCache[? playerAbilityStats.numberOwned]);
			break;
	}
}