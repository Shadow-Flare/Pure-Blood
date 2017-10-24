////on ground check
//lifeTimer++;
//phasePrev = phase;
//onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent)));
////basic ai
//scr_enemy_basicAi(1);
////react to hit, Status effect & death initializer
//scr_enemy_hitAndDamage();

//#region phases/AI
//	//base movement
//if phase != "aerialAttacked" && phase != "attack1" && phase != "attack2" && phase != "staggered" && phase != "flung" && phase != "prone" && phase != "dying" && phase != "dyingFlung" && phase != "dyingProne" && phase != "hooked"
//{
//	if target != noone
//	{
//		facing = sign(target.x-x)
//		phase = "moving"
//	}
//}

//	//moveTarget X & Y
//if nextAttack == 0
//{
//	moveTargetX = x
//	moveTargetY = y
//}
//else if nextAttack == 1
//{
//	if target != noone
//	{
//		moveTargetX = target.x-(facing*(hoverHeight));
//		moveTargetY = target.y-hoverHeight;
//	}
//	else {moveTargetX = x; moveTargetY = y;}
//}
//else if nextAttack == 2
//{
//	if target != noone
//	{
//		moveTargetX = target.x-(facing*attack2Range);
//		moveTargetY = target.y;
//	}
//	else {moveTargetX = x; moveTargetY = y;}
//}

//	//attack determiner
//if (phase == "moving" || phase == "idle") && !canAttack
//{
//	canAttackTimer++
//	if canAttackTimer == round(room_speed*1) {canAttack = 1; canAttackTimer = 0;}
//}
//if target == noone nextAttack = 0;
//if nextAttack == 0 && target != noone && canAttack
//{
//	var r = random(100);
//	if r <= 80 nextAttack = 1;
//	else if r > 80 nextAttack = 2;
//}
//if nextAttack == 1 && target != noone && (!place_free(moveTargetX,moveTargetY)||distance_to_object(target)<=128) nextAttack = 2;

//	//attack1
//if nextAttack == 1 && target != noone && phase == "moving"
//{
//	var resultingAngle = darctan((target.y-y)/abs(target.x-x))
//	var dis = distance_to_object(target)
//	if resultingAngle > 40 && resultingAngle < 50 && dis >= 600 && dis <= 622
//	{
//		canAttack = 0;
//		nextAttack = 0;
//		phase = "attack1";
//		subPhase = "pre"
//		attackTimer = 0;
//		var dur = attack1Duration*room_speed;
//		attack1InitialSpeedY = (abs(target.y-y)-(1/2*attack1Acceleration*(power(dur/2,2))))/(dur/2);
//		attack1InitialSpeedX = (target.x-x)*2/dur;
//	}
//}
//	//attack2
//if nextAttack == 2 && target != noone && phase == "moving"
//{
//	if distance_to_object(target) <= attack2Range && (target.y-64<y&&target.y+64>y)
//	{
//		canAttack = 0;
//		nextAttack = 0;
//		phase = "attack2";
//		subPhase = "attacking"
//		attackTimer = 0;
//	}
//}

////attacks1
//if phase == "attack1"
//{
//	attackTimer++;
//	if attackTimer = round(room_speed * attack1BuildUp) && subPhase == "pre"
//	{
//		subPhase = "attacking";
//		attackTimer = 0;
//		ySpd = attack1InitialSpeedY;
//		xSpd = attack1InitialSpeedX;
//		scr_enemy_attack(true,attack1Duration,0,0,10,22,1,physicalPower*1,6,20,-1,0,0); 
//	//@scr_enemy_attack(true,dur,xOff,yOff,width,height,damType,dam,stagger,knockback,statType,statValue,pierce)
//	}
//	if (attackTimer == attack1Duration*room_speed || ySpd <= -0.5*attack1InitialSpeedY) && subPhase == "attacking"
//	{
//		subPhase = "end"
//		attackTimer = 0;
//	}
//	if deflected && subPhase == "attacking"
//	{
//		phase = "staggered";
//		subPhase = "deflection";
//		xSpd = -facing*60;
//		staggerTimer = 0;
//		deflected = 0;
//		flying = 0;
//	}
//	if (attackTimer == 1.5*room_speed)&& subPhase ==  "end"
//	{
//		canAttack = 1;
//		phase = "idle";
//		subPhase = "";
//	}
//}
////attacks2
//if phase == "attack2"
//{
//	attackTimer++;
//	if attackTimer = round(room_speed*attack2Duration/2) && subPhase == "attacking"
//	{
//		scr_enemy_attack(true,0.2,16,0,16,16,1,physicalPower*1.25,6,15,-1,0,0); 
//		//@scr_enemy_attack(true,dur,xOff,yOff,width,height,damType,dam,stagger,knockback,statType,statValue,pierce)
//	}
//	if deflected && subPhase == "attacking"
//	{
//		phase = "staggered";
//		subPhase = "deflection";
//		xSpd = -facing*60;
//		staggerTimer = 0;
//		deflected = 0;
//		flying = 0;
//	}
//	if attackTimer = round(room_speed*attack2Duration) && subPhase == "attacking"
//	{
//		subPhase = "end";
//		attackTimer = 0;
//	}
//	if attackTimer == round(room_speed*attack2Cooldown) && subPhase ==  "end"
//	{
//		canAttack = 1;
//		phase = "idle";
//		subPhase = "";
//	}
//}
//#endregion

