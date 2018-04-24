if !instance_exists(target) instance_destroy();

var angle = point_direction(0,0,xSpd,ySpd)
var spd = sqrt(xSpd*xSpd+ySpd*ySpd);

phaseTimer++;

switch phase
{
	case 0:			//non chase
		spd *= nonChaseSpdMod;
		spd = clamp(spd,speedMin,speedMax);
		xSpd = spd*dcos(angle);
		ySpd = -spd*dsin(angle);
		
		if phaseTimer >= round(nonChaseDuration*room_speed)
		{
			phase = 1;
			phaseTimer = 0;
		}
		break;
	case 1:			//chase
		var desiredAngle = point_direction(x,y,target.x,target.y);
		if abs(desiredAngle-angle) > 180
		{
			if sign(desiredAngle-angle) = 1 desiredAngle -= 360
			else if sign(desiredAngle-angle) = -1 desiredAngle += 360
		}
		if abs(desiredAngle-angle) > 20 spd *= 1/chaseSpdMod;
		else spd *= chaseSpdMod;
		
		var signPrev = sign(desiredAngle-angle);
		angle += signPrev*chaseAngleMod;
		if signPrev != sign(desiredAngle-angle) angle = desiredAngle;
		
		spd = clamp(spd,speedMin,speedMax);
		xSpd = spd*dcos(angle);
		ySpd = -spd*dsin(angle);
		break;
	case 2:			//inactive (for trail)
		image_alpha -= 1/(0.3*room_speed);
		
		if phaseTimer >= round(trailDuration*room_speed)
		{
			instance_destroy();
		}
		break;
}

x += xSpd
y += ySpd

	//HP Uniques
if phase != 2 && place_meeting(x,y,target)
{
	with target
	{
		statCache.hp+=2;
		statCache.hp = clamp(statCache.hp,0,statCache.hpMax);
	}
	phase = 2;
	phaseTimer = 0;
	xSpd = 0;
	ySpd = 0;
}

image_angle += imageAngleAmount*imageAngleMod;