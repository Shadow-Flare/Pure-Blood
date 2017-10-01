//inputs
if gamepad_is_connected(0)
{
	gamepad_set_axis_deadzone(0,0.3);
	moveHInput = gamepad_axis_value(0, gp_axislh);
	moveVInput = gamepad_axis_value(0, gp_axislv);
	aInput = gamepad_button_check_pressed(0,gp_face1);
	bInput = gamepad_button_check_pressed(0,gp_face2);
	xInput = gamepad_button_check_pressed(0,gp_face3);
	yInput = gamepad_button_check_pressed(0,gp_face4);
	lInput = gamepad_button_check(0,gp_padl);
	rInput = gamepad_button_check(0,gp_padr);
	uInput = gamepad_button_check(0,gp_padu);
	dInput = gamepad_button_check(0,gp_padd);
	startInput = gamepad_button_check_pressed(0,gp_start);
}
else
{
	moveHInput = 0;
	moveVInput = 0;
	lInput = keyboard_check(vk_left);
	rInput = keyboard_check(vk_right);
	uInput = keyboard_check(vk_up);
	dInput = keyboard_check(vk_down);
	aInput = keyboard_check_pressed(ord("Z"));
	xInput = keyboard_check_pressed(ord("X"));
	bInput = keyboard_check_pressed(ord("C"));
	yInput = keyboard_check_pressed(ord("V"));
	startInput = keyboard_check_pressed(ord("F"));
}

//move left/right/up/down
	//horizontal
if  moveTimer == 0 || 
	(moveTimer >= ceil(0.3*room_speed) && moveTimer < ceil(1.0*room_speed) && floor(moveTimer%(ceil(0.35*room_speed))) == 0) ||
	(moveTimer >= ceil(1.0*room_speed) && floor(moveTimer%(ceil((1/10)*room_speed))) == 0)
{
	movedH = 0;
	if (moveHInput > 0.5 && abs(moveHInput) >= abs(moveVInput)) || rInput {sX++; movedH = 1;}
	if (moveHInput < -0.5 && abs(moveHInput) >= abs(moveVInput)) || lInput {sX--; movedH = 1;}
	if sX < 0  sX = 0;
	else if sX >= array_height_2d(current_menu_options) sX = array_height_2d(current_menu_options) - 1;
	if sY >= array_length_2d(current_menu_options,sX) sY = array_length_2d(current_menu_options,sX)-1;
		//vertical
	if expandedNum == 0
	{
		if (moveVInput > 0.5 && abs(moveVInput) > abs(moveHInput)) || dInput sY++;
		if (moveVInput < -0.5 && abs(moveVInput) > abs(moveHInput)) || uInput sY--;
		if sY < 0 sY = array_length_2d(current_menu_options,sX) - 1;
		else if sY >= array_length_2d(current_menu_options,sX) sY = 0;
	}
	if expandedNum != 0
	{
		if (moveVInput > 0.5 && abs(moveVInput) > abs(moveHInput)) || dInput sExpY++;
		if (moveVInput < -0.5 && abs(moveVInput) > abs(moveHInput)) || uInput sExpY--;
		if sExpY >= array_length_1d(slotOptions) sExpY = array_length_1d(slotOptions)-1;
		if sExpY < 0 sExpY = 0;
		if sX == 0
		{
			expandedNum = 0;
			current_menu_options = menu_main;
		}
	}
}

if (abs(moveHInput) > 0.5 || abs(moveVInput) > 0.5 || lInput || rInput || uInput || dInput)
{
	moveTimer++;
}
else moveTimer = 0;

if movedH && (expandedNum != 0)
{
	for (var i = 0; i < maxEnemies+1; i++)
	{
		slotOptions[i] = i;
	}
	for (var i = 0; i < array_length_1d(slotOptions); i++)
	{
		if slotOptions[i] == ArenaController.arenaStats[1]
		{
			sExpY = i;
			break;
		}
	}
}

//select
selection = current_menu_options[sX,sY];

