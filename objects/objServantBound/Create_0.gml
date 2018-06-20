event_inherited();
actorType = actorTypes.wild;

with statCache
{
	hpMax = 80;
	mpMax = 0;
	
	damagePower = 17;
	staggerPower = 6;
	
	toughness = 999;
	breakCooldownDuration = 1;
	mass = 6;
	
	moveSpeed = 1;										//$$//
	defaultMoveSpeed = moveSpeed;
	
	killExp = 2
	killGold = [0.1,4-16]
	
	hp = hpMax;
	mp = mpMax;
}

//variables
landingDuration = 0.7;									//&&//
staggeredDuration = 0.5;
stunnedDuration = 0.6;
deflectDuration = 0.7;									//&&//
pushable = false;
flying = false;

deathDuration = 0;
deathFadeDuration = 0;

//ai data
actionHardCooldown = 0;

//action data
	//action1: ignite
action1Sub1Animation = sprServantBoundBodyAction1Sub1;
action1Sub1Duration = 0.7;

	//action1: charge
action1Sub2Animation = sprServantBoundBodyAction1Sub2;
action1Sub2Duration = 3;

	//action1: general attack
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.damageZone);
action1Data[? enemyActionData.animation] = sprServantBoundEffectAction1Sub3;
action1Data[? enemyActionData.duration] = 0.7;
action1Data[? enemyActionData.follow] = false;
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.hitAngle] = 275;
action1Data[? enemyActionData.pierce] = true;
scr_create_damageCache(action1Data[? enemyActionData.damageData],3,1,0,0,0,1,0,0,0,0,0,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action1Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;