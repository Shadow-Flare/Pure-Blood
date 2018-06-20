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
				
					//setup data
				hitData = ds_map_create();
				ds_map_copy(hitData,other.action1Sub2ProjDamageData);
				var hitDamagePower = stats.damagePower;
				var hitStaggerPower = stats.staggerPower;
				hitData[? damageData.stagger] *= hitStaggerPower;
				hitData[? damageData.knockback] *= hitStaggerPower;
				hitData[? damageData.slash] *= hitDamagePower;
				hitData[? damageData.pierce] *= hitDamagePower;
				hitData[? damageData.blunt] *= hitDamagePower;
				hitData[? damageData.fire] *= hitDamagePower;
				hitData[? damageData.ice] *= hitDamagePower;
				hitData[? damageData.lightning] *= hitDamagePower;
				hitData[? damageData.arcane] *= hitDamagePower;
				hitData[? damageData.light] *= hitDamagePower;
				hitData[? damageData.dark] *= hitDamagePower;
				
					//get mainType
				mainType = scr_damageCache_get_mainType(hitData);
				
				hitEffects = noone;
				
				hitSoundID = noone		//CHANGE//
				
				pierce = other.action1Sub2ProjPierce;
			}
			if action1Sub2AttackSoundID != noone audio_play_sound(action1Sub2AttackSoundID,10,0);
		}
			//transition
		if subPhaseTimer >= round(action1Sub2Duration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_actor_ground_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action1Sub2Animation,-action1Sub2Duration);
		break;
}