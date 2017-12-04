phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//transition
		if subPhaseTimer >= round(action2Sub1Duration*room_speed)
		{
			subPhase = subState.actionSub2;
			subPhaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2Sub1Animation,-action2Sub1Duration);
		break;
	case subState.actionSub2:
			//transition
		if subPhaseTimer >= round(action2Sub2Duration*room_speed)
		{
			driveAction = 0;
			subPhase = subState.actionSub3;
			subPhaseTimer = 0;
			with obj_block_nonSolid solid = true;
			with objPlatformParent solid = true;
			repeat(128)
			{
				var tempX = irandom_range(0,room_width);
				var tempY = irandom_range(0,room_height);
				if place_free(tempX,tempY) && (!instance_exists(target) || abs(target.x-tempX) >= action2Sub2TeleportMinDistance)
				{
					while place_free(tempX,tempY+1) tempY++;
					if instance_exists(target) var dirToTarget = sign(target.x-tempX);
					else var dirToTarget = irandom(1);
					if dirToTarget == 0 dirToTarget = -1;
					var boxWidth = bbox_right-bbox_left;
					while(!place_free(tempX+dirToTarget*boxWidth,tempY+1) && place_free(tempX+dirToTarget,tempY) && (!instance_exists(target) || abs(target.x-tempX)-2 >= action2Sub2TeleportMinDistance))
					{
						tempX+=dirToTarget;
					}
					if !place_meeting(tempX,tempY,objActorParent) &&  (!instance_exists(target) || abs(target.x-tempX) >= action2Sub2TeleportMinDistance)
					{
						x = tempX;
						y = tempY;
						break;
					}
				}
			}
			with obj_block_nonSolid solid = false;
			with objPlatformParent solid = false;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2Sub2Animation,-action2Sub2Duration);
		break;
	case subState.actionSub3:
			//transition
		if subPhaseTimer >= round(action2Sub3Duration*room_speed)
		{
			phase = state.base;
			phaseTimer = 0;
			scr_enemy_ground_base_subPhaseDeterminer();
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action2Sub3Animation,-action2Sub3Duration);
		break;
}