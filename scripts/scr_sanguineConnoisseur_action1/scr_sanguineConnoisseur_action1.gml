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
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		var newImage = action1Sub1Animation
		var newImageSpeed = sprite_get_number(newImage)/action1Sub1Duration;
		update_sprite_enemy(newImage,newImageSpeed);
		break;
	case subState.actionSub2:
			//create projectile
		if subPhaseTimer == round(action1Sub2ProjCreateTime*room_speed)
		{
			if instance_exists(target) with instance_create_depth(x+facing*action1Sub2ProjCreateXOffset,y+action1Sub2ProjCreateYOffset,depth,objSanguineConnoisseurProjectile)
			{
				caster = other;
				casterType = other.actorType;
				target = other.target;
				targetX = other.target.x;
				targetY = other.target.y;
				direction = 90-other.facing*90;
				speed = other.action1Sub2ProjCreateSpeed;
				hitType = other.action1Sub2ProjDamageType;
				hitDamage = other.action1Sub2ProjDamage;
				hitStagger = other.action1Sub2ProjStagger;
				hitKnockback = other.action1Sub2ProjKnockback;
				statusType = other.action1Sub2ProjStatusType;
				statusValue = other.action1Sub2ProjStatusValue;
				pierce = other.action1Sub2ProjPierce;
				
				hitList = ds_list_create();
			}
		}
			//transition
		if subPhaseTimer >= round(action1Sub2Duration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_enemy_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		var newImage = action1Sub2Animation
		var newImageSpeed = sprite_get_number(newImage)/action1Sub2Duration;
		update_sprite_enemy(newImage,newImageSpeed);
		break;
}