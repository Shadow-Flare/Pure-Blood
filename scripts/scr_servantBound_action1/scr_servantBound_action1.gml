phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//transition
		if subPhaseTimer >= round(action1Sub1Duration*room_speed)
		{
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
			phased = true;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		var newImage = action1Sub1Animation;
		var newImageSpeed = sprite_get_number(newImage)/action1Sub1Duration;
		update_sprite_enemy(newImage,newImageSpeed);
		break;
	case subState.actionSub2:
			//transition
				//xSpd
		xSpd = facing*statCache.moveSpeed;
		if (subPhaseTimer >= round(action1Sub2Duration*room_speed) || (place_meeting(x+xSpd,y,objActorParent) && !instance_place(x+xSpd,y,objActorParent).phased) || !place_free(x+xSpd,y)) && statCache.hp != 0
		{
			scr_enemy_attack(false, attack1Duration, attack1XOffset, attack1YOffset, attack1Width, attack1Height, attack1DamageType, attack1Damage*statCache.damagePower, attack1Stagger*statCache.staggerPower, attack1Knockback, attack1StatusType, attack1StatusValue, attack1Pierce);
			statCache.hp = 0;
			xSpd = 0;
		}
			//sprite
		var newImage = action1Sub2Animation;
		update_sprite_enemy(newImage,1);
		break;
}