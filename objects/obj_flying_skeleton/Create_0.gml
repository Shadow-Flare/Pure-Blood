// "#" Defines a default space

//stats
xpGiven = 7;
moveSpeed = 7;			//#
hpMax = 20;				//#
hp = hpMax;				//#
toughness = 1;			//#
physicalPower = 7;		//#
hookWeight = 0;		//0 = pulled to player, 1 = pull player//

flying = 1;
hoverHeight = 72*8;

attack1BuildUp = 0.6;
attack1Duration = 0.75;
attack1Acceleration = -2;

attack2Duration = 0.5;
attack2Cooldown = 0.75;
attack2Range = 64;

hitEffectType = "blood";		//#
hitEffectColour = "dark red";	//#
//Damage type resistances
resistances[0] = 100;			//#Slash
resistances[1] = 100;			//#Blunt
resistances[2] = 100;			//#Pierce
resistances[3] = 100;			//#Fire
resistances[4] = 100;			//#Ice
resistances[5] = 100;			//#Lightning
resistances[6] = 100;			//#Arcane
resistances[7] = 100;			//#Light
resistances[8] = 100;			//#Dark

//Status resistances
statusResistances[0] = 100;		//#Bleed
//Status values
statusValues[0] = 0;			//#

//technicals
staggerDuration = 1;		//seconds
deflectDuration = 1;		//seconds
proneDuration = 2;			//seconds
proneRecoverDuration = 1;   //seconds
blockRange = 8*11			//artPixels * 8

blocking = 0;
dodging = 0;
hasBlocked = 0;
hasDodged = 0;
dropThroughPlatforms = 0;
canAttack = 1;
canAttackTimer = 0;
phased = 0;	
nextAttack = 1;			
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
heightMod = 0;
lifeTimer = 0;
deflected = 0;

aggroRange = 1920*0.8;
attackDelay = 2;
maxVerticalSpeed = 20;

deathDuration = 1.8;		//#
deathFadeDuration = 5;		//#
deathTimer = 0;
deathAnimationStop = 0;
attackTimer = 0;