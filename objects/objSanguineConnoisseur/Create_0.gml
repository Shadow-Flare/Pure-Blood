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
	hpMax = 45;
	mpMax = 80;
	
	damagePower = 6;
	staggerPower = 4;
	
	physicalToughness = 1;
	magicalToughness = 1;
	
	moveSpeed = 0;
	defaultMoveSpeed = moveSpeed;
	
	killExp = 20
	killGold = [0.1,4-16]
	
	hitEffectType = "blood";
	hitEffectColour = "dark red";
	
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
landingDuration = 0.7;
deflectDuration = 0.7;									//&&//
staggeredDuration = 0.5;
proneDuration = 0.6;

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