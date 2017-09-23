///@arg Angle
if softLockOn||hardLockOn facing = lockOnDir;

if mp >= obj_comboCache.offhandSubtypeManaCosts[obj_comboCache.activeOffhandSubtypeID]
{
	mp -= obj_comboCache.offhandSubtypeManaCosts[obj_comboCache.activeOffhandSubtypeID];
	var w = 0;
}
else var w = 1;

var SUBID = obj_comboCache.activeOffhandSubtypeID;
var qD = argument0+random_range(-2,2);
var spd = crossbowBoltInitialSpeed;
var projectileXStrt = x+facing*41+(8*8*dcos(qD));
var projectileYStrt = y-23-(8*8*dsin(qD));

with instance_create_depth(projectileXStrt,projectileYStrt,depth,obj_comboCache.offhandBaseProjectiles[obj_comboCache.activeOffhandID])
{
	wiff = w;
	caster = other;
	subId = SUBID;
	xSpd = spd*dcos(qD);
	ySpd = -spd*dsin(qD);
	hitType = obj_comboCache.offhandSubtypeDamageTypes[subId];
	hitDamage = obj_comboCache.offhandSubtypeDamageModifiers[subId]*other.physicalPower;			//CHANGE STAT DEPENDANCY?
	hitStagger = obj_comboCache.offhandSubtypeStaggerModifiers[subId];								//^^
	hitKnockback = obj_comboCache.offhandSubtypeKnockbacks[subId];
	statusType = obj_comboCache.offhandSubtypeStatusTypes[subId];
	statusValue = obj_comboCache.offhandSubtypeStatusValues[subId];
}