if aInput == 1
{
	switch current_menu
	{
		case "main menu":
			switch selection
			{
				case "Enemy: ":
					expandedNum = 1;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					slotOptions = ArenaController.enemyList;
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Enemy Number: ":
					expandedNum = 2;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					for (var i = 0; i < maxEnemies+1; i++)
					{
						slotOptions[i] = i;
					}
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Enemy Maximum Hp: ":
					expandedNum = 3;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					for (var i = 0; i < maxEnemyHp+1; i++)
					{
						slotOptions[i] = i;
					}
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Enemy Physical Strength: ":
					expandedNum = 4;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					for (var i = 0; i < maxEnemyPhysicalStrength+1; i++)
					{
						slotOptions[i] = i;
					}
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Enemy Invulnerability: ":
					expandedNum = 5;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					slotOptions[0] = "Off";
					slotOptions[1] = "On";
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Player Maximum Hp: ":
					expandedNum = 6;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					for (var i = 0; i < maxPlayerHp+1; i++)
					{
						slotOptions[i] = i;
					}
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Player Physical Strength: ":
					expandedNum = 7;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					for (var i = 0; i < maxPlayerPhysicalStrength+1; i++)
					{
						slotOptions[i] = i;
					}
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Player Invulnerability: ":
					expandedNum = 8;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					slotOptions[0] = "Off";
					slotOptions[1] = "On";
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Change Arena: ":
					expandedNum = 9;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					slotOptions[0] = "Manor: Small";
					slotOptions[1] = "Dungeon: Large";
					slotOptions[2] = "Forest: Large with pitfalls";
					slotOptions[3] = "Town: Small, Flat and borderless";
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Platforms: ":
					expandedNum = 10;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					slotOptions[0] = "off";
					slotOptions[1] = "on";
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Hook Points: ":
					expandedNum = 11;
					sX++;
					
					movedH=1;
					slotOptions = [];	
										
					num = 0;
					slotOptions[0] = "off";
					slotOptions[1] = "on";
					for (var i = 0; i < array_length_1d(slotOptions); i++)
					{
						if slotOptions[i] == ArenaController.arenaStats[expandedNum-1]
						{
							sExpY = i;
							break;
						}
					}
					break;
				case "Heal all entities":
					var pl = ArenaController.player;
					var en = ArenaController.enemy;
					instance_activate_object(pl);
					instance_activate_object(en);
					pl.hp = pl.maxHp;
					pl.mp = pl.maxMp;
					en.hp = en.maxHp;
					if variable_instance_exists(en,"maxMp") en.mp = en.maxMp;
					instance_deactivate_object(pl);
					instance_deactivate_object(en);					
					break;
				case "Remove all enemies":
					instance_activate_object(ArenaController.enemy)
					with ArenaController.enemy instance_destroy();
					break;
				case "Exit":
					instance_activate_all();
					instance_destroy();
					surface_free(global.pauseSplash);
					break;
			}
			if expandedNum != 0 && movedH == 0
			{
				ArenaController.arenaStats[sY] = slotOptions[sExpY];
				menu_main[sX,sY] = slotOptions[sExpY];
				if expandedNum == 1
				{
					with ArenaController
					{
						instance_activate_object(enemy);
						with enemy instance_destroy();
						instance_activate_object(obj_enemy_attack_effect);
						with obj_enemy_attack_effect instance_destroy();
						var s = other.slotOptions[other.sExpY]
						for(var i = 0; i < ArenaController.numberOfEnemies; i++)
						{
							if s = enemyValues[i,0]
							{
								enemyID = i;
								break;
							}
							enemyID = 0;
						}
						arenaStats[0] = enemyValues[enemyID,0];			//Enemy Name
						arenaStats[1] = 1;							//Enemy Number
						arenaStats[2] = enemyValues[enemyID,1];			//Enemy Maximum Hp
						arenaStats[3] = enemyValues[enemyID,2];			//Enemy Physical Strength
						arenaStats[4] = enemyValues[enemyID,3];			//Enemy Invulnerability
					}
					for (var i = 0; i < array_length_1d(ArenaController.arenaStats); i++)
					{
						menu_main[ 1, i] = ArenaController.arenaStats[i];
					}
				}
				current_menu_options = menu_main;
				expandedNum = 0;
				sX = 0;
			}
			break;
	}
}

//back
if bInput == 1
{
	switch current_menu
	{
		case "main menu":
			if expandedNum != 0
			{
				expandedNum = 0;
				sX = 0;
			}
			else
			{
				unpause = 1;
			}
			break;
	}
}

//un-pause
if startInput
{
	unpause = 1;
}

if unpause
{
	global.paused = 0;
	surface_free(global.pauseSplash);
	instance_activate_all();
		//Arena platforms
	switch ArenaController.arenaStats[9]
	{
		case "off":
			instance_deactivate_object(obj_platform_parent);
			layer_set_visible("Tiles_arena_platforms",0)
			break;
		case "on":
			instance_activate_object(obj_platform_parent);
			layer_set_visible("Tiles_arena_platforms",1)
			break;
	}

	//Arena hook points
	switch ArenaController.arenaStats[10]
	{
		case "off":
			instance_deactivate_object(obj_grapple_parent);
			layer_set_visible("Tiles_arena_hookPoints",0)
			break;
		case "on":
			instance_activate_object(obj_grapple_parent);
			layer_set_visible("Tiles_arena_hookPoints",1)
			break;
	}
	instance_destroy();
}