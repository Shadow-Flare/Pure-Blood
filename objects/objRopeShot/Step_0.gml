phaseTimer++;

if caster.object_index == objPlayer && caster.phase != state.ability
{
	phase = ropeshotPhase.returning;
	phaseTimer = 0;
}

switch phase
{
	case ropeshotPhase.shooting:
		if (point_distance(initialX,initialY,x,y) >= maxDist || !place_free(x,y))
		{
			phase = ropeshotPhase.returning;
			phaseTimer = 0;
		}
		else if place_meeting(x,y,objGrappleParent)
		{
			mount = instance_place(x,y,objGrappleParent);
			x = mount.x;
			y = mount.y;
			speed = 0;
			if mount.object_index = obj_grapple_swing 
			{
				phase = ropeshotPhase.hookedSwing;
				phaseTimer = 0;
				caster.ropeShotAngularSpeed = 0;
				caster.ropeShotSwingDist = mount.swingDist;
			}
			else if mount.object_index = obj_grapple_mount
			{
				phase = ropeshotPhase.hookedPoint;
				phaseTimer = 0;
			}
		}
		else 
		{
			with objActorParent if place_meeting(x,y,other) with other
			{
				var enemy = other;
				if caster != enemy && is_enemy(caster.actorType, enemy.actorType) && enemy.phase != state.dying
				{
					mount = enemy;
					var stats = enemy.statCache;
					x = mount.x;
					y = mount.y;
					speed = 0;
					if stats.mass >= 2.5 phase = ropeshotPhase.hookedEnemyPull;
					else phase = ropeshotPhase.hookedPlayerPull;
					phaseTimer = 0;
				}
			}
		}
		break;
	case ropeshotPhase.returning:
		mount = noone;
		direction = point_direction(x,y,caster.x,caster.y);
		if speed == 0 speed = defaultSpeed;
		if place_meeting(x,y,caster) instance_destroy();
		break;
	case ropeshotPhase.hookedPoint:

		break;
	case ropeshotPhase.hookedSwing:
		
		break;
	case ropeshotPhase.hookedEnemyPull:
		
		break;
	case ropeshotPhase.hookedPlayerPull:
		
		break;
}

if mount != noone
{
	x = mount.x;
	y = mount.y;
}