#region enum Initialisers
	//Class Enumerators
enum weaponClass {crossbow, grimoire, sword, spear};
enum weaponClassStats {name, isMain, groundComboLength, groundFinisherLength, aerialComboLength, aerialFinisherLength, groundComboDefault, groundFinisherDefault, aerialComboDefault, aerialFinisherDefault, counter, downwards, forwards, backwards};
enum playerClassStats {level, xp, xpNeeded};

	//Main Weapon Enumerators
enum weaponStats {type, strMod, conMod, dexMod, cunMod, intMod, wisMod, range, specialType, specialValue, uniqueAttack};
enum weaponComboTypes {groundCombo, groundFinisher, aerialCombo, aerialFinisher, technical, unique};
enum comboSpecial {none, blink, thunderbolt};
enum hitEffect {drainHpBase, drainHpScale, drainMpBase, drainMpScale};		//add base + scale factors later on
enum extraComboTypes {upwards};
enum comboStats {name, description, class, type, sound, desiredXDist, desiredYDist, specials, animation, frameData, duration, cooldown, hitSoundType, hitStart, hitDuration, moveStart, moveDuration, moveDistX, moveDistY, damType, damMod, forMod, knockback, specType, specDam, effects};
enum comboID 
{
/* Sword */	sword_counter, sword_lightning_strike, sword_burst, sword_shove, sword_slice, sword_blinkstrike, sword_smash, sword_gut, sword_skyward_slice, sword_slash, sword_slam,
/* Spear */	spear_counter, spear_spin, spear_skewer, spear_vault, spear_stab, spear_juggle, spear_drill, spear_drive, spear_poke, spear_crash,
/* misc  */ misc_uppercut
}

	//Offhand Weapon Enumerators
enum offhandStats {name};
enum offhandSubtypeStats {name, ammoItem, manaCost, offhandType, damType, damVal, forVal, knockback, specType, specVal, boundEffect, projectileSpeed, explodeDuration, explodeScale, effect};
enum offhandSubtypeID
{
/* crossbow */		crossbow_normal, crossbow_fire, crossbow_ice, crossbow_lightning, crossbow_serrated,
/* grimoire */		grimoire_blaze, grimoire_frost, grimoire_spark, grimoire_drain, grimoire_osmose
}
	//Offhand Active Ability Enumerators
enum activeAbilityStats {name, manaCost, offhandType};
enum activeAbilityID
{
/* crossbow */		crossbow_rope_shot, crossbow_shrapnel_burst,
/* grimoire */		grimoire_reflect, grimoire_heal
}
#endregion

#region All Weapon Classes
class = ds_map_create();
	#region Main hand
		#region Sword
	class[? weaponClass.sword] = ds_map_create();
	var cache = class[? weaponClass.sword];
	cache[? weaponClassStats.name] = "Sword";
	cache[? weaponClassStats.isMain] = true;
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
	class[? weaponClass.spear] = ds_map_create();
	var cache = class[? weaponClass.spear];
	cache[? weaponClassStats.name] = "Spear";
	cache[? weaponClassStats.isMain] = true;
	cache[? weaponClassStats.groundComboLength] = 2;
	cache[? weaponClassStats.groundFinisherLength] = 1;
	cache[? weaponClassStats.aerialComboLength] = 4;
	cache[? weaponClassStats.aerialFinisherLength] = 1;
	cache[? weaponClassStats.groundComboDefault] = comboID.spear_stab;
	cache[? weaponClassStats.groundFinisherDefault] = comboID.spear_drill;
	cache[? weaponClassStats.aerialComboDefault] = comboID.spear_poke;
	cache[? weaponClassStats.aerialFinisherDefault] = comboID.spear_crash;
	cache[? weaponClassStats.counter] = comboID.spear_counter;
	cache[? weaponClassStats.downwards] = comboID.spear_spin;
	cache[? weaponClassStats.forwards] = comboID.spear_skewer;
	cache[? weaponClassStats.backwards] = comboID.spear_vault;
		#endregion
	#endregion
	#region Offhand
		#region Crossbow
	class[? weaponClass.crossbow] = ds_map_create();
	var cache = class[? weaponClass.crossbow];
	cache[? weaponClassStats.name] = "Crossbow";
	cache[? weaponClassStats.isMain] = false;
		#endregion
		#region Grimoire
	class[? weaponClass.grimoire] = ds_map_create();
	var cache = class[? weaponClass.grimoire];
	cache[? weaponClassStats.name] = "Grimoire";
	cache[? weaponClassStats.isMain] = false;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordCounter;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.thunderbolt);
