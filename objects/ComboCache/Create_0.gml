#region enum Initialisers
	//Class Enumerators
enum weaponClass {sword, spear, greatHammer, crossbow, grimoire};
enum weaponClassStats {name, ID, defaultWeaponID, isMain, groundComboLength, groundFinisherLength, aerialComboLength, aerialFinisherLength, groundComboDefault, groundFinisherDefault, aerialComboDefault, aerialFinisherDefault, counter, downwards, forwards, backwards, numOfSubtypes, numOfActives, defaultSubtype, defaultActive, trainingModifier};
enum playerClassStats {level, xp, xpNeeded};

	//Main Weapon Enumerators
enum weaponStats {type, particleVolume, weight, range, uniqueAttack, strMod, dexMod, intMod, cunMod, physicalDam, fireDam, iceDam, lightningDam, arcaneDam, lightDam, darkDam, bleedDam, poisonDam};
enum weaponComboTypes {groundCombo, groundFinisher, aerialCombo, aerialFinisher, technical, unique};
enum comboSpecial {none, blink, thunderbolt, plunge};
enum hitEffect {uppercut, drainHpBase, drainHpScale, drainMpBase, drainMpScale};		//add base + scale factors later on
enum damageData {stagger, knockback, slash, pierce, blunt, fire, ice, lightning, arcane, light, dark, pure, bleed, poison};
enum extraComboTypes {upwards};
enum comboStats {name, description, class, type, proficiencyTier, autoGrant, sound, desiredXDist, desiredYDist, specials, animation, frameData, duration, cooldown, hitSoundType, hitAngle, hitStart, hitDuration, moveStart, moveDuration, moveDistX, moveDistY, damType, damMod, forMod, knockback, specType, specDam, effects};
enum comboID 
{
/*     Sword    */	sword_counter, sword_lightning_strike, sword_burst, sword_shove, sword_slice, sword_slice_alt, sword_blinkstrike, sword_smash, sword_gut, sword_skyward_slice, sword_slash, sword_slam,
/*     Spear    */	spear_counter, spear_spin, spear_skewer, spear_vault, spear_stab, spear_stab_alt, spear_juggle, spear_sweep, spear_drive, spear_poke, spear_poke_alt, spear_crash,
/* Great Hammer */	greatHammer_swing, greatHammer_swing_alt, greatHammer_crack, greatHammer_shatter, greatHammer_lift, greatHammer_lift_alt, greatHammer_crash, greatHammer_counter, greatHammer_earthShatter, greatHammer_ram, greatHammer_bash, greatHammer_divineJudgement, greatHammer_plunge, greatHammer_plungeLand,
/*     misc     */	misc_uppercut
}

	//Offhand Weapon Enumerators
enum offhandSubtypeStats {name, description, index, baseAnimation, icon, memoryUsage, ammoItem, manaCost, offhandType, damType, damMod, forMod, knockback, specType, specVal, boundEffect, projectileSpeed, explodeDuration, explodeScale, effect};
enum offhandSubtypeID
{
/* crossbow */		crossbow_normal, crossbow_fire, crossbow_ice, crossbow_lightning, crossbow_serrated,
/* grimoire */		grimoire_blaze, grimoire_frost, grimoire_spark, grimoire_drain, grimoire_osmose
}
	//Offhand Active Ability Enumerators
enum activeAbilityStats {name, description, index, baseAnimation, icon, memoryUsage, boundEffect, manaCost, offhandType};
enum activeAbilityID
{
/* crossbow */		crossbow_shrapnel_burst, crossbow_rope_shot,
/* grimoire */		grimoire_reflect, grimoire_heal
}

enum ownedSubtypeStats {owned, enabled, enabledIndex};
enum ownedActiveStats {owned, enabled, enabledIndex};
#endregion

