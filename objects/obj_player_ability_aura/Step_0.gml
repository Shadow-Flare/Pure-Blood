lifeTimer++;

if lifeTimer >= room_speed*12
{
	radius += (0-radius)/16;
}
else
{
	radius += (maxRadius-radius)/16;
	if radius <= 4 instance_destroy();
}
image_xscale = 2*radius/initialWidth;
image_yscale = 2*radius/initialWidth;

x = caster.x;
y = caster.y;

if !hitOn hitTimer++;
if !hitOn && hitTimer >= round(room_speed*0.25) hitOn = 1;

with objEnemyParent
{
	if place_meeting(x,y,other)
	{
		if other.hitOn
		{
			enemy = other.caster;
			other.hitOn = 0;
			other.hitTimer = 0;
			scr_hit(other,other.hitType,other.hitDamage,other.statusType,other.statusValue,other.caster)
			image_blend = c_orange;
		}
	}
}