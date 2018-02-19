//change angle with speed
var angle = point_direction(0,0,xSpd,ySpd)
if hitOn image_angle = angle-90

//draw trail
if angle > 90 && angle < 270 y--;
x+=0.5;
y+=0.5;
scr_draw_trail(hitOn,trailNumberOfTrails,trailDuration,trailNumberOfPoints,trailColour,trailSizeRatio,trailVariance,1,0,0);
if hitOn == 2 hitOn = 0;
x-=0.5;
y-=0.5;
if angle > 90 && angle < 270 y++;

//fade out
if lifeTime > room_speed*6
{
	image_alpha = (1-((lifeTime-room_speed*6)/room_speed*2))
}

draw_self();