//stats
xpGiven = 20;
moveSpeed = 5;
hpMax = 20;
hp = hpMax;
toughness = 1;
physicalPower = 7;
hookWeight = 0;		//0 = pulled to player, 1 = pull player//
flying = 0;

attack1Duration = 0.8;
attack1Cooldown = 0.5;
attack1Range = 40*8;
attack1Move = 32;

attack2WalkingDuration = 5;
attack2WalkingPauseDuration = 1;
attack2WalkingBreakRange = 64;
attack2ParryDuration = 0.2;
attack2Duration = 0.7;
attack2Cooldown = 0.5;
attack2Move = 54;

hitEffectType = "blood";
hitEffectColour = "dark red";
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
statusResistances[0] = 100;		//Bleed
//Status values
statusValues[0] = 0;

//technicals
staggerDuration = 1;		//seconds
deflectDuration = 1;
proneDuration = 2;			//seconds
proneRecoverDuration = 1;
landDuration = 0.5;
dodgeDuration = 0.5;
blockRange = 8*11			//artPixels * 8

blocking = 0;
dodging = 0;
hasBlocked = 0;
hasDodged = 0;
dropThroughPlatforms = 0;
phased = 0;
isInvulnerable = "Off";
defaultMoveSpeed = moveSpeed;
xSpd = 0;
ySpd = 0;
lastHit = noone;
phase = "idle";
subPhase = "";
phasePrev = "idle";
target = noone;
facing = 1;
nextAttack = 2;
deflected = 0;
canAttack = 1;
canAttackTimer = 0;

aggroRange = 1920/2;
attackDelay = 2;

deathDuration = 1.8;
deathFadeDuration = 5;
deathTimer = 0;
deathAnimationStop = 0;
attackTimer = 0;
attackCooldown = 0;