enum BackgroundID {none, forest}

#region rm Initializer
rmDarknessData = ds_map_create();
rmFogData = ds_map_create();
rmRainData = ds_map_create();
rmParallaxData = ds_map_create();
rmBackgroundData = ds_map_create();

var darkDefault = 0.9;
var fogDefault = 3;
var rainDefault = 0;
var parallaxDefault = [];
var backgroundDefault = BackgroundID.forest
#endregion

//rmRoom1
var tmp = rmRoom1;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxData[? tmp] = parallaxDefault;
rmBackgroundData[? tmp] = backgroundDefault;

//rmRoom2
var tmp = rmRoom2;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxData[? tmp] = parallaxDefault;
rmBackgroundData[? tmp] = backgroundDefault;

//rmRoom3
var tmp = rmRoom3;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxData[? tmp] = parallaxDefault;
rmBackgroundData[? tmp] = backgroundDefault;

//rmArena1
var tmp = rmArena1;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxData[? tmp] = parallaxDefault;
rmBackgroundData[? tmp] = backgroundDefault;

//rmRoom1
var tmp = rmArena2;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxData[? tmp] = parallaxDefault;
rmBackgroundData[? tmp] = backgroundDefault;

//rmRoom1
var tmp = rmArena3;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = rainDefault;
rmParallaxData[? tmp] = parallaxDefault;
rmBackgroundData[? tmp] = backgroundDefault;

//rmRoom1
var tmp = rmArena4;
rmDarknessData[? tmp] = darkDefault;
rmFogData[? tmp] = fogDefault;
rmRainData[? tmp] = 1;
rmParallaxData[? tmp] = parallaxDefault;
rmBackgroundData[? tmp] = backgroundDefault;