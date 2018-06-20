scr_actor_ground_vStateMachine();

phaseTimer++;

switch phase
{
	case state.base:
			//target
		if vPhase = vState.grounded
		{
			if target == noone
			{
				var posTarget = noone;
				var nearestDist = -4;
				for(var i = 0; i < instance_number(objBloodHoundCorpse); i++)
				{
					with instance_find(objBloodHoundCorpse,i)
					{
						if !hasBeenTargeted && (abs(x-other.x) < nearestDist || nearestDist == -4)
						{
							posTarget = id;
						}
					}
				}
				if posTarget != noone
				{
					target = posTarget;
					target.hasBeenTargeted = true;
				}
				else
				{
					phase = state.dying
					phaseTimer = 0;
				}
			}
			else
			{
				var moveDir = sign(target.x-x);
				facing = moveDir;
				xSpd = moveDir*statCache.moveSpeed;
					//transition
				if abs(target.x-x) <= 8
				{
					phase = state.action1;
					phaseTimer = 0;
				}
			}
		}
			//sprite
		update_sprite_enemy(sprBloodHoundTickBodyIdle,1);
		break;
	case state.action1:
		if phaseTimer == round(bloatDuration*room_speed)
		{
			if instance_exists(target) instance_destroy(target);
			scr_enemy_attack(action1Data,statCache.damagePower,statCache.staggerPower);
			if action1Data[? enemyActionData.performSoundID] != noone audio_play_sound(action1Data[? enemyActionData.performSoundID],10,0);
			instance_destroy();
			phase = state.dying;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(sprBloodHoundTickBodyBloating,-bloatDuration);
		break;
	case state.dying:
		if phaseTimer == round(dyingDuration*room_speed)
		{
			instance_destroy();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(sprBloodHoundTickBodyDying,-dyingDuration);
		break;
}

	//begin dying
if phase != state.dying && statCache.hp <= 0
{
	if target != noone target.hasBeenTargeted = false;
	actorType = actorTypes.corpse;
	phase = state.dying;
	phaseTimer = 0;
}
	//hitCheck
with objAttackEffectParent
{
	if hitOn && place_meeting(x,y,other) && is_enemy(casterType,other.actorType)
	{
		var stats = other.statCache;
		stats.hp = 0;
	}
}

	//addional properties
image_xscale = facing;