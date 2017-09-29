//room settings
var RM = room_get_name(room)
switch (RM)
{
	case "rm_room1":
		darknessStr = 0.8;
		fogLevel = 1;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 0.8
		break;
	case "rm_room2":
		darknessStr = 0.9;
		fogLevel = 2;
		rain = 1;
		paraASpd = 0.9;
		paraBSpd = 1.1;
		backgroundSpeed = 0.8
		break;
	case "rm_room3":
		darknessStr = 0.95;
		fogLevel = 3;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena1":
		darknessStr = 0.8;
		fogLevel = 0;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena2":
		darknessStr = 0.9;
		fogLevel = 0;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena3":
		darknessStr = 0.8;
		fogLevel = 3;
		rain = 0;
		paraASpd = 1;
		paraBSpd = 1;
		backgroundSpeed = 1;
		break;
	case "rm_arena4":
		darknessStr = 0.7;
		fogLevel = 3;
		rain = 1;
		paraASpd = 0.9;
		paraBSpd = 1.1;
		backgroundSpeed = 0.8;
		break;
}
