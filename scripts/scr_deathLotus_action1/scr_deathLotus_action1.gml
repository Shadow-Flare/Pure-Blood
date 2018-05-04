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
					mainType = damageType.slash;
					var highest = 0;
					if hitData[? damageData.slash] > highest {mainType = damageType.slash; highest = hitData[? damageData.slash];};
					if hitData[? damageData.pierce] > highest {mainType = damageType.pierce; highest = hitData[? damageData.pierce];};
					if hitData[? damageData.blunt] > highest {mainType = damageType.blunt; highest = hitData[? damageData.blunt];};
					if hitData[? damageData.fire] > highest {mainType = damageType.fire; highest = hitData[? damageData.fire];};
					if hitData[? damageData.ice] > highest {mainType = damageType.ice; highest = hitData[? damageData.ice];};
					if hitData[? damageData.lightning] > highest {mainType = damageType.lightning; highest = hitData[? damageData.lightning];};
					if hitData[? damageData.arcane] > highest {mainType = damageType.arcane; highest = hitData[? damageData.arcane];};
					if hitData[? damageData.light] > highest {mainType = damageType.light; highest = hitData[? damageData.light];};
					if hitData[? damageData.dark] > highest {mainType = damageType.dark; highest = hitData[? damageData.dark];};
					
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
			scr_enemy_crawl_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action1Animation,-action1Duration);
		break;
}