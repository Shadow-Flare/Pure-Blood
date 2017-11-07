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
	hpMax = 60;											
	mpMax = 0;											
	
	damagePower = 6;									
	staggerPower = 5;									
	
	physicalToughness = 1.2;							
	magicalToughness = 1.2;								
	
	moveSpeed = 0.45;									
	defaultMoveSpeed = moveSpeed;
	
	killExp = 12
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
landingDuration = 0.5;
staggeredDuration = 0.5;
proneDuration = 0.6;
deflectDuration = 0.7;

deathDuration = 1;										
deathFadeDuration = 3;									

//ai data
aggroRange = 16*7;										
actionHardCooldown = 2;		
actionAiDelay = 1;
attack1Range = 16*2.25;

//action data
	//action1: general attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action1Animation = sprServantGuardBodyAction1											
action1FrameData = -1;
action1Follow = true;
action1Duration = 1;																	//$$//
action1AttackSoundID = noone;															//$$//
action1HitSoundID = noone;																//$$//
action1HitStart = action1Duration*(/**/5/**//sprite_get_number(action1Animation))		
action1HitDuration = action1Duration*(/**/3/**//sprite_get_number(action1Animation))	
action1MoveBurst = 3;																	//$$//
action1Move = 0;																		//$$//
action1MoveStart = action1Duration*(/**/4/**//sprite_get_number(action1Animation))		
action1MoveDuration = action1Duration*(/**/3/**//sprite_get_number(action1Animation))	
action1DamageType = 2;																	//$$//
action1Damage = 1;																	//$$//
action1Stagger = 1;																		//$$//
action1Knockback = 3.5;																	//$$//
action1StatusType = -1;																	//$$//
action1StatusValue = 0;																	//$$//
action1Pierce = false;																	//$$//

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
action2ZoneAnimation = sprServantGuardEffectAction2Sub1;
action2ZoneID = noone;
action2ZoneFrameData = -1;
action2ZoneDuration = -1;
action2ZoneFollow = true;
action2ZoneAttackSoundID = noone;
action2ZoneHitSoundID = noone;
action2ZoneDuration = -1;
action2ZoneDamageType = 1;
action2ZoneDamage = 0.3;
action2ZoneStagger = 0;
action2ZoneKnockback = 1.5;
action2ZoneStatusType = -1;
action2ZoneStatusValue = 0;
action2ZonePierce = false;	

		//sub2: blocking reaction
action2DurationSub2 = 0.3;
action2AnimationSub2 = sprServantGuardBodyAction2Sub2;

		//sub3: returning after no block
action2DurationSub3 = 0.3;
action2AnimationSub3 = sprServantGuardBodyAction2Sub3;

	//action3: parry counter-attack				the number in between "/**/#/**/" below indicates the sprite number, starting at 0 for timings
action3Animation = sprServantGuardBodyAction3											
action3FrameData = -1;
action3Follow = true;
action3Duration = 0.7;	//$$//
action3AttackSoundID = noone;															//$$//
action3HitSoundID = noone;																//$$//
action3HitStart = action3Duration*(/**/5/**//sprite_get_number(action3Animation))		
action3HitDuration = action3Duration*(/**/2/**//sprite_get_number(action3Animation))	
action3MoveBurst = 3;																	//$$//
action3Move = 0;																		//$$//
action3MoveStart = action3Duration*(/**/4/**//sprite_get_number(action3Animation))		
action3MoveDuration = action3Duration*(/**/3/**//sprite_get_number(action3Animation))	
action3DamageType = 2;																	//$$//
action3Damage = 2;																	
action3Stagger = 1.5;																		
action3Knockback = 4;																	//$$//
action3StatusType = -1;																	//$$//
action3StatusValue = 0;																	//$$//
action3Pierce = false;																	//$$//