///@arg destination map
///@arg action type

//enum enemyActionData {animation, duration, moveX, moveY, moveBurstX, moveBurstY, moveStart, 
//						moveDuration, performSoundID, hitSoundID, frameData, follow, hitStart, 
//						hitDuration, hitEffects, hitAngle, damageData, pierce};

var destinationMap = argument0;
var actionType = argument1;

switch actionType
{
	case enemyActionType.animation:				#region Animation
		destinationMap[? enemyActionData.animation] = noone;
		destinationMap[? enemyActionData.duration] = 1;
		destinationMap[? enemyActionData.moveX] = 0;
		destinationMap[? enemyActionData.moveY] = 0;
		destinationMap[? enemyActionData.moveBurstX] = 0;
		destinationMap[? enemyActionData.moveBurstY] = 0;
		destinationMap[? enemyActionData.moveStart] = 0;
		destinationMap[? enemyActionData.moveDuration] = 0;
		destinationMap[? enemyActionData.performSoundID] = noone;
		break;									#endregion
	case enemyActionType.attack:				#region Attack
		destinationMap[? enemyActionData.animation] = noone;
		destinationMap[? enemyActionData.duration] = 1;
		destinationMap[? enemyActionData.moveX] = 0;
		destinationMap[? enemyActionData.moveY] = 0;
		destinationMap[? enemyActionData.moveBurstX] = 0;
		destinationMap[? enemyActionData.moveBurstY] = 0;
		destinationMap[? enemyActionData.moveStart] = 0;
		destinationMap[? enemyActionData.moveDuration] = 0;
		destinationMap[? enemyActionData.performSoundID] = noone;
		destinationMap[? enemyActionData.hitSoundID] = 0;
		destinationMap[? enemyActionData.frameData] = -1;
		destinationMap[? enemyActionData.follow] = true;
		destinationMap[? enemyActionData.hitStart] = 0;
		destinationMap[? enemyActionData.hitDuration] = 0;
		destinationMap[? enemyActionData.hitEffects] = noone;
		destinationMap[? enemyActionData.hitAngle] = noone;
		var damMap = ds_map_create(); scr_create_damageCache(damMap,0,0,0,0,0,0,0,0,0,0,0,0);
		ds_map_add_map(destinationMap,enemyActionData.damageData,damMap);
		destinationMap[? enemyActionData.pierce] = false;
		break;									#endregion
	case enemyActionType.damageZone:			#region Damage Zone
		destinationMap[? enemyActionData.animation] = noone;
		destinationMap[? enemyActionData.duration] = -1;
		destinationMap[? enemyActionData.performSoundID] = noone;
		destinationMap[? enemyActionData.hitSoundID] = 0;
		destinationMap[? enemyActionData.frameData] = -1;
		destinationMap[? enemyActionData.follow] = true;
		destinationMap[? enemyActionData.hitDuration] = -1;
		destinationMap[? enemyActionData.hitEffects] = noone;
		destinationMap[? enemyActionData.hitAngle] = noone;
		var damMap = ds_map_create(); scr_create_damageCache(damMap,0,0,0,0,0,0,0,0,0,0,0,0);
		ds_map_add_map(destinationMap,enemyActionData.damageData,damMap);
		destinationMap[? enemyActionData.pierce] = false;
		break;									#endregion
}