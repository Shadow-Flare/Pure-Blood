///@arg baseSprite
///@arg imageSpeed

if baseSpriteIndex != argument0
{
	var entityName = object_get_name(object_index)
	entityName = string_replace(entityName,"obj","");

	//baseSprite update
	baseSpriteIndex = argument0;
	image_index = 0;
	image_speed = argument1;

	//get strings
		//body sprite
	var bodySpriteName = string_replace(sprite_get_name(baseSpriteIndex),"Zombie",entityName);
		
		//effect sprite
	var effectSpriteName = string_replace(bodySpriteName,"Body","Effect");

	//roundup
		//body sprite
	if asset_get_type(bodySpriteName) != asset_unknown sprite_index = asset_get_index(bodySpriteName);
	else sprite_index = sprEnemySpriteMissing;
	
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