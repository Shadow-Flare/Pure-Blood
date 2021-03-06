if distance_to_object(objPlayer) > maxDistDestroy
{
	wantsToLeave = true;
}

playerCanUse = false;
if instance_exists(objPlayer) && abs(x-objPlayer.x) <= useRange && abs(y-objPlayer.y) <= useRange*2 && objPlayer.canAct
{
	playerCanUse = true;
}

if used 
{
	used = false;
	scr_dialog_initiate(0,0,dialogType.choice);
}

#region State machine
var leave = false		
		//vPhase
	scr_actor_ground_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			update_sprite_enemy(sprShopkeeperBodyIdle,0);
			if wantsToLeave
			{
				phase = state.emote;
				phaseTimer = 0
				subPhase = subState.actionSub2;
				subPhaseTimer = 0;
			}
			break;
		case state.emote:
			switch subPhase
			{
				case subState.actionSub1:
					phaseTimer++;
					subPhaseTimer++;
					update_sprite_enemy(sprShopkeeperBodyEmote1,-leaveDuration);
					if phaseTimer >= round(leaveDuration*room_speed)
					{
						phase = state.base;
						phaseTimer = 0;
						subPhase = subState.idle
						subPhaseTimer = 0;
					}
					break;
				case subState.actionSub2:
					phaseTimer++;
					subPhaseTimer++;
					update_sprite_enemy(sprShopkeeperBodyEmote2,-leaveDuration);
					if phaseTimer >= round(leaveDuration*room_speed)
					{
						leave = true;
					}
					break;
			}
			break;
	}
	
#endregion

scr_hitCheck();
scr_statusCheck();

if leave instance_destroy();