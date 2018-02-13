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
	GameManager.pauseState = PauseState.normal;
	surface_free(GameManager.pauseSplash);
	instance_destroy();
}
#endregion

#region end game
if endingGame
{
	room_goto(rmMainMenu);
	instance_deactivate_object(GameManager);
	instance_destroy(all);
	instance_activate_object(GameManager);
	GameManager.pauseState = PauseState.normal;
}
#endregion