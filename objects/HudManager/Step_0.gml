showHud = CutsceneManager.showHud;

if showHud var modSign = 1;
else var modSign = -1;
hudAlpha = clamp(hudAlpha+modSign/(hudFadeDuration*room_speed),0,1);

if InputManager.backInput
{
	hudMapEnabled = !hudMapEnabled;
}