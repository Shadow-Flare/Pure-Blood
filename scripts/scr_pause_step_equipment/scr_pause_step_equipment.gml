#region Equipment unique movement
if !slotExpanded
{
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
	#region alter selection
switch selection
{
	case equipmentSlot.rune:
		sExpY += inputH;
		if sExpY >= maxRunes sExpY = 0;
		else if sExpY < 0 sExpY = maxRunes-1;
		
		if inputV == 1 selection = equipmentSlot.head;
		else if inputV == -1 selection = equipmentSlot.item;
		break;
	case equipmentSlot.item:
		sY = clamp(sY+inputH,0,3);
		
		if inputV == 1 selection = equipmentSlot.rune;
		else if inputV == -1 selection = equipmentSlot.legs;
		break;
	case equipmentSlot.head:
		if inputH == 1 selection = equipmentSlot.off1;
		else if inputH == -1 selection = equipmentSlot.main1;
		else if inputV == 1 selection = equipmentSlot.chest;
		else if inputV == -1 selection = equipmentSlot.rune;
		break;
	case equipmentSlot.chest:
		if inputH == 1 selection = equipmentSlot.off1;
		else if inputH == -1 selection = equipmentSlot.main1;
		else if inputV == 1 selection = equipmentSlot.legs;
		else if inputV == -1 selection = equipmentSlot.head;
		break;
	case equipmentSlot.legs:
		if inputH == 1 selection = equipmentSlot.off1;
		else if inputH == -1 selection = equipmentSlot.main1;
		else if inputV == 1 selection = equipmentSlot.item;
		else if inputV == -1 selection = equipmentSlot.chest;
		break;
	case equipmentSlot.main1:
		if inputH == 1 selection = equipmentSlot.chest;
		else if inputH == -1 selection = equipmentSlot.main2;
		else if inputV == 1 selection = equipmentSlot.legs;
		else if inputV == -1 selection = equipmentSlot.head;
		break;
	case equipmentSlot.main2:
		if inputH == 1 selection = equipmentSlot.main1;
		else if inputH == -1 selection = equipmentSlot.off2;
		else if inputV == 1 selection = equipmentSlot.legs;
		else if inputV == -1 selection = equipmentSlot.head;
		break;
	case equipmentSlot.off1:
		if inputH == 1 selection = equipmentSlot.off2;
		else if inputH == -1 selection = equipmentSlot.chest;
		else if inputV == 1 selection = equipmentSlot.legs;
		else if inputV == -1 selection = equipmentSlot.head;
		break;
	case equipmentSlot.off2:
		if inputH == 1 selection = equipmentSlot.main2;
		else if inputH == -1 selection = equipmentSlot.off1;
		else if inputV == 1 selection = equipmentSlot.legs;
		else if inputV == -1 selection = equipmentSlot.head;
		break;
}

	//track selection current item type
switch selection
{
	case equipmentSlot.head:
	case equipmentSlot.chest:
	case equipmentSlot.legs:
		equipmentSelectionItemType = itemType.equipment;
		break;
	case equipmentSlot.rune:
		equipmentSelectionItemType = itemType.rune;
		break;
	case equipmentSlot.main1:
	case equipmentSlot.main2:
	case equipmentSlot.off1:
	case equipmentSlot.off2:
		equipmentSelectionItemType = itemType.weapon;
		break;
	case equipmentSlot.item:
		equipmentSelectionItemType = itemType.item;
		break;
}
	#endregion
}
else
{
	#region movement inputs
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
	#region alter selection
	var totalItems = ds_list_size(equipmentSlotCache);
	switch selection
	{
		case equipmentSlot.rune:
		case equipmentSlot.head:
		case equipmentSlot.chest:
		case equipmentSlot.legs:
			equipmentSlotTypeIsHor = true;
			sX = clamp(sX+inputH,0,totalItems-1);
			break;
		case equipmentSlot.main1:
		case equipmentSlot.main2:
		case equipmentSlot.off1:
		case equipmentSlot.off2:
		case equipmentSlot.item:
			equipmentSlotTypeIsHor = false;
			sX = clamp(sX+inputV,0,totalItems-1);
			break;
	}	
	#endregion
}
#endregion

