timer++;

switch phase
{
	case 0:
			//movement cap
		if speed > 2 speed = 2;
			//goto phase 1
		if timer >= round(normalMovementDuration*room_speed)
		{
				//movement increment
			gravity_direction = 270;
			gravity = gravitySpeed;
		}
			//check if collision
		var nextX = x+speed*dcos(direction);
		var nextY = y+speed*dsin(direction);
		if !place_free(nextX,nextY) || hasDeflected
		{
			while place_free(x+dcos(direction),y-dsin(direction))
			{
				x += dcos(direction);
				y -= dsin(direction);
			}
			speed = 0;
			instance_destroy();
		}
		break;
}

	//vv simulated vv
xSpd = speed*dsin(direction);
ySpd = -speed*dcos(direction);

hitAngle = direction;