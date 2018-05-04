///@arg [startFrame-endframe]or-1
///@arg follow
///@arg duration
///@arg damageData
///@arg damagePower
///@arg staggerPower
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
	hitEffects = argument9;
	
		//get mainType
	var highest = 0;
	mainType = damageType.slash;
	if hitData[? damageData.slash] > highest {mainType = damageType.slash; highest = hitData[? damageData.slash];};
	if hitData[? damageData.pierce] > highest {mainType = damageType.pierce; highest = hitData[? damageData.pierce];};
	if hitData[? damageData.blunt] > highest {mainType = damageType.blunt; highest = hitData[? damageData.blunt];};
	if hitData[? damageData.fire] > highest {mainType = damageType.fire; highest = hitData[? damageData.fire];};
	if hitData[? damageData.ice] > highest {mainType = damageType.ice; highest = hitData[? damageData.ice];};
	if hitData[? damageData.lightning] > highest {mainType = damageType.lightning; highest = hitData[? damageData.lightning];};
	if hitData[? damageData.arcane] > highest {mainType = damageType.arcane; highest = hitData[? damageData.arcane];};
	if hitData[? damageData.light] > highest {mainType = damageType.light; highest = hitData[? damageData.light];};
	if hitData[? damageData.dark] > highest {mainType = damageType.dark; highest = hitData[? damageData.dark];};	
	
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