#region Alter active weapon for playerstats depending on selection, reset on B or start Press
	PlayerStats.currentWeaponIndex = originalWepSlot;
	PlayerStats.currentOffhandIndex = originalOffSlot;
	if selection == equipmentSlot.main1 PlayerStats.currentWeaponIndex = 0;
	else if selection == equipmentSlot.main2 PlayerStats.currentWeaponIndex = 1;
	else if selection == equipmentSlot.off1 PlayerStats.currentOffhandIndex = 0;
	else if selection == equipmentSlot.off2 PlayerStats.currentOffhandIndex = 1;
	var equipMain = [equipmentSlot.main1,equipmentSlot.main2];
	var equipOff = [equipmentSlot.off1,equipmentSlot.off2];
	PlayerStats.currentWeaponID = ItemCache.equipment[? equipMain[PlayerStats.currentWeaponIndex]];
	PlayerStats.currentOffhandID = ItemCache.equipment[? equipOff[PlayerStats.currentOffhandIndex]];
#endregion

#region (start)		Unpause

if (InputManager.startInput)
{
		//reset equipped weapon on playerstats
	PlayerStats.currentWeaponIndex = originalWepSlot;
	PlayerStats.currentOffhandIndex = originalOffSlot;
	var equipMain = [equipmentSlot.main1,equipmentSlot.main2];
	var equipOff = [equipmentSlot.off1,equipmentSlot.off2];
	PlayerStats.currentWeaponID = ItemCache.equipment[? equipMain[PlayerStats.currentWeaponIndex]];
	PlayerStats.currentOffhandID = ItemCache.equipment[? equipOff[PlayerStats.currentOffhandIndex]];
	
	instance_activate_all();
	InputManager.startInput = false;
	GameManager.pauseState = PauseState.normal;
	surface_free(GameManager.pauseSplash);
	instance_destroy();
}

#endregion
#region (A)			Select

if InputManager.aInput == true
{
	if !slotExpanded 
	{
		slotExpanded = true;
		equipmentSlotExpandedNew = true;
	}
	else
	{
		slotExpanded = false;
		
		var newEquipID = equipmentSlotCache[| sX];
		if selection == equipmentSlot.rune || selection == equipmentSlot.item
		{
			var cache = ItemCache.equipment[? selection];
			for (var i = 0; i < ds_list_size(cache); i++)
			{
				if cache[| i] == newEquipID
				{
					cache[| i] = noone;
				}
			}
			if selection == equipmentSlot.rune var ind = sExpY;
			else var ind = sY;
			cache[| ind]= newEquipID;
		}
		else
		{
			var key = ds_map_find_first(ItemCache.equipment);
			while key != undefined
			{
				var keyType = noone;
				if ItemCache.equipment[? key] == newEquipID
				{
					switch key
					{
						case equipmentSlot.head:
						case equipmentSlot.chest:
						case equipmentSlot.legs:
							keyType = itemType.equipment;
							break;
						case equipmentSlot.main1:
						case equipmentSlot.main2:
						case equipmentSlot.off1:
						case equipmentSlot.off2:
							keyType = itemType.weapon;
							break;
					}
					if keyType == equipmentSelectionItemType && keyType != noone
					{
						var num = scr_player_inventory_get(equipmentSelectionItemType,newEquipID)
						if num < 2 ItemCache.equipment[? key] = noone;
					}
				}
				key = ds_map_find_next(ItemCache.equipment,key);
			}
			ItemCache.equipment[? selection] = newEquipID;
		}
	}
}

