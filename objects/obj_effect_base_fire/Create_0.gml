//effects
if !layer_exists("lay_technicals") layer_create(100,"lay_technicals");
if !instance_exists(ParticleController) instance_create_layer(0,0,"lay_technicals",ParticleController);

enabled = true;
timer = 0;

pFire = part_type_create();
part_type_sprite(pFire,sprFireFlame,0,0,1);
part_type_size(pFire,1,1.5,-0.025,0);
part_type_orientation(pFire,0,360,0,2,0);
part_type_colour3(pFire,c_orange,c_red,c_black);
part_type_alpha3(pFire,1,1,0);
part_type_blend(pFire,1);
part_type_speed(pFire,1,2,-0.1,0);
part_type_life(pFire,25,35);

pGlow = part_type_create();
part_type_sprite(pGlow,sprFireGlow,0,0,1);
part_type_size(pGlow,0.6,0.8,0,0);
part_type_orientation(pGlow,0,360,2,0,0);
part_type_colour3(pGlow,c_orange,c_red,c_red);
part_type_alpha3(pGlow,1,1,0);
part_type_blend(pGlow,1);
part_type_speed(pGlow,1.2,2.4,-0.1,0);
part_type_life(pGlow,40,45);
		
pEmber = part_type_create();
part_type_sprite(pEmber,sprFireEmber,0,0,1);
part_type_size(pEmber,1.2,1.5,-0.001,0);
part_type_orientation(pEmber,0,360,0.05,0,0);
part_type_colour2(pEmber,c_orange,c_red);
part_type_alpha2(pEmber,1,0);
part_type_blend(pEmber,1);
part_type_speed(pEmber,1,1.5,0.02,0);
part_type_life(pEmber,45,75);