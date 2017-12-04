//lighting: reset every frame && draw lights
	//reset
if !variable_instance_exists(id,"light") || !surface_exists(light)
{
	light = surface_create((camera_get_view_width(Camera.cam)+2)*lightScale,(camera_get_view_height(Camera.cam)+2)*lightScale);
}
surface_set_target(light);
	draw_clear(make_colour_rgb(darknessStr*255,darknessStr*255,darknessStr*255));
surface_reset_target();