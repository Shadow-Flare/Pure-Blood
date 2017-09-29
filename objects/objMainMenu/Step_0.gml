//prevs
sXPrev = sX;
sYPrev = sY;

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

//navigate
if  moveTimer == 0 || 
	(moveTimer >= ceil(0.3*room_speed) && moveTimer < ceil(1.0*room_speed) && floor(moveTimer%(ceil(0.35*room_speed))) == 0) ||
	(moveTimer >= ceil(1.0*room_speed) && floor(moveTimer%(ceil((1/10)*room_speed))) == 0)
{
	if (moveHInput > 0.5 && abs(moveHInput) >= abs(moveVInput)) || rInput sX++;
	if (moveHInput < -0.5 && abs(moveHInput) >= abs(moveVInput)) || lInput sX--;
	if sX < 0  sX = 0;
	else if sX >= array_height_2d(current_menu_options) sX = array_height_2d(current_menu_options) - 1;
	if sY >= array_length_2d(current_menu_options,sX) sY = array_length_2d(current_menu_options,sX)-1;
		//vertical
	if (moveVInput > 0.5 && abs(moveVInput) > abs(moveHInput)) || dInput sY++;
	if (moveVInput < -0.5 && abs(moveVInput) > abs(moveHInput)) || uInput sY--;
	if sY < 0 sY = array_length_2d(current_menu_options,sX) - 1;
	else if sY >= array_length_2d(current_menu_options,sX) sY = 0;
}

if (abs(moveHInput) > 0.5 || abs(moveVInput) > 0.5 || lInput || rInput || uInput || dInput)
{
	moveTimer++;
}
else moveTimer = 0;

selection = current_menu_options[sX,sY];

//A Input
if aInput == 1
{
	audio_play_sound(snd_menu_select,10,0);
	switch selection
	{
		case "Start":
			global.roomTrans = instance_create_depth(0,0,0,obj_room_transition)
			with global.roomTrans
			{
				roomFrom = room;
				roomTo = rm_room1;
			}
			instance_create_layer(0,0,"lay_technicals",obj_comboCache);
			instance_create_layer(0,0,"lay_player",obj_player);
			instance_create_layer(0,0,"lay_technicals",obj_controller);
			instance_create_depth(0,0,-10000,obj_transition_controller);
			instance_destroy();
			break;
		case "Arena":
			global.roomTrans = instance_create_depth(0,0,0,obj_room_transition)
			with global.roomTrans
			{
				roomFrom = room;
				roomTo = rm_arena1;
			}
			instance_create_layer(0,0,"lay_technicals",obj_comboCache);
			instance_create_layer(0,0,"lay_player",obj_player);
			instance_create_layer(-10,-10,"lay_technicals",obj_controller);
			instance_create_layer(0,0,"lay_technicals",obj_arena_controller);
			instance_create_depth(0,0,-10000,obj_transition_controller);
			instance_destroy();
			break;
		case "Exit":
			game_end();
			break;
	}
}

if sX != sXPrev || sY != sYPrev audio_play_sound(snd_menu_navigate,10,0)