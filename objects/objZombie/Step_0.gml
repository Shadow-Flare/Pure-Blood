#region passives

	//melee attack cooldown
if actionHardCooldownTimer != -1
{
	actionHardCooldownTimer++;
	if actionHardCooldownTimer >= round(actionHardCooldown*room_speed)
	{
		actionHardCooldownTimer = -1; //switch off
	}
}

#endregion

#region AI

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

if target != noone && target.y-y >= 16 dropThroughPlatforms = true;
else dropThroughPlatforms = false;

#endregion

#region State machines
	
	switch vPhase
	{
		case vState.grounded:
			var block = instance_place(x,y+1,obj_block_parent)
			if block == noone || place_meeting(x,y,block) vPhase = vState.midAir;
			break;
		case vState.midAir:
			var block = instance_place(x,y+1,obj_block_parent)
			if block != noone && !place_meeting(x,y,block) vPhase = vState.grounded;
			else ySpd += GameManager.grav;
			if ySpd > maxFallSpeed ySpd = maxFallSpeed;
			break;
		case vState.jumping:
			ySpd += GameManager.grav;
			if ySpd > maxFallSpeed ySpd = maxFallSpeed;
			if ySpd >= 0 vPhase = vState.midAir;
			break;
	}
	
	switch phase
	{
		case state.base:
			scr_enemy_base();
			break;
		case state.action1:
			scr_zombie_action1();
			break;
		case state.hitReaction:
			scr_enemy_hitReaction();
			break;
		case state.dying:
			scr_enemy_dying(0);
			break;
	}
	
#endregion

scr_hitCheck();
scr_statusCheck();
scr_move_with_collisions();

	//addional properties
image_xscale = facing;