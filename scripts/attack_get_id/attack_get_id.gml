///@arg attackNum(VAR)
///@arg vState(ENUM)
var attNum = argument0;
var vSt = argument1;

	//get weapon class
var class = weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type);

	//depending on arg1, determine which combo cache type needs to be accessd to get attack ID, assumed player isnt attacking more than combo+finisher times
var tmp = PlayerStats.classComboCache[? class];
var neededTypeComboCache = noone;
switch vSt
{
	case vState.grounded:
		if attNum < PlayerStats.GCS[? class] neededTypeComboCache = tmp[?  weaponComboTypes.groundCombo];
		else {neededTypeComboCache = tmp[?  weaponComboTypes.groundFinisher]; attNum -= PlayerStats.GCS[? class];}
		break;
	case vState.jumping:
	case vState.midAir:
		if attNum < PlayerStats.ACS[? class] neededTypeComboCache = tmp[?  weaponComboTypes.aerialCombo];
		else {neededTypeComboCache = tmp[?  weaponComboTypes.aerialFinisher]; attNum -= PlayerStats.ACS[? class];}
		break
}

return neededTypeComboCache[| attNum];