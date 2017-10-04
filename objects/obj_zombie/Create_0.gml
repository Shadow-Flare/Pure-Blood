actorType = actorTypes.enemy;

//stats
xpGiven = 5;
moveSpeed = 3;
hpMax = 20;
hp = hpMax;
toughness = 1;
physicalPower = 7;
attack1Duration = 1;
hookWeight = 0;		//0 = pulled to player, 1 = pull player//
flying = 0;

hitEffectType = "blood";
hitEffectColour = "dark red";
//Damage type resistances
damageResistances[0] = 1;			//Slash
damageResistances[1] = 1;			//Blunt
damageResistances[2] = 1;			//Pierce
damageResistances[3] = 1;			//Fire
damageResistances[4] = 1;			//Ice
damageResistances[5] = 1;			//Lightning
damageResistances[6] = 1;			//Arcane
damageResistances[7] = 1;			//Light
damageResistances[8] = 1;			//Dark
damageResistances[9] = 1;			//X Damage

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