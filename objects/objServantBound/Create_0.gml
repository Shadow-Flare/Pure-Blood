//base behaviour data
actorType = actorTypes.wild;
aggroPhase = enemyAggroState.passive;
phase = state.base;
subPhase = subState.idle;
vPhase = vState.midAir;
hitPhase = hitState.normal;

phaseTimer = 0;
subPhaseTimer = 0;
baseSpriteIndex = sprite_index;
effectSpriteIndex = noone;
maxFallSpeed = 5;
xSpd = 0;
ySpd = 0;
facing = irandom(1);
if facing == 0 facing = -1;
phased = false;
pushable = true;
flying = false;
onPlatform = false;
dropThroughPlatforms = false;
tempBodySprite = noone;

bboxDefaultLeft = sprite_get_bbox_left(sprite_index);
bboxDefaultRight = sprite_get_bbox_right(sprite_index);
bboxDefaultTop = sprite_get_bbox_top(sprite_index);
bboxDefaultBottom = sprite_get_bbox_bottom(sprite_index);

bboxLeft = bboxDefaultLeft;
bboxRight = bboxDefaultRight;
bboxTop = bboxDefaultTop;
bboxBottom = bboxDefaultBottom;

if !layer_exists("lay_caches") layer_create(0,"lay_caches");
statCache = instance_create_layer(0,0,"lay_caches",ActorStats)
with statCache
{
	hpMax = 80;											//$$//
	mpMax = 0;											//$$//
	
	damagePower = 17;									//$$//
	staggerPower = 20;									//$$//
	
	physicalToughness = 999;								//$$//
	magicalToughness = 999;								//$$//
	
	moveSpeed = 2;									//$$//
	defaultMoveSpeed = moveSpeed;
	
	killExp = 2
	killGold = [0.1,4-16]
	
	hitEffectType = "blood";
	hitEffectColour = "dark red";
	
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

	//Special Damage initializers
	specialDamage[0] = 0;				//Bleed

	//Special resistances (100 is considered normal)
	specialResist[0] = 100;				//Bleed			//$$//
	
	hp = hpMax;
	mp = mpMax;
	
	isInvulnerable = false;
}

//drives
driveJump = false;
driveAction = 0;
driveMove = 0;

//base checks
actionHardCooldownTimer = -1;
hasBlocked = false;
hasDeflected = false;
canChangeVState = true;
isDead = false;
hasBeenHit = false;
lastHitType = -1;

//variables
landingDuration = 0.7;									//&&//
staggeredDuration = 0.5;
proneDuration = 0.6;
deflectDuration = 0.7;									//&&//

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