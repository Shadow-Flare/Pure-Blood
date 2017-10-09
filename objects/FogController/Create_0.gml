event_inherited();

//fog: initials
fogSpriteNumbers = [0,0,0];
fogSpriteData = noone
for (var i = 0; i < 3; i++)
{
	fogSurfaces[i] = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
}

switch (RoomCache.rmFogData[? room]) //sprites per 1000
{
	case 0:
		fogSpriteNumbers = [0,0,0];
		break;
	case 1:
		fogSpriteNumbers = [12,0,0];
		break;
	case 2:
		fogSpriteNumbers = [7,7,0];
		break;
	case 3:
		fogSpriteNumbers = [6,6,6];
		break;
}