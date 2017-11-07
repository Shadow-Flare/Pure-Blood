switch aggroPhase
{
	case enemyAggroState.passive:
		target = instance_nearest(x,y,objPlayer);
		if target != noone && distance_to_object(target) <= aggroRange
		{
			aggroPhase = enemyAggroState.attacking;
		}
		else target = noone;
		break;
	case enemyAggroState.attacking:
			//ranged attack
		if driveAction == 0
		{
			if distance_to_object(target) >= attackMinRange && numOfAction1 < 3
			{
				numOfAction1++;
				driveAction = 1;
				targetX = target.x;
				targetY = target.y;
			}
				//teleport
			else 
			{
				driveAction = 2;
				numOfAction1 = 0;
			}
		}
			//de-aggro
		if distance_to_object(target) >= aggroRange 
		{
			aggroPhase = enemyAggroState.passive;
			driveAction = 0;
			numOfAction1 = 0;
		}
		break;
}