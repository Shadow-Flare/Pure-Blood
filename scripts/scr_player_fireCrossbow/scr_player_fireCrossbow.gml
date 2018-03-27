///@arg Angle

var mCost = subtype_get_stat(PlayerStats.currentOffhandSubtypeID, offhandSubtypeStats.manaCost)
if PlayerStats.mp >= mCost
{
	PlayerStats.mp -= mCost;
	var wiff = false;
}
else var wiff = true;
var ammoItem = subtype_get_stat(PlayerStats.currentOffhandSubtypeID, offhandSubtypeStats.ammoItem)
var ammoItemCount = scr_player_inventory_get(itemType.item,ammoItem);
if ammoItemCount != 0 
{
	scr_player_inventory_manage(itemType.item,ammoItem,-1);
	var click = false;
}
else var click = true

var OFFID = PlayerStats.currentOffhandID;
var SUBID = PlayerStats.currentOffhandSubtypeID;
var qD = argument0+random_range(-2,2);
var spd = crossbowBoltInitialSpeed;
var projectileXStrt = x+facing*3+(16*dcos(qD)+facing*(2*dcos(qD+90)));
var projectileYStrt = y-6-(16*dsin(qD)+facing*(2*dsin(qD+90)));
if argument0 > 90 || argument0 < 270 projectileYStrt+=2;

if !click with instance_create_depth(projectileXStrt,projectileYStrt,depth,objCrossbowProjectile)
{
	wiff = wiff;
	caster = other;
	casterType = other.actorType; 
	offID = OFFID;
	subID = SUBID;
	xSpd = spd*dcos(qD);
	ySpd = -spd*dsin(qD);
	hitSoundID = noone;			//CHANGE//
	hitType = subtype_get_stat(subID,offhandSubtypeStats.damType);
	hitDamage = subtype_get_stat(subID,offhandSubtypeStats.damVal);
	hitStagger = subtype_get_stat(subID,offhandSubtypeStats.forVal);
	hitKnockback = subtype_get_stat(subID,offhandSubtypeStats.knockback);
	statusType = subtype_get_stat(subID,offhandSubtypeStats.specType);
	statusValue = subtype_get_stat(subID,offhandSubtypeStats.specVal);
	pierce = false;
}
else
{
	//play some click audio
}