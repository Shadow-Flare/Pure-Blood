simOveride = false;

//effects
if !layer_exists("lay_technicals") layer_create(100,"lay_technicals");
if !instance_exists(ParticleController) instance_create_layer(0,0,"lay_technicals",ParticleController);

if !variable_instance_exists(id,"effectBurst") effectBurst = false;
if !variable_instance_exists(id,"effectEnabled") effectEnabled = true;
if !variable_instance_exists(id,"radius") radius = 4;
if !variable_instance_exists(id,"intensity") intensity = 1.0;
timer = 0;

pAura = part_type_create();
part_type_sprite(pAura,sprFireGlow,0,0,1);
part_type_orientation(pAura,0,360,0,0,0);
part_type_direction(pAura,0,360,0,0);
part_type_size(pAura,0.2,0.6,0,0);
//part_type_speed(pAura,0.2,0.6,0,0);
part_type_colour2(pAura,c_teal,c_blue);
part_type_alpha3(pAura,1,1,0);
part_type_blend(pAura,1);
part_type_life(pAura,45,55);