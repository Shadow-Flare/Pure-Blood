///@arg worldEventCommand.ENUM
///@arg arg1
///@arg arg2
///@arg arg3
///@arg arg4
///@arg arg5

//arg details at bottom

var command = argument0;
var arg1 = argument1;
var arg2 = argument2;
var arg3 = argument3;
var arg4 = argument4;
var arg5 = argument5;

var newCache = ds_map_create();
ds_stack_push(CutsceneManager.mainWorldEventStack,newCache);

newCache[? worldEventCommandData.type] = command;
newCache[? worldEventCommandData.arg1] = arg1;
newCache[? worldEventCommandData.arg2] = arg2;
newCache[? worldEventCommandData.arg3] = arg3;
newCache[? worldEventCommandData.arg4] = arg4;
newCache[? worldEventCommandData.arg5] = arg5;

//argument details:
	//enemyKilled:
//arg1 = entity (does not have to be an enemy)
//arg2 UNUSED
//arg3 UNUSED
//arg4 UNUSED
//arg5 UNUSED
	//runScript/runScriptRepeat:
//arg1 = script
//arg2 UNUSED
//arg3 UNUSED
//arg4 UNUSED
//arg5 UNUSED