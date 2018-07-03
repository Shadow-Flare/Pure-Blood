///@arg cutsceneCommand.ENUM
///@arg arg1
///@arg arg2
///@arg arg3
///@arg arg4
///@arg arg5
///@arg arg6
///@arg arg7
///@arg arg8(ARGUMENT-DETAILS-IN-SCRIPT)
///@arg debugString

//arg details at bottom

var command = argument0;
var arg1 = argument1;
var arg2 = argument2;
var arg3 = argument3;
var arg4 = argument4;
var arg5 = argument5;
var arg6 = argument6;
var arg7 = argument7;
var arg8 = argument8;
var debugString = argument9;

var newCache = ds_map_create();
ds_stack_push(CutsceneManager.mainCutsceneStack,newCache);

newCache[? cutsceneCommandData.type] = command;
newCache[? cutsceneCommandData.arg1] = arg1;
newCache[? cutsceneCommandData.arg2] = arg2;
newCache[? cutsceneCommandData.arg3] = arg3;
newCache[? cutsceneCommandData.arg4] = arg4;
newCache[? cutsceneCommandData.arg5] = arg5;
newCache[? cutsceneCommandData.arg6] = arg6;
newCache[? cutsceneCommandData.arg7] = arg7;
newCache[? cutsceneCommandData.arg8] = arg8;
newCache[? cutsceneCommandData.debugString] = debugString;

//argument details:
	//fadeIn/fadeOut/holdFaded:
//arg1 = colour
//arg2 = duration (seconds)
//arg3 UNUSED
//arg4 UNUSED
//arg5 UNUSED
//arg6 UNUSED
//arg7 UNUSED
//arg8 UNUSED
	//waitTime:
//arg1 = duration (seconds)
//arg2 UNUSED
//arg3 UNUSED
//arg4 UNUSED
//arg5 UNUSED
//arg6 UNUSED
//arg7 UNUSED
//arg8 UNUSED
	//waitPuppet:
//arg1 = instance
//arg2 = un-bugDuration (noone for unused)
//arg3 UNUSED
//arg4 UNUSED
//arg5 UNUSED
//arg6 UNUSED
//arg7 UNUSED
//arg8 UNUSED
	//commandPuppet:
//arg1 = instance
//arg2 = puppetCommand.ENUM
//arg3 = override?
//arg4 = arg1
//arg5 = arg2
//arg6 = arg3
//arg7 = arg4
//arg8 = arg5
	//dialogInitiate
//arg1 = index
//arg2 = indexSub
//arg3 = dialogState.ENUM
//arg4 = unused
//arg5 = unused
//arg6 = unused
//arg7 = unused
//arg8 = unused
	//dialogWait:
//arg1 = unused
//arg2 = unused
//arg3 = unused
//arg4 = unused
//arg5 = unused
//arg6 = unused
//arg7 = unused
//arg8 = unused
	//commandWorldEvent:
//arg1 = worldEventCommand.ENUM
//arg2 = arg1
//arg3 = arg2
//arg4 = arg3
//arg5 = arg4
//arg6 = arg5
//arg7 = unused
//arg8 = unused