with objPlatform 
{
	solidDefault = solid;
	solid = true;
}

switch aggroPhase
{
	case enemyAggroState.passive:
		target = instance_nearest(x,y,objPlayer);
		if target != noone && distance_to_object(target) <= aggroRange/3
		{
			aggroPhase = enemyAggroState.attacking;
		}
		else
		{
			target = instance_nearest(x,y,objServantBound);
			if target != noone && distance_to_object(target) <= aggroRange
			{
				aggroPhase = enemyAggroState.attacking;
			}
			else target = noone;
		}
		break;
	case enemyAggroState.attacking:
		if instance_exists(target)
		{
				//move / de-aggro
			if distance_to_object(target) >= aggroRange aggroPhase = enemyAggroState.passive;
			else if abs(target.x-x) >= 16 driveMove = sign(target.x-x);
			else driveMove = 0;
				//attack1
			if abs(target.x-x) <= attack1Range && abs(target.y-y) <= 32 
			{
				if target.object_index = objServantBound driveAction = 2;
				else 
				{
					var num = irandom(1);
					switch num
					{
						case 0:
							driveAction = 1;
							break;
						case 1:
							driveAction = 2;
							break;
					}
				}
			}
				//no attack
			else driveAction = 0;
		}
		else
		{
			target = noone;
			driveAction = 0;
			aggroPhase = enemyAggroState.passive
		}
			//change target?
		var tempTarget = instance_nearest(x,y,objPlayer);
		if tempTarget != noone && distance_to_object(tempTarget) <= aggroRange/4
		{
			target = tempTarget;
		}
		else
		{
			tempTarget = instance_nearest(x,y,objServantBound);
			if tempTarget != noone && distance_to_object(tempTarget) <= aggroRange
			{
				target = tempTarget;
			}
			else 
			{
				target = noone;
				aggroPhase = enemyAggroState.passive;
			}
		}
		break;
}

scr_ground_enemy_ai_basicMovementPathing();

with objPlatform 
{
	solid = solidDefault;
}