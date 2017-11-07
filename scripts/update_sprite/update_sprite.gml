///@arg baseSprite
///@arg imageSpeed

if baseSpriteIndex != argument0 || equipmentChange
{
	//change equipchange clause
	equipmentChange = false;
	
	var weaponStr = weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.name);
	var weaponCatStr = class_get_stat(weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type),weaponClassStats.name);

	//baseSprite update
	baseSpriteIndex = argument0;

	//get strings
		//body sprite
	var bodySpriteName = sprite_get_name(baseSpriteIndex);
	var tmp = string_replace(bodySpriteName,"Default",weaponCatStr);
	if asset_get_type(tmp) == asset_sprite bodySpriteName = tmp;
	
		//weapon sprite
	var weaponSpriteName = string_replace(sprite_get_name(baseSpriteIndex),"Body","Weapon");
	weaponSpriteName = string_replace(weaponSpriteName,weaponCatStr,weaponStr);
	weaponSpriteName = string_replace(weaponSpriteName,"Default",weaponStr);
	
	//	//effect sprite
	//var effectSpriteName = string_replace(weaponSpriteName,"Weapon","Effect");
	//if attackName == "Uppercut" 
	//{
	//	effectSpriteName = string_replace(effectSpriteName,weaponStr,"");
	//}

	//roundup
		//body sprite
	if asset_get_type(bodySpriteName) == asset_sprite sprite_index = asset_get_index(bodySpriteName);
	else sprite_index = sprPlayerBodySpriteMissing;
	
		//weapon sprite
	if asset_get_type(weaponSpriteName) == asset_sprite weaponSpriteIndex = asset_get_index(weaponSpriteName);
	else weaponSpriteIndex = noone;
	
			//speed and index reset
	image_index = 0;
	if sign(argument1) >= 0	image_speed = argument1;
	else if sign(argument1) == -1 image_speed = sprite_get_number(sprite_index)/abs(argument1);
		
		//Auxiliary sprite; just a reset, if used, code for it is added AFTER this script
	auxSpriteIndex = noone;
	auxSpriteXOffset = 0;
	auxSpriteYOffset = 0;
	auxSpriteXScale = 1;
	auxSpriteYScale = 1;
	auxSpriteRotation = 0;
}