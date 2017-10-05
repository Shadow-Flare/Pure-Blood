lifeTime++

//basic movement loggers
if !variable_instance_exists(id,"xDefault") xDefault = xSpd;
if !variable_instance_exists(id,"yDefault") yDefault = ySpd;
xPrev = x;
yPrev = y;

if die == 0
{
	//particles
	if wiff == 1
	{
		xSpd = 0;
		ySpd = 0;
		pSys = part_system_create();
		part_system_depth(pSys,depth-1);
		pEmitter = part_emitter_create(pSys);
		
		pSmoke = part_type_create();
		part_type_sprite(pSmoke,spr_fire,0,0,1);
		part_type_size(pSmoke,1,1.5,-0.01,0);
		part_type_orientation(pSmoke,0,360,2,0,0);
		part_type_colour1(pSmoke,c_white);
		part_type_alpha2(pSmoke,0.5,0);
		part_type_blend(pSmoke,1);
		part_type_gravity(pSmoke,0.1,90)
		part_type_direction(pSmoke,0,180,0,0);
		part_type_speed(pSmoke,2,3,-0.1,0);
		part_type_life(pSmoke,120,150);
		
		part_emitter_region(pSys,pEmitter,xPrev+random_range(-4,4),x+random_range(-4,4),yPrev+random_range(-4,4),y+random_range(-4,4),ps_shape_line,ps_distr_linear);
		part_emitter_burst(pSys,pEmitter,pSmoke,8);
		
		die = 1;
	}
	else if global.offhandSubtypeNames[subId] == "Blaze"
	{
		pSys = part_system_create();
		part_system_depth(pSys,depth-1);
		pEmitter = part_emitter_create(pSys);
		
		pFire = part_type_create();
		part_type_sprite(pFire,spr_fire,0,0,1);
		part_type_size(pFire,1,1.5,-0.05,0);
		part_type_orientation(pFire,0,360,2,0,0);
		part_type_colour2(pFire,c_orange,c_red);
		part_type_alpha3(pFire,1,1,0);
		part_type_blend(pFire,1);
		part_type_direction(pFire,85,95,0,0);
		part_type_speed(pFire,2,10,-0.1,0);
		part_type_life(pFire,25,35);
		
		pEmber = part_type_create();
		part_type_sprite(pEmber,spr_ember,0,0,1);
		part_type_size(pEmber,0.5,0.75,-0.001,0);
		part_type_orientation(pEmber,0,360,0.05,0,0);
		part_type_colour2(pEmber,c_orange,c_red);
		part_type_alpha2(pEmber,1,0);
		part_type_blend(pEmber,1);
		part_type_direction(pEmber,55,125,0,20);
		part_type_speed(pEmber,4,7,0,0);
		part_type_life(pEmber,45,75);
	
		part_emitter_region(pSys,pEmitter,xPrev+random_range(-4,4),x+random_range(-4,4),yPrev+random_range(-4,4),y+random_range(-4,4),ps_shape_line,ps_distr_linear);
		part_emitter_burst(pSys,pEmitter,pFire,4);
		part_emitter_burst(pSys,pEmitter,pEmber,-10);
	}
	else if global.offhandSubtypeNames[subId] == "Frost"
	{
		xSpd = xDefault*0.6; 
		ySpd = yDefault*0.6;
		pSys = part_system_create();
		part_system_depth(pSys,depth-1);
		pEmitter = part_emitter_create(pSys);

		pSnow = part_type_create();
		part_type_sprite(pSnow,spr_snowflake,0,0,0);
		part_type_size(pSnow,0.5,1.25,-1/120,0);
		part_type_orientation(pSnow,0,360,0.05,0,0);
		part_type_colour1(pSnow,make_colour_rgb(21,136,255));
		part_type_alpha3(pSnow,1,1,0);
		part_type_blend(pSnow,1);
		part_type_direction(pSnow,0,360,0,20);
		part_type_gravity(pSnow,0.02,270)
		part_type_speed(pSnow,1,2,-0.005,0);
		part_type_life(pSnow,120,150);
	
		pGlow = part_type_create();
		part_type_sprite(pGlow,spr_glow,0,0,0);
		part_type_size(pGlow,1.75,2.5,-1/60,0);
		part_type_orientation(pGlow,0,360,0,0,0);
		part_type_colour1(pGlow,make_colour_rgb(21,136,255));
		part_type_alpha1(pGlow,0.2);
		part_type_blend(pGlow,1);
		part_type_direction(pGlow,0,360,0,0);
		part_type_speed(pGlow,0.1,0.2,0,0);
		part_type_life(pGlow,120,150);
	
		part_emitter_region(pSys,pEmitter,xPrev+random_range(-16,16),x+random_range(-16,16),yPrev+random_range(-16,16),y+random_range(-16,16),ps_shape_line,ps_distr_linear);
		part_emitter_burst(pSys,pEmitter,pSnow,1);
		part_emitter_burst(pSys,pEmitter,pGlow,4);
	}
	else if global.offhandSubtypeNames[subId] == "Spark"
	{		
		trailColour = c_yellow;
		trailVariance = 64;
		trailNumberOfTrails = 3;
		xSpd = xDefault*1.5; 
		ySpd = yDefault*1.5;
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
		part_emitter_burst(pSys,pEmitter,pSpark,irandom_range(7,14));
	}
	else if global.offhandSubtypeNames[subId] == "Leech"
	{	
		xSpd = xDefault*0.5; 
		ySpd = yDefault*0.5;
		pSys = part_system_create();
		part_system_depth(pSys,depth-1);
		pEmitter = part_emitter_create(pSys);
		
		pLeech = part_type_create();
		part_type_sprite(pLeech,spr_glow,0,0,1);
		part_type_size(pLeech,0.5,1.75,-1/120,0.1);
		part_type_orientation(pLeech,0,360,0,0,0);
		part_type_colour2(pLeech,make_color_rgb(122.5,0,0),c_purple);
		part_type_alpha2(pLeech,1,0);
		part_type_blend(pLeech,1);
		part_type_direction(pLeech,0,360,0,0);
		part_type_speed(pLeech,4,7,-0.2,1);
		part_type_life(pLeech,45,75);
	
		part_emitter_region(pSys,pEmitter,xPrev+random_range(-4,4),x+random_range(-4,4),yPrev+random_range(-4,4),y+random_range(-4,4),ps_shape_line,ps_distr_linear);
		part_emitter_burst(pSys,pEmitter,pLeech,1);
	}
	else if global.offhandSubtypeNames[subId] == "Osmose"
	{
		xSpd = xDefault*0.5; 
		ySpd = yDefault*0.5;
		pSys = part_system_create();
		part_system_depth(pSys,depth-1);
		pEmitter = part_emitter_create(pSys);
		
		pOsmose = part_type_create();
		part_type_shape(pOsmose,pt_shape_ring);
		part_type_size(pOsmose,0.5,1.75,-1/120,0.1);
		part_type_orientation(pOsmose,0,360,0,0,0);
		part_type_colour2(pOsmose,make_color_rgb(0,0,122.5),c_purple);
		part_type_alpha2(pOsmose,1,0);
		part_type_blend(pOsmose,1);
		part_type_direction(pOsmose,0,360,0,0);
		part_type_speed(pOsmose,4,7,-0.2,1);
		part_type_life(pOsmose,45,75);
	
		part_emitter_region(pSys,pEmitter,xPrev+random_range(-4,4),x+random_range(-4,4),yPrev+random_range(-4,4),y+random_range(-4,4),ps_shape_line,ps_distr_linear);
		part_emitter_burst(pSys,pEmitter,pOsmose,1);
	}
	//movement
	if !place_free(x+xSpd,y+ySpd) || place_meeting(x+xSpd,y+ySpd,objEnemyParent)
	{
		var xvar = xSpd/(abs(xSpd)+abs(ySpd));
		var yvar = ySpd/(abs(xSpd)+abs(ySpd));
		while place_free(x+xvar,y+yvar) && !place_meeting(x+xvar,y+yvar,objEnemyParent) {x += xvar; y+= yvar};
		hitOn = 0;
		die = 1;
	}
	x += xSpd;
	y += ySpd;
}

//destroy timer
if lifeTime >= room_speed*7 && die == 0 die = 1;

//destroy
if die = 1
{
	trailOn = 0;
	visible = 1;
	hitOn = 1;
	image_xscale = 4;
	image_yscale = 4;
	die = 2;
	lifeTime = room_speed*5;
}
else if die = 2
{
	hitOn=0;
	if lifeTime >= room_speed*7 instance_destroy();
}