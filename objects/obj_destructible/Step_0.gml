event_inherited();

if damageTaken > 0 || staggerTaken > 0 || knockbackTaken > 0
{
	//create_effect(false,(bbox_right+bbox_left)/2,(bbox_top+bbox_bottom)/2,depth-1,spr_destructible_destroy_effect,0.6,1,1);
	//spawn items n stuff
	instance_destroy();
}