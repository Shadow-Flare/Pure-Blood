lifeTimer++;
xSpd -= xSpd/16;
ySpd -= ySpd/16;

x+=xSpd;
y+=ySpd;

if lifeTimer == round(room_speed*4) && phase == "inactive" {phase = "armed"; lifeTimer = 0;}
if lifeTimer >= room_speed*60 {phase = "timer"; lifeTimer = 0;}

nearestEnemy = instance_nearest(x,y,objEnemyParent);
nearestEnemyDist = distance_to_object(nearestEnemy);

if phase == "armed"
{
	image_xscale = 8*(1+sin((lifeTimer/room_speed)*pi)/2);
	image_yscale = 8*(1+sin((lifeTimer/room_speed)*pi)/2);
	if nearestEnemyDist <= 30*8
	{
		phase = "timer";
		lifeTimer = 0;
	}
}

if phase == "timer"
{
	image_xscale = 8*(1+sin(2*(lifeTimer/room_speed)*pi)/1.5);
	image_yscale = 8*(1+sin(2*(lifeTimer/room_speed)*pi)/1.5);
	if lifeTimer >= room_speed*2.5
	{
		image_xscale = image_yscale = 30*8;
		with instance_create_depth(x,y,depth,obj_explosion_effect)
		{
			casterType = "temp";
			caster = other;
			hitOn = 1;
			hasHit = 0;
			hitType = global.offhandSubtypeDamageTypes[global.currentOffhandSubtypeID]
			hitDamage = 2 //CHANGE
			hitStagger = 0;
			hitKnockback = 0;
			statusType = -1;
			statusValue = 0;
			radius =20*8;
		}
		phase = "end";
	}
}