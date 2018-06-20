with objPlatform 
{
	solidDefault = solid;
	solid = false;
}
with obj_block_nonSolid solid = true;

if aiIdleHeight == noone
{
	var cond = true;
	var height = 0;
	while cond
	{
		if !place_free(x,y+height) || y+height > room_height+32
		{
			aiIdleHeight = height;
			cond = false;
		}
		else height += 2;
	}
}

	//kill zones
if action1ZoneID != noone && !(phase == state.action1 && subPhase == subState.actionSub2)
{
	instance_destroy(action1ZoneID);
	action1ZoneID = noone;
}
	//reset phases
phased = false;

if actionHardCooldownTimer != -1
{
	//force passive
	aggroPhase = enemyAggroState.passive;
	xTarget = x;
	yTarget = y;
}
else
{
	switch aggroPhase
	{
		case enemyAggroState.passive:
				//transition
			target = instance_nearest(x,y,objPlayer);
			if target != noone && distance_to_object(target) <= aggroRange
			{
				aggroPhase = enemyAggroState.attacking;
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
					//default aim for swoop, if cant reach swoop points or too close, do melee
			var intendedAction = 1;
			if targetDir == 0 targetDir = 1;
			xTarget = target.x-targetDir*aiSwoopStartXDist;
			yTarget = target.y-aiSwoopStartYDist;
			if point_distance(x,y,target.x,target.y) < aiMeleeAcquireRange
			{
				intendedAction = 2;
				xTarget = target.x-targetDir*aiMeleeStartXDist;
				yTarget = target.y+aiMeleeStartYDist;
			}
			else if !place_free(xTarget,yTarget)
			{
				xTarget = target.x+targetDir*aiSwoopStartXDist;
				if !place_free(xTarget,yTarget)
				{
					intendedAction = 2;
					xTarget = target.x-targetDir*aiMeleeStartXDist;
					yTarget = target.y+aiMeleeStartYDist;
				}
			}
			driveAction = 0;
			switch intendedAction
			{
				case 1:
					if point_distance(x,y,xTarget,yTarget) < aiSwoopTargetRange
					{
						driveAction = 1;
					}
					break;
				case 2:
					if point_distance(x,y,xTarget,yTarget) < aiMeleeTargetRange
					{
						driveAction = 2;
					}
					break;
			}
			break;
	}
}

with objPlatform 
{
	solid = solidDefault;
}
with obj_block_nonSolid solid = false;