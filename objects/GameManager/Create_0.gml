event_inherited();

enum GameState {mainMenu, inGame, arena}

// Initialize Game
gameState = GameState.mainMenu;
consoleEnabled = false;

//screen
monitorW = display_get_width();
monitorH = display_get_height();
monitorXOffset = ((monitorW-320)/2);
monitorYOffset = ((monitorH-180)/2);
displayResolutionX = 1920;
displayResolutionY = 1080;

if(monitorW>=displayResolutionX && monitorH>=displayResolutionY)
{
	surface_resize(application_surface,displayResolutionX,displayResolutionY)
	monitorXOffset=(monitorW-displayResolutionX)/2;
	monitorYOffset=(monitorH-displayResolutionY)/2;
}