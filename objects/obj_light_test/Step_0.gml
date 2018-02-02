event_inherited();

lightSize = radius;
colour = make_color_rgb(colourR,colourG,colourB);

if canFollow
{
	x = mouse_x;
	y = mouse_y;
}

var camX = camera_get_view_x(Camera.cam);
var camY = camera_get_view_y(Camera.cam);
var camW = camera_get_view_width(Camera.cam);
var camH = camera_get_view_height(Camera.cam);

if abs(x-camX) > camW+maxLightSize || abs(y-camY) > camH+maxLightSize enabled = false;
else enabled = true;

if canFollow && mouse_check_button_pressed(mb_left)
{
	with instance_copy(false)
	{
		canFollow = false;
		occlusionMap = noone;
		shadowMap1D = noone;		
	}
}