#region All Weapon Classes
class = ds_map_create();
	#region Main hand
		#region Sword
	var tmp = 0;
	class[? weaponClass.sword] = ds_map_create();
	var cache = class[? weaponClass.sword];
	cache[? weaponClassStats.name] = "Sword";
	cache[? weaponClassStats.ID] = tmp;
	cache[? weaponClassStats.defaultWeaponID] = weaponItem.gladius;
	cache[? weaponClassStats.isMain] = true;
	cache[? weaponClassStats.trainingModifier] = 1.7;
	cache[? weaponClassStats.groundComboLength] = 3;
	cache[? weaponClassStats.groundFinisherLength] = 1;
	cache[? weaponClassStats.aerialComboLength] = 3;
	cache[? weaponClassStats.aerialFinisherLength] = 1;
	cache[? weaponClassStats.groundComboDefault] = comboID.sword_slice;
	cache[? weaponClassStats.groundFinisherDefault] = comboID.sword_smash;
	cache[? weaponClassStats.aerialComboDefault] = comboID.sword_slash;
	cache[? weaponClassStats.aerialFinisherDefault] = comboID.sword_slam;
	cache[? weaponClassStats.counter] = comboID.sword_counter;
	cache[? weaponClassStats.downwards] = comboID.sword_lightning_strike;
	cache[? weaponClassStats.forwards] = comboID.sword_burst;
	cache[? weaponClassStats.backwards] = comboID.sword_shove;
		#endregion
		#region Spear
	tmp++;
	class[? weaponClass.spear] = ds_map_create();
	var cache = class[? weaponClass.spear];
	cache[? weaponClassStats.name] = "Spear";
	cache[? weaponClassStats.ID] = tmp;
	cache[? weaponClassStats.defaultWeaponID] = weaponItem.hastam;
	cache[? weaponClassStats.isMain] = true;
	cache[? weaponClassStats.trainingModifier] = 1.3;
	cache[? weaponClassStats.groundComboLength] = 2;
	cache[? weaponClassStats.groundFinisherLength] = 1;
	cache[? weaponClassStats.aerialComboLength] = 4;
	cache[? weaponClassStats.aerialFinisherLength] = 1;
	cache[? weaponClassStats.groundComboDefault] = comboID.spear_stab;
	cache[? weaponClassStats.groundFinisherDefault] = comboID.spear_sweep;
	cache[? weaponClassStats.aerialComboDefault] = comboID.spear_poke;
	cache[? weaponClassStats.aerialFinisherDefault] = comboID.spear_crash;
	cache[? weaponClassStats.counter] = comboID.spear_counter;
	cache[? weaponClassStats.downwards] = comboID.spear_spin;
	cache[? weaponClassStats.forwards] = comboID.spear_skewer;
	cache[? weaponClassStats.backwards] = comboID.spear_vault;
		#endregion
		#region Great Hammer
	tmp++;
	class[? weaponClass.greatHammer] = ds_map_create();
	var cache = class[? weaponClass.greatHammer];
	cache[? weaponClassStats.name] = "Great Hammer";
	cache[? weaponClassStats.ID] = tmp;
	cache[? weaponClassStats.defaultWeaponID] = weaponItem.crucifix;	//should change
	cache[? weaponClassStats.isMain] = true;
	cache[? weaponClassStats.trainingModifier] = 1.1;
	cache[? weaponClassStats.groundComboLength] = 2;
	cache[? weaponClassStats.groundFinisherLength] = 1;
	cache[? weaponClassStats.aerialComboLength] = 1;
	cache[? weaponClassStats.aerialFinisherLength] = 1;
	cache[? weaponClassStats.groundComboDefault] = comboID.greatHammer_swing;
	cache[? weaponClassStats.groundFinisherDefault] = comboID.greatHammer_shatter;
	cache[? weaponClassStats.aerialComboDefault] = comboID.greatHammer_lift;
	cache[? weaponClassStats.aerialFinisherDefault] = comboID.greatHammer_crash;
	cache[? weaponClassStats.counter] = comboID.greatHammer_counter;
	cache[? weaponClassStats.downwards] = comboID.greatHammer_earthShatter;
	cache[? weaponClassStats.forwards] = comboID.greatHammer_ram;
	cache[? weaponClassStats.backwards] = comboID.greatHammer_bash;
		#endregion
	#endregion
	#region Offhand
		#region Crossbow
	tmp = 0;
	class[? weaponClass.crossbow] = ds_map_create();
	var cache = class[? weaponClass.crossbow];
	cache[? weaponClassStats.name] = "Crossbow";
	cache[? weaponClassStats.ID] = tmp;
	cache[? weaponClassStats.defaultWeaponID] = weaponItem.crossbow;
	cache[? weaponClassStats.isMain] = false;
	cache[? weaponClassStats.trainingModifier] = 1.0;
	cache[? weaponClassStats.defaultSubtype] = offhandSubtypeID.crossbow_normal;
	cache[? weaponClassStats.defaultActive] = activeAbilityID.crossbow_shrapnel_burst;
	cache[? weaponClassStats.numOfSubtypes] = 0;		//Set properly in end of ComboCache creat event
	cache[? weaponClassStats.numOfActives] = 0;			//Set properly in end of ComboCache creat event
		#endregion
		#region Grimoire
	tmp++;
	class[? weaponClass.grimoire] = ds_map_create();
	var cache = class[? weaponClass.grimoire];
	cache[? weaponClassStats.name] = "Grimoire";
	cache[? weaponClassStats.ID] = tmp;
	cache[? weaponClassStats.defaultWeaponID] = weaponItem.spell_book;
	cache[? weaponClassStats.isMain] = false;
	cache[? weaponClassStats.trainingModifier] = 1.0;
	cache[? weaponClassStats.defaultSubtype] = offhandSubtypeID.grimoire_blaze;
	cache[? weaponClassStats.defaultActive] = activeAbilityID.grimoire_reflect;
	cache[? weaponClassStats.numOfSubtypes] = 0;		//Set properly in end of ComboCache creat event
	cache[? weaponClassStats.numOfActives] = 0;			//Set properly in end of ComboCache creat event
		#endregion
	#endregion
#endregion
#region All Weapon Combos
combo = ds_map_create();
	#region Sword
		//Ground
			//Tech
		#region Counter
combo[? comboID.sword_counter] = ds_map_create();
var cache = combo[? comboID.sword_counter];
cache[? comboStats.name] = "Counter";
cache[? comboStats.description] = "Heavy reprisal attack.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordCounter;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],0);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
		#endregion
		#region Lightning Strike
