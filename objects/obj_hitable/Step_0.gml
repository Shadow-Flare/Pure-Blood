var damageTakenPrev = damageTaken;
var staggerTakenPrev = staggerTaken;
var knockbackTakenPrev = knockbackTaken;

var hitData = scr_hitCheck_basic();

if hitData != noone
{
	takenHitData[? damageData.stagger] += hitData[? damageData.stagger];
	takenHitData[? damageData.knockback] += hitData[? damageData.knockback];
	
	takenHitData[? damageData.slash] += hitData[? damageData.slash];
	takenHitData[? damageData.pierce] += hitData[? damageData.pierce];
	takenHitData[? damageData.blunt] += hitData[? damageData.blunt];
	takenHitData[? damageData.fire] += hitData[? damageData.fire];
	takenHitData[? damageData.ice] += hitData[? damageData.ice];
	takenHitData[? damageData.lightning] += hitData[? damageData.lightning];
	takenHitData[? damageData.arcane] += hitData[? damageData.arcane];
	takenHitData[? damageData.light] += hitData[? damageData.light];
	takenHitData[? damageData.dark] += hitData[? damageData.dark];
	takenHitData[? damageData.pure] += hitData[? damageData.pure];

	damageTaken = takenHitData[? damageData.slash] + takenHitData[? damageData.pierce] + takenHitData[? damageData.blunt] + takenHitData[? damageData.fire] + takenHitData[? damageData.ice] + takenHitData[? damageData.lightning] + takenHitData[? damageData.arcane] + takenHitData[? damageData.light] + takenHitData[? damageData.dark] + takenHitData[? damageData.pure];
	staggerTaken = takenHitData[? damageData.stagger];
	knockbackTaken = clamp(takenHitData[? damageData.knockback],0,5);
}