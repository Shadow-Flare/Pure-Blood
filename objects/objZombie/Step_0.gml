#region passives

	//melee attack cooldown
scr_enemy_actionHardCooldown();

#endregion

scr_zombie_ai();

#region State machines

		//vPhase
	scr_enemy_ground_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			scr_enemy_ground_base();
			break;
		case state.action1:
			scr_zombie_action1();
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