var destroy = false; 
if !initialized
{
	initialized = true;
	if sprite_index = noone || ID == noone
	{
		show_debug_message("Destructible Exit not properly declared");
		destroy = true;
	}
	
	if WorldCache.environment[? ID] == true
	{
		destroy = true;
	}

	switch image_angle
	{
		case 0:
			image_index = 1;
			break;
		case 90:
			image_index = 2;
			y-=sprite_height;
			break;
		case 180: 
			image_index = 0;
			y-=sprite_height;
			x-=sprite_width;
			break;
		case 270:
			image_index = 3;
			x-=sprite_width;
			break;
	}
	xInitial = x;
	yInitial = y;
	image_angle = 0;
}

event_perform_object(obj_hitable,ev_step,ev_step_normal);
event_inherited();

if staggerTaken >= breakStagger
{
	WorldCache.environment[? ID] = true;
	destroy = true;
}
else if staggerTaken >= 1
{
	shakeTimer = round(shakeDuration*room_speed);
	xMod = dcos(image_angle);
	yMod = dsin(image_angle);
}

x = xInitial+(random(2)-1)*(shakeTimer/round(shakeDuration*room_speed))*shakeAmount*xMod;
y = yInitial+(random(2)-1)*(shakeTimer/round(shakeDuration*room_speed))*shakeAmount*yMod;

shakeTimer = max(shakeTimer-1,0);

if damageTaken > 0 || staggerTaken > 0 || knockbackTaken > 0
{
	damageTaken = 0;
	staggerTaken = 0;
	knockbackTaken = 0;
}

if destroy instance_destroy();