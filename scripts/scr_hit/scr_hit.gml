///@arg source
///@arg attackType
///@arg attackPower
///@arg specType
///@arg specPower
///@arg caster

var source = argument0;
var audioID = argument1;
var attackType = argument2;
var attackPower = argument3;
var specType = argument4;
var specPower = argument5;
var caster = argument6;

if attackType != damageType.none
{
		//audio
	if audioID != noone audio_play_sound(audioID,10,0)
		//damage
	var mh = statCache.hpMax;
	var ph = statCache.hp;
	switch attackType
	{
		case damageType.slash: case damageType.blunt: case damageType.pierce:
				//physical reduc
			statCache.hp -= attackPower-statCache.damageResistances[attackType];
			break;
		case damageType.fire: case damageType.ice: case damageType.lightning: case damageType.arcane: case damageType.dark: case damageType.light: case damageType.pure:
				//magical reduc
			statCache.hp -= attackPower*statCache.damageResistances[attackType];
			break;
	}
	var hpLostRatio = ((ph-statCache.hp)/mh)
	var partCount = hpLostRatio*(100*0.50)
	var partSpeed = 1+hpLostRatio*(100*0.04)
	if instance_exists(caster) var src = caster;
	else var src = source;
		//blood pixels
	scr_hit_effect_blood(src,statCache.hitEffectType,statCache.hitEffectColour,partCount,partSpeed);
		//Flash
	with instance_create_layer(x,y,"lay_lights",objLightHitFlash)
	{
		duration = 0.1;
		colour = make_color_rgb(255,150,150);
	}
		//roundup hp
	statCache.hp = clamp(statCache.hp,0,statCache.hpMax);
}

if specType != specialType.none
{
	statCache.specialDamages[specType] += specPower;
}