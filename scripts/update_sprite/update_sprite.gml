///@arg baseSprite
///@arg imageSpeed

if baseSpriteIndex != argument0
{
	var weaponCatStr = "Sword"			//CHANGE, make dependent on current cat.
	var weaponStr = "Gladius"			//CHANGE, make dependent on current wep.

	//baseSprite update
	baseSpriteIndex = argument0;
	image_index = 0;
	image_speed = argument1;

	//get strings
		//body sprite
	var bodySpriteName = string_replace(sprite_get_name(baseSpriteIndex),"Sword",weaponCatStr);
	
		//weapon sprite
	var weaponSpriteName = string_replace(bodySpriteName,"Body","Weapon");
	weaponSpriteName = string_replace(weaponSpriteName,weaponCatStr,weaponStr);
	
		//effect sprite
	var effectSpriteName = string_replace(weaponSpriteName,"Weapon","Effect");
	if attackName == "Uppercut" 
	{
		effectSpriteName = string_replace(effectSpriteName,weaponStr,"");
	}

	//roundup
		//body sprite
	if asset_get_type(bodySpriteName) != asset_unknown sprite_index = asset_get_index(bodySpriteName);
	else sprite_index = sprPlayerBodySpriteMissing;
	
		//weapon sprite
	if asset_get_type(weaponSpriteName) != asset_unknown weaponSpriteIndex = asset_get_index(weaponSpriteName);
	else weaponSpriteIndex = noone;
	
		//effect sprite
	if asset_get_type(effectSpriteName) != asset_unknown effectSpriteIndex = asset_get_index(effectSpriteName);
	else effectSpriteIndex = noone;
		
		//Auxiliary sprite; just a reset, if used, code for it is added AFTER this script
	auxSpriteIndex = noone;
	auxSpriteXOffset = 0;
	auxSpriteYOffset = 0;
	auxSpriteXScale = 1;
	auxSpriteYScale = 1;
	auxSpriteRotation = 0;
}