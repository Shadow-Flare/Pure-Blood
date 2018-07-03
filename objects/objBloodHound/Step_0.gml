event_inherited();

#region Pre Passives

	//melee attack cooldown
scr_actor_actionHardCooldown();

	//ai
if canAct scr_bloodHound_ai();

#endregion

#region State machines
	
		//vPhase
	scr_actor_ground_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			scr_actor_ground_base();
			break;
		case state.action1:	//Slam
			scr_ground_actorActionBasic_attack(action1Data);
			break;
		case state.action2: //Leap
			scr_bloodHound_action2();
			break;
		case state.action3: //Fling Corpses
			scr_bloodHound_action3();
			break;
		case state.action4:	//Puke Ticks
			scr_bloodHound_action4();
			break;
		case state.action5: //Scream
			scr_bloodHound_action5();
			break;
		case state.hitReaction:
			scr_actor_ground_hitReaction();
			break;
		case state.dying:
			scr_actor_ground_dying();
			break;
	}
	
#endregion

#region Post Passives

scr_hitCheck();
scr_statusCheck();
	
	//addional properties
image_xscale = facing;

#endregion