cache[? comboStats.animation] = sprPlayerBodySwordLightningStrike;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 1.0;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = snd_sword_swing_1;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordBurst;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.7;
cache[? comboStats.cooldown] = 0.3;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordShove;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.6;
cache[? comboStats.cooldown] = 0.3;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = 2;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordSkywardSlice;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.6;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = snd_sword_swing_2;
cache[? comboStats.desiredXDist] = 20;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordSlice;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduratio
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.3;
cache[? comboStats.cooldown] = 0.4;
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
cache[? comboStats.sound] = snd_sword_swing_4;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordSmash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.7;
cache[? comboStats.cooldown] = 0.3;
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/4/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 10;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],2.8);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],4);
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
cache[? comboStats.sound] = snd_sword_swing_1;
cache[? comboStats.desiredXDist] = 8;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordGut;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1,-1);
cache[? comboStats.duration] = 1.3;
cache[? comboStats.cooldown] = 0;
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
cache[? comboStats.sound] = snd_sword_swing_1;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordAerialSlash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.35;
cache[? comboStats.cooldown] = 0.2;
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 6;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],0.8);
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
cache[? comboStats.sound] = snd_sword_swing_2;
cache[? comboStats.desiredXDist] = 6;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.blink);
cache[? comboStats.animation] = sprPlayerBodySwordAerialSlash;		//not used in script, just used as a base for hitstart + hitduration + movestart + moveduratio
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.3;
cache[? comboStats.cooldown] = 0.15;
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
cache[? comboStats.sound] = snd_sword_swing_4;
cache[? comboStats.desiredXDist] = 16;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySwordAerialSlam;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.6;
cache[? comboStats.cooldown] = 0.3;
cache[? comboStats.hitSoundType] = ds_list_create(); ds_list_add(cache[? comboStats.hitSoundType],undefined);
cache[? comboStats.hitStart] = ds_list_create(); ds_list_add(cache[? comboStats.hitStart],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.hitDuration] = ds_list_create(); ds_list_add(cache[? comboStats.hitDuration],(cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/2/**//sprite_get_number(cache[? comboStats.animation])));
cache[? comboStats.moveStart] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/1/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDuration] = (cache[? comboStats.duration]+cache[? comboStats.cooldown])*(/**/3/**//sprite_get_number(cache[? comboStats.animation]));
cache[? comboStats.moveDistX] = 18;
cache[? comboStats.moveDistY] = 0;
cache[? comboStats.damType] = ds_list_create(); ds_list_add(cache[? comboStats.damType],damageType.slash);
cache[? comboStats.damMod] = ds_list_create(); ds_list_add(cache[? comboStats.damMod],2.2);
cache[? comboStats.forMod] = ds_list_create(); ds_list_add(cache[? comboStats.forMod],4);
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearCounter;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearSpin;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearSkewer;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearVault;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearDrive;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearStab;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
		#region Drill
combo[? comboID.spear_drill] = ds_map_create();
var cache = combo[? comboID.spear_drill];
cache[? comboStats.name] = "Drill";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.groundFinisher;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearDrill;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
		#region Juggle
combo[? comboID.spear_juggle] = ds_map_create();
var cache = combo[? comboID.spear_juggle];
cache[? comboStats.name] = "Juggle";
cache[? comboStats.class] = weaponClass.spear;
cache[? comboStats.type] = weaponComboTypes.groundFinisher;
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearJuggle;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearAerialPoke;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.sound] = noone;
cache[? comboStats.desiredXDist] = -1;
cache[? comboStats.desiredYDist] = -1;
cache[? comboStats.specials] = ds_list_create(); ds_list_add(cache[? comboStats.specials],comboSpecial.none);
cache[? comboStats.animation] = sprPlayerBodySpearAerialCrash;
cache[? comboStats.frameData] = ds_list_create(); ds_list_add(cache[? comboStats.frameData],-1);
cache[? comboStats.duration] = 0.4;
cache[? comboStats.cooldown] = 0.2;
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
cache[? comboStats.effects] = ds_list_create(); ds_list_add(cache[? comboStats.effects],		noone);
		#endregion
	#endregion
#endregion
#region All Offhand Classes
offhandClass = ds_map_create();
	#region Crossbow
offhandClass[? weaponClass.crossbow] = ds_map_create();
var cache = offhandClass[? weaponClass.crossbow];
cache[? offhandStats.name] = "Crossbow";
	#endregion
	#region Grimoire
offhandClass[? weaponClass.grimoire] = ds_map_create();
var cache = offhandClass[? weaponClass.grimoire];
cache[? offhandStats.name] = "Grimoire";
	#endregion
#endregion
#region All Offhand Subtypes
subtype = ds_map_create();
	#region crossbow
		#region normal bolts
