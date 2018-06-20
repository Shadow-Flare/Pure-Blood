///@arg instance to puppet
///@arg puppetCommand.ENUM
///@arg canInterupt?
///@arg override?
///@arg arg1
///@arg arg2
///@arg arg3
///@arg arg4
///@arg arg5

//arg details at bottom

var instance = argument0;
var commandType = argument1;
var interruptible = argument2;
var override = argument3;
var arg1 = argument4;
var arg2 = argument5;
var arg3 = argument6;
var arg4 = argument7;
var arg5 = argument8;

if CutsceneManager.puppetStackMap[? instance] == undefined CutsceneManager.puppetStackMap[? instance] = ds_stack_create();
var stack = CutsceneManager.puppetStackMap[? instance];

if override repeat(ds_stack_size(stack))
{
	instance.puppetTimer = 0;
	var list = ds_stack_pop(stack);
	ds_list_destroy(list);
}

var newCommand = ds_list_create();
ds_stack_push(stack,newCommand);
newCommand[| puppetCommandData.type] = commandType;
newCommand[| puppetCommandData.interruptible] = interruptible;
newCommand[| puppetCommandData.arg1] = arg1;
newCommand[| puppetCommandData.arg2] = arg2;
newCommand[| puppetCommandData.arg3] = arg3;
newCommand[| puppetCommandData.arg4] = arg4;
newCommand[| puppetCommandData.arg5] = arg5;

//argument details:
	//waitTillIdle:
//arg1 = duration (seconds, optional, used noone to negate)
//arg2 = UNUSED
//arg3 = UNUSED
//arg4 = UNUSED
//arg5 = UNUSED
	//moveTo:
//arg1 = run?
//arg2 = desiredX
//arg3 = facing
//arg4 UNUSED
//arg5 UNUSED
	//interact:
//arg1 = sprite
//arg2 = animDuration
//arg3 = useDuration
//arg4 = script to run on use (optional)
//arg5 = interactable instance
	//emote (+cyclic):
//arg1 = sprite
//arg2 = duration (seconds)
//arg3 = UNUSED
//arg4 = UNUSED
//arg5 = UNUSED