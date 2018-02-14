//change angle with speed
if hitOn image_angle = point_direction(0,0,xSpd,ySpd)-90

//draw trail
scr_draw_trail(hitOn,trailDuration,trailNumberOfTrails,trailNumberOfPoints,trailColour,trailSizeRatio,trailVariance,1,0,0);

//fade out
if lifeTime > room_speed*6
{
	image_alpha = (1-((lifeTime-room_speed*6)/room_speed*2))
}

draw_self();