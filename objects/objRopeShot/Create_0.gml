enum ropeshotPhase {shooting, returning, hookedPoint, hookedSwing, hookedEnemyPull, hookedPlayerPull};

caster = noone;

initialX = x;
initialY = y;
hookDist = 256;
phase = ropeshotPhase.shooting;
phaseTimer = 0;

mount = noone;

xPrev = 0;
yPrev = 0;