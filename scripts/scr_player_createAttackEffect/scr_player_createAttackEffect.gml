///@arg attackID
///@arg hitNum
///@arg follow?

var attackID = argument0;
var hitNum = argument1;
var followSetting = argument2;

with instance_create_depth(x,y,depth-1,objMeleeAttackEffect)
{
	caster = other;
	casterType = other.actorType;
	pierce = 0;
	playerWeaponClass = weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type);
	//get effect properties/collisions
	attackAnimation = other.attackAnimation;
	hitAngle = ds_list_find_value(combo_get_stat(attackID,comboStats.hitAngle),hitNum);

		//STATS
		frameData = ds_list_find_value(combo_get_stat(attackID,comboStats.frameData),hitNum);
		attackDuration = ds_list_find_value(combo_get_stat(attackID,comboStats.hitDuration),hitNum);
		hitEffects = ds_list_find_value(combo_get_stat(attackID,comboStats.effects),hitNum);
			
			//hitData management
		if PlayerStats.currentWeaponIndex == 0 var cache = PlayerStats.weaponMain1DamageDetails;
		else var cache = PlayerStats.weaponMain2DamageDetails;
				//initializer
		//hitData[? damageData.stagger] = 0;		//set later
		//hitData[? damageData.knockback] = 0;		//set later
		hitData[? damageData.slash] = 0;			//set later
		hitData[? damageData.pierce] = 0;			//set later
		hitData[? damageData.blunt] = 0;			//set later
		hitData[? damageData.fire] = cache[? weaponDamageDetails.fire];
		hitData[? damageData.ice] = cache[? weaponDamageDetails.ice];
		hitData[? damageData.lightning] = cache[? weaponDamageDetails.lightning];
		hitData[? damageData.arcane] = cache[? weaponDamageDetails.arcane];
		hitData[? damageData.light] = cache[? weaponDamageDetails.light];
		hitData[? damageData.dark] = cache[? weaponDamageDetails.dark];
				//pure
		hitData[? damageData.pure] = cache[? weaponDamageDetails.pure];
				//status
		hitData[? damageData.bleed] = cache[? weaponDamageDetails.bleed];
		hitData[? damageData.poison] = cache[? weaponDamageDetails.poison];
				//stagger & knockback
		hitData[? damageData.stagger] = cache[? weaponDamageDetails.stagger] * ds_list_find_value(combo_get_stat(attackID,comboStats.forMod),hitNum);
		hitData[? damageData.knockback] = ds_list_find_value(combo_get_stat(attackID,comboStats.knockback),hitNum);
			//get main type - initializer
				//physical
		var physDam = cache[? weaponDamageDetails.physical] * ds_list_find_value(combo_get_stat(attackID,comboStats.damMod),hitNum);
		var damType = ds_list_find_value(combo_get_stat(attackID,comboStats.damType),hitNum);
		switch damType
		{
			case damageType.slash: hitData[? damageData.slash] = physDam; break;
			case damageType.pierce: hitData[? damageData.pierce] = physDam; break;
			case damageType.blunt: hitData[? damageData.blunt] = physDam; break;
		}
		
		mainType = scr_damageCache_get_mainType(hitData);
		
			//audio		
		hitSoundID = noone;
		var hitAudioType = ds_list_find_value(combo_get_stat(attackID,comboStats.hitSoundType),hitNum);
		if hitAudioType == undefined && mainType != damageType.none
		{
				//vvv this will likely need to change
			if attackType = 2 var type = 2;
			else var type = 1;
			var wholeCache = AudioCache.audioHitCache[| type];
			var subtypeCache = wholeCache[| mainType];
			var size = ds_list_size(subtypeCache);
			if size != 0
			{
				var num = irandom_range(0,size-1)
				hitSoundID = subtypeCache[| num]
			}
		}
		else if hitAudioType < 0
		{
			//add misc sounds here
			hitSoundID = noone;
		}
	
	//Set
	timer = 0;
	facing = other.facing;
	follow = followSetting;
	
	//sprite
		//get sprite
	#region if need alt, change sprite to use:
	var wepClass = weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type);
	var groundComboSize = PlayerStats.GCS[? wepClass];
	var aerialComboSize = PlayerStats.ACS[? wepClass];
	var comboType = noone
	switch other.vPhase
	{
		case vState.grounded:
			comboType = weaponClassStats.groundComboDefault;
			break;
		case vState.jumping:
		case vState.midAir:
			comboType = weaponClassStats.aerialComboDefault;
			break;
	}
	var compareID = class_get_stat(wepClass,comboType);
	if other.vPhase = vState.grounded var comboSizeToCheck = groundComboSize;
	else comboSizeToCheck = aerialComboSize;
	var animToUse = other.attackAnimation;
	if attackID == compareID && comboSizeToCheck%2 == other.attackNum%2 && other.attackNum < comboSizeToCheck
	{
		animToUse = asset_get_index(sprite_get_name(animToUse)+"Alt");
	}
	#endregion
		//change to affect string
	var effectSpriteName = string_replace(sprite_get_name(animToUse),"Body","Effect");
	if hitNum != 0
	{
		effectSpriteName += string(hitNum);
	}
		//if uppercut
	if attackID == -1 
	{
		var tmp = string_replace(effectSpriteName,"Offhand","Crossbow"); //UPDATE THIS WITH ITEM DATA LATER
		if asset_get_type(tmp) == asset_sprite effectSpriteName = tmp;
	}
		//set data
	if asset_get_type(effectSpriteName) == asset_sprite
	{
		sprite_index = asset_get_index(effectSpriteName);
		image_index = 0;
		image_alpha = 1.0;
		image_speed = sprite_get_number(sprite_index)/abs(attackDuration);
		image_xscale = facing;
	}
	else instance_destroy();
}

	//specials
