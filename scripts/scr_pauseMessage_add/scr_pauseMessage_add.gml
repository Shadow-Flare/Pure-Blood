///@arg state
///@arg arg1
///@arg arg2
var state = argument0;
var arg1 = argument1;
var arg2 = argument2;

if !instance_exists(PauseMessage)
{
	if (!layer_exists("Controllers")) layer_create(-1, "Controllers");
	with instance_create_layer(0,0,"Controllers",PauseMessage)
	{
		pauseMessagePhase = state;
		pauseMessageData1 = arg1;
		pauseMessageData2 = arg2;
	}
}
else with PauseMessage
{
	var map = ds_map_create();
	map[? pauseMessageData.state] = state;
	map[? pauseMessageData.arg1] = arg1;
	map[? pauseMessageData.arg2] = arg2;
	ds_stack_push(pauseMessageStack,map);
}