#region passives

	//melee attack cooldown
scr_actor_actionHardCooldown();
	//reset hitPhase
hitPhase = hitState.normal;

#endregion

if canAct scr_flyingSkeleton_ai();

#region State machines

		//vPhase
scr_actor_ground_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			scr_actor_flying_base();
			break;
		case state.action1:
			scr_flyingSkeleton_action1();
			break;
		case state.action2:
			scr_flying_actorActionBasic_attack(action2Data);
			break;
		case state.hitReaction:
			scr_actor_flying_hitReaction();
			break;
		case state.dying:
			scr_actor_flying_dying();
			break;
	}
	
#endregion

scr_hitCheck();
scr_statusCheck();

	//addional properties
image_xscale = facing;