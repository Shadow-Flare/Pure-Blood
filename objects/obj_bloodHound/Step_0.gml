////on ground check
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
	
//	//base movement
//if onGround && phase != "landing" && (phase == "idle" || phase == "walking")
//{
//	if target != noone
//	{
//		facing = sign(target.x-x)
//		phase = "walking"
//	}
//	else
//	{
//		target = noone;
//		phase = "idle";	
//	}
//}
//else if phase != "attack3" && phase != "attack4" && !onGround && phase != "aerialAttacked" && subPhase != "flung"
//{
//	phase = "airborne"
//	subPhase = ""
//}

//	//attack determiner
//if (phase == "walking" || phase == "idle") && !canAttack
//{
//	canAttackTimer++
//	if canAttackTimer == round(room_speed*1) {canAttack = 1; canAttackTimer = 0;}
//}
//		//count untargeted corpses
//var aiCorpseCount = 0;
//with obj_corpse
//{
//	if !isTargeted aiCorpseCount++;
//}
//if nextAttack == 3 && abs(target.x-x) >= 640 && abs(target.y-y) <= 320 nextAttack = 0;
//if nextAttack == 0 && target != noone && canAttack
//{
//	if abs(target.x-x) <= 640 && abs(target.y-y) <= 320
//	{
//		if attack3Count < 3
//		{
//			nextAttack = 3;
//			attack3Count++;
//		}
//		else
//		{
//			nextAttack = noone;
//		}
//	}
//	else
//	{
//		var r = random(100);
//		if r <= 50 nextAttack = 4;
//		else if r <= 100
//		{
//			nextAttack = noone;
//		}
//	}
//	if nextAttack != 3 attack3Count = 0;
//}

//	#region misc1: Scream
//if nextAttack == noone && target != noone && (phase == "idle" || phase == "walking")
//{
//	canAttack = 0;
//	if aiCorpseCount < 2 nextAttack = 1;
//	else nextAttack = 2;
//	phase = "scream";
//	subPhase = ""
//	attackTimer = 0;
//}

//	//perform attack3
//if phase == "scream"
//{
//	attackTimer++;
//	if attackTimer = round(room_speed*screamDuration)
//	{
//		canAttack = 0;
//		canAttackTimer = 0;
//		phase = "idle";
//		subPhase = "";
//	}
//}
//	#endregion
	
//	#region attack1: Fling corpses
//if nextAttack == 1 && target != noone && (phase == "idle" || phase == "walking")
//{
//	canAttack = 0;
//	nextAttack = 0;
//	phase = "attack1";
//	subPhase = "attacking"
//	attackTimer = 0;
//}
//	//perform attack1
//if phase == "attack1"
//{
//	attackTimer++;
//	if attackTimer = round(room_speed*attack1Duration*(9/sprite_get_number(sprite_index))) && subPhase == "attacking"
//	{
//		scr_enemy_attack(true,0.4,16,12,30,20,0,physicalPower*0.5,6,15,-1,0,0); 
//		xSpd = facing*attack1Move;
//		var corpseNum = 3;
//		repeat(corpseNum)
//		{
//			with instance_create_layer(x+12*8*facing,y+12*8,layer_get_id("lay_entities"),obj_corpse)
//			{
//				damage = 4;
//				stagger = 5;
//				var spd = random_range(20,60);
//				var ang = random_range(30,60);
//				if other.facing == -1 ang = 180-ang;
//				facing = irandom(1);
//				if facing == 0 facing = -1;
//				xSpd = dcos(ang)*spd;
//				ySpd = -dsin(ang)*spd;
//			}
//		}
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
//		canAttack = 0;
//		canAttackTimer = 0;
//		phase = "idle";
//		subPhase = "";
//	}
//}
//	#endregion
//	#region attack2: Puke Ticks
//if nextAttack == 2 && target != noone && (phase == "idle" || phase == "walking")
//{
//	canAttack = 0;
//	nextAttack = 0;
//	phase = "attack2";
//	subPhase = "attacking"
//	attackTimer = 0;
//}
//	//perform attack2
//if phase == "attack2"
//{
//	attackTimer++;
//	if attackTimer = round(room_speed*attack2Duration/2) && subPhase == "attacking"
//	{
//		var corpseCount = 0;
//		with obj_corpse 
//		{
//			if !isTargeted corpseCount++;
//		}
//		var tickNum = clamp(corpseCount,1,6);
//		repeat(tickNum)
//		{
//			with instance_create_layer(x+12*8*facing,y-20*8,layer_get_id("lay_entities"),obj_tick)
//			{
//				var spd = random_range(16,24);
//				var ang = random_range(40,55);
//				if other.facing == -1 ang = 180-ang;
//				facing = irandom(1);
//				if facing == 0 facing = -1;
//				xSpd = dcos(ang)*spd;
//				ySpd = -dsin(ang)*spd;
//			}
//		}
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
//		canAttack = 0;
//		canAttackTimer = 0;
//		phase = "idle";
//		subPhase = "";
//	}
//}	
//	#endregion
//	#region attack3: Slam
//if nextAttack == 3 && target != noone && (phase == "idle" || phase == "walking")
//{
//	var aggroDist = abs(x-target.x);
//	if aggroDist <= attack3Range
//	{
//		canAttack = 0;
//		nextAttack = 0;
//		phase = "attack3";
//		subPhase = "attacking"
//		attackTimer = 0;
//	}
//}

