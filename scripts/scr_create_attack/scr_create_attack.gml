///@arg [startFrame-endframe]or-1
///@arg follow
///@arg duration
///@arg damage_type
///@arg damage
///@arg stagger
///@arg knockback
///@arg status_type
///@arg status_value
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
	hitType = argument3;	//Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
	hitDamage = argument4;
	hitStagger = argument5;
	hitKnockback = argument6;
	statusType = argument7;
	statusValue = argument8;
	pierce = argument9;
	hitEffects = argument12;
	//Set
	timer = 0;
	facing = enemy.facing;
	
		//audio
	hitSoundID = argument11;
		//get sprite
	var effectSpriteName = string_replace(sprite_get_name(argument10),"Body","Effect");
	
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