#region lightning bolt
if ds_list_find_index(attackSpecials,comboSpecial.thunderbolt) != -1
{
	create_effect(false,x-4*facing,y,depth-1,spr_effect_lightning_bolt_impact,0.6,1,1);
	with instance_create_layer(x-4*facing,y,"lay_effects1",objMeleeAttackEffect)
	{
		
		boundEffect = obj_effect_modified_lightning_bolt;
		radius = 4;
		intensity = 0.7;
		
		caster = other;
		casterType = other.actorType;
		attackAnimation = other.attackAnimation;

			//STATS
		frameData = [0,2];
		attackDuration = 1;	//give lightning time to linger
		pierce = 0;

		hitData[? damageData.stagger] = 1.8 * cache[? weaponDamageDetails.stagger];
		hitData[? damageData.knockback] = 3.0 * cache[? weaponDamageDetails.stagger];	//May need tweaking
		hitData[? damageData.slash] = 0;
		hitData[? damageData.pierce] = 0;
		hitData[? damageData.blunt] = 0;
		hitData[? damageData.fire] = 0;
		hitData[? damageData.ice] = 0;
		hitData[? damageData.lightning] = cache[? weaponDamageDetails.lightning];
		hitData[? damageData.arcane] = 0;
		hitData[? damageData.light] = 0;
		hitData[? damageData.dark] = 0;
		hitData[? damageData.poison] = 0;
		hitData[? damageData.bleed] = 0;
		hitEffects = noone;
		
		mainType = scr_damageCache_get_mainType(hitData);
		
			//change all undefined to 0
		var index = ds_map_find_first(hitData);
		while (index != undefined)
		{
			if hitData[? index] == undefined hitData[? index] = 0;
			index = ds_map_find_next(hitData,index);
		}
		
		hitSoundID = noone;
			//Set
		timer = 0;
		facing = 1;
		follow = false;
		
		sprite_index = spr_effect_lightning_bolt_effect;
		image_speed = sprite_get_number(sprite_index)/abs(attackDuration);
		with objPlatformParent solid = true;
		while place_free(x,y+1) && y < room_height y++;
		with objPlatformParent solid = false;
		groundY = y;
		var size = 2;
		while place_free(x,y-size) && y-size > 0 size++;
		y -= size/2;
		image_yscale = size/2;
		image_xscale = 16/2;
		image_alpha = 0;
	}
}
#endregion
if ds_list_find_index(attackSpecials,comboSpecial.plunge) != -1
{
	phase = state.attacking;
	phaseTimer = 0;
	subPhase = subState.actionSub1;
	subPhaseTimer = 0;
	attackSpecialState = comboSpecial.plunge;
	var classType = combo_get_stat(attackID,comboStats.class);
	switch classType
	{
		case weaponClass.greatHammer:
			var newAttackID = comboID.greatHammer_plunge;
			break;
	}
	scr_player_beginAttack(newAttackID);
}

//audio
audio_play_sound(combo_get_stat(attackID,comboStats.sound),10,0);