switch vPhase
{
	case vState.grounded:
		#region Grounded
			//transition
		var isGrounded = false;
		with objBlockParent
		{
			if !place_meeting(x,y,other) && place_meeting(x,y-1,other)
			{
				isGrounded = true;
				if object_is_ancestor(object_index,objPlatformParent) other.onPlatform = true;
				else other.onPlatform = false;
				break;
			}
		}
		if !isGrounded
		{
			vPhase = vState.midAir;
			onPlatform = false
		}
			//no ySpd change
		#endregion
		break;
	case vState.midAir:
		#region Airborne
			//transition
		var isGrounded = false;
		if sign(ySpd) != -1
		{
			with objBlockParent
			{
				if !place_meeting(x,y,other) && place_meeting(x,y-1,other)
				{
					isGrounded = true;
					other.vPhase = vState.grounded;
					if object_is_ancestor(object_index,objPlatformParent) other.onPlatform = true;
					else other.onPlatform = false;
					break;
				}
			}
		}
			//ySpd
		if !isGrounded ySpd += GameManager.grav;
		if ySpd > maxFallSpeed ySpd = maxFallSpeed;
		#endregion
		break;
}

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
			scr_enemy_attack(explosionFrameData,explosionFollow,explosionDuration,explosionDamageType,explosionDamage,explosionStagger,explosionKnockback,explosionStatusType,explosionStatusValue,explosionPierce,explosionAnimation,explosionHitSoundID);
			if explosionAttackSoundID != noone audio_play_sound(explosionAttackSoundID,10,0);
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