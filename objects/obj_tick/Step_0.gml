phasePrev = phase;
onGround = (!place_free(x,y+1)||(place_meeting(x,y+1,obj_platform_parent)&&!place_meeting(x,y,obj_platform_parent)));

//find corpse and own it
if (!instance_exists(targetCorpse)) && phase != "exploding" targetCorpse = noone;
if targetCorpse == noone
{
	//make list
	for(var i = 0; i < instance_number(obj_corpse); i++)
	{
		corpseArr[i] = instance_find(obj_corpse,i);
	}
	//sort by dist
	for(var i = 0; i < instance_number(obj_corpse); i++)
	{
		for(var j = i+1; j < instance_number(obj_corpse); j++)
		{
			if distance_to_object(corpseArr[i]) > distance_to_object(corpseArr[j])
			{
				var temp = corpseArr[i];
				corpseArr[i] = corpseArr[j];
				corpseArr[j] = temp;
			}
		}
	}
	//check in order till find a non target corpse
	for(var i = 0; i < instance_number(obj_corpse); i++)
	{
		var cps = corpseArr[i];
		if !cps.isTargeted
		{
			targetCorpse = cps;
			cps.isTargeted = 1;
			break;
		}
	}
}
if targetCorpse == noone
{
	phase = "dying"
}

if instance_exists(targetCorpse) facing = sign(targetCorpse.x-x)

//phases
if !onGround && phase == "moving"
{
	phase = "fling"
}
else if onGround && phase = "fling"
{
	phase = "moving"
}

if place_meeting(x,y,targetCorpse) && phase == "moving"
{
	phase = "bloating"
	bloatTimer = 0;
}

if phase == "bloating"
{
	bloatTimer++;
	if bloatTimer >= round(room_speed*bloatDuration)
	{
		phase = "exploding"
		explodeTimer = 0;
		instance_destroy(targetCorpse);
		//explode!
		scr_enemy_attack(explodeDuration,0,0,80,80,8,9,6,0,-1,0,1); 
	}
}

if place_meeting(x,y,obj_player_attack_parent) && instance_place(x,y,obj_player_attack_parent).hitOn phase = "dying"

if phase == "bloating" && !instance_exists(targetCorpse) phase = "dying"

if phase == "dying"
{
	dieTimer++
	if dieTimer >= round(dieDuration*room_speed)
	{
		if instance_exists(targetCorpse) targetCorpse.isTargeted = 0;
		//effect?
		instance_destroy();
	}
}
if phase == "exploding"
{
	//effect!
	//explode!
	explodeTimer++;
	if explodeTimer >= round(room_speed*explodeDuration)
	{
		instance_destroy();
	}
}

//movement
if !onGround
{
	xSpd -= xSpd/90;
}
else if onGround
{
	if phase == "moving" xSpd = moveSpeed*facing
	else if phase == "bloating" xSpd = 0;
	else xSpd -= xSpd/4
}
ySpd += GameManager.grav/2;

xSpdPrev = xSpd;
scr_move_with_collisions();
if xSpdPrev != 0 && xSpd = 0 xSpd = -xSpdPrev*0.4;

//sprites
if phasePrev != phase image_index = 0;
image_xscale = facing;
if phase == "moving"
{
	sprite_index = spr_tick_idle;
}
else if phase == "fling"
{
	sprite_index = spr_tick_idle;
}
else if phase == "bloating"
{
	sprite_index = spr_tick_bloating;
	image_speed = sprite_get_number(sprite_index)/(bloatDuration);
}
else if phase == "dying"
{
	sprite_index = spr_tick_dying;
	image_speed = sprite_get_number(sprite_index)/(dieDuration);
}
else if phase == "exploding"
{
	sprite_index = spr_tick_exploding;
	image_speed = sprite_get_number(sprite_index)/(explodeDuration);
}