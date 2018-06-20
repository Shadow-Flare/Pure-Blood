enum roomDefault {forest};

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
	#region Version 1
		//rmRoomX100Y399
scr_roomData_setUp(rmRoomX100Y399,3,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX100Y399,103,400);
		//rmRoomX103Y399
scr_roomData_setUp(rmRoomX103Y399,2,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX103Y399,102,400);
scr_roomData_addExit(rmRoomX103Y399,105,400);
scr_roomData_addExit(rmRoomX103Y399,104,401);
		//rmRoomX105Y399
scr_roomData_setUp(rmRoomX105Y399,2,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX105Y399,104,400);
scr_roomData_addExit(rmRoomX105Y399,107,400);
		//rmRoomX107Y399
scr_roomData_setUp(rmRoomX107Y399,3,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX107Y399,106,400);
scr_roomData_addExit(rmRoomX107Y399,110,399);
scr_roomData_addExit(rmRoomX107Y399,107,398);
		//rmRoomX110Y399
scr_roomData_setUp(rmRoomX110Y399,2,4,roomDefault.forest);
scr_roomData_addExit(rmRoomX110Y399,109,399);
scr_roomData_addExit(rmRoomX110Y399,109,401);
scr_roomData_addExit(rmRoomX110Y399,112,399);
scr_roomData_addExit(rmRoomX110Y399,112,401);
		//rmRoomX104Y401
scr_roomData_setUp(rmRoomX104Y401,1,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX104Y401,104,400);
scr_roomData_addExit(rmRoomX104Y401,105,401);
		//rmRoomX105Y401
scr_roomData_setUp(rmRoomX105Y401,2,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX105Y401,104,401);
scr_roomData_addExit(rmRoomX105Y401,107,402);
		//rmRoomX107Y398
scr_roomData_setUp(rmRoomX107Y398,1,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX107Y398,107,399);
scr_roomData_addExit(rmRoomX107Y398,106,398);
scr_roomData_addExit(rmRoomX107Y398,108,398);
		//rmRoomX106Y398
scr_roomData_setUp(rmRoomX106Y398,1,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX106Y398,107,398);
		//rmRoomX108Y398
scr_roomData_setUp(rmRoomX108Y398,3,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX108Y398,107,398);
scr_roomData_addExit(rmRoomX108Y398,111,398);
		//rmRoomX111Y396
scr_roomData_setUp(rmRoomX111Y396,3,3,roomDefault.forest);
scr_roomData_addExit(rmRoomX111Y396,110,398);
scr_roomData_addExit(rmRoomX111Y396,114,398);
		//rmRoomX114Y397
scr_roomData_setUp(rmRoomX114Y397,2,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX114Y397,113,398);
scr_roomData_addExit(rmRoomX114Y397,116,398);
scr_roomData_addExit(rmRoomX114Y397,114,399);
scr_roomData_addExit(rmRoomX114Y397,115,399);
		//rmRoomX114Y399
scr_roomData_setUp(rmRoomX114Y399,2,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX114Y399,114,398);
scr_roomData_addExit(rmRoomX114Y399,115,398);
		//rmRoomX116Y399
scr_roomData_setUp(rmRoomX116Y399,1,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX116Y399,115,399);
		//rmRoomX116Y398
scr_roomData_setUp(rmRoomX116Y398,1,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX116Y398,115,398);
scr_roomData_addExit(rmRoomX116Y398,117,398);
		//rmRoomX117Y397
scr_roomData_setUp(rmRoomX117Y397,1,3,roomDefault.forest);
scr_roomData_addExit(rmRoomX117Y397,116,398);
scr_roomData_addExit(rmRoomX117Y397,118,398);
scr_roomData_addExit(rmRoomX117Y397,117,400);
		//rmRoomX118Y398
scr_roomData_setUp(rmRoomX118Y398,2,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX118Y398,117,398);
scr_roomData_addExit(rmRoomX118Y398,120,398);
scr_roomData_addExit(rmRoomX118Y398,118,399);
		//rmRoomX118Y399
scr_roomData_setUp(rmRoomX118Y399,1,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX118Y399,118,398);
		//rmRoomX120Y398
scr_roomData_setUp(rmRoomX120Y398,1,1,roomDefault.forest);
scr_roomData_addExit(rmRoomX120Y398,119,398);
scr_roomData_addExit(rmRoomX120Y398,121,398);
		//rmRoomX121Y397
scr_roomData_setUp(rmRoomX121Y397,2,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX121Y397,120,398);
scr_roomData_addExit(rmRoomX121Y397,123,397);
scr_roomData_addExit(rmRoomX121Y397,123,398);
		//rmRoomX123Y397
scr_roomData_setUp(rmRoomX123Y397,2,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX123Y397,122,397);
scr_roomData_addExit(rmRoomX123Y397,122,398);
scr_roomData_addExit(rmRoomX123Y397,125,398);
		//rmRoomX125Y395		TOWN
scr_roomData_setUp(rmRoomX125Y395,9,4,roomDefault.forest);
scr_roomData_addExit(rmRoomX125Y395,124,398);
	#endregion
	#region Version 2
tmp = rmRoomX100Y299;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[102,299],[101,301]);
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

tmp = rmRoomX102Y299;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[101,299],[104,299]);
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

tmp = rmRoomX104Y299;
rmWidths[? tmp] = 3;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[103,299],[107,299]);
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

tmp = rmRoomX101Y301;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[101,300],[102,301]);
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

tmp = rmRoomX102Y301;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[101,301],[104,302]);
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

tmp = rmRoomX104Y301;
rmWidths[? tmp] = 3;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[103,302],[107,301]);
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

tmp = rmRoomX107Y299;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 4;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[106,299],[109,299],[106,301],[109,301]);
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

tmp = rmRoomX109Y301;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[108,301],[110,300]);
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

tmp = rmRoomX110Y299;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[110,301],[112,300],[112,299],[111,298]);
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

tmp = rmRoomX112Y299;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[111,300],[111,299],[114,300],[114,299]);
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

tmp = rmRoomX114Y299;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[113,300],[113,299]);
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

tmp = rmRoomX111Y296;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 3;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[111,299],[110,296],[112,296]);
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

tmp = rmRoomX110Y296;
rmWidths[? tmp] = 1;
rmHeights[? tmp] = 1;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[111,296]);
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

tmp = rmRoomX112Y295;
rmWidths[? tmp] = 2;
rmHeights[? tmp] = 2;
rmExits[?tmp] = ds_list_create();
	ds_list_add(rmExits[?tmp],[111,296],[114,296]);
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
	#endregion
	#region Version 3
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
	#endregion
	#region Misc
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