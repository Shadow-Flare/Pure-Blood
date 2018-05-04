event_inherited();
phased = true;
pushable = false;
flying = false;

with statCache
{
	hpMax = 1;
	mpMax = 0;
	
	damagePower = 7;
	staggerPower = 3;
	
	moveSpeed = 1.5;
	defaultMoveSpeed = moveSpeed;
	
	hp = hpMax;
	mp = mpMax;
}

//bloat duration
bloatDuration = 3;

//die duration
dyingDuration = 0.7;
	
//explosion
explosionAnimation = sprBloodHoundTickEffectExploding;
explosionAttackSoundID = noone;
explosionHitSoundID = noone;
explosionFrameData = [0,3];
explosionFollow = false;
explosionDuration = 0.4;
explosionDamageData = ds_map_create();		
scr_create_damageCache(explosionDamageData,1.2,6,2,0,0,0,0,0,0,0,0);
explosionPierce = true;