combo[? comboID.sword_lightning_strike] = ds_map_create();
var cache = combo[? comboID.sword_lightning_strike];
cache[? comboStats.name] = "Lightning Strike";
cache[? comboStats.description] = "Large aoe lightning attack, creates a pillar of lightning on strike.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.thunderbolt);
cache[? comboStats.animation] = sprPlayerBodySwordLightningStrike;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 1.0;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],0);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/16/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/8/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 0;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.lightning);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],0.8);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],4);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
		#endregion
		#region Burst
combo[? comboID.sword_burst] = ds_map_create();
var cache = combo[? comboID.sword_burst];
cache[? comboStats.name] = "Burst";
cache[? comboStats.description] = "Lunging stab attack.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = snd_sword_swing_1;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordBurst;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.7;
cache[? comboStats.cooldown] = 0.3;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],0);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 80;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.pierce);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],0.6);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.5);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],3);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
	#endregion
		#region Shove
combo[? comboID.sword_shove] = ds_map_create();
var cache = combo[? comboID.sword_shove];
cache[? comboStats.name] = "Shove";
cache[? comboStats.description] = "Low damage, defensive strike with heavy stagger.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordShove;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.6;
cache[? comboStats.cooldown] = 0.3;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],0);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 6;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.blunt);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],0.2);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],2.5);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],4);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
	#endregion
			//Uniques
		#region Skyward Slice
combo[? comboID.sword_skyward_slice] = ds_map_create();
var cache = combo[? comboID.sword_skyward_slice];
cache[? comboStats.name] = "Skyward Slice";
cache[? comboStats.description] = "Fast, uppercut style attack with automatic vertical movement.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.unique;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 2;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordSkywardSlice;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.6;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],90);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 8;
cache[? comboStats.moveDistY] = -2.5*16;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],0.5);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],-1);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
	#endregion
			//Combo
		#region Slice
combo[? comboID.sword_slice] = ds_map_create();
var cache = combo[? comboID.sword_slice];
cache[? comboStats.name] = "Slice";
cache[? comboStats.description] = "Basic slashing attack.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.groundCombo;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = snd_sword_swing_2;
cache[? comboStats.desiredXDist] = 20;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordSlice;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduratio
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.3;
cache[? comboStats.cooldown] = 0.4;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],135);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 10;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],2);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
		#endregion
		#region Slice Alt
combo[? comboID.sword_slice_alt] = ds_map_create();
var cache = combo[? comboID.sword_slice_alt];
cache[? comboStats.name] = "Slice Alt";
cache[? comboStats.description] = "Basic slashing attack. ALT";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = snd_sword_swing_2;
cache[? comboStats.desiredXDist] = 20;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordSliceAlt;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduratio
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.3;
cache[? comboStats.cooldown] = 0.4;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],310);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 10;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],2);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
		#endregion
			//Finisher
		#region Smash
combo[? comboID.sword_smash] = ds_map_create();
var cache = combo[? comboID.sword_smash];
cache[? comboStats.name] = "Smash";
cache[? comboStats.description] = "Heavy finisher attack, has large damage, stagger and knockback.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.groundFinisher;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = snd_sword_swing_4;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordSmash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.7;
cache[? comboStats.cooldown] = 0.3;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],285);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 10;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],2.8);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],7.2);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],8);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
		#endregion
		#region Gut
combo[? comboID.sword_gut] = ds_map_create();
var cache = combo[? comboID.sword_gut];
cache[? comboStats.name] = "Gut";
cache[? comboStats.description] = "Plunge your sword into the enemy and rip it out, inflicting piercing and bleed damage.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.groundFinisher;
	cache[? comboStats.proficiencyTier] = 1;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = snd_sword_swing_1;
cache[? comboStats.desiredXDist] = 8;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordGut;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1,-1);
cache[? comboStats.duration] = 1.3;
cache[? comboStats.cooldown] = 0;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],0,
																						  0);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined,
																								  undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])),
																							  (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/8/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])),
																								 (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 2;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],		damageType.pierce,
																								damageType.pierce);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],			0.5,
																								0.1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],			2,
																								4);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],	0,
																								2.5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],		specialType.none,
																								specialType.bleed);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],		0,
																								130);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone,
																								noone);
		#endregion
		//Aerial
			//Tech
			//Combo
		#region Slash
combo[? comboID.sword_slash] = ds_map_create();
var cache = combo[? comboID.sword_slash];
cache[? comboStats.name] = "Slash";
cache[? comboStats.description] = "Basic aerial attack.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.aerialCombo;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = snd_sword_swing_1;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordAerialSlash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.35;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],235);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 6;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.0);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.25);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.6);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		#region Blinkstrike
combo[? comboID.sword_blinkstrike] = ds_map_create();
var cache = combo[? comboID.sword_blinkstrike];
cache[? comboStats.name] = "Blinkstrike";
cache[? comboStats.description] = "Teleport behind the targeted enemy and strike.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.aerialCombo;
	cache[? comboStats.proficiencyTier] = 1;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = snd_sword_swing_2;
