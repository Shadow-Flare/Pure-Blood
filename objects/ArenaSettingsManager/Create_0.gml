event_inherited();

//shut down all object in room save technicals
instance_deactivate_all(1);
	//Data stores
instance_activate_object(objCacheParent);
	//Controllers
instance_activate_object(ArenaController);
instance_activate_object(GameManager);
instance_activate_object(InputManager);
instance_activate_object(EffectsManager);
instance_activate_object(MapManager);
	
//reset start input
InputManager.startInput = 0;

//format menus
menu_main[ 0, 0] = "Enemy: ";
menu_main[ 0, 1] = "Enemy Number: ";
menu_main[ 0, 2] = "Enemy Maximum Hp: ";
menu_main[ 0, 3] = "Enemy Physical Strength: ";
menu_main[ 0, 4] = "Enemy Invulnerability: ";
menu_main[ 0, 5] = "Player Invulnerability: ";
menu_main[ 0, 6] = "Change Arena: ";
menu_main[ 0, 7] = "Platforms Enabled: ";
menu_main[ 0, 8] = "Hook Points Enabled: ";
menu_main[ 0, 9] = "Heal all entities";
menu_main[ 0,10] = "Remove all enemies";
menu_main[ 0,11] = "Exit"

//initialize
current_menu = "main menu";
current_menu_options = menu_main;
sX = 0;
sY = 0;
sExpX = 0;
sExpY = 0;
slotExpanded = false;
moveTimer = 0;
unpause = 0;

maxEnemies = 50;
maxEnemyHp = 200;
maxEnemyPhysicalStrength = 100;