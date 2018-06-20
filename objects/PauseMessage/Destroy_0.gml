while !ds_stack_empty(pauseMessageStack) ds_map_destroy(ds_stack_pop(pauseMessageStack));
ds_stack_destroy(pauseMessageStack);