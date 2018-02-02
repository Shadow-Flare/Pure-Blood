event_inherited();

//base behaviour data
actorType = actorTypes.enemy;
aggroPhase = enemyAggroState.passive;
phase = state.base;
subPhase = subState.idle;
vPhase = vState.midAir;
hitPhase = hitState.normal;

phaseTimer = 0;
subPhaseTimer = 0;
baseSpriteIndex = sprite_index;
maxFallSpeed = 5;
facing = irandom(1);
if facing == 0 facing = -1;
phased = false;
onPlatform = false;
dropThroughPlatforms = false;
target = noone;

//base checks
actionHardCooldownTimer = -1;
hasBlocked = false;
hasDeflected = false;
canChangeVState = true;
vChangeBreak = true;
isDead = false;
hasBeenHit = false;
lastHitType = -1;
lastAttackHasHit = false;
hasBeenUppercut = false;
hasStaggered = false;
hasFlung = false;

//drives
driveJump = false;
driveAction = 0;
driveMove = 0;

if !layer_exists("lay_caches") layer_create(0,"lay_caches");
statCache = instance_create_layer(0,0,"lay_caches",ActorStats);

with statCache
{
	hpMax = 0;
	mpMax = 0;
	
	damagePower = 0;
	staggerPower = 0;
	
	physicalToughness = 1;
	magicalToughness = 1;
	breakCooldownDuration = 1;
	
	physicalBreakHp = 0;
	magicalBreakHp = 0;
	
	moveSpeed = 1;
	defaultMoveSpeed = moveSpeed;
	
	killExp = 0;
	killGold = [0,0,0];
	
	hitEffectType = "blood";
	hitEffectColour = "dark red";
	
		//Damage type resistances (as percentage; 1 = 100%)
	damageResistances[0] = 1;			//Slash
	damageResistances[1] = 1;			//Blunt
	damageResistances[2] = 1;			//Pierce
	damageResistances[3] = 1;			//Fire
	damageResistances[4] = 1;			//Ice
	damageResistances[5] = 1;			//Lightning
	damageResistances[6] = 1;			//Arcane
	damageResistances[7] = 1;			//Light
	damageResistances[8] = 1;			//Dark
	damageResistances[9] = 1;			//X damage

	//Special Damage initializers
	specialDamage[0] = 0;				//Bleed

	//Special resistances (100 is considered normal)
	specialResist[0] = 100;				//Bleed
	
	hp = hpMax;
	mp = mpMax;
	
	isInvulnerable = false;
}