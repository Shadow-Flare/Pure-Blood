event_inherited();

//shut down all object in room save technicals
instance_deactivate_all(1);
instance_activate_object(ArenaController);
instance_activate_object(objCacheParent);
	
//reset start input
global.startInput = 0;

//format menus
menu_main[ 0, 0] = "Enemy: ";
menu_main[ 0, 1] = "Enemy Number: ";
menu_main[ 0, 2] = "Enemy Maximum Hp: ";
menu_main[ 0, 3] = "Enemy Physical Strength: ";
menu_main[ 0, 4] = "Enemy Invulnerability: ";
menu_main[ 0, 5] = "Player Maximum Hp: ";
menu_main[ 0, 6] = "Player Physical Strength: ";
menu_main[ 0, 7] = "Player Invulnerability: ";
menu_main[ 0, 8] = "Change Arena: ";
menu_main[ 0, 9] = "Platforms: ";
menu_main[ 0,10] = "Hook Points: ";
menu_main[ 0,11] = "Heal all entities";
menu_main[ 0,12] = "Remove all enemies";
menu_main[ 0,13] = "Exit"
for (var i = 0; i < array_length_1d(ArenaController.arenaStats); i++)
{
	menu_main[ 1, i] = ArenaController.arenaStats[i];
}

//initialize
current_menu = "main menu";
current_menu_options = menu_main;
sX = 0;
sY = 0;
moveTimer = 0;
movedH = 0;
unpause = 0;

expandedNum = 0;						//0=none,1=enemyName,2=enemyHp,3=enemyStr,4=enemyInvuln,5=playerHp,6=playerStr,7=playerinvuln
maxEnemies = 50;
maxEnemyHp = 200;
maxEnemyPhysicalStrength = 100;
maxPlayerHp = 200;
maxPlayerPhysicalStrength = 100;