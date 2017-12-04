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
		else if abs(target.x-x) >= 16 driveMove = sign(target.x-x);
		else driveMove = 0;
			//attack1
		if abs(target.x-x) <= attack1Range && abs(target.y-y) <= 32 driveAction = 1;
			//no attack
		else driveAction = 0;
		break;
}

scr_ground_enemy_ai_basicMovementPathing();

with objPlatform 
{
	solid = solidDefault;
}