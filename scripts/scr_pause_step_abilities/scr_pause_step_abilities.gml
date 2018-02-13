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

		//no vertical movement
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
			
		if (sExpY >= array_length_1d(slot_options)) sExpY = 0;
		else if (sExpY < 0) sExpY = array_length_1d(slot_options)-1;
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

//modify scroll
while (sExpY > abilityPanelScroll + abilityPanelNum - 1) abilityPanelScroll++;
while (sExpY < abilityPanelScroll) abilityPanelScroll--;

#region Get Data
	//maxItems
var maxItems = 0;
var abilityCache = AbilityCache.playerAbilities;
var typeCache = abilityCache[? selection];
maxItems = ds_map_size(typeCache);
if (maxItems == 0)
{
	maxItems = 1;
}
#endregion

#region gather new slot data on horizontal change
if (movedH)
{		
	abilityPanelScroll = 0;
	sExpY = 0;
	slot_options = [];
	var abilityID = ds_map_find_first(typeCache);
	var count = 0;
	while (abilityID != undefined)
	{
		var ownedNum = scr_player_ability_get(selection,abilityID,playerAbilityStats.numberOwned);
		repeat (ownedNum)
		{
			slot_options[count] = abilityID;
			count++;
		}
		abilityID = ds_map_find_next(typeCache,abilityID);
	}
	movedH = false;
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
	else if sY == 1
	{
		var lastAbilityID = noone;
		var count = 0;
		for (var j = 0; j < array_length_1d(slot_options); j++)
		{
			var temp = slot_options[j];
			if temp == lastAbilityID count++;
			else count = 0;
			if count < scr_player_ability_get(selection, temp, playerAbilityStats.numberActivated)
			{
				var enabled = true;
			}
			else var enabled = false;
			if sExpY == j break;
			lastAbilityID = temp;
		}
		if enabled
		{
			var modifier = -1;
			audio_play_sound(snd_menu_select,10,0);
		}
		else
		{
			if ability_get_data(selection,slot_options[sExpY],abilityStats.cost) <= (PlayerStats.apMax-PlayerStats.ap)
			{
				var modifier = 1;
				audio_play_sound(snd_menu_select,10,0);
			}
			else
			{
				var modifier = 0;
				audio_play_sound(snd_menu_back,10,0);
			}
		}
		if modifier != 0 scr_player_ability_manage(selection,slot_options[sExpY],playerAbilityStats.numberActivated,modifier);
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