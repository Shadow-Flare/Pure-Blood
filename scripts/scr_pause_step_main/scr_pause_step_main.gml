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
		//do things	
	switch selection
	{
		case "Inventory":
			menu = menuCurrent.inventory;
			current_menu_options = menu_inventory;
			sX = 0;
			sY = 0;
			break;
		case "Combos":
			slotExpanded = 0;
			menu = menuCurrent.combos;
			current_menu_options = menu_combos;
			sX = 0;
			sY = 0;
			break;
		case "Status":
			menu = menuCurrent.status;
			current_menu_options = menu_status;
			sX = 0;
			sY = 0;
				//create temp save data
			changeCheck = false;
			statPointsTemp = PlayerStats.statPoints;
			strengthTemp = PlayerStats.strength;
			constitutionTemp = PlayerStats.constitution;
			dexterityTemp = PlayerStats.dexterity;
			cunningTemp = PlayerStats.cunning;
			intelligenceTemp = PlayerStats.intelligence;
			willpowerTemp = PlayerStats.willpower;
			break;
		case "Settings":
			menu = menuCurrent.settings
			current_menu_options = menu_options;
			sX = 0;
			sY = 0;
			break;
		case "Return to main menu":
			endingGame = true;
			break;
	}
}

#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	audio_play_sound(snd_menu_back,10,0);
	ini_open("settings");
		var vSyncSetting = ini_read_real("effects","vsync",true)
		if GameManager.vSyncToggle != vSyncSetting
		{
			GameManager.vSyncToggle = vSyncSetting;
			display_reset(0,GameManager.vSyncToggle);
		}
	ini_close();
	instance_activate_all();
	InputManager.bInput = false;
	GameManager.pauseState = PauseState.normal;
	surface_free(GameManager.pauseSplash);
	instance_destroy();
}

#endregion

#region end game
if endingGame
{
	room_goto(rmMainMenu);
	instance_destroy(all);
}
#endregion