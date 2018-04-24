//scr_menu_navigate();
#region get data
	var currentClass = current_menu_options[0, sY];
	var isMain = class_get_stat(currentClass,weaponClassStats.isMain);
	if isMain
	{
		var maxComboLength = combo_get_length(currentClass,weaponComboTypes.groundCombo);
		var maxFinisherLength = combo_get_length(currentClass,weaponComboTypes.groundFinisher);
		var maxAirComboLength = combo_get_length(currentClass,weaponComboTypes.aerialCombo);
		var maxAirFinisherLength = combo_get_length(currentClass,weaponComboTypes.aerialFinisher);
		
		if weaponryGroundComboSelected var m = maxComboLength;
		else var m = maxAirComboLength;
		var isCombo = sX < m;
		
		if		 weaponryGroundComboSelected &&  isCombo var selectedType = weaponComboTypes.groundCombo;
		else if  weaponryGroundComboSelected && !isCombo var selectedType = weaponComboTypes.groundFinisher;
		else if !weaponryGroundComboSelected &&  isCombo var selectedType = weaponComboTypes.aerialCombo;
		else if !weaponryGroundComboSelected && !isCombo var selectedType = weaponComboTypes.aerialFinisher;
	}
	else
	{
		
	}
#endregion

#region unique navigation: get inputs

//prev
sXPrev = sX;
sYPrev = sY;
sExpYPrev = sExpY;
sExpXPrev = sExpX;

	//Move Input
//checks
var absHInput = abs(InputManager.moveInputH);
var absVInput = abs(InputManager.moveInputV);
var horInputMoreThanVert = absHInput >= absVInput;

//Determine movement (vInput/hInput)
var vInput = 0, hInput = 0;
if  (moveTimer == 0) || 
	(moveTimer >= ceil(0.3 * room_speed) && moveTimer < ceil(1.0 * room_speed) && floor(moveTimer % (ceil(0.35 * room_speed))) == 0) ||
	(moveTimer >= ceil(1.0 * room_speed) && floor(moveTimer%(ceil((1 / 10) * room_speed))) == 0)
{
	if (absHInput > 0.5 && horInputMoreThanVert) hInput = sign(InputManager.moveInputH);
	else 
	{
		if InputManager.dRInput hInput++;
		if InputManager.dLInput hInput--;
	}

	if (absVInput > 0.5 && !horInputMoreThanVert) vInput = sign(InputManager.moveInputV);
	else
	{
		if InputManager.dDInput vInput++;
		if InputManager.dUInput vInput--;
	}
}

if (absHInput > 0.5 || absVInput > 0.5 || InputManager.dLInput || InputManager.dRInput || InputManager.dUInput || InputManager.dDInput)
{
	moveTimer++;
}
else moveTimer = 0;

	//Right stick Movement
//checks
var absHInput = abs(InputManager.targetInputH);
var absVInput = abs(InputManager.targetInputV);
var horInputMoreThanVert = absHInput >= absVInput;

//Determine movement (targetVInput/targetHInput)
var targetVInput = 0, targetHInput = 0;
if  (targetTimer == 0) || 
	(targetTimer >= ceil(0.3 * room_speed) && targetTimer < ceil(1.0 * room_speed) && floor(targetTimer % (ceil(0.35 * room_speed))) == 0) ||
	(targetTimer >= ceil(1.0 * room_speed) && floor(targetTimer%(ceil((1 / 10) * room_speed))) == 0)
{
	if (absHInput > 0.5 && horInputMoreThanVert) targetHInput = sign(InputManager.targetInputH);

	if (absVInput > 0.5 && !horInputMoreThanVert) targetVInput = sign(InputManager.targetInputV);
}

if (absHInput > 0.5 || absVInput > 0.5)
{
	targetTimer++;
}
else targetTimer = 0;
#endregion
#region unique navigation: apply movement
if weaponryExpandValue == 1 || weaponryExpandValue == 0
{
	if !slotExpanded
	{
			//REMOVE THIS: for the "REMOVE THIS: dont let selection move to offhands" in short
		var sYPrevTemp = sY;
		
			//max height
		weaponryMaxSY = array_length_2d(current_menu_options,0);
			//perform move
		sY = clamp(sY+vInput,0,array_length_2d(current_menu_options,0)-1);
			//if on the gap slot move twice to skip, if still on gap just revert
		if current_menu_options[0, sY] == noone	sY = clamp(sY+vInput,0,weaponryMaxSY-1);
		if current_menu_options[0, sY] == noone sY = sYPrevTemp;
		
			//REMOVE THIS: dont let selection move to offhands
		var tempCurrentClass = current_menu_options[0, sY];
		var tempIsMain = class_get_stat(tempCurrentClass,weaponClassStats.isMain);
		if !tempIsMain sY = sYPrevTemp;
	}
	else
	{
		if isMain
		{
				//main movement
			if weaponryGroundComboSelected var wholeMax = maxComboLength+maxFinisherLength
			else var wholeMax = maxAirComboLength+maxAirFinisherLength
			sX = clamp(sX+hInput,0,wholeMax-1);
			sExpY = clamp(sExpY+vInput,0,ds_list_size(weaponryComboList)-1);	//replace one with combos in list
			if sX == sXPrev 
			{
				if sExpY > sExpYPrev weaponrySExpYDisplayDifference = 1;
				else if sExpY < sExpYPrev weaponrySExpYDisplayDifference = -1;
			}
				//hitnum movement
			var selectedComboID = weaponryComboList[| sExpY];
			var hitNum = ds_list_size(combo_get_stat(selectedComboID,comboStats.damMod));
			weaponryDetailsSelectedHit+=targetHInput;
			if weaponryDetailsSelectedHit < 0 weaponryDetailsSelectedHit = hitNum-1;
			else if weaponryDetailsSelectedHit >= hitNum weaponryDetailsSelectedHit = 0;
		}
		else
		{
		
		}
	}
}
#endregion

