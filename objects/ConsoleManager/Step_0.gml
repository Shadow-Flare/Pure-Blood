#region GAME STATE
var gameStatePrev = gamePhase;
gamePhase = GameManager.gameState;
#endregion
#region RESET HELP TEXT
if gameStatePrev != gamePhase
{
	helpText = [];
	helpTextM = [];
	if gamePhase == GameState.mainMenu
	{
			//help text
		helpText[ 0] = "Developer Commands:"
		helpText[ 1] = "altStart <index or '?' for help>"
			//messages
		helpTextM[ 0] = "Details:"
		helpTextM[ 1] = "Alternative start in a different location with different starting data, '?' gives a small summary of all available."
	}
	else
	{
			//help text
		helpText[ 0] = "Developer Commands:"
		helpText[ 1] = "goto <room Name>"
		helpText[ 2] = "setroomspeed <integer > 0>"
		helpText[ 3] = "clickhack"
		helpText[ 4] = "shutdown"
		helpText[ 5] = "purefps"
		helpText[ 6] = "lightTester"
		helpText[ 7] = "ambienceTester"
		helpText[ 8] = "help   /   ?"
		helpText[ 9] = ""
		helpText[10] = "Cheats:"
		helpText[11] = "giveallsubtypes"
		helpText[12] = "giveallactives"
		helpText[13] = "thereisnospoon"
			//Messages
		helpTextM[ 0] = "Details:"
		helpTextM[ 1] = "Transfers you to <room Name>, likely will cause progression related bugs."
		helpTextM[ 2] = "Changes room speed to <integer > 0>, likely will cause many timing related bugs, dont do this."
		helpTextM[ 3] = "Enables/disables the ability to move character to the clicked location, likely will cause progression/collision related bugs."
		helpTextM[ 4] = "Hard shutdown of the game, will not save, will not do anything"
		helpTextM[ 5] = "Limit console text to only show the current fps, gives a more accurate impression since it disables other console background behaviours."
		helpTextM[ 6] = "Toggle Light Tester object and interface"
		helpTextM[ 7] = "Toggle Ambience Tester interface"
		helpTextM[ 8] = "Enable/disable help menu"
		helpTextM[ 9] = ""
		helpTextM[10] = "Details:"
		helpTextM[11] = "Player obtains all offhand subtypes."
		helpTextM[12] = "Player obtains all offhand actives."
		helpTextM[13] = "Spells have 0 cost, ammo is not needed or consumed"
	}
}
#endregion

