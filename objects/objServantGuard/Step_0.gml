event_inherited();

#region passives

	//melee attack cooldown
scr_actor_actionHardCooldown();

	//hitPhase reset
hitPhase = hitState.normal;

#endregion

if canAct scr_servantGuard_ai();

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
		case state.action2:
			scr_servantGuard_action2();
			break;
		case state.action3:
			scr_ground_actorActionBasic_attack(action3Data);
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