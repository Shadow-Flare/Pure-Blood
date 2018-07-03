///@arg instance to clear

var instance = argument0;

var stack = CutsceneManager.puppetStackMap[? instance];
if stack != undefined repeat(ds_stack_size(stack))
{
	instance.puppetTimer = 0;
	var list = ds_stack_pop(stack);
	ds_list_destroy(list);
}

ds_map_delete(CutsceneManager.puppetStackMap,instance);