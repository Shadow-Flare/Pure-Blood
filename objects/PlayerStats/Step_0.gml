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

jumpHeightVar = jumpHeightVarInitial+scr_player_ability_get(abilityType.movement,movementAbility.high_jump,playerAbilityStats.numberActivated);
jumpPow = sqrt(2*(jumpHeightVar*16)*GameManager.grav);							//jumpHeightVar*<blockSize>

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

	//update combo lengths
GCPrev = GCSMod; GFPrev = GFSMod; ACPrev = ACSMod; AFPrev = AFSMod;
GCSMod = scr_player_ability_get(abilityType.combat,combatAbility.combo_plus,playerAbilityStats.numberActivated);
GFSMod = scr_player_ability_get(abilityType.combat,combatAbility.finisher_plus,playerAbilityStats.numberActivated);
ACSMod = scr_player_ability_get(abilityType.combat,combatAbility.aerial_plus,playerAbilityStats.numberActivated);
AFSMod = scr_player_ability_get(abilityType.combat,combatAbility.devastator_plus,playerAbilityStats.numberActivated);
if GCPrev!=GCSMod || GFPrev!=GFSMod || ACPrev!=ACSMod || AFPrev!=AFSMod
{
	var class = weapon_get_stat(currentWeaponID,weaponStats.type);
	scr_resetComboData(class);
}