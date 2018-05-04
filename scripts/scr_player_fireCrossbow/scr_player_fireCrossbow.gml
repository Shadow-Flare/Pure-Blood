///@arg Angle

var mCost = subtype_get_stat(PlayerStats.currentOffhandSubtypeID, offhandSubtypeStats.manaCost)
if GameManager.thereisnospoon mCost = 0;
if PlayerStats.mp >= mCost
{
	PlayerStats.mp -= mCost;
	var w = false;
}
else var w = true;
var ammoItem = subtype_get_stat(PlayerStats.currentOffhandSubtypeID, offhandSubtypeStats.ammoItem)
if GameManager.thereisnospoon ammoItem = noone;
if ammoItem != noone
{
	var ammoItemCount = scr_player_inventory_get(itemType.item,ammoItem);
	if ammoItemCount != 0 
	{
		scr_player_inventory_manage(itemType.item,ammoItem,-1);
		var click = false;
	}
	else var click = true;
}
else var click = false;

var OFFID = PlayerStats.currentOffhandID;
var SUBID = PlayerStats.currentOffhandSubtypeID;
var qD = argument0+random_range(-2,2);
var spd = crossbowBoltInitialSpeed;
var projectileXStrt = x+facing*3+(16*dcos(qD)+facing*(2*dcos(qD+90)));
var projectileYStrt = y-6-(16*dsin(qD)+facing*(2*dsin(qD+90)));
if argument0 > 90 || argument0 < 270 projectileYStrt+=2;

if !click with instance_create_depth(projectileXStrt,projectileYStrt,depth,objCrossbowProjectile)
{
		//initial arrow variables
	wiff = w;
	caster = other;
	casterType = other.actorType; 
	offID = OFFID;
	subID = SUBID;
	if wiff subID = offhandSubtypeID.crossbow_normal;
	xSpd = spd*dcos(qD);
	ySpd = -spd*dsin(qD);
	hitSoundID = noone;			//CHANGE//
	hitEffects = subtype_get_stat(subID,offhandSubtypeStats.effect);
	pierce = false;
	
		//hitData management
	if PlayerStats.currentOffhandIndex == 0 var cache = PlayerStats.weaponOff1DamageDetails;
	else var cache = PlayerStats.weaponOff2DamageDetails;
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
	hitData[? damageData.stagger] = cache[? weaponDamageDetails.stagger] * subtype_get_stat(subID,offhandSubtypeStats.forMod);
	hitData[? damageData.knockback] = cache[? weaponDamageDetails.stagger] * subtype_get_stat(subID,offhandSubtypeStats.forMod) * 0.55;	//May need tweaking
		//get main type - initializer
	mainType = noone;
			//physical
	var physDam = cache[? weaponDamageDetails.physical] * subtype_get_stat(subID,offhandSubtypeStats.damMod);
	var damType = subtype_get_stat(subID,offhandSubtypeStats.damType);
	var highest = physDam;
	switch damType
	{
		case damageType.slash: hitData[? damageData.slash] = physDam; mainType = damageType.slash; break;
		case damageType.pierce: hitData[? damageData.pierce] = physDam; mainType = damageType.pierce; break;
		case damageType.blunt: hitData[? damageData.blunt] = physDam; mainType = damageType.blunt; break;
	}
		
		//change all undefined to 0
	var index = ds_map_find_first(hitData);
	while (index != undefined)
	{
		if hitData[? index] == undefined hitData[? index] = 0;
		index = ds_map_find_next(hitData,index);
	}
		
	if hitData[? damageData.fire] > highest {mainType = damageType.fire; highest = hitData[? damageData.fire];};
	if hitData[? damageData.ice] > highest {mainType = damageType.ice; highest = hitData[? damageData.ice];};
	if hitData[? damageData.lightning] > highest {mainType = damageType.lightning; highest = hitData[? damageData.lightning];};
	if hitData[? damageData.arcane] > highest {mainType = damageType.arcane; highest = hitData[? damageData.arcane];};
	if hitData[? damageData.light] > highest {mainType = damageType.light; highest = hitData[? damageData.light];};
	if hitData[? damageData.dark] > highest {mainType = damageType.dark; highest = hitData[? damageData.dark];};
	
		//sfx
	audio_play_sound(snd_crossbow_fire,10,0);
	
		//gfx
	with create_effect(false,x,y,depth+1,spr_radial_glow,0.3,1/sprite_get_width(spr_radial_glow),0.5/sprite_get_height(spr_radial_glow))
	{
		switch other.mainType
		{
			case damageType.slash: case damageType.pierce: case damageType.blunt:
				image_blend = c_white;
				break;
			case damageType.fire: image_blend = c_orange; break;
			case damageType.ice: image_blend = merge_colour(c_white,c_blue,0.5); break;
			case damageType.lightning: image_blend = c_yellow; break;
			case damageType.arcane: image_blend = merge_colour(c_white,c_purple,0.5); break;
			case damageType.light: image_blend = merge_colour(c_white,c_yellow,0.5); break;
			case damageType.dark: image_blend = merge_colour(c_red,c_purple,0.5); break;
		}
		
		image_angle = qD+90;
		alphaAdd = -(1/(room_speed*duration));
		xScaleGrowth = 1.2;
		yScaleGrowth = 1.2;
	}
}
else
{
	audio_play_sound(snd_crossbow_wiff,10,0);
}