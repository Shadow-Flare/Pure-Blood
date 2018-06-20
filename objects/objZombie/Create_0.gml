event_inherited();

with statCache
{
	hpMax = 40;											
	mpMax = 0;											
	
	damagePower = 7;									
	staggerPower = 4;									
	
	toughness = 1;									
	breakCooldownDuration = 2;
	
	moveSpeed = 0.5;									
	defaultMoveSpeed = moveSpeed;
	
	killExp = 4
	killGold = [0.1,4,16]
	
	hp = hpMax;
	mp = mpMax;
	
}

//attack data
attack1Range = 16*2.5;									

//variables
landingDuration = 0.7;
aerialStaggeredDuration = 0.3;
staggeredDuration = 0.5;
stunnedDuration = 1.2;
stunnedRecoveryDuration = 0.6;
deflectDuration = 0.3;
pushable = true;
flying = false;

deathDuration = 1;
deathFadeDuration = 2;

//ai data
aggroRange = 16*7;										
actionHardCooldown = 1.5;	
action1AIDelay = 0.3;

//action data
	//action1: general attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.attack);
action1Data[? enemyActionData.animation] = sprZombieBodyAction1;
action1Data[? enemyActionData.duration] = 1.2;	
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.hitStart] = action1Data[? enemyActionData.duration]*(/**/10/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.hitDuration] = action1Data[? enemyActionData.duration]*(/**/3/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.hitAngle] = 275;
action1Data[? enemyActionData.moveBurstX] = 5;																	
action1Data[? enemyActionData.moveStart] = action1Data[? enemyActionData.duration]*(/**/9/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveDuration] = action1Data[? enemyActionData.duration]*(/**/2/**//sprite_get_number(action1Data[? enemyActionData.animation]));		
scr_create_damageCache(action1Data[? enemyActionData.damageData],1.0,1.0,1,0,0,0,0,0,0,0,0,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action1Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;