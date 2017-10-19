if phase == "splatting"
{
	if instance_exists(BloodStainController)
	{
		surface_set_target(BloodStainController.blood);
		draw_self();
		surface_reset_target();
	}
	instance_destroy();
}
else draw_self();