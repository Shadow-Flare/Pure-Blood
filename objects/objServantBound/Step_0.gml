#region passives

	//melee attack cooldown
scr_actor_actionHardCooldown();

#endregion

if canAct scr_servantBound_ai();

#region State machines
	
		//vPhase
	scr_actor_ground_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			scr_actor_ground_base();
			break;
		case state.action1:
			scr_servantBound_action1();
			break;
		case state.action2:
			//scr_servantBound_action2();
			break;
		case state.hitReaction:
			scr_actor_ground_hitReaction();
			break;
		case state.dying:
			scr_actor_ground_dying();
			break;
	}
	
#endregion

scr_hitCheck();
scr_statusCheck();

	//addional properties
image_xscale = facing;