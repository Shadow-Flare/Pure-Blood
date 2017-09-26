global.g = 2;
phase = state.base;
phaseTimer = 0;
subPhase = subState.idle;
subPhaseTimer = 0;
vPhase = vState.grounded;

baseSpriteIndex = noone;
weaponSpriteIndex = noone;
effectSpriteIndex = noone;

auxSpriteIndex = noone;
auxSpriteXOffset = 0;
auxSpriteYOffset = 0;
auxSpriteXScale = 0;
auxSpriteYScale = 0;
auxSpriteRotation = 0;

aimAngle = 0;

offhandHardCooldown = 0.2;
offhandHardCooldownTimer = -1;

crossbowDurationPre = 0.2;
crossbowDurationFire = 0.25;
crossbowDurationHolding = 0.3;
crossbowDurationPost = 0.2;
crossbowDurationAerialPre = 0.2;
crossbowDurationAerialFire = 0.25;
crossbowDurationAerialHolding = 0.2;
crossbowAerialBounce = -2.5;
crossbowBoltInitialSpeed = 80;

ropeShotDurationPre = 0.2;
ropeShotDurationFire = 0.25;
ropeShotSpeedGround = 60;
ropeShotSpeedAerial = 90;
ropeShotMaxDist = 1500

attackName = noone;
attackHardCooldown = 0.2;
attackHardCooldownTimer = -1;

attackTrackDistance = 126;
aerialAttackVertBoost = -6;

blockingDurationPre = 0.2;
blockingDurationBlocking = 0.5;
blockingDurationPost = 0.2;
blockingDurationReaction = 0.3

dodgeDistance = 16*8*3.5;				//16*8*<number of blocks>		//(before "xSpd-=xSpd/4" slowdown)
dodgeDurationPerforming = 0.2;
dodgeDurationPost = 0.2;

ropeShotTargetRange = 1024;

blocking = 0;
hasBlocked = 0;
dodging = 0;

reset_queue();

// ALL PAST HERE ARE UNUSED AT THE MOMENT

//savedata
global.xp = 0;
global.gold = 0;
global.strength = 5;
global.constitution = 5;
global.dexterity = 5;
global.cunning = 5;				//now unused
global.intelligence = 5;
global.willpower = 5;
global.hpMax = 20+4*global.constitution;
global.mpMax = 20+4*global.willpower;

//stats
hp = global.hpMax;
mp = global.mpMax;
physicalPower = 0+0.5*global.strength+0.5*global.dexterity;
physicalStagger = 1;
magicalPower = 0+1*global.intelligence;
toughness = 0+1*global.constitution;
moveSpeed = 15;
comboSize = 4;
aerialComboSize = 4;

//owned stuff, CHANGE
global.upgradeHasDoubleJump = 0;
global.upgradeHasHover = 0;
global.upgradeHasAerialDodge = 0;
global.ownedOffhands[0] = 0;
	global.ownedSubtypes[0,0] = 0;
	global.ownedSubtypes[0,1] = 1;
	global.ownedSubtypes[0,2] = 2;
	global.ownedSubtypes[0,3] = 3;
	global.ownedSubtypes[0,4] = 4;
	global.ownedActivatables[0,0] = 0;
global.ownedOffhands[1] = 1;
	global.ownedSubtypes[1,0] = 5;
	global.ownedSubtypes[1,1] = 6;
	global.ownedSubtypes[1,2] = 7;
	global.ownedSubtypes[1,3] = 8;
	global.ownedSubtypes[1,4] = 9;
	global.ownedActivatables[1,0] = 2;
	global.ownedActivatables[1,1] = 3;

//mechanical related definitions
jumpHeightVar = 3.5;			//total jump height in blocks (16x16px or 128x128)
maxFallSpeed = 40;
//dodgeDistance = 80*8			//16*8*<number of blocks>
//dodgeDuration = 0.4;
//dodgeDelay = 1;
//dodgeCooldown = 0;
blockDuration = 0.6;
blockCooldown = 0.2;
staggerDuration = 0.6;
landingDuration = 1.2;
deflectedDuration = 0.5;
proneDuration = 1.6;
proneRecoverDuration = 0.4;

aerialAttackDelay = 1;
hitEffectType = "blood";
hitEffectColour = "dark red";
hookedSpeed = 20;

//Damage type resistances
resistances[0] = 100;			//Slash
resistances[1] = 100;			//Blunt
resistances[2] = 100;			//Pierce
resistances[3] = 100;			//Fire
resistances[4] = 100;			//Ice
resistances[5] = 100;			//Lightning
resistances[6] = 100;			//Arcane
resistances[7] = 100;			//Light
resistances[8] = 100;			//Dark

//Status resistances
bleedResist = 100;

//Other
xInputQueue = 0;
yInputQueue = 0;
bInputQueue = 0;

aerialTargetX = -4;
aerialTargetY = -4
deflected = 0;
transitioning = 0;
pauseing = 0;
canDodge = 1;
aimDir = 0;
crossbowDrawDuration = 0.5;		//seconds, also applies to holster
crossbowFireRate = 0.3	;		//seconds
crossbowHolsterDelay = 0.5;		//seconds
phased = 0;
uppercutTarget = noone;
isInvulnerable = "Off";
bleedValue = 0;
lockOnTarget = noone;
attackTarget = noone;
softLockRange = 1152;
hardLockRange = 2304;
softLockOn = 0;
hardLockOn = 0;
canChangeTarget = 1;
preOffhand = 0;
jumpPow = sqrt(2*(jumpHeightVar*16*8)*global.g)-1;		//jumpHeightVar*<blockSize>*<pixelSize>
defaultMoveSpeed = moveSpeed;
defaultRoomSpeed = room_speed;
defaultImageSpeed = image_speed;
hookTarget = noone;
phasePrev = state.base;
onGround = 1;
onGroundPrev = 1;
imPrev = 0;
lastHit = noone;
falling = 0;
lastSpawner = 0;
xSpd = 0;
ySpd = 0;
xPrev = 0;
yPrev = 0;

//timers & checkers
timerState = 0;
attackNum = 0;
jumpNum = 0;
attackTimer = 0;
canAerialAttack = 1;
canAerialAttackTimer = 0;
deathTimer = 0;
deathDuration = 3
hoverTimer = 0;
lockImageTimer = 0;
flying = 0;
facing = 1; //1=facing right, -1=facing left

//item part define
pSys = part_system_create();
part_system_depth(pSys,depth+1);
pEmitter = part_emitter_create(pSys);

pConsumableEffect = part_type_create();
part_type_sprite(pConsumableEffect,spr_item_consumableShine,1,0,1);
part_type_size(pConsumableEffect,4,4,0,0);
part_type_alpha2(pConsumableEffect,1,0);
part_type_direction(pConsumableEffect,0,360,0,0);
part_type_orientation(pConsumableEffect,0,0,0,0,0);
part_type_speed(pConsumableEffect,1,6,-0.04,0);
part_type_life(pConsumableEffect,40,80);