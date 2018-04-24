//scr_menu_navigate();
#region unique navigation
//prev
sXPrev = sX;
sYPrev = sY;
sExpYPrev = sExpY;
sExpXPrev = sExpX;

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

		
		//	//vertical movement
		//if (absVInput > 0.5 && !horInputMoreThanVert) sY += sign(InputManager.moveInputV);
		//else if InputManager.dDInput sY++;
		//else if InputManager.dUInput sY--;
		
		//if (sY < 0) sY = array_length_2d(current_menu_options,sX) - 1;
		//else if (sY >= array_length_2d(current_menu_options,sX)) sY = 0;
	}
	else
	{
		if (absVInput > 0.5 && !horInputMoreThanVert) sExpY += sign(InputManager.moveInputV);
		else if InputManager.dDInput sExpY++;
		else if InputManager.dUInput sExpY--;
			
		if (sExpY >= ds_grid_height(slot_grid)) sExpY = 0;
		else if (sExpY < 0) sExpY = ds_grid_height(slot_grid)-1;
		
		if (absHInput > 0.5 && horInputMoreThanVert) sExpX += sign(InputManager.moveInputH);
		else if InputManager.dRInput sExpX++;
		else if InputManager.dLInput sExpX--;
			
		if (sExpX >= ds_grid_width(slot_grid)) sExpX = 0;
		else if (sExpX < 0) sExpX = ds_grid_width(slot_grid)-1;
	}
}

if (absHInput > 0.5 || absVInput > 0.5 || InputManager.dLInput || InputManager.dRInput || InputManager.dUInput || InputManager.dDInput)
{
	moveTimer++;
}
else { moveTimer = 0 };

if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev || sExpX != sExpXPrev audio_play_sound(snd_menu_navigate,10,0);

#endregion
#region Reset selection data on Tab chenge and define selection
if movedH
{
	abilityPanelScroll = 0;
	sExpY = 0;
	sExpX = 0;
	movedH = false;
}

//select
selection = current_menu_options[sX,sY];

#endregion
#region modify scroll
while (sExpY > inventoryPanelScroll + inventoryGridHeight - 1) inventoryPanelScroll++;
while (sExpY < inventoryPanelScroll) inventoryPanelScroll--;
#endregion
#region Get Data
	//maxItems
var maxItems = 0;
var inventoryCache = ItemCache.inventory;
var typeCache = inventoryCache[? selection];
maxItems = ds_map_size(typeCache);
if (maxItems == 0)
{
	maxItems = 1;
}
var numOfRows = ceil(maxItems/inventoryGridWidth);
#endregion
#region update Scheme Colour
inventoryColourScheme = merge_color(inventoryColourScheme,inventoryTabColours[| sX],0.05);
#endregion 
#region gather new slot data every frame
if ds_grid_width(slot_grid) != inventoryGridWidth || ds_grid_height(slot_grid) != numOfRows ds_grid_resize(slot_grid,inventoryGridWidth,max(numOfRows,inventoryGridHeight));
ds_grid_clear(slot_grid,noone);
var itemID = ds_map_find_first(typeCache);
var count = 0;
while (itemID != undefined)
{
	var xPos = count%inventoryGridWidth;
	var yPos = floor(count/inventoryGridWidth);
	slot_grid[# xPos,yPos] = itemID;
	itemID = ds_map_find_next(typeCache,itemID);
	count++;
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
if (InputManager.aInput)
{
	if sY == 0
	{
		sY++;
		audio_play_sound(snd_menu_select,10,0);
	}
	else
	{
		
	}
}
#endregion
#region (B)			Cancel

if InputManager.bInput == true
{
	if sY == 0
	{
		menu = menuCurrent.main;
		current_menu_options = menu_main;
		sX = 0;
		sY = 0;
	}
	else sY = 0;
	audio_play_sound(snd_menu_back,10,0);
}

#endregion