//#region react to hit OLD
////if place_meeting(x,y,obj_player_attack_parent) && !(phase == "dying" && subPhase != "flung")
////{          
////	var effNum = instance_number(obj_player_attack_parent);
////	for (var i = 0; i < effNum; i++)
////	{
////		effect = instance_find(obj_player_attack_parent,i);
////		if place_meeting(x,y,effect)
////		{
////			enemy = effect.caster;
////			if lastHit != noone
////			{
////				if lastHit == effect && !effect.hitOn lastHit = noone;
////			}
////			if effect.hitOn
////			{
////				if lastHit != effect
////				{
////					effect.hasHit = 1;
////					dirNum = sign(x-enemy.x);
////					// stats
////					if isInvulnerable == "Off" scr_hit(effect,effect.hitType,effect.hitDamage,effect.statusType,effect.statusValue,effect.caster);
////					//determine phase
////					if effect.hitStagger <= toughness reaction = "nothing";
////					else if (effect.hitStagger <= toughness*2 || effect.hitKnockback == 0) && effect.hitKnockback != -1 reaction = "stagger";
////					else reaction = "fling";
////					// effect & phase
////					image_index = 0;
////					switch reaction
////					{
////						case "nothing":
////							/* do not change phase */
////							break;
////						case "stagger":
////							if phase != "dyingFlung" && phase != "flung" && phase != "dyingProne" && phase != "prone"
////							{
////								if phase == "aerialAttacked" ySpd = -6;
////								else if !onGround && phase != "dying"
////								{
////									phase = "aerialAttacked";
////									aerialAttackedTimer = 0;
////									ySpd = -6;
////								}
////								else
////								{
////									if phase != "dying" phase = "staggered";
////									subPhase = "stagger"
////								}
////								staggerTimer = 0;
////								staggerMove = dirNum*4*8
////								attackTimer = 0;
////								attackCooldown = 0;
////							}
////							break;
////						case "fling":
////							if phase == "dying"
////							{
////								subPhase = "flung";
////								deathTimer = 0;
////							}
////							else if phase != "aerialAttacked" && effect.hitKnockback == -1
////							{
////								phase = "aerialAttacked";
////								aerialAttackedTimer = 0;
////								enemy.uppercutTarget = id;
////								reactDir = 90;
////								hitPow = 33;
////								xSpd = dirNum*hitPow*dcos(reactDir);
////								ySpd = -hitPow*dsin(reactDir);	
////							}
////							else if phase == "aerialAttacked" && effect.hitKnockback == -1
////							{
////								if phase == "aerialAttacked" ySpd = -6;
////								else
////								{
////									if phase != "dying" phase = "staggered";
////									subPhase = "stagger"
////								}
////								staggerTimer = 0;
////								staggerMove = dirNum*4*8
////								attackTimer = 0;
////								attackCooldown = 0;
////							}
////							else if effect.hitKnockback == -2
////							{
////								phase = "staggered"
////								subPhase = "flung"
////								reactDir = -45;
////								hitPow = 80;
////								xSpd = dirNum*hitPow*dcos(reactDir);
////								ySpd = -hitPow*dsin(reactDir);
////								proneTimer = 0;
////								hasLeftGround = 1;
////							}
////							else if effect.hitKnockback != -1
////							{
////								phase = "staggered"
////								subPhase = "flung"
////								reactDir = 15;
////								hitPow = effect.hitKnockback;
////								xSpd = dirNum*hitPow*dcos(reactDir);
////								ySpd = -hitPow*dsin(reactDir);
////								proneTimer = 0;
////								hasLeftGround = 0;
////							}
////							attackTimer = 0;
////							attackCooldown = 0;
////							break;
////					}
////					lastHit = effect;
////				}
////			}
////		}
////	}
////}
//#endregion

