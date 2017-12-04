/*
Template for an enemy

most of the code in this object is re-usable
accross all objects and is intended to be so.
Any code or initializers followed by "//$$//"
are template code and should have their values
and/or code altered in accordnace.

*/

event_inherited();

with statCache
{
	hpMax = 20;											//$$//
	mpMax = 0;											//$$//
	
	damagePower = 7;									//$$//
	staggerPower = 3;									//$$//
	
	physicalToughness = 1;								//$$//
	magicalToughness = 1;								//$$//
	breakCooldownDuration = 1;							//$$//
	
	moveSpeed = 0.5;									//$$//
	defaultMoveSpeed = moveSpeed;
	
	killExp = 4;										//$$//
	killGold = [0.1,4-16];								//$$//
	
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
deflectDuration = 0.7;									//$$//
pushable = true;										//$$//
flying = false;											//$$//

deathDuration = 1;										//$$//
deathFadeDuration = 2;									//$$//

//ai data
aggroRange = 16*7;										//$$//
actionHardCooldown = 3;									//$$//
attack1Range = 16*2.5;									//$$//

//action data
	//action1: general attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action1Animation = sprZombieBodyAction1													//$$//
action1FrameData = -1;																	//$$//
action1Follow = true;																	//$$//
action1Duration = 2;																	//$$//
action1AttackSoundID = noone;															//$$//
action1HitSoundID = noone;																//$$//
action1HitStart = action1Duration*(/**/5/**//sprite_get_number(action1Animation))		//$$//
action1HitDuration = action1Duration*(/**/3/**//sprite_get_number(action1Animation))	//$$//
action1MoveBurst = 3;																	//$$//
action1Move = 0;																		//$$//
action1MoveStart = action1Duration*(/**/4/**//sprite_get_number(action1Animation))		//$$//
action1MoveDuration = action1Duration*(/**/2/**//sprite_get_number(action1Animation))	//$$//
action1DamageType = 2;																	//$$//
action1Damage = 1;																		//$$//
action1Stagger = 1;																		//$$//
action1Knockback = 12;																	//$$//
action1StatusType = -1;																	//$$//
action1StatusValue = 0;																	//$$//
action1Pierce = false;																	//$$//