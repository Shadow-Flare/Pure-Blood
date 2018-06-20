with objPlatform 
{
	solidDefault = solid;
	solid = true;
}

//kill zones
	//leap midair
if instance_exists(action2Sub2ZoneID) && !(phase == state.action2 && subPhase == subState.actionSub2)
{
	instance_destroy(action2Sub2ZoneID);
	action2Sub2ZoneID = noone;
}

switch aggroPhase
{
	case enemyAggroState.passive:
		target = instance_nearest(x,y,objPlayer);
		if target != noone && distance_to_object(target) <= aggroRange
		{
			aggroPhase = enemyAggroState.attacking;
			driveAction = 5;
		}
		else target = noone;
		break;
	case enemyAggroState.attacking:
			//move / de-aggro
		if !instance_exists(target) aggroPhase = enemyAggroState.passive;
			//actions
		else
		{
			if phase == state.base && phaseTimer >= round(actionAiDelay*room_speed)
			{
				if driveAction == 0
				{
					var distance = abs(target.x-x);
						//action 1: Slam
					if distance <= action1Range && abs(target.y-y) <= 64 {driveAction = 1; numOfAction1Or3Or4++}
						//action 2: Leap, do scream(5) first
					else if distance >= action2MinRange driveAction = 5;
						//action 3/4: Fling/Puke
					else if numOfAction1Or3Or4 < action2NumOf1Or3Or4BeforeLeap
					{
						numOfAction1Or3Or4++;
						var count = 0;
						with objBloodHoundCorpse
						{
							if !hasBeenTargeted count++;
						}
						if count < action4CorpsesNeeded driveAction = 3;
						else driveAction = 4;
					}
					else driveAction = 5;
				}
			}
			else if driveMove == 0
			{
				driveMove = irandom_range(-1,1);
				if driveMove == 0 driveMove = sign(target.x-x);
			}
			if driveAction != 0 && driveAction != 1 && driveAction != 3 && driveAction != 4
			{
				numOfAction1Or3Or4 = 0;
			}
		}
		break;
}

if target != noone && target.y-y >= 16 dropThroughPlatforms = true;
else dropThroughPlatforms = false;

scr_ground_enemy_ai_basicMovementPathing();

with objPlatform 
{
	solid = solidDefault;
}