scr_menu_navigate();

//select
selection = current_menu_options[sX,sY];

#region (start)		Unpause

if (InputManager.startInput)
{
	instance_activate_all();
	InputManager.startInput = false;
	GameManager.pauseState = PauseState.normal;
	surface_free(GameManager.pauseSplash);
	instance_destroy();
}

#endregion
#region (A)			Select

if (InputManager.aInput == true)
{
	audio_play_sound(snd_menu_select,10,0);
	ini_open("settings");
	switch(selection)
	{
		case "Lighting":
			ini_write_real("effects","lighting",!ini_read_real("effects","lighting",true))
			break;
		case "Blood":
			ini_write_real("effects","blood",!ini_read_real("effects","blood",true))
			break;
		case "Rain":
			ini_write_real("effects","rain",!ini_read_real("effects","rain",true))
			break;
		case "Fog":
			ini_write_real("effects","fog",!ini_read_real("effects","fog",true))
			break;
		case "V-Sync":
			ini_write_real("effects","vsync",!ini_read_real("effects","vsync",true))
			break;
		case "Attack Hit Boxes":
			ini_write_real("effects","hitBoxVisuals",!ini_read_real("effects","hitBoxVisuals",false))
			break;
		case "Actor Hit Boxes":
			ini_write_real("effects","actorBoxVisuals",!ini_read_real("effects","actorBoxVisuals",false))					
			break;
	}
	ini_close();
	reset_effects();
	instance_deactivate_object(LightingController);
	instance_deactivate_object(BloodStainController);
	instance_deactivate_object(RainController);
	instance_deactivate_object(FogController);
	instance_deactivate_object(ParallaxController);
	instance_deactivate_object(ParticleController);
}

#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	audio_play_sound(snd_menu_back,10,0);
	menu = menuCurrent.main;
	current_menu_options = menu_main;
	sX = 0;
	sY = 0;
}

#endregion