//	//perform attack3
//if phase == "attack3"
//{
//	attackTimer++;
//	if attackTimer = round(room_speed*attack3Duration*(6/sprite_get_number(sprite_index))) && subPhase == "attacking"
//	{
//		xSpd = facing*attack3Move;
//	}
//	if attackTimer = round(room_speed*attack3Duration*(7/sprite_get_number(sprite_index))) && subPhase == "attacking"
//	{
//		scr_enemy_attack(true,0.4,20,8,22,40,0,physicalPower*1.3,12,80,-1,0,1); 
//	}
//	//CANT BE DEFLECTED
//	//if deflected && subPhase == "attacking"
//	//{
//	//	phase = "staggered";
//	//	subPhase = "deflection";
//	//	xSpd = -facing*60;
//	//	staggerTimer = 0;
//	//	deflected = 0;
//	//	flying = 0;
//	//}
//	if attackTimer = round(room_speed*attack3Duration) && subPhase == "attacking"
//	{
//		subPhase = "end";
//		attackTimer = 0;
//	}
//	if attackTimer == round(room_speed*attack3Cooldown) && subPhase ==  "end"
//	{
//		canAttack = 0;
//		canAttackTimer = 0;
//		phase = "idle";
//		subPhase = "";
//	}
//}
//	#endregion
//	#region attack4: Leap
//if nextAttack == 4 && target != noone && (phase == "idle" || phase == "walking")
//{
//	canAttack = 0;
//	nextAttack = 0;
//	phase = "attack4";
//	subPhase = "pre"
//	attackTimer = 0;
//}

//	//perform attack4
//if phase == "attack4"
//{
//	attackTimer++;
//	if attackTimer == round(room_speed*attack4PreDuration) && subPhase == "pre"
//	{
//		scr_enemy_attack(true,999,0,0,40,36,1,physicalPower*0.6,6,15,-1,0,0); 
//		xSpd = facing*attack3Move;
//		//@scr_enemy_attack(true,dur,xOff,yOff,width,height,damType,dam,stagger,knockback,statType,statValue,pierce)
//		subPhase = "jumping"
//		phased = 1;
//		attackTimer = 0;
//		onGround = 0;
//		image_index = 0;
//		//leap to player
//		attack4TravelDistance = abs(target.x-x);
//		var spd = sqrt((GameManager.grav*attack4TravelDistance)/(2*dcos(attack4Angle)*dsin(attack4Angle)))
//		xSpd = facing*dcos(attack4Angle)*spd;
//		ySpd = -dsin(attack4Angle)*spd
//	}
//	//CANT BE DEFLECTED
//	//if deflected && subPhase == "jumping"
//	//{
//	//	phase = "staggered";
//	//	subPhase = "deflection";
//	//	xSpd = -facing*60;
//	//	staggerTimer = 0;
//	//	deflected = 0;
//	//	flying = 0;
//	//}
//	if onGround && subPhase == "jumping"
//	{
//		phased = 0;
//		subPhase = "end";
//		attackTimer = 0;
//		image_index = 0;
//	}
//	if attackTimer == round(room_speed*attack4EndDuration) && subPhase ==  "end"
//	{
//		canAttack = 0;
//		canAttackTimer = 0;
//		phase = "idle";
//		subPhase = "";
//	}
//}
//	#endregion
//#endregion

