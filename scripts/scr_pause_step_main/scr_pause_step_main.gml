scr_menu_navigate();

//select
selection = current_menu_options[sX,sY];

#region (start)		Unpause

if (InputManager.startInput)
{
	endingPause = true;
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
			selection = 0;
			slot_options = [];
			movedH = true;
			break;
		case "Weaponry":
			slotExpanded = 0;
			menu = menuCurrent.weaponry;
			current_menu_options = menu_weaponry;
			sX = 0;
			sY = 0;
			break;
		case "Equipment":
			menu = menuCurrent.equipment;
			current_menu_options = menu_equipment;
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
		case "Abilities":
			menu = menuCurrent.abilities;
			current_menu_options = menu_abilities;
			sX = 0;
			sY = 0;
			selection = 0;
			slot_options = [];
			movedH = true;
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
			current_menu_options = menu_settings;
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
	endingPause = true;
}

#endregion