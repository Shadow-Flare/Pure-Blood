#region rm Initializer
rmWidths = ds_map_create();					//width IN CELLS
rmHeights = ds_map_create();				//height IN CELLS
rmDarknessData = ds_map_create();			//0 - 1
rmFogData = ds_map_create();				//0,1,2,3
rmRainData = ds_map_create();				//boolean
rmAmbienceAudioData = ds_map_create();		//snd id
rmAmbientLightData = ds_map_create();		//list[colour,blend,cutoutBlend]
rmParallaxSpriteData = ds_map_create();		//sprite
rmParallaxSpeedData = ds_map_create();		//speed
rmParallaxBackData = ds_map_create();		//background

darkDefault = 0.5;
fogDefault = 0;
rainDefault = 0;
defaultAudioID = noone;
defaultAmbientLight = ds_list_create();
	ds_list_add(defaultAmbientLight,make_colour_rgb(0,0,0),0,0);
parallaxSpriteDefault[0] = bck_forest;
parallaxSpeedDefault[0] = 0.6;
parallaxBackDefault = bck_forest_fill;
#endregion

var tmp
#region Main game

tmp = rmRoomX100Y500;
rmWidths[? tmp] = 5;
rmHeights[? tmp] = 1;
rmDarknessData[? tmp] = 1;
rmAmbientLightData[? tmp] = ds_list_create();
	ds_list_add(rmAmbientLightData[? tmp],make_color_rgb(20,160,20),0.1,0.05);
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX105Y499;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX105Y501;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 1;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX107Y500;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX108Y499;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 3;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX108Y502;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX109Y502;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX110Y501;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

#endregion
#region Arena

tmp = rmArena1;
rmDarknessData[? tmp] = 0.6;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = defaultAudioID;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmArena2;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = defaultAudioID;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmArena3;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = 2;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = defaultAudioID;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmArena4;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = 1;
rmAmbienceAudioData[? tmp] = defaultAudioID;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

#endregion
#region Horde Mode

tmp = rmHorde1;
rmDarknessData[? tmp] = darkDefault;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = sndCityAmbience;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault;

#endregion