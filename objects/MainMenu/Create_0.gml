event_inherited();

enum loadType {newGame, arena}

display_reset(0,1);
application_surface_draw_enable(0);
window_set_fullscreen(1);
instance_create_depth(0,0,0,InputManager);
instance_create_depth(0,0,0,GameManager);
window_set_cursor(cr_none);

selection = 0;

menu_title[0, 0] = "Start";
menu_title[0, 1] = "Arena";
menu_title[0, 2] = "Exit";

//initialize
current_menu = "title menu";
current_menu_options = menu_title;
sX = 0;
sY = 0;
moveTimer = 0;
global.spawning = 0;
global.pauseSplash = noone;