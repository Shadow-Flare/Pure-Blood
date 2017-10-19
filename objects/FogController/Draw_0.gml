surface_set_target(application_surface);
for (var i = 0; i < array_length_1d(fogSurfaces); i++)
{
	if surface_exists(fogSurfaces[i]) draw_surface_ext(fogSurfaces[i],0,0,1,1,0,c_white,0.15)
}
surface_reset_target();