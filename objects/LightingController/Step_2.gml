//lighting: reset every frame && draw lights
	//reset
if !variable_instance_exists(id,"light") || !surface_exists(light)
{
	light = surface_create((camera_get_view_width(Camera.cam)+2)*lightScale,(camera_get_view_height(Camera.cam)+2)*lightScale);
}
if !variable_instance_exists(id,"light2") || !surface_exists(light2)
{
	light2 = surface_create((camera_get_view_width(Camera.cam)+2)*lightScale,(camera_get_view_height(Camera.cam)+2)*lightScale);
}
surface_set_target(light);
	var ambientColInv = make_color_rgb(255-color_get_red(ambienceColour),255-color_get_green(ambienceColour),255-color_get_blue(ambienceColour))
	draw_clear(merge_color(ambientColInv,make_colour_rgb(darknessStr*255,darknessStr*255,darknessStr*255),1-ambienceBlendStr));
surface_reset_target();