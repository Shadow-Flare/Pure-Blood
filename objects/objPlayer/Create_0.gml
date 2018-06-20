event_inherited();

//player enumerators
enum state {base, attacking, offhand, ability, blocking, dodging, hitReaction, itemUse, interact, emote, dying, action1, action2, action3, action4, action5};
enum subState {none, idle, walking, walkingBackwards, running, landing, airborne, performing, post, pre, fire, aim, holding, reaction, recovery, staggered, stunned, aerialStagger, deflected, actionSub1, actionSub2, actionSub3, actionSub4, actionSub5};
enum vState {grounded, midAir, jumping};
enum weaponSummonState {unsummoned, summoning, summoned};

statCache = PlayerStats;

canAct = true;
isPuppet = false;
driveMove = 0;

interactionInstance = noone;

phase = state.base;
subPhase = subState.idle;
vPhase = vState.grounded;
hitPhase = hitState.normal;

facing = 1;
phaseTimer = 0;
subPhaseTimer = 0;
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
mainWeaponEquipmentChange = false;
flyingDefault = false;
flying = flyingDefault;

emoteSprite = sprPlayerBodyDefaultIdle;
emoteAnimSpeed = 0;
emoteStateDuration = 0;

lastHitTypes = ds_list_create(); repeat(10) ds_list_add(lastHitTypes,false);

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
weaponSpriteAlpha = 0;
weaponSpriteEffectIntensity = 0;
weaponSpriteEffectIntensityBuffer = 0;
weaponSpriteEffectIntensityGlow = 0;
equipmentSwitchWeaponIndex = noone;

weaponSummonPhase = weaponSummonState.unsummoned;
weaponSummonPhaseChange = false;
weaponSummonTimer = 0;
weaponSummonDuration = 1.6;
weaponSummonFadeInDuration = 0.6;
weaponSummonFadeOutDuration = 0.6;
weaponSummonFadeList = ds_list_create();
weaponSummonIntensity = 0;
#region pAura particle system setup
	//effects
if !layer_exists("lay_technicals") layer_create(100,"lay_technicals");
if !instance_exists(ParticleController) instance_create_layer(0,0,"lay_technicals",ParticleController);

pAura = part_type_create();
part_type_sprite(pAura,spr_pixel,0,0,0);
//part_type_orientation(pAura,0,360,0,0,0);
part_type_direction(pAura,0,360,0,0);
//part_type_size(pAura,0,2,0.6,0,0);
part_type_speed(pAura,0.1,0.3,0,0);
part_type_colour2(pAura,c_white,c_teal);
part_type_alpha3(pAura,1,1,0);
part_type_blend(pAura,1);
part_type_life(pAura,15,25);
#endregion

auxSpriteIndex = noone;
auxSpriteXOffset = 0;
auxSpriteYOffset = 0;
auxSpriteXScale = 0;
auxSpriteYScale = 0;
auxSpriteRotation = 0;

enum lockOn {off, soft, hard}
lockOnType = lockOn.off;
lockOnDir = 1;
lockOnTarget = noone;
softLockRange = 16*8;
hardLockRange = 16*14.5;
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

grimoireDurationPre = 0.3;
grimoireDurationFire = 0.4;
grimoireDurationHolding = 0.3;
grimoireDurationPost = 0.15;
grimoireDurationAerialPre = 0.3;
grimoireDurationAerialFire = 0.4;
grimoireDurationAerialHolding = 0.;
grimoireAerialBounce = -0.35;
//grimoireProjectileInitialSpeed = 16;

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

blockingDurationPre = 0.1;
blockingDurationBlocking = 0.5;
blockingDurationPost = 0.3;
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