phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//create projectile
		if subPhaseTimer == round(action1ProjCreateTime*room_speed)
		{
			#region fire enemy projectile
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

					pierce = other.action1ProjPierce;
					hitSoundID = other.action1ProjHitSoundID;
					
							//hit data
					hitData = ds_map_create();
					ds_map_copy(hitData,other.action1ProjDamageData);
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
					hitData[? damageData.pure] *= hitDamagePower;
						//main type setup
					mainType = scr_damageCache_get_mainType(hitData);
					
						//hit effects
					hitEffects = noone;
				}
			#endregion
			if action1AttackSoundID != noone audio_play_sound(action1AttackSoundID,10,0);
		}
			//transition
		if subPhaseTimer >= round(action1Duration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_actor_crawl_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action1Animation,-action1Duration);
		break;
}