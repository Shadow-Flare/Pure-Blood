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
else
{
	if slowdownFactor != 0
	{
		xSpd-=xSpd*slowdownFactor;
		ySpd-=ySpd*slowdownFactor;
	}
	
	x+=xSpd;
	y+=ySpd;
}
