//level up
if xp >= xpNeeded
{
	message_feed_add("Level Up");
	scr_levelUp_effect();
	xp -= xpNeeded;
	level += 1;
	xpNeeded = 10*power(level+1,2);
	//newLevels += 1;				//add later
	statPoints += 3;
	hp = hpMax;
	mp = mpMax;
}

//update stats
hpMax = 20+4*constitution;
mpMax = 20+4*willpower;
apMax = 10+1*cunning;
physicalPower = 0+0.25*strength+0.25*dexterity;
physicalStagger = 0.5+0.05*strength;
magicalPower = 0+1*intelligence;
magicalStagger = 2+0.25*intelligence+0.25*willpower;
physicalToughness = 2+0.30*constitution;
magicalToughness = 2+0.30*willpower;

//update AP
ap = 0;
for (var i = 0; i < ds_map_size(AbilityCache.playerAbilities); i++)
	{
	var typeCache = AbilityCache.playerAbilities[? i];
	var abilityID = ds_map_find_first(typeCache);
	while (abilityID != undefined)
	{
		var ownedNum = scr_player_ability_get(i,abilityID,playerAbilityStats.numberActivated);
		repeat (ownedNum)
		{
			ap += ability_get_data(i,abilityID,abilityStats.cost);
		}
		abilityID = ds_map_find_next(typeCache,abilityID);
	}
}