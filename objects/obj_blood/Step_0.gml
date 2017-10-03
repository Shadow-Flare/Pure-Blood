timer++;

if timer >= room_speed*hoverDuration && phase == "hovering"
{
	phase = "falling"
}

if phase == "hovering"
{
	vspeed -= vspeed/60;
	hspeed -= hspeed/60;
}
else if phase == "falling"
{
	vspeed += GameManager.grav*0.75;
	image_angle = 0;
	initialScale = image_xscale;
}

if !place_free(x,y) && phase == "falling"
{
	image_xscale=initialScale*1.5;
	image_yscale=initialScale*1.5;
	vspeed = 0;
	hspeed = 0;
	phase = "splatting"
}