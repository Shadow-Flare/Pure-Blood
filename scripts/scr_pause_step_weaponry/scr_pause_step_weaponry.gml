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
		weaponryMaxMemory = floor(PlayerStats.memory);
			//refresh memory usage
		weaponrySubtypeMemoryUsage = 0;
		weaponryActiveMemoryUsage = 0;
				//subtype
		var cache = PlayerStats.subtypeCache;
		for(var i = 0; i < ds_list_size(cache); i++) weaponrySubtypeMemoryUsage += subtype_get_stat(cache[| i], offhandSubtypeStats.memoryUsage);
				//actives
		var cache = PlayerStats.activeCache;
		for(var i = 0; i < ds_list_size(cache); i++) weaponryActiveMemoryUsage += activeAbility_get_stat(cache[| i], activeAbilityStats.memoryUsage);
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
		var sYPrevTemp = sY;
		
			//max height
		weaponryMaxSY = array_length_2d(current_menu_options,0);
			//perform move
		var cap = array_length_2d(current_menu_options,0)-1;
		sY+=vInput;
		if sY > cap sY = 0;
		else if sY < 0 sY = cap;
			//if on the gap slot move twice to skip, if still on gap just revert
		if current_menu_options[0, sY] == noone	sY = clamp(sY+vInput,0,weaponryMaxSY-1);
		if current_menu_options[0, sY] == noone sY = sYPrevTemp;
		
		if sY != sYPrevTemp weaponryGroundComboSelected = true;
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
				//get maxNum
			if weaponryGroundComboSelected var maxNum = class_get_stat(currentClass,weaponClassStats.numOfSubtypes)-1;		//the condition here is a shared variable with main types, not reason not to. couldnt be bothered changing the name.
			else var maxNum = class_get_stat(currentClass,weaponClassStats.numOfActives)-1;
				//hInput
			sExpX+=hInput;
			if sExpX > maxNum sExpX = 0;
			else if sExpX < 0 sExpX = maxNum;
				//vInput
			var desired = sExpX+vInput*weaponrySubtypeIconRowSize;
			if desired <= maxNum && desired >= 0 sExpX = desired;
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
	instance_destroy(weaponryBoundEffectSim);
	if !slotExpanded
	{
		slotExpanded = true;
		groundComboSelected = true;
		weaponrySExpYDisplayDifference = 0;
		audio_play_sound(snd_menu_select,10,0)
	}
	else
	{
		if isMain
		{
			var attackIndex = sX;
			if !isCombo attackIndex-=m;
			combo_set(currentClass,selectedType,attackIndex,weaponryComboList[| sExpY]);
			audio_play_sound(snd_menu_select,10,0);
		}
		else
		{	
			if weaponryGroundComboSelected
			{
				if weaponrySubtypeList[| sExpX] != noone
				{
					var subList = PlayerStats.subtypeCache;
					var selectedSubID = weaponrySubtypeList[| sExpX];
					var selectedSubEnabledIndex = weaponrySubtypeIndexList[| sExpX];
					var subListIndex = ds_list_find_index(subList,selectedSubID)
						//disable
					if selectedSubEnabledIndex != -1
					{
						if ds_list_size(subList) > 1
						{
							scr_player_subtype_manage(selectedSubID,ownedSubtypeStats.enabled,false);
							audio_play_sound(snd_menu_select,10,0);
						}
						else audio_play_sound(snd_menu_back,10,0);
					}
						//enable
					else if	weaponrySubtypeMemoryUsage+subtype_get_stat(selectedSubID, offhandSubtypeStats.memoryUsage) <= weaponryMaxMemory
					{
						scr_player_subtype_manage(selectedSubID,ownedSubtypeStats.enabled,true);
						scr_player_subtype_manage(selectedSubID,ownedSubtypeStats.enabledIndex,ds_list_size(subList));
					}
						//fail
					else
					{
						audio_play_sound(snd_menu_back,10,0);		//make some fail audio.
					}
				}
				else
				{
					audio_play_sound(snd_menu_back,10,0);		//make some fail audio.
				}
			}
			else
			{
				if weaponryActiveList[| sExpX] != noone
				{
					var subList = PlayerStats.activeCache;
					var selectedSubID = weaponryActiveList[| sExpX];
					var selectedSubEnabledIndex = weaponryActiveIndexList[| sExpX];
					var subListIndex = ds_list_find_index(subList,selectedSubID)
					if selectedSubEnabledIndex != -1		//disable
					{
						if ds_list_size(subList) > 1
						{
							scr_player_active_manage(selectedSubID,ownedActiveStats.enabled,false);
							audio_play_sound(snd_menu_select,10,0);
						}
						else audio_play_sound(snd_menu_back,10,0);
					}
					else if	weaponryActiveMemoryUsage+activeAbility_get_stat(selectedSubID, activeAbilityStats.memoryUsage) <= weaponryMaxMemory
					{
						scr_player_active_manage(selectedSubID,ownedActiveStats.enabled,true);
						scr_player_active_manage(selectedSubID,ownedActiveStats.enabledIndex,ds_list_size(subList));
					}
						//fail
					else
					{
						audio_play_sound(snd_menu_back,10,0);		//make some fail audio.
					}
				}
				else
				{
					audio_play_sound(snd_menu_back,10,0);		//make some fail audio.
				}
			}
			scr_player_update_offhand_caches();
		}
	}
}
#endregion
#region (B)					Back
var exitingWeaponry = false;
if InputManager.bInput
{
	instance_destroy(weaponryBoundEffectSim);
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
	instance_destroy(weaponryBoundEffectSim);
	if slotExpanded
	{
		weaponryGroundComboSelected = !weaponryGroundComboSelected;
		sExpX = 0;
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
		weaponryMaxMemory = floor(PlayerStats.memory);
			//refresh memory usage
		weaponrySubtypeMemoryUsage = 0;
		weaponryActiveMemoryUsage = 0;
				//subtype
		var cache = PlayerStats.subtypeCache;
		for(var i = 0; i < ds_list_size(cache); i++) weaponrySubtypeMemoryUsage += subtype_get_stat(cache[| i], offhandSubtypeStats.memoryUsage);
				//actives
		var cache = PlayerStats.activeCache;
		for(var i = 0; i < ds_list_size(cache); i++) weaponryActiveMemoryUsage += activeAbility_get_stat(cache[| i], activeAbilityStats.memoryUsage);
	}
}
#endregion
#region refresh options
if !exitingWeaponry
{
	ds_list_clear(weaponryComboList);
	ds_list_clear(weaponrySubtypeList);
	ds_list_clear(weaponrySubtypeIndexList);
	ds_list_clear(weaponryActiveList);
	ds_list_clear(weaponryActiveIndexList);
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
	else
	{
			//subtypes
		var cache = ComboCache.playerOffhandSubtype;
		var maxSlots = class_get_stat(currentClass,weaponClassStats.numOfSubtypes);
		repeat(maxSlots) {ds_list_add(weaponrySubtypeList,noone); ds_list_add(weaponrySubtypeIndexList,-1);};
		
		var comID = ds_map_find_first(cache);
		while comID != undefined
		{
			var comType = subtype_get_stat(comID,offhandSubtypeStats.offhandType);
			var comIndex = subtype_get_stat(comID,offhandSubtypeStats.index);

			if  comType == currentClass
			{
				weaponrySubtypeList[| comIndex] = comID;
				weaponrySubtypeIndexList[| comIndex] = scr_player_subtype_get(comID,ownedSubtypeStats.enabledIndex);
			}
			comID = ds_map_find_next(cache,comID);
		}
			//abilities
		var cache = ComboCache.playerActiveAbility;
		var maxSlots = class_get_stat(currentClass,weaponClassStats.numOfActives);
		repeat(maxSlots) {ds_list_add(weaponryActiveList,noone); ds_list_add(weaponryActiveIndexList,-1);};
		
		var comID = ds_map_find_first(cache);
		while comID != undefined
		{
			var comType = activeAbility_get_stat(comID,activeAbilityStats.offhandType);
			var comIndex = activeAbility_get_stat(comID,activeAbilityStats.index);

			if  comType == currentClass
			{
				weaponryActiveList[| comIndex] = comID;
				weaponryActiveIndexList[| comIndex] = scr_player_active_get(comID,ownedActiveStats.enabledIndex);
			}
			comID = ds_map_find_next(cache,comID);
		}		
	}
}
#endregion
#region for mains: modify sExpY on changes play sound and reset animation timer
if isMain
{
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
}
if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev || weaponryGroundComboSelected != weaponryGroundComboSelectedPrev
{
	audio_play_sound(snd_menu_navigate,10,0);
	weaponryDetailsAnimationTimer = 0;
	weaponryDetailsSelectedHit = 0;
	weaponryDetailsSelectedHitDisplay = 0;
}
#endregion