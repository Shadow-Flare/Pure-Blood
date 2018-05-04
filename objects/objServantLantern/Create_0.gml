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
staggeredDuration = 0.5;								//$$//
stunnedDuration = 0.6;									//$$//
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
	//action1: general attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action1Animation = sprServantLanternBodyAction1;
action1FrameData = -1;
action1Follow = true;
action1Duration = 1.2;																	//$$//
action1AttackSoundID = noone;															//$$//
action1HitSoundID = noone;																//$$//
action1HitStart = action1Duration*(/**/5/**//sprite_get_number(action1Animation))		//$$//
action1HitDuration = action1Duration*(/**/3/**//sprite_get_number(action1Animation))	//$$//
action1MoveBurst = 3;																	//$$//
action1Move = 0;																		//$$//
action1MoveStart = action1Duration*(/**/4/**//sprite_get_number(action1Animation))		//$$//
action1MoveDuration = action1Duration*(/**/2/**//sprite_get_number(action1Animation))	//$$//
action1DamageData = ds_map_create();
scr_create_damageCache(action1DamageData,0.8,4,0,0,0.8,0,0,0,0,0,0);
action1Pierce = false;																	//$$//

	//action2: fire burst (targets bound servants alot in ai)
action2Animation = sprServantLanternBodyAction2;
action2FrameData = -1;
action2Follow = false;
action2Duration = 1.6;																	//$$//
action2AttackSoundID = noone;															//$$//
action2HitSoundID = noone;																//$$//
action2HitStart = action1Duration*(/**/10/**//sprite_get_number(action2Animation))
action2HitDuration = 1.5
action2MoveBurst = 0;																	//$$//
action2Move = 0;																		//$$//
action2MoveStart = action1Duration*(/**/0/**//sprite_get_number(action2Animation))
action2MoveDuration = action1Duration*(/**/0/**//sprite_get_number(action2Animation))
action2DamageData = ds_map_create();
scr_create_damageCache(action2DamageData,1.2,5,0.2,0,0,1.2,0,0,0,0,0);
action2Pierce = false;																	//$$//