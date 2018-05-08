if !initialized
{
	if boundEffect == noone instance_destroy(self);
	else
	{
		event_perform_object(boundEffect,ev_create,0);
		simOveride = true;
		if boundEffect = obj_effect_base_dark forceInvert = true;
		initialized = true;
	}
}

if initialized event_perform_object(boundEffect,ev_step,ev_step_normal);