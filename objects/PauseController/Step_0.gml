switch menu
{
	case menuCurrent.main:
		scr_pause_step_main();
		break;
	case menuCurrent.inventory:
		scr_pause_step_inventory();
		break;
	case menuCurrent.offhand:
		scr_pause_step_offhand();
		break;
	case menuCurrent.combos:
		scr_pause_step_combos();
		break;
	case menuCurrent.status:
		scr_pause_step_status();
		break;
	case menuCurrent.settings:
		scr_pause_step_settings();
		break;
}