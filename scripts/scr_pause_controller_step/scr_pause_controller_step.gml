//prev
sXPrev = sX;
sYPrev = sY;
sExpYPrev = sExpY;

//unpause
if (InputManager.startInput)
{
	instance_activate_all();
	global.paused = 0;
	instance_destroy();
	surface_free(global.pauseSplash);
}

absHInput = abs(InputManager.moveHInput);
absVInput = abs(InputManager.moveVInput);
horInputMoreThanVert = absHInput >= absVInput;

//move left / right / up / down / horizontal
if  (moveTimer == 0) || 
	(moveTimer >= ceil(0.3 * room_speed) && moveTimer < ceil(1.0 * room_speed) && floor(moveTimer % (ceil(0.35 * room_speed))) == 0) ||
	(moveTimer >= ceil(1.0 * room_speed) && floor(moveTimer%(ceil((1 / 10) * room_speed))) == 0)
{
	if (absHInput > 0.5 && horInputMoreThanVert) || rInput
		sX += sign(InputManager.moveHInput); movedH = 1; 
	
	if (sX < 0)  
		sX = 0; 
	else if (sX >= array_height_2d(current_menu_options))
		sX = array_height_2d(current_menu_options) - 1;

	if (sY >= array_length_2d(current_menu_options,sX) )
		sY = array_length_2d(current_menu_options,sX) - 1;

	if (!slotExpanded)
	{
		if ((absVInput > 0.5 && !horInputMoreThanVert) || dInput)
			sY += sign(InputManager.moveVInput);
		
		if (sY < 0) 
			sY = array_length_2d(current_menu_options,sX) - 1;
		else if (sY >= array_length_2d(current_menu_options,sX)) 
			sY = 0;
	}
	else
	{
		if ((InputManager.moveVInput > 0.5 && !horInputMoreThanVert) || (dInput))
			sExpY += sign(InputManager.moveVInput);
			
		if (sExpY >= array_length_1d(slot_options))
			sExpY = array_length_1d(slot_options) - 1;
		
		if (sExpY < 0)
			sExpY = 0;
			
		if (sX == 0)
		{
			slotExpanded = 0;
			current_menu_options = menu_combos;
		}
	}
}

if (absHInput > 0.5 || absVInput > 0.5 || lInput || rInput || uInput || dInput)
{
	moveTimer++;
}
else { moveTimer = 0 };

if (movedH && slotExpanded && current_menu == "combos")
{
	slot_types = global.activeComboSlotNumbers[sX-1];
	movedH = 0;	
	slot_options = [];
	
	num = 0;
	for (var i = 0; i < array_length_1d(global.attackTypes); i++)
	{
		for (var j = 0; j < array_length_1d(slot_types); j++)
		{
			if global.attackTypes[i] == slot_types[j]
			{
				slot_options[num] = i;
				num++;
			}
		}
	}
	for (var i = 0; i < array_length_1d(slot_options); i++)
	{
		if slot_options[i] = global.activeComboIDs[sX-1]
		{
			sExpY = i;
		}
	}
}
else if movedH && current_menu = "offhand equipment"
{
	sY = 0;
	movedH = 0;
}

//select
selection = current_menu_options[sX,sY];

if (aInput == 1)
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
				global.roomTrans = instance_create_layer(x,y,layer_get_id("lay_technicals"),obj_room_transition);
				with global.roomTrans {roomTo = rm_main_menu; roomFrom = room;}
				instance_create_depth(0,0,-10000,TransitionManager);
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
					for(var i = 0; i < array_length_1d(global.ownedOffhands); i++)
					{
						for(var j = 0; j < array_length_2d(global.ownedSubtypes,i)+1; j++)
						{
							if j == 0 current_menu_options[i, 0] = global.ownedOffhands[i]
					   else if j != 0 current_menu_options[i, j] = global.ownedSubtypes[i,j-1];
						}
					}
					break;
			}
			break;
		case "offhand equipment":
			if sY == 0 
			{
				global.activeOffhandID = selection;
				global.activeOffhandSubtypeID = current_menu_options[sX,1];
			}
			else
			{
				global.activeOffhandSubtypeID = selection;
				global.activeOffhandID = current_menu_options[sX,0];
			}
			break;
		case "combos":
			switch selection
			{
				case "weapon 1":
					slotExpanded = 1;
					sX++;
					
					movedH=1;
					slot_options = [];
					slot_types = global.activeComboSlotNumbers[sX-1];
					
					instance_activate_object(objPlayer);
					for(var i = 0; i < objPlayer.comboSize; i++)
					{
						current_menu_options[i+1, 0] = i;
					}
					instance_deactivate_object(objPlayer);
					
					num = 0;
					for (var i = 0; i < array_length_1d(global.attackTypes); i++)
					{
						for (var j = 0; j < array_length_1d(slot_types); j++)
						{
							if global.attackTypes[i] == slot_types[j]
							{
								slot_options[num] = i;
								num++;
								break;
							}
						}
					}
					for (var i = 0; i < array_length_1d(slot_options); i++)
					{
						if slot_options[i] = global.activeComboIDs[sX-1]
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
			switch(selection)
			{
				case "Lighting":
					global.FXLighting *= -1;
					break;
				case "Blood":
					global.FXBlood *= -1;
					break;
				case "Rain":
					EffectsManager.FXRain *= -1;
					break;
				case "Fog":
					global.FXFog *= -1;
					break;
				case "V-Sync":
					global.vsync *= -1;
					break;
			}
			break;
	}
}

//back
if bInput == 1
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
			global.paused = 0;
			surface_free(global.pauseSplash);
			instance_destroy();
			break;
	}
}

if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev audio_play_sound(snd_menu_navigate,10,0)