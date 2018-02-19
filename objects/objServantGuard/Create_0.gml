event_inherited();

with statCache
{
	hpMax = 60;											
	mpMax = 0;											
	
	damagePower = 6;									
	staggerPower = 5;									
	
	physicalToughness = 2.2;							
	magicalToughness = 1.2;								
	breakCooldownDuration = 1.8;
	
	moveSpeed = 0.35;									
	defaultMoveSpeed = moveSpeed;
	
	killExp = 12;
	killGold = [0.1,4-16];
	
	hp = hpMax;
	mp = mpMax;
}						

//variables					
landingDuration = 0.5;
staggeredDuration = 0.5;
stunnedDuration = 0.6;
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
	//action1: general attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action1Animation = sprServantGuardBodyAction1											
action1FrameData = -1;
action1Follow = true;
action1Duration = 1;																	//$$//
action1AttackSoundID = noone;															//$$//
action1HitSoundID = noone;																//$$//
action1HitStart = action1Duration*(/**/5/**//sprite_get_number(action1Animation))		
action1HitDuration = action1Duration*(/**/3/**//sprite_get_number(action1Animation))	
action1MoveBurst = 6;																	//$$//
action1Move = 0;																		//$$//
action1MoveStart = action1Duration*(/**/4/**//sprite_get_number(action1Animation))		
action1MoveDuration = action1Duration*(/**/3/**//sprite_get_number(action1Animation))	
action1DamageType = damageType.pierce;																	//$$//
action1Damage = 1;																		//$$//
action1Stagger = 1;																		//$$//
action1Knockback = 3.5;																	//$$//
action1StatusType = specialType.none;																	//$$//
action1StatusValue = 0;																	//$$//
action1Pierce = false;																	//$$//

	//action2: parry begin
action2AiTimer = 0;
action2AiMoveDuration = 1;
		//sub1: defensive stance
action2AnimationSub1Forward = sprServantGuardBodyAction2Sub1Forward;
action2AnimationSub1Idle = sprServantGuardBodyAction2Sub1Idle;
action2AnimationSub1Back = sprServantGuardBodyAction2Sub1Back;
action2DurationSub1 = 7;
			//damage zone
action2ZoneAnimation = sprServantGuardEffectAction2Sub1;
action2ZoneID = noone;
action2ZoneFrameData = -1;
action2ZoneDuration = -1;
action2ZoneFollow = true;
action2ZoneAttackSoundID = noone;
action2ZoneHitSoundID = noone;
action2ZoneDuration = -1;
action2ZoneDamageType = damageType.blunt;
action2ZoneDamage = 0.3;
action2ZoneStagger = 0;
action2ZoneKnockback = 1.5;
action2ZoneStatusType = specialType.none;
action2ZoneStatusValue = 0;
action2ZonePierce = false;	

		//sub2: blocking reaction
action2DurationSub2 = 0.6;
action2AnimationSub2 = sprServantGuardBodyAction2Sub2;

	//action3: parry counter-attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action3Animation = sprServantGuardBodyAction3											
action3FrameData = -1;
action3Follow = true;
action3Duration = 0.7;	//$$//
action3AttackSoundID = noone;															//$$//
action3HitSoundID = noone;																//$$//
action3HitStart = action3Duration*(/**/5/**//sprite_get_number(action3Animation))		
action3HitDuration = action3Duration*(/**/2/**//sprite_get_number(action3Animation))	
action3MoveBurst = 3;																	//$$//
action3Move = 0;																		//$$//
action3MoveStart = action3Duration*(/**/4/**//sprite_get_number(action3Animation))		
action3MoveDuration = action3Duration*(/**/3/**//sprite_get_number(action3Animation))	
action3DamageType = damageType.pierce;																	//$$//
action3Damage = 2;																	
action3Stagger = 1.5;																		
action3Knockback = 4;																	//$$//
action3StatusType = specialType.none;																	//$$//
action3StatusValue = 0;																	//$$//
action3Pierce = false;																	//$$//