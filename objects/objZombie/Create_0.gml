event_inherited();

with statCache
{
	hpMax = 20;											
	mpMax = 0;											
	
	damagePower = 7;									
	staggerPower = 3;									
	
	physicalToughness = 1.2;								
	magicalToughness = 1;		
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
staggeredDuration = 0.5;								
stunnedDuration = 1.8;
deflectDuration = 0.7;
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
action1Animation = sprZombieBodyAction1													
action1FrameData = -1;
action1Follow = true;
action1Duration = 1.2;	
action1AttackSoundID = noone;															//$$//
action1HitSoundID = noone;																//$$//
action1HitStart = action1Duration*(/**/10/**//sprite_get_number(action1Animation))		
action1HitDuration = action1Duration*(/**/3/**//sprite_get_number(action1Animation))	
action1MoveBurst = 5;																	
action1Move = 0;																		
action1MoveStart = action1Duration*(/**/9/**//sprite_get_number(action1Animation))		
action1MoveDuration = action1Duration*(/**/2/**//sprite_get_number(action1Animation))																		
action1DamageType = damageType.slash;																	
action1Damage = 1;																		
action1Stagger = 1.8;																		
action1Knockback = 3;																	
action1StatusType = damageType.none;																	
action1StatusValue = 0;																	
action1Pierce = false;																	