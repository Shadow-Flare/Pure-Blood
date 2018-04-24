lifeTimer++;

if lifeTimer >= round(duration*room_speed)
{
	instance_destroy();
}

if follow
{
	x = caster.x;
	y = caster.y;
}
else
{
	if slowdownFactor != 0
	{
		xSpd-=xSpd*slowdownFactor;
		ySpd-=ySpd*slowdownFactor;
	}
	
	x+=xSpd;
	y+=ySpd;
}

if alphaAdd != undefined image_alpha += alphaAdd;
if xScaleGrowth != undefined image_xscale *= xScaleGrowth;
if yScaleGrowth != undefined image_yscale *= yScaleGrowth;