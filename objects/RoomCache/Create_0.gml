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
rmRevealData = ds_map_create();				//A map containing reveal status and destructible walls in a nested map (-4(noone) is reveal status, other numbers are room IDs as destructible walls environment ID's).
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
scr_roomData_addExit(rmRoomX103Y399,105,399);
scr_roomData_addExit(rmRoomX103Y399,104,401);
		//rmRoomX105Y399
scr_roomData_setUp(rmRoomX105Y399,2,2,roomDefault.forest);
scr_roomData_addExit(rmRoomX105Y399,104,399);
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
scr_roomData_addDestructibleExit(rmRoomX107Y398,107,399,100);
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
scr_roomData_addDestructibleExit(rmRoomX114Y399,116,399,101);
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