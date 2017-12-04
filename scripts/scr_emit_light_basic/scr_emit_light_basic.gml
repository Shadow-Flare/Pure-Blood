///@arg alpha
///@arg lightScale
var alpha = argument0;
var lightScale = argument1;

with obj_light_parent
{
	col = make_color_rgb(colour_get_red(colour)*alpha,colour_get_green(colour)*alpha,colour_get_blue(colour)*alpha)

	///// DRAW SURFACE \\\\\

	var xCam = camera_get_view_x(Camera.cam);
	var yCam = camera_get_view_y(Camera.cam);

	surface_set_target(LightingController.light);
		gpu_set_blendmode(bm_subtract)
			var LSH = lightSize/2;
			draw_ellipse_colour((x-LSH-xCam)*lightScale,(y-LSH-yCam)*lightScale,(x+LSH-xCam)*lightScale,(y+LSH-yCam)*lightScale,col,c_black,0);
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
}