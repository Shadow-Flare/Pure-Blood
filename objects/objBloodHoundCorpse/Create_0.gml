event_inherited();
actorType = actorTypes.corpse;
phased = true;
pushable = false;
flying = false;

with statCache
{
	damagePower = 4;
	staggerPower = 1;
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
zoneTouchDamageData = ds_map_create();		
scr_create_damageCache(zoneTouchDamageData,1.8,3,1,0,0,0,0,0,0,0,0);
zoneTouchPierce = false;