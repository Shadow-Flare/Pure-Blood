phaseTimer++;
subPhaseTimer++;

	//sprite
var newImage = attack3Animation
var newImageSpeed = sprite_get_number(newImage)/(attack3Duration)
update_sprite_enemy(newImage,newImageSpeed)

switch subPhase
{
	case subState.actionSub1:
			//timing and attack
		if subPhaseTimer == round(attack3HitStart*room_speed)
		{
			scr_enemy_attack(true,attack3HitDuration,attack3XOffset,attack3YOffset,attack3Width,attack3Height,attack3DamageType,attack3Damage*statCache.damagePower,attack3Stagger*statCache.staggerPower,attack3Knockback,attack3StatusType,attack3StatusValue,attack3Pierce)
		}
		else if subPhaseTimer == round(attack3Duration*room_speed)
		{
			phase = state.base;
			scr_enemy_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
				//burst
		if attack3MoveBurst != 0 && phaseTimer == round(attack3MoveStart*room_speed)
		{
			xSpd = facing*attack3MoveBurst;
		}
				//consistent
		else if attack3Move != 0 && phaseTimer >= round(attack3MoveStart*room_speed) && phaseTimer <= round((attack3MoveStart+attack3MoveDuration)*room_speed)
		{
			xSpd = facing*attack3Move;
		}
		else xSpd -= xSpd/4;
		break;
}