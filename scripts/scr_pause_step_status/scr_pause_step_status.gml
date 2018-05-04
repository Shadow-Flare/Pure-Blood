#region movement inputs
var maxRunes = PlayerStats.runeSize;
var inputH = InputManager.moveInputH+InputManager.dRInput-InputManager.dLInput;
var inputV = InputManager.moveInputV+InputManager.dDInput-InputManager.dUInput;
if equipCanMove
{
	if abs(inputH) >= 0.7
	{
		inputH = sign(inputH);
		equipCanMove = false;
	}
	else if abs(inputV) >= 0.7
	{
		inputV = sign(inputV);
		equipCanMove = false;
	}
	else
	{
		inputH = 0;
		inputV = 0;
	}
}
else
{
	if abs(inputH) <= 0.4 && abs(inputV) <= 0.4 equipCanMove = true;	
	inputH = 0;
	inputV = 0;
}
#endregion
#region apply movement
if PlayerStats.statPoints != 0 || statPointsTemp != 0
{
	if sY = noone sY = 0;
	if inputV != 0
	{
		sY += inputV;
		if sY > array_length_2d(menu_status,0)-1 sY = 0;
		if sY < 0 sY = array_height_2d(menu_status)-1;
	}
}
else sY = noone;
#endregion

//select
if sY != noone selection = current_menu_options[sX,sY];
else selection = noone;

#region determine status menu "changeCheck"

if statPointsTemp == PlayerStats.statPoints changeCheck = false;
else changeCheck = true;

#endregion
#region alter stat

if inputH != 0
{
	var canShiftThisWay = PlayerStats.statPoints-inputH == clamp(PlayerStats.statPoints-inputH,0,statPointsTemp);
	switch selection
	{
		case "Strength":
			if canShiftThisWay && PlayerStats.strengthBase+inputH >= strengthTemp
			{
				PlayerStats.strengthBase += inputH;
				PlayerStats.statPoints -= inputH;
			}
			break;
		case "Constitution":
			if canShiftThisWay && PlayerStats.constitutionBase+inputH >= constitutionTemp
			{
				PlayerStats.constitutionBase += inputH;
				PlayerStats.statPoints -= inputH;
			}
			break;
		case "Dexterity":
			if canShiftThisWay && PlayerStats.dexterityBase+inputH >= dexterityTemp
			{
				PlayerStats.dexterityBase += inputH;
				PlayerStats.statPoints -= inputH;
			}
			break;
		case "Cunning":
			if canShiftThisWay && PlayerStats.cunningBase+inputH >= cunningTemp
			{
				PlayerStats.cunningBase += inputH;
				PlayerStats.statPoints -= inputH;
			}
			break;
		case "Intelligence":
			if canShiftThisWay && PlayerStats.intelligenceBase+inputH >= intelligenceTemp
			{
				PlayerStats.intelligenceBase += inputH;
				PlayerStats.statPoints -= inputH;
			}
			break;
		case "Willpower":
			if canShiftThisWay && PlayerStats.willpowerBase+inputH >= willpowerTemp
			{
				PlayerStats.willpowerBase += inputH;
				PlayerStats.statPoints -= inputH;
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
		//update temp save data
	statPointsTemp = PlayerStats.statPoints;
	strengthTemp = PlayerStats.strengthBase;
	constitutionTemp = PlayerStats.constitutionBase;
	dexterityTemp = PlayerStats.dexterityBase;
	cunningTemp = PlayerStats.cunningBase;
	intelligenceTemp = PlayerStats.intelligenceBase;
	willpowerTemp = PlayerStats.willpowerBase;
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
	PlayerStats.strengthBase = strengthTemp;
	PlayerStats.constitutionBase = constitutionTemp;
	PlayerStats.dexterityBase = dexterityTemp;
	PlayerStats.cunningBase = cunningTemp;
	PlayerStats.intelligenceBase = intelligenceTemp;
	PlayerStats.willpowerBase = willpowerTemp;
}

#endregion
#region (Y)			Cycle Page

if InputManager.yInput == true
{
	audio_play_sound(snd_menu_navigate,10,0);
	statusPage++;
	if statusPage > statusPageNum-1 statusPage = 0;
}

#endregion