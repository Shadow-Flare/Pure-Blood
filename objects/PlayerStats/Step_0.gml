#region level up
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
#endregion
#region manage & gather equipment data
	//reset
ds_map_clear(equipmentStats);
for(var i = 0; i < itemEffects.LENGTH; i++) equipmentStats[? i] = 0;
	//scan and get
var equipID = ds_map_find_first(ItemCache.equipment);
while equipID != undefined
{
	if ItemCache.equipment[? equipID] == undefined ItemCache.equipment[? equipID] = noone;
	if equipID != equipmentSlot.item
	{
		var itemID = ItemCache.equipment[? equipID];
		if itemID != noone && itemID != undefined
		{
			if equipID == equipmentSlot.rune
			{
				var runeCache = itemID;
				keyType = itemType.rune;
				var cache = ItemCache.item[? keyType];
				for (var i = 0; i < ds_list_size(runeCache); i++)
				{
					var itemID = runeCache[| i];
					if itemID != noone && itemID != undefined
					{
						var itemCache = cache[? itemID];
						var effectCache = itemCache[? itemStats.effectsCache];
						var effectID = ds_map_find_first(effectCache);
						while effectID != undefined
						{
							equipmentStats[? effectID] += effectCache[? effectID];
							effectID = ds_map_find_next(effectCache,effectID);
						}
					}
				}
			}
			else
			{
				switch equipID
				{
					case equipmentSlot.head:
					case equipmentSlot.chest:
					case equipmentSlot.legs:
					case equipmentSlot.hands:
						var keyType = itemType.equipment;
						break;
					case equipmentSlot.main1:
					case equipmentSlot.main2:
					case equipmentSlot.off1:
					case equipmentSlot.off2:
						var keyType = itemType.weapon;
						break;
				}
				var equipMain = [equipmentSlot.main1,equipmentSlot.main2];
				var equipOff = [equipmentSlot.off1,equipmentSlot.off2];
				var mainSlot = equipMain[PlayerStats.currentWeaponIndex];
				var offSlot = equipOff[PlayerStats.currentOffhandIndex];
				if keyType != itemType.weapon || equipID == mainSlot || equipID = offSlot
				{
					var cache = ItemCache.item[? keyType];
					var itemCache = cache[? itemID];
					var effectCache = itemCache[? itemStats.effectsCache];
					var effectID = ds_map_find_first(effectCache);
					while effectID != undefined
					{
						equipmentStats[? effectID] += effectCache[? effectID];
						effectID = ds_map_find_next(effectCache,effectID);
					}
				}
			}
		}
	}
	equipID = ds_map_find_next(ItemCache.equipment,equipID);
}
#endregion
#region manage offhand Subtypes and activatables
	//subtypes
ds_list_clear(subtypeCache);
var cache = ComboCache.subtype;
var subID = ds_map_find_first(cache);
while subID != undefined
{
	if subtype_get_stat(subID,offhandSubtypeStats.offhandType) == weapon_get_stat(currentOffhandID,weaponStats.type)
	{
		ds_list_add(subtypeCache,subID);
	}
	subID = ds_map_find_next(cache,subID);
}
ds_list_sort(subtypeCache,true);
	//actives
ds_list_clear(activeCache);
var cache = ComboCache.activeAbility;
var subID = ds_map_find_first(cache);
while subID != undefined
{
	if activeAbility_get_stat(subID,activeAbilityStats.offhandType) == weapon_get_stat(currentOffhandID,weaponStats.type)
	{
		ds_list_add(activeCache,subID);
	}
	subID = ds_map_find_next(cache,subID);
}
ds_list_sort(activeCache,true);
#endregion
#region update stats (has a mirror in the equipment menu draw event, translate all changes there too, but using the variables allready there, manage and gather equipment data on line 15 here should be mirrored too)
var hpMaxPrev = hpMax;	//these dont have to be mirrored, donest really matter either way
var mpMaxPrev = mpMax;

