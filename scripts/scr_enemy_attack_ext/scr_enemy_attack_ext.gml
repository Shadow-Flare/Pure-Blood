///@arg [startFrame-endframe]or-1
///@arg follow
///@arg duration
///@arg damageData
///@arg damagePower
///@arg staggerPower
///@arg pierce
///@arg animation
///@arg soundID
///@arg hitAngle
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
	hitAngle = argument9;
		//hit data
	hitData = ds_map_create();
	ds_map_copy(hitData,argument3);
	var hitDamagePower = argument4;
	var hitStaggerPower = argument5;
	hitData[? damageData.stagger] *= hitStaggerPower;
	hitData[? damageData.knockback] *= hitStaggerPower;
	hitData[? damageData.slash] *= hitDamagePower;
	hitData[? damageData.pierce] *= hitDamagePower;
	hitData[? damageData.blunt] *= hitDamagePower;
	hitData[? damageData.fire] *= hitDamagePower;
	hitData[? damageData.ice] *= hitDamagePower;
	hitData[? damageData.lightning] *= hitDamagePower;
	hitData[? damageData.arcane] *= hitDamagePower;
	hitData[? damageData.light] *= hitDamagePower;
	hitData[? damageData.dark] *= hitDamagePower;
	pierce = argument6;
	hitEffects = argument10;
	
		//get mainType
	mainType = scr_damageCache_get_mainType(hitData);
	
		//Set
	timer = 0;
	facing = enemy.facing;
	
		//audio
	hitSoundID = argument8;
		//get sprite
	var effectSpriteName = string_replace(sprite_get_name(argument7),"Body","Effect");
	
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