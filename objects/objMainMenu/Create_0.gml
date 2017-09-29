application_surface_draw_enable(0);
window_set_fullscreen(1);
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