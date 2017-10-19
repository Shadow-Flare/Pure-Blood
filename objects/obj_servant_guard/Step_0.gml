////on ground check + prevs
//phasePrev = phase;
//onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent)));
////basic ai
//scr_enemy_basicAi(0);
////react to hit, Status effect & death initializer
//scr_enemy_hitAndDamage();

//#region //phases/AI
////resets
//blocking = 0;
//dodging = 0;
	
//	//landing
//if phase  == "airborne" && onGround
//{
//	phase = "landing";
//	subPhase = "";
//	landTimer = 0;
//}

//if phase == "landing"
//{
//	landTimer++
//	if landTimer = round(room_speed*landDuration)
//	{
//		phase = "idle";
//		subPhase = "";
//	}
//}
	
////base movement
//if onGround && phase != "landing" && phase != "aerialAttacked" && phase != "attack1" && phase != "attack2" && phase != "staggered" && phase != "flung" && phase != "prone" && phase != "dying" && phase != "dyingFlung" && phase != "dyingProne" && phase != "hooked" && !attackCooldown
//{
//	if target != noone
//	{
//		facing = sign(target.x-x)
//		phase = "walking"
//	}
//	else
//	{
//		phase = "idle";	
//	}
//}
//else if !onGround && phase != "attack2" && phase != "aerialAttacked" && subPhase != "flung"
//{
//	phase = "airborne"
//	subPhase = ""
//}

//	//attack determiner
//if nextAttack == 0 && target != noone && canAttack
//{
//	var r = random(100);
//	if r <= 50 nextAttack = 1;			//slash
//	else if r > 50 nextAttack = 2;		//parry walk
//}
//if nextAttack = 2 && target != noone && distance_to_object(target) <= attack2WalkingBreakRange
//{
//	nextAttack = 1;
//}

//	//attack1
//if nextAttack == 1 && target != noone && phase != "landing" && phase != "attack1" && phase != "attack2" && phase != "aerialAttacked" && phase != "dying" && phase != "staggered" && phase != "flung" && phase != "prone" && phase != "dyingFlung" && phase != "dyingProne" && phase != "hooked"
//{
//	var aggroDist = abs(x-target.x);
//	if aggroDist <= attack1Range
//	{
//		canAttack = 0;
//		canAttackTimer = 0;
//		nextAttack = 0;
//		phase = "attack1";
//		subPhase = "attacking"
//		attackTimer = 0;
//	}
//}

//	//attack2
//if nextAttack == 2 && target != noone && phase != "landing" && phase != "attack1" && phase != "attack2" && phase != "aerialAttacked" && phase != "dying" && phase != "staggered" && phase != "flung" && phase != "prone" && phase != "dyingFlung" && phase != "dyingProne" && phase != "hooked"
//{
//	canAttack = 0;
//	canAttackTimer = 0;
//	nextAttack = 0;
//	phase = "attack2";
//	subPhase = "walking"
//	attackTimer = 0;
//	walkingXDest = target.x-facing*600 + random(200);
//	walkTimer = 0;
//}

//	//attack1
//if phase == "attack1"
//{
//	attackTimer++;
//	if attackTimer = round(room_speed*attack1Duration/2) && subPhase == "attacking"
//	{
//		scr_enemy_attack(0.4,20,-4,30,8,1,physicalPower*1,6,15,-1,0,0); 
//		xSpd = facing*attack1Move;
//		//@scr_enemy_attack(dur,xOff,yOff,width,height,damType,dam,stagger,knockback,statType,statValue,pierce)
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
//	if attackTimer = round(room_speed*attack1Duration) && subPhase == "attacking"
//	{
//		subPhase = "end";
//		attackTimer = 0;
//	}
//	if attackTimer == round(room_speed*attack1Cooldown) && subPhase ==  "end"
//	{
//		canAttack = 1;
//		canAttackTimer = 0;
//		phase = "idle";
//		subPhase = "";
//	}
//}

//	//attack2
//else if phase == "attack2"
//{
//	attackTimer++
//	if subPhase == "walking" && target != noone
//	{
//		blocking = 1;
//		facing = -sign(x-target.x);
//		if abs(x-walkingXDest) < 32 walkTimer++;
//		if walkTimer == round(room_speed*attack2WalkingPauseDuration)
//		{
//			walkingXDest = walkingXDest+sign(irandom_range(-1,1))*random_range(200,280);
//			walkTimer = 0;
//		}
//		if distance_to_object(target) <= attack2WalkingBreakRange
//		{
//			canAttack = 0;
//			nextAttack = 0;
//			phase = "attack1";
//			subPhase = "attacking"
//			attackTimer = 0;
//		}
//	}
//	if hasBlocked && subPhase == "walking"
//	{
//		hasBlocked = 0
//		subPhase = "parry"
//		attackTimer = 0;
//	}
//	if attackTimer == round(room_speed*attack2WalkingDuration) && subPhase == "walking"
//	{
//		canAttack = 0;
//		nextAttack = 0;
//		phase = "attack1";
//		subPhase = "attacking"
//		attackTimer = 0;
//	}
//	if attackTimer == round(room_speed*attack2ParryDuration) && subPhase == "parry"
//	{
//		subPhase = "attacking";
//		attackTimer = 0;
//	}
//	if attackTimer == round(room_speed*attack2Duration/2) && subPhase == "attacking"
//	{
//		scr_enemy_attack(0.2,2,2,58,16,1,physicalPower*2,6,15,-1,0,0);
//		xSpd = facing*attack2Move;
//		//@scr_enemy_attack(dur,xOff,yOff,width,height,damType,dam,stagger,knockback,statType,statValue,pierce)
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
//	if attackTimer == round(room_speed*attack2Duration) && subPhase == "attacking"
//	{
//		subPhase = "end";
//		attackTimer = 0;
//	}
//	if attackTimer == round(room_speed*attack2Cooldown) && subPhase ==  "end"
//	{
//		canAttack = 1;
//		canAttackTimer = 0;
//		phase = "idle";
//		subPhase = "";
//	}
//}
//#endregion

