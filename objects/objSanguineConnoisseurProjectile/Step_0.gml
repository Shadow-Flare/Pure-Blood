timer++;

switch phase
{
	case 0:
		hitOn = false
			//movement slowdown
		speed -= speed/12;
			//tracking
		if instance_exists(target)
		{
			targetX = target.x;
			targetY = target.y;
		}		
			//goto phase 1
		if timer >= round(slowMovementDuration*room_speed)
		{
			timer = 0;
			phase = 1;
			xDir = sign(targetX-x);
		}
			//alter direction
		var newDirection = point_direction(x,y,targetX,targetY);
		var difference = newDirection-direction;
		if difference >= 180 difference =- 360;
		else if difference <= -180 difference += 360;
		direction += (difference)/(turnFactor-2);
			//check if collision, if so goto phase 2
		var nextX = x+speed*dcos(direction);
		var nextY = y+speed*dsin(direction);
		if (place_meeting(nextX,nextY,objActorParent) && is_enemy(casterType,instance_place(nextX,nextY,objActorParent).actorType) && !instance_place(nextX,nextY,objActorParent).phased) || !place_free(nextX,nextY)
		{
			while (!place_meeting(x+dcos(direction),y-dsin(direction),objActorParent) || !is_enemy(casterType,instance_place(x+dcos(direction),y-dsin(direction),objActorParent).actorType))
					&& place_free(x+dcos(direction),y-dsin(direction))
			{
				x += dcos(direction);
				y -= dsin(direction);
			}
			speed = 0;
			timer = 0;
			phase = 2;
		}
		break;
	case 1:
		hitOn = false;
			//movement increment
		speed = clamp(speed+speedIncrement,0,speedMax);
			//tracking
		if instance_exists(target)
		{
			targetX = target.x;
			targetY = target.y;
		}
			//alter direction
		if xDir == sign(targetX-x)
		{
			var newDirection = point_direction(x,y,targetX,targetY);
			var difference = newDirection-direction;
			if difference >= 180 difference =- 360;
			else if difference <= -180 difference += 360;
			direction += (difference)/(turnFactor);
		}
			//check if collision, if so goto phase 2
		var nextX = x+speed*dcos(direction);
		var nextY = y-speed*dsin(direction);
		if (place_meeting(nextX,nextY,objActorParent) && !instance_place(nextX,nextY,objActorParent).phased) || !place_free(nextX,nextY)
		{
			while (!place_meeting(x+dcos(direction),y-dsin(direction),objActorParent) || !is_enemy(casterType,instance_place(x+dcos(direction),y-dsin(direction),objActorParent).actorType))
					&& place_free(x+dcos(direction),y-dsin(direction))
			{
				x += dcos(direction);
				y -= dsin(direction);
			}
			speed = 0;
			timer = 0;
			phase = 2;
		}
			//goto phase 3 after some time
		if timer >= round(20*room_speed)
		{
			speed = 0;
			timer = 0;
			phase = 2;
		}
		break;
	case 2:
		hitOn = true;
		hitAngle = direction;
		image_xscale = explodeScale;
		image_yscale = image_xscale;
		if timer >= round(explodeDuration*room_speed)
		{
			instance_destroy();
		}
		break;
}

	//maintain the X/Yspd simulators
xSpd = speed*dcos(direction);
ySpd = -speed*dsin(direction);