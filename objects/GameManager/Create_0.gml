event_inherited();
randomize();

//enum initializers
	//actor
enum actorTypes {player, ally, enemy, wild, corpse};
enum hitState {normal, blocking, dodging};

	//player
enum state {base, attacking, offhand, ability, blocking, dodging, hitReaction, emote, dying, action1, action2, action3, action4, action5};
enum subState {none, idle, walking, walkingBackwards, running, landing, airborne, performing, post, pre, fire, aim, holding, reaction, staggered, stunned, aerialStagger, deflected, actionSub1, actionSub2, actionSub3, actionSub4, actionSub5};
enum vState {grounded, midAir, jumping};
	//weapons
enum weaponClass {sword, spear}
enum weaponClassStats {name, groundComboLength, groundFinisherLength, aerialComboLength, aerialFinisherLength, groundComboDefault, groundFinisherDefault, aerialComboDefault, aerialFinisherDefault, counter, downwards, forwards, backwards};
enum weaponStats {name, type, damage, strMod, dexMod, stagger, range, specialType, specialValue, uniqueAttack, misc};
enum weaponComboTypes {groundCombo, groundFinisher, aerialCombo, aerialFinisher, extra};
enum extraComboTypes {upwards};
enum weaponItem
{
/* Swords */		gladius,
/* Spears */		hastam
};
		//items
enum itemType {weapon};

	//enemies
enum enemyAggroState {passive, attacking};

	//game manager
enum GameState {mainMenu, inGame, arena, hordeMode};
enum PauseState {normal, paused, transitioning, death};

	//misc
enum attackTypes {melee, projectile};
enum groundTypes {stone, grass};
enum menuCurrent {main, inventory, offhand, combos, status, settings};

// Initialize Game
gameState = GameState.mainMenu;
pauseState = PauseState.normal;

currentCheckpointID = noone;
checkpointMap = ds_map_create();
	checkpointMap[? 0] = rmRoomX05Y50;
	checkpointMap[? 1] = rmRoomX11Y50;
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

hitBoxVisuals = false;				//gets determined in "reset_effects()"
actorBoxVisuals = false;			//gets determined in "reset_effects()"
