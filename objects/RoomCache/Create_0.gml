#region rm Initializer
rmWidths = ds_map_create();					//width IN CELLS
rmHeights = ds_map_create();				//height IN CELLS
rmExits = ds_map_create();
rmDarknessData = ds_map_create();			//0 - 1
rmFogData = ds_map_create();				//0,1,2,3
rmRainData = ds_map_create();				//boolean
rmMusicData = ds_map_create();				//list[snd id, layered?]
rmAmbienceAudioData = ds_map_create();		//snd id
rmAmbientLightData = ds_map_create();		//list[colour,blend,cutoutBlend]
rmParallaxSpriteData = ds_map_create();		//sprite
rmParallaxSpeedData = ds_map_create();		//speed
rmParallaxBackData = ds_map_create();		//background
rmSunData = ds_map_create();				//list[colour,angle]
#endregion

#region defaults
	#region default default
defaultDark = 0.5;
defaultFog = 0;
defaultRain = 0;
defaultMusicData = ds_list_create();	//temp
	ds_list_add(defaultMusicData,snd_music_forestTheme_base,1);
defaultAudioID = noone;
defaultAmbientLight = ds_list_create();
	ds_list_add(defaultAmbientLight,make_colour_rgb(0,0,0),0,0);
defaultParallaxSprite[0] = bck_forest;	//temp
defaultParallaxSpeed[0] = 0.6;			//temp
defaultParallaxBack = bck_forest_fill;	//temp
defaultSunDir = ds_list_create();
	ds_list_add(defaultSunDir,make_colour_rgb(0,0,0),undefined,1);
	#endregion
	#region forest default
forestDark = 0.75;
forestFog = 0;
forestRain = 0;
forestMusicData = ds_list_create();
	ds_list_add(forestMusicData,snd_music_forestTheme_base,1);
forestAudioID = sndCityAmbience;	//temp
forestAmbientLight = ds_list_create();
	ds_list_add(forestAmbientLight,make_color_rgb(20,160,20),0.1,0.05);
forestParallaxSprite[0] = bck_forest;
forestParallaxSpeed[0] = 0.6;
forestParallaxBack = bck_forest_fill;
forestSunDir = ds_list_create();
	ds_list_add(forestSunDir,make_colour_rgb(0,0,0),undefined,1);
//	ds_list_add(rmSunData[? tmp],make_colour_rgb(255,206,66),0,1);
	#endregion
#endregion

#region Main game
var tmp
tmp = rmRoomX100Y500;
rmWidths[? tmp] = 5;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[105,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX105Y499;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[104,500],[105,501],[106,501],[107,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX105Y501;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[105,500],[106,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX107Y500;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[106,500],[108,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX108Y499;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 3;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[107,500],[109,500],[108,502]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX109Y500;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[108,500],[109,501],[111,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX109Y501;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[109,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX111Y500;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[110,500],[112,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX112Y499;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[111,500]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX108Y502;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[108,501],[109,502]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX109Y502;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[108,502],[110,502]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX110Y501;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[109,502]);
rmDarknessData[? tmp] = forestDark;
rmFogData[? tmp] = forestFog;
rmRainData[? tmp] = forestRain;
rmMusicData[? tmp] = forestMusicData;
rmAmbienceAudioData[? tmp] = forestAudioID;
rmAmbientLightData[? tmp] = forestAmbientLight;
rmParallaxSpriteData[? tmp] = forestParallaxSprite;
rmParallaxSpeedData[? tmp] = forestParallaxSpeed;
rmParallaxBackData[? tmp] = forestParallaxBack;
rmSunData[? tmp] = forestSunDir;

tmp = rmRoomX900Y900;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	//ds_list_add(rmExits[?tmp],[109,502]);
rmDarknessData[? tmp] = defaultDark;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = defaultFog;
rmRainData[? tmp] = defaultRain;
rmMusicData[? tmp] = forestMusicData;
rmParallaxSpriteData[? tmp] = defaultParallaxSprite;
rmParallaxSpeedData[? tmp] = defaultParallaxSpeed;
rmParallaxBackData[?tmp] = defaultParallaxBack;
rmSunData[? tmp] = ds_list_create();
	ds_list_add(rmSunData[? tmp],make_colour_rgb(255,206,66),300,1);

#endregion
#region Arena

tmp = rmArena1;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmDarknessData[? tmp] = 0.75;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = defaultFog;
rmRainData[? tmp] = defaultRain;
rmMusicData[? tmp] = defaultMusicData;
rmParallaxSpriteData[? tmp] = defaultParallaxSprite;
rmParallaxSpeedData[? tmp] = defaultParallaxSpeed;
rmParallaxBackData[?tmp] = defaultParallaxBack;
rmSunData[? tmp] = defaultSunDir;

tmp = rmArena2;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmDarknessData[? tmp] = defaultDark;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = defaultFog;
rmRainData[? tmp] = defaultRain;
rmMusicData[? tmp] = defaultMusicData;
rmParallaxSpriteData[? tmp] = defaultParallaxSprite;
rmParallaxSpeedData[? tmp] = defaultParallaxSpeed;
rmParallaxBackData[?tmp] = defaultParallaxBack;
rmSunData[? tmp] = defaultSunDir;

tmp = rmArena3;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmDarknessData[? tmp] = defaultDark;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = defaultFog;
rmRainData[? tmp] = defaultRain;
rmMusicData[? tmp] = defaultMusicData;
rmParallaxSpriteData[? tmp] = defaultParallaxSprite;
rmParallaxSpeedData[? tmp] = defaultParallaxSpeed;
rmParallaxBackData[?tmp] = defaultParallaxBack;
rmSunData[? tmp] = defaultSunDir;

tmp = rmArena4;
rmWidths[? tmp] = 3;
rmHeights[? tmp] = 3;
rmDarknessData[? tmp] = defaultDark;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = defaultFog;
rmRainData[? tmp] = defaultRain;
rmMusicData[? tmp] = defaultMusicData;
rmParallaxSpriteData[? tmp] = defaultParallaxSprite;
rmParallaxSpeedData[? tmp] = defaultParallaxSpeed;
rmParallaxBackData[?tmp] = defaultParallaxBack;
rmSunData[? tmp] = defaultSunDir;

#endregion
#region Horde Mode

tmp = rmHorde1;
rmWidths[? tmp] = 3;
rmHeights[? tmp] = 3;
rmDarknessData[? tmp] = defaultDark;
rmAmbientLightData[? tmp] = defaultAmbientLight;
rmFogData[? tmp] = defaultFog;
rmRainData[? tmp] = defaultRain;
rmMusicData[? tmp] = defaultMusicData;
rmParallaxSpriteData[? tmp] = defaultParallaxSprite;
rmParallaxSpeedData[? tmp] = defaultParallaxSpeed;
rmParallaxBackData[?tmp] = defaultParallaxBack;
rmSunData[? tmp] = defaultSunDir;

#endregion