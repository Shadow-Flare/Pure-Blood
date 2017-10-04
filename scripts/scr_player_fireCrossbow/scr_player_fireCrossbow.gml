///@arg Angle

if PlayerStats.mp >= ComboCache.offhandSubtypeManaCosts[ComboCache.activeOffhandSubtypeID]
{
	PlayerStats.mp -= ComboCache.offhandSubtypeManaCosts[ComboCache.activeOffhandSubtypeID];
	var w = 0;
}
else var w = 1;

var SUBID = ComboCache.activeOffhandSubtypeID;
var qD = argument0+random_range(-2,2);
var spd = crossbowBoltInitialSpeed;
var projectileXStrt = x+facing*5+(16*dcos(qD)+facing*(2.5*dcos(qD+90)));
var projectileYStrt = y-5-(16*dsin(qD)+facing*(2.5*dsin(qD+90)));

with instance_create_depth(projectileXStrt,projectileYStrt,depth,ComboCache.offhandBaseProjectiles[ComboCache.activeOffhandID])
{
	wiff = w;
	caster = other;
	subId = SUBID;
	xSpd = spd*dcos(qD);
	ySpd = -spd*dsin(qD);
	hitType = ComboCache.offhandSubtypeDamageTypes[subId];
	hitDamage = ComboCache.offhandSubtypeDamageModifiers[subId]*PlayerStats.physicalPower;			//CHANGE STAT DEPENDANCY?
	hitStagger = ComboCache.offhandSubtypeStaggerModifiers[subId];								//^^
	hitKnockback = ComboCache.offhandSubtypeKnockbacks[subId];
	statusType = ComboCache.offhandSubtypeStatusTypes[subId];
	statusValue = ComboCache.offhandSubtypeStatusValues[subId];
}