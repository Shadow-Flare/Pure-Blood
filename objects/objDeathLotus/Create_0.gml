event_inherited();

with statCache
{
	hpMax = 20;											//$$//
	mpMax = 0;											//$$//
	
	damagePower = 1;									//$$//
	staggerPower = 3;									//$$//
	
	physicalToughness = 1;								//$$//
	magicalToughness = 1;								//$$//
	breakCooldownDuration = 1;							//$$//
	
	moveSpeed = 0;										//$$//
	defaultMoveSpeed = moveSpeed;
	
	killExp = 6;
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
staggeredDuration = 0.2;								//$$//
pushable = false;
flying = false;

deathDuration = 1;										//$$//
deathFadeDuration = 2;									//$$//

//ai data
aggroRange = 16*7;										//$$//
actionHardCooldown = 2.2;
changeFacing = false;
targetX = -4;
targetY = -4;

	//direction check
image_angle+=90;
if image_angle == 360 image_angle = 0;
actorDirection = image_angle/90;
image_angle = 0;

//action data
	//action1: ranged attack
action1Animation = sprDeathLotusBodyAction1;
action1AttackSoundID = noone;
action1Duration = 1;
	action1ProjCreateTime = action1Duration*(/**/4/**//sprite_get_number(action1Animation));
	action1ProjCreateXOffset = 0;
	action1ProjCreateYOffset = 0;
	action1ProjCreateSpeed = 4;
	action1ProjDamageType = 2;
	action1ProjDamage = 1;
	action1ProjStagger = 1;
	action1ProjKnockback = 4;
	action1ProjStatusType = -1;
	action1ProjStatusValue = 0;
	action1ProjPierce = false;
	action1ProjHitSoundID = noone;

	//action2: turn
action2Animation = sprDeathLotusBodyAction2;
action2Duration = 0.4;