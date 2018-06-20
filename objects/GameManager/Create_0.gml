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

enum battleState {peace, battle};

enum interactableVariant {none, worldID, worldIDand}

// Initialize Game
gameState = GameState.mainMenu;
pauseState = PauseState.normal;
battlePhase = battleState.peace;

battlePhaseRange = 180;		//pixels

currentCheckpointID = noone;
checkpointMap = ds_map_create();
	checkpointMap[? 0] = rmRoomX100Y500;
	checkpointMap[? 1] = rmRoomX107Y500;
pauseSplash = noone;

//screen & misc
ini_open("settings");
	vSyncToggle = ini_read_real("effects","vsync",false);
	cutsceneDebug = ini_read_real("debug","cutsceneDebug",false);
	display_reset(0,vSyncToggle);
ini_close();
application_surface_draw_enable(0);
window_set_cursor(cr_none);

monitorW = display_get_width();
monitorH = display_get_height();
displayResolutionX = 1920;
displayResolutionY = 1056;
GuiRX = displayResolutionX/100;
GuiRY = displayResolutionY/100;

appSurfYBorder = 12;

if surface_get_width(application_surface) != displayResolutionX || surface_get_height(application_surface) != displayResolutionY
{
	surface_resize(application_surface,displayResolutionX,displayResolutionY);
	show_debug_message("Application Surface Size Reset:");
	show_debug_message("Width: "+string(displayResolutionX));
	show_debug_message("Height: "+string(displayResolutionY));
}
appSurfModX = monitorW/displayResolutionX;
appSurfModY = (monitorH-appSurfYBorder*2)/displayResolutionY;

grav = 0.25;

hitBoxVisuals = false;				//gets determined in "reset_effects()"
actorBoxVisuals = false;			//gets determined in "reset_effects()"
musicEnabled = true;				//gets determined in "reset_effects()"

//CHEATS
thereisnospoon = false;