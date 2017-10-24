///@arg follow
///@arg duration
///@arg x_off
///@arg y_off
///@arg width
///@arg height
///@arg damage_type
///@arg damage
///@arg stagger
///@arg knockback
///@arg status_type
///@arg status_value
///@arg pierce

var enemy = id;
var attackEffect = instance_create_layer(x,y,layer,obj_enemy_attack_effect)
with attackEffect
{
	//get effect properties/collisions
	follow = argument0;
	attackDuration = argument1;  				//seconds
	attackXOffset = argument2;
	attackYOffset = argument3;
	attackWidth = argument4;
	attackHeight = argument5;
	//STATS
	hitType = argument6;	//Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
	hitDamage = argument7;
	hitStagger = argument8;
	hitKnockback = argument9;
	statusType = argument10;
	statusValue = argument11;
	pierce = argument12;
	type = "melee";
	//Set
	timer = 0;
	facing = enemy.facing;
	//pos
	x=enemy.x+facing*attackXOffset;
	y=enemy.y+attackYOffset;
	//size
	sprite_index = spr_attack_effect_editor;
	image_xscale *= facing*attackWidth/3;
	image_yscale *=	attackHeight/3;
	caster = enemy;
	casterType = enemy.actorType;
	
	hasHit = 0;
	
	hitList = ds_list_create();
	hitOn = 1;
}

return attackEffect;