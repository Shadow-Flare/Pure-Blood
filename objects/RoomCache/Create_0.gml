#region rm Initializer
rmDarknessData = ds_map_create();
rmFogData = ds_map_create();
rmRainData = ds_map_create();
rmAmbienceAudioData = ds_map_create();
rmParallaxSpriteData = ds_map_create();
rmParallaxSpeedData = ds_map_create();
rmParallaxBackData = ds_map_create();

darkDefault = 0.5;
fogDefault = 0;
rainDefault = 0;
defaultAudioID = noone;
parallaxSpriteDefault[0] = bck_forest;
parallaxSpeedDefault[0] = 0.6;
parallaxBackDefault = bck_forest_fill;
#endregion

var tmp
#region Main game

tmp = rmRoomX05Y50;
rmDarknessData[? tmp] = 0.9;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX09Y49;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX09Y51;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX11Y50;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX12Y49;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX12Y52;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX13Y52;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmRoomX14Y51;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

#endregion
#region Arena

tmp = rmArena1;
rmDarknessData[? tmp] = 0.9;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = defaultAudioID;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmArena2;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = defaultAudioID;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmArena3;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = 2;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = defaultAudioID;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault

tmp = rmArena4;
rmDarknessData[? tmp] = darkDefault;
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
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmAmbienceAudioData[? tmp] = sndCityAmbience;
rmParallaxSpriteData[? tmp] = parallaxSpriteDefault;
rmParallaxSpeedData[? tmp] = parallaxSpeedDefault;
rmParallaxBackData[?tmp] = parallaxBackDefault;

#endregion