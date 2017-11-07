//kill zones
if instance_exists(action2ZoneID) && !(phase == state.action2 && subPhase == subState.actionSub1)
{
	instance_destroy(action2ZoneID);
	action2ZoneID = noone;
}

switch aggroPhase
{
	case enemyAggroState.passive:
		target = instance_nearest(x,y,objPlayer);
		if target != noone && distance_to_object(target) <= aggroRange
		{
			//phase = state.emote;
			//subPhase = subState.emote1;
			aggroPhase = enemyAggroState.attacking;
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
		break;
	case enemyAggroState.attacking:
			//move / de-aggro
		if distance_to_object(target) >= aggroRange aggroPhase = enemyAggroState.passive;
		if phase = state.action2
		{
			if action2AiTimer == 0
			{
				var targetDist = distance_to_object(target);
				var dirToTarget = sign(target.x-x);
				switch driveMove
				{
					case -1:
					case 1:
						action2AiMoveDuration = 1;
						driveMove = 0;
						break;
					case 0:
						action2AiMoveDuration = 1+random_range(-0.25,0.75);
						if targetDist >= aggroRange*(3/5) driveMove = dirToTarget;
						else if targetDist <= aggroRange*(1/5) driveMove = -dirToTarget;
						else driveMove = irandom_range(0,1);
						if driveMove == 0 driveMove = -1;
						break;
				}
			}
			action2AiTimer++;
			if action2AiTimer == round(action2AiMoveDuration*room_speed)
			{
				action2AiTimer = 0;
			}
		}
		else
		{
			if abs(target.x-x) >= 24 driveMove = sign(target.x-x);
			else driveMove = 0;
		}
			//actions
				//action 1 if close
		if driveAction != 3
		{
			if abs(target.x-x) <= attack1Range && abs(target.y-y) <= 32 driveAction = 1;
			else if phase == state.base && phaseTimer == round(actionAiDelay*room_speed)
			{
				phaseTimer = 0;
				if abs(target.y-y) <= 32 var num = irandom(1);
				else num = 2;
				switch num
				{
					case 1:			//action 2
						hasBlocked = false;
						driveAction = 2;
						break;
					case 2:			//do nothing
						driveAction = 0;
						break
				}
				//no attack
			}
			else driveAction = 0;
		}
		break;
}

if target != noone && target.y-y >= 16 dropThroughPlatforms = true;
else dropThroughPlatforms = false;