///// DRAW SURFACE \\\\\
var lS = argument0;
var bS = lS/8;
var spriteW = sprite_get_width(spr_glow);
var spriteH = sprite_get_height(spr_glow);
var c = argument1;

var xCam = camera_get_view_x(Camera.cam);
var yCam = camera_get_view_y(Camera.cam);

surface_set_target(LightingController.light);
	gpu_set_blendmode(bm_subtract)
		draw_ellipse_color(x-lS/2-xCam,y-lS/2-yCam,x+lS/2-xCam,y+lS/2-yCam,c,c_black,0);
	gpu_set_blendmode(bm_normal);
surface_reset_target();