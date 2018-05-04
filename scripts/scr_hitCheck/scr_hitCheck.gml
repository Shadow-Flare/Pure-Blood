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
			//lastHitType = attack.hitType;	//need editing
			if attack.attackType == attackTypes.melee && instance_exists(enemy) var dirNum = sign(x-enemy.x);
			else var dirNum = sign(attack.xSpd);
			if !attack.pierce && hitPhase == hitState.blocking && dirNum == -facing
			{
				hasBlocked = true;
				if instance_exists(enemy) enemy.hasDeflected = true;
				other.hasDeflected = true;
				xSpd = dirNum*max(knockback/2,1);
				if attack.attackType = attackTypes.melee && instance_exists(enemy) enemy.xSpd = -dirNum*2;
				instance_destroy(attack);
			}
			else if hitPhase != hitState.dodging
			{
				var stagger = attack.hitData[? damageData.stagger];
				var knockback = attack.hitData[? damageData.knockback];
					//stats
				if stats.isInvulnerable == false scr_hit(attack,attack.hitSoundID,attack.hitData,enemy,attack.hitEffects);

				var breakToughness = stats.toughness;
				if stagger >= 0 stats.breakHp +=stagger;
				var bHp = stats.breakHp;
				
				var hasUppercut = false;
				if attack.hitEffects != noone && attack.hitEffects != undefined && attack.hitEffects[? hitEffect.uppercut] == true hasUppercut = true;
				if phase == state.hitReaction && subPhase == subState.aerialStagger breakToughness /= 2;
					//determine reaction
						//stagger guaranteed [1]
				if stagger == -1 reaction = 1;
						//nothing [0]
				else if bHp <= breakToughness reaction = 0;
						//stagger [1]
				else if bHp <= breakToughness*4 reaction = 1;
						//fling [2]
				else reaction = 2;
						//uppercut [3]
				if hasUppercut && (reaction == 1 || reaction == 2) reaction = 3;
				
				#region get blood blend
				var blend;
				switch statCache.hitEffectColour
				{
					case "dark red":
						blend = make_colour_rgb(220,0,0);
						break;
				}
				#endregion
				#region get blood sprite array
				var bloodSpr = [noone,noone,noone];
				switch attack.mainType
				{
					case damageType.slash:
						bloodSpr = [spr_hit_slash_light,spr_hit_slash_medium,spr_hit_slash_heavy];
						break;
					case damageType.pierce:
						bloodSpr = [spr_hit_pierce_light,spr_hit_pierce_medium,spr_hit_pierce_heavy];
						break;
					case damageType.blunt:
						bloodSpr = [spr_hit_blunt_light,spr_hit_blunt_medium,spr_hit_blunt_heavy];
						break;
				}
				#endregion
				
					//react
				switch reaction
				{
					case 0:	#region Nothing
							//effect
						with create_effect(false,x+random_range(-4,4),y+random_range(-4,4),min(depth,enemy.depth)-1,bloodSpr[0],0.28,1,1) image_blend = blend;
							//do nothing
						xSpd = dirNum*max(knockback/2,1);
						break; #endregion
					case 1:	#region Stagger
							//effect
						with create_effect(false,x+random_range(-4,4),y+random_range(-4,4),min(depth,enemy.depth)-1,bloodSpr[1],0.28,1,1) image_blend = blend;
							//state change
						hasStaggered = true;
						if phase == state.hitReaction && subPhase == subState.aerialStagger
						{
								//reset timer
							subPhaseTimer = 0;
								//movement
							xSpd = knockback*dirNum;
							ySpd = -knockback/4;
						}
						else
						{
								//state change
							phase = state.hitReaction;
							phaseTimer = 0;
							subPhase = subState.staggered;
							subPhaseTimer = 0;
								//movement
							xSpd = knockback*dirNum;
						}
						break; #endregion
					case 2: #region Flung
						hasFlung = true;
								//effect
						with create_effect(false,x+random_range(-4,4),y+random_range(-4,4),min(depth,enemy.depth)-1,bloodSpr[2],0.28,1,1) image_blend = blend;
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
							if knockback <= 4
							{
								subPhaseTimer = 0;
								xSpd = knockback*dirNum;
								ySpd = -knockback/4;
							}
							else
							{
								subPhaseTimer = room_speed;
								var reactDir = -30+random_range(-5,5);
								xSpd = dirNum*knockback*dcos(reactDir);
								ySpd = -knockback*dsin(reactDir);
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
							xSpd = dirNum*knockback*dcos(reactDir);
							ySpd = -knockback*dsin(reactDir);
						}
						break; #endregion
					case 3: #region Uppercut
							//effect
						with create_effect(false,x+random_range(-4,4),y+random_range(-4,4),min(depth,enemy.depth)-1,bloodSpr[1],0.28,1,1) image_blend = blend
							//state change
						phase = state.hitReaction;
						phaseTimer = 0;
						subPhase = subState.aerialStagger;
						subPhaseTimer = 0;
						hasBeenUppercut = true;
						stats.breakHp = 0;
						//movement
						ySpd = knockback;
						xSpd = dirNum*1;
						break; #endregion
				}
			}
		}
	}
}