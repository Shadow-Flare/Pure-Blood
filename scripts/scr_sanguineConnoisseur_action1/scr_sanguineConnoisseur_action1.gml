phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//transition
		if subPhaseTimer >= round(action1Sub1Duration*room_speed)
		{
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action1Sub1Animation,-action1Sub1Duration);
		break;
	case subState.actionSub2:
			//create projectile
		if subPhaseTimer == round(action1Sub2ProjCreateTime*room_speed)
		{
			with instance_create_depth(x+facing*action1Sub2ProjCreateXOffset,y+action1Sub2ProjCreateYOffset,depth,objSanguineConnoisseurProjectile)
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
				other.targetX = -4;
				other.targetY = -4;
				
				direction = 90-other.facing*90;
				speed = other.action1Sub2ProjCreateSpeed;
				hitType = other.action1Sub2ProjDamageType;
				hitDamage = other.action1Sub2ProjDamage*stats.damagePower;
				hitStagger = other.action1Sub2ProjStagger*stats.staggerPower;
				hitKnockback = other.action1Sub2ProjKnockback;
				hitSoundID = noone		//CHANGE//

				statusType = other.action1Sub2ProjStatusType;
				statusValue = other.action1Sub2ProjStatusValue;
				pierce = other.action1Sub2ProjPierce;
				
				hitList = ds_list_create();
			}
			if action1Sub2AttackSoundID != noone audio_play_sound(action1Sub2AttackSoundID,10,0);
		}
			//transition
		if subPhaseTimer >= round(action1Sub2Duration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_enemy_ground_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action1Sub2Animation,-action1Sub2Duration);
		break;
}