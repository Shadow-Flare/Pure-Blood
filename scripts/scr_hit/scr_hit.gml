///@arg source
///@arg attackType
///@arg attackPower
///@arg specialType
///@arg specialPower
///@arg caster

var source = argument0;
var audioID = argument1;
var attackType = argument2;
var attackPower = argument3;
var specialType = argument4;
var specialPower = argument5;
var caster = argument6;

if attackType != -1
{
		//audio
	if audioID != noone audio_play_sound(audioID,10,0)
		//damage
	var mh = statCache.hpMax;
	var ph = statCache.hp;
	statCache.hp -= attackPower*statCache.damageResistances[attackType];
	var hpLostRatio = ((ph-statCache.hp)/mh)
	var partCount = hpLostRatio*(100*0.50)
	var partSpeed = 1+hpLostRatio*(100*0.04)
	if instance_exists(caster) var src = caster;
	else var src = source;
	scr_hit_effect(src,statCache.hitEffectType,statCache.hitEffectColour,partCount,partSpeed);
	statCache.hp = clamp(statCache.hp,0,statCache.hpMax);
}

if specialType != -1
{
	statCache.specialDamage[specialType] = clamp(statCache.specialDamage[specialType]-specialPower,0,statCache.specialResistances[specialType])
}