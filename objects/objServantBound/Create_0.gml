event_inherited();
actorType = actorTypes.wild;

with statCache
{
	hpMax = 80;
	mpMax = 0;
	
	damagePower = 17;
	staggerPower = 20;
	
	physicalToughness = 999;
	magicalToughness = 999;
	breakCooldownDuration = 1;
	
	moveSpeed = 1;										//$$//
	defaultMoveSpeed = moveSpeed;
	
	killExp = 2
	killGold = [0.1,4-16]
	
		//Damage type resistances (as percentage; 1 = 100%)
	damageResistances[0] = 1;			//Slash			//$$//
	damageResistances[1] = 1;			//Blunt			//$$//
	damageResistances[2] = 1;			//Pierce		//$$//
	damageResistances[3] = 0;			//Fire
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
action1DamageType = 3;
action1Damage = 1;
action1Stagger = 1;
action1Knockback = 4;
action1StatusType = -1;
action1StatusValue = 0;
action1Pierce = 1;