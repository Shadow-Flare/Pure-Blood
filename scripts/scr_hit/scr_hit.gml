///@arg source
///@arg attackType
///@arg attackPower
///@arg specialType
///@arg specialPower
///@arg caster

var source = argument0;
var attackType = argument1;
var attackPower = argument2;
var specialType = argument3;
var specialPower = argument4;
var caster = argument5;

if attackType != -1
{
	statCache.hp -= attackPower*statCache.damageResistances[attackType];
	var mh = statCache.hpMax;
	var h = statCache.hp;
	var hpLostPC = ((mh-h)/mh)
	var partCount = hpLostPC*50
	var partSpeed = 1+hpLostPC*4
	if instance_exists(caster) var src = caster;
	else var src = source;
	scr_hit_effect(src,statCache.hitEffectType,statCache.hitEffectColour,partCount,partSpeed);
	statCache.hp = clamp(statCache.hp,0,statCache.hpMax);
}

if specialType != -1
{
	statCache.specialDamage[specialType] = clamp(statCache.specialDamage[specialType]-specialPower,0,specialHp[specialType])
}