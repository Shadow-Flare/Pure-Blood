//effect object start
if new
{
	switch subID
	{
		case offhandSubtypeID.crossbow_normal:
			trailColour = make_color_rgb(119,136,153);
			break;
		case offhandSubtypeID.crossbow_fire:
			trailColour = make_color_rgb(226,88,34);
			boundEffect = obj_effect_base_fire;
			break;
		case offhandSubtypeID.crossbow_ice:
			trailColour = make_color_rgb(21,84,191);
			boundEffect = obj_effect_base_ice;
			break;
		case offhandSubtypeID.crossbow_lightning:
			trailColour = make_color_rgb(216,227,76);
			boundEffect = obj_effect_base_lightning;
			break;
		case offhandSubtypeID.crossbow_serrated:
			trailColour = make_color_rgb(139,0,0);
			trailSizeRatio = 1.9;
			break;
	}
	
	if boundEffect != noone
	{
		effect = instance_create_depth(x,y,10000,obj_effect_persistent_follow);
		with effect 
		{
			boundEffect = other.boundEffect;
			effectEnabled = true;
			target = other.id;
			radius = 1.2;
			intensity = 0.3;
		}
	}
	
	new = false;
}

//lifetimer
lifeTime++
if lifeTime >= room_speed*0.2
{
	ySpd += GameManager.grav/4;
	xSpd -= xSpd/40;
}

//basic movement
xPrev = x;
yPrev = y;
if hitOn
{
	var ang = point_direction(0,0,xSpd,-ySpd);
	hitAngle = ang;
	if !place_free(x+xSpd,y+ySpd)
	{
		image_index = irandom(sprite_get_number(sprite_index));
		while place_free(x+dcos(ang),y+dsin(ang)) {x+=dcos(ang); y+=dsin(ang);}
		xSpd = 0;
		ySpd = 0;
		hitOn = 2;
		with effect
		{
			radius = 3;
			intensity = 0.5;
			effectBurst = true;
			effectEnabled = false;
		}
	}
	x += xSpd;
	y += ySpd;
}

//destroy timer
if lifeTime >= room_speed*7 instance_destroy();

//stick in target
if !ds_list_empty(hitList) && instance_exists(hitList[| 0])
{
	if object_is_ancestor(hitList[| 0],objActorParent)
	{
		if targetFacingPrev == 0
		{
			targetFacingPrev = hitList[| 0].facing;
			relX = hitList[| 0].x-x;
			relY = -(hitList[| 0].y-y);
			while abs(relX) > 4 relX -= sign(hitList[| 0].x-x)
			while abs(relY) > 4 relY += sign(hitList[| 0].y-y)
			hitOn = 0;
			image_index = irandom_range(1,sprite_get_number(sprite_index));
			depth = hitList[| 0].depth-1;
			with effect
			{
				radius = 3;
				intensity = 0.5;
				effectBurst = true;
				effectEnabled = false;
			}
		}
		x = hitList[| 0].x+relX;
		y = hitList[| 0].y+relY;
		if hitList[| 0].facing != targetFacingPrev
		{
			targetFacingPrev = hitList[| 0].facing
			relX *= -1;
			image_yscale*= -1
			if image_angle <= 180 image_angle = 180 - image_angle;
			else image_angle = 360 - (image_angle-180);
		}
		if hitList[| 0].phase == state.dying phaseOut = 1;
	}
	else
	{
		if targetFacingPrev == 0	//just used for initialization
		{
			relX = hitList[| 0].x-x;
			relY = -(hitList[| 0].y-y);
			while abs(relX) > 4 relX -= sign(hitList[| 0].x-x)
			while abs(relY) > 4 relY += sign(hitList[| 0].y-y)
			hitOn = 0;
			image_index = irandom_range(1,sprite_get_number(sprite_index));
			depth = hitList[| 0].depth-1;
			with effect
			{
				radius = 3;
				intensity = 0.5;
				effectBurst = true;
				effectEnabled = false;
			}
		}
		if !instance_exists(hitList[| 0])
		{
			instance_destroy();
		}
		else
		{
			x = hitList[| 0].x+relX;
			y = hitList[| 0].y+relY;
		}
	}
}

//destroy early if stuck target dies
if phaseOut
{
	lifeTime+=19;
	ds_list_clear(hitList);
	if lifeTime < room_speed*5 lifeTime = room_speed*5;
}