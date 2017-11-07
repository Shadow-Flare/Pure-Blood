statCache = PlayerStats;

xSpd = 0;
ySpd = 0;
facing = 1;
phase = state.base;
phaseTimer = 0;
subPhase = subState.idle;
subPhaseTimer = 0;
vPhase = vState.grounded;
hitPhase = hitState.normal;
actorType = actorTypes.player;
maxFallSpeed = 5;
phased = 0;
pushable = true;
isDead = false;
dropThroughPlatforms = false;
onPlatform = false;
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
canChangeTarget = 1;

aimAngle = 0;

jumpNum = 0;

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
crossbowBoltInitialSpeed = 10;

ropeShotDurationPre = 0.2;
ropeShotDurationFire = 0.25;
ropeShotSpeedGround = 7;
ropeShotSpeedAerial = 11;
ropeShotTargetRange = 120;
ropeShotMaxDist = 180

attackName = noone;
attackNum = -1;
attackHardCooldown = 0.3;
attackHardCooldownTimer = -1;
attackGroundTrackDistance = 32;
attackTrackXDistance = 32;
attackTrackYDistance = 16;
attackEffectAlpha = 0.7;
hasDeflected = false;

aerialAttackVertBoost = -0.25;
aerialYSpdCap = 0.5;
aerialTargetX = -4;
aerialTargetY = -4;

blockingDurationPre = 0.1;
blockingDurationBlocking = 0.7;
blockingDurationPost = 0.2;
blockingDurationReaction = 0.4;
hasBlocked = false;

dodgeDistance = 16*3.5;				//16*<number of blocks>		//(before "xSpd-=xSpd/4" slowdown)
dodgeDurationPerforming = 0.2;
dodgeDurationPost = 0.2;

staggeredDuration = 0.6;
proneDuration = 1;
deflectDuration = 0.7;

isDead = false;
deathDuration = 3;
deathFadeDuration = 5;

dUInputTimer = -1;
dLInputTimer = -1;
dRInputTimer = -1;
dDInputTimer = -1;

reset_queue();