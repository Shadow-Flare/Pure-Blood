with objAttackEffectParent
{
	var attack = id;
	var enemy = caster;
	var stats = other.statCache
	if hitOn && other != caster && is_enemy(other.actorType,casterType) && place_meeting(x,y,other) && ds_list_find_index(hitList,other) == -1
	{
		ds_list_add(hitList,other);
		enemy.lastAttackHasHit = true;
		with other
		{
			hasBeenHit = true;
			lastHitType = attack.hitType;
			if attack.attackType = attackTypes.melee && instance_exists(enemy) var dirNum = sign(x-enemy.x);
			else var dirNum = sign(x-attack.x);
			if !attack.pierce && hitPhase == hitState.blocking && dirNum == -facing
			{
				hasBlocked = true;
				if instance_exists(enemy) enemy.hasDeflected = true;
				other.hasDeflected = true;
				xSpd = dirNum*max(attack.hitKnockback/2,1);
				if attack.attackType = attackTypes.melee && instance_exists(enemy) enemy.xSpd = -dirNum*2
			}
			else if hitPhase != hitState.dodging
			{
					//stats
				if stats.isInvulnerable == false scr_hit(attack,attack.hitSoundID,attack.hitType,attack.hitDamage,attack.statusType,attack.statusValue,enemy);
					//determine reaction: Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
				switch attack.hitType
				{
					case 0: case 1: case 2:
						var breakToughness = stats.physicalToughness;
						if attack.hitStagger >= 0 stats.physicalBreakHp+=attack.hitStagger;
						var breakHp = stats.physicalBreakHp;
						break;
					case 3: case 4: case 5: case 6: case 7: case 8:
						var breakToughness = stats.magicalToughness;
						if attack.hitStagger >= 0 stats.physicalBreakHp+=attack.hitStagger;
						var breakHp = stats.magicalBreakHp;
						break;
				}
					//determine reaction
						//stagger guaranteed [1]
				if attack.hitStagger == -1 reaction = 1;
						//nothing [0]
				else if breakHp <= breakToughness reaction = 0;
				else if breakHp <= breakToughness*2 
				{
						//stagger [1]
					if sign(attack.hitKnockback) != -1 reaction = 1;
						//uppercut [3]
					else reaction = 3;
				}
				else 
				{	
						//fling [2]
					if sign(attack.hitKnockback) != -1 reaction = 2;
						//uppercut [3]
					else reaction = 3;
				}
					//old
				//if sign(attack.hitKnockback) == -1 reaction = 3;
				//else if attack.hitStagger <= toughness && attack.hitStagger != -1 var reaction = 0;		//nothing
				//else if attack.hitStagger <= toughness*2 || attack.hitStagger == -1 reaction = 1;		//stagger
				//else reaction = 2;	
				//react
				switch reaction
				{
					case 0:						//nothing
							//effect
						scr_hit_effect_sprite(round(x+random_range(-4,4)), round(y+random_range(-4,4)), sprHitEffectSprite, 0.3, random(360), 0.3, 0.3, 1);
							//do nothing
						xSpd = dirNum*max(attack.hitKnockback/2,1);
						break;
					case 1:						//stagger
						hasStaggered = true;
							//effect
						scr_hit_effect_sprite(round(x+random_range(-4,4)), round(y+random_range(-4,4)), sprHitEffectSprite, 0.3, random(360), 0.7, 0.7, 1);
						if phase == state.hitReaction && subPhase == subState.aerialStagger
						{
								//reset timer
							subPhaseTimer -= 0.4*room_speed;
							if subPhaseTimer <= 0 subPhaseTimer = 0;
								//movement
							xSpd = attack.hitKnockback*dirNum;
							ySpd = 0;
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
					case 2:							//flung
						hasFlung = true;
								//effect
						scr_hit_effect_sprite(round(x+random_range(-4,4)), round(y+random_range(-4,4)), sprHitEffectSprite, 0.3, random(360), 1, 1, 1);
								//screen shake
						if attack.casterType = actorTypes.player
						{
							scr_screen_shake(4,0.3);
						}
						if phase == state.hitReaction && subPhase == subState.aerialStagger
						{
								//state change
							//phased = true;
							subPhase = subState.aerialStagger;
							subPhaseTimer = 0;
								//movement
							var reactDir = -30+random_range(-5,5);
							xSpd = dirNum*attack.hitKnockback*dcos(reactDir);
							ySpd = -attack.hitKnockback*dsin(reactDir);
						}
						else
						{
								//state change
							//phased = true;
							phase = state.hitReaction;
							phaseTimer = 0;
							subPhase = subState.aerialStagger;
							subPhaseTimer = 0;
								//movement
							var reactDir = 35+random_range(-5,5);
							xSpd = dirNum*attack.hitKnockback*dcos(reactDir);
							ySpd = -attack.hitKnockback*dsin(reactDir);
						}
						break
					case 3:		//uppercut
							//effect
						scr_hit_effect_sprite(round(x+random_range(-4,4)), round(y+random_range(-4,4)), sprHitEffectSprite, 0.3, random(360), 0.7, 0.7, 1);
						//state change
						phase = state.hitReaction;
						phaseTimer = 0;
						subPhase = subState.aerialStagger;
						subPhaseTimer = 0;
						hasBeenUppercut = true;
						//movement
						ySpd = attack.hitKnockback;
						xSpd = dirNum*1;
						break
				}
			}
		}
	}
}