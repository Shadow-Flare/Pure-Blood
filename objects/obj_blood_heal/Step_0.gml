lifeTime++;
if lifeTime >= normalMoveDuration*room_speed
{
	xDif = target.x - x;
	yDif = target.y - y;
	cap = 15;
	xSpd = clamp(xSpd+xDif/300,-cap,cap);
	ySpd = clamp(ySpd+yDif/300,-cap,cap);
}

x += xSpd
y += ySpd

if place_meeting(x,y,target)
{
	target.hp++;
	target.hp = clamp(target.hp,0,PlayerStats.hpmaxhpmax);
	instance_destroy();
}