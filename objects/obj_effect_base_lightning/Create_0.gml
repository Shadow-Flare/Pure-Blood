//effects
if !layer_exists("lay_technicals") layer_create(100,"lay_technicals");
if !instance_exists(ParticleController) instance_create_layer(0,0,"lay_technicals",ParticleController);

enabled = true;
timer = 0;

sparkTimer = 0;
sparkDuration = 0;
sparkDurationMin = 0;
sparkDurationMax = 1;
pSpark = part_type_create();
part_type_sprite(pSpark,sprLightningSpark,0,0,0);
part_type_size(pSpark,1,1.5,-0.025,0);
part_type_orientation(pSpark,0,360,2,0,0);
part_type_colour1(pSpark,merge_color(c_red,c_orange,0.5));
part_type_alpha3(pSpark,1,1,0);
part_type_blend(pSpark,1);
part_type_speed(pSpark,1,2,-0.02,0);
part_type_life(pSpark,60,90);
part_type_gravity(pSpark,0.05,270);
		
pLum = part_type_create();
part_type_sprite(pLum,sprLightningFlare,0,0,0);
part_type_size(pLum,0,0,0.008,0.5);
part_type_orientation(pLum,0,360,2,0,0);
part_type_colour1(pLum,merge_color(c_red,c_orange,0.5));
part_type_alpha2(pLum,1,0);
part_type_blend(pLum,0);
part_type_direction(pLum,0,360,0,0);
part_type_speed(pLum,0.6,0.7,-0.02,0);
part_type_life(pLum,25,35);

trailForce = false;
trailTimer = 0;
trailDuration = 0.8;