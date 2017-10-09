event_inherited();

//rain: initials
rain = 0;
rainData = noone;			//empty
rainPPS = 10;						//particles per second
rainSpeed = 8;
rainSpeedVar = 2;					//random variance
rainAngle = -105;					//fall angle (degrees)
rainSize = 1;						//image xscale/yscale modifier (1 = normal)
rainSpriteFall = spr_rain_fall;		//fall sprite

rainSoundMod = 0;
rainSoundModReal = 0;
rainSoundCap = 200;

pRainSys = part_system_create();
part_system_depth(pRainSys,layer_get_depth(layer_get_id("lay_lights")));
pRainEmitter = part_emitter_create(pRainSys);
		
pRain = part_type_create();
part_type_sprite(pRain,spr_pixel,0,0,0);
part_type_size(pRain,1,1,0,0);
part_type_orientation(pRain,0,0,0,0,0);
part_type_colour1(pRain,merge_colour(c_teal,c_blue,0.5));
part_type_alpha2(pRain,0.6,0);
part_type_blend(pRain,1);
part_type_direction(pRain,45,135,0,0);
part_type_speed(pRain,1,1.2,0,0);
part_type_gravity(pRain,GameManager.grav/3,270);
part_type_life(pRain,25,35);

sRain = audio_emitter_create();
audio_emitter_gain(sRain,0);
audio_play_sound_on(sRain,snd_rain,1,10);

sRainX = 0;
sRainY = -16;
sRainXReal = 0;
sRainYReal = -16;