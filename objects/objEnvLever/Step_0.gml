var prevState = enabled

if used
{
	used = false;
	var newValue = !enabled
	enabled = newValue;
	WorldCache.environment[| ID] = newValue;
}

if enabled = noone
{
	if ID = noone enabled = false;
	else enabled = WorldCache.environment[| ID];
}

playerCanUse = false;
if instance_exists(objPlayer) && abs(x-objPlayer.x) <= useRange && abs(y-objPlayer.y) <= useRange*2 && objPlayer.canAct
{
	playerCanUse = true;
}

if enabled image_index = 1;
else image_index = 0;