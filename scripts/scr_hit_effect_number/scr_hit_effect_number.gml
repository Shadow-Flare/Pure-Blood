///@arg xPos
///@arg yPos
///@arg damageType.ENUM
///@arg damageNum

var xRoom = argument0;
var yRoom = argument1;
var type = argument2;
var number = argument3;

var xShift = random_range(-8,8);
xRoom += xShift;

var ang = 90+random_range(40,70)*sign(xShift);
var spd = 0.3;
var xMod = spd*dcos(ang);
var yMod = -spd*dsin(ang);

var col;
switch type
{
	case damageType.slash: col = make_colour_rgb(255,255,255); break;
	case damageType.pierce: col = make_colour_rgb(255,255,255) break;
	case damageType.blunt: col = make_colour_rgb(255,255,255) break;
	case damageType.fire: col = make_colour_rgb(242,125,12) break;
	case damageType.ice: col = make_colour_rgb(165,242,243) break;
	case damageType.lightning: col = make_colour_rgb(253,208,35) break;
	case damageType.arcane: col = make_colour_rgb(193,116,182) break;
	case damageType.light: col = make_colour_rgb(255,255,153) break;
	case damageType.dark: col = make_colour_rgb(255,255,200) break;
	case damageType.pure: col = make_colour_rgb(255,255,255); break;
}

var cache = ds_list_create();
ds_list_add(HudManager.damageNumbers,cache)

cache[| 0] = round(number);
cache[| 1] = col;
cache[| 2] = xRoom;
cache[| 3] = yRoom;
cache[| 4] = xMod;
cache[| 5] = yMod;
cache[| 6] = 2*room_speed;