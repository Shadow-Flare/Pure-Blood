event_inherited();

darknessStr = RoomCache.rmDarknessData[? room];
var ambienceCache = RoomCache.rmAmbientLightData[? room]
ambienceColour = ambienceCache[| 0];
ambienceBlendStr = ambienceCache[| 1];
ambienceCutoutStr = ambienceCache[| 2];

dynamicLightReso = 256;
lightScale = 6;
blurRadius = 4;
radialBlurFactor = 1;

glowBoost = 3.2;
glowBlurRadius = 2;


shaftLightReso = 1024;
shaftLightStepReso = 1024;
shaftRadialBlurFactor = 1;

normalMappingEnabled = true;
normMaxLights = 500;
normMaxLightRadius = 1000;
normDepthScale = 128;

frameNum = 0;

with obj_light_parent
{
// run these to avoid surface creation on enabling
	///// SURFACE VARIABLES \\\\\
	if !variable_instance_exists(id,"occlusionMap") occlusionMap = noone;
	if !variable_instance_exists(id,"shadowMap1D") shadowMap1D = noone;

	///// CHECK SURFACES EXIST \\\\\
	if !surface_exists(shadowMap1D) shadowMap1D = surface_create(maxLightSize*LightingController.lightScale,1);
	if !surface_exists(occlusionMap) occlusionMap = surface_create(maxLightSize*LightingController.lightScale,maxLightSize*LightingController.lightScale);
}