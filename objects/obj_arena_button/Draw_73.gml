if pausing
{
	pausing = 0;
	scr_pauseSplash();
	instance_create_layer(0,0,layer_get_id("lay_interactables"),ArenaSettingsManager);
}