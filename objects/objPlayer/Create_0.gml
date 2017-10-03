//Initialize enums (MOVE TO CONTROLLER CREATE)
enum actorTypes {player, ally, enemy, corpse}

enum state {base, attacking, offhand, ability, blocking, dodging, hitReaction, dying};
enum subState {none, idle, walking, walkingBackwards, running, landing, airborne, performing, post, pre, fire, aim, holding, reaction, staggered, flung};
enum vState {grounded, midAir, jumping};
enum hitState {normal, blocking, dodging}

xSpd = 0;
ySpd = 0;
facing = 1;
phase = state.base;
phaseTimer = 0;
subPhase = subState.idle;
subPhaseTimer = 0;
vPhase = vState.grounded;
actorType = actorTypes.player;
maxFallSpeed = 40;
phased = 0;

landingDuration = 0.6;

baseSpriteIndex = noone;
weaponSpriteIndex = noone;
effectSpriteIndex = noone;

auxSpriteIndex = noone;
auxSpriteXOffset = 0;
auxSpriteYOffset = 0;
auxSpriteXScale = 0;
auxSpriteYScale = 0;
auxSpriteRotation = 0;

enum lockOn {off, soft, hard}
lockOnType = lockOn.off;
lockOnTarget = noone;
canChangeTarget = 1;

aimAngle = 0;

jumpNum = 0;

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
ropeShotTargetRange = 1024;
ropeShotMaxDist = 1500

attackName = noone;
attackHardCooldown = 0.2;
attackHardCooldownTimer = -1;
attackTrackDistance = 126;

aerialAttackVertBoost = -0.25;
aerialTargetX = -4;
aerialTargetY = -4;

blockingDurationPre = 0.2;
blockingDurationBlocking = 0.5;
blockingDurationPost = 0.2;
blockingDurationReaction = 0.3;
hasBlocked = 0;

dodgeDistance = 16*3.5;				//16*<number of blocks>		//(before "xSpd-=xSpd/4" slowdown)
dodgeDurationPerforming = 0.2;
dodgeDurationPost = 0.2;

hitPhase = hitState.normal;

staggeredDuration = 0.6;
proneDuration = 0.6;
deathDuration = 3;

dUInputTimer = -1;
dRInputTimer = -1;

reset_queue();