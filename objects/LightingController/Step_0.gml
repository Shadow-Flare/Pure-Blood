//lighting: reset every frame && draw lights
	//reset
if !surface_exists(light)
{
	light = surface_create(camera_get_view_width(Camera.cam),camera_get_view_height(Camera.cam));
}
surface_set_target(light);
	draw_clear(make_colour_rgb(darknessStr*255,darknessStr*255,darknessStr*255));
surface_reset_target();

	//draw lights
with(obj_light_parent)
{
	lifeTime++
	sizeMod = sin((lifeTime*pi)/(60/iterationsPerSec))*variance

	lightSize = radius+sizeMod;

	scr_emit_light_basic(lightSize,colour);
}