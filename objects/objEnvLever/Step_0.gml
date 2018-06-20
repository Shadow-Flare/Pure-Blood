event_inherited();

var prevState = enabled

if used
{
	used = false;
	var newValue = !enabled
	enabled = newValue;
	WorldCache.environment[? ID] = newValue;
}

if enabled = noone
{
	if ID = noone enabled = false;
	else enabled = WorldCache.environment[? ID];
}

if enabled image_index = 1;
else image_index = 0;