strength = strengthBase+equipmentStats[? itemEffects.str];
constitution = constitutionBase+equipmentStats[? itemEffects.con];
dexterity = dexterityBase+equipmentStats[? itemEffects.dex];
cunning = cunningBase+equipmentStats[? itemEffects.cun];
intelligence = intelligenceBase+equipmentStats[? itemEffects.int];
willpower = willpowerBase+equipmentStats[? itemEffects.wil];

hpMax = 20+4*constitution+equipmentStats[? itemEffects.hp];
mpMax = 20+4*willpower+equipmentStats[? itemEffects.mp];
apMax = 10+1*cunning+equipmentStats[? itemEffects.ap];

damageResistances[damageType.slash] = equipmentStats[? itemEffects.slashDef];
damageResistances[damageType.pierce] = equipmentStats[? itemEffects.pierceDef];
damageResistances[damageType.blunt] = equipmentStats[? itemEffects.bluntDef];

damageResistances[damageType.fire] = 1+equipmentStats[? itemEffects.fireRes]+0.01*willpower;
damageResistances[damageType.ice] = 1+equipmentStats[? itemEffects.iceRes]+0.01*willpower;
damageResistances[damageType.lightning] = 1+equipmentStats[? itemEffects.lightningRes]+0.01*willpower;
damageResistances[damageType.arcane] = 1+equipmentStats[? itemEffects.arcaneRes]+0.03*willpower-0.02*intelligence;
damageResistances[damageType.light] = 1+equipmentStats[? itemEffects.lightRes]+0.01*willpower;
damageResistances[damageType.dark] = 1+equipmentStats[? itemEffects.darkRes]+0.01*willpower;

specialResistances[specialType.bleed] = 100+3*constitution+1.5*intelligence;
specialResistances[specialType.poison] = 100+3*constitution+1.5*intelligence;

toughness = 2+0.30*constitution+equipmentStats[? itemEffects.toughness];

alacrity = dexterity*0.33333+cunning*0.1+equipmentStats[? itemEffects.alacrity];
memory = intelligence*0.66666+equipmentStats[? itemEffects.memory];

drainMod = 0.1;		//scale with some faction stat, NEED TO MIRROR THIS IN EQUIPMENT ?

physicalDefense = (damageResistances[damageType.slash]+damageResistances[damageType.blunt]+damageResistances[damageType.pierce])/3;

jumpHeightVar = jumpHeightVarInitial+scr_player_ability_get(abilityType.movement,movementAbility.high_jump,playerAbilityStats.numberActivated);
jumpPow = sqrt(2*(jumpHeightVar*16)*GameManager.grav);							//jumpHeightVar*<blockSize>

var wepID = ItemCache.equipment[? equipmentSlot.main1];
scr_player_get_weapon_damage(wepID,weaponMain1DamageDetails,strength,dexterity,cunning,intelligence);

var wepID = ItemCache.equipment[? equipmentSlot.main2];
scr_player_get_weapon_damage(wepID,weaponMain2DamageDetails,strength,dexterity,cunning,intelligence);

var wepID = ItemCache.equipment[? equipmentSlot.off1];
scr_player_get_weapon_damage(wepID,weaponOff1DamageDetails,strength,dexterity,cunning,intelligence);

var wepID = ItemCache.equipment[? equipmentSlot.off2];
scr_player_get_weapon_damage(wepID,weaponOff2DamageDetails,strength,dexterity,cunning,intelligence);

#endregion

////TESTERS
//hpMax = round(max((mouse_x/320)*60,1));
//mpMax = round(max((mouse_y/176)*60,1));

#region scale hp/mp values with max changes
if hpMax != hpMaxPrev
{
	var ratio = hp/hpMaxPrev
	hp = hpMax*ratio;
}
if mpMax != mpMaxPrev
{
	var ratio = mp/mpMaxPrev
	mp = mpMax*ratio;
}
#endregion
#region update AP
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
#endregion
#region update combo lengths
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
#endregion