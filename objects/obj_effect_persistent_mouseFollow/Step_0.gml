event_inherited();

x = mouse_x;
y = mouse_y;

if mouse_wheel_up()
{
	radius += 0.4;
	intensity += 0.1;
}
else if mouse_wheel_down()
{
	radius = max(radius-0.4,0);
	intensity = max(intensity-0.1,0);
}

if mouse_check_button_pressed(mb_right)
{
	switch boundEffect
	{
		case obj_effect_base_fire:
			var newEffect = obj_effect_base_ice;
			break;
		case obj_effect_base_ice:
			var newEffect = obj_effect_base_lightning;
			break;
		case obj_effect_base_lightning:
			var newEffect = obj_effect_base_fire;
			break;
	}
	
	instance_destroy(self);
	with instance_create_depth(x,y,depth,object_index) boundEffect = newEffect;
}

if mouse_check_button_pressed(mb_left)
{
	enabled = false;
}

if enabled = false
{
	timer++;
	if timer == round(1*room_speed)
	{
		burst = true;
	}
	if timer >= round(3*room_speed)
	{
		timer= 0;
		enabled = true;
	}
}