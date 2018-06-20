///@arg actionDataMap
///@arg hitDamagePower
///@arg hitStaggerPower
var dataMap = argument0;
var hitDamagePower = argument1;
var hitStaggerPower = argument2;

var enemy = id;
var attackEffect = instance_create_depth(x,y,depth+1,objMeleeAttackEffect)
with attackEffect
{
	caster = enemy;
	casterType = enemy.actorType;
		//base data
	frameData = dataMap[? enemyActionData.frameData];
	follow = dataMap[? enemyActionData.follow];
	attackDuration = dataMap[? enemyActionData.hitDuration];
	hitAngle = dataMap[? enemyActionData.hitAngle];;
		//hit data
	hitData = ds_map_create();
	ds_map_copy(hitData,dataMap[? enemyActionData.damageData]);
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
	
	pierce = dataMap[? enemyActionData.pierce];
	hitEffects = dataMap[? enemyActionData.hitEffects];
	
		//get mainType
	mainType = scr_damageCache_get_mainType(hitData);
	
		//Set
	timer = 0;
	facing = enemy.facing;
	
		//audio
	hitSoundID = dataMap[? enemyActionData.hitSoundID];
		//get sprite
	var effectSpriteName = string_replace(sprite_get_name(dataMap[? enemyActionData.animation]),"Body","Effect");
	
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