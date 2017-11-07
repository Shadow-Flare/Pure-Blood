//base behaviour data
actorType = actorTypes.enemy;
phase = state.base;
vPhase = vState.midAir;
hitPhase = hitState.normal;
phaseTimer = 0;

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

if !layer_exists("lay_caches") layer_create(0,"lay_caches");
statCache = instance_create_layer(0,0,"lay_caches",ActorStats)
with statCache
{
	hpMax = 1;
	mpMax = 0;
	
	damagePower = 7;
	staggerPower = 3;
	
	physicalToughness = 1;
	magicalToughness = 1;
	
	moveSpeed = 1.5;
	defaultMoveSpeed = moveSpeed;
	
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

//ai
target = noone;

//bloat duration
bloatDuration = 3;

//die duration
dyingDuration = 0.7;
	
//explosion
explosionAnimation = sprBloodHoundTickEffectExploding;
explosionAttackSoundID = noone;
explosionFrameData = [0,3];
explosionFollow = false;
explosionDuration = 0.4;
explosionDamageType = 1;
explosionDamage = 6;
explosionStagger = 8;
explosionKnockback = 3;
explosionStatusType = -1;
explosionStatusValue = 0;
explosionPierce = true;