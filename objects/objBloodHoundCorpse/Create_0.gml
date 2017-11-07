//base behaviour data
actorType = actorTypes.corpse;
aggroPhase = enemyAggroState.passive;
phase = state.base;
subPhase = subState.idle;
vPhase = vState.midAir;
hitPhase = hitState.normal;

baseSpriteIndex = sprite_index;
effectSpriteIndex = noone;
maxFallSpeed = 5;
xSpd = 0;
ySpd = 0;
facing = irandom(1);
if facing == 0 facing = -1;
phased = true;
pushable = false;
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

	//no statCache, ai or actions, elxplosion is done by the tick
	
//target
hasBeenTargeted = false;
	
//damageZone
zoneTouchID = noone;
zoneTouchAnimation = sprBloodHoundCorpseEffectAirborne;
zoneTouchHitSoundID = noone;
zoneTouchFrameData = -1;
zoneTouchFollow = true;
zoneTouchDuration = -1
zoneTouchDamageType = 1;
zoneTouchDamage = 4;
zoneTouchStagger = 3;
zoneTouchKnockBack = 1.5;
zoneTouchStatusType = -1;
zoneTouchStatusValue = 0;
zoneTouchPierce = false;