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
	//case menuCurrent.abilities:
	//	scr_pause_step_abilities();
	//	break;
	case menuCurrent.status:
		scr_pause_step_status();
		break;
	case menuCurrent.settings:
		scr_pause_step_settings();
		break;
}