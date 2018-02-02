#region passives

	//melee attack cooldown
scr_enemy_actionHardCooldown();

#endregion

scr_flyingSkeleton_ai();

#region State machines

		//vPhase
	scr_actor_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			scr_enemy_flying_base();
			break;
		case state.action1:
			scr_flyingSkeleton_action1();
			break;
		case state.hitReaction:
			scr_enemy_flying_hitReaction();
			break;
		case state.dying:
			scr_enemy_flying_dying();
			break;
	}
	
#endregion

scr_hitCheck();
scr_statusCheck();

	//addional properties
image_xscale = facing;