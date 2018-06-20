event_inherited();

with statCache
{
	hpMax = 60;											
	mpMax = 0;											
	
	damagePower = 6;									
	staggerPower = 5;									
	
	toughness = 2.2;														
	breakCooldownDuration = 1.8;
	
	moveSpeed = 0.35;									
	defaultMoveSpeed = moveSpeed;
	
	killExp = 12;
	killGold = [0.1,4-16];
	
	hp = hpMax;
	mp = mpMax;
}						

//variables					
landingDuration = 0.6;
aerialStaggeredDuration = 0.3;
staggeredDuration = 0.5;
stunnedDuration = 1.2;
stunnedRecoveryDuration = 0.6;
deflectDuration = 0.7;
pushable = true;
flying = false;

deathDuration = 1;										
deathFadeDuration = 3;									

//ai data
aggroRange = 16*7;										
actionHardCooldown = 2;		
actionAiDelay = 0.6;
attack1Range = 16*3;

//action data
	//action1: general attack, horizontal slash			the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.attack);
action1Data[? enemyActionData.animation] = sprServantGuardBodyAction1;
action1Data[? enemyActionData.duration] = 1;	
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitAngle] = 165;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.hitStart] = action1Data[? enemyActionData.duration]*(/**/5/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.hitDuration] = action1Data[? enemyActionData.duration]*(/**/3/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveBurstX] = 6;																	
action1Data[? enemyActionData.moveStart] = action1Data[? enemyActionData.duration]*(/**/4/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveDuration] = action1Data[? enemyActionData.duration]*(/**/3/**//sprite_get_number(action1Data[? enemyActionData.animation]));		
scr_create_damageCache(action1Data[? enemyActionData.damageData],1,1,0,1,0,0,0,0,0,0,0,0);

	//action2: parry begin
action2AiTimer = 0;
action2AiMoveDuration = 1;
		//sub1: defensive stance
action2AnimationSub1Forward = sprServantGuardBodyAction2Sub1Forward;
action2AnimationSub1Idle = sprServantGuardBodyAction2Sub1Idle;
action2AnimationSub1Back = sprServantGuardBodyAction2Sub1Back;
action2DurationSub1 = 7;
action2AttackRangeSub1 = 16*0.4;

		//sub2: blocking reaction
action2DurationSub2 = 0.6;
action2AnimationSub2 = sprServantGuardBodyAction2Sub2;

	//action3: parry counter, stab motion		the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action3Data = ds_map_create();
scr_enemyActionDataDefaults(action3Data,enemyActionType.attack);
action3Data[? enemyActionData.animation] = sprServantGuardBodyAction3;
action3Data[? enemyActionData.duration] = 0.7;	
action3Data[? enemyActionData.performSoundID] = noone;
action3Data[? enemyActionData.hitAngle] = 0;
action3Data[? enemyActionData.hitSoundID] = noone;
action3Data[? enemyActionData.hitStart] = action3Data[? enemyActionData.duration]*(/**/5/**//sprite_get_number(action3Data[? enemyActionData.animation]));
action3Data[? enemyActionData.hitDuration] = action3Data[? enemyActionData.duration]*(/**/2/**//sprite_get_number(action3Data[? enemyActionData.animation]));
action3Data[? enemyActionData.moveBurstX] = 3;
action3Data[? enemyActionData.moveStart] = action3Data[? enemyActionData.duration]*(/**/4/**//sprite_get_number(action3Data[? enemyActionData.animation]));
action3Data[? enemyActionData.moveDuration] = action3Data[? enemyActionData.duration]*(/**/3/**//sprite_get_number(action3Data[? enemyActionData.animation]));
scr_create_damageCache(action3Data[? enemyActionData.damageData],1.5,1.3,0,2,0,0,0,0,0,0,0,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action1Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;
ds_list_add(actionDataHolder,action3Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;