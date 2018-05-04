event_inherited();
actorType = actorTypes.wild;

with statCache
{
	hpMax = 80;
	mpMax = 0;
	
	damagePower = 17;
	staggerPower = 20;
	
	toughness = 999;
	breakCooldownDuration = 1;
	
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

	//action1: (basic) explosion
action1Sub3Animation = sprServantBoundEffectAction1Sub3;
action1FrameData = -1;
action1Follow = false;
action1Duration = 0.7;
action1AttackSoundID = noone;															//$$//
action1HitSoundID = noone;																//$$//
action1DamageData = ds_map_create();
scr_create_damageCache(action1DamageData,1,4,0,0,0,1,0,0,0,0,0);
action1Pierce = 1;