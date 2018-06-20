event_inherited();

enum mainTransType {none, ex, newGame, arena, hordeMode, newGame2, newGame3, newGame4}
enum loadType {none, ending, newGame, arena, hordeMode, newGame2, newGame3, newGame4}

enum damageType {none,slash,blunt,pierce,fire,ice,lightning,arcane,light,dark,pure};
enum specialType {none, bleed, poison};

instance_create_depth(0,0,0,InputManager);
if !instance_exists(GameManager) instance_create_depth(0,0,0,GameManager);
GameManager.gameState = GameState.mainMenu;
if !instance_exists(ConsoleManager) instance_create_depth(0,0,0,ConsoleManager);
with instance_create_depth(0,0,0,Camera) phase = cameraState.idle;

ini_open("settings");
	GameManager.musicEnabled = ini_read_real("effects","musicEnabled",true) 
ini_close();

backMusic = audio_play_sound(snd_music_titleTheme,10,1);
audio_sound_gain(backMusic,0,0);

transType = mainTransType.none;
transDur = 0.75;
transTimer = room_speed*transDur*0.75;
conAltStart = noone;

selection = 0;

menu_title[0, 0] = "Start";
menu_title[0, 1] = "Arena";
menu_title[0, 2] = "Horde Mode";
menu_title[0, 3] = "Exit";

//initialize
current_menu = "title menu";
current_menu_options = menu_title;
sX = 0;
sY = 0;
moveTimer = 0;

//splash
var splashSubImages = 30;		//set this manually in accordance with animation
splashTimer = 0;
splashFPS = 12;
splashSprite = sprite_add("splash_main.png",splashSubImages,false,false,0,0);

	//effect tester
//with instance_create_depth(0,0,depth,obj_effect_persistent_mouseFollow) boundEffect = obj_effect_base_fire;
