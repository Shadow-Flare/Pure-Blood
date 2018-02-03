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
	if (sY == 0)
	{
			//horizontal movement
		if (absHInput > 0.5 && horInputMoreThanVert) {sX += sign(InputManager.moveInputH); movedH = 1;}
		else if InputManager.dRInput {sX++; movedH = 1;}
		else if InputManager.dLInput {sX--; movedH = 1;}
	
		if (sX < 0) sX = array_height_2d(current_menu_options) - 1; 
		else if (sX >= array_height_2d(current_menu_options)) sX = 0;

		if (sY >= array_length_2d(current_menu_options,sX) ) sY = array_length_2d(current_menu_options,sX) - 1;

			//vertical movement
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
		else if (sExpY < 0) sY = 0;
	}
}

if (absHInput > 0.5 || absVInput > 0.5 || InputManager.dLInput || InputManager.dRInput || InputManager.dUInput || InputManager.dDInput)
{
	moveTimer++;
}
else { moveTimer = 0 };

if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev audio_play_sound(snd_menu_navigate,10,0)

#endregion

//select
selection = current_menu_options[sX,sY];

#region Get Data
	//maxItems
var maxItems = 0;
if (selection != tabType.all)
{
	var typeCache = inventoryCache[? selection-1];
	maxItems = ds_map_size(typeCache);
	if (maxItems == 0)
	{
		maxItems = 1;
	}
}
else
{
	for (var i = 0; i < 6; i++)
	{
		var typeCache = inventoryCache[? i];
		maxItems += ds_map_size(typeCache);
	}
	if (maxItems == 0)
	{
		maxItems = 1;
	}
}
#endregion

#region gather new slot data on horizontal change
if (movedH)
{		
	slot_options = [];
	if (selection != tabType.all)
	{
		var itemID = ds_map_find_first(typeCache);
		var count = 0;
		while (itemID != undefined)
		{
			slot_options[count] = itemID;
			itemID = ds_map_find_next(typeCache,itemID);
			count++;
		}
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
#region (A)			Select (diabled)

//if (InputManager.aInput == true)
//{
//	audio_play_sound(snd_menu_select,10,0);
//	switch selection
//	{
//		case "Items":
			
//			break;
//		case "Weapons":
			
//			break;
//		case "Offhand Equipment":
//			menu = menuCurrent.offhand;
//			current_menu_options = menu_offhand_equipment;
//			sX = 0;
//			sY = 0;
//			for(var i = 0; i < array_length_1d(PlayerStats.ownedOffhands); i++)
//			{
//				for(var j = 0; j < array_length_2d(PlayerStats.ownedSubtypes,i)+1; j++)
//				{
//					if j == 0 current_menu_options[i, 0] = PlayerStats.ownedOffhands[i]
//				else if j != 0 current_menu_options[i, j] = PlayerStats.ownedSubtypes[i,j-1];
//				}
//			}
//			break;
//	}
//}

#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	audio_play_sound(snd_menu_back,10,0);
	menu = menuCurrent.main;
	current_menu_options = menu_main;
	sX = 0;
	sY = 0;
}

#endregion