event_inherited();

enum mainTransType {none, newGame, arena, hordeMode, ex}
enum loadType {none, newGame, arena, hordeMode, ending}

enum damageType {none,slash,blunt,pierce,fire,ice,lightning,arcane,light,dark,pure};
enum specialType {none, bleed};

instance_create_depth(0,0,0,InputManager);
if !instance_exists(GameManager) instance_create_depth(0,0,0,GameManager);
with instance_create_depth(0,0,0,Camera) phase = cameraState.idle;

backMusic = audio_play_sound(snd_music_titleTheme,10,1);

transType = mainTransType.none;
transDur = 0.75;
transTimer = 0;

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

	//effect tester
//with instance_create_depth(0,0,depth,obj_effect_persistent_mouseFollow) boundEffect = obj_effect_base_fire;
