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
flying = false;
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
statCache = instance_create_layer(0,0,"lay_caches",actorStats)
with statCache
{
	hpMax = 60;											
	mpMax = 0;											
	
	damagePower = 6;									
	staggerPower = 5;									
	
	physicalToughness = 1.2;							
	magicalToughness = 1.2;								
	
	moveSpeed = 0.3;									
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

//drives
driveJump = false;
driveAction = 0;
driveMove = 0;								

//base checks
actionHardCooldownTimer = -1;
hasDeflected = false;
canChangeVState = true;
isDead = false;
hasBeenHit = false;
lastHitType = -1;

//variables
aggroRange = 16*7;										
actionHardCooldown = 2;									
landingDuration = 0.5;									

staggeredDuration = 0.5;								
proneDuration = 0.6;									
deathDuration = 1;										
deathFadeDuration = 3;									

//ai data
attack1Range = 16*2.25;	

//action data
actionAiDelay = 1;
	//action1: general attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
attack1Animation = sprServantGuardBodyAction1											
attack1Duration = 1.2;																	//$$//
attack1HitStart = attack1Duration*(/**/5/**//sprite_get_number(attack1Animation))		
attack1HitDuration = attack1Duration*(/**/2/**//sprite_get_number(attack1Animation))	
attack1MoveBurst = 3;																	//$$//
attack1Move = 0;																		//$$//
attack1MoveStart = attack1Duration*(/**/4/**//sprite_get_number(attack1Animation))		
attack1MoveDuration = attack1Duration*(/**/3/**//sprite_get_number(attack1Animation))	
attack1XOffset = 16;																	//$$//
attack1YOffset = -6;																	//$$//
attack1Width = 20;																		//$$//
attack1Height = 12;																		//$$//
attack1DamageType = 2;																	//$$//
attack1Damage = 1;																	//$$//
attack1Stagger = 1;																		//$$//
attack1Knockback = 3.5;																	//$$//
attack1StatusType = -1;																	//$$//
attack1StatusValue = 0;																	//$$//
attack1Pierce = false;																	//$$//

	//action2: parry begin
action2AiTimer = 0;
action2AiMoveDuration = 1;
		//sub1: defensive stance
action2AnimationSub1Forward = sprServantGuardBodyAction2Sub1Forward;
action2AnimationSub1Idle = sprServantGuardBodyAction2Sub1Idle;
action2AnimationSub1Back = sprServantGuardBodyAction2Sub1Back;
action2DurationSub1 = 7;
action2HitBoxShiftSub1 = 16;
			//damage zone
action2ZoneID = noone;
action2ZoneDamageType = 1;
action2ZoneDamage = 0.3;
action2ZoneStagger = 0;
action2ZoneKnockback = 1.5;
action2ZoneXOffset = 7.5;
action2ZoneYOffset = -7;
action2ZoneWidth = 28;
action2ZoneHeight = 4;
action2ZoneStatusType = -1;
action2ZoneStatusValue = 0;
action2ZonePierce = false;	

		//sub2: blocking reaction
action2DurationSub2 = 0.6;
action2AnimationSub2 = sprServantGuardBodyAction2Sub2;

		//sub3: returning after no block
action2DurationSub3 = 0.3;
action2AnimationSub3 = sprServantGuardBodyAction2Sub3;

	//action3: parry counter-attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
attack3Animation = sprServantGuardBodyAction3											
attack3Duration = 0.8;																	//$$//
attack3HitStart = attack3Duration*(/**/5/**//sprite_get_number(attack3Animation))		
attack3HitDuration = attack3Duration*(/**/3/**//sprite_get_number(attack3Animation))	
attack3MoveBurst = 3;																	//$$//
attack3Move = 0;																		//$$//
attack3MoveStart = attack3Duration*(/**/4/**//sprite_get_number(attack3Animation))		
attack3MoveDuration = attack3Duration*(/**/3/**//sprite_get_number(attack3Animation))	
attack3XOffset = 2;																	//$$//
attack3YOffset = 1;																	//$$//
attack3Width = 42;																		//$$//
attack3Height = 16;																		//$$//
attack3DamageType = 2;																	//$$//
attack3Damage = 2;																	
attack3Stagger = 1.5;																		
attack3Knockback = 4;																	//$$//
attack3StatusType = -1;																	//$$//
attack3StatusValue = 0;																	//$$//
attack3Pierce = false;																	//$$//