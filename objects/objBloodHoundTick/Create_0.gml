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
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.attack);
action1Data[? enemyActionData.animation] = sprBloodHoundTickEffectExploding;
action1Data[? enemyActionData.follow] = false;
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.hitDuration] = 0.4;	
action1Data[? enemyActionData.pierce] = true;
scr_create_damageCache(action1Data[? enemyActionData.damageData],3.6,1.7,2,0,0,0,0,0,0,0,0,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action1Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;