//get needed data
var IE = instance_exists(obj_inputManager)

#region do things

	//properties
image_xscale = facing;
if comboSize%2 == attackNum%2 && attackNum != comboSize && attackAnimation = spr_player_slice_body attackAnimation = spr_player_slice2_body;
if sprite_index != attackAnimation
{
	sprite_index = attackAnimation;
	image_index = 0
	image_speed = 1;
}
	//xspd
if subPhase = subState.performing xSpd = facing*(attackMoveDistanceX/((attackMoveDuration)*room_speed));
else xSpd -= xSpd/4;
	//ySpd
ySpd += global.g;

#endregion

#region substate timers
	switch subPhase
	{
		case subState.performing:
			phaseTimer++;
			if phaseTimer >= round(obj_combo_cache.activeComboDurations[attackNum]*room_speed)
			{
				subPhase = subState.post;
			}
			break;
		case subState.post:
			phaseTimer++;
			if phaseTimer >= round(obj_combo_cache.activeComboCooldowns[attackNum]*room_speed)
			{
				phase = state.base
				scr_player_base_subPhaseDeterminer();
			}
			break
	}
#endregion

#region change state
	
	
	//to hit reaction
		//not in yet
#endregion