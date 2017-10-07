event_inherited();

enum mainTransType {none, newGame, arena, ex}
enum loadType {none, newGame, arena, ending}

instance_create_depth(0,0,0,InputManager);
instance_create_depth(0,0,0,GameManager);

transType = mainTransType.none;
transDur = 2;
transTimer = 0;

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