//#region //basic movement
////set phased for collision purposes
//if phase == "dying" || phase == "dyingProne" || phase == "flung" || phase == "attack1" phased = 1;
//else phased = 0;
//	#region horizontal
//if phase == "idle" 
//	{
//		xSpd -= (xSpd/10);
//	}
//else if phase == "moving"
//{
//	xSpd = (moveTargetX-x)/4;
//	var aMS = abs(dcos(point_direction(x,y,moveTargetX,moveTargetY))*moveSpeed);
//	xSpd = clamp(xSpd,-aMS,aMS);
//}
//else if phase == "attack1" 
//{
//	if subPhase == "pre"
//	{
//		xSpd-=xSpd/4
//	}
//	else if subPhase == "attacking"
//	{
//		//do nothing, coast when set in attack code
//	}
//	else if subPhase == "end"
//	{
//		xSpd -= xSpd/20
//	}
//}
//else if phase == "attack2" 
//{
//	if subPhase == "attacking"
//	{
//		xSpd = facing*moveSpeed/4;
//	}
//	else if subPhase == "end"
//	{
//		xSpd -= xSpd/4
//	}
//}
//else if phase == "dying" xSpd -= xSpd/8;
//else if phase == "staggered" || phase == "dying"
//{
//		if subPhase == "" xSpd -= xSpd/4;
//		else if subPhase == "deflection" xSpd -= xSpd/4;
//		else if subPhase == "stagger" xSpd -= xSpd/4;
//		else if subPhase == "flung" xSpd -= xSpd/60;
//		else if subPhase == "prone" xSpd -= xSpd/4;
//		else if subPhase == "recover" xSpd -= xSpd/4;
//}
//else if phase == "aerialAttacked" xSpd -= xSpd/4;
//else if phase == "hooked" {} //defined in obj_hook
//	#endregion
//	#region vertical
//if phase == "attack1" && subPhase == "attacking" ySpd += attack1Acceleration
//else if phase == "attack1" && subPhase == "end" ySpd -= ySpd/20
//else if phase == "attack2" && subPhase == "attacking" ySpd -= ySpd/2;
//else if phase == "staggered" || phase == "dying"
//{
//	if subPhase == "" ySpd += GameManager.grav
//	else if subPhase == "deflected" ySpd+=GameManager.grav/2;
//	else if subPhase == "stagger" ySpd -= ySpd/4;
//	else if subPhase == "prone" ySpd+=GameManager.grav/2;
//	else if subPhase == "flung" ySpd+=GameManager.grav/2;
//	else if subPhase == "recover" ySpd+=GameManager.grav/2
//}
//else if phase == "moving"
//{
//	ySpd = (moveTargetY-y)/4;
//	var aMS = abs(dsin(point_direction(x,y,moveTargetX,moveTargetY))*moveSpeed);
//	ySpd = clamp(ySpd,-aMS,aMS);
//}
//else if phase == "aerialAttacked"
//{
//	 if ySpd < -2 ySpd+=GameManager.grav/2;
//	 else if abs(ySpd) <= 2 ySpd  += GameManager.grav/16;
//	 else ySpd+=GameManager.grav;
//}
//else
//{
//	ySpd -= ySpd/20;
//	ySpd = clamp(ySpd,-maxVerticalSpeed/2,maxVerticalSpeed/2)
//}
//	#endregion
//#endregion

////move/collisions
//scr_move_with_collisions();

//#region determine sprite
//image_speed = 1;
//image_xscale = facing;
//image_yscale = 1;
//image_blend = c_white;
//if phase != phasePrev image_index = 0;

//if phase == "idle"{sprite_index = spr_flyingSkeleton_idle; image_speed = 8;}
//else if phase == "moving" {sprite_index = spr_flyingSkeleton_idle; image_speed = 12;}
//else if phase == "attack1" 
//{
//	if subPhase == "pre" || subPhase == "attacking"
//	{
//		sprite_index = spr_flyingSkeleton_attack1;
//		image_speed = sprite_get_number(sprite_index)/(5/8+3/2);
//	}
//	else if subPhase == "end" 
//	{
//		sprite_index = spr_flyingSkeleton_idle;
//	}
//}
//else if phase == "attack2" 
//{
//	if subPhase == "attacking"
//	{
//		sprite_index = spr_flyingSkeleton_attack2;
//		image_speed = sprite_get_number(sprite_index)/(attack2Duration);
//	}
//	else if subPhase == "end" 
//	{
//		sprite_index = spr_flyingSkeleton_idle;
//	}
//}
//else if phase == "staggered" || phase == "dying"
//{
//	if subPhase == ""
//	{
//		sprite_index = spr_flyingSkeleton_dying;
//		image_speed = sprite_get_number(sprite_index)/(deathDuration);
//		image_blend = c_gray;
//		if deathTimer >= room_speed*deathDuration
//		{
//			image_index = sprite_get_number(sprite_index)-1;
//			image_speed = 0;
//		}
//	}
//	else if subPhase == "deflected"
//	{
//		sprite_index = spr_flyingSkeleton_staggered;
//		image_speed = sprite_get_number(sprite_index)/(deflectDuration);
//	}
//	else if subPhase == "stagger"
//	{
//		sprite_index = spr_flyingSkeleton_staggered;
//		image_speed = sprite_get_number(sprite_index)/(staggerDuration);
//	}
//	else if subPhase == "flung"
//	{
//		sprite_index = spr_zombie_male_1_flung;
//	}
//	else if subPhase == "prone"
//	{
//		if phase == "staggered" {sprite_index = spr_zombie_male_1_prone; image_speed = 0;}
//		else if phase == "dying" {sprite_index = spr_zombie_male_1_dyingProne; image_blend = c_gray; image_speed = sprite_get_number(sprite_index)/(deathDuration);}
//	}
//	else if subPhase == "recover"
//	{
//		sprite_index = spr_zombie_male_1_prone;
//		image_speed = sprite_get_number(sprite_index)/(proneRecoverDuration);
//	}
//}
//else if phase == "aerialAttacked" || phase == "hooked"
//{
//	sprite_index = spr_zombie_male_1_aerialAttacked;
//	//ySpd dir code goes here when have sprite.
//}
//#endregion