#region (Start)				Unpause
if InputManager.startInput
{
	endingPause = true;
}
#endregion
#region (A)					Select
if InputManager.aInput
{
	if !slotExpanded
	{
		slotExpanded = true;
		groundComboSelected = true;
		weaponrySExpYDisplayDifference = 0;
		audio_play_sound(snd_menu_select,10,0)
	}
	else
	{
		var attackIndex = sX;
		if !isCombo attackIndex-=m;
		combo_set(currentClass,selectedType,attackIndex,weaponryComboList[| sExpY]);
		audio_play_sound(snd_menu_select,10,0)
	}
}
#endregion
#region (B)					Back
var exitingWeaponry = false;
if InputManager.bInput
{
	if slotExpanded
	{
		slotExpanded = false;
		audio_play_sound(snd_menu_back,10,0)
	}
	else
	{
		exitingWeaponry = true;
		menu = menuCurrent.main;
		current_menu_options = menu_main;
		sX = 0;
		sY = 1;
	}
}
#endregion
#region (Y)					Toggle air/ground combo
var weaponryGroundComboSelectedPrev = weaponryGroundComboSelected;
if InputManager.yInput
{
	if slotExpanded
	{
		weaponryGroundComboSelected = !weaponryGroundComboSelected;
		audio_play_sound(snd_menu_navigate,10,0)
	}
}
#endregion

#region re-get data (mirror region at line 2)
if !exitingWeaponry
{
	var currentClass = current_menu_options[0, sY];
	var isMain = class_get_stat(currentClass,weaponClassStats.isMain);
	if isMain
	{
		var maxComboLength = combo_get_length(currentClass,weaponComboTypes.groundCombo);
		var maxFinisherLength = combo_get_length(currentClass,weaponComboTypes.groundFinisher);
		var maxAirComboLength = combo_get_length(currentClass,weaponComboTypes.aerialCombo);
		var maxAirFinisherLength = combo_get_length(currentClass,weaponComboTypes.aerialFinisher);
		
		if weaponryGroundComboSelected var m = maxComboLength;
		else var m = maxAirComboLength;
		var isCombo = sX < m;
		
		if		 weaponryGroundComboSelected &&  isCombo var selectedType = weaponComboTypes.groundCombo;
		else if  weaponryGroundComboSelected && !isCombo var selectedType = weaponComboTypes.groundFinisher;
		else if !weaponryGroundComboSelected &&  isCombo var selectedType = weaponComboTypes.aerialCombo;
		else if !weaponryGroundComboSelected && !isCombo var selectedType = weaponComboTypes.aerialFinisher;
	}
	else
	{
		
	}
}
#endregion
#region refresh slot options
if !exitingWeaponry
{
	ds_list_clear(weaponryComboList);
	if isMain
	{
		var comID = ds_map_find_first(ComboCache.combo);
		while comID != undefined
		{
			var comClass = combo_get_stat(comID,comboStats.class);
			var comType = combo_get_stat(comID,comboStats.type);
			if  comClass == currentClass && comType = selectedType
			{
				ds_list_add(weaponryComboList,comID);
			}
			comID = ds_map_find_next(ComboCache.combo,comID);
		}
	}
}
#endregion
#region modify sExpY on changes play sound and reset animation timer
if sX != sXPrev || weaponryGroundComboSelected != weaponryGroundComboSelectedPrev
{
	var index = sX;
	if !isCombo index-=m
	var comID = combo_get_id(currentClass,selectedType,index);
	for(var i = 0; i < ds_list_size(weaponryComboList); i++)
	{
		if weaponryComboList[| i] == comID
		{
			sExpY = i;
			weaponrySExpYDisplayDifference = 0;
			break;
		}
	}
}

if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev || weaponryGroundComboSelected != weaponryGroundComboSelectedPrev
{
	audio_play_sound(snd_menu_navigate,10,0);
	weaponryDetailsAnimationTimer = 0;
	weaponryDetailsSelectedHit = 0;
	weaponryDetailsSelectedHitDisplay = 0;
}
#endregion