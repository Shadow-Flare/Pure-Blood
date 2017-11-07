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
			//move / de-aggro
		if distance_to_object(target) >= aggroRange aggroPhase = enemyAggroState.passive;
			//action2
		switch actorDirection
		{
			case 0: var turnCondition = sign(target.y-y) != facing; break;
			case 1: var turnCondition = sign(target.x-x) != facing; break;
			case 2: var turnCondition = sign(y-target.y) != facing; break;
			case 3: var turnCondition = sign(x-target.x) != facing; break;
		}
		if turnCondition
		{
			driveAction = 2;
		}
		else
		{
			driveAction = 1;
			targetX = target.x;
			targetY = target.y;
		}
		break;
}

if changeFacing
{
	facing = -facing;
	changeFacing = false;
}