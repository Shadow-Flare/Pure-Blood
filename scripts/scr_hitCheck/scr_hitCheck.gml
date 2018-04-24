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
			if attack.attackType == attackTypes.melee && instance_exists(enemy) var dirNum = sign(x-enemy.x);
			else var dirNum = sign(attack.xSpd);
			if !attack.pierce && hitPhase == hitState.blocking && dirNum == -facing
			{
				hasBlocked = true;
				if instance_exists(enemy) enemy.hasDeflected = true;
				other.hasDeflected = true;
				xSpd = dirNum*max(attack.hitKnockback/2,1);
				if attack.attackType = attackTypes.melee && instance_exists(enemy) enemy.xSpd = -dirNum*2;
				instance_destroy(attack);
			}
			else if hitPhase != hitState.dodging
			{
					//stats
				if stats.isInvulnerable == false scr_hit(attack,attack.hitSoundID,attack.hitType,attack.hitDamage,attack.statusType,attack.statusValue,enemy,attack.hitEffects);
				switch attack.hitType
				{
					case damageType.slash: case damageType.blunt: case damageType.pierce: case damageType.none:
						var breakToughness = stats.physicalToughness;
						if attack.hitStagger >= 0 stats.physicalBreakHp+=attack.hitStagger;
						var breakHp = stats.physicalBreakHp;
						break;
					case damageType.fire: case damageType.ice: case damageType.lightning: case damageType.arcane: case damageType.light: case damageType.dark: case damageType.pure:
						var breakToughness = stats.magicalToughness;
						if attack.hitStagger >= 0 stats.physicalBreakHp+=attack.hitStagger;
						var breakHp = stats.magicalBreakHp;
						break;
				}
				if phase == state.hitReaction && subPhase == subState.aerialStagger breakToughness /= 2;
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
				//else if attack.hitStagger <= toughness && attack.hitStagger != -1 var reaction = 0;	//nothing
				//else if attack.hitStagger <= toughness*2 || attack.hitStagger == -1 reaction = 1;		//stagger
				//else reaction = 2;	
					//react
				switch reaction
				{
					case 0:	#region Nothing
							//effect
						create_effect(false,x+random_range(-4,4),y+random_range(-4,4),depth-1,spr_hit_blood_light,0.3,1,1);
							//do nothing
						xSpd = dirNum*max(attack.hitKnockback/2,1);
						break; #endregion
					case 1:	#region Stagger
							//effect
						create_effect(false,x+random_range(-4,4),y+random_range(-4,4),depth-1,spr_hit_blood_medium,0.3,1,1);
							//state change
						hasStaggered = true;
						if phase == state.hitReaction && subPhase == subState.aerialStagger
						{
								//reset timer
							subPhaseTimer = 0;
								//movement
							xSpd = attack.hitKnockback*dirNum;
							ySpd = -attack.hitKnockback/4;
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
						break; #endregion
					case 2: #region Flung
						hasFlung = true;
								//effect
						create_effect(false,x+random_range(-4,4),y+random_range(-4,4),depth-1,spr_hit_blood_heavy,0.3,1,1);
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
							if attack.hitKnockback <= 4
							{
								subPhaseTimer = 0;
								xSpd = attack.hitKnockback*dirNum;
								ySpd = -attack.hitKnockback/4;
							}
							else
							{
								subPhaseTimer = room_speed;
								var reactDir = -30+random_range(-5,5);
								xSpd = dirNum*attack.hitKnockback*dcos(reactDir);
								ySpd = -attack.hitKnockback*dsin(reactDir);
							}
						}
						else
						{
								//state change
							//phased = true;
							phase = state.hitReaction;
							phaseTimer = 0;
							subPhase = subState.aerialStagger;
							subPhaseTimer = room_speed;
								//movement
							var reactDir = 30+random_range(-5,5);
							xSpd = dirNum*attack.hitKnockback*dcos(reactDir);
							ySpd = -attack.hitKnockback*dsin(reactDir);
						}
						break; #endregion
					case 3: #region Uppercut
							//effect
						create_effect(false,x+random_range(-4,4),y+random_range(-4,4),depth-1,spr_hit_blood_medium,0.3,1,1);
							//state change
						phase = state.hitReaction;
						phaseTimer = 0;
						subPhase = subState.aerialStagger;
						subPhaseTimer = 0;
						hasBeenUppercut = true;
						stats.physicalBreakHp = 0;
						stats.magicalBreakHp = 0;
						//movement
						ySpd = attack.hitKnockback;
						xSpd = dirNum*1;
						break; #endregion
				}
			}
		}
	}
}