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
	var success = false;
		//do things	
	switch selection
	{
		case "Inventory":
			success = true;
			menu = menuCurrent.inventory;
			current_menu_options = menu_inventory;
			sX = 0;
			sY = 0;
			selection = 0;
			slot_options = [];
			movedH = true;
			break;
		case "Weaponry":
			success = true;
			slotExpanded = 0;
			menu = menuCurrent.weaponry;
			
			current_menu_options = menu_weaponry;
			var count = 0;
			var classID = ds_map_find_first(ComboCache.playerClass);
			while classID != undefined
			{
				if class_get_stat(classID,weaponClassStats.isMain)
				{
					current_menu_options[0, count] = classID;
					count++;
				}
				classID = ds_map_find_next(ComboCache.playerClass,classID);
			}
			current_menu_options[0, count] = noone;
			count++;
			var classID = ds_map_find_first(ComboCache.playerClass);
			while classID != undefined
			{
				if !class_get_stat(classID,weaponClassStats.isMain)
				{
					current_menu_options[0, count] = classID;
					count++;
				}
				classID = ds_map_find_next(ComboCache.playerClass,classID);
			}
			
			sX = 0;
			sY = 0;
			break;
		case "Equipment":
			success = true;
			menu = menuCurrent.equipment;
			current_menu_options = menu_equipment; //unused, kept as a formality and to set as empty temporarily
			sX = 0;	//used for managing equip
			sY = 1; //used for managing items
			sExpY = 0 //used for rune cycling
			sYDisplay = sY;
			slotExpanded = false;
			selection = equipmentSlot.head;
			originalWepSlot = PlayerStats.currentWeaponIndex;
			originalOffSlot = PlayerStats.currentOffhandIndex;
			canMoveH = true;
			canMoveV = true;
			runeAngleMod = 0;
			
			break;
		case "Abilities":
			success = true;
			menu = menuCurrent.abilities;
			current_menu_options = menu_abilities;
			sX = 0;
			sY = 0;
			selection = 0;
			slot_options = [];
			movedH = true;
			break;
		case "Status":
			success = true;
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
		case "Map":
			var str = room_get_name(room);
			if string_pos("rmRoom",str) != 0
			{
				success = true;
				menu = menuCurrent.map
				current_menu_options = [];
				selection = undefined;
				sX = 0;
				sY = 0;
				
				var coordinates = string_replace(str,"rmRoom","");
				var coordX = int64(string_copy(coordinates,2,3));
				var coordY = int64(string_copy(coordinates,6,3));
				instance_activate_object(objPlayer);
				var playerX = objPlayer.x/room_width;
				var playerY = objPlayer.y/room_height;
				instance_deactivate_object(objPlayer);
				var rmCW = RoomCache.rmWidths[? room];
				var rmCH = RoomCache.rmHeights[? room];
				
				mapCursorX = MapManager.mapCellW*(coordX+(playerX*rmCW));
				mapCursorY = MapManager.mapCellH*(coordY+(playerY*rmCH));
				mapCursorXDisplay = mapCursorX;
				mapCursorYDisplay = mapCursorY;
			}
			break;
		case "Settings":
			success = true;
			menu = menuCurrent.settings
			current_menu_options = menu_settings;
			sX = 0;
			sY = 0;
			break;
		case "Return to main menu":
			success = true;
			endingGame = true;
			break;
	}
	if success audio_play_sound(snd_menu_select,10,0);
	else audio_play_sound(snd_menu_back,10,0);
}

#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	audio_play_sound(snd_menu_back,10,0);
	endingPause = true;
}

#endregion