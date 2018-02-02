#region passives

	//melee attack cooldown
scr_enemy_actionHardCooldown();

	//hitPhase reset
if !(phase == state.action2 && (subPhase = subState.actionSub1 || subPhase == subState.actionSub2))
{
	hitPhase = hitState.normal;
}

#endregion

scr_servantGuard_ai();

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
			scr_servantGuard_action1();
			break;
		case state.action2:
			scr_servantGuard_action2();
			break;
		case state.action3:
			scr_servantGuard_action3();
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

	//addional properties
image_xscale = facing;