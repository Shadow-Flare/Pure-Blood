event_inherited();

with statCache
{
	hpMax = 120;										//$$//
	mpMax = 0;											//$$//
	
	damagePower = 7;									//$$//
	staggerPower = 5;									//$$//
	
	toughness = 6;										//$$//
	breakCooldownDuration = 1;
	mass = 4;
	
	moveSpeed = 0.2;									//$$//
	defaultMoveSpeed = moveSpeed;
	
	killExp = 100;
	killGold = [0.1,4-16];
	
	hp = hpMax;
	mp = mpMax;
}

//variables
landingDuration = 0.7;									//&&//
staggeredDuration = 0.5;								//$$//
stunnedDuration = 0.6;									//$$//
deflectDuration = 0.7;
pushable = true;
flying = false;

deathDuration = 2.5;
deathFadeDuration = 3;

//ai data
aggroRange = 16*20;										//$$//
actionHardCooldown = 0;									//$$//

actionAiDelay = 1.6;
action1Range = 16*4;
action2MinRange = 16*8;
action2NumOf1Or3Or4BeforeLeap = 2;
action4CorpsesNeeded = 3;
numOfAction1Or3Or4 = 0;

//action data
	//action1: Slam
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.attack);
action1Data[? enemyActionData.animation] = sprBloodHoundBodyAction1;
action1Data[? enemyActionData.duration] = 2.4;	
action1Data[? enemyActionData.frameData] = [0,2];
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitAngle] = 240;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.hitStart] = action1Data[? enemyActionData.duration]*(/**/7/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.hitDuration] = action1Data[? enemyActionData.duration]*(/**/2/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveBurstX] = 3;																	
action1Data[? enemyActionData.moveStart] = action1Data[? enemyActionData.duration]*(/**/6/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveDuration] = action1Data[? enemyActionData.duration]*(/**/0/**//sprite_get_number(action1Data[? enemyActionData.animation]));		
action1Data[? enemyActionData.pierce] = true;
scr_create_damageCache(action1Data[? enemyActionData.damageData],1.0,2.5,0,0,1,0,0,0,0,0,0,0);

	//action2: Leap
		//Sub1: Pre-Leap
action2Sub1Animation = sprBloodHoundBodyAction2Sub1;
action2Sub1Duration = 0.8;
action2Sub1SoundID = noone;
		//Sub2: Leap execute
action2Sub2Animation = sprBloodHoundBodyAction2Sub2;
action2Sub2TargetEnemy = false;	//CHANGE THIS TO MAKE LEAP TARGET PLAYER
action2Sub2Angle = 25;
action2Sub2Distance = 180;
action2Sub2AttackSoundID = noone;
			//DamageZone
action2Sub2ZoneID = noone;
action2Sub2Data = ds_map_create();
scr_enemyActionDataDefaults(action2Sub2Data,enemyActionType.damageZone);
action2Sub2Data[? enemyActionData.animation] = sprBloodHoundEffectAction2Sub2;
action2Sub2Data[? enemyActionData.performSoundID] = noone;
action2Sub2Data[? enemyActionData.hitAngle] = -1;
action2Sub2Data[? enemyActionData.hitSoundID] = noone;
action2Sub2Data[? enemyActionData.pierce] = true;
scr_create_damageCache(action2Sub2Data[? enemyActionData.damageData],0.8,1.5,0,0,0.3,0,0,0,0,0,0,0);
		//sub3: Landing
action2Sub3Animation = sprBloodHoundBodyAction2Sub3;
action2Sub3Duration = 0.8;

			//DamageZone
action2Sub3Data = ds_map_create();
scr_enemyActionDataDefaults(action2Sub3Data,enemyActionType.damageZone);
action2Sub3Data[? enemyActionData.animation] = sprBloodHoundEffectAction2Sub3;
action2Sub3Data[? enemyActionData.performSoundID] = noone;
action2Sub3Data[? enemyActionData.hitDuration] = 0.4;
action2Sub3Data[? enemyActionData.hitAngle] = 90;
action2Sub3Data[? enemyActionData.hitSoundID] = noone;
action2Sub3Data[? enemyActionData.pierce] = true;
scr_create_damageCache(action2Sub3Data[? enemyActionData.damageData],1.4,1.5,0.3,0,0,0,0,0,0,0,0,0);
	
	//action3: Fling Corpses
	//action1: general attack
action3Data = ds_map_create();
scr_enemyActionDataDefaults(action3Data,enemyActionType.attack);
action3Data[? enemyActionData.animation] = sprBloodHoundBodyAction3;
action3Data[? enemyActionData.duration] = 1.4;
action3Data[? enemyActionData.frameData] = [4,6];
action3Data[? enemyActionData.performSoundID] = noone;
action3Data[? enemyActionData.hitSoundID] = noone;
action3Data[? enemyActionData.hitStart] = action3Data[? enemyActionData.duration]*(/**/9/**//sprite_get_number(action3Data[? enemyActionData.animation]));
action3Data[? enemyActionData.hitDuration] = action3Data[? enemyActionData.duration]*(/**/2/**//sprite_get_number(action3Data[? enemyActionData.animation]));
action3Data[? enemyActionData.hitAngle] = 70;
action3Data[? enemyActionData.pierce] = true;
scr_create_damageCache(action3Data[? enemyActionData.damageData],1,12,1,0,0,0,0,0,0,0,0,0);
		//corpses
action3CorpseMin = 3;
action3CorpseMax = 4;
action3CorpseTime = action3Data[? enemyActionData.duration]*(/**/9/**//sprite_get_number(action3Data[? enemyActionData.animation]));
action3CorpseXOffset = 12;
action3CorpseYOffset = 12;

	//action4: Puke Ticks
action4Animation = sprBloodHoundBodyAction4;
action4SoundID = noone;
action4Duration = 0.8;
action4TickMin = 3;
action4TickMax = 3;
action4TickTime = action4Duration*(/**/4/**//sprite_get_number(action4Animation));
action4TickXOffset = 12;
action4TickYOffset = -20;
	
	//action5: Scream
action5Animation = sprBloodHoundBodyAction5;
action5SoundID = noone;
action5Duration = 0.8;

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action1Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;
ds_list_add(actionDataHolder,action2Sub2Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;
ds_list_add(actionDataHolder,action2Sub3Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;
ds_list_add(actionDataHolder,action3Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;