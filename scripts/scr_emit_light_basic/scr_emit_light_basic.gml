///// DRAW SURFACE \\\\\
var lS = argument0;
var bS = lS/8;
var spriteW = sprite_get_width(spr_glow);
var spriteH = sprite_get_height(spr_glow);
var c = argument1;

var xCam = camera_get_view_x(Camera.cam);
var yCam = camera_get_view_y(Camera.cam);

surface_set_target(obj_controller.light);

gpu_set_blendmode(bm_subtract)
	//regular light
	/*
	if !variable_instance_exists(id,"num1") {num1 = random(360); num2 = random(360);}
	if global.time%5 = 0
	{
		num1 = random(360);
		num2 = random(360);
	}
	draw_sprite_ext(spr_glow,0,x,y,lS/spriteW,lS/spriteH,num1,c,0.5);
	draw_sprite_ext(spr_glow,0,x,y,lS/spriteW,lS/spriteH,num2,c,0.5);
	*/
	
	draw_ellipse_color(x-lS/2-xCam,y-lS/2-yCam,x+lS/2-xCam,y+lS/2-yCam,c,c_black,0);
	
	//bloom
	//draw_ellipse_colour(x-bS/2,y-bS/2,x+bS/2,y+bS/2,merge_color(c,c_white,0.3),c_black,0);
gpu_set_blendmode(bm_normal);

surface_reset_target();