scr_menu_navigate();

#region move to top on hor change

if movedH
{
	sY = 0;
	movedH = 0;
}

#endregion

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
	if sY == 0 
	{
		PlayerStats.activeOffhandID = selection;
		PlayerStats.activeOffhandSubtypeID = current_menu_options[sX,1];
	}
	else
	{
		PlayerStats.activeOffhandSubtypeID = selection;
		PlayerStats.activeOffhandID = current_menu_options[sX,0];
	}
}

#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	audio_play_sound(snd_menu_back,10,0);
	menu = menuCurrent.inventory;
	current_menu_options = menu_inventory;
	sX = 0;
	sY = 0;
}

#endregion