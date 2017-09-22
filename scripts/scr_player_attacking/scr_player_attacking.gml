//get needed data
var IE = instance_exists(obj_inputManager)

#region do things
phaseTimer++;
subPhaseTimer++;

	//properties
image_xscale = facing;
if comboSize%2 == attackNum%2 && attackNum != comboSize && attackAnimation == spr_player_slice_body 
{
	attackAnimation = spr_player_slice2_body;
	attackAnimationWep = spr_player_slice2_weapon;
	attackAnimationEffect = spr_player_slice2_effect;
}
if sprite_index != attackAnimation
{
	sprite_index = attackAnimation;
	weaponSpriteIndex = attackAnimationWep;
	effectSpriteIndex = attackAnimationEffect;
	image_index = 0
	image_speed = sprite_get_number(sprite_index)/(attackDuration+attackCooldown);
}
	//xspd
if phaseTimer >= round(attackMoveStart*room_speed) && phaseTimer <= round((attackMoveStart+attackMoveDuration)*room_speed)
{
	xSpd = facing*(attackMoveDistanceX/((attackMoveDuration)*room_speed));
}
else xSpd -= xSpd/4;
	//ySpd
ySpd += global.g;

#endregion

#region change states & substates
	if IE && obj_inputManager.xInput xInputQueue = 1;
	switch subPhase
	{
		case subState.performing:
			if subPhaseTimer >= round(attackDuration*room_speed)
			{
				subPhase = subState.post;
				subPhaseTimer = 0;
			}
			break;
		case subState.post:
				//keep attacking? (ground combo)
			if xInputQueue && attackNum != array_length_1d(obj_comboCache.activeComboIDs)-1 && effect.hasHit
			{
				with obj_player_attack_effect instance_destroy();
				attackNum++;
				aInputQueue = 0;
				xInputQueue = 0;
				yInputQueue = 0;
				bInputQueue = 0;
				scr_player_combo();
				phaseTimer = 0;							//reset for properties
				subPhase = subState.performing;
				subPhaseTimer = 0;
			}
				//end
			else if subPhaseTimer >= round(attackCooldown*room_speed)
			{
				with obj_player_attack_effect instance_destroy();
				phase = state.base;
				phaseTimer = 0;
				attackNum = 0;
				scr_player_base_subPhaseDeterminer();
			}
			break
	}
#endregion