//#region //basic movement
////set phased for collision purposes
//if phase == "dying" || phase == "dyingProne" || phase == "flung" phased = 1;
//else if !(phase == "attack4" && subPhase == "jumping") phased = 0;
//	#region horizontal
//if onGround
//{
//	 if phase == "landing" xSpd -= (xSpd/4);
//else if phase == "idle" xSpd -= (xSpd/10);
//else if phase == "walking" xSpd = clamp(xSpd+(moveSpeed/2)*facing,-moveSpeed,moveSpeed);
//else if phase == "scream" xSpd -= xSpd/4;
//else if phase == "attack1"
//{
//	if subPhase == "attacking" xSpd -= xSpd/20;
//	else xSpd -= xSpd/4;
//}
//else if phase == "attack2"
//{
//	if subPhase == "attacking" xSpd -= xSpd/20;
//	else xSpd -= xSpd/4;
//}
//else if phase == "attack3"
//{
//	if subPhase == "attacking" xSpd -= xSpd/20;
//	else xSpd -= xSpd/4;
//}
//else if phase == "attack4"
//{
//	if subPhase == "pre" xSpd -= xSpd/4;
//	else if subPhase == "jumping" {} //do nothing
//	else if subPhase == "end" xSpd -= xSpd/4
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
//	if phase != "attack4" xSpd -= xSpd/20;
//}
//	#endregion
//	#region vertical
//if (phase == "stagger" || phase == "dying") && subPhase == "flung" ySpd+=GameManager.grav/2;
//else if phase == "attack4" && subPhase == "jumping" ySpd+=GameManager.grav*0.75;
//else if phase == "aerialAttacked"
//{
//	 if ySpd < -2 ySpd+=GameManager.grav/2;
//	 else if abs(ySpd) <= 2 ySpd  += GameManager.grav/16;
//	 else ySpd+=GameManager.grav;
//}
//else ySpd+=GameManager.grav;
//	#endregion
//#endregion

////move/collisions
//scr_move_with_collisions();

//#region //determine sprite
//image_speed = 1;
//image_xscale = facing;
//image_yscale = 1;
//image_blend = c_white;
//if phase != phasePrev image_index = 0;

//if phase == "landing" sprite_index = spr_bloodHound_landing;
//else if phase == "idle"	sprite_index = spr_bloodHound_idle;
//else if phase == "walking" sprite_index = spr_bloodHound_walk;
//else if phase == "scream" {sprite_index = spr_bloodHound_scream; image_speed = sprite_get_number(sprite_index)/(screamDuration);}
//else if phase == "attack1" 
//{
//	if subPhase == "attacking" {sprite_index = spr_bloodHound_attack1; image_speed = sprite_get_number(sprite_index)/(attack1Duration);}
//	else sprite_index = spr_bloodHound_idle;
//}
//else if phase == "attack2" 
//{
//	if subPhase == "attacking" {sprite_index = spr_bloodHound_attack2; image_speed = sprite_get_number(sprite_index)/(attack2Duration);}
//	else sprite_index = spr_bloodHound_idle;
//}
//else if phase == "attack3" 
//{
//	if subPhase == "attacking" {sprite_index = spr_bloodHound_attack3; image_speed = sprite_get_number(sprite_index)/(attack3Duration);}
//	else sprite_index = spr_bloodHound_idle;
//}
//else if phase == "attack4"
//{
//	if subPhase == "pre" {sprite_index = spr_bloodHound_attack4_pre; image_speed = sprite_get_number(sprite_index)/(attack4PreDuration)}
//	else if subPhase == "jumping" {sprite_index = spr_bloodHound_attack4_jumping;}
//	else if subPhase == "end" {sprite_index = spr_bloodHound_attack4_end; image_speed = sprite_get_number(sprite_index)/(attack4EndDuration)}
//}
//else if phase == "staggered" || phase == "dying"
//{
//	if subPhase == ""
//	{
//		sprite_index = spr_bloodHound_dying;
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
//		sprite_index = spr_bloodHound_deflected;
//		image_speed = sprite_get_number(sprite_index)/(deflectDuration);
//	}
//	else if subPhase == "stagger"
//	{
//		sprite_index = spr_bloodHound_staggered;
//		image_speed = sprite_get_number(sprite_index)/(staggerDuration);
//	}
//	else if subPhase == "flung"
//	{
//		sprite_index = spr_bloodHound_flung;
//	}
//	else if subPhase == "prone"
//	{
//		if phase == "staggered" {sprite_index = spr_bloodHound_prone; image_speed = 0;}
//		else if phase == "dying" {sprite_index = spr_bloodHound_dyingProne; image_blend = c_gray; image_speed = sprite_get_number(sprite_index)/(deathDuration);}
//	}
//	else if subPhase == "recover"
//	{
//		sprite_index = spr_bloodHound_prone;
//		image_speed = sprite_get_number(sprite_index)/(proneDuration);
//	}
//}
//else if phase == "aerialAttacked" || phase == "hooked"
//{
//	sprite_index = spr_bloodHound_aerialAttacked;
//	//ySpd dir code goes here when have sprite.
//}
//#endregion