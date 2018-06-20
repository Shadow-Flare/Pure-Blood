event_inherited();

if hasBeenLandedOn
{
	ySpd += hasBeenLandedOnSpeed/2;
	hasBeenLandedOn = false;
}

if enabled image_alpha = 1.0;
else image_alpha = 0.5;

var displacement = targetHeight-y;
ySpd += tension*displacement - dampening*ySpd;

xSpdSim = xSpd;
ySpdSim = ySpd;