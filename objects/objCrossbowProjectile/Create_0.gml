attackType = attackTypes.projectile;

lifeTime = 0;
targetFacingPrev = 0;
hitOn = true;
phaseOut = 0;

trailTimer = 0;
trailDuration = 0.2;
trailNumberOfPoints = min(60,trailDuration*room_speed); //applied to limit points with duration properly, if second value is used then it will be 1 point per frame
trailNumberOfTrails = 1;
trailColour = c_white;
trailSizeRatio = 0.5;
trailVariance = 0;
for (var i = 0; i < trailNumberOfTrails; i++)
{
	for (var j = 0; j < trailNumberOfPoints; j++)
	vTrail[i,j] = -1;
}
trailNumberOfTrails = 1;

effect = noone;
boundEffect = noone;
new = true;

hitList = ds_list_create();
hitData = ds_map_create();
hitAngle = noone;