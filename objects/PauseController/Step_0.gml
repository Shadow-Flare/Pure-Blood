//prev
sXPrev = sX;
sYPrev = sY;
sExpYPrev = sExpY;

//unpause
if (InputManager.startInput)
{
	instance_activate_all();
	InputManager.startInput = false;
	GameManager.pauseState = PauseState.normal;
	surface_free(GameManager.pauseSplash);
	instance_destroy();
}

absHInput = abs(InputManager.moveInputH);
absVInput = abs(InputManager.moveInputV);
horInputMoreThanVert = absHInput >= absVInput;

//move left / right / up / down
if  (moveTimer == 0) || 
	(moveTimer >= ceil(0.3 * room_speed) && moveTimer < ceil(1.0 * room_speed) && floor(moveTimer % (ceil(0.35 * room_speed))) == 0) ||
	(moveTimer >= ceil(1.0 * room_speed) && floor(moveTimer%(ceil((1 / 10) * room_speed))) == 0)
{
	if (absHInput > 0.5 && horInputMoreThanVert) {sX += sign(InputManager.moveInputH); movedH = 1;}
	else if InputManager.dRInput {sX++; movedH = 1;}
	else if InputManager.dLInput {sX--; movedH = 1;}
	
	if (sX < 0) sX = array_height_2d(current_menu_options) - 1; 
	else if (sX >= array_height_2d(current_menu_options)) sX = 0;

	if (sY >= array_length_2d(current_menu_options,sX) ) sY = array_length_2d(current_menu_options,sX) - 1;

	if (!slotExpanded)
	{
		if (absVInput > 0.5 && !horInputMoreThanVert) sY += sign(InputManager.moveInputV);
		else if InputManager.dDInput sY++;
		else if InputManager.dUInput sY--;
		
		if (sY < 0) sY = array_length_2d(current_menu_options,sX) - 1;
		else if (sY >= array_length_2d(current_menu_options,sX)) sY = 0;
	}
	else
	{
		if (InputManager.moveInputV > 0.5 && !horInputMoreThanVert) sExpY += sign(InputManager.moveInputV);
		else if InputManager.dDInput sExpY++;
		else if InputManager.dUInput sExpY--;
			
		if (sExpY >= array_length_1d(slot_options)) sExpY = 0;
		else if (sExpY < 0) sExpY = array_length_1d(slot_options) - 1;
		
		if (sX == 0)
		{
			slotExpanded = 0;
			current_menu_options = menu_combos;
		}
	}
}

if (absHInput > 0.5 || absVInput > 0.5 || InputManager.dLInput || InputManager.dRInput || InputManager.dUInput || InputManager.dDInput)
{
	moveTimer++;
}
else { moveTimer = 0 };

if (movedH && slotExpanded && current_menu == "combos")
{		
	slot_options = [];
	slot_types = PlayerStats.activeComboSlotNumbers[sX-1];
					
	for(var i = 0; i < PlayerStats.comboSize; i++)
	{
		current_menu_options[i+1, 0] = i;
	}
					
	num = 0;
	for (var i = ds_map_find_first(ComboCache.attackTypes); i != ds_map_find_last(ComboCache.attackTypes); i = ds_map_find_next(ComboCache.attackTypes,i))
	{
		for (var j = 0; j < array_length_1d(slot_types); j++)
		{
			if ComboCache.attackTypes[? i] == slot_types[j]
			{
				slot_options[num] = i;
				num++;
				break;
			}
		}
	}
	for (var i = 0; i < array_length_1d(slot_options); i++)
	{
		if slot_options[i] = PlayerStats.activeComboIDs[sX-1]
		{
			sExpY = i;
			break;
		}
	}
	movedH = 0;
}
else if movedH && current_menu = "offhand equipment"
{
	sY = 0;
	movedH = 0;
}

//select
selection = current_menu_options[sX,sY];

