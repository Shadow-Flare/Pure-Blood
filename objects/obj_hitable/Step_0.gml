var damageTakenPrev = damageTaken;
var staggerTakenPrev = staggerTaken;
var knockbackTakenPrev = knockbackTaken;

var taken = scr_hitCheck_basic();

damageTaken += taken[0];
staggerTaken += taken[1];
knockbackTaken += taken[2];