cache[? comboStats.desiredXDist] = 6;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.blink);
cache[? comboStats.animation] = sprPlayerBodySwordAerialSlash;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduratio
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.3;
cache[? comboStats.cooldown] = 0.15;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],235);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 6;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.6);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
			//finisher
		#region Slam
combo[? comboID.sword_slam] = ds_map_create();
var cache = combo[? comboID.sword_slam];
cache[? comboStats.name] = "Slam";
cache[? comboStats.description] = "Heavy, aerial finisher attack. Slams the enemy to the ground, inflicting heavy damage.";
cache[? comboStats.class] = weaponClass.sword;
cache[? comboStats.type] = weaponComboTypes.aerialFinisher;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = snd_sword_swing_4;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordAerialSlam;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.6;
cache[? comboStats.cooldown] = 0.3;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 18;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],2.2);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],7.4);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],4.5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
	#endregion
	#region Spear
		//Ground
			//Tech
		#region Counter
combo[? comboID.spear_counter] = ds_map_create();
var cache = combo[? comboID.spear_counter];
cache[? comboStats.name] = "Counter";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearCounter;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
		#region Spin
combo[? comboID.spear_spin] = ds_map_create();
var cache = combo[? comboID.spear_spin];
cache[? comboStats.name] = "Spin";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearSpin;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
		#region Skewer
combo[? comboID.spear_skewer] = ds_map_create();
var cache = combo[? comboID.spear_skewer];
cache[? comboStats.name] = "Skewer";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearSkewer;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
		#region Vault
combo[? comboID.spear_vault] = ds_map_create();
var cache = combo[? comboID.spear_vault];
cache[? comboStats.name] = "Vault";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearVault;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
			//Unique
		#region Drive
combo[? comboID.spear_drive] = ds_map_create();
var cache = combo[? comboID.spear_drive];
cache[? comboStats.name] = "Drive";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.unique;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearDrive;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
			//Combo
		#region Stab
combo[? comboID.spear_stab] = ds_map_create();
var cache = combo[? comboID.spear_stab];
cache[? comboStats.name] = "Stab";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.groundCombo;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 24;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearStab;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],[0,1]);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],0);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 10;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.pierce);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.7);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		#region Stab Alt
combo[? comboID.spear_stab_alt] = ds_map_create();
var cache = combo[? comboID.spear_stab_alt];
cache[? comboStats.name] = "Stab Alt";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 24;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearStabAlt;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],[0,1]);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],0);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 10;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.pierce);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.7);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
			//Finisher
		#region Sweep
combo[? comboID.spear_sweep] = ds_map_create();
var cache = combo[? comboID.spear_sweep];
cache[? comboStats.name] = "Sweep";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.groundFinisher;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 12;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearSweep;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],[0,1]);
cache[? comboStats.duration] = 0.7;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],300);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 8;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],2.5);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],7.8);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],4.5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		#region Juggle
combo[? comboID.spear_juggle] = ds_map_create();
var cache = combo[? comboID.spear_juggle];
cache[? comboStats.name] = "Juggle";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.groundFinisher;
	cache[? comboStats.proficiencyTier] = 1;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearJuggle;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		//Aerial
			//Tech
			//Combo
		#region Poke
combo[? comboID.spear_poke] = ds_map_create();
var cache = combo[? comboID.spear_poke];
cache[? comboStats.name] = "Poke";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.aerialCombo;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearAerialPoke;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		#region PokeAlt
combo[? comboID.spear_poke_alt] = ds_map_create();
var cache = combo[? comboID.spear_poke_alt];
cache[? comboStats.name] = "Poke Alt";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearAerialPokeAlt;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
			//Finisher
		#region Crash
combo[? comboID.spear_crash] = ds_map_create();
var cache = combo[? comboID.spear_crash];
cache[? comboStats.name] = "Crash";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.aerialFinisher;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearAerialCrash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
	#endregion
	#region Great Hammer
		//Ground
			//Tech
		#region Counter
combo[? comboID.greatHammer_counter] = ds_map_create();
var cache = combo[? comboID.greatHammer_counter];
cache[? comboStats.name] = "Counter";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerCounter;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
		#region Earth Shatter
combo[? comboID.greatHammer_earthShatter] = ds_map_create();
var cache = combo[? comboID.greatHammer_earthShatter];
cache[? comboStats.name] = "Earth Shatter";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerEarthShatter;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
		#region Ram
combo[? comboID.greatHammer_ram] = ds_map_create();
var cache = combo[? comboID.greatHammer_ram];
cache[? comboStats.name] = "Ram";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerRam;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
		#region Bash
combo[? comboID.greatHammer_bash] = ds_map_create();
var cache = combo[? comboID.greatHammer_bash];
cache[? comboStats.name] = "Bash";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerBash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
		#region Great Hammer Plunge
combo[? comboID.greatHammer_plunge] = ds_map_create();
var cache = combo[? comboID.greatHammer_plunge];
cache[? comboStats.name] = "Plunge";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerPlunge;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 999;
cache[? comboStats.cooldown] = 999;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],270);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 0;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.blunt);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.7);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone);
		#endregion
		#region Great Hammer Plunge Land
