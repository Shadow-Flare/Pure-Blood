///@arg [startFrame-endframe]or-1
///@arg follow
///@arg duration
///@arg hitData
///@arg pierce
///@arg animation
///@arg soundID
///@arg effects

var enemy = id;
var attackEffect = instance_create_depth(x,y,depth+1,objMeleeAttackEffect)
with attackEffect
{
	caster = enemy;
	casterType = enemy.actorType;
		//base data
	frameData = argument0
	follow = argument1;
	attackDuration = argument2;  				//seconds
	hitAngle = noone;
	
	hitData = ds_map_create();
	ds_map_copy(hitData,argument3);
		
		//change all undefined to 0
	var index = ds_map_find_first(hitData);
	while (index != undefined)
	{
		if hitData[? index] == undefined hitData[? index] = 0;
		index = ds_map_find_next(hitData,index);
	}
		
	mainType = scr_damageCache_get_mainType(hitData);

	pierce = argument4;
	hitEffects = argument7;
	//Set
	timer = 0;
	facing = enemy.facing;
	
		//audio
	hitSoundID = argument6;
		//get sprite
	var effectSpriteName = string_replace(sprite_get_name(argument5),"Body","Effect");
	
		//set data
	if asset_get_type(effectSpriteName) == asset_sprite
	{
		sprite_index = asset_get_index(effectSpriteName);
		image_index = 0;
		image_speed = sprite_get_number(sprite_index)/abs(attackDuration);
		image_xscale = facing;
	}
}

return attackEffect;