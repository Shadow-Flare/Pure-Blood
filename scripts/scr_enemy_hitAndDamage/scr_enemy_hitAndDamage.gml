if (place_meeting(x,y,obj_player_attack_parent) || (blocking && place_meeting(x+facing*blockRange,y,obj_player_attack_parent))) && !(phase == "dying" && subPhase != "flung")
{          
	var effNum = instance_number(obj_player_attack_parent);
	for (var i = 0; i < effNum; i++)
	{
		effect = instance_find(obj_player_attack_parent,i);
		if place_meeting(x,y,effect) || (blocking && place_meeting(x+facing*blockRange,y,effect))
		{
			enemy = effect.caster;
			if lastHit != noone
			{
				if lastHit == effect && !effect.hitOn lastHit = noone;
			}
			if effect.hitOn
			{
				if lastHit != effect
				{
					effect.hasHit = 1;
					dirNum = sign(x-enemy.x);
					lastHit = effect;
					if blocking && dirNum == -facing && effect.type == "melee"
					{
						hasBlocked = 1;
						enemy.deflected = 1;
						xSpd = 5*dirNum;
					}
					else if dodging
					{
						hasDodged = 1;
					}
					else
					{
						// stats
						if isInvulnerable == "Off" scr_hit(effect,effect.hitType,effect.hitDamage,effect.statusType,effect.statusValue,effect.caster);
						//determine phase
						if effect.hitStagger < toughness reaction = "nothing";
						else if (effect.hitStagger < toughness*2 || effect.hitKnockback == 0) && effect.hitKnockback != -1 reaction = "stagger";
						else reaction = "fling";
						// effect & phase
						switch reaction
						{
							case "nothing":
								/* do not change phase */
								break;
							case "stagger":
								if phase != "dyingFlung" && phase != "flung" && phase != "dyingProne" && phase != "prone"
								{
									if phase == "aerialAttacked" ySpd = -6;
									else if !onGround && phase != "dying"
									{
										phase = "aerialAttacked";
										aerialAttackedTimer = 0;
										ySpd = -6;
									}
									else
									{
										if phase != "dying" phase = "staggered";
										subPhase = "stagger"
									}
									image_index = 0;
									staggerTimer = 0;
									xSpd = dirNum*effect.hitKnockback;
									attackTimer = 0;
									attackCooldown = 0;
								}
								break;
							case "fling":
								if phase == "dying"
								{
									subPhase = "flung";
									deathTimer = 0;
								}
								else if phase != "aerialAttacked" && effect.hitKnockback == -1
								{
									phase = "aerialAttacked";
									aerialAttackedTimer = 0;
									enemy.uppercutTarget = id;
									reactDir = 90;
									hitPow = 33;
									xSpd = dirNum*hitPow*dcos(reactDir);
									ySpd = -hitPow*dsin(reactDir);	
								}
								else if phase == "aerialAttacked" && effect.hitKnockback == -1
								{
									if phase == "aerialAttacked" ySpd = -6;
									else
									{
										if phase != "dying" phase = "staggered";
										subPhase = "stagger"
									}
									staggerTimer = 0;
									xSpd = dirNum*effect.hitKnockback;
									attackTimer = 0;
									attackCooldown = 0;
								}
								else if effect.hitKnockback == -2
								{
									phase = "staggered"
									subPhase = "flung"
									reactDir = -45;
									hitPow = 80;
									xSpd = dirNum*hitPow*dcos(reactDir);
									ySpd = -hitPow*dsin(reactDir);
									proneTimer = 0;
									hasLeftGround = 1;
								}
								else if effect.hitKnockback != -1
								{
									phase = "staggered"
									subPhase = "flung"
									reactDir = 15;
									hitPow = effect.hitKnockback;
									xSpd = dirNum*hitPow*dcos(reactDir);
									ySpd = -hitPow*dsin(reactDir);
									proneTimer = 0;
									hasLeftGround = 0;
								}
								attackTimer = 0;
								attackCooldown = 0;
								break;
						}
					}
				}
			}
		}
	}
}

//special effects
if statusValues[0] == statusResistances[0]
{
	scr_hit_effect_general(hitEffectType,hitEffectColour,60)
	hp -= maxHp*(60/100);
	statusValues[0] = 0;
	statusResistances[0] *= 1.2;
}
statusValues[0] -= 5/room_speed;
statusValues[0] = clamp(statusValues[0],0,100);

//dying
	//hp clamp
hp = clamp(hp,0,maxHp);

if hp <= 0 && phase != "dying"
{
	global.xp += xpGiven;
	phase = "dying";
	if subPhase != "flung" subPhase = "";
	deathTimer = 0;
}

//dying
if phase == "dying" && (subPhase == "" || subPhase == "prone")
{
	deathTimer++;
	if deathTimer >= room_speed*deathDuration
	{
		image_alpha -= 1/(room_speed*deathFadeDuration);
		if image_alpha <= 0 instance_destroy();
	}
}

//staggerTimer
if (phase == "staggered" || phase == "dying") && subPhase == "deflection"
{
	staggerTimer++;
	if staggerTimer >= room_speed*deflectDuration 
	{
		phase = "idle";
		subPhase = "";
		canAttack = 1;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "stagger"
{
	staggerTimer++;
	if staggerTimer >= room_speed*staggerDuration 
	{
		if phase != "dying" phase = "idle";
		subPhase = "";
		canAttack = 1;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "flung"
{
	proneTimer++
	if !onGround hasLeftGround = 1;
	if onGround && (proneTimer >= room_speed*0.5 || hasLeftGround)
	{
		subPhase = "prone";
		deathTimer = 0;
		proneTimer = 0;
		image_index = 0;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "prone"
{
	proneTimer++;
	if proneTimer >= room_speed*proneDuration
	{
		if phase != "dying" phase = "recover";
		proneTimer = 0;
	}
}
else if (phase == "staggered" || phase == "dying") && subPhase == "recover"
{
	proneTimer++;
	if proneTimer >= room_speed*proneRecoverDuration
	{
		if phase != "dying" phase = "idle";
		subPhase = ""
		proneTimer = 0;
		canAttack = 1;
	}
}
else if phase == "aerialAttacked"
{
	aerialAttackedTimer++;
	if onGround && aerialAttackedTimer >= 0.3*room_speed
	{
		phase = "idle";
		canAttack = 1;
	}
}