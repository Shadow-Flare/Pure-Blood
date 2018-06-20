scr_actor_ground_vStateMachine();

var dataMap = zoneData;

#region State Machine (based only on vPhase
switch vPhase
{
	case vState.grounded:
		#region Grounded
			//kill zone
		if zoneTouchID != noone
		{
			instance_destroy(zoneTouchID);
			zoneTouchID = noone;
		}
			//xSpd
		xSpd-=xSpd/4;
		//no ySpd change
			//sprite
		update_sprite_enemy(sprBloodHoundCorpseBodyIdle,0);
		#endregion
		break;
	case vState.midAir:
		#region Airborne
			//damageZone
		if zoneTouchID == noone
		{
			actorType = actorTypes.enemy;
			zoneTouchID = scr_enemy_attack(dataMap,statCache.damagePower,statCache.staggerPower);
			actorType = actorTypes.corpse;
		}
			//xSpd
		xSpd-=xSpd/60;
		//no ySpd change
			//sprite
		update_sprite_enemy(sprBloodHoundCorpseBodyAirborne,0)
		#endregion
		break;
}
#endregion

	//addional properties
image_xscale = facing;