subtype[? offhandSubtypeID.crossbow_normal] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_normal];
subCache[? offhandSubtypeStats.name] = "Normal Bolts";
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 0;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.blunt;
subCache[? offhandSubtypeStats.damVal] = 1.0;
subCache[? offhandSubtypeStats.forVal] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region fire bolts
subtype[? offhandSubtypeID.crossbow_fire] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_fire];
subCache[? offhandSubtypeStats.name] = "Fire Bolts";
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 4;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.fire;
subCache[? offhandSubtypeStats.damVal] = 0.85;
subCache[? offhandSubtypeStats.forVal] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region ice bolts
subtype[? offhandSubtypeID.crossbow_ice] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_ice];
subCache[? offhandSubtypeStats.name] = "Ice Bolts";
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 5;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.ice;
subCache[? offhandSubtypeStats.damVal] = 0.85;
subCache[? offhandSubtypeStats.forVal] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region lightning bolts
subtype[? offhandSubtypeID.crossbow_lightning] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_lightning];
subCache[? offhandSubtypeStats.name] = "Lightning Bolts";
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 6;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.lightning;
subCache[? offhandSubtypeStats.damVal] = 0.85;
subCache[? offhandSubtypeStats.forVal] = 0.3;
subCache[? offhandSubtypeStats.knockback] = 3;
subCache[? offhandSubtypeStats.specType] = specialType.none;
subCache[? offhandSubtypeStats.specVal] = 0;
		#endregion
		#region serrated bolts
subtype[? offhandSubtypeID.crossbow_serrated] = ds_map_create();
var subCache = subtype[? offhandSubtypeID.crossbow_serrated];
subCache[? offhandSubtypeStats.name] = "Serrated Bolts";
subCache[? offhandSubtypeStats.ammoItem] = itemItem.crossbow_bolt;
subCache[? offhandSubtypeStats.manaCost] = 3;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.crossbow;
subCache[? offhandSubtypeStats.damType] = damageType.slash;
subCache[? offhandSubtypeStats.damVal] = 0.6;
subCache[? offhandSubtypeStats.forVal] = 0.3;
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
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 16;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.fire;
subCache[? offhandSubtypeStats.damVal] = 0.8;
subCache[? offhandSubtypeStats.forVal] = 1.2;
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
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 20;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.ice;
subCache[? offhandSubtypeStats.damVal] = 1.0;
subCache[? offhandSubtypeStats.forVal] = 1.2;
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
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 24;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.lightning;
subCache[? offhandSubtypeStats.damVal] = 1.2;
subCache[? offhandSubtypeStats.forVal] = 1.2;
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
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 32;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.dark;
subCache[? offhandSubtypeStats.damVal] = 2.0;
subCache[? offhandSubtypeStats.forVal] = 0.7;
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
subCache[? offhandSubtypeStats.ammoItem] = noone;
subCache[? offhandSubtypeStats.manaCost] = 2;
subCache[? offhandSubtypeStats.offhandType] = weaponClass.grimoire;
subCache[? offhandSubtypeStats.damType] = damageType.slash;
subCache[? offhandSubtypeStats.damVal] = 0.2;
subCache[? offhandSubtypeStats.forVal] = 0.4;
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
		#region Rope Shot
activeAbility[? activeAbilityID.crossbow_rope_shot] = ds_map_create();
var cache = activeAbility[? activeAbilityID.crossbow_rope_shot];
cache[? activeAbilityStats.name] = "Rope Shot"
cache[? activeAbilityStats.manaCost] = 0;
cache[? activeAbilityStats.offhandType] = weaponClass.crossbow;
		#endregion
		#region Shrapnel Burst
activeAbility[? activeAbilityID.crossbow_shrapnel_burst] = ds_map_create();
var cache = activeAbility[? activeAbilityID.crossbow_shrapnel_burst];
cache[? activeAbilityStats.name] = "Shrapnel Burst"
cache[? activeAbilityStats.manaCost] = 12;
cache[? activeAbilityStats.offhandType] = weaponClass.crossbow;
		#endregion
	#endregion
	#region Grimoire
		#region Reflect
activeAbility[? activeAbilityID.grimoire_reflect] = ds_map_create();
var cache = activeAbility[? activeAbilityID.grimoire_reflect];
cache[? activeAbilityStats.name] = "Reflect"
cache[? activeAbilityStats.manaCost] = 18;
cache[? activeAbilityStats.offhandType] = weaponClass.grimoire;
		#endregion
		#region Heal
activeAbility[? activeAbilityID.grimoire_heal] = ds_map_create();
var cache = activeAbility[? activeAbilityID.grimoire_heal];
cache[? activeAbilityStats.name] = "Heal"
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
	#region Specials initializers
			//Blink
		blinkRange = 16*4;
		blinkAnimationStart = spr_blink_start;
		blinkAnimationEnd = spr_blink_end;
		blinkSound = snd_blink
	#endregion
#endregion