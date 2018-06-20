	//damage zone
actorType = actorTypes.wild;
facing = 1;

	//action2: DamageZone
zoneID = noone;
zoneData = ds_map_create();
scr_enemyActionDataDefaults(zoneData,enemyActionType.damageZone);
zoneData[? enemyActionData.animation] = sprServantGuardEffectAction2Sub1;;
zoneData[? enemyActionData.performSoundID] = noone;
zoneData[? enemyActionData.hitSoundID] = noone;
zoneData[? enemyActionData.hitAngle] = -1;
scr_create_damageCache(zoneData[? enemyActionData.damageData],0.3,0,6,0,0,0,0,0,0,0,0,0);