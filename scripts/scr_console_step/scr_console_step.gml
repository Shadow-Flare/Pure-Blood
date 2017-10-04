//TYPER
key = keyboard_lastchar;
if (key == "~" || key == "½" || key == "`" || key == "¡" || key == "/" )&&(consoleState == "off")
{
	consoleState = "on";
	keyboard_string = "";
	keyboard_lastchar = "";
}
else if (key == "~" || key == "½" || key == "`" || key == "¡" || key == "/" )&&(consoleState == "on")
{
	consoleState = "off";
	keyboard_string = "";
	keyboard_lastchar = "";
}

//DO-ER
if consoleState == "on"
{	
	if string_length(keyboard_string)>25 keyboard_string = string_delete(keyboard_string,26,20);
	if keyboard_check_pressed(vk_down)&&selectIndex != 7
	{
		selectIndex++;
		keyboard_string = history[selectIndex-1]
	}
	if keyboard_check_pressed(vk_up)&&selectIndex != 0
	{
		selectIndex--;
		if selectIndex != 0 keyboard_string = history[selectIndex-1]
		else keyboard_string = "";
	}
	
	if keyboard_lastkey == vk_enter
	{
		commandStr = keyboard_string;
		commandRes = "";	
	//POTENTIAL COMMANDS GO HERE
		//GOTO ROOM
		tmp = string_delete(keyboard_string,6,string_length(keyboard_string)-5)
		if tmp == "goto " || tmp == "goto"
		{
			extra = string_delete(commandStr,1,5)
			if commandStr == "goto " || commandStr == "goto"
			{
				commandRes = "please enter a room. (goto <roomName>)";
			}
			else if room_exists(asset_get_index(extra))
			{
				with instance_create_depth(player.x,player.y,0,objRoomTransition)
				{
					roomFrom = room;
					roomTo = asset_get_index(other.extra)
				}
				commandRes = "moved to "+extra+" boss.";
				audio_play_sound(snd_1,10,0);
			}
			else
			{
				commandRes = "'"+string(extra)+"' isnt a room boss.";
			}
		}
		//SET ROOM SPEED
		tmp = string_delete(commandStr,13,string_length(commandStr)-12)
		if tmp == "setroomspeed " || tmp == "setroomspeed"
		{
			extra = string_digits(string_delete(commandStr,1,12))
			if commandStr == "setroomspeed " || commandStr == "setroomspeed"
			{
				commandRes = "please enter a number. (greater than 0)";
			}
			else if extra == "default"
			{
				room_speed = defaultRoomSpeed
				commandRes = "room speed changed to default ("+string(defaultRoomSpeed)+") boss.";
				audio_play_sound(snd_1,10,0);
			}
			else if int64(extra) > 0
			{
				room_speed = int64(extra)
				commandRes = "room speed changed to "+extra+" boss.";
				audio_play_sound(snd_1,10,0);
			}
			else
			{
				commandRes = "not a valid input boss.";
			}
		}
		//SET MOVE SPEED
		tmp = string_delete(commandStr,13,string_length(commandStr)-12)
		if tmp == "setmovespeed " || tmp == "setmovespeed"
		{
			extra = string_digits(string_delete(commandStr,1,12))
			if commandStr == "setmovespeed " || commandStr == "setmovespeed"
			{
				commandRes = "please enter a number. (greater than 0 or 'default')";
			}
			else if extra == "default"
			{
				player.moveSpeed = player.defaultMoveSpeed
				commandRes = "move speed changed to default ("+string(player.defaultMoveSpeed)+") boss.";
				audio_play_sound(snd_1,10,0);
			}
			else if int64(extra) > 0
			{
				player.moveSpeed = int64(extra)
				commandRes = "move speed changed to "+extra+" boss.";
				audio_play_sound(snd_1,10,0);
			}
			else
			{
				commandRes = "not a valid input boss.";
			}
		}
		//VSYNC TOGGLE
		if commandStr == "vsync toggle"
		{
			global.vsync *= -1;
			if global.vsync = 1 commandRes = "Vsync enabled boss."
			else commandRes = "Vsync disabled boss."
		}
		//CLICK HACK TOGGLE
		if commandStr == "clickhack"
		{
			if clickHack == 0 
			{
				clickHack = 1;
				commandRes = "click hack turned on boss. (UNSTABLE)";
			}
			else
			{
				clickHack = 0;
				commandRes = "click hack turned off boss.";
			}
		}
		//help TOGGLE
		if commandStr == "help" || commandStr == "?"
		{
			if helpMenu == 0
			{
				helpMenu = 1;
				commandRes = "help menu enabled boss.";
			}
			else
			{
				helpMenu = 0;
				commandRes = "help menu disabled boss.";
			}
		}
		//HISTORY LOGGER
		for(var i=0; i<7;i++)
		{
			if i!= 6 history[6-i] = history[5-i];
			else history[0] = commandStr;
			if i!= 6 historyM[6-i] = historyM[5-i];
			else historyM[0] = commandRes;
		}
		//SHUTDOWN
		if commandStr == "hardshutdown"
		{
			game_end()
		}
		//Round-up
		keyboard_string = "";
		keyboard_lastkey = "";
		selectIndex = 0;
		if commandRes == "" commandRes = string(tmp)+"?";
	}
}

//SHUTDOWN KEY
if keyboard_check_pressed(vk_end)
{
	game_end();
}

//CLICK HACK CODE
if clickHack == 1 && mouse_check_button_pressed(mb_left)
{
	player.x = mouse_x;
	player.y = mouse_y;
}

//EXTRAS
if player.softLockOn lockOnType = "Soft Lock";
else if player.hardLockOn lockOnType = "Hard Lock";
else lockOnType = "No Lock"

lockOnTarget = noone
if player.lockOnTarget != noone
{
	with player.lockOnTarget other.lockOnTarget = object_index
}