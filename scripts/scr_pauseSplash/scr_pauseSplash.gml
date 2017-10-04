with GameManager
{
	if !surface_exists(pauseSplash) pauseSplash=surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	surface_set_target(pauseSplash);
		draw_clear_alpha(c_white,0);
		draw_surface(application_surface,0,0);
	surface_reset_target();
}