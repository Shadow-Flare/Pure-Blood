///@arg Angle
///@arg speed
var angle = argument0;
var spd = argument1;

with instance_create_depth(x,y,depth,objRopeShot)
{
	var ropeShotIndex = id;
	direction = angle;
	speed = spd;
	caster = other;
	defaultSpeed = speed;
	maxDist = caster.ropeShotMaxDist;
}
return ropeShotIndex;