combo[? comboID.greatHammer_plungeLand] = ds_map_create();
var cache = combo[? comboID.greatHammer_plungeLand];
cache[? comboStats.name] = "Plunge Land";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none,comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerPlungeLand;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1,-1);
cache[? comboStats.duration] = 1.2;
cache[? comboStats.cooldown] = 0.4;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],noone,90);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined,undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])),
																						  (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/8/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])),
																								(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 0;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.blunt,damageType.blunt);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],3.2,0.4);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],8.6,3.2);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],3.2,0.7);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none,specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0,0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone,noone);
		#endregion
			//Unique
		#region Divine Judgement
combo[? comboID.greatHammer_divineJudgement] = ds_map_create();
var cache = combo[? comboID.greatHammer_divineJudgement];
cache[? comboStats.name] = "Divine Judgement";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.unique;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerDivineJudgement;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
	#endregion
			//Combo
		#region Swing
combo[? comboID.greatHammer_swing] = ds_map_create();
var cache = combo[? comboID.greatHammer_swing];
cache[? comboStats.name] = "Swing";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.groundCombo;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 24;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerSwing;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 1.2;
cache[? comboStats.cooldown] = 0.4;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/7/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/7/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 15;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.pierce);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.7);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		#region Swing Alt
combo[? comboID.greatHammer_swing_alt] = ds_map_create();
var cache = combo[? comboID.greatHammer_swing_alt];
cache[? comboStats.name] = "Swing Alt";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 24;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerSwingAlt;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 1.2;
cache[? comboStats.cooldown] = 0.4;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/8/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/7/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 15;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.pierce);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.7);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		#region Crack
combo[? comboID.greatHammer_crack] = ds_map_create();
var cache = combo[? comboID.greatHammer_crack];
cache[? comboStats.name] = "Crack";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.groundCombo;
	cache[? comboStats.proficiencyTier] = 1;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 12;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerCrack;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],[0,1]);
cache[? comboStats.duration] = 1.2;
cache[? comboStats.cooldown] = 0.4;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/7/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/7/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 15;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.pierce);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],0.7);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
			//Finisher
		#region Shatter
combo[? comboID.greatHammer_shatter] = ds_map_create();
var cache = combo[? comboID.greatHammer_shatter];
cache[? comboStats.name] = "Shatter";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.groundFinisher;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 12;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerShatter;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],[1,2],-1);
cache[? comboStats.duration] = 2.1;
cache[? comboStats.cooldown] = 0.5;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275,90);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/6/**//sprite_get_number(cache[? comboStats.animation])),
																						  (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/17/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])),
																								(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 8;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.blunt,damageType.blunt);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],2.5, 0.4);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],7.8, 3.2);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],4.5,2.6);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none,specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0,0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],noone,noone);
		#endregion
		//Aerial
			//Tech
			//Combo
		#region Lift
combo[? comboID.greatHammer_lift] = ds_map_create();
var cache = combo[? comboID.greatHammer_lift];
cache[? comboStats.name] = "Lift";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.aerialCombo;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerAerialLift;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 6;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
		#region Lift Alt (Copy)
combo[? comboID.greatHammer_lift_alt] = ds_map_create();
var cache = combo[? comboID.greatHammer_lift_alt];
cache[? comboStats.name] = "Lift Alt";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.technical;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = false;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerAerialLiftAlt;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 0;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
			//Finisher
		#region Crash
combo[? comboID.greatHammer_crash] = ds_map_create();
var cache = combo[? comboID.greatHammer_crash];
cache[? comboStats.name] = "Crash";
cache[? comboStats.class] = weaponClass.greatHammer;
cache[? comboStats.type] = weaponComboTypes.aerialFinisher;
	cache[? comboStats.proficiencyTier] = 0;
	cache[? comboStats.autoGrant] = true;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.plunge);
cache[? comboStats.animation] = sprPlayerBodyGreatHammerAerialCrash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/0/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 20;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],1.3);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],1.3);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],5);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
	#endregion
	#region Misc
		#region Uppercut Template
combo[? comboID.misc_uppercut] = ds_map_create();
var cache = combo[? comboID.misc_uppercut];
cache[? comboStats.name] = "Uppercut";
cache[? comboStats.class] = weaponClass.sword;		//???
cache[? comboStats.type] = weaponComboTypes.technical;
cache[? comboStats.sound] = snd_sword_swing_1;
cache[? comboStats.desiredXDist] = 8;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodyDefaultOffhandUppercut;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.5;
cache[? comboStats.cooldown] = 0.1;
cache[? comboStats.hitAngle] = ds_list_create(); ds_list_add(cache[? comboStats.hitAngle],275);
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 6;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],0.25);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],2.8);
cache[? comboStats.knockback] = ds_list_create(); ds_list_add(cache[? comboStats.knockback],-2.75);
cache[? comboStats.specType] = ds_list_create(); ds_list_add(cache[? comboStats.specType],specialType.none);
cache[? comboStats.specDam] = ds_list_create(); ds_list_add(cache[? comboStats.specDam],0);
	var c = ds_map_create(); c[? hitEffect.uppercut] = true;
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],c);
		#endregion
	#endregion
#endregion
#region All Offhand Subtypes
subtype = ds_map_create();
	#region crossbow
		#region normal bolts
