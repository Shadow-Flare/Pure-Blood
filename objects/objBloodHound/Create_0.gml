event_inherited();

with statCache
{
	hpMax = 120;										//$$//
	mpMax = 0;											//$$//
	
	damagePower = 7;									//$$//
	staggerPower = 5;									//$$//
	
	physicalToughness = 6;								//$$//
	magicalToughness = 8;								//$$//
	breakCooldownDuration = 1;
	
	moveSpeed = 0.2;									//$$//
	defaultMoveSpeed = moveSpeed;
	
	killExp = 100;
	killGold = [0.1,4-16];
	
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
pushable = false;
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
action1Animation = sprBloodHoundBodyAction1												//$$//
action1FrameData = [0,2]
action1Follow = true;
action1Duration = 2.4;																	//$$//
action1AttackSoundID = noone;															//$$//
action1HitSoundID = noone;																//$$//
action1HitStart = action1Duration*(/**/7/**//sprite_get_number(action1Animation));		//$$//
action1HitDuration = action1Duration*(/**/2/**//sprite_get_number(action1Animation));	//$$//
action1MoveBurst = 3;																	//$$//
action1Move = 0;																		//$$//
action1MoveStart = action1Duration*(/**/6/**//sprite_get_number(action1Animation));		//$$//
action1MoveDuration = action1Duration*(/**/0/**//sprite_get_number(action1Animation));	//$$//
action1DamageType = 2;																	//$$//
action1Damage = 1;																		//$$//
action1Stagger = 1;																		//$$//
action1Knockback = 12;																	//$$//
action1StatusType = -1;																	//$$//
action1StatusValue = 0;																	//$$//
action1Pierce = true;

	//action2: Leap
		//Sub1: Pre-Leap
action2Sub1Animation = sprBloodHoundBodyAction2Sub1;
action2Sub1Duration = 0.8;
action2Sub1SoundID = noone;															//$$//
		//Sub2: Leap execute
action2Sub2Animation = sprBloodHoundBodyAction2Sub2;
action2Sub2TargetEnemy = false;	//CHANGE THIS TO MAKE LEAP TARGET PLAYER
action2Sub2Angle = 25;
action2Sub2Distance = 180;
action2Sub2AttackSoundID = noone;
			//damage zone
action2Sub2ZoneID = noone;															//$$//
action2Sub2ZoneHitSoundID = noone;																//$$//
action2Sub2ZoneFrameData = -1;
action2Sub2ZoneFollow = true;
action2Sub2ZoneDuration = -1
action2Sub2ZoneDamageType = 1;
action2Sub2ZoneDamage = 0.3;
action2Sub2ZoneStagger = 0;
action2Sub2ZoneKnockback = 1.5;
action2Sub2ZoneStatusType = -1;
action2Sub2ZoneStatusValue = 0;
action2Sub2ZonePierce = true;
		//sub3: Landing
action2Sub3Animation = sprBloodHoundBodyAction2Sub3;
action2Sub3Duration = 0.8;

			//damage zone
action2Sub3ZoneID = noone;
action2Sub3ZoneAttackSoundID = noone;															//$$//
action2Sub3ZoneHitSoundID = noone;																//$$//
action2Sub3ZoneFrameData = [0,1]
action2Sub3ZoneFollow = false;
action2Sub3ZoneDuration = -1
action2Sub3ZoneDamageType = 1;
action2Sub3ZoneDamage = 0.3;
action2Sub3ZoneStagger = 0;
action2Sub3ZoneKnockback = 1.5;
action2Sub3ZoneStatusType = -1;
action2Sub3ZoneStatusValue = 0;
action2Sub3ZonePierce = true;
	
	//action3: Fling Corpses
		//attack
action3Animation = sprBloodHoundBodyAction3;											//$$//
action3FrameData = [4,6];
action3Follow = true;	
action3Duration = 1.4;																	//$$//
action3AttackSoundID = noone;															//$$//
action3HitSoundID = noone;																//$$//
action3HitStart = action3Duration*(/**/9/**//sprite_get_number(action3Animation));
action3HitDuration = action3Duration*(/**/2/**//sprite_get_number(action3Animation));
action3MoveBurst = 0																	//$$//
action3Move = 0;																		//$$//
action3MoveStart = action3Duration*(/**/0/**//sprite_get_number(action3Animation));
action3MoveDuration = action3Duration*(/**/0/**//sprite_get_number(action3Animation));
action3DamageType = 2;																	//$$//
action3Damage = 1;																		//$$//
action3Stagger = 1;																		//$$//
action3Knockback = 12;																	//$$//
action3StatusType = -1;																	//$$//
action3StatusValue = 0;																	//$$//
action3Pierce = true;
		//corpses
action3CorpseMin = 3;
action3CorpseMax = 4;
action3CorpseTime = action3Duration*(/**/9/**//sprite_get_number(action3Animation));
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