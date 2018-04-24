///@arg baseSprite
///@arg imageSpeed (negative to follow a duration)

if baseSpriteIndex != argument0
{	
	var entityName = object_get_name(object_index)
	entityName = string_replace(entityName,"obj","");

	//baseSprite update
	baseSpriteIndex = argument0;

	//get strings
		//body sprite
	var bodySpriteName = string_replace(sprite_get_name(baseSpriteIndex),"BASE",entityName);
	
	//roundup
		//body sprite
	if asset_get_type(bodySpriteName) == asset_sprite sprite_index = asset_get_index(bodySpriteName);
	else sprite_index = sprEnemySpriteMissing;
	
		//speed, blend and index reset
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