subtype[? offhandSubtypeID.crossbow_normal] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_normal];
subCache[? offhandSubtypeStats.name] = "Normal Bolts";
subCache[? offhandSubtypeStats.description] = "A thin wooden stake tipped with a small, tapered steel nub. The stopping power of these bolts is powerful enough to pierce most forms of flesh, but suffers greatly against armour or any form of carapace.";
subCache[? offhandSubtypeStats.index] = 0;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_crossbow_normal_bolt;
subCache[? offhandSubtypeStats.baseAnimation] = spr_crossbow_bolt;
subCache[? offhandSubtypeStats.memoryUsage] = 0;
subCache[? offhandSubtypeStats.boundEffect] = noone;
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 0;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.pierce;
subCache[? offhandSubtypeStats.damMod] = 1.0;
subCache[? offhandSubtypeStats.forMod] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region fire bolts
subtype[? offhandSubtypeID.crossbow_fire] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_fire];
subCache[? offhandSubtypeStats.name] = "Fire Bolts";
subCache[? offhandSubtypeStats.description] = "Applying sustained mana to a projectile effectively is a very specialized task. With this technique the user is able to impart a flame to a crossbow's bolts.";
subCache[? offhandSubtypeStats.index] = 1;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_crossbow_fire_bolt;
subCache[? offhandSubtypeStats.baseAnimation] = spr_crossbow_bolt;
subCache[? offhandSubtypeStats.memoryUsage] = 1;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_fire;
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 4;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.fire;
subCache[? offhandSubtypeStats.damMod] = 0.85;
subCache[? offhandSubtypeStats.forMod] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region ice bolts
subtype[? offhandSubtypeID.crossbow_ice] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_ice];
subCache[? offhandSubtypeStats.name] = "Ice Bolts";
subCache[? offhandSubtypeStats.description] = "Applying sustained mana to a projectile effectively is a very specialized task. With this technique the user is able to impart a localized burst of cold to a crossbow's bolts.";
subCache[? offhandSubtypeStats.index] = 2;
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_crossbow_ice_bolt;
subCache[? offhandSubtypeStats.baseAnimation] = spr_crossbow_bolt;
subCache[? offhandSubtypeStats.memoryUsage] = 1;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_ice;
subCache[? offhandSubtypeStats.manaCost] = 5;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.ice;
subCache[? offhandSubtypeStats.damMod] = 0.85;
subCache[? offhandSubtypeStats.forMod] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region lightning bolts
subtype[? offhandSubtypeID.crossbow_lightning] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_lightning];
subCache[? offhandSubtypeStats.name] = "Lightning Bolts";
subCache[? offhandSubtypeStats.description] = "Applying sustained mana to a projectile effectively is a very specialized task. With this technique the user is able to impart a significant current of energy to a crossbow's bolts.";
subCache[? offhandSubtypeStats.index] = 3;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_crossbow_lightning_bolt;
subCache[? offhandSubtypeStats.baseAnimation] = spr_crossbow_bolt;
subCache[? offhandSubtypeStats.memoryUsage] = 1;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_lightning;
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 6;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.lightning;
subCache[? offhandSubtypeStats.damMod] = 0.85;
subCache[? offhandSubtypeStats.forMod] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region serrated bolts
subtype[? offhandSubtypeID.crossbow_serrated] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_serrated];
subCache[? offhandSubtypeStats.name] = "Serrated Bolts";
subCache[? offhandSubtypeStats.description] = "A thin wooden stake tipped with a large metal shaft covered in metal spines. The added metal renders the projectile much heavier, but the end result is a bolt which bites through the flesh of it's target and is painful to remove.";
subCache[? offhandSubtypeStats.index] = 4;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_crossbow_serrated_bolt;
subCache[? offhandSubtypeStats.baseAnimation] = spr_crossbow_bolt;
subCache[? offhandSubtypeStats.memoryUsage] = 1;
subCache[? offhandSubtypeStats.boundEffect] = noone;
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 3;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.slash;
subCache[? offhandSubtypeStats.damMod] = 0.6;
subCache[? offhandSubtypeStats.forMod] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.bleed;
subCache[? offhandSubtypeStats.specVal] = 20;
		#endregion
	#endregion
	#region grimoire
		#region blaze
subtype[? offhandSubtypeID.grimoire_blaze] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.grimoire_blaze];
subCache[? offhandSubtypeStats.name] = "Blaze";
subCache[? offhandSubtypeStats.description] = "Mana can be projected and influenced in a myriad of ways. With this technique the user propells a small ball of concentrated mana in the form of concentrated heat. Apon collision this energy is released as an explosion.";
subCache[? offhandSubtypeStats.index] = 0;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_grimoire_blaze;
subCache[? offhandSubtypeStats.memoryUsage] = 1;
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 16;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.fire;
subCache[? offhandSubtypeStats.damMod] = 0.8;
subCache[? offhandSubtypeStats.forMod] = 1.2;
subCache[? offhandSubtypeStats.knockback] = 6;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_fire;
subCache[? offhandSubtypeStats.projectileSpeed] = 6;
subCache[? offhandSubtypeStats.explodeDuration] = 0.7;
subCache[? offhandSubtypeStats.explodeScale] = 4;
		#endregion
		#region frost
