//effects
if !layer_exists("lay_technicals") layer_create(100,"lay_technicals");
if !instance_exists(ParticleController) instance_create_layer(0,0,"lay_technicals",ParticleController);

if !variable_instance_exists(id,"burst") burst = false;
if !variable_instance_exists(id,"enabled") enabled = true;
timer = 0;

pSpark = part_type_create();
part_type_direction(pSpark,65,115,0,0);
part_type_speed(pSpark,2.5,3.5,-0.04,0);
part_type_size(pSpark,1,1.5,-0.01,0);
part_type_sprite(pSpark,sprLightningSpark,0,0,0);
part_type_orientation(pSpark,0,360,2,0,0);
part_type_colour1(pSpark,merge_color(c_red,c_orange,0.5));
part_type_alpha3(pSpark,1,1,0);
part_type_blend(pSpark,1);
part_type_life(pSpark,60,120);
part_type_gravity(pSpark,0.1,270);
		

trailForce = false;
trailTimer = 0;
trailDuration = 0.8;

trailBoltDown = true;