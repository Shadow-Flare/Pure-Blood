///@arg Angle

if mp >= ComboCache.offhandSubtypeManaCosts[ComboCache.currentOffhandSubtypeID]
{
	mp -= ComboCache.offhandSubtypeManaCosts[ComboCache.currentOffhandSubtypeID];
	var w = 0;
}
else var w = 1;

var SUBID = ComboCache.currentOffhandSubtypeID;
var qD = argument0+random_range(-2,2);
var spd = crossbowBoltInitialSpeed;
var projectileXStrt = x+facing*41+(8*16*dcos(qD)+facing*(8*2.5*dcos(qD+90)));
var projectileYStrt = y-23-(8*16*dsin(qD)+facing*(8*2.5*dsin(qD+90)));

with instance_create_depth(projectileXStrt,projectileYStrt,depth,ComboCache.offhandBaseProjectiles[ComboCache.activeOffhandID])
{
	wiff = w;
	caster = other;
	subId = SUBID;
	xSpd = spd*dcos(qD);
	ySpd = -spd*dsin(qD);
	hitType = ComboCache.offhandSubtypeDamageTypes[subId];
	hitDamage = ComboCache.offhandSubtypeDamageModifiers[subId]*other.physicalPower;			//CHANGE STAT DEPENDANCY?
	hitStagger = ComboCache.offhandSubtypeStaggerModifiers[subId];								//^^
	hitKnockback = ComboCache.offhandSubtypeKnockbacks[subId];
	statusType = ComboCache.offhandSubtypeStatusTypes[subId];
	statusValue = ComboCache.offhandSubtypeStatusValues[subId];
}