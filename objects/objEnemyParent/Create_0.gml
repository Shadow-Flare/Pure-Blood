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
lastHitTypes = ds_list_create(); repeat(10) ds_list_add(lastHitTypes,false);
lastAttackHasHit = false;
hasBeenUppercut = false;
hasStaggered = false;
hasFlung = false;
isHooked = noone;

//base data
pushable = true;

//drives
canAct = true;
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
	
	toughness = 1;
	breakCooldownDuration = 1;
	mass = 1;
	
	breakHp = 0;
	
	moveSpeed = 1;
	defaultMoveSpeed = moveSpeed;
	
	killExp = 0;
	killGold = [0,0,0];
	
	hitEffectType = "blood";
	hitEffectColour = "dark red";
	
		//Damage type resistances (as percentage; 1 = 100% of damage is recieved)
	damageResistances[damageType.slash] = 0;
	damageResistances[damageType.blunt] = 0;
	damageResistances[damageType.pierce] = 0;
	damageResistances[damageType.fire] = 1;
	damageResistances[damageType.ice] = 1;
	damageResistances[damageType.lightning] = 1;
	damageResistances[damageType.arcane] = 1;
	damageResistances[damageType.light] = 1;
	damageResistances[damageType.dark] = 1;
	damageResistances[damageType.pure] = 1;			//should allways be 1

	//Special activation check, all initially false
	specialHasActivated[specialType.bleed] = false;
	specialHasActivated[specialType.poison] = false	

	//Special Cooldowns (seconds)
	specialCooldowns[specialType.bleed] = 6;
	specialCooldowns[specialType.poison] = 15;

	//Special Damage initializers
	specialDamages[specialType.bleed] = 0;
	specialDamages[specialType.poison] = 0;

	//Special resistances (100 is considered normal)
	specialResistances[specialType.bleed] = 100;
	specialResistances[specialType.poison] = 100;
	
	hp = hpMax;
	mp = mpMax;
	
	isInvulnerable = false;
}

actionDataHolder = noone;