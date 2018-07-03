///@arg room
///@arg width
///@arg height
///@arg roomDefault.ENUM
var rm = argument0;
var w = argument1;
var h = argument2;
var def = argument3;

rmWidths[? rm] = w;
rmHeights[? rm] = h;
rmExits[? rm] = ds_list_create();
rmRevealData[? rm] = ds_map_create();
var cache = rmRevealData[? rm];
cache[? noone] = false;	//revealed status;

switch def
{
	case roomDefault.forest:
		rmDarknessData[? rm] = forestDark;
		rmFogData[? rm] = forestFog;
		rmRainData[? rm] = forestRain;
		rmMusicData[? rm] = forestMusicData;
		rmAmbienceAudioData[? rm] = forestAudioID;
		rmAmbientLightData[? rm] = forestAmbientLight;
		rmParallaxSpriteData[? rm] = forestParallaxSprite;
		rmParallaxSpeedData[? rm] = forestParallaxSpeed;
		rmParallaxBackData[? rm] = forestParallaxBack;
		rmSunData[? rm] = forestSunDir;
		break;
}