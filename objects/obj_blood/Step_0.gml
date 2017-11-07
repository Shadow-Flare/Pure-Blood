timer++;

	//kill if too far out of screen (is allowed to be directly above room due to gravity)
var borderWidth = 10;
if x < -borderWidth || x > room_width+borderWidth || y > room_height+borderWidth
{
	instance_destroy();
}

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

if hasDrawn
{
	if random(1) < 1/5
	{
		if BloodStainController.lastBloodSound != noone audio_stop_sound(BloodStainController.lastBloodSound)
		BloodStainController.lastBloodSound = audio_play_sound(snd_bloodSplat,10,0);
	}
	instance_destroy();
}