event_inherited();
randomize();

//enum initializers
	//actor enumerators
enum actorTypes {player, ally, enemy, wild, corpse};
enum hitState {normal, blocking, dodging};

	//enemies
enum enemyAggroState {passive, attacking};

	//game manager
enum GameState {mainMenu, inGame, arena, hordeMode};
enum PauseState {normal, paused, transitioning, death};

	//misc
enum attackTypes {melee, projectile};
enum groundTypes {stone, grass};

// Initialize Game
gameState = GameState.mainMenu;
pauseState = PauseState.normal;

currentCheckpointID = noone;
checkpointMap = ds_map_create();
	checkpointMap[? 0] = rmRoomX100Y500;
	checkpointMap[? 1] = rmRoomX107Y500;
pauseSplash = noone;

//screen
ini_open("settings");
	vSyncToggle = ini_read_real("effects","vsync",true);
	display_reset(0,vSyncToggle);
ini_close();
application_surface_draw_enable(0);
window_set_fullscreen(1);
window_set_cursor(cr_none);

monitorW = display_get_width();
monitorH = display_get_height();
displayResolutionX = 1920;
displayResolutionY = 1080;
monitorXOffset = ((monitorW-displayResolutionX)/2);
monitorYOffset = ((monitorH-displayResolutionY)/2);
GuiRX = displayResolutionX/100;
GuiRY = displayResolutionY/100;

surface_resize(application_surface,displayResolutionX,displayResolutionY)
appSurfModX = monitorW/displayResolutionX;
appSurfModY = monitorH/displayResolutionY;

grav = 0.25;

hitBoxVisuals = false;				//gets determined in "reset_effects()"
actorBoxVisuals = false;			//gets determined in "reset_effects()"
