//prevs
sXPrev = sX;
sYPrev = sY;

//navigate
if transType == mainTransType.none
{
	if  moveTimer == 0 || 
		(moveTimer >= ceil(0.3*room_speed) && moveTimer < ceil(1.0*room_speed) && floor(moveTimer%(ceil(0.35*room_speed))) == 0) ||
		(moveTimer >= ceil(1.0*room_speed) && floor(moveTimer%(ceil((1/10)*room_speed))) == 0)
	{
		if (InputManager.moveInputH > 0.5 && abs(InputManager.moveInputH) >= abs(InputManager.moveInputV)) || InputManager.dRInput sX++;
		if (InputManager.moveInputH < -0.5 && abs(InputManager.moveInputH) >= abs(InputManager.moveInputV)) || InputManager.dLInput sX--;
		if sX < 0  sX = 0;
		else if sX >= array_height_2d(current_menu_options) sX = array_height_2d(current_menu_options) - 1;
		if sY >= array_length_2d(current_menu_options,sX) sY = array_length_2d(current_menu_options,sX)-1;
			//vertical
		if (InputManager.moveInputV > 0.5 && abs(InputManager.moveInputV) > abs(InputManager.moveInputH)) || InputManager.dDInput sY++;
		if (InputManager.moveInputV < -0.5 && abs(InputManager.moveInputV) > abs(InputManager.moveInputH)) || InputManager.dUInput sY--;
		if sY < 0 sY = array_length_2d(current_menu_options,sX) - 1;
		else if sY >= array_length_2d(current_menu_options,sX) sY = 0;
	}

	if (abs(InputManager.moveInputH) > 0.5 || abs(InputManager.moveInputV) > 0.5 || InputManager.dLInput || InputManager.dRInput || InputManager.dUInput || InputManager.dDInput)
	{
		moveTimer++;
	}
	else moveTimer = 0;

	selection = current_menu_options[sX,sY];

	//A Input
	if InputManager.aInput == 1
	{
		audio_play_sound(snd_menu_select,10,0);
		switch selection
		{
			case "Start":
				transType = mainTransType.newGame;
				break;
			case "Arena":
				transType = mainTransType.arena;
				break;
			case "Horde Mode":
				transType = mainTransType.hordeMode;
				break;
			case "Exit":
				transType = mainTransType.ex;
				break;
		}
	}
}

if conAltStart != noone
{
	switch conAltStart
	{
		case 0:		//newGame
			transType = mainTransType.newGame;
			break;
		case 1:		//Arena
			transType = mainTransType.arena;
			break;
		case 2:		//Horde
			transType = mainTransType.hordeMode;
			break;
		case 3:		//newGame2: Alt area
			transType = mainTransType.newGame2;
			break;
		case 4:		//newGame3: Alt Area
			transType = mainTransType.newGame3;
			break;
		case 5:		//newGame4: Start in town, max gear
			transType = mainTransType.newGame4;
			break;
	}
}

if sX != sXPrev || sY != sYPrev audio_play_sound(snd_menu_navigate,10,0)

switch transType
{
	case mainTransType.none:
		transTimer = max(transTimer-1,0);
		break;
	case mainTransType.newGame:
		transTimer = min(transTimer+1,room_speed*transDur);
		if transTimer >= round(room_speed*transDur)
		{
			with instance_create_depth(0,0,0,LoadingParser) {roomTo = rmRoomX100Y399; type = loadType.newGame; transDur = other.transDur; transTimer = 0;}
			room_goto(loading);
		}
		break;
	case mainTransType.arena:
		transTimer = min(transTimer+1,room_speed*transDur);
		if transTimer >= round(room_speed*transDur)
		{
			with instance_create_depth(0,0,0,LoadingParser) {roomTo = rmArena1; type = loadType.arena; transDur = other.transDur; transTimer = 0;}
			room_goto(loading);
		}
		break;
	case mainTransType.hordeMode:
		transTimer = min(transTimer+1,room_speed*transDur);
		if transTimer >= round(room_speed*transDur)
		{
			with instance_create_depth(0,0,0,LoadingParser) {roomTo = rmHorde1; type = loadType.hordeMode; transDur = other.transDur; transTimer = 0;}
			room_goto(loading);
		}
		break;
	case mainTransType.newGame2:
		transTimer = min(transTimer+1,room_speed*transDur);
		if transTimer >= round(room_speed*transDur)
		{
			with instance_create_depth(0,0,0,LoadingParser) {roomTo = rmRoomX100Y299; type = loadType.newGame2; transDur = other.transDur; transTimer = 0;}
			room_goto(loading);
		}
		break;
	case mainTransType.newGame3:
		transTimer = min(transTimer+1,room_speed*transDur);
		if transTimer >= round(room_speed*transDur)
		{
			with instance_create_depth(0,0,0,LoadingParser) {roomTo = rmRoomX100Y500; type = loadType.newGame3; transDur = other.transDur; transTimer = 0;}
			room_goto(loading);
		}
		break;
	case mainTransType.newGame4:
		transTimer = min(transTimer+1,room_speed*transDur);
		if transTimer >= round(room_speed*transDur)
		{
			with instance_create_depth(0,0,0,LoadingParser) {roomTo = rmRoomX123Y397; type = loadType.newGame4; transDur = other.transDur; transTimer = 0;}
			room_goto(loading);
		}
		break;
	case mainTransType.ex:
		transTimer = min(transTimer+1,room_speed*transDur);
		if transTimer >= round(room_speed*transDur)
		{
			game_end();
		}
		break;
}