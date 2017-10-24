///@arg Angle

if PlayerStats.mp >= ComboCache.offhandSubtypeManaCosts[? PlayerStats.activeOffhandSubtypeID]
{
	PlayerStats.mp -= ComboCache.offhandSubtypeManaCosts[? PlayerStats.activeOffhandSubtypeID];
	var w = 0;
}
else var w = 1;

var SUBID = PlayerStats.activeOffhandSubtypeID;
var qD = argument0+random_range(-2,2);
var spd = crossbowBoltInitialSpeed;
var projectileXStrt = x+facing*5+(16*dcos(qD)+facing*(2*dcos(qD+90)));
var projectileYStrt = y-5-(16*dsin(qD)+facing*(2*dsin(qD+90)));

with instance_create_depth(projectileXStrt,projectileYStrt,depth,objCrossbowProjectile)
{
	wiff = w;
	caster = other;
	casterType = other.actorType; 
	subId = SUBID;
	xSpd = spd*dcos(qD);
	ySpd = -spd*dsin(qD);
	hitType = ComboCache.offhandSubtypeDamageTypes[? subId];
	hitDamage = ComboCache.offhandSubtypeDamageModifiers[? subId]*PlayerStats.physicalPower;
	hitStagger = ComboCache.offhandSubtypeStaggerModifiers[? subId]*PlayerStats.physicalStagger;
	hitKnockback = ComboCache.offhandSubtypeKnockbacks[? subId];
	statusType = ComboCache.offhandSubtypeStatusTypes[? subId];
	statusValue = ComboCache.offhandSubtypeStatusValues[? subId];
	pierce = false;
	
	hitList = ds_list_create();
}