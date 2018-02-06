//scr_menu_navigate();
#region unique navigation

//prev
sXPrev = sX;
sYPrev = sY;
sExpYPrev = sExpY;

//checks
var absHInput = abs(InputManager.moveInputH);
var absVInput = abs(InputManager.moveInputV);
var horInputMoreThanVert = absHInput >= absVInput;

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
		if (absVInput > 0.5 && !horInputMoreThanVert) sExpY += sign(InputManager.moveInputV);
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

if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev audio_play_sound(snd_menu_navigate,10,0)

#endregion

#region gather new slot data on horizontal change
if (movedH && slotExpanded)
{		
	slot_options = [];
	var class = weapon_get_stat(PlayerStats.heldWeapons[sY],weaponStats.type);
	var comboSize = PlayerStats.GCS[? class];
	var finisherSize = PlayerStats.GFS[? class];
	var comboSizeTotal = comboSize+finisherSize;
	
	for(var i = 0; i < comboSizeTotal; i++)
	{
		current_menu_options[i+1, sY] = i;
	}
					
	var num = 0;
	if sX-1 < comboSize var type = 1;
	else var type = 2;
	for (var i = ds_map_find_first(ComboCache.attackTypes); i != undefined; i = ds_map_find_next(ComboCache.attackTypes,i))
	{
		if ComboCache.attackTypes[? i] == type && ComboCache.attackClass[? i] == class
		{
			slot_options[num] = i;
			num++;
		}
	}
	
	for (var i = 0; i < array_length_1d(slot_options); i++)
	{
		if slot_options[i] = attack_get_id_class(sX-1,vState.grounded,class)
		{
			sExpY = i;
			break;
		}
	}
	movedH = 0;
}
#endregion

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
	if slotExpanded == false
	{
		switch selection
		{
			case "weapon 1":
				slot_options = [];
				slotExpanded = true;
				sX++;
				var class = weapon_get_stat(PlayerStats.heldWeapons[0],weaponStats.type);
				var comboSize = PlayerStats.GCS[? class];
				var finisherSize = PlayerStats.GFS[? class];
				var comboSizeTotal = comboSize+finisherSize;
	
				for(var i = 0; i < comboSizeTotal; i++)
				{
					current_menu_options[i+1, sY] = i;
				}
					
				var num = 0;
				if sX-1 < comboSize var type = 1;
				else var type = 2;
				for (var i = ds_map_find_first(ComboCache.attackTypes); i != undefined; i = ds_map_find_next(ComboCache.attackTypes,i))
				{
					if ComboCache.attackTypes[? i] == type && ComboCache.attackClass[? i] == class
					{
						slot_options[num] = i;
						num++;
					}
				}
	
				for (var i = 0; i < array_length_1d(slot_options); i++)
				{
					if slot_options[i] = attack_get_id_class(sX-1,vState.grounded,class)
					{
						sExpY = i;
						break;
					}
				}
				movedH = 0;
				break;
			case "weapon 2":
				slot_options = [];
				slotExpanded = true;
				sX++;
				var class = weapon_get_stat(PlayerStats.heldWeapons[1],weaponStats.type);
				var comboSize = PlayerStats.GCS[? class];
				var finisherSize = PlayerStats.GFS[? class];
				var comboSizeTotal = comboSize+finisherSize;
	
				for(var i = 0; i < comboSizeTotal; i++)
				{
					current_menu_options[i+1, sY] = i;
				}
					
				var num = 0;
				if sX-1 < comboSize var type = 1;
				else var type = 2;
				for (var i = ds_map_find_first(ComboCache.attackTypes); i != undefined; i = ds_map_find_next(ComboCache.attackTypes,i))
				{
					if ComboCache.attackTypes[? i] == type && ComboCache.attackClass[? i] == class
					{
						slot_options[num] = i;
						num++;
					}
				}
	
				for (var i = 0; i < array_length_1d(slot_options); i++)
				{
					if slot_options[i] = attack_get_id_class(sX-1,vState.grounded,class)
					{
						sExpY = i;
						break;
					}
				}
				movedH = 0;
				break;
		}
	}
	else if movedH == 0
	{
		var class = weapon_get_stat(PlayerStats.heldWeapons[sY],weaponStats.type);
		var comboSize = PlayerStats.GCS[? class];
		if sX-1 < comboSize type = 1;
		else type = 2;
		scr_set_combo(class,type,sX-1,slot_options[sExpY])
	}
}

#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	audio_play_sound(snd_menu_back,10,0);
	if slotExpanded
	{
		slotExpanded = 0;
		current_menu_options = menu_weaponry;
	}
	else
	{
		menu = menuCurrent.main;
		current_menu_options = menu_main;
		sX = 0;
		sY = 0;
	}
}

#endregion