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
	hp -= attackPower/damageResistances[attackType];
	var mh = hpMax;
	var h = hp;
	var hpLostPC = ((mh-h)/mh)
	var partCount = hpLostPC*50
	var partSpeed = 0.8+hpLostPC*4
	scr_hit_effect(caster,hitEffectType,hitEffectColour,partCount,partSpeed);
	hp = clamp(hp,0,hpMax);
}

if specialType != -1
{
	specialDamage[specialType] = clamp(specialDamage[specialType]-specialPower,0,specialHp[specialType])
}