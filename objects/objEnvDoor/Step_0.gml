if ID == noone open = false;
else open = WorldCache.environment[| ID];

transitionTimer++
if transitionTimer % round((transitionDuration*room_speed)/sprite_get_number(sprite_index)) == 0
{
	if open var imageMod = 1;
	else imageMod = -1;
	image_index = clamp(image_index+imageMod,0,sprite_get_number(sprite_index)-1);
}

if image_index = 0 solid = true
else if image_index = sprite_get_number(sprite_index)-1 solid = false;