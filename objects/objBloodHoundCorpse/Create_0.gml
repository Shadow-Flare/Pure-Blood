event_inherited();
actorType = actorTypes.corpse;
phased = true;
pushable = false;
flying = false;

with statCache
{
	//leave as base, doesnt need any stats
}
	
//target
hasBeenTargeted = false;
	
//damageZone
zoneTouchID = noone;
zoneTouchAnimation = sprBloodHoundCorpseEffectAirborne;
zoneTouchHitSoundID = noone;
zoneTouchFrameData = -1;
zoneTouchFollow = true;
zoneTouchDuration = -1
zoneTouchDamageType = damageType.slash;
zoneTouchDamage = 4;
zoneTouchStagger = 3;
zoneTouchKnockBack = 1.5;
zoneTouchStatusType = specialType.none;
zoneTouchStatusValue = 0;
zoneTouchPierce = false;