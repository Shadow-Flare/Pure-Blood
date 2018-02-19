phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//create projectile
		if subPhaseTimer == round(action1ProjCreateTime*room_speed)
		{
			with instance_create_depth(x+facing*action1ProjCreateXOffset,y+action1ProjCreateYOffset,depth,objDeathLotusProjectile)
			{
				var stats = other.statCache;
				caster = other;
				casterType = other.actorType;
				if instance_exists(other.target) 
				{
					target = other.target;
					targetX = other.target.x;
					targetY = other.target.y;
				}
				else
				{
					target = noone;
					targetX = other.targetX;
					targetY = other.targetY;
				}
				
				direction = point_direction(x,y,targetX,targetY)
				speed = other.action1ProjCreateSpeed;
				
				hitType = other.action1ProjDamageType;
				hitDamage = other.action1ProjDamage*stats.damagePower;
				hitStagger = other.action1ProjStagger*stats.staggerPower;
				hitKnockback = other.action1ProjKnockback;
				statusType = other.action1ProjStatusType;
				statusValue = other.action1ProjStatusValue;
				pierce = other.action1ProjPierce;
				hitSoundID = other.action1ProjHitSoundID;
			}
			if action1AttackSoundID != noone audio_play_sound(action1AttackSoundID,10,0);
		}
			//transition
		if subPhaseTimer >= round(action1Duration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_enemy_crawl_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action1Animation,-action1Duration);
		break;
}