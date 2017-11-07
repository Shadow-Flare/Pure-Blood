scr_menu_navigate();

//select
selection = current_menu_options[sX,sY];

#region determine status menu "changeCheck"

if statPointsTemp == PlayerStats.statPoints changeCheck = false;
else changeCheck = true;

#endregion
#region alter stat

if InputManager.dRInput || InputManager.dLInput && !(InputManager.dRInput && InputManager.dLInput)
{
	switch selection
	{
		case "Strength":
			if InputManager.dRInput && PlayerStats.statPoints != 0
			{
				PlayerStats.strength++;
				PlayerStats.statPoints--;
			}
			if InputManager.dLInput && PlayerStats.strength != strengthTemp
			{
				PlayerStats.strength--;
				PlayerStats.statPoints++;
			}
			break;
		case "Constitution":
			if InputManager.dRInput && PlayerStats.statPoints != 0
			{
				PlayerStats.constitution++;
				PlayerStats.statPoints--;
			}
			if InputManager.dLInput && PlayerStats.constitution != constitutionTemp
			{
				PlayerStats.constitution--;
				PlayerStats.statPoints++;
			}
			break;
		case "Dexterity":
			if InputManager.dRInput && PlayerStats.statPoints != 0
			{
				PlayerStats.dexterity++;
				PlayerStats.statPoints--;
			}
			if InputManager.dLInput && PlayerStats.dexterity != dexterityTemp
			{
				PlayerStats.dexterity--;
				PlayerStats.statPoints++;
			}
			break;
		case "Cunning":
			if InputManager.dRInput && PlayerStats.statPoints != 0
			{
				PlayerStats.cunning++;
				PlayerStats.statPoints--;
			}
			if InputManager.dLInput && PlayerStats.cunning != cunningTemp
			{
				PlayerStats.cunning--;
				PlayerStats.statPoints++;
			}
			break;
		case "Intelligence":
			if InputManager.dRInput && PlayerStats.statPoints != 0
			{
				PlayerStats.intelligence++;
				PlayerStats.statPoints--;
			}
			if InputManager.dLInput && PlayerStats.intelligence != intelligenceTemp
			{
				PlayerStats.intelligence--;
				PlayerStats.statPoints++;
			}
			break;
		case "Willpower":
			if InputManager.dRInput && PlayerStats.statPoints != 0
			{
				PlayerStats.willpower++;
				PlayerStats.statPoints--;
			}
			if InputManager.dLInput && PlayerStats.willpower != willpowerTemp
			{
				PlayerStats.willpower--;
				PlayerStats.statPoints++;
			}
			break;
	}
}

#endregion

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
		case "Accept":
				//update temp save data
			statPointsTemp = PlayerStats.statPoints;
			strengthTemp = PlayerStats.strength;
			constitutionTemp = PlayerStats.constitution;
			dexterityTemp = PlayerStats.dexterity;
			cunningTemp = PlayerStats.cunning;
			intelligenceTemp = PlayerStats.intelligence;
			willpowerTemp = PlayerStats.willpower;
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
		//revert to temp save data
	PlayerStats.statPoints = statPointsTemp;
	PlayerStats.strength = strengthTemp;
	PlayerStats.constitution = constitutionTemp;
	PlayerStats.dexterity = dexterityTemp;
	PlayerStats.cunning = cunningTemp;
	PlayerStats.intelligence = intelligenceTemp;
	PlayerStats.willpower = willpowerTemp;
}

#endregion