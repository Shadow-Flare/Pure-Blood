event_inherited();

enum GameState {mainMenu, inGame, arena}
enum PauseState {normal, paused, transitioning, death}

// Initialize Game
gameState = GameState.mainMenu;
pauseState = PauseState.normal;
scr_console_create();

lastSpawner = noone;
pauseSplash = noone;

//screen
display_reset(0,1);
application_surface_draw_enable(0);
window_set_fullscreen(1);
window_set_cursor(cr_none);

monitorW = display_get_width();
monitorH = display_get_height();
monitorXOffset = ((monitorW-320)/2);
monitorYOffset = ((monitorH-176)/2);
displayResolutionX = 1920;
displayResolutionY = 1080;
GuiRX = displayResolutionX/100;
GuiRY = displayResolutionY/100;

if(monitorW>=displayResolutionX && monitorH>=displayResolutionY)
{
	surface_resize(application_surface,displayResolutionX,displayResolutionY)
	monitorXOffset=(monitorW-displayResolutionX)/2;
	monitorYOffset=(monitorH-displayResolutionY)/2;
}

grav = 0.25;