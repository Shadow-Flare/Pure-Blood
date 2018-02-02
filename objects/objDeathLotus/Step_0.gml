#region passives

	//melee attack cooldown
scr_enemy_actionHardCooldown();

#endregion

scr_deathLotus_ai();

#region State machines
	
		//vertical behavior
	scr_actor_crawl_vStateMachine();
	
		//phase (nested subPhase)
	switch phase
	{
		case state.base:
			scr_enemy_crawl_base();
			break;
		case state.action1:
			scr_deathLotus_action1();
			break;
		case state.action2:
			scr_deathLotus_action2();
			break;
		case state.hitReaction:
			scr_enemy_crawl_hitReaction();
			break;
		case state.dying:
			scr_enemy_crawl_dying();
			break;
	}
	
#endregion

	//dont let movement be affected by scr_hitcheck
var xSpdPrev = xSpd;
var ySpdPrev = ySpd;
scr_hitCheck();
xSpd = xSpdPrev;
ySpd = ySpdPrev;

scr_statusCheck();

	//addional properties
image_angle = actorDirection*90-90;
image_xscale = facing;

if phased == false
{
	if actorDirection == 3 phased = false;
	else phased = true;
}