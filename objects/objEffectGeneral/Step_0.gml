lifeTimer++;

if lifeTimer >= round(duration*room_speed)
{
	instance_destroy();
}

if follow
{
	x = caster.x;
	y = caster.y;
}