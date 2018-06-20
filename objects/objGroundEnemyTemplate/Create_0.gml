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
	
	toughness = 1;										//$$//
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
action1Data = ds_map_create();
scr_enemyActionDataDefaults(action1Data,enemyActionType.attack);
action1Data[? enemyActionData.animation] = sprZombieBodyAction1;
action1Data[? enemyActionData.duration] = 1.2;
action1Data[? enemyActionData.follow] = true;
action1Data[? enemyActionData.frameData] = -1;
action1Data[? enemyActionData.performSoundID] = noone;
action1Data[? enemyActionData.hitSoundID] = noone;
action1Data[? enemyActionData.hitStart] = action1Data[? enemyActionData.duration]*(/**/10/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.hitDuration] = action1Data[? enemyActionData.duration]*(/**/3/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.hitAngle] = 0;
action1Data[? enemyActionData.hitEffects] = noone;
action1Data[? enemyActionData.moveX] = 0;
action1Data[? enemyActionData.moveY] = 0;
action1Data[? enemyActionData.moveBurstX] = 5;
action1Data[? enemyActionData.moveBurstY] = 5;
action1Data[? enemyActionData.moveStart] = action1Data[? enemyActionData.duration]*(/**/9/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.moveDuration] = action1Data[? enemyActionData.duration]*(/**/2/**//sprite_get_number(action1Data[? enemyActionData.animation]));
action1Data[? enemyActionData.pierce] = false;
scr_create_damageCache(action1Data[? enemyActionData.damageData],1.0,1.0,1,0,0,0,0,0,0,0,0,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,action1Data);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;