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
	if !place_free(x+xSpd,y+ySpd)
	{
		var xvar = xSpd/(abs(xSpd)+abs(ySpd));
		var yvar = ySpd/(abs(xSpd)+abs(ySpd));
		while place_free(x+xvar,y+yvar) {x += xvar; y+= yvar};
		xSpd = 0;
		ySpd = 0;
		hitOn = 0;
	}
	x += xSpd;
	y += ySpd;
}

//particles && trail set
if ComboCache.offhandSubtypeNames[? subId] = "Normal Bolts"
{
	trailColour = make_color_rgb(119,136,153);
}
else if ComboCache.offhandSubtypeNames[? subId] = "Flaming Bolts"
{
	trailColour = make_color_rgb(226,88,34);
}
else if ComboCache.offhandSubtypeNames[? subId] = "Frozen Bolts"
{
	trailColour = make_color_rgb(21,84,191);
			
	pSys = part_system_create();
	part_system_depth(pSys,depth-1);
	pEmitter = part_emitter_create(pSys);

	pSnow = part_type_create();
	part_type_sprite(pSnow,spr_snowflake,0,0,0);
	part_type_size(pSnow,0.25,0.75,-0.001,0);
	part_type_orientation(pSnow,0,360,0.05,0,0);
	part_type_colour1(pSnow,make_colour_rgb(21,136,255));
	part_type_alpha3(pSnow,1,1,0);
	part_type_blend(pSnow,1);
	part_type_direction(pSnow,0,360,0,20);
	part_type_gravity(pSnow,0.005,270)
	part_type_speed(pSnow,0.3,0.8,-0.002,0);
	part_type_life(pSnow,120,150);
	
	part_emitter_region(pSys,pEmitter,xPrev+random_range(-4,4),x+random_range(-4,4),yPrev+random_range(-4,4),y+random_range(-4,4),ps_shape_line,ps_distr_linear);
	part_emitter_burst(pSys,pEmitter,pSnow,-30);
}
else if ComboCache.offhandSubtypeNames[? subId] = "Charged Bolts"
{
	trailColour = make_color_rgb(216,227,76);
	trailVariance = 32;
	
	pSys = part_system_create();
	part_system_depth(pSys,depth-1);
	pEmitter = part_emitter_create(pSys);

	pSpark = part_type_create();
	part_type_shape(pSpark,pt_shape_spark);
	part_type_size(pSpark,0.1,0.2,-0.002,0);
	sparkDir = random_range(25,155);
	part_type_orientation(pSpark,0,360,2,0,0);
	part_type_colour3(pSpark,c_yellow,c_red,c_black);
	part_type_alpha1(pSpark,1);
	part_type_blend(pSpark,1);
	part_type_direction(pSpark,sparkDir-25,sparkDir+25,0,0);
	part_type_gravity(pSpark,0.2,270)
	part_type_speed(pSpark,4,6,-0.04,0);
	part_type_life(pSpark,55,75);
	
	part_emitter_region(pSys,pEmitter,xPrev+random_range(-4,4),x+random_range(-4,4),yPrev+random_range(-4,4),y+random_range(-4,4),ps_shape_line,ps_distr_linear);
	sparkTimer++;
	if floor(sparkTimer%(sparkTime*room_speed)) = 0
	{
		sparkTimer = 0;
		sparkTime = random_range(0.6,1.5);
		part_emitter_burst(pSys,pEmitter,pSpark,irandom_range(7,14));
	}
}
else if ComboCache.offhandSubtypeNames[? subId] = "Serrated Bolts"
{
	trailColour = make_color_rgb(139,0,0);
	trailSizeRatio = 1.9;
}

//destroy timer
if lifeTime >= room_speed*7 instance_destroy();

//stick in target
if target != noone && instance_exists(target)
{
	if image_index == 0 image_index = irandom_range(1,sprite_get_number(sprite_index));
	depth = target.depth-1
	hitOn = 0;
	x = target.x+relX;
	y = target.y+relY;
	if target.facing != targetFacingPrev
	{
		targetFacingPrev = target.facing
		relX *= -1;
		image_yscale*= -1
		if image_angle <= 180 image_angle = 180 - image_angle;
		else image_angle = 360 - (image_angle-180);
	}
	if target.phase == "dying" || target.phase == "dyingProne" phaseOut = 1;
}

//destroy early if stuck target dies
if phaseOut
{
	lifeTime+=19;
	target = noone;
	if lifeTime < room_speed*5 lifeTime = room_speed*5;
}