//#region //basic movement
////set phased for collision purposes
//if phase == "dying" || phase == "dyingProne" || phase == "flung" phased = 1;
//else phased = 0;
//	#region //Horizontal
//if onGround
//{
//	 if phase == "landing" xSpd -= (xSpd/4);
//else if phase == "idle" xSpd -= (xSpd/10);
//else if phase == "walking" xSpd = clamp(xSpd+(moveSpeed/2)*facing,-moveSpeed,moveSpeed);
//else if phase == "attack1"
//{
//	if subPhase == "attacking" xSpd -= xSpd/20;
//	else xSpd -= xSpd/4;
//}
//else if phase == "attack2"
//{
//	if subPhase == "walking"
//	{
//		walkDir = -sign(x-walkingXDest);
//		if abs(x-walkingXDest) < 32 walkDir = 0;
//		xSpd = walkDir*moveSpeed/2;
//	}
//	else if subPhase == "attacking" xSpd -= xSpd/20;
//	else xSpd -= xSpd/4;
//}
//else if phase == "dying" xSpd -= xSpd/8;
//else if phase == "staggered" || phase == "dying"
//	{
//		if subPhase == "" xSpd -= xSpd/4;
//		else if subPhase == "deflection" xSpd -= xSpd/4
//		else if subPhase == "stagger" xSpd -= xSpd/4
//		else if subPhase == "flung" xSpd -= xSpd/60;
//		else if subPhase == "prone" xSpd -= xSpd/4;
//		else if subPhase == "recover" xSpd -= xSpd/4;
//	}
//else if phase == "aerialAttacked" xSpd -= xSpd/4;
//else if phase == "hooked" {} //defined in obj_hook
//}
//else
//{
//	//if phase == "flung" xSpd -= xSpd/60;
//	xSpd -= xSpd/20;
//}

//#endregion
//	#region //vertical
//if (phase == "stagger" || phase == "dying") && subPhase == "flung" ySpd+=GameManager.grav/2;
//else if phase == "aerialAttacked"
//{
//	 if ySpd < -2 ySpd+=GameManager.grav/2;
//	 else if abs(ySpd) <= 2 ySpd  += GameManager.grav/16;
//	 else ySpd+=GameManager.grav;
//}
//else ySpd+=GameManager.grav;

//#endregion
//#endregion

////move/collisions
//scr_move_with_collisions();

//#region //determine sprite
//image_speed = 1;
//image_xscale = facing;
//image_yscale = 1;
//image_blend = c_white;
//if phase != phasePrev image_index = 0;

//if phase == "landing" sprite_index = spr_servant_guard_landing;
//else if phase == "idle"	sprite_index = spr_servant_guard_idle;
//else if phase == "walking" sprite_index = spr_servant_guard_walk;
//else if phase == "attack1" 
//{
//	if subPhase == "attacking" {sprite_index = spr_servant_guard_attack1; image_speed = sprite_get_number(sprite_index)/(attack1Duration);}
//	else if subPhase == "end" {sprite_index = spr_servant_guard_idle;}
//}
//else if phase == "attack2" 
//{
//	if subPhase == "walking" sprite_index = spr_servant_guard_parryWalk;
//	else if subPhase == "parry" sprite_index = spr_servant_guard_parry;
//	else if subPhase == "attacking" {sprite_index = spr_servant_guard_attack2; image_speed = sprite_get_number(sprite_index)/(attack2Duration); phased = 1;}
//	else if subPhase == "end" {sprite_index = spr_servant_guard_idle;}
//}
//else if phase == "staggered" || phase == "dying"
//{
//	if subPhase == ""
//	{
//		sprite_index = spr_servant_guard_dying;
//		image_speed = sprite_get_number(sprite_index)/(deathDuration);
//		image_blend = c_gray;
//		if deathTimer >= room_speed*deathDuration
//		{
//			image_index = sprite_get_number(sprite_index)-1;
//			image_speed = 0;
//		}
//	}
//	else if subPhase == "deflection"
//	{
//		sprite_index = spr_servant_guard_deflect;
//		image_speed = sprite_get_number(sprite_index)/(deflectDuration);
//	}
//	else if subPhase == "stagger"
//	{
//		sprite_index = spr_servant_guard_staggered;
//		image_speed = sprite_get_number(sprite_index)/(staggerDuration);
//	}
//	else if subPhase == "flung"
//	{
//		sprite_index = spr_servant_guard_flung;
//	}
//	else if subPhase == "prone"
//	{
//		if phase == "staggered" {sprite_index = spr_servant_guard_prone; image_speed = 0;}
//		else if phase == "dying" {sprite_index = spr_servant_guard_dyingProne; image_blend = c_gray; image_speed = sprite_get_number(sprite_index)/(deathDuration);}
//	}
//	else if subPhase == "recover"
//	{
//		sprite_index = spr_servant_guard_prone;
//		image_speed = sprite_get_number(sprite_index)/(proneDuration);
//	}
//}
//else if phase == "aerialAttacked" || phase == "hooked"
//{
//	sprite_index = spr_servant_guard_aerialAttacked;
//	//ySpd dir code goes here when have sprite.
//}
//#endregion