phaseTimer++;
subPhaseTimer++;

	//sprite
var newImage = attack1Animation
var newImageSpeed = sprite_get_number(newImage)/(attack1Duration)
update_sprite_enemy(newImage,newImageSpeed)

switch subPhase
{
	case subState.actionSub1:
			//timing and attack
		if subPhaseTimer == round(attack1HitStart*room_speed)
		{
			scr_enemy_attack(true,attack1HitDuration,attack1XOffset,attack1YOffset,attack1Width,attack1Height,attack1DamageType,attack1Damage*statCache.damagePower,attack1Stagger*statCache.staggerPower,attack1Knockback,attack1StatusType,attack1StatusValue,attack1Pierce)
		}
		else if subPhaseTimer == round(attack1Duration*room_speed)
		{
			phase = state.base;
			scr_enemy_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
				//burst
		if attack1MoveBurst != 0 && phaseTimer == round(attack1MoveStart*room_speed)
		{
			xSpd = facing*attack1MoveBurst;
		}
				//consistent
		else if attack1Move != 0 && phaseTimer >= round(attack1MoveStart*room_speed) && phaseTimer <= round((attack1MoveStart+attack1MoveDuration)*room_speed)
		{
			xSpd = facing*attack1Move;
		}
		else xSpd -= xSpd/4;
		break;
}