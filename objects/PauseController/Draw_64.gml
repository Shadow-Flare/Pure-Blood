x = camera_get_view_x(view_get_camera(view_current));
y = camera_get_view_y(view_get_camera(view_current));

//darken
if surface_exists(GameManager.pauseSplash) draw_surface(GameManager.pauseSplash,0,0);
draw_set_colour(c_black);
draw_set_alpha(0.75);
draw_rectangle(0,0,1980,1080,0);
draw_set_alpha(1);

//options
draw_set_font(fnt_menu);
draw_set_colour(c_white);

switch menu
{
	case menuCurrent.main:
		scr_pause_draw_main();
		break;
	case menuCurrent.inventory:
		scr_pause_draw_inventory();
		break;
	case menuCurrent.weaponry:
		scr_pause_draw_weaponry();
		break;
	case menuCurrent.equipment:
		scr_pause_draw_equipment();
		break;
	case menuCurrent.abilities:
		scr_pause_draw_abilities();
		break;
	case menuCurrent.status:
		scr_pause_draw_status();
		break;
	case menuCurrent.settings:
		scr_pause_draw_settings();
		break;
}