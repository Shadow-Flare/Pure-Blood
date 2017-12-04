#region passives

	//melee attack cooldown
scr_enemy_actionHardCooldown();

#endregion

scr_servantLantern_ai();

#region State machines
	
		//vPhase
	scr_actor_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			scr_enemy_ground_base();
			break;
		case state.action1:
			scr_servantLantern_action1();
			break;
		case state.action2:
			scr_servantLantern_action2();
			break;
		case state.hitReaction:
			scr_enemy_ground_hitReaction();
			break;
		case state.dying:
			scr_enemy_ground_dying();
			break;
	}
	
#endregion

scr_hitCheck();
scr_statusCheck();
scr_actor_moveWithCollisions();

	//addional properties
image_xscale = facing;