subtype[? offhandSubtypeID.grimoire_frost] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.grimoire_frost];
subCache[? offhandSubtypeStats.name] = "Frost";
subCache[? offhandSubtypeStats.description] = "Mana can be projected and influenced in a myriad of ways. With this technique the user propells a small ball of concentrated mana in the form of concentrated cold. Apon collision this energy is released as an explosion."
subCache[? offhandSubtypeStats.index] = 1;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_grimoire_frost;
subCache[? offhandSubtypeStats.memoryUsage] = 1;
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 20;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.ice;
subCache[? offhandSubtypeStats.damMod] = 1.0;
subCache[? offhandSubtypeStats.forMod] = 1.2;
subCache[? offhandSubtypeStats.knockback] = 6;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_ice;
subCache[? offhandSubtypeStats.projectileSpeed] = 5;
subCache[? offhandSubtypeStats.explodeDuration] = 1.2;
subCache[? offhandSubtypeStats.explodeScale] = 5;
		#endregion
		#region spark
subtype[? offhandSubtypeID.grimoire_spark] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.grimoire_spark];
subCache[? offhandSubtypeStats.name] = "Spark";
subCache[? offhandSubtypeStats.description] = "Mana can be projected and influenced in a myriad of ways. With this technique the user propells a small ball of concentrated mana in the form of concentrated electrid charge. Apon collision this energy is released as an explosion."
subCache[? offhandSubtypeStats.index] = 2;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_grimoire_spark;
subCache[? offhandSubtypeStats.memoryUsage] = 1;
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 24;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.lightning;
subCache[? offhandSubtypeStats.damMod] = 1.2;
subCache[? offhandSubtypeStats.forMod] = 1.2;
subCache[? offhandSubtypeStats.knockback] = 6;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_lightning;
subCache[? offhandSubtypeStats.projectileSpeed] = 7;
subCache[? offhandSubtypeStats.explodeDuration] = 0.6;
subCache[? offhandSubtypeStats.explodeScale] = 2.5;
		#endregion
		#region drain
subtype[? offhandSubtypeID.grimoire_drain] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.grimoire_drain];
subCache[? offhandSubtypeStats.name] = "Drain";
subCache[? offhandSubtypeStats.description] = "By directly tapping into the life force of an enemy the user of this technique is able to release fragments of it into the air, drawing them to the user and adding to their own strength.";
subCache[? offhandSubtypeStats.index] = 3;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_grimoire_drain;
subCache[? offhandSubtypeStats.memoryUsage] = 2;
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 32;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.dark;
subCache[? offhandSubtypeStats.damMod] = 2.0;
subCache[? offhandSubtypeStats.forMod] = 0.7;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.effect] = ds_map_create(); var c = subCache[? offhandSubtypeStats.effect]; c[? hitEffect.drainHpBase] = 1;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_dark;
subCache[? offhandSubtypeStats.projectileSpeed] = 3.5;
subCache[? offhandSubtypeStats.explodeDuration] = 0.6;
subCache[? offhandSubtypeStats.explodeScale] = 2.5;
		#endregion
		#region osmose
subtype[? offhandSubtypeID.grimoire_osmose] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.grimoire_osmose];
subCache[? offhandSubtypeStats.name] = "Osmose";
subCache[? offhandSubtypeStats.description] = "By directly tapping into the mana of an enemy, the user of this technique can diphon the energy of another being, releasing and drawing it into the user. If the being has no mana stored within, it will instead tap directly to their life force, converting it to mana. Though to a dimished effect.";
subCache[? offhandSubtypeStats.index] = 4;
subCache[? offhandSubtypeStats.icon] = spr_icon_subtype_grimoire_osmose;
subCache[? offhandSubtypeStats.memoryUsage] = 2;
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 2;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.slash;
subCache[? offhandSubtypeStats.damMod] = 0.2;
subCache[? offhandSubtypeStats.forMod] = 0.4;
subCache[? offhandSubtypeStats.knockback] = 2;
subCache[? offhandSubtypeStats.effect] = ds_map_create(); var c = subCache[? offhandSubtypeStats.effect]; c[? hitEffect.drainMpBase] = 2.5;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
subCache[? offhandSubtypeStats.boundEffect] = obj_effect_base_arcane;
subCache[? offhandSubtypeStats.projectileSpeed] = 2;
subCache[? offhandSubtypeStats.explodeDuration] = 0.6;
subCache[? offhandSubtypeStats.explodeScale] = 2.5;
		#endregion
	#endregion
#endregion
#region All Offhand Active Abilities
activeAbility = ds_map_create();
	#region Crossbow
		#region Shrapnel Burst
