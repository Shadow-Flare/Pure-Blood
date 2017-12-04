with objPlatform 
{
	solidDefault = solid;
	solid = true;
}

switch aggroPhase
{
	case enemyAggroState.passive:
		target = instance_nearest(x,y,objPlayer);
		if target != noone && distance_to_object(target) <= aggroRange
		{
			aggroPhase = enemyAggroState.attacking;
			pause = false;
		}
		else target = noone;
		break;
	case enemyAggroState.attacking:
			//move / de-aggro
		if !pause
		{
			if distance_to_object(target) >= aggroRange aggroPhase = enemyAggroState.passive;
			else if abs(target.x-x) >= 16 driveMove = sign(target.x-x);
			else driveMove = 0;
				//attack1
			if abs(target.x-x) <= attack1Range && abs(target.y-y) <= 32 
			{
				driveMove = 0;
				pause = true;
				pauseTimer = 0;
			}
				//no attack
			else driveAction = 0;
		}
		else
		{
			if phase = state.base && subPhase = subState.idle image_speed = 4;
			pauseTimer++;
			if pauseTimer >= round(action1AIDelay*room_speed)
			{
				driveAction = 1;
				pauseTimer = 0;
				pause = false;
			}
		}
		break;
}

scr_ground_enemy_ai_basicMovementPathing();

with objPlatform 
{
	solid = solidDefault;
}