event_inherited();

with statCache
{
	hpMax = 45;
	mpMax = 80;
	
	damagePower = 6;
	staggerPower = 4;
	
	physicalToughness = 1;
	magicalToughness = 1;
	breakCooldownDuration = 1;
	
	moveSpeed = 0;
	defaultMoveSpeed = moveSpeed;
	
	killExp = 20
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
landingDuration = 0.7;
deflectDuration = 0.7;									//&&//
staggeredDuration = 0.5;
stunnedDuration = 0.6;
pushable = true;
flying = false;

deathDuration = 1;										//$$//
deathFadeDuration = 2;									//$$//

//ai data
aggroRange = 16*16;
actionHardCooldown = 2.2;
attackMinRange = 16*6;
numOfAction1 = 0;
targetX = -4;
targetY = -4;

//action data
	//action1: ranged attack
		//sub1: charge up
action1Sub1Animation = sprSanguineConnoisseurBodyAction1Sub1;
action1Sub1Duration = 1; 

		//sub2: throw
action1Sub2Animation = sprSanguineConnoisseurBodyAction1Sub2;
action1Sub2Duration = 0.7;
	action1Sub2ProjCreateTime = action1Sub2Duration*(/**/7/**//sprite_get_number(action1Sub2Animation));
	action1Sub2AttackSoundID = noone;															//$$//															//$$//
	action1Sub2ProjCreateXOffset = -6;
	action1Sub2ProjCreateYOffset = -21;
	action1Sub2ProjCreateSpeed = 4;
	action1Sub2ProjDamageType = 8;
	action1Sub2ProjDamage = 1;
	action1Sub2ProjStagger = 1;
	action1Sub2ProjKnockback = 4;
	action1Sub2ProjStatusType = -1;
	action1Sub2ProjStatusValue = 0;
	action1Sub2ProjPierce = false;

	//action2: teleport
		//sub1: charge up
action2Sub1Animation = sprSanguineConnoisseurBodyAction2Sub1;
action2Sub1Duration = 1; 

		//sub1: teleport
action2Sub2Animation = sprSanguineConnoisseurBodyAction2Sub2;
action2Sub2Duration = 0.7; 
action2Sub2TeleportMinDistance = attackMinRange*1.25;

		//sub1: re-appear
action2Sub3Animation = sprSanguineConnoisseurBodyAction2Sub3;
action2Sub3Duration = 0.7; 