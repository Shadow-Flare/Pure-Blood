actorType = actorTypes.enemy;

//stats
xpGiven = 200;
moveSpeed = 6;
maxHp = 160;
hp = maxHp;
toughness = 4;
physicalPower = 8;
hookWeight = 1;		//0 = pulled to player, 1 = pull player//
flying = 0;

screamDuration = 1;

//Fling corpses
attack1Duration = 1.4;
attack1Cooldown = 1;
attack1Move = 0;

//puke ticks
attack2Duration = 0.8;
attack2Cooldown = 0.8;
attack2Move = 0;

//slam
attack3Duration = 1.5;
attack3Cooldown = 2.5;
attack3Range = 84*8;
attack3Move = 24;
attack3Count = 0;

//leap
attack4PreDuration = 1.2;
attack4EndDuration = 1.2;
attack4Angle = 25;
attack4TravelDistance = 1500;

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
staggerDuration = 1.2;		//seconds
deflectDuration = 1.2;
proneDuration = 0.4;			//seconds
proneRecoverDuration = 0.6;
landDuration = 0.8;
//blockRange = 8*11			//artPixels * 8

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
nextAttack = 0;
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