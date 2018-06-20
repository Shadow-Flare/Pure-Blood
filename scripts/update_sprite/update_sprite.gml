///@arg baseSprite
///@arg imageSpeed
var baseSpriteInput = argument0;
var imageSpeedInput = argument1;

if baseSpriteIndex != baseSpriteInput || mainWeaponEquipmentChange || weaponSummonPhaseChange
{
	var weaponStr = item_get_data(itemType.weapon,PlayerStats.currentWeaponID,itemStats.name);
	var weaponCatStr = string_letters(class_get_stat(weapon_get_stat(PlayerStats.currentWeaponID,weaponStats.type),weaponClassStats.name));

	//baseSprite update
	var baseSpriteIndexPrev = baseSpriteIndex;
	baseSpriteIndex = baseSpriteInput;

	//get strings
		//body sprite
	var bodySpriteName = sprite_get_name(baseSpriteIndex);
	
		//weapon sprite
	var weaponSpriteName = "";
	if weaponSummonPhase != weaponSummonState.unsummoned
	{
		var tmp = string_replace(bodySpriteName,"Default",weaponCatStr);
		if asset_get_type(tmp) == asset_sprite bodySpriteName = tmp;
	
		weaponSpriteName = string_replace(sprite_get_name(baseSpriteIndex),"Body","Weapon");
		weaponSpriteName = string_replace(weaponSpriteName,weaponCatStr,weaponStr);
		weaponSpriteName = string_replace(weaponSpriteName,"Default",weaponStr);
	
		if phase = state.attacking && attackID == comboID.misc_uppercut
		{
			var offhandName = "Crossbow"; //UPDATE THIS WHEN OFFHAND ITEMS ADDED
			tmp = string_replace(bodySpriteName,"Offhand",offhandName);
			if asset_get_type(tmp) == asset_sprite
			{
				bodySpriteName = tmp;
				weaponSpriteName = string_replace(weaponSpriteName,"Offhand",offhandName);
			}
		}
			//weapon sprite
		if asset_get_type(weaponSpriteName) == asset_sprite weaponSpriteIndex = asset_get_index(weaponSpriteName);
		else weaponSpriteIndex = noone;
	}
	else weaponSpriteIndex = noone;
	
		//body sprite part 2 (incase weapon demands switch)
	if asset_get_type(bodySpriteName) == asset_sprite sprite_index = asset_get_index(bodySpriteName);
	else sprite_index = sprPlayerBodySpriteMissing;

	//roundup
		//speed and index reset
	if baseSpriteIndexPrev != baseSpriteInput || mainWeaponEquipmentChange || !weaponSummonPhaseChange image_index = 0;	//if this run wasnt caused by weaponSummonPhaseChange
	if sign(imageSpeedInput) >= 0	image_speed = imageSpeedInput;
	else if sign(imageSpeedInput) == -1 image_speed = sprite_get_number(sprite_index)/abs(imageSpeedInput);
		
		//Auxiliary sprite; just a reset, if used, code for it is added AFTER this script
	auxSpriteIndex = noone;
	auxSpriteXOffset = 0;
	auxSpriteYOffset = 0;
	auxSpriteXScale = 1;
	auxSpriteYScale = 1;
	auxSpriteRotation = 0;
	
		//change equipchange clause
	mainWeaponEquipmentChange = false;
	weaponSummonPhaseChange = false;
}