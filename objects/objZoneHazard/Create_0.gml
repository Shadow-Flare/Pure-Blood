	//damage zone
actorType = actorTypes.wild;
facing = 1;
	
zoneID = noone;														
zoneHitSoundID = noone;												//$$//
zoneFrameData = -1;
zoneFollow = true;
zoneDuration = -1
zoneDamageData = ds_map_create();		
scr_create_damageCache(zoneDamageData,0.3,0,6,0,0,0,0,0,0,0,0);
zonePierce = true;