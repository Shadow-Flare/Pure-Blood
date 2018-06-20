#region passives

	//melee attack cooldown
scr_actor_actionHardCooldown();

#endregion

scr_template_ai();

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
			scr_ground_actorActionBasic_attack(action1Data);
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
scr_actor_moveWithCollisions();

	//addional properties
image_xscale = facing;