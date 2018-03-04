if gamepad_is_connected(0)
{
	var hInput = gamepad_axis_value(0,gp_axislh);
	var vInput = gamepad_axis_value(0,gp_axislv);
	var zoomInput = gamepad_button_check_pressed(0,gp_padd)-gamepad_button_check_pressed(0,gp_padu);
}
else
{
	var hInput = keyboard_check(vk_right)-keyboard_check(vk_left);
	var vInput = keyboard_check(vk_down)-keyboard_check(vk_up);
	var zoomInput = keyboard_check_pressed(ord("S"))-keyboard_check_pressed(ord("W"));
}

mapZoomLevel = clamp(mapZoomLevel+zoomInput,0,4);
mapZoomLevelDisplay += (mapZoomLevel-mapZoomLevelDisplay)/4;
if abs(mapZoomLevelDisplay-mapZoomLevel) <= 0.015 mapZoomLevelDisplay = mapZoomLevel;

var mapCursorSpeed = power(2,mapZoomLevel)*0.75;

mapCursorX = clamp(mapCursorX+hInput*mapCursorSpeed,MapManager.cellStartX*MapManager.mapCellW,MapManager.maxCellsX*MapManager.mapCellW);
mapCursorY = clamp(mapCursorY+vInput*mapCursorSpeed,MapManager.cellStartY*MapManager.mapCellW,MapManager.maxCellsY*MapManager.mapCellW);
mapCursorXDisplay += (mapCursorX-mapCursorXDisplay)/4;
mapCursorYDisplay += (mapCursorY-mapCursorYDisplay)/4;
if abs(mapCursorXDisplay-mapCursorX) <= 0.05 mapCursorXDisplay = mapCursorX;
if abs(mapCursorYDisplay-mapCursorY) <= 0.05 mapCursorYDisplay = mapCursorY;

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
#region (A)			Select (inactive)

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