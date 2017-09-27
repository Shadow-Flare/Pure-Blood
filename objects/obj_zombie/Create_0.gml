actorType = actorTypes.enemy;

//stats
xpGiven = 5;
moveSpeed = 3;
maxHp = 20;
hp = maxHp;
toughness = 1;
physicalPower = 7;
attack1Duration = 1;
hookWeight = 0;		//0 = pulled to player, 1 = pull player//
flying = 0;

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
landDuration = 1.5;
blockRange = 8*11			//artPixels * 8

canAttack = 1;
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
nextAttack = 1;
deflected = 0;

aggroRange = 1920/2;
attack1Range = 100*1.5;
attackDelay = 2;

deathDuration = 1.8;
deathFadeDuration = 5;
deathTimer = 0;
deathAnimationStop = 0;
attackTimer = 0;
attackCooldown = 0;