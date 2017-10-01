//get data
ini_open("settings.ini");
	FXLighting = ini_read_real("effects","lighting",0);
	FXFog = ini_read_real("effects","fog",0);
	FXBlood = ini_read_real("effects","blood",0);
	FXRain = ini_read_real("effects","rain",0);
	FXVsync = ini_read_real("effects","vsync",0);
ini_close();

//create effect controllers
if FXLighting instance_create_depth(0,0,0,LightingController);
if FXFog instance_create_depth(0,0,0,FogController);
if FXBlood instance_create_depth(0,0,0,BloodStainController);
if FXRain instance_create_depth(0,0,0,RainController);

instance_create_depth(0,0,0,ParallaxController);
