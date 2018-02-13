//effects
if !layer_exists("lay_technicals") layer_create(100,"lay_technicals");
if !instance_exists(ParticleController) instance_create_layer(0,0,"lay_technicals",ParticleController);

enabled = true;
timer = 0;

pIce = part_type_create();
part_type_sprite(pIce,sprIceSnowflake,1,1,0);
part_type_size(pIce,1,1.5,-0.025,0);
part_type_orientation(pIce,0,360,2,0,0);
part_type_colour1(pIce,merge_color(c_blue,c_white,0.5));
part_type_alpha3(pIce,1,1,0);
part_type_blend(pIce,1);
part_type_direction(pIce,0,360,0,0);
part_type_speed(pIce,0.3,0.8,-0.001,0);
part_type_life(pIce,60,90);
		
pMist = part_type_create();
part_type_sprite(pMist,sprIceMist,0,0,1);
part_type_orientation(pMist,0,360,0,0,0);
part_type_colour1(pMist,merge_color(c_blue,c_white,0.5));
part_type_alpha3(pMist,1,1,0);
part_type_blend(pMist,0);
part_type_direction(pMist,55,125,0,20);
part_type_life(pMist,70,110);