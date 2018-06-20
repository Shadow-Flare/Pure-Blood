event_inherited();

with statCache
{
	hpMax = 20;											
	mpMax = 0;											
	
	damagePower = 7;									
	staggerPower = 6;									
	
	toughness = 1.2;								
	breakCooldownDuration = 1;
	
	moveSpeed = 0.9;									
	defaultMoveSpeed = moveSpeed;
	
	killExp = 4
	killGold = [0.1,4,16]
	
	hp = hpMax;
	mp = mpMax;
	
}

//attack data
attack1Range = 16*2.5;									

//variables
staggeredDuration = 0.6;
stunnedDuration = 1.8;
deflectDuration = 0.7;
pushable = true;
flying = flyingDefault;

deathDuration = 1;										
deathFadeDuration = 2;									

//ai data
aggroRange = 16*10;										
actionHardCooldown = 3.0;

aiIdleHeightMin = 16*5;
aiIdleHeight = noone;
aiMovementTimer = 0;
aiOscillateTimer = 0;
aiOscillateDistance = 8;
aiMovementDuration = 2.5;
aiWanderDistance = 16*4;

aiSwoopStartXDist = 5*16;
aiSwoopStartYDist = 5*16;
aiSwoopTargetRange = 0.2*16;

aiMeleeAcquireRange = 2.5*16;
aiMeleeStartXDist = 0.7*16;
aiMeleeStartYDist = 0.0*16;
aiMeleeTargetRange = 0.2*16;

//action data
	//action1: swoop attack
		//sub1
action1Sub1Duration = 0.6;
action1Sub1Animation = sprFlyingSkeletonBodyIdle;
		//swoop
action1SwoopXInitial = 0;
action1SwoopYInitial = 0;
action1SwoopXFinal = 0;
action1SwoopYPeak = 0;
action1SwoopYAcceleration = 0;
action1SwoopDuration = 0.7;
action1Animation = sprFlyingSkeletonBodyAction1;
action1AttackSoundID = noone;
		//zone data
action1ZoneID = noone;
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.damageZone);
action1Data[? enemyActionData.animation] = sprBloodHoundEffectAction2Sub2;
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitAngle] = -1;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.pierce] = false;
scr_create_damageCache(action1Data[? enemyActionData.damageData],1.0,0.5,1,0,0,0,0,0,0,0,0,0);
		//sub2: ending slowdown
action1Sub2Animation = sprFlyingSkeletonBodyAction1Sub2;
action1Sub2Duration = 0.4;

	//action2: melee peck
action2Data = ds_map_create();
scr_enemyActionDataDefaults(action2Data,enemyActionType.attack);
action2Data[? enemyActionData.animation] = sprFlyingSkeletonBodyAction1;
action2Data[? enemyActionData.duration] = 0.9;	
action2Data[? enemyActionData.performSoundID] = noone;
action2Data[? enemyActionData.hitSoundID] = noone;
action2Data[? enemyActionData.hitStart] = action2Data[? enemyActionData.duration]*(/**/2/**//sprite_get_number(action2Data[? enemyActionData.animation]));
action2Data[? enemyActionData.hitDuration] = action2Data[? enemyActionData.duration]*(/**/3/**//sprite_get_number(action2Data[? enemyActionData.animation]));
action2Data[? enemyActionData.hitAngle] = 290;		
scr_create_damageCache(action2Data[? enemyActionData.damageData],1.2,0.5,1.0,0,0,0,0,0,0,0,0.4,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action2Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;