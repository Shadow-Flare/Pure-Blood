ini_open("settings");

instance_activate_object(LightingController);
instance_activate_object(BloodStainController);
instance_activate_object(RainController);
instance_activate_object(FogController);
instance_activate_object(ParallaxController);
instance_activate_object(ParticleController);

//create effect controllers
	//room dependant
		//lighting
instance_destroy(LightingController);
if ini_read_real("effects","lighting",1) && RoomCache.rmDarknessData[? room] != 0 instance_create_layer(0,0,"lay_blocks",LightingController);
else instance_destroy(LightingController);
		//Fog
instance_destroy(FogController);
if ini_read_real("effects","fog",1) && RoomCache.rmFogData[? room] != 0 instance_create_layer(0,0,"lay_technicals",FogController);
else instance_destroy(FogController);
		//Rain
instance_destroy(RainController);
if ini_read_real("effects","rain",1) && RoomCache.rmRainData[? room] != 0 instance_create_layer(0,0,"lay_interactables",RainController);
else instance_destroy(RainController);

	//ever present
		//blood
instance_destroy(BloodStainController);
if ini_read_real("effects","blood",1) instance_create_layer(0,0,"lay_blocks",BloodStainController);
else instance_destroy(BloodStainController);

		//Attack Hit Boxes
GameManager.hitBoxVisuals = ini_read_real("effects","hitBoxVisuals",false) 

		//Actor Hit Boxes
GameManager.actorBoxVisuals = ini_read_real("effects","actorBoxVisuals",false) 

		//particle Effects
instance_destroy(ParticleController);
instance_create_layer(0,0,"lay_technicals",ParticleController);

		//parallax
instance_destroy(ParallaxController);
instance_create_depth(0,0,0,ParallaxController);

		//ambience (audio)
instance_destroy(AmbienceController);
instance_create_layer(0,0,"lay_technicals",AmbienceController);

ini_close();