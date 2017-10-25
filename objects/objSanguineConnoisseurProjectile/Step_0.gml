timer++;

switch phase
{
	case 0:
		hitOn = false
			//movement slowdown
		speed -= speed/12;
			//goto phase 1
		if timer >= round(slowMovementDuration*room_speed)
		{
			timer = 0;
			phase = 1;
		}
			//tracking
		if instance_exists(target)
		{
			targetX = target.x;
			targetY = target.y;
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
		if place_meeting(nextX,nextY,objActorParent) || !place_free(nextX,nextY)
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
		var newDirection = point_direction(x,y,targetX,targetY);
		var difference = newDirection-direction;
		if difference >= 180 difference =- 360;
		else if difference <= -180 difference += 360;
		direction += (difference)/(turnFactor);
			//check if collision, if so goto phase 2
		var nextX = x+speed*dcos(direction);
		var nextY = y-speed*dsin(direction);
		if place_meeting(nextX,nextY,objActorParent) || !place_free(nextX,nextY)
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
		image_xscale = explodeScale;
		image_yscale = image_xscale;
		if timer >= round(explodeDuration*room_speed)
		{
			instance_destroy();
		}
		break;
}