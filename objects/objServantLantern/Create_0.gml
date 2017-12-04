event_inherited();

with statCache
{
	hpMax = 35;
	mpMax = 20;
	
	damagePower = 7;
	staggerPower = 6;
	
	physicalToughness = 3;
	magicalToughness = 5;
	breakCooldownDuration = 2;
	
	moveSpeed = 0.4;
	defaultMoveSpeed = moveSpeed;

	killExp = 8;
	killGold = [0.1,4-16]
	
		//Damage type resistances (as percentage; 1 = 100%)
	damageResistances[0] = 1;			//Slash			//$$//
	damageResistances[1] = 1;			//Blunt			//$$//
	damageResistances[2] = 1;			//Pierce		//$$//
	damageResistances[3] = 1;			//Fire			//$$//
	damageResistances[4] = 1;			//Ice			//$$//
	damageResistances[5] = 1;			//Lightning		//$$//
	damageResistances[6] = 1;			//Arcane		//$$//
	damageResistances[7] = 1;			//Light			//$$//
	damageResistances[8] = 1;			//Dark			//$$//
	damageResistances[9] = 1;			//X damage		//$$//

	//Special resistances (100 is considered normal)
	specialResist[0] = 100;				//Bleed			//$$//
	
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
action1DamageType = 1;																	//$$//
action1Damage = 0.8;
action1Stagger = 0.8;
action1Knockback = 4;																	//$$//
action1StatusType = -1;																	//$$//
action1StatusValue = 0;																	//$$//
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
action2DamageType = 3;
action2Damage = 1.2;																	//$$//
action2Stagger = 1.2;																	//$$//
action2Knockback = 5;																	//$$//
action2StatusType = -1;																	//$$//
action2StatusValue = 0;																	//$$//
action2Pierce = false;																	//$$//