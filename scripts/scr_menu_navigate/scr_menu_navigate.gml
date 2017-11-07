//prev
sXPrev = sX;
sYPrev = sY;
sExpYPrev = sExpY;

//checks
var absHInput = abs(InputManager.moveInputH);
var absVInput = abs(InputManager.moveInputV);
var horInputMoreThanVert = absHInput >= absVInput;

//move left / right / up / down
if  (moveTimer == 0) || 
	(moveTimer >= ceil(0.3 * room_speed) && moveTimer < ceil(1.0 * room_speed) && floor(moveTimer % (ceil(0.35 * room_speed))) == 0) ||
	(moveTimer >= ceil(1.0 * room_speed) && floor(moveTimer%(ceil((1 / 10) * room_speed))) == 0)
{
	if (absHInput > 0.5 && horInputMoreThanVert) {sX += sign(InputManager.moveInputH); movedH = 1;}
	else if InputManager.dRInput {sX++; movedH = 1;}
	else if InputManager.dLInput {sX--; movedH = 1;}
	
	if (sX < 0) sX = array_height_2d(current_menu_options) - 1; 
	else if (sX >= array_height_2d(current_menu_options)) sX = 0;

	if (sY >= array_length_2d(current_menu_options,sX) ) sY = array_length_2d(current_menu_options,sX) - 1;

	if (absVInput > 0.5 && !horInputMoreThanVert) sY += sign(InputManager.moveInputV);
	else if InputManager.dDInput sY++;
	else if InputManager.dUInput sY--;
		
	if (sY < 0) sY = array_length_2d(current_menu_options,sX) - 1;
	else if (sY >= array_length_2d(current_menu_options,sX)) sY = 0;
}

if (absHInput > 0.5 || absVInput > 0.5 || InputManager.dLInput || InputManager.dRInput || InputManager.dUInput || InputManager.dDInput)
{
	moveTimer++;
}
else { moveTimer = 0 };

if sX != sXPrev || sY != sYPrev || sExpY != sExpYPrev audio_play_sound(snd_menu_navigate,10,0)