#region TYPER
key = keyboard_lastchar;
if (key == "~" || key == "½" || key == "`" || key == "¡" || key == "/" )
{
	consoleEnabled = !consoleEnabled;
	keyboard_string = "";
	keyboard_lastchar = "";
}
#endregion
#region DO-ER
if consoleEnabled
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
	
	if keyboard_check_pressed(vk_enter)
	{
		commandStr = keyboard_string;
		keyboard_string = "";
		commandRes = "This is not a valid command, enter '?' for a list of all commands.";	
		var altStartHelp = false;
		//POTENTIAL COMMANDS GO HERE
		#region HELP TOGGLE
		if commandStr == "help" || commandStr == "?"
		{
			conHelpMenu = !conHelpMenu;
			if conHelpMenu commandRes = "help menu enabled.";
			else commandRes = "help menu disabled.";
		}
		#endregion
		if gamePhase == GameState.mainMenu
		{
			//Dev Commands
			#region ALTSTART
			tmp = string_delete(commandStr,9,string_length(commandStr)-8)
			if tmp == "altStart " || tmp == "altStart"
			{
				extra = string_delete(commandStr,1,9)
				if commandStr == "altStart " || commandStr == "altStart"
				{
					commandRes = "please enter an index to start with. (altStart <index>)";
				}
				else if extra == "?"
				{
					altStartHelp = true;
					commandRes = "Generating alternative start info.";
				}
				else if int64(extra) <= conAltStartMaxNum && int64(extra) >= 0
				{
					MainMenu.conAltStart = int64(extra);
					commandRes = "Initialting alternative start "+extra+".";
				}
				else
				{
					commandRes = "'"+extra+"' isnt a valid alternative start.";
				}
			}
			#endregion
			//Cheats
		}
		else
		{
			//Dev Commands
			#region GOTO ROOM
			tmp = string_delete(commandStr,6,string_length(commandStr)-5)
			if tmp == "goto " || tmp == "goto"
			{
				extra = string_delete(commandStr,1,5)
				if commandStr == "goto " || commandStr == "goto"
				{
					commandRes = "please enter a room. (goto <roomName>)";
				}
				else if room_exists(asset_get_index(extra))
				{
					with instance_create_depth(objPlayer.x,objPlayer.y,0,objRoomTransition)
					{
						roomFrom = room;
						roomTo = asset_get_index(other.extra)
					}
					commandRes = "moved to "+extra+".";
				}
				else
				{
					commandRes = "'"+string(extra)+"' isnt a room.";
				}
			}
			#endregion
			#region SET ROOM SPEED
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
					commandRes = "room speed changed to default ("+string(defaultRoomSpeed)+").";
				}
				else if int64(extra) > 0
				{
					room_speed = int64(extra)
					commandRes = "room speed changed to "+extra+".";
				}
				else
				{
					commandRes = "not a valid input.";
				}
			}
			#endregion
			#region SET MOVE SPEED
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
					PlayerStats.moveSpeed = PlayerStats.defaultMoveSpeed
					commandRes = "move speed changed to default ("+string(PlayerStats.defaultMoveSpeed)+").";
				}
				else if int64(extra) > 0
				{
					PlayerStats.moveSpeed = int64(extra)
					commandRes = "move speed changed to "+extra+".";
				}
				else
				{
					commandRes = "not a valid input.";
				}
			}
			#endregion
			#region VSYNC TOGGLE
			if commandStr == "purefps"
			{
				conPureFps = !conPureFps;
				if conPureFps commandRes = "Pure Fps mode enabled."
				else commandRes = "Pure Fps disabled."
			}
			#endregion
			#region CLICK HACK TOGGLE
			if commandStr == "clickhack"
			{
				conClickHack = !conClickHack;
				if conClickHack commandRes = "click hack turned on. (UNSTABLE)";
				else commandRes = "click hack turned off.";
			}
			#endregion
			#region LIGHT TESTER TOGGLE
			if commandStr == "lightTester"
			{
				if ambienceTester ambienceTester = false;
			
				if lightTester == noone || !instance_exists(lightTester)
				{
					lightTester = instance_create_layer(0,0,"lay_lights",obj_light_test)
					commandRes = "light tester enabled.";
				}
				else
				{
					instance_destroy(lightTester);
					lightTester = noone;
					commandRes = "light tester disabled.";
				}
			
				selection = 0;
			}
			#endregion
			#region AMBIENCE TESTER TOGGLE
			if commandStr == "ambienceTester"
			{
				if instance_exists(lightTester)
				{
					instance_destroy(lightTester);
					lightTester = noone;
				}
				ambienceTester = !ambienceTester;
				if ambienceTester commandRes = "ambience tester enabled.";
				else commandRes = "ambience tester disabled.";
			
				selection = 1;
				selectedPage = 0;
			}
			#endregion
			#region SHUTDOWN
			if commandStr == "hardshutdown"
			{
				game_end()
			}
			//Round-up
			keyboard_string = "";
			keyboard_lastkey = "";
			selectIndex = 0;
			if commandRes == "" commandRes = string(tmp)+"?";
			#endregion
			//Cheats
			#region GIVE ALL SUBTYPES
			if commandStr == "giveallsubtypes"
			{
				scr_player_givealloffhandsubtypes();
				commandRes = "All offhands given."
			}
			#endregion
			#region GIVE ALL ACTIVES
			if commandStr == "giveallactives"
			{
				scr_player_giveallactiveabilities();
				commandRes = "All actives given."
			}
			#endregion
			#region KILL ALL ENEMIES
			if commandStr == "iambecomedeath"
			{
				var hitData = ds_map_create();
				scr_create_damageCache(hitData,0,0,0,0,0,0,0,0,0,0,0,0);
				hitData[? damageData.pure] = 999;
				with objEnemyParent scr_hit(noone,noone,hitData,noone,noone,noone);
				ds_map_destroy(hitData);
				commandRes = "destroyer of worlds."
			}
			#endregion
			#region NO SPELL COST
			if commandStr == "thereisnospoon"
			{
				GameManager.thereisnospoon = !GameManager.thereisnospoon;
				if GameManager.thereisnospoon commandRes = "No spell cost mode enabled."
				else commandRes = "No spell cost mode disabled."
			}
			#endregion
		}
	//HISTORY LOGGER
		for(var i=0; i<maxHistory;i++)
		{
			if i!= maxHistory-1 history[maxHistory-1-i] = history[maxHistory-2-i];
			else history[0] = commandStr;
			if i!= maxHistory-1 historyM[maxHistory-1-i] = historyM[maxHistory-2-i];
			else historyM[0] = commandRes;
		}
	//ALTSTART HELP GENERATION
		if altStartHelp
		{
			skipNum = ceil((conAltStartMaxNum+1)/2)+1;
			repeat skipNum for(var i=0; i<maxHistory;i++)
			{
				if i!= maxHistory-1 history[maxHistory-1-i] = history[maxHistory-2-i];
				else history[0] = "";
				if i!= maxHistory-1 historyM[maxHistory-1-i] = historyM[maxHistory-2-i];
				else historyM[0] = "";
			}
			history[0] =		"0: New game";
			historyM[0] =		"1: Arena";
			history[1] =		"2: Horde Mode";
			historyM[1] =		"3: New game 2, alternative area";
			history[2] =		"4: New game 3, alternative area";
			historyM[2] =		"5: New game 4, Main game, start at town with max gear";
		}
		#region command log
		ini_open("settings");
			for(var i = 0; i < array_length_1d(history); i++)
			{
				ini_write_string("consoleHistory","commandHistory"+string(i),history[i]);
				ini_write_string("consoleHistory","messageHistory"+string(i),historyM[i]);
			}
		ini_close();
		#endregion
	}
}
#endregion

