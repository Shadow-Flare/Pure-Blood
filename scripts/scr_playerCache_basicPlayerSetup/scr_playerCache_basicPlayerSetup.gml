with PlayerStats
{
	level = 1;
	newLevels = 0;
	statPoints = 5;
	
	xp = 0;
	xpNeeded = 10*power(level+1,2);
	gold = 0;

	strengthBase = 5;
	constitutionBase = 5;
	dexterityBase = 5;
	cunningBase = 5;
	intelligenceBase = 5;
	willpowerBase = 5;
	
	strength = strengthBase;
	constitution = constitutionBase;
	dexterity = dexterityBase;
	cunning = cunningBase;
	intelligence = intelligenceBase;
	willpower = willpowerBase;

	hpMax = 20+4*constitution;
	mpMax = 20+4*willpower;
	apMax = 10+1*cunning;
	
	breakHp = 0;
	breakCooldownDuration = 1;

	ap = 0;
	hp = hpMax;
	mp = mpMax;

	moveSpeed = 1.5;
	defaultMoveSpeed = moveSpeed;
	
	runeSizeBase = 4;
	runeSize = runeSizeBase;
	
	jumpHeightVarInitial = 3.3;											//total jump height in blocks (16x16px or 128x128)
	jumpHeightVar = jumpHeightVarInitial
	jumpPow = sqrt(2*(jumpHeightVar*16)*GameManager.grav);				//jumpHeightVar*<blockSize>

	hitEffectType = "blood";
	hitEffectColour = "dark red";

	//Damage type resistances (magic: as percentage; 1 = 100% of damage is recieved | Physical: 0 = 0 reduc; reduction is subtraction based)
	damageResistances[damageType.slash] = 0;
	damageResistances[damageType.blunt] = 0;
	damageResistances[damageType.pierce] = 0;
	damageResistances[damageType.fire] = 1;
	damageResistances[damageType.ice] = 1;
	damageResistances[damageType.lightning] = 1;
	damageResistances[damageType.arcane] = 1;
	damageResistances[damageType.light] = 1;
	damageResistances[damageType.dark] = 1;
	damageResistances[damageType.pure] = 1;			//should allways be 1

	//Special activation check, all initially false
	specialHasActivated[specialType.bleed] = false;
	specialHasActivated[specialType.poison] = false;

	//Special Cooldowns (seconds)
	specialCooldowns[specialType.bleed] = 6;
	specialCooldowns[specialType.poison] = 15;

	//Special Damage initializers
	specialDamages[specialType.bleed] = 0;
	specialDamages[specialType.poison] = 0;

	//Special resistances (100 is considered normal)
	specialResistances[specialType.bleed] = 100;
	specialResistances[specialType.poison] = 100;

	//equipment data
		var equipCache = ItemCache.equipment
		var runeList = equipCache[? equipmentSlot.rune];
		ds_list_clear(runeList);
		repeat(PlayerStats.runeSize) ds_list_add(runeList,noone);
		equipCache[? equipmentSlot.head] = equipmentItem.iron_helmet;
		equipCache[? equipmentSlot.chest] = equipmentItem.iron_chestplate;
		equipCache[? equipmentSlot.hands] = equipmentItem.rusted_gauntlets;
		equipCache[? equipmentSlot.legs] = equipmentItem.chainmail_leggings;
		equipCache[? equipmentSlot.main1] = weaponItem.gladius;
		equipCache[? equipmentSlot.main2] = weaponItem.hastam;
		equipCache[? equipmentSlot.off1] = weaponItem.crossbow;
		equipCache[? equipmentSlot.off2] = weaponItem.spell_book;

	//inventory and owned stuff data
		//items
			//items
		scr_player_inventory_manage(itemType.item,itemItem.crossbow_bolt,30);
		scr_player_inventory_manage(itemType.item,itemItem.summon_stone,1);
		scr_player_inventory_manage(itemType.item,itemItem.hearthstone,1);
			//weapons
		scr_player_inventory_manage(itemType.weapon,weaponItem.gladius,1);
		scr_player_inventory_manage(itemType.weapon,weaponItem.hastam,1);
		scr_player_inventory_manage(itemType.weapon,weaponItem.crossbow,1);
		scr_player_inventory_manage(itemType.weapon,weaponItem.spell_book,1);
			//equipments
		scr_player_inventory_manage(itemType.equipment,equipmentItem.iron_helmet,1);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.bassinet,1);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.red_bandanna,1);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.iron_chestplate,1);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.rusted_gauntlets,1);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.chainmail_leggings,1);
			//Runes
		scr_player_inventory_manage(itemType.rune,runeItem.dagaz,1);
		scr_player_inventory_manage(itemType.rune,runeItem.lagaz,1);
		scr_player_inventory_manage(itemType.rune,runeItem.kaunan,1);

			//keys
		scr_player_inventory_manage(itemType.key,keyItem.wooden_key,1);
			//alchemy
	
		//combos
		scr_player_giveallcombos();

		//offhand subtypes
		scr_player_givealloffhandsubtypes();

		//active ability
		scr_player_giveallactiveabilities();
		
	//passive ability data
		scr_player_giveallabilities();
		//combat
		//movement
		//support
	
	//weapon & active data
		//main weapon combos
	GCSMod = 0;
	GFSMod = 0;
	ACSMod = 0;
	AFSMod = 0;
		
	classComboCache = ds_map_create();
	GCS = noone;
	GFS = noone;
	ACS = noone;
	AFS = noone;
	scr_resetComboData(weaponClass.sword);
	scr_resetComboData(weaponClass.spear);
	
		//initial data
	currentWeaponID = ItemCache.equipment[? equipmentSlot.main1];				//gladius
	currentOffhandID = ItemCache.equipment[? equipmentSlot.off1];				//crossbow
	currentOffhandSubtypeID = offhandSubtypeID.crossbow_normal;												//first index??
	currentOffhandActivatableID = activeAbilityID.crossbow_rope_shot;											//first index??
	
	currentWeaponIndex = 0;
	currentOffhandIndex = 0;
	currentOffhandSubtypeIndex = 0;
	currentOffhandActivatableIndex = 0;
	
	subtypeCache = ds_list_create();
	activeCache = ds_list_create();
	#region initial update of offhand Subtypes and activatables
		//subtypes
	ds_list_clear(subtypeCache);
	var cache = ComboCache.subtype;
	var subID = ds_map_find_first(cache);
	while subID != undefined
	{
		if subtype_get_stat(subID,offhandSubtypeStats.offhandType) == weapon_get_stat(PlayerStats.currentOffhandID,weaponStats.type)
		{
			ds_list_add(subtypeCache,subID);
		}
		subID = ds_map_find_next(cache,subID);
	}
		//actives
	ds_list_clear(activeCache);
	var cache = ComboCache.activeAbility;
	var subID = ds_map_find_first(cache);
	while subID != undefined
	{
		if activeAbility_get_stat(subID,activeAbilityStats.offhandType) == weapon_get_stat(PlayerStats.currentOffhandID,weaponStats.type)
		{
			ds_list_add(activeCache,subID);
		}
		subID = ds_map_find_next(cache,subID);
	}
	#endregion
	
	//misc
	isInvulnerable = false;
}

GameManager.currentCheckpointID = 0;