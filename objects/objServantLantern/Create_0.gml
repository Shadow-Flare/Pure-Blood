event_inherited();

with statCache
{
	hpMax = 35;
	mpMax = 20;
	
	damagePower = 7;
	staggerPower = 6;
	
	toughness = 3;
	breakCooldownDuration = 2;
	
	moveSpeed = 0.4;
	defaultMoveSpeed = moveSpeed;

	killExp = 8;
	killGold = [0.1,4-16]
	
	hp = hpMax;
	mp = mpMax;
}

//variables
landingDuration = 0.7;									//&&//
aerialStaggeredDuration = 0.3;
staggeredDuration = 0.5;								//$$//
stunnedDuration = 0.6;									//$$//
stunnedRecoveryDuration = 0.6;
deflectDuration = 0.7;
pushable = true;
flying = false;

deathDuration = 1;										//$$//
deathFadeDuration = 2;									//$$//

//ai data
attack1Range = 16*1.5;									//$$//
aggroRange = 16*10;
actionHardCooldown = 3.5;

//action data
	//action1: general attack, weapon swing		the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.attack);
action1Data[? enemyActionData.animation] = sprServantLanternBodyAction1;
action1Data[? enemyActionData.duration] = 1.2;
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitAngle] = 165;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.hitStart] = action1Data[? enemyActionData.duration]*(/**/5/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.hitDuration] = action1Data[? enemyActionData.duration]*(/**/3/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveBurstX] = 3;																	
action1Data[? enemyActionData.moveStart] = action1Data[? enemyActionData.duration]*(/**/4/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveDuration] = action1Data[? enemyActionData.duration]*(/**/2/**//sprite_get_number(action1Data[? enemyActionData.animation]));		
scr_create_damageCache(action1Data[? enemyActionData.damageData],0.8,1.2,0,0,0.8,0,0,0,0,0,0,0);

	//action2: general attack, fire Burst (targets bound servants alot in ai)
action2Data = ds_map_create();
scr_enemyActionDataDefaults(action2Data,enemyActionType.attack);
action2Data[? enemyActionData.animation] = sprServantLanternBodyAction2;
action2Data[? enemyActionData.duration] = 1.6;	
action2Data[? enemyActionData.performSoundID] = noone;
action2Data[? enemyActionData.hitAngle] = 90;
action2Data[? enemyActionData.hitSoundID] = noone;
action2Data[? enemyActionData.hitStart] = action2Data[? enemyActionData.duration]*(/**/10/**//sprite_get_number(action2Data[? enemyActionData.animation]));
action2Data[? enemyActionData.hitDuration] = 1.5	//seconds
scr_create_damageCache(action2Data[? enemyActionData.damageData],1.2,1,0,0,0,1.2,0,0,0,0,0,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action1Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;
ds_list_add(actionDataHolder,action2Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;