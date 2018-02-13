if !initialized
{
	if boundEffect == noone instance_destroy(self);
	else
	{
		event_perform_object(boundEffect,ev_create,0);
		initialized = true;
	}
}

if initialized event_perform_object(boundEffect,ev_step,ev_step_normal);