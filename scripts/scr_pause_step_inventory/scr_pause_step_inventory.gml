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
	switch selection
	{
		case "Items":
			menu = menuCurrent.items;
			current_menu_options = menu_items;
			sX = 0;
			sY = 0;
			break;
		case "Weapons":
			
			break;
		case "Offhand Equipment":
			menu = menuCurrent.offhand;
			current_menu_options = menu_offhand_equipment;
			sX = 0;
			sY = 0;
			for(var i = 0; i < array_length_1d(PlayerStats.ownedOffhands); i++)
			{
				for(var j = 0; j < array_length_2d(PlayerStats.ownedSubtypes,i)+1; j++)
				{
					if j == 0 current_menu_options[i, 0] = PlayerStats.ownedOffhands[i]
				else if j != 0 current_menu_options[i, j] = PlayerStats.ownedSubtypes[i,j-1];
				}
			}
			break;
	}
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