event_inherited();

enum mainTransType {none, newGame, arena, hordeMode, ex}
enum loadType {none, newGame, arena, hordeMode, ending}

instance_create_depth(0,0,0,InputManager);
if !instance_exists(GameManager) instance_create_depth(0,0,0,GameManager);
with instance_create_depth(0,0,0,Camera) phase = cameraState.idle;

transType = mainTransType.none;
transDur = 1.5;
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
with instance_create_depth(0,0,depth,obj_effect_persistent_menuFollow) boundEffect = obj_effect_base_fire;
//effect1 = instance_create_depth(room_width*1/4,room_height/2,depth,obj_particle_effect_fire);
//effect2 = instance_create_depth(room_width/2,room_height/2,depth,obj_particle_effect_ice);
//effect3 = instance_create_depth(room_width*3/4,room_height/2,depth,obj_particle_effect_lightning);
//for (var i = 4; i < 10; i++)
//{
//	var type = irandom(2);
//	switch type
//	{
//		case 0:
//			type = obj_particle_effect_fire_menu;
//			break;
//		case 1:
//			type = obj_particle_effect_ice_menu;
//			break;
//		case 2:
//			type = obj_particle_effect_lightning_menu;
//			break;
//	}
//	var effect = instance_create_depth(room_width/2,room_height/2,depth,type);
//	with effect
//	{
//		radius = 24*i*0.3;
//		var modifier = irandom(1);
//		if modifier == 0 modifier = -1;
//		angleDelta *= modifier;
//		angle = random(360);
//	}
////}
//instance_create_depth(room_width/2,room_height/2,depth,obj_particle_effect_fire_menuFollow);