#region SHUTDOWN KEY
if keyboard_check_pressed(vk_end)
{
	game_end();
}
#endregion
#region CLICK HACK CODE
if conClickHack == 1 && mouse_check_button_pressed(mb_left)
{
	objPlayer.x = mouse_x;
	objPlayer.y = mouse_y;
}
#endregion
#region LIGHT TESTER CODE
if lightTester != noone
{
	if instance_exists(lightTester)
	{
		var shiftV = keyboard_check_pressed(vk_numpad8)-keyboard_check_pressed(vk_numpad2);
		var shiftH = keyboard_check_pressed(vk_numpad6)-keyboard_check_pressed(vk_numpad4);
		if shiftV = 0 shiftV = keyboard_check_pressed(ord("I"))-keyboard_check_pressed(ord("K"));
		if shiftH = 0 shiftH = keyboard_check_pressed(ord("L"))-keyboard_check_pressed(ord("J"));
		
		if shiftH != 0
		{
			selectedVariable += shiftH;
			if selectedVariable == -1 selectedVariable = 8;
			if selectedVariable == 9 selectedVariable = 0;
		}
		
		if shiftV != 0
		{
			switch selectedVariable
			{
				case 0:	//red
					lightTester.colourR = clamp(lightTester.colourR+shiftV*5,0,255);
					break;
				case 1:	//green
					lightTester.colourG = clamp(lightTester.colourG+shiftV*5,0,255);
					break;
				case 2:	//blue
					lightTester.colourB = clamp(lightTester.colourB+shiftV*5,0,255);
					break;
				case 3:	//radius
					lightTester.radius = max(lightTester.radius+shiftV*20*1,0);
					break;
				case 4: //depth
					lightTester.simDepth = clamp(lightTester.simDepth+shiftV*0.05,0,1);
					break;
				case 5:	//blurRadius
					LightingController.blurRadius = max(LightingController.blurRadius+shiftV*1,0);
					break;
				case 6:	//radialBlurFactor
					LightingController.radialBlurFactor = max(LightingController.radialBlurFactor+shiftV*0.2,0);
					break;
				case 7:	//light scale
					LightingController.lightScale = clamp(LightingController.lightScale+shiftV*5,1,6);
					
					surface_free(LightingController.occlusionMapTiles);
					LightingController.occlusionMapTiles = noone;
					surface_free(LightingController.light);
					LightingController.light = noone;
					with LightingController
					{
						var list = ["occlusionMapTiles","light","light2","temp","temp2","temp3","temp4","temp5","cutoutTiles","cutout","normalMap","normalMapCamera","specularMap","specularMapCamera"]
						for (var i = 0; i < array_length_1d(list); i++) 
						{
							if variable_instance_exists(id,list[i])
							{
								var variable = variable_instance_get(id,list[i])
								if surface_exists(variable) surface_free(variable);
								variable_instance_set(id,list[i],noone);
							}
						}
					}
					with obj_light_parent
					{
						var list = ["occlusionMap","shadowMap1D"]
						for (var i = 0; i < array_length_1d(list); i++) 
						{
							if variable_instance_exists(id,list[i])
							{
								var variable = variable_instance_get(id,list[i])
								if surface_exists(variable) surface_free(variable);
								variable_instance_set(id,list[i],noone);
							}
						}
					}
					break;
				case 8:	//dynamic light reso
					LightingController.dynamicLightReso = max(LightingController.dynamicLightReso+shiftV*4,1);
					break;
			}
		}
	}
	else lightTester = noone;
}
#endregion
#region AMBIENCE TESTER
if ambienceTester
{
	var shiftV = keyboard_check_pressed(vk_numpad8)-keyboard_check_pressed(vk_numpad2);
	var shiftH = keyboard_check_pressed(vk_numpad6)-keyboard_check_pressed(vk_numpad4);
	if shiftV = 0 shiftV = keyboard_check_pressed(ord("I"))-keyboard_check_pressed(ord("K"));
	if shiftH = 0 shiftH = keyboard_check_pressed(ord("L"))-keyboard_check_pressed(ord("J"));
		
	if shiftH != 0
	{
		selectedVariable += shiftH;
		if selectedVariable == -1 selectedVariable = 6;
		if selectedVariable == 7 selectedVariable = 0;
	}
	
	if shiftV != 0
	{
		var cache = RoomCache.rmAmbientLightData[? room];
		switch selectedPage
		{
			case 0: //Page 1
				switch selectedVariable
				{
					case 0: //Page Left
						selectedPage = 2;
					case 1:	//red
						cache[| 0] = make_color_rgb(clamp(colour_get_red(cache[| 0])+shiftV*5,0,255),colour_get_green(cache[| 0]),colour_get_blue(cache[| 0]));
						break;
					case 2:	//green
						cache[| 0] = make_color_rgb(colour_get_red(cache[| 0]),clamp(colour_get_green(cache[| 0])+shiftV*5,0,255),colour_get_blue(cache[| 0]));
						break;
					case 3:	//blue
						cache[| 0] = make_color_rgb(colour_get_red(cache[| 0]),colour_get_green(cache[| 0]),clamp(colour_get_blue(cache[| 0])+shiftV*5,0,255));
						break;
					case 4:	//blend
						cache[| 1] = clamp(cache[| 1]+shiftV*0.05,0,1);
						break;
					case 5:	//cutout blend
						cache[| 2] = clamp(cache[| 2]+shiftV*0.05,0,1);
						break;
					case 6: //Page Right
						selectedPage = 1;
				}
				break;
			case 1: //Page 2
				switch selectedVariable
				{
					case 0: //Page Left
						selectedPage = 0;
					case 1:	//Current Room darknessStr
						var cache = RoomCache.rmDarknessData;
						cache[? room] = clamp(cache[? room]+shiftV*0.05,0,1);
						LightingController.darknessStr = cache[? room];
						break;
					case 2:	//Light Shaft Red
						var cache = RoomCache.rmSunData[? room];
						cache[| 0] = make_color_rgb(clamp(colour_get_red(cache[| 0])+shiftV*5,0,255),colour_get_green(cache[| 0]),colour_get_blue(cache[| 0]));
						break;
					case 3:	//Light Shaft Blue
						var cache = RoomCache.rmSunData[? room];
						cache[| 0] = make_color_rgb(colour_get_red(cache[| 0]),clamp(colour_get_green(cache[| 0])+shiftV*5,0,255),colour_get_blue(cache[| 0]));
						break;
					case 4:	//Light Shaft Green
						var cache = RoomCache.rmSunData[? room];
						cache[| 0] = make_color_rgb(colour_get_red(cache[| 0]),colour_get_green(cache[| 0]),clamp(colour_get_blue(cache[| 0])+shiftV*5,0,255));
						break;
					case 5:	//Light Shaft Angle
						var cache = RoomCache.rmSunData[? room];
						cache[| 1] = clamp(cache[| 1]+shiftV*5,0,360);
						break;
					case 6: //Page Right
						selectedPage = 2;
				}
				break;
			case 2: //Page 3
				switch selectedVariable
				{
					case 0: //Page Left
						selectedPage = 1;
					case 1:	//Shaft radial blur1
						var cache = RoomCache.rmSunData[? room];
						cache[| 2] = max(cache[| 2]+shiftV*0.05,0);
						break;
					case 2:	//shaft reso
						LightingController.shaftLightReso += shiftV*16;
						break;
					case 3:	//shaft linear reso
						LightingController.shaftLightStepReso += shiftV*16;
						break;
					case 4:	//nothing
						//
						break;
					case 5:	//nothing
						//
						break;
					case 6: //Page Right
						selectedPage = 0;
				}
				break;
		}
		with LightingController
		{
			var ambienceCache = RoomCache.rmAmbientLightData[? room];
			ambienceColour = ambienceCache[| 0];
			ambienceBlendStr = ambienceCache[| 1];
			ambienceCutoutStr = ambienceCache[| 2];
		}
	}
}
#endregion
#region MANAGE LOCKON DATA
if instance_exists(objPlayer)
{
	switch objPlayer.lockOnType
	{
		case lockOn.off:
			conLockOnType = "No Lock";
			break;
		case lockOn.soft:
			conLockOnType = "Soft Lock";
			break;
		case lockOn.hard:
			conLockOnType = "Hard Lock";
			break;
	}

	conLockOnTarget = noone
	if objPlayer.lockOnTarget != noone
	{
		with objPlayer.lockOnTarget other.conLockOnTarget = object_index
	}
}
#endregion