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
	PlayerStats.hp -= attackPower/PlayerStats.damageResistances[attackType];
	var mh = PlayerStats.hpMax;
	var h = PlayerStats.hp;
	var hpLostPC = ((mh-h)/mh)
	var partCount = hpLostPC*50
	var partSpeed = 5+hpLostPC*30
	scr_hit_effect(caster,PlayerStats.hitEffectType,PlayerStats.hitEffectColour,partCount,partSpeed);
	PlayerStats.hp = clamp(PlayerStats.hp,0,PlayerStats.hpMax);
}

if specialType != -1
{
	PlayerStats.specialDamage[specialType] = clamp(PlayerStats.specialDamage[specialType]-specialPower,0,specialHp[specialType])
}