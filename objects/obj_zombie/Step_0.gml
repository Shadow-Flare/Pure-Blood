//on ground check
phasePrev = phase;
onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent)));
//basic ai
scr_enemy_basicAi(1);
//react to hit, Status effect & death initializer
scr_enemy_hitAndDamage();

#region phases/AI
	//landing
if phase  == "airborne" && onGround
{
	phase = "landing";
	subPhase = "";
	landTimer = 0;
}

if phase == "landing"
{
	landTimer++
	if landTimer = round(room_speed*landDuration)
	{
		phase = "idle";
		subPhase = "";
	}
}
	
	//basic movement
if onGround && phase != "aerialAttacked" && phase != "landing" && phase != "attack1" && phase != "staggered" && phase != "flung" && phase != "prone" && phase != "dying" && phase != "dyingFlung" && phase != "dyingProne" && phase != "hooked" && !attackCooldown
{
	if target != noone
	{
		facing = sign(target.x-x)
		phase = "walking"
	}
	else
	{
		phase = "idle";	
	}
}
else if phase != "attack1" && !onGround && phase != "aerialAttacked" && subPhase != "flung"
{
	phase = "airborne"
	subPhase = ""
}

//attack1
if target != noone && canAttack && phase != "attack1" && phase != "landing" && phase != "aerialAttacked" && phase != "dying" && phase != "staggered" && phase != "flung" && phase != "prone" && phase != "dyingFlung" && phase != "dyingProne" && phase != "hooked"
{
	var xSearchDist = abs(x-target.x);
	if xSearchDist <= attack1Range
	{
		phase = "attack1";
		attackTimer = 0;
	}
}

//attacks
if phase == "attack1"
{
	attackTimer++;
	if deflected == 1
	{
		phase = "staggered"
		subPhase = "deflection"
		xSpd = -facing*moveSpeed*2;
		staggerTimer = 0;
		deflected = 0;
	}
	if attackTimer = floor(room_speed*(5/8))
	{
		scr_enemy_attack(2/8,12,-2,10,12,0,physicalPower*1,6,20,-1,0,0); //scr_enemy_attack(duration(s), x offset(pix), y offset(pix), width(pix), height(pix), damage, stagger)
	}
	else if attackTimer == room_speed*attack1Duration
	{
		phase = "idle"
	}
	else if attackTimer == room_speed*(attack1Duration+2)
	{
		canAttack = 0;
		attackTimer = 0;
	}
}
#endregion

#region basic movement
//set phased for collision purposes
if phase == "dying" || phase == "dyingProne" || phase == "flung" phased = 1;
else phased = 0;
	#region onground default stopper and in air slowdown 
if onGround
{
	 if phase == "landing" xSpd -= (xSpd/4);
else if phase == "idle" xSpd -= (xSpd/10);
else if phase == "walking" xSpd = clamp(xSpd+(moveSpeed/2)*facing,-moveSpeed,moveSpeed);
else if phase == "attack1" xSpd = facing*0;
else if phase == "dying" xSpd -= xSpd/8;
else if phase == "staggered" || phase == "dying"
	{
		if subPhase == "" xSpd -= xSpd/4;
		else if subPhase == "deflection" xSpd -= xSpd/4;
		else if subPhase == "stagger" xSpd -= xSpd/4;
		else if subPhase == "flung" xSpd -= xSpd/60;
		else if subPhase == "prone" xSpd -= xSpd/4;
		else if subPhase == "recover" xSpd -= xSpd/4;
	}
else if phase == "aerialAttacked" xSpd -= xSpd/4;
else if phase == "hooked" {} //defined in obj_hook
}
else
{
	//if phase == "flung" xSpd -= xSpd/60;
	xSpd -= xSpd/20;
}
	#endregion
	#region vertical
if (phase == "stagger" || phase == "dying") && subPhase == "flung" ySpd+=GameManager.grav/2;
else if phase == "aerialAttacked"
{
	 if ySpd < -2 ySpd+=GameManager.grav/2;
	 else if abs(ySpd) <= 2 ySpd  += GameManager.grav/16;
	 else ySpd+=GameManager.grav;
}
else ySpd+=GameManager.grav;
	#endregion
#endregion

//move/collisions
scr_move_with_collisions();

#region determine sprite
image_speed = 1;
image_xscale = facing;
image_yscale = 1;
image_blend = c_white;
if phase != phasePrev image_index = 0;

if phase == "landing" sprite_index = spr_zombie_male_1_landing;
else if phase == "idle"	sprite_index = spr_zombie_male_1_idle;
else if phase == "walking" sprite_index = spr_zombie_male_1_walk;
else if phase == "attack1" 
{
	sprite_index = spr_zombie_male_1_attack1;
	image_speed = sprite_get_number(sprite_index)/(attack1Duration);
}
else if phase == "staggered" || phase == "dying"
{
	if subPhase == ""
	{
		sprite_index = spr_zombie_male_1_dying;
		image_speed = sprite_get_number(sprite_index)/(deathDuration);
		image_blend = c_gray;
		if deathTimer >= room_speed*deathDuration
		{
			image_index = sprite_get_number(sprite_index)-1;
			image_speed = 0;
		}
	}
	else if subPhase == "deflection"
	{
		sprite_index = spr_zombie_male_1_staggered;
		image_speed = sprite_get_number(sprite_index)/(deflectDuration);
	}
	else if subPhase == "stagger"
	{
		sprite_index = spr_zombie_male_1_staggered;
		image_speed = sprite_get_number(sprite_index)/(staggerDuration);
	}
	else if subPhase == "flung"
	{
		sprite_index = spr_zombie_male_1_flung;
	}
	else if subPhase == "prone"
	{
		if phase == "staggered" {sprite_index = spr_zombie_male_1_prone; image_index = 0; image_speed = 0;}
		else if phase == "dying" {sprite_index = spr_zombie_male_1_dyingProne; image_blend = c_gray; image_speed = sprite_get_number(sprite_index)/(deathDuration);}
	}
	else if subPhase == "recover"
	{
		sprite_index = spr_zombie_male_1_prone;
		image_speed = sprite_get_number(sprite_index)/(proneDuration);
	}
}
else if phase == "aerialAttacked" || phase == "hooked"
{
	sprite_index = spr_zombie_male_1_aerialAttacked;
	//ySpd dir code goes here when have sprite.
}
#endregion