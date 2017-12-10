event_inherited();

darknessStr = RoomCache.rmDarknessData[? room];
var ambienceCache = RoomCache.rmAmbientLightData[? room]
ambienceColour = ambienceCache[| 0];
ambienceBlendStr = ambienceCache[| 1];
ambienceCutoutStr = ambienceCache[| 2];

dynamicLightReso = 128;
lightScale = 2;
blurRadius = 2;
radialBlurFactor = 1;

normMaxLights = 500;