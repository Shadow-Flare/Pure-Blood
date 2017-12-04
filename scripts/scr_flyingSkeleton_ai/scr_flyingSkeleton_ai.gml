with objPlatform 
{
	solidDefault = solid;
	solid = true;
}

switch aggroPhase
{
	case enemyAggroState.passive:
			//transition
		target = instance_nearest(x,y,objPlayer);
		if target != noone && distance_to_object(target) <= aggroRange
		{
			//aggroPhase = enemyAggroState.attacking;
		}
		else target = noone;
			//height target determiner
				//oscillation
		aiOscillateTimer++;
		var oscillation = aiOscillateDistance*sin(aiOscillateTimer/(pi*2*6));
				//height
		var height = 0;
		while place_free(x,y+height+1) && y+height <= room_height height++;
		if y+height = room_height+1 yTarget = y+height-aiIdleHeight*2+oscillation;
		else yTarget = round(y)+height-aiIdleHeight+oscillation
			//horizontal target determiner
		if point_distance(x,y,xTarget,yTarget) <= 8 aiMovementTimer++
		if aiMovementTimer >= round(room_speed*aiMovementDuration)
		{
			xTarget = x + irandom_range(-1,1) * (aiWanderDistance + random_range(-6,6));
			aiMovementTimer = 0;
		}
		break;
	case enemyAggroState.attacking:
			//move / de-aggro
		if distance_to_object(target) >= aggroRange aggroPhase = enemyAggroState.passive;
		var targetDir = sign(target.x-x);
		if targetDir == 0 targetDir = 1;
		xTarget = target.x-targetDir*aiSwoopStartXDist;
		yTarget = target.y-aiSwoopStartYDist;
		if place_free(xTarget,yTarget)
		break;
}

with objPlatform 
{
	solid = solidDefault;
}