activeAbility[? activeAbilityID.crossbow_shrapnel_burst] = ds_map_create();
var cache = activeAbility[? activeAbilityID.crossbow_shrapnel_burst];
cache[? activeAbilityStats.name] = "Shrapnel Burst"
cache[? activeAbilityStats.description] = "Through use of an arcane system of sigils inscribed on thr crossbow, mana can be poured into its chamber, creading a concentrated and volatile warhead. Without the proper skill, it cannot be fired as an explosive. However it can still be detonated immediately as it leaves the crossbow, releasing a conicle explosion."
cache[? activeAbilityStats.index] = 0;
cache[? activeAbilityStats.icon] = spr_icon_active_crossbow_shrapnel_burst;
cache[? activeAbilityStats.baseAnimation] = noone;
cache[? activeAbilityStats.memoryUsage] = 0;
cache[? activeAbilityStats.boundEffect] = noone;
cache[? activeAbilityStats.manaCost] = 12;
cache[? activeAbilityStats.offhandType] = weaponClass.crossbow;
		#endregion
		#region Rope Shot
activeAbility[? activeAbilityID.crossbow_rope_shot] = ds_map_create();
var cache = activeAbility[? activeAbilityID.crossbow_rope_shot];
cache[? activeAbilityStats.name] = "Rope Shot"
cache[? activeAbilityStats.description] = "Through this advance system, a grappling hook and rope can be fired from a crossbow, hooking onto distant points and opening avenues for greater movement. By means of a mana infused winch, the rope is able to be extended and retracted with considerable force, propelling the user towards a target or indeed pulling it in."
cache[? activeAbilityStats.index] = 1;
cache[? activeAbilityStats.icon] = spr_icon_active_crossbow_rope_shot;
cache[? activeAbilityStats.baseAnimation] = spr_hook;
cache[? activeAbilityStats.memoryUsage] = 0;
cache[? activeAbilityStats.boundEffect] = noone;
cache[? activeAbilityStats.manaCost] = 0;
cache[? activeAbilityStats.offhandType] = weaponClass.crossbow;
		#endregion
	#endregion
	#region Grimoire
		#region Reflect
activeAbility[? activeAbilityID.grimoire_reflect] = ds_map_create();
var cache = activeAbility[? activeAbilityID.grimoire_reflect];
cache[? activeAbilityStats.name] = "Reflect"
cache[? activeAbilityStats.description] = "By erecting a barrier of energy-reactive mana about the user, this technique allows one to absorb the blows of any impact, be it physical or magical. This energy must be released however, fortunately in can be dispersed outward, damaging all those nearby."
cache[? activeAbilityStats.index] = 0;
cache[? activeAbilityStats.icon] = spr_icon_active_grimoire_reflect;
cache[? activeAbilityStats.baseAnimation] = spr_grimoire_reflect;
cache[? activeAbilityStats.memoryUsage] = 0;
cache[? activeAbilityStats.boundEffect] = noone;
cache[? activeAbilityStats.manaCost] = 18;
cache[? activeAbilityStats.offhandType] = weaponClass.grimoire;
		#endregion
		#region Heal
activeAbility[? activeAbilityID.grimoire_heal] = ds_map_create();
var cache = activeAbility[? activeAbilityID.grimoire_heal];
cache[? activeAbilityStats.name] = "Heal"
cache[? activeAbilityStats.description] = "Focus mana into a healing spell (non canon usage of magic at this point, this is a tester)."
cache[? activeAbilityStats.index] = 1;
cache[? activeAbilityStats.icon] = spr_icon_active_grimoire_heal;
cache[? activeAbilityStats.baseAnimation] = noone;
cache[? activeAbilityStats.memoryUsage] = 3;
cache[? activeAbilityStats.boundEffect] = noone;
cache[? activeAbilityStats.manaCost] = 24;
cache[? activeAbilityStats.offhandType] = weaponClass.grimoire;
		#endregion
	#endregion
#endregion

#region Player Class Data
playerClass = ds_map_create();
#endregion
#region Player Weapon Combos
playerCombo = ds_map_create();
#endregion
#region Player Offhand Subtypes
playerOffhandSubtype = ds_map_create();
#endregion
#region Player Offhand Abilities
playerActiveAbility = ds_map_create();
#endregion

#region Misc
	#region Class Subtype and active size
		//subtypes
var index = ds_map_find_first(subtype);
while index != undefined
{
	var subCache = subtype[? index];
	var classEnum = subCache[? offhandSubtypeStats.offhandType];
	var classCache = class[? classEnum];
	classCache[? weaponClassStats.numOfSubtypes]++;
	index = ds_map_find_next(subtype,index);
}
		//actives
var index = ds_map_find_first(activeAbility);
while index != undefined
{
	var actCache = activeAbility[? index];
	var classEnum = actCache[? activeAbilityStats.offhandType];
	var classCache = class[? classEnum];
	classCache[? weaponClassStats.numOfActives]++;
	index = ds_map_find_next(activeAbility,index);
}
	#endregion
	#region Weapon Class Progression Defaults
		weaponClassMaxLevel = 6;	//intention is for grades up to s+, so F(0)-E(1)-D(2)-C(3)-B(4)-A(5)-S(6)-S+(7). S can be reached through normal leveling, S+ will require some unique world event/condition to trigger it.
	#endregion
	#region Specials initializers
			//Blink
		blinkRange = 16*4;
		blinkAnimationStart = spr_blink_start;
		blinkAnimationEnd = spr_blink_end;
		blinkSound = snd_blink
			//plunge
		plungeSpeed = 4;
		plungeMaxDuration = 10;	//this should be unused
	#endregion
#endregion