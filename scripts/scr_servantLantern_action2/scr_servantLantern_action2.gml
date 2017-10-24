phaseTimer++;
subPhaseTimer++;

	//sprite
var newImage = attack2Animation
var newImageSpeed = sprite_get_number(newImage)/(attack2Duration)
update_sprite_enemy(newImage,newImageSpeed)

switch subPhase
{
	case subState.actionSub1:
			//timing and attack
		if subPhaseTimer == round(attack2HitStart*room_speed)
		{
			scr_enemy_attack(false,attack2HitDuration,attack2XOffset,attack2YOffset,attack2Width,attack2Height,attack2DamageType,attack2Damage*statCache.damagePower,attack2Stagger*statCache.staggerPower,attack2Knockback,attack2StatusType,attack2StatusValue,attack2Pierce)
		}
		else if subPhaseTimer == round(attack2Duration*room_speed)
		{
			phase = state.base;
			scr_enemy_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
				//burst
		if attack2MoveBurst != 0 && phaseTimer == round(attack2MoveStart*room_speed)
		{
			xSpd = facing*attack2MoveBurst;
		}
				//consistent
		else if attack2Move != 0 && phaseTimer >= round(attack2MoveStart*room_speed) && phaseTimer <= round((attack2MoveStart+attack2MoveDuration)*room_speed)
		{
			xSpd = facing*attack2Move;
		}
		else xSpd -= xSpd/4;
		break;
}