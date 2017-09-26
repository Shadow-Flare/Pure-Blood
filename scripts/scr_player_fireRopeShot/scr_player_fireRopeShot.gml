///@arg Angle
///@arg speed

with instance_create_depth(x,y,depth,objRopeShot)
{
	direction = argument0;
	speed = argument1;
	caster = other;
	defaultSpeed = argument1;
	maxDist = caster.ropeShotMaxDist;
}