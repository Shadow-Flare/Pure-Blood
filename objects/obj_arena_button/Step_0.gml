if place_meeting(x,y,objPlayer)
{
	lightUp = 1;
	timer++;
	if InputManager.bInput
	{
		pausing = 1;
	}
}
else {lightUp = 0; timer = 0;}

if timer == 16*4 timer = 0;