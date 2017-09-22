if gamepad_is_connected(0)
{
	gamepad_set_axis_deadzone(0,0.3);
	//Left stick axis'
	moveInputH = gamepad_axis_value(0, gp_axislh);
	moveInputV = gamepad_axis_value(0, gp_axislv);
	
	//Right stick axis'
	targetInputH = gamepad_axis_value(0, gp_axisrh);
	targetInputV = gamepad_axis_value(0, gp_axisrv);
	
	//face buttons
	aInput = gamepad_button_check_pressed(0,gp_face1);
	bInput = gamepad_button_check_pressed(0,gp_face2);
	xInput = gamepad_button_check_pressed(0,gp_face3);
	yInput = gamepad_button_check_pressed(0,gp_face4);
	aInputHeld = gamepad_button_check(0,gp_face1);
	bInputHeld = gamepad_button_check(0,gp_face2);
	xInputHeld = gamepad_button_check(0,gp_face3);
	yInputHeld = gamepad_button_check(0,gp_face4);
	
	//shoulder buttons
	rbInput = gamepad_button_check_pressed(0,gp_shoulderr);
	lbInput = gamepad_button_check_pressed(0,gp_shoulderl);
	rtInput = gamepad_button_check_pressed(0,gp_shoulderrb);
	ltInput = gamepad_button_check_pressed(0,gp_shoulderlb);
	rbInputHeld = gamepad_button_check(0,gp_shoulderr);
	lbInputHeld = gamepad_button_check(0,gp_shoulderl);
	rtInputHeld = gamepad_button_check(0,gp_shoulderrb);
	ltInputHeld = gamepad_button_check(0,gp_shoulderlb);
	
	//D-Pad
	dLInput = gamepad_button_check_pressed(0,gp_padl);
	dRInput = gamepad_button_check_pressed(0,gp_padr);
	dUInput = gamepad_button_check_pressed(0,gp_padu);
	dDInput = gamepad_button_check_pressed(0,gp_padd);
	dLInputHeld = gamepad_button_check(0,gp_padl);
	dRInputHeld = gamepad_button_check(0,gp_padr);
	dUInputHeld = gamepad_button_check(0,gp_padu);
	dDInputHeld = gamepad_button_check(0,gp_padd);
	
	//Stick presses
	rsInput = gamepad_button_check_pressed(0,gp_stickr);
	rsInputHeld = gamepad_button_check(0,gp_stickr);
	
	startInput = gamepad_button_check_pressed(0,gp_start);
}

// Keyboard inputs
else
{
	//Left stick/movement
	if keyboard_check(vk_left) && keyboard_check(vk_right) moveInputH = 0;
	else if keyboard_check(vk_left) moveInputH = -1;
	else if keyboard_check(vk_right) moveInputH = 1;
	else moveInputH = 0;

	if keyboard_check(vk_up) && keyboard_check(vk_down) moveInputV = 0;
	else if keyboard_check(vk_up) moveInputV = -1;
	else if keyboard_check(vk_down) moveInputV = 1;
	else moveInputV = 0;
	
	//simulated right stick/movement
	keyboardTargetChangeInput = keyboard_check_pressed(vk_tab);

	//Face buttons
	aInput = keyboard_check_pressed(ord("Z"));
	xInput = keyboard_check_pressed(ord("X"));
	bInput = keyboard_check_pressed(ord("C"));
	yInput = keyboard_check_pressed(ord("V"));
	aInputHeld = keyboard_check(ord("Z"));
	xInputHeld = keyboard_check(ord("X"));
	bInputHeld = keyboard_check(ord("C"));
	yInputHeld = keyboard_check(ord("V"));
	
	//Shoulder buttons
	rbInput = keyboard_check_pressed(ord("G"));
	lbInput = keyboard_check_pressed(ord("B"));
	rtInput = keyboard_check_pressed(ord("H"));
	ltInput = keyboard_check_pressed(ord("N"));
	rbInputHeld = keyboard_check(ord("G"));
	lbInputHeld = keyboard_check(ord("B"));
	rtInputHeld = keyboard_check(ord("H"));
	ltInputHeld = keyboard_check(ord("N"));
	
	//D-Pad
	dLInput = keyboard_check_pressed(ord("A"));
	dRInput = keyboard_check_pressed(ord("D"));
	dUInput = keyboard_check_pressed(ord("W"));
	dDInput = keyboard_check_pressed(ord("S"));
	dLInputHeld = keyboard_check(ord("A"));
	dRInputHeld = keyboard_check(ord("D"));
	dUInputHeld = keyboard_check(ord("W"));
	dDInputHeld = keyboard_check(ord("S"));
	
	//Stick presses
	rsInput = keyboard_check_pressed(vk_lcontrol);
	rsInputHeld = keyboard_check(vk_lcontrol);
	
	//Other
	startInput = keyboard_check_pressed(ord("F"));
}