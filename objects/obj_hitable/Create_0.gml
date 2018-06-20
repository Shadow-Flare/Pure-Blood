isInvulnerable = false
actorType = actorTypes.wild;

lastHitTypes = ds_list_create(); repeat(10) ds_list_add(lastHitTypes,false);
takenHitData = ds_map_create(); scr_create_damageCache(takenHitData,0,0,0,0,0,0,0,0,0,0,0,0);
damageTaken = 0;
staggerTaken = 0;
knockbackTaken = 0;

damageTakenPrev = damageTaken;
staggerTakenPrev = staggerTaken;
knockbackTakenPrev = knockbackTaken;