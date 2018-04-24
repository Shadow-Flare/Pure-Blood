event_inherited();

//player enumerators
enum state {base, attacking, offhand, ability, blocking, dodging, hitReaction, itemUse, emote, dying, action1, action2, action3, action4, action5};
enum subState {none, idle, walking, walkingBackwards, running, landing, airborne, performing, post, pre, fire, aim, holding, reaction, recovery, staggered, stunned, aerialStagger, deflected, actionSub1, actionSub2, actionSub3, actionSub4, actionSub5};
enum vState {grounded, midAir, jumping};

statCache = PlayerStats;

canAct = true;
interactionInstance = noone;

facing = 1;
phase = state.base;
phaseTimer = 0;
subPhase = subState.idle;
subPhaseTimer = 0;
vPhase = vState.grounded;
hitPhase = hitState.normal;
actorType = actorTypes.player;
canChangeVState = true;
vChangeBreak = true;
lastAttackHasHit = false;
maxFallSpeed = 5;
phased = 0;
pushable = true;
isDead = false;
dropThroughPlatforms = false;
onPlatform = noone;
canStep = true;
equipmentChange = false;

bboxDefaultLeft = bbox_left;
bboxDefaultRight = bbox_right;
bboxDefaultTop = bbox_top;
bboxDefaultBottom = bbox_bottom;

bboxLeft = bboxDefaultLeft;
bboxRight = bboxDefaultRight;
bboxTop = bboxDefaultTop;
bboxBottom = bboxDefaultBottom;

landingDuration = 0.6;

baseSpriteIndex = noone;
weaponSpriteIndex = noone;
//effectSpriteIndex = noone;

auxSpriteIndex = noone;
auxSpriteXOffset = 0;
auxSpriteYOffset = 0;
auxSpriteXScale = 0;
auxSpriteYScale = 0;
auxSpriteRotation = 0;

enum lockOn {off, soft, hard}
lockOnType = lockOn.off;
lockOnTarget = noone;
softLockRange = 260;
hardLockRange = 320;
lockImageTimer = 0;
canChangeTarget = true;

aimAngle = 0;

jumpNum = 0;

usedItemSlotIndex = 0;
usedItemIndex = 0;
usedItemSprite = noone;
usedItemAnimDuration = 0;
usedItemUseDuration = 0;

offhandHardCooldown = 0.2;
offhandHardCooldownTimer = -1;
offhandAimGraphicDistance = 64;

crossbowDurationPre = 0.2;
crossbowDurationFire = 0.25;
crossbowDurationHolding = 0.3;
crossbowDurationPost = 0.2;
crossbowDurationAerialPre = 0.2;
crossbowDurationAerialFire = 0.25;
crossbowDurationAerialHolding = 0.2;
crossbowAerialBounce = -0.3;
crossbowBoltInitialSpeed = 16;

ropeShotID = noone;
ropeShotTarget = noone;
ropeShotTargetID = noone;
ropeShotTargetRange = 120;
ropeShotSpeed = 6;
ropeShotDurationPre = 0.2;
ropeShotDurationFire = 0.25;
ropeShotSpeedGround = 3.2;
ropeShotSpeedAerial = 4.6;
ropeShotHookDistGrapplePoint = 32;
ropeShotHookDistGrappleEnemy = 32;
ropeShotSwingDist = 0;
ropeShotSwingDistMin = 32;
ropeShotSwingDistMax = 128;
ropeShotAngularSpeed = 0;
ropeShotMaxDist = 180

attackName = noone;
attackNum = -1;
attackHardCooldown = 0.3;
attackHardCooldownTimer = -1;
attackGroundTrackDistance = 32;
attackTrackXDistance = 48;
attackTrackYDistance = 24;
attackEffectAlpha = 0.7;
hasDeflected = false;

aerialAttackVertBoost = -0.25;
aerialYSpdCap = 0.5;
aerialTargetX = -4;
aerialTargetY = -4;

blockingDurationPre = 0.05;
blockingDurationBlocking = 0.4;
blockingDurationPost = 0.05;
blockingDurationReaction = 0.4;
hasBlocked = false;

canMoveDefend = true;
canMoveDefendTimer = 0;
canMoveDefendCooldown = 0.4;
dodgeDistance = 16*3.5;				//16*<number of blocks>		//(before "xSpd-=xSpd/4" slowdown)
dodgeDurationPerforming = 0.2;
dodgeDurationPost = 0.2;

glideTimer = 0;
glideDuration = 0.8;	//seconds
canGlide = 1;

staggeredDuration = 0.9;
stunnedDuration = 0.6;
stunnedRecoveryDuration = 0.6;
deflectDuration = 0.7;

isDead = false;
deathDuration = 3;
deathFadeDuration = 5;

dUInputTimer = -1;
dLInputTimer = -1;
dRInputTimer = -1;
dDInputTimer = -1;

reset_queue();
moveH = 0;
moveV = 0;