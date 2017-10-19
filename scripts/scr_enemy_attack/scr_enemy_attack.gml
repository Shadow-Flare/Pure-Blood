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
with instance_create_layer(x,y,layer,obj_enemy_attack_effect)
{
	//get effect properties/collisions
	attackDuration = argument0;  				//seconds
	attackXOffset = argument1;
	attackYOffset = argument2;
	attackWidth = argument3;
	attackHeight = argument4;
	//STATS
	hitType = argument5;	//Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
	hitDamage = argument6;
	hitStagger = argument7;
	hitKnockback = argument8;
	statusType = argument9;
	statusValue = argument10;
	pierce = argument11;
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
	
	hasHit = 0;
	
	hitList = ds_list_create();
hitOn = 1;
}