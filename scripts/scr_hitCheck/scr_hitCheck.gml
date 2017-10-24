with objAttackEffectParent
{
	var attack = id;
	var enemy = caster;
	var stats = other.statCache
	if hitOn && other != caster && is_enemy(other.actorType,casterType) && place_meeting(x,y,other) && ds_list_find_index(hitList,other) == -1
	{
		ds_list_add(hitList,other);
		with other
		{
			hasBeenHit = true;
			lastHitType = attack.hitType;
			if instance_exists(enemy) var dirNum = sign(x-enemy.x);
			else var dirNum = sign(x-attack.x);
			if !attack.pierce && hitPhase == hitState.blocking && dirNum == -facing
			{
				hasDeflected = 1;
				xSpd = dirNum*max(attack.hitKnockback/2,1);
				if instance_exists(enemy) enemy.xSpd = -dirNum*2
			}
			else
			{
				//audio (make reflective of damage type and other variables and remove from attack objects)
				//audio_play_sound(snd_enemy_hit,10,0);
				//stats
				if stats.isInvulnerable == false scr_hit(attack,attack.hitType,attack.hitDamage,attack.statusType,attack.statusValue,enemy);
				//determine reaction: Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
				switch attack.hitType
				{
					case 0: case 1: case 2:
						var toughness = stats.physicalToughness;
						break;
					case 3: case 4: case 5: case 6: case 7: case 8:
						var toughness = stats.magicalToughness;
						break;
				}
				if sign(attack.hitKnockback) == -1 reaction = 3;
				else if attack.hitStagger <= toughness && attack.hitStagger != 0 var reaction = 0;		//nothing
				else if attack.hitStagger <= toughness*2 || attack.hitKnockback == 0 reaction = 1;		//stagger
				else reaction = 2;																		//fling
				//react
				switch reaction
				{
					case 0:						//nothing
						//do nothing
						xSpd = dirNum*max(attack.hitKnockback/2,1);
						break;
					case 1:						//stagger
						if phase == state.hitReaction && subPhase == subState.aerialStagger
						{
								//state change (none)
								//movement
							xSpd = attack.hitKnockback*dirNum;
							ySpd = -attack.hitKnockback;
						}
						else
						{
								//state change
							phase = state.hitReaction;
							phaseTimer = 0;
							subPhase = subState.staggered;
							subPhaseTimer = 0;
								//movement
							xSpd = attack.hitKnockback*dirNum;
						}
						break;
					case 2:						//flung
						if phase == state.hitReaction && subPhase == subState.aerialStagger
						{
								//state change (none)
								//movement
							var reactDir = -60+random_range(-5,5);
							xSpd = dirNum*attack.hitKnockback*dcos(reactDir);
							ySpd = -attack.hitKnockback*dsin(reactDir);
						}
						else
						{
								//state change
							phased = 1;
							phase = state.hitReaction;
							phaseTimer = 0;
							subPhase = subState.flung;
							subPhaseTimer = 0;
								//movement
							var reactDir = 35+random_range(-5,5);
							xSpd = dirNum*attack.hitKnockback*dcos(reactDir);
							ySpd = -attack.hitKnockback*dsin(reactDir);
						}
						break
					case 3:						//uppercut
						//state change
						phase = state.hitReaction;
						phaseTimer = 0;
						subPhase = subState.aerialStagger;
						subPhaseTimer = 0;
						//movement
						ySpd = attack.hitKnockback;
						break
				}
			}
		}
	}
}