lifeTime = 0;
hasHit = 0;
hitOn = 1;
target = noone;
phaseOut = 0;
type = "proj"

trailTimer = 0;
trailDuration = 1;
trailNumberOfPoints = 60;
trailNumberOfTrails = 10;
trailColour = c_white;
trailSizeRatio = 1;
trailVariance = 0;
for (var i = 0; i < trailNumberOfTrails; i++)
{
	for (var j = 0; j < trailNumberOfPoints; j++)
	vTrail[i,j] = -1;
}
trailNumberOfTrails = 1;

new = 1;
pSys = 0;
pEmitter = 0;
sparkTime = 0.3;
sparkTimer = 0;