#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	if slotExpanded 
	{
		slotExpanded = false;
	}
	else
	{
			//reset equipped weapon on playerstats
		PlayerStats.currentWeaponIndex = originalWepSlot;
		PlayerStats.currentOffhandIndex = originalOffSlot;
		var equipMain = [equipmentSlot.main1,equipmentSlot.main2];
		var equipOff = [equipmentSlot.off1,equipmentSlot.off2];
		PlayerStats.currentWeaponID = ItemCache.equipment[? equipMain[PlayerStats.currentWeaponIndex]];
		PlayerStats.currentOffhandID = ItemCache.equipment[? equipOff[PlayerStats.currentOffhandIndex]];
		
		audio_play_sound(snd_menu_back,10,0);
		menu = menuCurrent.main;
		current_menu_options = menu_main;
		sX = 0;
		sY = 0;
		sExpY = 0;
		equipmentSurfaceMainAlpha = 0;
		equipmentSurfaceRunesAlpha = 0;
		equipmentSurfaceInfoAlpha = 0;
		equipmentSurfaceSlotAlpha = 0;
	}
}

#endregion
#region (X)			Unequip Item

if InputManager.xInput == true
{
	if !slotExpanded
	{
		switch selection
		{
			case equipmentSlot.head:
			case equipmentSlot.chest:
			case equipmentSlot.legs:
			case equipmentSlot.main1:
			case equipmentSlot.main2:
			case equipmentSlot.off1:
			case equipmentSlot.off2:
				ItemCache.equipment[? selection] = noone;
				break;
			case equipmentSlot.item:
				var cache = ItemCache.equipment[? selection];
				cache[| sY] = noone;
				break;
			case equipmentSlot.rune:
				var cache = ItemCache.equipment[? selection];
				cache[| sExpY] = noone;
				break;
		}
	}
}

#endregion
#region (Y)			Cycle Player Stats page

if InputManager.yInput == true
{
	equipmentPlayerStatsPage++
	if equipmentPlayerStatsPage >= equipmentPlayerStatsPageMax equipmentPlayerStatsPage = 0;
}

#endregion

#region Update slot cache
	if slotExpanded
	{
			//update
		ds_list_clear(equipmentSlotCache);
		var cache = ItemCache.inventory[? equipmentSelectionItemType];
		var itemID = ds_map_find_first(cache);
		var count = 0;
		ds_list_add(equipmentSlotCache, noone);
		count++;
		var sel = selection;
		if sel == equipmentSlot.main2 sel = equipmentSlot.main1;
		if sel == equipmentSlot.off2 sel = equipmentSlot.off1;
		if sel == equipmentSlot.item
		{
			while itemID != undefined
			{
				if item_get_data(equipmentSelectionItemType,itemID,itemStats.usable)
				{
					ds_list_add(equipmentSlotCache, itemID);
					count++;
				}
				itemID = ds_map_find_next(cache,itemID);
			}
		}
		else if sel == equipmentSlot.rune
		{
			while itemID != undefined
			{
				var equipCache = ItemCache.equipment[? equipmentSlot.rune];
				var canEquip = true;
				for (var i = 0; i < ds_list_size(equipCache); i++)
				{
					if equipCache[| i] = itemID
					{
						canEquip = false;
						break;
					}
				}
				if canEquip
				{
					ds_list_add(equipmentSlotCache, itemID);
					count++;
				}
				itemID = ds_map_find_next(cache,itemID);
			}
		}
		else
		{
			while itemID != undefined
			{
				if item_get_data(equipmentSelectionItemType,itemID,itemStats.equipSlot) == sel
				{
					ds_list_add(equipmentSlotCache, itemID);
					count++;
				}
				itemID = ds_map_find_next(cache,itemID);
			}
		}
		
		//track active
		equipmentSlotActiveItem = noone
		for(var i = 0; i < ds_list_size(equipmentSlotCache); i++)
		{
			var ID = equipmentSlotCache[| i];
			var equippedID = ItemCache.equipment[? selection];
			if selection == equipmentSlot.rune || selection == equipmentSlot.item
			{
				if selection == equipmentSlot.rune var ind = sExpY;
				else var ind = sY;
				var equippedID = equippedID[| ind];
			}
			if equippedID == ID
			{
				equipmentSlotActiveItem = i
				break;
			}
		}
	}
	
		//reset selection on new
	if equipmentSlotExpandedNew
	{
		equipmentSlotExpandedNew = false;
		sX = equipmentSlotActiveItem;
		if sX == noone sX = 0;
		sXDisplay = sX;
	}
	
		//shift graphic
	sXDisplay += (sX-sXDisplay)/4;
#endregion