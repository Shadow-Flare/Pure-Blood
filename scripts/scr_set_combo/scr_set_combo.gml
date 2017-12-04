///@arg class
///@arg type
///@arg slot
///@arg attackId
var class = argument0;
var type = argument1;
var slot = argument2;
var attackID = argument3;

//initialize and/or deligate major caches to local variables
var cache = PlayerStats.classComboCache[? class];

switch type
{
	case 1:
		var cache = cache[? weaponComboTypes.groundCombo];
		break;
	case 2:
		var cache = cache[? weaponComboTypes.groundFinisher];
		slot -= class_get_stat(class,weaponClassStats.groundComboLength)
		break;
}

cache[| slot] = attackID;