if (InputManager.aInput == 1)
{
	audio_play_sound(snd_menu_select,10,0);
	switch current_menu
	{
		case "main menu":
			switch selection
			{
				case "Inventory":
					current_menu = "inventory";
					current_menu_options = menu_inventory;
					sX = 0;
					sY = 0;
					break;
				case "Combos":
					slotExpanded = 0;
					current_menu = "combos";
					current_menu_options = menu_combos;
					sX = 0;
					sY = 0;
					break;
				case "Status":
					current_menu = "status";
					current_menu_options = menu_status;
					sX = 0;
					sY = 0;
					break;
				case "Options":
					current_menu = "options";
					current_menu_options = menu_options;
					sX = 0;
					sY = 0;
					break;
				case "Return to main menu":
					room_goto(rmMainMenu);
					instance_destroy(all);
					break;
			}
			break;
		case "inventory":
			switch selection
			{
				case "Items":
					break;
				case "Weapons":
					break;
				case "Offhand Equipment":
					current_menu = "offhand equipment";
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
			break;
		case "offhand equipment":
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
			break;
		case "combos":
			switch selection
			{
				case "weapon 1":
					slotExpanded = 1;
					sX++;
					
					slot_options = [];
					slot_types = PlayerStats.activeComboSlotNumbers[sX-1];
					
					for(var i = 0; i < PlayerStats.comboSize; i++)
					{
						current_menu_options[i+1, 0] = i;
					}
					
					num = 0;
					for (var i = ds_map_find_first(ComboCache.attackTypes); i != ds_map_find_last(ComboCache.attackTypes); i = ds_map_find_next(ComboCache.attackTypes,i))
					{
						for (var j = 0; j < array_length_1d(slot_types); j++)
						{
							if ComboCache.attackTypes[? i] == slot_types[j]
							{
								slot_options[num] = i;
								num++;
								break;
							}
						}
					}
					for (var i = 0; i < array_length_1d(slot_options); i++)
					{
						if slot_options[i] = PlayerStats.activeComboIDs[sX-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
			}
			if slotExpanded && movedH == 0
			{
				scr_set_combo(sX-1,slot_options[sExpY])
			}
			break;
		case "options":
			ini_open("settings");
			switch(selection)
			{
				case "Lighting":
					ini_write_real("effects","lighting",!ini_read_real("effects","lighting",true))
					break;
				case "Blood":
					ini_write_real("effects","blood",!ini_read_real("effects","blood",true))
					break;
				case "Rain":
					ini_write_real("effects","rain",!ini_read_real("effects","rain",true))
					break;
				case "Fog":
					ini_write_real("effects","fog",!ini_read_real("effects","fog",true))
					break;
				case "V-Sync":
					ini_write_real("effects","vsync",!ini_read_real("effects","vsync",true))
					display_reset(0,ini_read_real("effects","vsync",true))
					break;
			}
			ini_close();
			reset_effects();
			instance_deactivate_object(LightingController);
			instance_deactivate_object(BloodStainController);
			instance_deactivate_object(RainController);
			instance_deactivate_object(FogController);
			break;
	}
}

//back
else if InputManager.bInput == 1
{
	audio_play_sound(snd_menu_back,10,0);
	switch current_menu
	{
		case "inventory":
			current_menu = "main menu";
			current_menu_options = menu_main;
			sX = 0;
			sY = 0;
			break;
		case "combos":
			if slotExpanded
			{
				slotExpanded = 0;
				current_menu_options = menu_combos;
			}
			else
			{
				current_menu = "main menu";
				current_menu_options = menu_main;
				sX = 0;
				sY = 0;
			}
			break;
		case "status":
			current_menu = "main menu";
			current_menu_options = menu_main;
			sX = 0;
			sY = 0;
			break;
		case "offhand equipment":
			current_menu = "inventory";
			current_menu_options = menu_inventory;
			sX = 0;
			sY = 0;
			break;
		case "options":
			current_menu = "main menu";
			current_menu_options = menu_main;
			sX = 0;
			sY = 0;
			break;
		case "main menu":
			instance_activate_all();
			InputManager.bInput = false;
			GameManager.pauseState = PauseState.normal;
			surface_free(GameManager.pauseSplash);
			instance_destroy();
			break;
	}
}

if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev audio_play_sound(snd_menu_navigate,10,0)