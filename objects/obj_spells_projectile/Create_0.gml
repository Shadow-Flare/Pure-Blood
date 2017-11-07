attackType = attackTypes.projectile;

lifeTime = 0;
hasHit = 0;
hitOn = 0;
target = noone;
phaseOut = 0;
die = 0;
type = "proj"
image_xscale = 0.5;
image_yscale = 0.5;

trailOn = 1;

trailTimer = 0;
trailDuration = 1;
trailNumberOfPoints = 60;
trailNumberOfTrails = 10;
trailSizeRatio = 1
trailColour = c_white;
trailVariance = 0
for (var i = 0; i < trailNumberOfTrails; i++)
{
	for (var j = 0; j < trailNumberOfPoints; j++)
	vTrail[i,j] = -1;
}

sinScaleVar = 1;
new = 1;
pSys = 0;
pEmitter = 0;