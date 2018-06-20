event_inherited();
actorType = actorTypes.corpse;
phased = true;
pushable = false;
flying = false;

with statCache
{
	damagePower = 4;
	staggerPower = 1;
}
	
//target
hasBeenTargeted = false;

//Damage Zone
zoneTouchID = noone;
zoneData = ds_map_create();
scr_enemyActionDataDefaults(zoneData,enemyActionType.damageZone);
zoneData[? enemyActionData.animation] = sprBloodHoundCorpseEffectAirborne;
zoneData[? enemyActionData.hitAngle] = 0;
zoneData[? enemyActionData.hitSoundID] = noone;
scr_create_damageCache(zoneData[? enemyActionData.damageData],1.8,3,1,0,0,0,0,0,0,0,0,0);

//Action Data holder
var tmp = 0;
actionDataHolder = ds_list_create();

ds_list_add(actionDataHolder,zoneData);
ds_list_mark_as_map(actionDataHolder,tmp); tmp++;