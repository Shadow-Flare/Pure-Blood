switch menu
{
	case menuCurrent.main:
		scr_pause_step_main();
		break;
	case menuCurrent.inventory:
		scr_pause_step_inventory();
		break;
	case menuCurrent.weaponry:
		scr_pause_step_weaponry();
		break;
	case menuCurrent.equipment:
		scr_pause_step_equipment();
		break;
	case menuCurrent.abilities:
		scr_pause_step_abilities();
		break;
	case menuCurrent.status:
		scr_pause_step_status();
		break;
	case menuCurrent.map:
		scr_pause_step_map();
		break;
	case menuCurrent.settings:
		scr_pause_step_settings();
		break;
}

#region endPause
if endingPause
{
	ini_open("settings");
		var vSyncSetting = ini_read_real("effects","vsync",true)
		if GameManager.vSyncToggle != vSyncSetting
		{
			GameManager.vSyncToggle = vSyncSetting;
			display_reset(0,GameManager.vSyncToggle);
		}
	ini_close();
	instance_activate_all();
	InputManager.bInput = false;
	InputManager.startInput = false;
	GameManager.pauseState = PauseState.normal;
	surface_free(GameManager.pauseSplash);
	instance_destroy();
}
#endregion

#region end game
if endingGame
{
	instance_destroy(AmbienceController);
	GameManager.transitionRoomTo = rmMainMenu;
	GameManager.transitionRoomFrom = room;
	GameManager.transitionID = 0;
	GameManager.pauseState = PauseState.transitioning;
}
#endregion