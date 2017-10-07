//get data


//create effect controllers
if ini_read_real("effects","lighting",1); instance_create_depth(0,0,0,LightingController);
if ini_read_real("effects","fog",1); instance_create_depth(0,0,0,FogController);
if ini_read_real("effects","blood",1); instance_create_depth(0,0,0,BloodStainController);
if ini_read_real("effects","rain",1); instance_create_depth(0,0,0,RainController);

instance_create_depth(0,0,0,ParallaxController);
